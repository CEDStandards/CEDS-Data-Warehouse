CREATE PROCEDURE [Staging].[Staging-to-DimIeus]
	@factTypeCode AS VARCHAR(50) = 'directory',
	@dataCollectionName AS VARCHAR(50) = NULL,
	@runAsTest AS BIT 
AS 
BEGIN

	IF NOT EXISTS (SELECT 1 FROM RDS.DimIeus WHERE DimIeuID = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimIeus ON
		INSERT INTO RDS.DimIeus (DimIeuId, OutOfStateIndicator, RecordStartDateTime) VALUES (-1, 0, '1900-01-01')
		SET IDENTITY_INSERT RDS.DimIeus off
	END
	
	CREATE TABLE #IeuOrganizationTypes (
		IeuOrganizationType				VARCHAR(20)
	)

	INSERT INTO #IeuOrganizationTypes
	SELECT DISTINCT
		InputCode
	FROM Staging.SourceSystemReferenceData 
	WHERE TableName = 'RefOrganizationType' 
		AND TableFilter = '001156' 
		AND OutputCode = 'IEU'

	CREATE TABLE #organizationLocationTypes (
		  MailingAddressType					VARCHAR(20)
		, PhysicalAddressType					VARCHAR(20)
	)

	INSERT INTO #organizationLocationTypes
	SELECT DISTINCT
		  mail.InputCode
		, phys.InputCode
	FROM (SELECT SchoolYear, InputCode FROM Staging.SourceSystemReferenceData WHERE TableName = 'RefOrganizationLocationType' AND OutputCode = 'Mailing') mail
	JOIN (SELECT SchoolYear, InputCode FROM Staging.SourceSystemReferenceData WHERE TableName = 'RefOrganizationLocationType' AND OutputCode = 'Physical') phys
		ON mail.SchoolYear = phys.SchoolYear

	----DimIeus
	SELECT DISTINCT	
			ssd.StateAbbreviationCode
		, ssd.SeaOrganizationName
		, ssd.SeaOrganizationShortName
		, ssd.SeaOrganizationIdentifierSea
		, NULL AS StateAbbreviationDescription
		, sko.IEU_OrganizationName AS IeuOrganizationName
		, sko.IeuIdentifierSea AS IeuOrganizationIdentifierSea
		, sko.IEU_WebSiteAddress				 AS WebSiteAddress
		, smam.AddressStreetNumberAndName AS MailingAddressStreetNumberAndName
		, smam.AddressApartmentRoomOrSuiteNumber AS MailingAddressApartmentRoomOrSuiteNumber
		, smam.AddressCity AS MailingAddressCity
		, smam.StateAbbreviation AS MailingAddressStateAbbreviation
		, smam.AddressPostalCode AS MailingAddressPostalCode
		, smam.AddressCountyAnsiCodeCode AS MailingAddressCountyAnsiCode
		, CASE 
			WHEN smap.StateAbbreviation <> ssd.StateAbbreviationCode 
				OR smam.StateAbbreviation <> ssd.StateAbbreviationCode THEN '1' 
			ELSE 0 
			END AS OutOfStateIndicator
		, smap.AddressStreetNumberAndName AS PhysicalAddressStreetNumberAndName
		, smap.AddressApartmentRoomOrSuiteNumber AS PhysicalAddressApartmentRoomOrSuiteNumber
		, smap.AddressCity AS PhysicalAddressCity
		, smap.StateAbbreviation AS PhysicalAddressStateAbbreviation
		, smap.AddressPostalCode AS PhysicalAddressPostalCode
		, smap.AddressCountyAnsiCodeCode AS PhysicalAddressCountyAnsiCode
		, smap.Latitude
		, smap.Longitude
		, sssrd1.OutputCode AS OrganizationOperationalStatus
		, sko.Ieu_OperationalStatusEffectiveDate AS OperationalStatusEffectiveDate
		, sko.Ieu_RecordStartDateTime AS RecordStartDateTime
		, sko.Ieu_RecordEndDateTime AS RecordEndDateTime
	INTO #Ieus
	FROM Staging.K12Organization sko
	JOIN Staging.StateDetail ssd
		ON sko.SchoolYear = ssd.SchoolYear
	LEFT JOIN Staging.OrganizationAddress smam
		ON sko.IeuIdentifierSea = smam.OrganizationIdentifier
		AND ISNULL(sko.DataCollectionName, '') = ISNULL(smam.DataCollectionName, '')
		AND smam.OrganizationType in (SELECT IeuOrganizationType FROM #IeuOrganizationTypes)
		AND smam.AddressTypeForOrganization IN (SELECT DISTINCT MailingAddressType FROM #organizationLocationTypes)
	LEFT JOIN Staging.OrganizationAddress smap
		ON sko.IeuIdentifierSea = smap.OrganizationIdentifier
		AND ISNULL(sko.DataCollectionName, '') = ISNULL(smap.DataCollectionName, '')
		AND smap.OrganizationType in (SELECT IeuOrganizationType FROM #IeuOrganizationTypes)
		AND smap.AddressTypeForOrganization IN (SELECT DISTINCT PhysicalAddressType FROM #organizationLocationTypes)
	LEFT JOIN Staging.OrganizationPhone sop
		ON sko.IeuIdentifierSea = sop.OrganizationIdentifier
		AND ISNULL(sko.DataCollectionName, '') = ISNULL(sop.DataCollectionName, '')
		AND sop.OrganizationType in (SELECT IeuOrganizationType FROM #IeuOrganizationTypes)
		AND sko.DataCollectionName = sop.DataCollectionName
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON sko.IEU_OrganizationOperationalStatus = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefOperationalStatus'
		AND sssrd1.TableFilter = '001418'
		AND sko.SchoolYear = sssrd1.SchoolYear
	WHERE sko.IeuIdentifierSea IS NOT NULL
		AND (@dataCollectionName IS NULL
			OR (
					sko.DataCollectionName = @dataCollectionName
			)
		)

	CREATE INDEX IX_Ieus ON #Ieus (IeuOrganizationIdentifierSea ASC, RecordStartDateTime ASC)

	
	MERGE rds.DimIeus AS trgt
	USING #Ieus AS src
		ON trgt.IeuOrganizationIdentifierSea = src.IeuOrganizationIdentifierSea 
		AND ISNULL(trgt.RecordStartDateTime, '') = ISNULL(src.RecordStartDateTime, '')
	WHEN MATCHED THEN 
		UPDATE SET 
			  trgt.IeuOrganizationName							 = src.IeuOrganizationName
			, trgt.IeuOrganizationIdentifierSea					 = src.IeuOrganizationIdentifierSea
			, trgt.SeaOrganizationName							 = src.SeaOrganizationName
			, trgt.SeaOrganizationIdentifierSea					 = src.SeaOrganizationIdentifierSea
			, trgt.StateANSICode								 = src.SeaOrganizationIdentifierSea
			, trgt.StateAbbreviationCode						 = src.StateAbbreviationCode
			, trgt.StateAbbreviationDescription					 = src.StateAbbreviationDescription
			, trgt.MailingAddressStreetNumberAndName			 = src.MailingAddressStreetNumberAndName
			, trgt.MailingAddressApartmentRoomOrSuiteNumber		 = src.MailingAddressApartmentRoomOrSuiteNumber
			, trgt.MailingAddressCity							 = src.MailingAddressCity
			, trgt.MailingAddressStateAbbreviation				 = src.MailingAddressStateAbbreviation
			, trgt.MailingAddressPostalCode						 = src.MailingAddressPostalCode
			, trgt.MailingAddressCountyAnsiCodeCode				 = src.MailingAddressCountyAnsiCode
			, trgt.OutOfStateIndicator							 = src.OutOfStateIndicator
			, trgt.OrganizationOperationalStatus				 = src.OrganizationOperationalStatus
			, trgt.OperationalStatusEffectiveDate				 = src.OperationalStatusEffectiveDate
			, trgt.PhysicalAddressStreetNumberAndName			 = src.PhysicalAddressStreetNumberAndName
			, trgt.PhysicalAddressApartmentRoomOrSuiteNumber	 = src.PhysicalAddressApartmentRoomOrSuiteNumber
			, trgt.PhysicalAddressCity							 = src.PhysicalAddressCity
			, trgt.PhysicalAddressPostalCode					 = src.PhysicalAddressPostalCode
			, trgt.PhysicalAddressStateAbbreviation				 = src.PhysicalAddressStateAbbreviation
			, trgt.PhysicalAddressCountyAnsiCodeCode			 = src.PhysicalAddressCountyAnsiCode
			, trgt.WebSiteAddress								 = src.WebSiteAddress
			, trgt.Latitude										 = src.Latitude
			, trgt.Longitude									 = src.Longitude
			, trgt.RecordStartDateTime							 = src.RecordStartDateTime
			, trgt.RecordEndDateTime							 = src.RecordEndDateTime
	WHEN NOT MATCHED BY TARGET THEN     --- Records Exists IN Source but NOT IN Target
	INSERT (
		  IeuOrganizationName
		, IeuOrganizationIdentifierSea
		, SeaOrganizationName
		, SeaOrganizationIdentifierSea
		, StateANSICode
		, StateAbbreviationCode
		, StateAbbreviationDescription
		, MailingAddressStreetNumberAndName
		, MailingAddressApartmentRoomOrSuiteNumber
		, MailingAddressCity
		, MailingAddressStateAbbreviation
		, MailingAddressPostalCode
		, MailingAddressCountyAnsiCodeCode
		, OutOfStateIndicator
		, OrganizationOperationalStatus
		, OperationalStatusEffectiveDate
		, PhysicalAddressStreetNumberAndName
		, PhysicalAddressApartmentRoomOrSuiteNumber
		, PhysicalAddressCity
		, PhysicalAddressPostalCode
		, PhysicalAddressStateAbbreviation
		, PhysicalAddressCountyAnsiCodeCode
		, WebSiteAddress
		, Latitude
		, Longitude
		, RecordStartDateTime
		, RecordEndDateTime
		) 	
	VALUES (
		  src.IeuOrganizationName
		, src.IeuOrganizationIdentifierSea
		, src.SeaOrganizationName
		, src.SeaOrganizationIdentifierSea
		, src.SeaOrganizationIdentifierSea
		, src.StateAbbreviationCode
		, src.StateAbbreviationDescription
		, src.MailingAddressStreetNumberAndName
		, src.MailingAddressApartmentRoomOrSuiteNumber
		, src.MailingAddressCity
		, src.MailingAddressStateAbbreviation
		, src.MailingAddressPostalCode
		, src.MailingAddressCountyAnsiCode
		, src.OutOfStateIndicator
		, src.OrganizationOperationalStatus
		, src.OperationalStatusEffectiveDate
		, src.PhysicalAddressStreetNumberAndName
		, src.PhysicalAddressApartmentRoomOrSuiteNumber
		, src.PhysicalAddressCity
		, src.PhysicalAddressPostalCode
		, src.PhysicalAddressStateAbbreviation
		, src.PhysicalAddressCountyAnsiCode
		, src.WebSiteAddress
		, src.Latitude
		, src.Longitude
		, src.RecordStartDateTime
		, src.RecordEndDateTime
		);

	
	;WITH upd AS(
		SELECT 
			  startd.IeuOrganizationIdentifierSea
			, startd.RecordStartDateTime 
			, min(endd.RecordStartDateTime) - 1 AS RecordEndDateTime
		FROM rds.DimIeus startd
		JOIN rds.DimIeus endd
			ON startd.IeuOrganizationIdentifierSea = endd.IeuOrganizationIdentifierSea
			AND startd.RecordStartDateTime < endd.RecordStartDateTime
		GROUP BY  startd.IeuOrganizationIdentifierSea, startd.RecordStartDateTime
	) 
	UPDATE Ieu SET RecordEndDateTime = upd.RecordEndDateTime
	FROM rds.DimIeus Ieu
	JOIN upd	
		ON Ieu.IeuOrganizationIdentifierSea = upd.IeuOrganizationIdentifierSea
		AND Ieu.RecordStartDateTime = upd.RecordStartDateTime
	WHERE upd.RecordEndDateTime <> '1900-01-01 00:00:00.000'


	DROP TABLE #IeuOrganizationTypes
	DROP TABLE #organizationLocationTypes
	DROP TABLE #Ieus

END