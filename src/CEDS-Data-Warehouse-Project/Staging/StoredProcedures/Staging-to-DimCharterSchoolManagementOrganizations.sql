CREATE PROCEDURE [Staging].[Staging-to-DimCharterSchoolManagementOrganizations]
	@dataCollectionName AS VARCHAR(50) = NULL,
	@runAsTest AS BIT = 0
AS   

BEGIN

	IF OBJECT_ID(N'tempdb..#CharterSchoolManagementOrganizations') IS NOT NULL DROP TABLE #CharterSchoolManagementOrganizations

	DECLARE @StateCode varchar(2), @StateName varchar(50), @StateANSICode varchar(5), @SchoolYear int
	SELECT @StateCode = (select StateAbbreviationCode from Staging.StateDetail)
	SELECT @StateName = (select [Description] from dbo.RefState where Code = @StateCode)
	SELECT @StateANSICode = (select Code from dbo.RefStateANSICode where [Description] = @StateName)
	SELECT @SchoolYear = (select SchoolYear from Staging.StateDetail)

	IF NOT EXISTS (SELECT 1 FROM rds.DimCharterSchoolManagementOrganizations WHERE DimCharterSchoolManagementOrganizationId = -1)
	BEGIN
		SET IDENTITY_INSERT rds.DimCharterSchoolManagementOrganizations ON
		INSERT INTO rds.DimCharterSchoolManagementOrganizations (DimCharterSchoolManagementOrganizationId) VALUES (-1)
		SET IDENTITY_INSERT rds.DimCharterSchoolManagementOrganizations off
	END

	CREATE TABLE #organizationTypes (
		SchoolYear								SMALLINT
		, CharterSchoolManagementOrganization	VARCHAR(50)
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
	AND OutputCode = 'CharterSchoolManagementOrganization'

	INSERT INTO #organizationLocationTypes
	SELECT 
		mail.SchoolYear
		, mail.InputCode
		, phys.InputCode
	FROM (SELECT SchoolYear, InputCode FROM Staging.SourceSystemReferenceData WHERE TableName = 'RefOrganizationLocationType' AND OutputCode = 'Mailing') mail
	JOIN (SELECT SchoolYear, InputCode FROM Staging.SourceSystemReferenceData WHERE TableName = 'RefOrganizationLocationType' AND OutputCode = 'Physical') phys
		ON mail.SchoolYear = phys.SchoolYear


	SELECT DISTINCT
		scsmo.CharterSchoolManagementOrganizationOrganizationIdentifierEIN  'CharterSchoolManagementOrganizationOrganizationIdentifierSea'
		, scsmo.CharterSchoolManagementOrganizationOrganizationName
		, @StateName			 											'StateAbbreviationDescription'
		, @StateCode 														'StateAbbreviationCode'
		, @StateANSICode 													'StateANSICode'
		, scsmo.CharterSchoolManagementOrganizationType						'CharterSchoolManagementOrganizationTypeCode'
		, refcsmot.[Definition]												'CharterSchoolManagementOrganizationTypeDescription'
		, ssrd.OutputCode				 									'CharterSchoolManagementOrganizationTypeEdfactsCode'
		, smam.AddressStreetNumberAndName				 					'MailingAddressStreetNumberAndName'
		, smam.AddressCity 													'MailingAddressCity'
		, smam.StateAbbreviation 											'MailingAddressStateAbbreviation'
		, smam.AddressPostalCode 											'MailingAddressPostalCode'
		, smap.AddressStreetNumberAndName 									'PhysicalAddressStreetNumberAndName'
		, smap.AddressCity 													'PhysicalAddressCity'
		, smap.StateAbbreviation		 									'PhysicalAddressStateAbbreviation'
		, smap.AddressPostalCode					 						'PhysicalAddressPostalCode'
		, sop.TelephoneNumber				 				
		, NULL 																'WebsiteAddress'
		, 0 																'OutOfStateIndicator'
		, scsmo.RecordStartDateTime
		, scsmo.RecordEndDateTime
		, NULL 																'MailingAddressCountyAnsiCode'
		, NULL 																'PhysicalAddressCountyAnsiCode,'
	INTO #CharterSchoolManagementOrganizations
	FROM Staging.CharterSchoolManagementOrganization scsmo
	JOIN Staging.SourceSystemReferenceData ssrd
		ON ssrd.TableName = 'RefCharterSchoolManagementOrganizationType'
		AND scsmo.CharterSchoolManagementOrganizationType = ssrd.InputCode
		AND ssrd.SchoolYear = @SchoolYear
	JOIN Staging.StateDetail ssd
		ON scsmo.SchoolYear = ssd.SchoolYear
	JOIN #organizationTypes orgTypes
		ON orgTypes.SchoolYear = @SchoolYear
	JOIN #organizationLocationTypes locType
		ON locType.SchoolYear = @SchoolYear
	LEFT JOIN Staging.OrganizationAddress smam
		ON scsmo.CharterSchoolManagementOrganizationOrganizationIdentifierEIN = smam.OrganizationIdentifier
		AND smam.OrganizationType = orgTypes.CharterSchoolManagementOrganization
		AND smam.AddressTypeForOrganization = locType.MailingAddressType
	LEFT JOIN Staging.OrganizationAddress smap
		ON scsmo.CharterSchoolManagementOrganizationOrganizationIdentifierEIN = smap.OrganizationIdentifier
		AND smap.OrganizationType = orgTypes.CharterSchoolManagementOrganization
		AND smap.AddressTypeForOrganization = locType.PhysicalAddressType
	LEFT JOIN Staging.OrganizationPhone sop
		ON scsmo.CharterSchoolManagementOrganizationOrganizationIdentifierEIN = sop.OrganizationIdentifier
		AND sop.OrganizationType = orgTypes.CharterSchoolManagementOrganization
	LEFT JOIN dbo.RefCharterSchoolManagementOrganizationType refcsmot
		ON refcsmot.Code = ssrd.OutputCode

-- MERGE INTO DimCharterSchoolManagementOrganizations
	BEGIN TRY
		MERGE rds.DimCharterSchoolManagementOrganizations AS trgt
		USING #CharterSchoolManagementOrganizations AS src
			ON trgt.CharterSchoolManagementOrganizationOrganizationIdentifierSea = src.CharterSchoolManagementOrganizationOrganizationIdentifierSea
			AND ISNULL(trgt.RecordStartDateTime, '') = ISNULL(src.RecordStartDateTime, '')
		WHEN MATCHED THEN UPDATE
			SET trgt.CharterSchoolManagementOrganizationOrganizationName 	= src.CharterSchoolManagementOrganizationOrganizationName							
				, trgt.StateAbbreviationCode 								= src.StateAbbreviationCode
				, trgt.StateANSICode 										= src.StateANSICode
				, trgt.StateAbbreviationDescription 						= src.StateAbbreviationDescription
				, trgt.CharterSchoolManagementOrganizationTypeCode 			= src.CharterSchoolManagementOrganizationTypeCode
				, trgt.CharterSchoolManagementOrganizationTypeDescription 	= src.CharterSchoolManagementOrganizationTypeDescription
				, trgt.CharterSchoolManagementOrganizationTypeEdFactsCode	= src.CharterSchoolManagementOrganizationTypeEdFactsCode						
				, trgt.MailingAddressStreetNumberAndName					= src.MailingAddressStreetNumberAndName
				, trgt.MailingAddressCity 									= src.MailingAddressCity
				, trgt.MailingAddressStateAbbreviation 						= src.MailingAddressStateAbbreviation
				, trgt.MailingAddressPostalCode 							= src.MailingAddressPostalCode
				, trgt.OutOfStateIndicator 									= src.OutOfStateIndicator
				, trgt.PhysicalAddressStreetNumberAndName					= src.PhysicalAddressStreetNumberAndName
				, trgt.PhysicalAddressCity 									= src.PhysicalAddressCity
				, trgt.PhysicalAddressStateAbbreviation						= src.PhysicalAddressStateAbbreviation
				, trgt.PhysicalAddressPostalCode							= src.PhysicalAddressPostalCode
				, trgt.TelephoneNumber										= src.TelephoneNumber
				, trgt.WebsiteAddress										= src.WebsiteAddress
				, trgt.RecordEndDateTime 									= src.RecordEndDateTime
		WHEN NOT MATCHED BY TARGET THEN     --- Records Exists in Source but not in Target
		INSERT (
			CharterSchoolManagementOrganizationOrganizationName
			, CharterSchoolManagementOrganizationOrganizationIdentifierSea
			, StateAbbreviationCode
			, StateANSICode
			, StateAbbreviationDescription
			, CharterSchoolManagementOrganizationTypeCode
			, CharterSchoolManagementOrganizationTypeDescription
			, CharterSchoolManagementOrganizationTypeEdFactsCode
			, MailingAddressStreetNumberAndName
			, MailingAddressCity
			, MailingAddressStateAbbreviation
			, MailingAddressPostalCode
			, OutOfStateIndicator
			, PhysicalAddressStreetNumberAndName
			, PhysicalAddressCity
			, PhysicalAddressStateAbbreviation
			, PhysicalAddressPostalCode
			, TelephoneNumber
			, WebsiteAddress
			, RecordStartDateTime
			, RecordEndDateTime
		)
		VALUES (
			src.CharterSchoolManagementOrganizationOrganizationName
			,src.CharterSchoolManagementOrganizationOrganizationIdentifierSea
			, StateAbbreviationCode
			, StateANSICode
			, StateAbbreviationDescription
			, src.CharterSchoolManagementOrganizationTypeCode
			, src.CharterSchoolManagementOrganizationTypeDescription
			, src.CharterSchoolManagementOrganizationTypeEdFactsCode
			, src.MailingAddressStreetNumberAndName
			, src.MailingAddressCity
			, src.MailingAddressStateAbbreviation
			, src.MailingAddressPostalCode
			, src.OutOfStateIndicator
			, src.PhysicalAddressStreetNumberAndName
			, src.PhysicalAddressCity
			, src.PhysicalAddressStateAbbreviation
			, src.PhysicalAddressPostalCode
			, src.TelephoneNumber
			, src.WebsiteAddress
			, src.RecordStartDateTime
			, src.RecordEndDateTime
		);

		;WITH upd AS(
			SELECT 
				startd.CharterSchoolManagementOrganizationOrganizationIdentifierSea
				, startd.RecordStartDateTime
				, min(endd.RecordStartDateTime) - 1 AS RecordEndDateTime 
			FROM rds.DimCharterSchoolManagementOrganizations startd
			JOIN rds.DimCharterSchoolManagementOrganizations endd
				ON startd.CharterSchoolManagementOrganizationOrganizationIdentifierSea = endd.CharterSchoolManagementOrganizationOrganizationIdentifierSea
				AND startd.RecordStartDateTime < endd.RecordStartDateTime
			GROUP BY startd.CharterSchoolManagementOrganizationOrganizationIdentifierSea, startd.RecordStartDateTime
		) 

		UPDATE charter SET RecordEndDateTime = upd.RecordEndDateTime 
		FROM rds.DimCharterSchoolManagementOrganizations charter
		JOIN upd	
			ON charter.CharterSchoolManagementOrganizationOrganizationIdentifierSea = upd.CharterSchoolManagementOrganizationOrganizationIdentifierSea
			AND charter.RecordStartDateTime = upd.RecordStartDateTime
		WHERE upd.RecordEndDateTime <> '1900-01-01 00:00:00.000'
	
	END TRY
	BEGIN CATCH
		INSERT INTO app.DataMigrationHistories(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) 
		VALUES	(getutcdate(), 2, 'RDS.DimCharterSchoolManagementOrganizations - Error Occurred - ' + CAST(ERROR_MESSAGE() AS VARCHAR(900)))

	END CATCH
	
END