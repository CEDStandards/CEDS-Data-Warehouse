CREATE PROCEDURE [Staging].[Staging-to-DimCharterSchoolAuthorizers]
	@dataCollectionName AS VARCHAR(50) = NULL,
	@runAsTest AS BIT = 0
AS   

BEGIN

	IF OBJECT_ID(N'tempdb..#CharterSchoolAuthorizers') IS NOT NULL DROP TABLE #CharterSchoolAuthorizers

    DECLARE @SchoolYear int, @StateCode varchar(2), @StateName varchar(50), @StateAnsiCode varchar(5)
    SELECT @SchoolYear = (	SELECT sy.SchoolYear
							FROM RDS.DimSchoolYearDataMigrationTypes dm
								inner join RDS.DimSchoolYears sy
									on dm.DimSchoolYearId = sy.DimSchoolYearId
							where IsSelected = 1
							and dm.DataMigrationTypeId = 3
						)
    SELECT @StateCode = StateAbbreviationCode FROM Staging.StateDetail where SchoolYear = @schoolyear
	SELECT @StateName = (	SELECT CedsOptionSetDescription 
							FROM CEDS.CedsOptionSetMapping 
							where CedsElementTechnicalName = 'StateAbbreviation' 
							and CedsOptionSetCode = @StateCode
						)
	SELECT @StateAnsiCode = (	SELECT CedsOptionSetCode 
								FROM CEDS.CedsOptionSetMapping 
								where CedsElementTechnicalName = 'StateAnsiCode' 
								and CedsOptionSetDescription = @StateName
							)

	IF NOT EXISTS (SELECT 1 FROM RDS.DimCharterSchoolAuthorizers WHERE DimCharterSchoolAuthorizerId = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimCharterSchoolAuthorizers ON
		INSERT INTO RDS.DimCharterSchoolAuthorizers (DimCharterSchoolAuthorizerId) VALUES (-1)
		SET IDENTITY_INSERT RDS.DimCharterSchoolAuthorizers off
	END

	CREATE TABLE #organizationTypes (
		SchoolYear									SMALLINT
		, CharterSchoolAuthorizingOrganization		VARCHAR(50)
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
	AND OutputCode = 'CharterSchoolAuthorizingOrganization'

	INSERT INTO #organizationLocationTypes
	SELECT 
		mail.SchoolYear
		, mail.InputCode
		, phys.InputCode
	FROM (SELECT SchoolYear, InputCode FROM Staging.SourceSystemReferenceData WHERE TableName = 'RefOrganizationLocationType' AND OutputCode = 'Mailing') mail
	JOIN (SELECT SchoolYear, InputCode FROM Staging.SourceSystemReferenceData WHERE TableName = 'RefOrganizationLocationType' AND OutputCode = 'Physical') phys
		ON mail.SchoolYear = phys.SchoolYear


	SELECT DISTINCT
		scsa.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea
		, scsa.CharterSchoolAuthorizingOrganizationOrganizationName
		, @StateName			 									'StateAbbreviationDescription'
		, @StateCode 												'StateAbbreviationCode'
		, @StateAnsiCode 											'StateAnsiCode'
		, ssrd.OutputCode											'CharterSchoolAuthorizerTypeCode'
		, refcsat.[Definition] 										'CharterSchoolAuthorizerTypeDescription'
		, ssrd.OutputCode											'CharterSchoolAuthorizerTypeEdFactsCode'
		, smam.AddressStreetNumberAndName				 			'MailingAddressStreetNumberAndName'
		, smam.AddressApartmentRoomOrSuiteNumber					'MailingAddressApartmentRoomOrSuiteNumber'
		, smam.AddressCity 											'MailingAddressCity'
		, smam.StateAbbreviation 									'MailingAddressStateAbbreviation'
		, smam.AddressPostalCode 									'MailingAddressPostalCode'
		, smam.AddressCountyAnsiCodeCode			 				'MailingAddressCountyAnsiCodeCode'
		, smap.AddressStreetNumberAndName 							'PhysicalAddressStreetNumberAndName'
		, smap.AddressApartmentRoomOrSuiteNumber					'PhysicalAddressApartmentRoomOrSuiteNumber'
		, smap.AddressCity 											'PhysicalAddressCity'
		, smap.StateAbbreviation 									'PhysicalAddressStateAbbreviation'
		, smap.AddressPostalCode			 						'PhysicalAddressPostalCode'
		, smap.AddressCountyAnsiCodeCode							'PhysicalAddressCountyAnsiCodeCode'
		, sop.TelephoneNumber				 				
		, NULL 														'WebSiteAddress'
		, 0 														'OutOfStateIndicator'
		, scsa.RecordStartDateTime
		, scsa.RecordEndDateTime
		, NULL 														'MailingAddressCountyAnsiCode'
		, NULL 														'PhysicalAddressCountyAnsiCode,'
	INTO #CharterSchoolAuthorizers
	FROM Staging.CharterSchoolAuthorizer scsa
	JOIN Staging.SourceSystemReferenceData ssrd
		ON ssrd.TableName = 'RefCharterSchoolAuthorizerType'
		AND scsa.CharterSchoolAuthorizerType = ssrd.InputCode
		AND ssrd.SchoolYear = @SchoolYear
	JOIN Staging.StateDetail ssd
		ON scsa.SchoolYear = ssd.SchoolYear
	JOIN #organizationTypes orgTypes
		ON orgTypes.SchoolYear = @SchoolYear
	JOIN #organizationLocationTypes locType
		ON locType.SchoolYear = @SchoolYear
	LEFT JOIN Staging.OrganizationAddress smam
		ON scsa.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea = smam.OrganizationIdentifier
		AND smam.OrganizationType = orgTypes.CharterSchoolAuthorizingOrganization
		AND smam.AddressTypeForOrganization = locType.MailingAddressType
	LEFT JOIN Staging.OrganizationAddress smap
		ON scsa.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea = smap.OrganizationIdentifier
		AND smap.OrganizationType = orgTypes.CharterSchoolAuthorizingOrganization
		AND smap.AddressTypeForOrganization = locType.PhysicalAddressType
	LEFT JOIN Staging.OrganizationPhone sop
		ON scsa.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea = sop.OrganizationIdentifier
		AND sop.OrganizationType = orgTypes.CharterSchoolAuthorizingOrganization
	LEFT JOIN dbo.RefCharterSchoolAuthorizerType refcsat
		ON refcsat.Code = ssrd.OutputCode

-- MERGE INTO DimCharterSchoolAuthorizers
	BEGIN TRY
		MERGE RDS.DimCharterSchoolAuthorizers AS trgt
		USING #CharterSchoolAuthorizers AS src
			ON trgt.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea = src.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea
			AND ISNULL(trgt.RecordStartDateTime, '') = ISNULL(src.RecordStartDateTime, '')
		WHEN MATCHED THEN UPDATE
			SET trgt.CharterSchoolAuthorizingOrganizationOrganizationName 	= src.CharterSchoolAuthorizingOrganizationOrganizationName,							
				trgt.StateAbbreviationCode 									= src.StateAbbreviationCode,
				trgt.StateAnsiCode 											= src.StateAnsiCode,
				trgt.StateAbbreviationDescription 							= src.StateAbbreviationDescription,
				trgt.CharterSchoolAuthorizerTypeCode 						= src.CharterSchoolAuthorizerTypeCode,
				trgt.CharterSchoolAuthorizerTypeDescription 				= src.CharterSchoolAuthorizerTypeDescription,
				trgt.CharterSchoolAuthorizerTypeEdFactsCode					= src.CharterSchoolAuthorizerTypeEdFactsCode,						
				trgt.MailingAddressStreetNumberAndName						= src.MailingAddressStreetNumberAndName,
				trgt.MailingAddressApartmentRoomOrSuiteNumber				= src.MailingAddressApartmentRoomOrSuiteNumber,
				trgt.MailingAddressCity 									= src.MailingAddressCity,
				trgt.MailingAddressStateAbbreviation 						= src.MailingAddressStateAbbreviation,
				trgt.MailingAddressPostalCode 								= src.MailingAddressPostalCode,
				trgt.MailingAddressCountyAnsiCodeCode						= src.MailingAddressCountyAnsiCodeCode,
				trgt.OutOfStateIndicator 									= src.OutOfStateIndicator,
				trgt.PhysicalAddressStreetNumberAndName						= src.PhysicalAddressStreetNumberAndName,
				trgt.PhysicalAddressApartmentRoomOrSuiteNumber				= src.PhysicalAddressApartmentRoomOrSuiteNumber,
				trgt.PhysicalAddressCity 									= src.PhysicalAddressCity,
				trgt.PhysicalAddressStateAbbreviation						= src.PhysicalAddressStateAbbreviation,
				trgt.PhysicalAddressPostalCode								= src.PhysicalAddressPostalCode,
				trgt.PhysicalAddressCountyAnsiCodeCode						= src.PhysicalAddressCountyAnsiCodeCode,
				trgt.TelephoneNumber										= src.TelephoneNumber,
				trgt.WebSiteAddress											= src.WebSiteAddress,
				trgt.RecordEndDateTime 										= src.RecordEndDateTime
		WHEN NOT MATCHED BY TARGET THEN     --- Records Exists in Source but not in Target
		INSERT (
			CharterSchoolAuthorizingOrganizationOrganizationName
			, CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea
			, StateAbbreviationCode
			, StateAnsiCode
			, StateAbbreviationDescription
			, CharterSchoolAuthorizerTypeCode
			, CharterSchoolAuthorizerTypeDescription
			, CharterSchoolAuthorizerTypeEdFactsCode
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
			, TelephoneNumber
			, WebSiteAddress
			, RecordStartDateTime
			, RecordEndDateTime
		)
		VALUES (
			src.CharterSchoolAuthorizingOrganizationOrganizationName
			,src.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea
			, StateAbbreviationCode
			, StateAnsiCode
			, StateAbbreviationDescription
			, src.CharterSchoolAuthorizerTypeCode
			, src.CharterSchoolAuthorizerTypeDescription
			, src.CharterSchoolAuthorizerTypeEdFactsCode
			, src.MailingAddressStreetNumberAndName
			, src.MailingAddressApartmentRoomOrSuiteNumber
			, src.MailingAddressCity
			, src.MailingAddressStateAbbreviation
			, src.MailingAddressPostalCode
			, src.MailingAddressCountyAnsiCodeCode
			, src.OutOfStateIndicator
			, src.PhysicalAddressStreetNumberAndName
			, src.PhysicalAddressApartmentRoomOrSuiteNumber
			, src.PhysicalAddressCity
			, src.PhysicalAddressStateAbbreviation
			, src.PhysicalAddressPostalCode
			, src.PhysicalAddressCountyAnsiCodeCode
			, src.TelephoneNumber
			, src.WebSiteAddress
			, src.RecordStartDateTime
			, src.RecordEndDateTime
		);

		;WITH upd AS(
			SELECT 
				startd.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea
				, startd.RecordStartDateTime
				, min(endd.RecordStartDateTime) - 1 AS RecordEndDateTime 
			FROM RDS.DimCharterSchoolAuthorizers startd
			JOIN RDS.DimCharterSchoolAuthorizers endd
				ON startd.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea = endd.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea
				AND startd.RecordStartDateTime < endd.RecordStartDateTime
			GROUP BY startd.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea, startd.RecordStartDateTime
		) 

		UPDATE charter SET RecordEndDateTime = upd.RecordEndDateTime 
		FROM RDS.DimCharterSchoolAuthorizers charter
		JOIN upd	
			ON charter.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea = upd.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea
			AND charter.RecordStartDateTime = upd.RecordStartDateTime
		WHERE upd.RecordEndDateTime <> '1900-01-01 00:00:00.000'
	
	END TRY
	BEGIN CATCH
		INSERT INTO App.DataMigrationHistories(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) 
		VALUES	(getutcdate(), 2, 'RDS.DimCharterSchoolAuthorizers - Error Occurred - ' + CAST(ERROR_MESSAGE() AS VARCHAR(900)))

	END CATCH
	
END
GO


