CREATE PROCEDURE [Staging].[Staging-to-DimLeas]
	@factTypeCode AS VARCHAR(50) = 'directory',
	@dataCollectionName AS VARCHAR(50) = NULL,
	@runAsTest AS BIT 
AS 
BEGIN

	--Get the correct values for the state 
	declare @StateCode varchar(2), @StateName varchar(50), @StateANSICode varchar(5)
	select @StateCode = (select StateAbbreviationCode from Staging.StateDetail)
	select @StateName = (select [Description] from dbo.RefState where Code = @StateCode)
	select @StateANSICode = (select Code from dbo.RefStateANSICode where [Description] = @StateName)

	--Get the count of LEAs that are marked as Charter
	declare @charterLeaCount as int
	select @charterLeaCount = count(LEAIdentifierSea) from staging.K12Organization where LEA_CharterSchoolIndicator = 1

	--Insert the default 'missing' row if it doesn't exist
	IF NOT EXISTS (SELECT 1 FROM RDS.DimLeas WHERE DimLeaID = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimLeas ON
		INSERT INTO RDS.DimLeas (DimLeaId) VALUES (-1)
		SET IDENTITY_INSERT RDS.DimLeas off
	END

	--create and populate the temp tables for OrganizationType and OrganizationLocationType used in the joins
	CREATE TABLE #organizationTypes (
		SchoolYear								SMALLINT
		, LeaOrganizationType					VARCHAR(20)
	)

	CREATE TABLE #organizationLocationTypes (
		SchoolYear								SMALLINT
		, MailingAddressType					VARCHAR(20)
		, PhysicalAddressType					VARCHAR(20)
	)

	INSERT INTO #organizationTypes
	SELECT 
		SchoolYear
		, InputCode
	FROM Staging.SourceSystemReferenceData 
	WHERE TableName = 'RefOrganizationType' 
		AND TableFilter = '001156'
		AND OutputCode = 'LEA'

	INSERT INTO #organizationLocationTypes
	SELECT 
		mail.SchoolYear
		, mail.InputCode
		, phys.InputCode
	FROM (SELECT SchoolYear, InputCode FROM Staging.SourceSystemReferenceData WHERE TableName = 'RefOrganizationLocationType' AND OutputCode = 'Mailing') mail
	JOIN (SELECT SchoolYear, InputCode FROM Staging.SourceSystemReferenceData WHERE TableName = 'RefOrganizationLocationType' AND OutputCode = 'Physical') phys
		ON mail.SchoolYear = phys.SchoolYear

	--load all the necessary data into the CTE for the MERGE
	;WITH CTE AS 
	( 
		SELECT DISTINCT	
			ssd.StateAbbreviationCode
			, ssd.SeaOrganizationName
			, @StateName 'StateAbbreviationDescription'
			, ssd.SeaOrganizationIdentifierSea
			, sko.LEAOrganizationName
			, sko.LEAIdentifierNCES
			, sko.LEAIdentifierSea
			, sko.PriorLEAIdentifierSea
			, sko.LEA_SupervisoryUnionIdentificationNumber 	AS SupervisoryUnionIdentificationNumber
			, sssrd4.OutputCode 							AS LeaTypeCode
			, CASE sssrd4.OutputCode 
				WHEN 'RegularNotInSupervisoryUnion' THEN 'Regular public school district that is NOT a component of a supervisory union'
				WHEN 'RegularInSupervisoryUnion' THEN 'Regular public school district that is a component of a supervisory union'
				WHEN 'SupervisoryUnion' THEN ' Supervisory Union'
				WHEN 'SpecializedPublicSchoolDistrict' THEN 'Specialized Public School District'
				WHEN 'ServiceAgency' THEN 'Service Agency'
				WHEN 'StateOperatedAgency' THEN 'State Operated Agency'
				WHEN 'FederalOperatedAgency' THEN 'Federal Operated Agency'
				WHEN 'Other' THEN 'Other Local Education Agencies'
				WHEN 'IndependentCharterDistrict' THEN 'Independent Charter District'
				ELSE null
			END 											AS LeaTypeDescription
			, CASE sssrd4.OutputCode 
				WHEN 'RegularNotInSupervisoryUnion' THEN 1
				WHEN 'RegularInSupervisoryUnion' THEN 2
				WHEN 'SupervisoryUnion' THEN 3
				WHEN 'SpecializedPublicSchoolDistrict' THEN 9
				WHEN 'ServiceAgency' THEN 4
				WHEN 'StateOperatedAgency' THEN 5
				WHEN 'FederalOperatedAgency' THEN 6
				WHEN 'Other' THEN 8
				WHEN 'IndependentCharterDistrict' THEN 7
				ELSE -1
			END 											AS LeaTypeEdfactsCode
			, smam.AddressStreetNumberAndName 				AS MailingAddressStreetNumberAndName
			, smam.AddressApartmentRoomOrSuiteNumber 		AS MailingAddressApartmentRoomOrSuiteNumber
			, smam.AddressCity 								AS MailingAddressCity
			, smam.StateAbbreviation 						AS MailingAddressStateAbbreviation
			, smam.AddressPostalCode 						AS MailingAddressPostalCode
			, smam.AddressCountyAnsiCodeCode				AS MailingAddressCountyAnsiCodeCode
			, CASE 
				WHEN smap.StateAbbreviation <> ssd.StateAbbreviationCode 
					OR smam.StateAbbreviation <> ssd.StateAbbreviationCode THEN '1' 
				ELSE 0 
			END 											AS OutOfStateIndicator
			, smap.AddressStreetNumberAndName 				AS PhysicalAddressStreetNumberAndName
			, smap.AddressApartmentRoomOrSuiteNumber		AS PhysicalAddressApartmentRoomOrSuiteNumber
			, smap.AddressCity 								AS PhysicalAddressCity
			, smap.StateAbbreviation 						AS PhysicalAddressStateAbbreviation
			, smap.AddressPostalCode 						AS PhysicalAddressPostalCode
			, smap.AddressCountyAnsiCodeCode				AS PhysicalAddressCountyAnsiCodeCode
			, sop.TelephoneNumber
			, sko.LEA_WebSiteAddress 						AS WebSiteAddress
			, smap.Longitude
			, smap.Latitude
			, sssrd1.OutputCode 							AS LeaOperationalStatus
			, CASE sssrd1.OutputCode
				WHEN 'Open' THEN 1 
				WHEN 'Closed' THEN 2 
				WHEN 'New' THEN 3 
				WHEN 'Added' THEN 4 
				WHEN 'ChangedBoundary' THEN 5 
				WHEN 'Inactive' THEN 6 
				WHEN 'FutureAgency' THEN 7 
				WHEN 'Reopened' THEN 8 
				ELSE -1
			END 											AS LeaOperationalStatusEdfactsCode
			, sko.LEA_OperationalStatusEffectiveDate 		AS OperationalStatusEffectiveDate
			, sko.LEA_IsReportedFederally 					AS ReportedFederally
			, CASE											
				WHEN sko.LEA_CharterSchoolIndicator = 1 
					AND ISNULL(sssrd4.OutputCode,'MISSING') in ('RegularNotInSupervisoryUnion', 'IndependentCharterDistrict')
					THEN ISNULL(sssrd3.OutputCode, 'MISSING') 
				ELSE IIF(@charterLeaCount > 0,'NOTCHR','NA') 
			END 											AS CharterLeaStatus
			, ISNULL(sssrd2.OutputCode, 'MISSING') 			AS ReconstitutedStatus
			, sko.LEA_McKinneyVentoSubgrantRecipient 
			, sko.LEA_RecordStartDateTime 					AS RecordStartDateTime
			, sko.LEA_RecordEndDateTime 					AS RecordEndDateTime
		FROM Staging.K12Organization sko
		INNER JOIN Staging.StateDetail ssd
			ON sko.SchoolYear = ssd.SchoolYear
		LEFT JOIN Staging.OrganizationAddress smam
			ON sko.LEAIdentifierSea = smam.OrganizationIdentifier
			AND smam.OrganizationType in (select LeaOrganizationType from #organizationTypes ot where ot.SchoolYear = sko.SchoolYear)
			AND smam.AddressTypeForOrganization in (select MailingAddressType from #organizationLocationTypes lt where lt.SchoolYear = sko.SchoolYear)
		LEFT JOIN Staging.OrganizationAddress smap
			ON sko.LEAIdentifierSea = smap.OrganizationIdentifier
			AND smap.OrganizationType in (select LeaOrganizationType from #organizationTypes ot where ot.SchoolYear = sko.SchoolYear)
			AND smap.AddressTypeForOrganization in (select PhysicalAddressType from #organizationLocationTypes lt where lt.SchoolYear = sko.SchoolYear)
		LEFT JOIN Staging.OrganizationPhone sop
			ON sko.LEAIdentifierSea = sop.OrganizationIdentifier
			AND sop.OrganizationType in (select LeaOrganizationType from #organizationTypes ot where ot.SchoolYear = sko.SchoolYear)
		LEFT JOIN staging.SourceSystemReferenceData sssrd1
			ON sko.Lea_OperationalStatus = sssrd1.InputCode
			AND sssrd1.TableName = 'RefOperationalStatus'
			AND sssrd1.TableFilter = '000174'
			AND sko.SchoolYear = sssrd1.SchoolYear
		LEFT JOIN staging.SourceSystemReferenceData sssrd2
			ON sko.School_ReconstitutedStatus = sssrd2.InputCode
			AND sssrd2.TableName = 'RefReconstitutedStatus'
			AND sko.SchoolYear = sssrd2.SchoolYear
		LEFT JOIN staging.SourceSystemReferenceData sssrd3
			ON sko.LEA_CharterLeaStatus = sssrd3.InputCode
			AND sssrd3.TableName = 'RefCharterLeaStatus'
			AND sko.SchoolYear = sssrd3.SchoolYear
		LEFT JOIN staging.SourceSystemReferenceData sssrd4
			ON sko.LEA_Type = sssrd4.InputCode
			AND sssrd4.TableName = 'RefLeaType'
			AND sko.SchoolYear = sssrd4.SchoolYear
		WHERE @dataCollectionName IS NULL
			OR (
				sko.DataCollectionName = @dataCollectionName
				AND ssd.DataCollectionName = @dataCollectionName
				AND smam.DataCollectionName = @dataCollectionName
				AND smap.DataCollectionName = @dataCollectionName
				AND sop.DataCollectionName = @dataCollectionName
			)

	)
	MERGE rds.DimLeas AS trgt
	USING CTE AS src
		ON trgt.LeaIdentifierSea = src.LeaIdentifierSea
		AND ISNULL(trgt.RecordStartDateTime, '') = ISNULL(src.RecordStartDateTime, '')
	WHEN MATCHED THEN 
		UPDATE SET 
			trgt.LeaOrganizationName 							= src.LeaOrganizationName
			, trgt.LeaIdentifierNces 							= src.LeaIdentifierNces
			, trgt.PriorLEAIdentifierSea 						= src.PriorLEAIdentifierSea
			, trgt.LeaSupervisoryUnionIdentificationNumber 		= src.SupervisoryUnionIdentificationNumber
			, trgt.LeaOperationalStatus 						= src.LeaOperationalStatus
			, trgt.LeaOperationalStatusEdFactsCode 				= src.LeaOperationalStatusEdfactsCode
			, trgt.OperationalStatusEffectiveDate 				= src.OperationalStatusEffectiveDate
			, trgt.LeaTypeCode 									= src.LeaTypeCode
			, trgt.LeaTypeDescription 							= src.LeaTypeDescription
			, trgt.LeaTypeEdFactsCode 							= src.LeaTypeEdFactsCode
			, trgt.CharterLeaStatus 							= src.CharterLeaStatus
			, trgt.ReconstitutedStatus 							= src.ReconstitutedStatus
			, trgt.McKinneyVentoSubgrantRecipient 				= src.LEA_McKinneyVentoSubgrantRecipient
			, trgt.ReportedFederally 							= src.ReportedFederally
			, trgt.MailingAddressStreetNumberAndName			= src.MailingAddressStreetNumberAndName
			, trgt.MailingAddressApartmentRoomOrSuiteNumber		= src.MailingAddressApartmentRoomOrSuiteNumber
			, trgt.MailingAddressCity 							= src.MailingAddressCity
			, trgt.MailingAddressCountyAnsiCodeCode				= src.MailingAddressCountyAnsiCodeCode
			, trgt.MailingAddressStateAbbreviation				= src.MailingAddressStateAbbreviation
			, trgt.MailingAddressPostalCode 					= src.MailingAddressPostalCode
			, trgt.PhysicalAddressStreetNumberAndName			= src.PhysicalAddressStreetNumberAndName
			, trgt.PhysicalAddressApartmentRoomOrSuiteNumber	= src.PhysicalAddressApartmentRoomOrSuiteNumber
			, trgt.PhysicalAddressCity 							= src.PhysicalAddressCity
			, trgt.PhysicalAddressCountyAnsiCodeCode	 		= src.PhysicalAddressCountyAnsiCodeCode
			, trgt.PhysicalAddressStateAbbreviation				= src.PhysicalAddressStateAbbreviation
			, trgt.PhysicalAddressPostalCode 					= src.PhysicalAddressPostalCode
			, trgt.TelephoneNumber								= src.TelephoneNumber
			, trgt.WebsiteAddress								= src.WebSiteAddress
			, trgt.Longitude 									= src.Longitude
			, trgt.Latitude 									= src.Latitude
			, trgt.OutOfStateIndicator 							= src.OutOfStateIndicator
			, trgt.RecordEndDateTime 							= src.RecordEndDateTime 
	WHEN NOT MATCHED BY TARGET THEN     --- Records Exists IN Source but NOT IN Target
	INSERT (
		LeaOrganizationName
		, LeaIdentifierNces
		, LeaIdentifierSea
		, PriorLEAIdentifierSea
		, SeaOrganizationName
		, SeaOrganizationIdentifierSea
		, StateANSICode
		, StateAbbreviationCode
		, StateAbbreviationDescription
		, LeaSupervisoryUnionIdentificationNumber
		, LeaOperationalStatus
		, LeaOperationalStatusEdFactsCode
		, OperationalStatusEffectiveDate
		, ReportedFederally
		, LeaTypeCode
		, LeaTypeDescription
		, LeaTypeEdFactsCode
		, MailingAddressStreetNumberAndName
		, MailingAddressApartmentRoomOrSuiteNumber
		, MailingAddressCity
		, MailingAddressCountyAnsiCodeCode
		, MailingAddressStateAbbreviation
		, MailingAddressPostalCode
		, OutOfStateIndicator
		, PhysicalAddressStreetNumberAndName
		, PhysicalAddressApartmentRoomOrSuiteNumber
		, PhysicalAddressCity
		, PhysicalAddressCountyAnsiCodeCode
		, PhysicalAddressStateAbbreviation
		, PhysicalAddressPostalCode
		, TelephoneNumber
		, WebsiteAddress
		, Longitude
		, Latitude
		, CharterLeaStatus
		, ReconstitutedStatus
		, McKinneyVentoSubgrantRecipient
		, RecordStartDateTime
		, RecordEndDateTime
	) 	
	VALUES (
		src.LEAOrganizationName
		, src.LEAIdentifierNCES
		, src.LEAIdentifierSea
		, src.PriorLEAIdentifierSea
		, src.SeaOrganizationName
		, src.SeaOrganizationIdentifierSea
		, @StateANSICode
		, src.StateAbbreviationCode
		, @StateName
		, src.SupervisoryUnionIdentificationNumber
		, src.LeaOperationalStatus
		, src.LeaOperationalStatusEdFactsCode
		, src.OperationalStatusEffectiveDate
		, src.ReportedFederally
		, src.LeaTypeCode
		, src.LeaTypeDescription
		, src.LeaTypeEdfactsCode
		, src.MailingAddressStreetNumberAndName
		, src.MailingAddressApartmentRoomOrSuiteNumber
		, src.MailingAddressCity
		, src.MailingAddressCountyAnsiCodeCode
		, src.MailingAddressStateAbbreviation
		, src.MailingAddressPostalCode
		, src.OutOfStateIndicator
		, src.PhysicalAddressStreetNumberAndName
		, src.PhysicalAddressApartmentRoomOrSuiteNumber
		, src.PhysicalAddressCity
		, src.PhysicalAddressCountyAnsiCodeCode
		, src.PhysicalAddressStateAbbreviation
		, src.PhysicalAddressPostalCode
		, src.TelephoneNumber
		, src.WebsiteAddress
		, src.Longitude
		, src.Latitude
		, src.CharterLeaStatus
		, src.ReconstitutedStatus
		, src.LEA_McKinneyVentoSubgrantRecipient
		, src.RecordStartDateTime
		, src.RecordEndDateTime
	);

	
	;WITH upd AS(
		SELECT 
			startd.LeaIdentifierSea
			, startd.RecordStartDateTime 
			, min(endd.RecordStartDateTime) - 1 AS RecordEndDateTime
		FROM rds.DimLeas startd
		JOIN rds.DimLeas endd
			ON startd.LeaIdentifierSea = endd.LeaIdentifierSea
			AND startd.RecordStartDateTime < endd.RecordStartDateTime
		GROUP BY  startd.LeaIdentifierSea, startd.RecordStartDateTime
	) 
	UPDATE lea SET RecordEndDateTime = upd.RecordEndDateTime 
	FROM rds.DimLeas lea
	JOIN upd	
		ON lea.LeaIdentifierSea = upd.LeaIdentifierSea
		AND lea.RecordStartDateTime = upd.RecordStartDateTime
	WHERE upd.RecordEndDateTime <> '1900-01-01 00:00:00.000'

/* NOTE: Population of the BridgeLeaGradeLevels is done in Staging-to-DimK12Schools */

	--Cleanup
	DROP TABLE #organizationTypes
	DROP TABLE #organizationLocationTypes

END

GO

