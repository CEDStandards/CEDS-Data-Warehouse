CREATE PROCEDURE [Staging].[Staging-to-DimEducationOrganizationNetworks]
	@factTypeCode AS VARCHAR(50) = 'directory',
	@dataCollectionName AS VARCHAR(50) = NULL,
	@runAsTest AS BIT 
AS 
BEGIN

	IF NOT EXISTS (SELECT 1 FROM RDS.DimEducationOrganizationNetworks WHERE DimEducationOrganizationNetworkID = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimEducationOrganizationNetworks ON
		INSERT INTO RDS.DimEducationOrganizationNetworks (DimEducationOrganizationNetworkId, RecordStartDateTime) VALUES (-1, '1900-01-01')
		SET IDENTITY_INSERT RDS.DimEducationOrganizationNetworks off
	END
	
	----DimEducationOrganizationNetworks
	;WITH CTE AS 
	( 
		SELECT DISTINCT	
			  seon.[EducationOrganizationNetworkOrganizationName]	AS OrganizationName
			, ssrd.OutputCode										AS OrganizationTypeCode
			, CASE ssrd.OutputCode										
				WHEN 'Employer'								   THEN 'Employer'
				WHEN 'K12School'							   THEN 'K12 School'
				WHEN 'LEA'									   THEN 'Local Education Agency (LEA)'
				WHEN 'IEU'									   THEN 'Intermediate Educational Unit (IEU)'
				WHEN 'SEA'									   THEN 'State Education Agency (SEA)'
				WHEN 'Recruiter'							   THEN 'Recruiter'
				WHEN 'EmployeeBenefitCarrier'				   THEN 'Employee Benefit Carrier'
				WHEN 'EmployeeBenefitContributor'			   THEN 'Employee Benefit Contributor'
				WHEN 'ProfessionalMembershipOrganization'	   THEN 'Professional Membership Organization'
				WHEN 'EducationInstitution'					   THEN 'Education Institution'
				WHEN 'StaffDevelopmentProvider'				   THEN 'Staff Development Provider'
				WHEN 'Facility'								   THEN 'Facility'
				WHEN 'Course'								   THEN 'Course'
				WHEN 'CourseSection'						   THEN 'Course Section'
				WHEN 'Program'								   THEN 'Program'
				WHEN 'AdultEducationProvider'				   THEN 'Adult Education Provider'
				WHEN 'ServiceProvider'						   THEN 'Service Provider'
				WHEN 'AffiliatedInstitution'				   THEN 'Affiliated Institution'
				WHEN 'GoverningBoard'						   THEN 'Governing Board'
				WHEN 'CredentialingOrganization'			   THEN 'Credentialing Organization'
				WHEN 'AccreditingOrganization'				   THEN 'Accrediting Organization'
				WHEN 'EducationOrganizationNetwork'			   THEN 'Education Organization Network'
				WHEN 'IDEAPartCLeadAgency'					   THEN 'IDEA Part C Lead Agency'
				WHEN 'CharterSchoolManagementOrganization'	   THEN 'Charter School Management Organization'
				WHEN 'CharterSchoolAuthorizingOrganization'	   THEN 'Charter School Authorizing Organization'
				WHEN 'EmergencyResponseAgency'				   THEN 'Emergency Response Agency'
				WHEN 'LEANotFederal'						   THEN 'Local Education Agency (LEA) Not Reported Federally'
				WHEN 'K12SchoolNotFederal'					   THEN 'K12 School Not Reported Federally'
			  END AS OrganizationTypeDescription
			, seon.[EducationOrganizationNetworkIdentifierSea]							AS OrganizationIdentifierSea
			, seon.RecordStartDateTime								AS RecordStartDateTime
			, seon.RecordEndDateTime								AS RecordEndDateTime
		FROM Staging.EducationOrganizationNetwork seon
		LEFT JOIN Staging.SourceSystemReferenceData ssrd
			ON seon.[EducationOrganizationNetworkTypeCode] = ssrd.InputCode
			AND seon.SchoolYear = ssrd.SchoolYear
			AND ssrd.TableName = 'RefOrganizationType'
			AND ssrd.TableFilter = '001156'
		WHERE seon.[EducationOrganizationNetworkIdentifierSea] IS NOT NULL
			AND (@dataCollectionName IS NULL
				OR seon.DataCollectionName = @dataCollectionName
			)

	)
	MERGE rds.DimEducationOrganizationNetworks AS trgt
	USING CTE AS src
		ON trgt.OrganizationIdentifierSea = src.OrganizationIdentifierSea 
		AND ISNULL(trgt.RecordStartDateTime, '') = ISNULL(src.RecordStartDateTime, '')
	WHEN MATCHED THEN 
		UPDATE SET 
			  trgt.[OrganizationIdentifierSea]                   = src.OrganizationIdentifierSea  
			, trgt.[OrganizationTypeCode]                        = src.OrganizationTypeCode
			, trgt.[OrganizationTypeDescription]                 = src.OrganizationTypeDescription
			, trgt.[OrganizationName]                            = src.OrganizationName           
			, trgt.[RecordStartDateTime]                         = src.RecordStartDateTime        
			, trgt.[RecordEndDateTime]                           = src.RecordEndDateTime          
	WHEN NOT MATCHED BY TARGET THEN     --- Records Exists IN Source but NOT IN Target
	INSERT (
		  [OrganizationIdentifierSea]  
		, [OrganizationTypeCode]       
		, [OrganizationTypeDescription]
		, [OrganizationName]           
		, [RecordStartDateTime]        
		, [RecordEndDateTime]          

		) 	
	VALUES (
		  src.OrganizationIdentifierSea  
		, src.OrganizationTypeCode       
		, src.OrganizationTypeDescription
		, src.OrganizationName           
		, src.RecordStartDateTime        
		, src.RecordEndDateTime          
		);

	
	;WITH upd AS(
		SELECT 
			  startd.[OrganizationIdentifierSea]
			, startd.RecordStartDateTime 
			, min(endd.RecordStartDateTime) - 1 AS RecordEndDateTime
		FROM rds.DimEducationOrganizationNetworks startd
		JOIN rds.DimEducationOrganizationNetworks endd
			ON startd.[OrganizationIdentifierSea] = endd.[OrganizationIdentifierSea]
			AND startd.RecordStartDateTime < endd.RecordStartDateTime
		GROUP BY  startd.[OrganizationIdentifierSea], startd.RecordStartDateTime
	) 
	UPDATE EducationOrganizationNetwork SET RecordEndDateTime = upd.RecordEndDateTime -1 
	FROM rds.DimEducationOrganizationNetworks EducationOrganizationNetwork
	JOIN upd	
		ON EducationOrganizationNetwork.[OrganizationIdentifierSea] = upd.[OrganizationIdentifierSea]
		AND EducationOrganizationNetwork.RecordStartDateTime = upd.RecordStartDateTime
	WHERE upd.RecordEndDateTime <> '1900-01-01 00:00:00.000'

	ALTER INDEX ALL ON RDS.DimEducationOrganizationNetworks REBUILD

END
GO

