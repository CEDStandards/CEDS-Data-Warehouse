CREATE PROCEDURE [Staging].[Staging-to-DimSeas]
	@factTypeCode AS VARCHAR(50) = 'directory',
	@dataCollectionName AS VARCHAR(50) = NULL,
	@runAsTest AS BIT 
AS 
BEGIN

	--Insert the default 'missing' row if it doesn't exist
	IF NOT EXISTS (SELECT 1 FROM RDS.DimSeas WHERE DimSeaID = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimSeas ON
		INSERT INTO RDS.DimSeas (DimSeaId) VALUES (-1)
		SET IDENTITY_INSERT RDS.DimSeas off
	END

	--create and populate the temp tables for OrganizationType and OrganizationLocationType used in the joins
	CREATE TABLE #organizationTypes (
		  SchoolYear							SMALLINT
		, SeaOrganizationType					VARCHAR(20)
	)

	CREATE TABLE #organizationLocationTypes (
		  SchoolYear							SMALLINT
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
		AND OutputCode = 'SEA'

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
			, CASE ssd.StateAbbreviationCode
				WHEN 'AK' THEN 'Alaska'
				WHEN 'AL' THEN 'Alabama'
				WHEN 'AR' THEN 'Arkansas'
				WHEN 'AS' THEN 'American Samoa'
				WHEN 'AZ' THEN 'Arizona'
				WHEN 'CA' THEN 'California'
				WHEN 'CO' THEN 'Colorado'
				WHEN 'CT' THEN 'Connecticut'
				WHEN 'DC' THEN 'District of Columbia'
				WHEN 'DE' THEN 'Delaware'
				WHEN 'FL' THEN 'Florida'
				WHEN 'FM' THEN 'Federated States of Micronesia'
				WHEN 'GA' THEN 'Georgia'
				WHEN 'GU' THEN 'Guam'
				WHEN 'HI' THEN 'Hawaii'
				WHEN 'IA' THEN 'Iowa'
				WHEN 'ID' THEN 'Idaho'
				WHEN 'IL' THEN 'Illinois'
				WHEN 'IN' THEN 'Indiana'
				WHEN 'KS' THEN 'Kansas'
				WHEN 'KY' THEN 'Kentucky'
				WHEN 'LA' THEN 'Louisiana'
				WHEN 'MA' THEN 'Massachusetts'
				WHEN 'MD' THEN 'Maryland'
				WHEN 'ME' THEN 'Maine'
				WHEN 'MH' THEN 'Marshall Islands'
				WHEN 'MI' THEN 'Michigan'
				WHEN 'MN' THEN 'Minnesota'
				WHEN 'MO' THEN 'Missouri'
				WHEN 'MP' THEN 'Northern Marianas'
				WHEN 'MS' THEN 'Mississippi'
				WHEN 'MT' THEN 'Montana'
				WHEN 'NC' THEN 'North Carolina'
				WHEN 'ND' THEN 'North Dakota'
				WHEN 'NE' THEN 'Nebraska'
				WHEN 'NH' THEN 'New Hampshire'
				WHEN 'NJ' THEN 'New Jersey'
				WHEN 'NM' THEN 'New Mexico'
				WHEN 'NV' THEN 'Nevada'
				WHEN 'NY' THEN 'New York'
				WHEN 'OH' THEN 'Ohio'
				WHEN 'OK' THEN 'Oklahoma'
				WHEN 'OR' THEN 'Oregon'
				WHEN 'PA' THEN 'Pennsylvania'
				WHEN 'PR' THEN 'Puerto Rico'
				WHEN 'PW' THEN 'Palau'
				WHEN 'RI' THEN 'Rhode Island'
				WHEN 'SC' THEN 'South Carolina'
				WHEN 'SD' THEN 'South Dakota'
				WHEN 'TN' THEN 'Tennessee'
				WHEN 'TX' THEN 'Texas'
				WHEN 'UT' THEN 'Utah'
				WHEN 'VA' THEN 'Virginia'
				WHEN 'VI' THEN 'Virgin Islands'
				WHEN 'VT' THEN 'Vermont'
				WHEN 'WA' THEN 'Washington'
				WHEN 'WI' THEN 'Wisconsin'
				WHEN 'WV' THEN 'West Virginia'
				WHEN 'WY' THEN 'Wyoming'
				WHEN 'AA' THEN 'Armed Forces America'
				WHEN 'AE' THEN 'Armed Forces Africa, Canada, Europe, and Mideast'
				WHEN 'AP' THEN 'Armed Forces Pacific'
			END AS StateAbbreviationDescription
			, CASE ssd.StateAbbreviationCode
				WHEN 'AK' THEN '02'
				WHEN 'AL' THEN '01'
				WHEN 'AR' THEN '05'
				WHEN 'AS' THEN '60'
				WHEN 'AZ' THEN '04'
				WHEN 'CA' THEN '06'
				WHEN 'CO' THEN '08'
				WHEN 'CT' THEN '09'
				WHEN 'DC' THEN '11'
				WHEN 'DE' THEN '10'
				WHEN 'FL' THEN '12'
				WHEN 'FM' THEN '64'
				WHEN 'GA' THEN '13'
				WHEN 'GU' THEN '66'
				WHEN 'HI' THEN '15'
				WHEN 'IA' THEN '19'
				WHEN 'ID' THEN '16'
				WHEN 'IL' THEN '17'
				WHEN 'IN' THEN '18'
				WHEN 'KS' THEN '20'
				WHEN 'KY' THEN '21'
				WHEN 'LA' THEN '22'
				WHEN 'MA' THEN '25'
				WHEN 'MD' THEN '24'
				WHEN 'ME' THEN '23'
				WHEN 'MH' THEN '68'
				WHEN 'MI' THEN '26'
				WHEN 'MN' THEN '27'
				WHEN 'MO' THEN '29'
				WHEN 'MP' THEN '69'
				WHEN 'MS' THEN '28'
				WHEN 'MT' THEN '30'
				WHEN 'NC' THEN '37'
				WHEN 'ND' THEN '38'
				WHEN 'NE' THEN '31'
				WHEN 'NH' THEN '33'
				WHEN 'NJ' THEN '34'
				WHEN 'NM' THEN '35'
				WHEN 'NV' THEN '32'
				WHEN 'NY' THEN '36'
				WHEN 'OH' THEN '39'
				WHEN 'OK' THEN '40'
				WHEN 'OR' THEN '41'
				WHEN 'PA' THEN '42'
				WHEN 'PR' THEN '72'
				WHEN 'PW' THEN '70'
				WHEN 'RI' THEN '44'
				WHEN 'SC' THEN '45'
				WHEN 'SD' THEN '46'
				WHEN 'TN' THEN '47'
				WHEN 'TX' THEN '48'
				WHEN 'UT' THEN '49'
				WHEN 'VA' THEN '51'
				WHEN 'VI' THEN '78'
				WHEN 'VT' THEN '50'
				WHEN 'WA' THEN '53'
				WHEN 'WI' THEN '55'
				WHEN 'WV' THEN '54'
				WHEN 'WY' THEN '56'
				ELSE NULL
			END AS StateANSICode
			, ssd.SeaOrganizationName
			, ssd.SeaOrganizationShortName
			, ssd.SeaOrganizationIdentifierSea
			, ssd.Sea_WebSiteAddress
			, ssd.SeaContact_FirstName
			, ssd.SeaContact_LastOrSurname
			, ssd.SeaContact_PersonalTitleOrPrefix
			, ssd.SeaContact_ElectronicMailAddress
			, sop.TelephoneNumber
			, ssd.SeaContact_Identifier
			, ssd.SeaContact_PositionTitle
			, smam.AddressStreetNumberAndName AS MailingAddressStreet
			, smam.AddressApartmentRoomOrSuiteNumber AS MailingAddressStreet2
			, smam.AddressCity AS MailingAddressCity
			, smam.StateAbbreviation AS MailingAddressState
			, smam.AddressPostalCode AS MailingAddressPostalCode
			, smam.AddressCountyAnsiCodeCode AS MailingCountyAnsiCode
			, smap.AddressStreetNumberAndName AS PhysicalAddressStreet
			, smap.AddressApartmentRoomOrSuiteNumber AS PhysicalAddressStreet2
			, smap.AddressCity AS PhysicalAddressCity
			, smap.StateAbbreviation AS PhysicalAddressState
			, smap.AddressPostalCode AS PhysicalAddressPostalCode
			, smap.AddressCountyAnsiCodeCode AS PhysicalCountyAnsiCode
			, ssd.RecordStartDateTime 
			, ssd.RecordEndDateTime 
		FROM Staging.StateDetail ssd
		LEFT JOIN Staging.OrganizationAddress smam
			ON ssd.SeaOrganizationIdentifierSea = smam.OrganizationIdentifier
			AND smam.AddressTypeForOrganization = (select MailingAddressType from #organizationLocationTypes lt WHERE lt.SchoolYear = smam.SchoolYear)
			AND smam.OrganizationType in (select SeaOrganizationType from #organizationTypes ot WHERE ot.SchoolYear = smam.SchoolYear)
		LEFT JOIN Staging.OrganizationAddress smap
			ON ssd.SeaOrganizationIdentifierSea = smap.OrganizationIdentifier
			AND smap.AddressTypeForOrganization = (select PhysicalAddressType from #organizationLocationTypes lt WHERE lt.SchoolYear = smap.SchoolYear)
			AND smap.OrganizationType in (select SeaOrganizationType from #organizationTypes ot WHERE ot.SchoolYear = smam.SchoolYear)
		LEFT JOIN Staging.OrganizationPhone sop
			ON ssd.SeaOrganizationIdentifierSea = sop.OrganizationIdentifier
			AND sop.PrimaryTelephoneNumberIndicator = 1
			AND sop.OrganizationType in (select SeaOrganizationType from #organizationTypes ot WHERE ot.SchoolYear = smam.SchoolYear)
		WHERE @DataCollectionName IS NULL	
			OR ssd.DataCollectionName = @dataCollectionName
	)
	MERGE rds.DimSeas AS trgt
	USING CTE AS src
		ON trgt.SeaOrganizationIdentifierSea = src.SeaOrganizationIdentifierSea
		AND ISNULL(trgt.RecordStartDateTime, '') = ISNULL(src.RecordStartDateTime, '')
	WHEN MATCHED THEN 
		UPDATE SET 
			[SeaOrganizationName]			 				= src.[SeaOrganizationName]							
			, [SeaOrganizationIdentifierSea] 				= src.[SeaOrganizationIdentifierSea]
			, [StateAnsiCode]				 				= src.[StateANSICode]
			, [StateAbbreviationCode]		 				= src.[StateAbbreviationCode]
			, [StateAbbreviationDescription] 				= src.[StateAbbreviationDescription]
			, [MailingAddressCity]			 				= src.[MailingAddressCity]
			, [MailingAddressPostalCode]	 				= src.[MailingAddressPostalCode]
			, [MailingAddressStateAbbreviation]			 	= src.[MailingAddressState]
			, [MailingAddressStreetNumberAndName]		 	= src.[MailingAddressStreet]
			, [PhysicalAddressCity]			 				= src.[PhysicalAddressCity]
			, [PhysicalAddressPostalCode]	 				= src.[PhysicalAddressPostalCode]
			, [PhysicalAddressStateAbbreviation]		 	= src.[PhysicalAddressState]
			, [PhysicalAddressStreetNumberAndName]		 	= src.[PhysicalAddressStreet]
			, [TelephoneNumber]				 				= src.[TelephoneNumber]
			, [WebsiteAddress]				 				= src.[Sea_WebSiteAddress]
			, [RecordStartDateTime]			 				= src.[RecordStartDateTime]
			, [RecordEndDateTime]			 				= src.[RecordEndDateTime]
			, [MailingAddressApartmentRoomOrSuiteNumber]	= src.[MailingAddressStreet2]
			, [PhysicalAddressApartmentRoomOrSuiteNumber]	= src.[PhysicalAddressStreet2]
			, [MailingAddressCountyAnsiCodeCode]		 	= src.[MailingCountyAnsiCode]
			, [PhysicalAddressCountyAnsiCodeCode]		 	= src.[PhysicalCountyAnsiCode]
	WHEN NOT MATCHED BY TARGET THEN     --- Records Exists IN Source but NOT IN Target
	INSERT (
		[SeaOrganizationName]
		, [SeaOrganizationIdentifierSea]
		, [StateAnsiCode]
		, [StateAbbreviationCode]
		, [StateAbbreviationDescription]
		, [MailingAddressCity]
		, [MailingAddressPostalCode]
		, [MailingAddressStateAbbreviation]
		, [MailingAddressStreetNumberAndName]
		, [PhysicalAddressCity]
		, [PhysicalAddressPostalCode]
		, [PhysicalAddressStateAbbreviation]
		, [PhysicalAddressStreetNumberAndName]
		, [TelephoneNumber]
		, [WebsiteAddress]
		, [RecordStartDateTime]
		, [RecordEndDateTime]
		, [MailingAddressApartmentRoomOrSuiteNumber]
		, [PhysicalAddressApartmentRoomOrSuiteNumber]
		, [MailingAddressCountyAnsiCodeCode]
		, [PhysicalAddressCountyAnsiCodeCode]
	) 	
	VALUES (
		src.[SeaOrganizationName]						
		, src.[SeaOrganizationIdentifierSea]
		, src.[StateANSICode]
		, src.[StateAbbreviationCode]
		, src.[StateAbbreviationDescription]
		, src.[MailingAddressCity]
		, src.[MailingAddressPostalCode]
		, src.[MailingAddressState]
		, src.[MailingAddressStreet]
		, src.[PhysicalAddressCity]
		, src.[PhysicalAddressPostalCode]
		, src.[PhysicalAddressState]
		, src.[PhysicalAddressStreet]
		, src.[TelephoneNumber]
		, src.[Sea_WebSiteAddress]
		, src.[RecordStartDateTime]
		, src.[RecordEndDateTime]
		, src.[MailingAddressStreet2]
		, src.[PhysicalAddressStreet2]
		, src.[MailingCountyAnsiCode]
		, src.[PhysicalCountyAnsiCode]
	);

	--update the RecordEndDate of the previous record (if one exists)
	;WITH upd AS(
		SELECT 
			  startd.SeaOrganizationIdentifierSea
			, startd.RecordStartDateTime 
			, min(endd.RecordStartDateTime) - 1 AS RecordEndDateTime
		FROM rds.DimSeas startd
		JOIN rds.DimSeas endd
			ON startd.SeaOrganizationIdentifierSea = endd.SeaOrganizationIdentifierSea
			AND startd.RecordStartDateTime < endd.RecordStartDateTime
		GROUP BY  startd.SeaOrganizationIdentifierSea, startd.RecordStartDateTime
	) 
	UPDATE sea SET RecordEndDateTime = upd.RecordEndDateTime 
	FROM rds.DimSeas sea
	JOIN upd	
		ON sea.SeaOrganizationIdentifierSea = upd.SeaOrganizationIdentifierSea
		AND sea.RecordStartDateTime = upd.RecordStartDateTime
	
	--cleanup
	DROP TABLE #organizationTypes
	DROP TABLE #organizationLocationTypes

	-----------------------------------------------------
	-- Insert DimK12Staff for State Officer
	-----------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimPeople WHERE DimPersonId = -1)
	BEGIN
		--Insert the default 'missing' row if it doesn't exist
		SET IDENTITY_INSERT RDS.DimPeople ON
		INSERT INTO RDS.DimPeople (DimPersonId) VALUES (-1)
		SET IDENTITY_INSERT RDS.DimPeople OFF
	END

	--Create and populate the temp table for staff data	
	CREATE TABLE #People (
		BirthDate								DATE NULL
		, FirstName								NVARCHAR(50) NULL
		, LastOrSurname							NVARCHAR(50) NULL
		, MiddleName							NVARCHAR(50) NULL
		, K12StaffStaffMemberIdentifierState	NVARCHAR(50) NULL
		, IsActiveK12Staff				BIT NULL
		, RecordStartDateTime					DATETIME	
		, RecordEndDateTime						DATETIME	NULL
	)
		
	INSERT INTO #People (
		BirthDate
		, FirstName
		, LastOrSurname
		, MiddleName
		, K12StaffStaffMemberIdentifierState
		, IsActiveK12Staff
		, RecordStartDateTime
		, RecordEndDateTime
	)		
	SELECT DISTINCT
		NULL 											AS Birthdate
		, SeaContact_FirstName							AS FirstName
		, ISNULL(SeaContact_LastOrSurname, 'MISSING') 	AS LastOrSurname
		, NULL 											AS MiddleName
		, SeaContact_Identifier							AS K12StaffStaffMemberIdentifierState
		, 1 											AS IsActiveK12Staff
		, RecordStartDateTime							AS RecordStartDateTime
		, RecordEndDateTime								AS RecordEndDateTime
	FROM Staging.StateDetail

	MERGE rds.DimPeople AS trgt
	USING #People AS src
			ON  trgt.K12StaffStaffMemberIdentifierState = src.K12StaffStaffMemberIdentifierState
			AND ISNULL(trgt.FirstName, '') 				= ISNULL(src.FirstName, '')
			AND ISNULL(trgt.LastOrSurname, '') 			= ISNULL(src.LastOrSurname, '')
			AND ISNULL(trgt.MiddleName, '') 			= ISNULL(src.MiddleName, '')
			AND ISNULL(trgt.BirthDate, '1900-01-01') 	= ISNULL(src.BirthDate, '1900-01-01')
			AND trgt.RecordStartDateTime 				= src.RecordStartDateTime
			AND src.IsActiveK12Staff = 1
	WHEN NOT MATCHED BY TARGET THEN     --- Records Exists in Source but NOT in Target
	INSERT (
		BirthDate
		, FirstName
		, LastOrSurname
		, MiddleName
		, K12StaffStaffMemberIdentifierState
		, IsActiveK12Staff
		, RecordStartDateTime
	)
	VALUES (
		src.Birthdate
		, src.FirstName
		, src.LastOrSurname
		, src.MiddleName
		, src.K12StaffStaffMemberIdentifierState
		, 1
		, src.RecordStartDateTime
	);

	-- UPDATE staff 
	-- SET RecordEndDateTime = NULL
	-- FROM rds.DimPeople staff

	--set the RecordEndDate for previous records (if they exist)
	;WITH upd AS (
		SELECT 
			startd.K12StaffStaffMemberIdentifierState
			, startd.RecordStartDateTime
			, convert(datetime, min(endd.RecordStartDateTime)) - 1 AS RecordEndDateTime
		FROM rds.DimPeople startd
		JOIN rds.DimPeople endd
			ON startd.K12StaffStaffMemberIdentifierState = endd.K12StaffStaffMemberIdentifierState
			AND startd.RecordStartDateTime < endd.RecordStartDateTime
		GROUP BY startd.K12StaffStaffMemberIdentifierState, startd.RecordStartDateTime
	) 
	UPDATE staff 
	SET RecordEndDateTime = upd.RecordEndDateTime
	FROM rds.DimPeople staff
	INNER JOIN upd
		ON staff.K12StaffStaffMemberIdentifierState = upd.K12StaffStaffMemberIdentifierState
		AND staff.RecordStartDateTime = upd.RecordStartDateTime
	WHERE upd.RecordEndDateTime <> '1900-01-01 00:00:00.000'
		AND staff.RecordEndDateTime IS NULL	

	--cleanup
	DROP TABLE #People

END 	