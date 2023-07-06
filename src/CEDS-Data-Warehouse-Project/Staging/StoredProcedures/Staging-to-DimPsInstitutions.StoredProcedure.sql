CREATE PROCEDURE [Staging].[Staging-to-DimPsInstitutions]
	@factTypeCode AS VARCHAR(50) = 'directory',
	@dataCollectionName AS VARCHAR(50) = NULL,
	@runAsTest AS BIT 
AS 
BEGIN

	IF NOT EXISTS (SELECT 1 FROM RDS.DimPsInstitutions WHERE DimPsInstitutionid = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimPsInstitutions ON
		INSERT INTO RDS.DimPsInstitutions (DimPsInstitutionId, RecordStartDateTime) VALUES (-1, '1900-01-01')
		SET IDENTITY_INSERT RDS.DimPsInstitutions off
	END

	ALTER INDEX ALL ON RDS.DimPsInstitutions DISABLE

	
	CREATE TABLE #PsInstitutionOrganizationTypes (
		PsInstitutionOrganizationType				VARCHAR(100)
	)

	INSERT INTO #PsInstitutionOrganizationTypes
	SELECT DISTINCT
		InputCode
	FROM Staging.SourceSystemReferenceData 
	WHERE TableName = 'RefOrganizationType' 
		AND TableFilter = '001156' 
		AND OutputCode = 'PostsecondaryInstitution'

	CREATE TABLE #organizationLocationTypes (
		  MailingAddressType					VARCHAR(100)
		, PhysicalAddressType					VARCHAR(100)
	)

	INSERT INTO #organizationLocationTypes
	SELECT DISTINCT
		  mail.InputCode
		, phys.InputCode
	FROM (SELECT SchoolYear, InputCode FROM Staging.SourceSystemReferenceData WHERE TableName = 'RefOrganizationLocationType' AND OutputCode = 'Mailing') mail
	JOIN (SELECT SchoolYear, InputCode FROM Staging.SourceSystemReferenceData WHERE TableName = 'RefOrganizationLocationType' AND OutputCode = 'Physical') phys
		ON mail.SchoolYear = phys.SchoolYear

	----DimPsInstitutions
	;WITH CTE AS 
	( 
		SELECT DISTINCT	
			  spi.[DataCollectionName]                 
			, spi.[OrganizationName]								AS NameOfInstitution
			, spi.[InstitutionIpedsUnitId]							AS IPEDSIdentifier
			, spi.[Website]											AS WebsiteAddress
			, sssrd1.[OutputCode]									AS OrganizationOperationalStatus
			, spi.[OperationalStatusEffectiveDate]     
			, spi.[MostPrevalentLevelOfInstitutionCode]
			, spi.[PredominantCalendarSystem]          
			, smam.[AddressStreetNumberAndName]						AS MailingAddressStreetNumberAndName
			, smam.[AddressApartmentRoomOrSuite]					AS MailingAddressApartmentRoomOrSuiteNumber
			, smam.[AddressCity]									AS MailingAddressCity
			, smam.[StateAbbreviation]								AS MailingAddressStateAbbreviation
			, smam.[AddressPostalCode]								AS MailingAddressPostalCode
			, smam.[AddressCountyAnsiCode]							AS MailingAddressCountyAnsiCode
			, smap.[AddressStreetNumberAndName]						AS PhysicalAddressStreetNumberAndName
			, smap.[AddressApartmentRoomOrSuite]					AS PhysicalAddressApartmentRoomOrSuiteNumber
			, smap.[AddressCity]									AS PhysicalAddressCity
			, smap.[StateAbbreviation]								AS PhysicalAddressStateAbbreviation
			, smap.[AddressPostalCode]								AS PhysicalAddressPostalCode
			, smap.[AddressCountyAnsiCode]							AS PhysicalAddressCountyAnsiCode
			, smap.[Longitude]
			, smap.[Latitude]
			, MIN(spi.[RecordStartDateTime])						AS RecordStartDateTime
		FROM Staging.PsInstitution spi
		LEFT JOIN Staging.OrganizationAddress smam
			ON spi.InstitutionIpedsUnitId = smam.OrganizationIdentifier
			AND smam.OrganizationType in (SELECT PsInstitutionOrganizationType FROM #PsInstitutionOrganizationTypes)
			AND smam.AddressTypeForOrganization IN (SELECT DISTINCT MailingAddressType FROM #organizationLocationTypes)
			AND smam.RecordStartDateTime <= ISNULL(spi.RecordEndDateTime, GETDATE())
			AND ISNULL(smam.RecordEndDateTime, GETDATE()) >= spi.RecordStartDateTime
			AND ISNULL(spi.DataCollectionName, '') = ISNULL(smam.DataCollectionName, '')
		LEFT JOIN Staging.OrganizationAddress smap
			ON spi.InstitutionIpedsUnitId = smap.OrganizationIdentifier
			AND smap.OrganizationType in (SELECT PsInstitutionOrganizationType FROM #PsInstitutionOrganizationTypes)
			AND smap.AddressTypeForOrganization IN (SELECT DISTINCT PhysicalAddressType FROM #organizationLocationTypes)
			AND smap.RecordStartDateTime <= ISNULL(spi.RecordEndDateTime, GETDATE())
			AND ISNULL(smap.RecordEndDateTime, GETDATE()) >= spi.RecordStartDateTime
			AND ISNULL(spi.DataCollectionName, '') = ISNULL(smap.DataCollectionName, '')
		LEFT JOIN Staging.OrganizationPhone sop
			ON spi.InstitutionIpedsUnitId = sop.OrganizationIdentifier
			AND sop.OrganizationType in (SELECT PsInstitutionOrganizationType FROM #PsInstitutionOrganizationTypes)
			AND sop.RecordStartDateTime <= ISNULL(spi.RecordEndDateTime, GETDATE())
			AND ISNULL(sop.RecordEndDateTime, GETDATE()) >= spi.RecordStartDateTime
			AND ISNULL(spi.DataCollectionName, '') = ISNULL(sop.DataCollectionName, '')
		LEFT JOIN staging.SourceSystemReferenceData sssrd1
			ON spi.[OrganizationOperationalStatus] = sssrd1.OutputCode
			AND sssrd1.TableName = 'RefOperationalStatus'
			AND sssrd1.TableFilter = '001418'
			AND spi.SchoolYear = sssrd1.SchoolYear
		WHERE spi.InstitutionIpedsUnitId IS NOT NULL
			AND (@dataCollectionName IS NULL
				OR (
						spi.DataCollectionName = @dataCollectionName
					AND smam.DataCollectionName = @dataCollectionName
					AND smap.DataCollectionName = @dataCollectionName
					AND sop.DataCollectionName = @dataCollectionName
				)
			)
		GROUP BY 
			  spi.[DataCollectionName]                 
			, spi.[OrganizationName]						
			, spi.[InstitutionIpedsUnitId]					
			, spi.[Website]									
			, sssrd1.[OutputCode]							
			, spi.[OperationalStatusEffectiveDate]     
			, spi.[MostPrevalentLevelOfInstitutionCode]
			, spi.[PredominantCalendarSystem]          
			, smam.[AddressStreetNumberAndName]				
			, smam.[AddressApartmentRoomOrSuite]			
			, smam.[AddressCity]							
			, smam.[StateAbbreviation]						
			, smam.[AddressPostalCode]						
			, smam.[AddressCountyAnsiCode]					
			, smap.[AddressStreetNumberAndName]				
			, smap.[AddressApartmentRoomOrSuite]			
			, smap.[AddressCity]							
			, smap.[StateAbbreviation]						
			, smap.[AddressPostalCode]						
			, smap.[AddressCountyAnsiCode]					
			, smap.[Longitude]
			, smap.[Latitude]
	)
	MERGE rds.DimPsInstitutions AS trgt
	USING CTE AS src
		ON trgt.[IPEDSIdentifier] = src.[IPEDSIdentifier]
		AND ISNULL(trgt.RecordStartDateTime, '') = ISNULL(src.RecordStartDateTime, '')
	WHEN MATCHED THEN 
		UPDATE SET 
			  trgt.[NameOfInstitution]                     = src.[NameOfInstitution]                    
			, trgt.[IPEDSIdentifier]                       = src.[IPEDSIdentifier]                      
			, trgt.[OrganizationOperationalStatus]         = src.[OrganizationOperationalStatus]        
			, trgt.[OperationalStatusEffectiveDate]        = src.[OperationalStatusEffectiveDate]       
			, trgt.[MailingAddressStreetNameAndNumber]     = src.[MailingAddressStreetNumberAndName]    
			, trgt.[MailingAddressApartmentRoomOrSuite]    = src.[MailingAddressApartmentRoomOrSuiteNumber]   
			, trgt.[MailingAddressCity]                    = src.[MailingAddressCity]                   
			, trgt.[MailingAddressPostalCode]              = src.[MailingAddressPostalCode]             
			, trgt.[MailingAddressStateAbbreviation]       = src.[MailingAddressStateAbbreviation]      
			, trgt.[MailingAddressCountyAnsiCode]          = src.[MailingAddressCountyAnsiCode]         
			, trgt.[PhysicalAddressStreetNameAndNumber]    = src.[PhysicalAddressStreetNumberAndName]   
			, trgt.[PhysicalAddressApartmentRoomOrSuite]   = src.[PhysicalAddressApartmentRoomOrSuiteNumber]  
			, trgt.[PhysicalAddressCity]                   = src.[PhysicalAddressCity]                  
			, trgt.[PhysicalAddressPostalCode]             = src.[PhysicalAddressPostalCode]            
			, trgt.[PhysicalAddressStateAbbreviation]      = src.[PhysicalAddressStateAbbreviation]     
			, trgt.[PhysicalAddressCountyAnsiCode]         = src.[PhysicalAddressCountyAnsiCode]        
			, trgt.[WebsiteAddress]                        = src.[WebsiteAddress]                       
			, trgt.[Latitude]                              = src.[Latitude]                             
			, trgt.[Longitude]                             = src.[Longitude]                            
			, trgt.[RecordStartDateTime]                   = src.[RecordStartDateTime]                  

	WHEN NOT MATCHED BY TARGET THEN     --- Records Exists IN Source but NOT IN Target
	INSERT (
		  [NameOfInstitution]                    
		, [ShortNameOfInstitution]
		, [IPEDSIdentifier]                      
		, [OrganizationOperationalStatus]        
		, [OperationalStatusEffectiveDate]       
		, [MailingAddressStreetNameAndNumber]    
		, [MailingAddressApartmentRoomOrSuite]   
		, [MailingAddressCity]                   
		, [MailingAddressPostalCode]             
		, [MailingAddressStateAbbreviation]      
		, [MailingAddressCountyAnsiCode]         
		, [PhysicalAddressStreetNameAndNumber]   
		, [PhysicalAddressApartmentRoomOrSuite]  
		, [PhysicalAddressCity]                  
		, [PhysicalAddressPostalCode]            
		, [PhysicalAddressStateAbbreviation]     
		, [PhysicalAddressCountyAnsiCode]        
		, [WebsiteAddress]                       
		, [Latitude]                             
		, [Longitude]                            
		, [RecordStartDateTime]                  
		) 	
	VALUES (
		  src.[NameOfInstitution]        
		, 'MISSING'
		, src.[IPEDSIdentifier]                      
		, src.[OrganizationOperationalStatus]        
		, src.[OperationalStatusEffectiveDate]       
		, src.[MailingAddressStreetNumberAndName]    
		, src.[MailingAddressApartmentRoomOrSuiteNumber]   
		, src.[MailingAddressCity]                   
		, src.[MailingAddressPostalCode]             
		, src.[MailingAddressStateAbbreviation]      
		, src.[MailingAddressCountyAnsiCode]         
		, src.[PhysicalAddressStreetNumberAndName]   
		, src.[PhysicalAddressApartmentRoomOrSuiteNumber]  
		, src.[PhysicalAddressCity]                  
		, src.[PhysicalAddressPostalCode]            
		, src.[PhysicalAddressStateAbbreviation]     
		, src.[PhysicalAddressCountyAnsiCode]        
		, src.[WebsiteAddress]                       
		, src.[Latitude]                             
		, src.[Longitude]                            
		, src.[RecordStartDateTime]                  
		);

	
	;WITH upd AS(
		SELECT 
			  startd.IPEDSIdentifier
			, startd.RecordStartDateTime 
			, DATEADD(D, -1, min(endd.RecordStartDateTime)) AS RecordEndDateTime
		FROM rds.DimPsInstitutions startd
		JOIN rds.DimPsInstitutions endd
			ON startd.IPEDSIdentifier = endd.IPEDSIdentifier
			AND startd.RecordStartDateTime < endd.RecordStartDateTime
		GROUP BY  startd.IPEDSIdentifier, startd.RecordStartDateTime
	) 
	UPDATE PsInstitution SET RecordEndDateTime = upd.RecordEndDateTime -1 
	FROM rds.DimPsInstitutions PsInstitution
	JOIN upd	
		ON PsInstitution.IPEDSIdentifier = upd.IPEDSIdentifier
		AND PsInstitution.RecordStartDateTime = upd.RecordStartDateTime
	WHERE upd.RecordEndDateTime <> '1900-01-01 00:00:00.000'

		
	DROP TABLE #PsInstitutionOrganizationTypes
	DROP TABLE #organizationLocationTypes

	ALTER INDEX ALL ON RDS.DimPsInstitutions REBUILD

END 