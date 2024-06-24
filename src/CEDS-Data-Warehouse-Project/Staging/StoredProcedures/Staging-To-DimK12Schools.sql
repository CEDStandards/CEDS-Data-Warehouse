CREATE PROCEDURE [Staging].[Staging-to-DimK12Schools]
	@dataCollectionName AS VARCHAR(50) = NULL,
	@runAsTest AS BIT 
AS 
BEGIN

	DECLARE @StateCode VARCHAR(2), @StateName VARCHAR(50), @StateANSICode VARCHAR(5)
	SELECT @StateCode = (select StateAbbreviationCode from Staging.StateDetail)
	SELECT @StateName = (select [Description] from dbo.RefState where Code = @StateCode)
	SELECT @StateANSICode = (select Code from dbo.RefStateANSICode where [Description] = @StateName)


	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12Schools WHERE DimK12SchoolId = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimK12Schools ON
		INSERT INTO RDS.DimK12Schools (DimK12SchoolId) VALUES (-1)
		SET IDENTITY_INSERT RDS.DimK12Schools off
	END

	CREATE TABLE #organizationTypes (
		SchoolYear								SMALLINT
		, K12SchoolOrganizationType				VARCHAR(20)
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
		AND OutputCode = 'K12School'

	INSERT INTO #organizationLocationTypes
	SELECT 
		mail.SchoolYear
		, mail.InputCode
		, phys.InputCode
	FROM (SELECT SchoolYear, InputCode FROM Staging.SourceSystemReferenceData WHERE TableName = 'RefOrganizationLocationType' AND OutputCode = 'Mailing') mail
	JOIN (SELECT SchoolYear, InputCode FROM Staging.SourceSystemReferenceData WHERE TableName = 'RefOrganizationLocationType' AND OutputCode = 'Physical') phys
		ON mail.SchoolYear = phys.SchoolYear


	CREATE TABLE #K12Schools (
		StateAbbreviationCode						CHAR(2)
		, SeaOrganizationName						VARCHAR(250)
		, SeaShortName								VARCHAR(200)
		, SeaOrganizationIdentifierSea				VARCHAR(7)
		, IeuOrganizationName						VARCHAR(200)
		, IeuOrganizationIdentifierSea				VARCHAR(50)
		, LeaIdentifierNces							VARCHAR(50)
		, LeaIdentifierSea							VARCHAR(50)
		, PriorLEAIdentifierSea						VARCHAR(50)
		, LeaOrganizationName						VARCHAR(200)
		, LeaTypeCode								VARCHAR(50)
		, LeaTypeDescription						VARCHAR(200)
		, LeaTypeEdfactsCode						VARCHAR(50)
		, SchoolIdentifierNces						VARCHAR(50)
		, SchoolIdentifierSea						VARCHAR(50)
		, SchoolIdentifierAct						VARCHAR(50)
		, PriorSchoolIdentifierSea					VARCHAR(50)
		, NameOfInstitution							VARCHAR(200)
		, SchoolOperationalStatus					VARCHAR(50)
		, SchoolOperationalEdfactsStatus			VARCHAR(50)
		, SchoolOperationalStatusEffectiveDate		DATETIME
		, SchoolTypeCode							VARCHAR(50)
		, SchoolTypeDescription						VARCHAR(200)
		, SchoolTypeEdfactsCode						VARCHAR(50)
		, ReportedFederally							BIT
		, CharterSchoolIndicator					BIT
		, CharterSchoolContractApprovalDate			DATETIME
		, CharterSchoolContractRenewalDate			DATETIME
		, CharterSchoolContractIdNumber				VARCHAR(50)
		, MailingAddressStreetNumberAndName			VARCHAR(200)
		, MailingAddressApartmentRoomOrSuiteNumber	VARCHAR(200)
		, MailingAddressCity						VARCHAR(200)
		, MailingAddressStateAbbreviation			VARCHAR(50)
		, MailingAddressPostalCode					VARCHAR(10)
		, MailingAddressCountyAnsiCodeCode			VARCHAR(20)
		, OutOfStateIndicator						BIT
		, PhysicalAddressStreetNumberAndName		VARCHAR(200)
		, PhysicalAddressApartmentRoomOrSuiteNumber	VARCHAR(200)
		, PhysicalAddressCity						VARCHAR(200)
		, PhysicalAddressStateAbbreviation			VARCHAR(50)
		, PhysicalAddressPostalCode					VARCHAR(10)
		, PhysicalAddressCountyAnsiCodeCode			VARCHAR(20)
		, Longitude									VARCHAR(20)
		, Latitude									VARCHAR(20)
		, TelephoneNumber							VARCHAR(20)
		, WebsiteAddress							VARCHAR(300)
		, CharterSchoolStatus						VARCHAR(50)
		, ReconstitutedStatus						VARCHAR(50)
		, AdministrativeFundingControlCode			NVARCHAR(50)
		, AdministrativeFundingControlDescription	NVARCHAR(200)
		, RecordStartDateTime						DATETIME
		, RecordEndDateTime							DATETIME
	)
	CREATE CLUSTERED INDEX IX_K12Schools ON #K12Schools (SchoolIdentifierSea, RecordStartDateTime)

	INSERT INTO #K12Schools
	SELECT DISTINCT
		ssd.StateAbbreviationCode
		, ssd.SeaOrganizationName
		, @StateName 'StateAbbreviationDescription'
		, ssd.SeaOrganizationIdentifierSea

		, sko.IEU_OrganizationName
		, sko.IEUIdentifierSea

		, sko.LEAIdentifierNCES
		, sko.LEAIdentifierSea
		, sko.PriorLEAIdentifierSea 
		, sko.LEAOrganizationName
		, sssrd2.OutputCode AS LeaTypeCode-- LEA_Type
		, CASE sssrd2.OutputCode 
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
		END AS LeaTypeDescription
		, CASE sssrd2.OutputCode 
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
		END AS LeaTypeEdfactsCode

		, sko.SchoolIdentifierNCES
		, sko.SchoolIdentifierSea
		, sko.SchoolIdentifierAct
		, sko.PriorSchoolIdentifierSea
		, sko.SchoolOrganizationName
		, sssrd1.OutputCode -- SchoolOperationalStatus
		, CASE sssrd1.OutputCode
			WHEN 'Open' THEN 1 
			WHEN 'Closed' THEN 2 
			WHEN 'New' THEN 3 
			WHEN 'Added' THEN 4 
			WHEN 'ChangedAgency' THEN 5 
			WHEN 'Inactive' THEN 6 
			WHEN 'FutureSchool' THEN 7 
			WHEN 'Reopened' THEN 8 
			ELSE -1
		END AS SchOperationalEdfactsStatus
		, sko.School_OperationalStatusEffectiveDate
		, sssrd3.OutputCode -- School_Type
		, CASE sssrd3.OutputCode 
			WHEN 'Regular' THEN 'Regular School'
			WHEN 'Special' THEN 'Special Education School'
			WHEN 'CareerAndTechnical' THEN 'Career and Technical Education School'
			WHEN 'Alternative' THEN 'Alternative Education School'
			WHEN 'Reportable' THEN 'Reportable Program'
			ELSE NULL
		END AS SchoolTypeDescription
		, CASE sssrd3.OutputCode 
			WHEN 'Regular' THEN 1
			WHEN 'Special' THEN 2
			WHEN 'CareerAndTechnical' THEN 3
			WHEN 'Alternative' THEN 4
			WHEN 'Reportable' THEN 5
			ELSE -1
		END AS SchoolTypeEdfactsCode
		, sko.School_IsReportedFederally
		, sko.School_CharterSchoolIndicator
		, sko.School_CharterContractApprovalDate
		, sko.School_CharterContractRenewalDate
		, sko.School_CharterContractIDNumber

		, smam.AddressStreetNumberAndName 			AS MailingAddressStreetNumberAndName
		, smam.AddressApartmentRoomOrSuiteNumber 	AS MailingAddressApartmentRoomOrSuiteNumber
		, smam.AddressCity	 						AS MailingAddressCity
		, smam.StateAbbreviation 					AS MailingAddressStateAbbreviation
		, smam.AddressPostalCode 					AS MailingAddressPostalCode
		, smam.AddressCountyAnsiCodeCode			AS MailingAddressCountyAnsiCodeCode
		, CASE 
			WHEN ssd.StateAbbreviationCode <> smap.StateAbbreviation THEN 1
			ELSE 0
		END AS OutOfStateIndicator
		, smap.AddressStreetNumberAndName 			AS PhysicalAddressStreetNumberAndName
		, smap.AddressApartmentRoomOrSuiteNumber 	AS PhysicalAddressApartmentRoomOrSuiteNumber
		, smap.AddressCity 							AS PhysicalAddressCity
		, smap.StateAbbreviation 					AS PhysicalAddressState
		, smap.AddressPostalCode 					AS PhysicalAddressPostalCode
		, smap.AddressCountyAnsiCodeCode			AS PhysicalAddressCountyAnsiCodeCode
		, NULL
		, NULL
		, sop.TelephoneNumber
		, sko.School_WebSiteAddress
		, CASE
			WHEN School_CharterSchoolIndicator IS NULL THEN 'MISSING'
			WHEN School_CharterSchoolIndicator = 1 THEN 'YES'
			WHEN School_CharterSchoolIndicator = 0 THEN 'NO'
		END AS CharterSchoolStatus
		, sssrd4.OutputCode -- School_ReconstitutedStatus
		, sssrd5.OutputCode -- Administrative Funding Control Code
		, CASE sssrd5.OutputCode -- Administrative Funding Control Description
			WHEN 'Public' THEN 'Public School'
			WHEN 'Private' THEN 'Private School'
			WHEN 'Other' THEN 'Other'
		END 
		, sko.School_RecordStartDateTime
		, sko.School_RecordEndDateTime
	FROM Staging.K12Organization sko
	JOIN Staging.StateDetail ssd
		ON sko.SchoolYear = ssd.SchoolYear
	LEFT JOIN Staging.OrganizationAddress smam
		ON sko.SchoolIdentifierSea = smam.OrganizationIdentifier
		AND smam.AddressTypeForOrganization = (select MailingAddressType from #organizationLocationTypes lt WHERE lt.SchoolYear = smam.SchoolYear)
		AND smam.OrganizationType in (select K12SchoolOrganizationType from #organizationTypes ot WHERE ot.SchoolYear = smam.SchoolYear)
	LEFT JOIN Staging.OrganizationAddress smap
		ON sko.SchoolIdentifierSea = smap.OrganizationIdentifier
		AND smap.AddressTypeForOrganization = (select PhysicalAddressType from #organizationLocationTypes lt WHERE lt.SchoolYear = smam.SchoolYear)
		AND smap.OrganizationType in (select K12SchoolOrganizationType from #organizationTypes ot WHERE ot.SchoolYear = smap.SchoolYear)
	LEFT JOIN Staging.OrganizationPhone sop
		ON sko.SchoolIdentifierSea = sop.OrganizationIdentifier
		AND sop.OrganizationType in (select K12SchoolOrganizationType from #organizationTypes ot WHERE ot.SchoolYear = sop.SchoolYear)
		AND isnull(sko.DataCollectionName,'') = isnull(sop.DataCollectionName,'')
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON sko.School_OperationalStatus = sssrd1.InputCode
		AND sssrd1.TableName = 'RefOperationalStatus'
		AND sssrd1.TableFilter = '000533'
		AND sko.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON sko.LEA_Type = sssrd2.InputCode
		AND sssrd2.TableName = 'RefLeaType'
		AND sko.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
		ON sko.School_Type = sssrd3.InputCode
		AND sssrd3.TableName = 'RefSchoolType'
		AND sko.SchoolYear = sssrd3.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd4
		ON sko.School_ReconstitutedStatus = sssrd4.InputCode
		AND sssrd4.TableName = 'RefReconstitutedStatus'
		AND sko.SchoolYear = sssrd4.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd5
		ON sko.School_AdministrativeFundingControl = sssrd5.InputCode
		AND sssrd5.TableName = 'RefAdministrativeFundingControl'
		AND sko.SchoolYear = sssrd5.SchoolYear
	WHERE @DataCollectionName IS NULL	
		OR (
			sko.DataCollectionName = @dataCollectionName
			AND ssd.DataCollectionName = @dataCollectionName
			AND smam.DataCollectionName = @dataCollectionName
			AND smap.DataCollectionName = @dataCollectionName
			AND sop.DataCollectionName = @dataCollectionName
		)


	-- SchoolIdentifierState and RecordStartDateTime must always be unique in Staging.K12Organaization
	MERGE rds.DimK12Schools AS trgt 
	USING #K12Schools AS src
			ON trgt.SchoolIdentifierSea = src.SchoolIdentifierSea
			AND ISNULL(trgt.RecordStartDateTime, '') = ISNULL(src.RecordStartDateTime, '')
	WHEN MATCHED THEN 
		UPDATE SET 
			trgt.IeuOrganizationName 						= src.IeuOrganizationName,
			trgt.IeuOrganizationIdentifierSea 				= src.IeuOrganizationIdentifierSea,
			trgt.LeaOrganizationName 						= src.LeaOrganizationName,
			trgt.LeaIdentifierNces 							= src.LeaIdentifierNces,
			trgt.LeaIdentifierSea 							= src.LeaIdentifierSea,
			trgt.PriorLEAIdentifierSea 						= src.PriorLEAIdentifierSea,
			trgt.LeaTypeCode 								= src.LeaTypeCode,
			trgt.LeaTypeDescription 						= src.LeaTypeDescription,
			trgt.LeaTypeEdFactsCode 						= src.LeaTypeEdFactsCode,
			trgt.SchoolIdentifierNces 						= src.SchoolIdentifierNces,
			trgt.SchoolIdentifierAct						= src.SchoolIdentifierAct,
			trgt.PriorSchoolIdentifierSea 					= src.PriorSchoolIdentifierSea,
			trgt.SchoolTypeCode 							= src.SchoolTypeCode,
			trgt.SchoolTypeDescription 						= src.SchoolTypeDescription,
			trgt.SchoolTypeEdFactsCode 						= src.SchoolTypeEdFactsCode,
			trgt.NameOfInstitution 							= src.NameOfInstitution,
			trgt.SchoolOperationalStatus 					= src.SchoolOperationalStatus,
			trgt.SchoolOperationalStatusEdFactsCode 		= src.SchoolOperationalEdfactsStatus,
			trgt.SchoolOperationalStatusEffectiveDate 		= src.SchoolOperationalStatusEffectiveDate,
			trgt.CharterSchoolIndicator 					= src.CharterSchoolIndicator,
			trgt.CharterSchoolContractIdNumber 				= src.CharterSchoolContractIdNumber,
			trgt.CharterSchoolContractApprovalDate 			= src.CharterSchoolContractApprovalDate,
			trgt.CharterSchoolContractRenewalDate 			= src.CharterSchoolContractRenewalDate,
			trgt.ReportedFederally 							= src.ReportedFederally,
			trgt.OutOfStateIndicator 						= src.OutOfStateIndicator,
			trgt.MailingAddressStreetNumberAndName 			= src.MailingAddressStreetNumberAndName,
			trgt.MailingAddressApartmentRoomOrSuiteNumber 	= src.MailingAddressApartmentRoomOrSuiteNumber,
			trgt.MailingAddressCity 						= src.MailingAddressCity,
			trgt.MailingAddressCountyAnsiCodeCode 			= src.MailingAddressCountyAnsiCodeCode,
			trgt.MailingAddressStateAbbreviation 			= src.MailingAddressStateAbbreviation,
			trgt.MailingAddressPostalCode 					= src.MailingAddressPostalCode,
			trgt.PhysicalAddressStreetNumberAndName 		= src.PhysicalAddressStreetNumberAndName,
			trgt.PhysicalAddressApartmentRoomOrSuiteNumber 	= src.PhysicalAddressApartmentRoomOrSuiteNumber,
			trgt.PhysicalAddressCity 						= src.PhysicalAddressCity,
			trgt.PhysicalAddressCountyAnsiCodeCode 			= src.PhysicalAddressCountyAnsiCodeCode,
			trgt.PhysicalAddressStateAbbreviation 			= src.PhysicalAddressStateAbbreviation,
			trgt.PhysicalAddressPostalCode 					= src.PhysicalAddressPostalCode,
			trgt.Longitude 									= src.Longitude,
			trgt.Latitude 									= src.Latitude,
			trgt.TelephoneNumber 							= src.TelephoneNumber,
			trgt.WebsiteAddress 							= src.WebsiteAddress,
			trgt.CharterSchoolStatus 						= src.CharterSchoolStatus,
			trgt.ReconstitutedStatus 						= src.ReconstitutedStatus,
			trgt.AdministrativeFundingControlCode 			= src.AdministrativeFundingControlCode,
			trgt.AdministrativeFundingControlDescription 	= src.AdministrativeFundingControlDescription,
			trgt.RecordEndDateTime					 		= src.RecordEndDateTime
	WHEN NOT MATCHED BY TARGET THEN     --- Records Exists IN Source but NOT IN Target
	INSERT (
		StateAbbreviationCode	
		, StateAbbreviationDescription
		, StateANSICode					
		, SeaOrganizationName						
		--, SeaOrganizationShortName								
		, SeaOrganizationIdentifierSea				
		, IeuOrganizationName						
		, IeuOrganizationIdentifierSea				
		, LeaIdentifierNces							
		, LeaIdentifierSea							
		, PriorLEAIdentifierSea						
		, LeaOrganizationName						
		, LeaTypeCode								
		, LeaTypeDescription						
		, LeaTypeEdfactsCode						
		, SchoolIdentifierNces						
		, SchoolIdentifierSea
		, SchoolIdentifierAct						
		, PriorSchoolIdentifierSea					
		, NameOfInstitution							
		, SchoolOperationalStatus					
		, SchoolOperationalStatusEdFactsCode			
		, SchoolOperationalStatusEffectiveDate		
		, SchoolTypeCode							
		, SchoolTypeDescription						
		, SchoolTypeEdfactsCode						
		, ReportedFederally							
		, CharterSchoolIndicator					
		, CharterSchoolContractApprovalDate			
		, CharterSchoolContractRenewalDate			
		, CharterSchoolContractIdNumber				
		, MailingAddressStreetNumberAndName			
		, MailingAddressApartmentRoomOrSuiteNumber	
		, MailingAddressCity						
		, MailingAddressStateAbbreviation			
		, MailingAddressPostalCode					
		, MailingAddressCountyAnsiCodeCode			
		, OutOfStateIndicator						
		, PhysicalAddressStreetNumberAndName		
		, PhysicalAddressApartmentRoomOrSuiteNumber	
		, PhysicalAddressCity						
		, PhysicalAddressStateAbbreviation			
		, PhysicalAddressPostalCode					
		, PhysicalAddressCountyAnsiCodeCode			
		, Longitude									
		, Latitude									
		, TelephoneNumber							
		, WebsiteAddress							
		, CharterSchoolStatus						
		, ReconstitutedStatus						
		, AdministrativeFundingControlCode			
		, AdministrativeFundingControlDescription	
		, RecordStartDateTime						
		, RecordEndDateTime							
	) 
	VALUES (
		StateAbbreviationCode						
		, @StateName
		, @StateANSICode
		, SeaOrganizationName						
		--, SeaShortName								
		, SeaOrganizationIdentifierSea				
		, IeuOrganizationName						
		, IeuOrganizationIdentifierSea				
		, LeaIdentifierNces							
		, LeaIdentifierSea							
		, PriorLEAIdentifierSea						
		, LeaOrganizationName						
		, LeaTypeCode								
		, LeaTypeDescription						
		, LeaTypeEdfactsCode						
		, SchoolIdentifierNces						
		, SchoolIdentifierSea
		, SchoolIdentifierAct						
		, PriorSchoolIdentifierSea					
		, NameOfInstitution							
		, SchoolOperationalStatus					
		, SchoolOperationalEdfactsStatus			
		, SchoolOperationalStatusEffectiveDate		
		, SchoolTypeCode							
		, SchoolTypeDescription						
		, SchoolTypeEdfactsCode						
		, ReportedFederally							
		, CharterSchoolIndicator					
		, CharterSchoolContractApprovalDate			
		, CharterSchoolContractRenewalDate			
		, CharterSchoolContractIdNumber				
		, MailingAddressStreetNumberAndName			
		, MailingAddressApartmentRoomOrSuiteNumber	
		, MailingAddressCity						
		, MailingAddressStateAbbreviation			
		, MailingAddressPostalCode					
		, MailingAddressCountyAnsiCodeCode			
		, OutOfStateIndicator						
		, PhysicalAddressStreetNumberAndName		
		, PhysicalAddressApartmentRoomOrSuiteNumber	
		, PhysicalAddressCity						
		, PhysicalAddressStateAbbreviation			
		, PhysicalAddressPostalCode					
		, PhysicalAddressCountyAnsiCodeCode			
		, Longitude									
		, Latitude									
		, TelephoneNumber							
		, WebsiteAddress							
		, CharterSchoolStatus						
		, ReconstitutedStatus						
		, AdministrativeFundingControlCode			
		, AdministrativeFundingControlDescription	
		, RecordStartDateTime						
		, RecordEndDateTime							
	);

	;WITH upd AS(
		SELECT 
			startd.SchoolIdentifierSea
			, startd.RecordStartDateTime 
			, min(endd.RecordStartDateTime) - 1 AS RecordEndDateTime
		FROM rds.DimK12Schools startd
		JOIN rds.DimK12Schools endd
			ON startd.SchoolIdentifierSea = endd.SchoolIdentifierSea
			AND startd.RecordStartDateTime < endd.RecordStartDateTime
		GROUP BY  startd.SchoolIdentifierSea, startd.RecordStartDateTime
	) 
	UPDATE school SET RecordEndDateTime = upd.RecordEndDateTime
	FROM rds.DimK12Schools school
	JOIN upd	
		ON school.SchoolIdentifierSea = upd.SchoolIdentifierSea
		AND school.RecordStartDateTime = upd.RecordStartDateTime
	WHERE upd.RecordEndDateTime <> '1900-01-01 00:00:00.000'


-- School Grade Levels
	CREATE TABLE #gradeLevels (
		DimK12SchoolId INT
		, DimGradeLevelId INT
	)

	INSERT INTO #gradeLevels
	SELECT distinct 
		rdks.DimK12SchoolId
		, rdgl.DimGradeLevelId 
	FROM rds.DimK12Schools rdks
	JOIN staging.OrganizationGradeOffered  sogo
		ON rdks.SchoolIdentifierSea = sogo.OrganizationIdentifier
		AND rdks.RecordStartDateTime = sogo.RecordStartDateTime
		-- Record Start/End Dates must match between Staging.K12Organization and Staging.OrganizationGradesOffered
		AND ISNULL(rdks.RecordEndDateTime, '01/01/1900') = ISNULL(sogo.RecordEndDateTime, isnull(rdks.RecordEndDateTime, '01/01/1900'))
	JOIN rds.vwDimGradeLevels rdgl
		ON sogo.GradeOffered = rdgl.GradeLevelMap
		AND rdgl.GradeLevelTypeCode = '000131'
		and sogo.SchoolYear = rdgl.SchoolYear

	MERGE rds.BridgeK12SchoolGradeLevels AS trgt
	USING #gradeLevels AS src
			ON trgt.K12SchoolId = src.DimK12SchoolId
			AND trgt.GradeLevelId = src.DimGradeLevelId
	WHEN NOT MATCHED THEN
	INSERT(K12SchoolId, GradeLevelId) values(src.DimK12SchoolId, src.DimGradeLevelId);


-- LEA Grade Levels
-- Need to do this here because if you do it in Staging-to-DimLEAs and that runs before Staging-to-DimK12Schools, there may be no records in RDS.DimK12Schools to join to.
	;WITH CTE as (
		SELECT DISTINCT
			rdl.DimLeaID
			, rdgl.DimGradeLevelId 
		FROM RDS.DimK12Schools rdks
		JOIN RDS.DimLeas rdl
			ON rdks.LeaIdentifierSea = rdl.LeaIdentifierSea
			AND rdks.RecordStartDateTime BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, GETDATE())
		JOIN Staging.K12Organization sko
			ON sko.LEAIdentifierSea = rdl.LeaIdentifierSea
			AND rdks.SchoolIdentifierSea = sko.SchoolIdentifierSea
		JOIN Staging.OrganizationGradeOffered sogo
			ON rdks.SchoolIdentifierSea = sogo.OrganizationIdentifier
		JOIN RDS.vwDimGradeLevels rdgl
			ON sogo.GradeOffered = rdgl.GradeLevelMap
			AND rdgl.GradeLevelTypeCode = '000131'
			AND rdgl.SchoolYear = sogo.SchoolYear	
	)

	MERGE rds.BridgeLeaGradeLevels AS trgt
	USING CTE AS src
		ON trgt.LeaId = src.DimLeaId
		AND trgt.GradeLevelId = src.DimGradeLevelId
	WHEN NOT MATCHED THEN
		INSERT (
			LeaId
			, GradeLevelId
		) 
		VALUES (
			src.DimLeaID
			, src.DimGradeLevelId
		);

	DROP TABLE #K12Schools
	DROP TABLE #gradeLevels
	DROP TABLE #organizationTypes
	DROP TABLE #organizationLocationTypes

END
GO

