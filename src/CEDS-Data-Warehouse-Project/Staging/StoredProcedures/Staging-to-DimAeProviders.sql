CREATE PROCEDURE [Staging].[Staging-to-DimAeProviders]
	@factTypeCode AS VARCHAR(50) = 'directory',
	@dataCollectionName AS VARCHAR(50) = NULL,
	@runAsTest AS BIT 
AS 
BEGIN

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAeProviders WHERE DimAeProviderId = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimAeProviders ON
		INSERT INTO RDS.DimAeProviders (DimAeProviderId, RecordStartDateTime) VALUES (-1, '1900-01-01')
		SET IDENTITY_INSERT RDS.DimAeProviders off
	END

	ALTER INDEX ALL ON RDS.DimAeProviders DISABLE

	
	CREATE TABLE #AeProviderOrganizationTypes (
		AeProviderOrganizationType				VARCHAR(100)
	)

	INSERT INTO #AeProviderOrganizationTypes
	SELECT DISTINCT
		InputCode
	FROM Staging.SourceSystemReferenceData 
	WHERE TableName = 'RefOrganizationType' 
		AND TableFilter = '001156' 
		AND OutputCode = 'AdultEducationProvider'

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

	----DimAeProviders
	;WITH CTE AS 
	( 
		SELECT DISTINCT	
			  spi.[DataCollectionName]                 
			, spi.[NameOfInstitution]								AS NameOfInstitution
            , spi.[ShortNameOfInstitution]                          AS ShortNameOfInstitution
			, spi.[AdultEducationServiceProviderIdentifierSea]			AS AdultEducationServiceProviderIdentifierSea
            , sssrd2.[OutputCode]                                   AS AdultEducationProviderType
            , sssrd3.[OutputCode]                                   AS LevelOfInstitution
			, spi.[WebsiteAddress]								    AS WebsiteAddress
			, sssrd1.[OutputCode]									AS OrganizationOperationalStatus
			, spi.[OperationalStatusEffectiveDate]      
			, smam.[AddressStreetNumberAndName]						AS MailingAddressStreetNumberAndName
			, smam.[AddressApartmentRoomOrSuiteNumber]				AS MailingAddressApartmentRoomOrSuiteNumber
			, smam.[AddressCity]									AS MailingAddressCity
			, smam.[StateAbbreviation]								AS MailingAddressStateAbbreviation
			, smam.[AddressPostalCode]								AS MailingAddressPostalCode
			, smam.[AddressCountyAnsiCodeCode]						AS MailingAddressCountyAnsiCodeCode
			, smap.[AddressStreetNumberAndName]						AS PhysicalAddressStreetNumberAndName
			, smap.[AddressApartmentRoomOrSuiteNumber]				AS PhysicalAddressApartmentRoomOrSuiteNumber
			, smap.[AddressCity]									AS PhysicalAddressCity
			, smap.[StateAbbreviation]								AS PhysicalAddressStateAbbreviation
			, smap.[AddressPostalCode]								AS PhysicalAddressPostalCode
			, smap.[AddressCountyAnsiCodeCode]						AS PhysicalAddressCountyAnsiCodeCode
			, smap.[Longitude]
			, smap.[Latitude]
			, MIN(spi.[RecordStartDateTime])						AS RecordStartDateTime
		FROM Staging.AeProvider spi
		LEFT JOIN Staging.OrganizationAddress smam
			ON spi.AdultEducationServiceProviderIdentifierSea = smam.OrganizationIdentifier
			AND smam.OrganizationType in (SELECT AeProviderOrganizationType FROM #AeProviderOrganizationTypes)
			AND smam.AddressTypeForOrganization IN (SELECT DISTINCT MailingAddressType FROM #organizationLocationTypes)
			AND smam.RecordStartDateTime <= ISNULL(spi.RecordEndDateTime, GETDATE())
			AND ISNULL(smam.RecordEndDateTime, GETDATE()) >= spi.RecordStartDateTime
			AND ISNULL(spi.DataCollectionName, '') = ISNULL(smam.DataCollectionName, '')
		LEFT JOIN Staging.OrganizationAddress smap
			ON spi.AdultEducationServiceProviderIdentifierSea = smap.OrganizationIdentifier
			AND smap.OrganizationType in (SELECT AeProviderOrganizationType FROM #AeProviderOrganizationTypes)
			AND smap.AddressTypeForOrganization IN (SELECT DISTINCT PhysicalAddressType FROM #organizationLocationTypes)
			AND smap.RecordStartDateTime <= ISNULL(spi.RecordEndDateTime, GETDATE())
			AND ISNULL(smap.RecordEndDateTime, GETDATE()) >= spi.RecordStartDateTime
			AND ISNULL(spi.DataCollectionName, '') = ISNULL(smap.DataCollectionName, '')
		LEFT JOIN Staging.OrganizationPhone sop
			ON spi.AdultEducationServiceProviderIdentifierSea = sop.OrganizationIdentifier
			AND sop.OrganizationType in (SELECT AeProviderOrganizationType FROM #AeProviderOrganizationTypes)
			AND sop.RecordStartDateTime <= ISNULL(spi.RecordEndDateTime, GETDATE())
			AND ISNULL(sop.RecordEndDateTime, GETDATE()) >= spi.RecordStartDateTime
			AND ISNULL(spi.DataCollectionName, '') = ISNULL(sop.DataCollectionName, '')
		LEFT JOIN staging.SourceSystemReferenceData sssrd1
			ON spi.[OrganizationOperationalStatus] = sssrd1.InputCode
			AND sssrd1.TableName = 'RefOperationalStatus'
			AND sssrd1.TableFilter = '001418'
			AND spi.ProgramYear = sssrd1.SchoolYear
        LEFT JOIN staging.SourceSystemReferenceData sssrd2
            ON spi.[AdultEducationProviderType] = sssrd2.InputCode
            AND sssrd2.TableName = 'RefOrganizationType'
            AND sssrd2.TableFilter = '001078'
            AND spi.ProgramYear = sssrd2.SchoolYear
        LEFT JOIN staging.SourceSystemReferenceData sssrd3
            ON spi.[LevelOfInstitution] = sssrd3.InputCode
            AND sssrd3.TableName = 'RefLevelOfInstitution'
            AND spi.ProgramYear = sssrd2.SchoolYear
		WHERE spi.AdultEducationServiceProviderIdentifierSea IS NOT NULL
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
			, spi.[NameOfInstitution]
            , spi.[ShortNameOfInstitution]					
			, spi.[AdultEducationServiceProviderIdentifierSea]					
			, spi.[WebsiteAddress]									
			, sssrd1.[OutputCode]
            , sssrd2.[OutputCode]
            , sssrd3.[OutputCode]							
			, spi.[OperationalStatusEffectiveDate]           
			, smam.[AddressStreetNumberAndName]				
			, smam.[AddressApartmentRoomOrSuiteNumber]			
			, smam.[AddressCity]							
			, smam.[StateAbbreviation]						
			, smam.[AddressPostalCode]						
			, smam.[AddressCountyAnsiCodeCode]					
			, smap.[AddressStreetNumberAndName]				
			, smap.[AddressApartmentRoomOrSuiteNumber]			
			, smap.[AddressCity]							
			, smap.[StateAbbreviation]						
			, smap.[AddressPostalCode]						
			, smap.[AddressCountyAnsiCodeCode]					
			, smap.[Longitude]
			, smap.[Latitude]
	)
	MERGE rds.DimAeProviders AS trgt
	USING CTE AS src
		ON trgt.[AdultEducationServiceProviderIdentifierSea] = src.[AdultEducationServiceProviderIdentifierSea]
		AND ISNULL(trgt.RecordStartDateTime, '') = ISNULL(src.RecordStartDateTime, '')
	WHEN MATCHED THEN 
		UPDATE SET 
			  trgt.[NameOfInstitution]                          = src.[NameOfInstitution]
            , trgt.[ShortNameOfInstitution]                     = src.[ShortNameOfInstitution]                    
			, trgt.[AdultEducationServiceProviderIdentifierSea]    = src.[AdultEducationServiceProviderIdentifierSea]
            , trgt.[LevelOfInstitution]                         = src.[LevelOfInstitution]
            , trgt.[AdultEducationProviderType]                 = src.[AdultEducationProviderType]    
			, trgt.[OrganizationOperationalStatus]              = src.[OrganizationOperationalStatus]        
			, trgt.[OperationalStatusEffectiveDate]             = src.[OperationalStatusEffectiveDate]       
			, trgt.[MailingAddressStreetNumberAndName]          = src.[MailingAddressStreetNumberAndName]    
			, trgt.[MailingAddressApartmentRoomOrSuiteNumber]   = src.[MailingAddressApartmentRoomOrSuiteNumber]   
			, trgt.[MailingAddressCity]                         = src.[MailingAddressCity]                   
			, trgt.[MailingAddressPostalCode]                   = src.[MailingAddressPostalCode]             
			, trgt.[MailingAddressStateAbbreviation]            = src.[MailingAddressStateAbbreviation]      
			, trgt.[MailingAddressCountyAnsiCodeCode]           = src.[MailingAddressCountyAnsiCodeCode]         
			, trgt.[PhysicalAddressStreetNumberAndName]         = src.[PhysicalAddressStreetNumberAndName]   
			, trgt.[PhysicalAddressApartmentRoomOrSuiteNumber]  = src.[PhysicalAddressApartmentRoomOrSuiteNumber]  
			, trgt.[PhysicalAddressCity]                        = src.[PhysicalAddressCity]                  
			, trgt.[PhysicalAddressPostalCode]                  = src.[PhysicalAddressPostalCode]            
			, trgt.[PhysicalAddressStateAbbreviation]           = src.[PhysicalAddressStateAbbreviation]     
			, trgt.[PhysicalAddressCountyAnsiCodeCode]          = src.[PhysicalAddressCountyAnsiCodeCode]        
			, trgt.[WebsiteAddress]                             = src.[WebsiteAddress]                       
			, trgt.[Latitude]                                   = src.[Latitude]                             
			, trgt.[Longitude]                                  = src.[Longitude]                            
			, trgt.[RecordStartDateTime]                        = src.[RecordStartDateTime]                  

	WHEN NOT MATCHED BY TARGET THEN     --- Records Exists IN Source but NOT IN Target
	INSERT (
		  [NameOfInstitution]                    
		, [ShortNameOfInstitution]
		, [AdultEducationServiceProviderIdentifierSea]
        , [LevelOfInstitution] 
        , [AdultEducationProviderType]                    
		, [OrganizationOperationalStatus]        
		, [OperationalStatusEffectiveDate]       
		, [MailingAddressStreetNumberAndName]    
		, [MailingAddressApartmentRoomOrSuiteNumber]   
		, [MailingAddressCity]                   
		, [MailingAddressPostalCode]             
		, [MailingAddressStateAbbreviation]      
		, [MailingAddressCountyAnsiCodeCode]         
		, [PhysicalAddressStreetNumberAndName]   
		, [PhysicalAddressApartmentRoomOrSuiteNumber]  
		, [PhysicalAddressCity]                  
		, [PhysicalAddressPostalCode]            
		, [PhysicalAddressStateAbbreviation]     
		, [PhysicalAddressCountyAnsiCodeCode]        
		, [WebsiteAddress]                       
		, [Latitude]                             
		, [Longitude]                            
		, [RecordStartDateTime]                  
		) 	
	VALUES (
		  src.[NameOfInstitution]        
		, src.[ShortNameOfInstitution]
		, src.[AdultEducationServiceProviderIdentifierSea]        
        , src.[LevelOfInstitution] 
        , src.[AdultEducationProviderType]          
		, src.[OrganizationOperationalStatus]        
		, src.[OperationalStatusEffectiveDate]       
		, src.[MailingAddressStreetNumberAndName]    
		, src.[MailingAddressApartmentRoomOrSuiteNumber]   
		, src.[MailingAddressCity]                   
		, src.[MailingAddressPostalCode]             
		, src.[MailingAddressStateAbbreviation]      
		, src.[MailingAddressCountyAnsiCodeCode]         
		, src.[PhysicalAddressStreetNumberAndName]   
		, src.[PhysicalAddressApartmentRoomOrSuiteNumber]  
		, src.[PhysicalAddressCity]                  
		, src.[PhysicalAddressPostalCode]            
		, src.[PhysicalAddressStateAbbreviation]     
		, src.[PhysicalAddressCountyAnsiCodeCode]        
		, src.[WebsiteAddress]                       
		, src.[Latitude]                             
		, src.[Longitude]                            
		, src.[RecordStartDateTime]                  
		);

	
	;WITH upd AS(
		SELECT 
			  startd.AdultEducationServiceProviderIdentifierSea
			, startd.RecordStartDateTime 
			, DATEADD(D, -1, min(endd.RecordStartDateTime)) AS RecordEndDateTime
		FROM rds.DimAeProviders startd
		JOIN rds.DimAeProviders endd
			ON startd.AdultEducationServiceProviderIdentifierSea = endd.AdultEducationServiceProviderIdentifierSea
			AND startd.RecordStartDateTime < endd.RecordStartDateTime
		GROUP BY  startd.AdultEducationServiceProviderIdentifierSea, startd.RecordStartDateTime
	) 
	UPDATE AeProvider SET RecordEndDateTime = upd.RecordEndDateTime -1 
	FROM rds.DimAeProviders AeProvider
	JOIN upd	
		ON AeProvider.AdultEducationServiceProviderIdentifierSea = upd.AdultEducationServiceProviderIdentifierSea
		AND AeProvider.RecordStartDateTime = upd.RecordStartDateTime
	WHERE upd.RecordEndDateTime <> '1900-01-01 00:00:00.000'

		
	DROP TABLE #AeProviderOrganizationTypes
	DROP TABLE #organizationLocationTypes

	ALTER INDEX ALL ON RDS.DimAeProviders REBUILD

END 