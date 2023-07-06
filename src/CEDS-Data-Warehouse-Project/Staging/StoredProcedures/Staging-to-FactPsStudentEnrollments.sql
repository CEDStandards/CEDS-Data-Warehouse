CREATE  PROCEDURE Staging.[Staging-To-FactPsStudentEnrollments]
	@DataCollectionName	VARCHAR(60) = NULL
AS
BEGIN
	--ALTER INDEX ALL ON RDS.FactPsStudentEnrollments DISABLE

	INSERT INTO RDS.FactPsStudentEnrollments	
		(
				[SchoolYearId]                 
			, [DataCollectionId]             
			, [EnrollmentEntryDateId]                  
			, [EnrollmentExitDateId]                   
			, [EntryDateIntoPostSecondaryId] 
			, [AcademicTermDesignatorId]     
			, [PsEnrollmentStatusId]         
			, [PsInstitutionStatusId]        
			, [PsInstitutionID]              
			, [PsStudentId]                  
			, [StudentCount]                 
		)
	SELECT DISTINCT
			rsy.DimSchoolYearId
		, ISNULL(rddc.DimDataCollectionId, -1)				AS DimDataCollectionId
		, ISNULL(entryDate.DimDateId, -1)					AS EntryDate
		, ISNULL(exitDate.DimDateId, -1)					AS ExitDate
		, ISNULL(psEntryDate.DimDateId, -1)					AS EntryDateIntoPostSecondaryId
		, ISNULL(rdatd.DimAcademicTermDesignatorId, -1)		AS DimAcademicTermDesignatorId
		, ISNULL(rdpes.DimPsEnrollmentStatusId, -1)			AS DimPsEnrollmentStatusId
		, ISNULL(rdpsis.DimPsInstitutionStatusId, -1)		AS DimPsInstitutionStatusId
		, rdpi.DimPsInstitutionId
		, rdp.DimPersonId
		, 1
	FROM Staging.PsStudentEnrollment spse
	INNER JOIN Staging.PsInstitution spi
		ON spse.InstitutionIpedsUnitId = spi.InstitutionIpedsUnitId
		AND spse.SchoolYear = spi.SchoolYear
		AND spse.DataCollectionName = spi.DataCollectionName
	INNER JOIN RDS.DimDataCollections rddc
		ON spse.DataCollectionName = rddc.DataCollectionName
	INNER JOIN RDS.DimSchoolYears rsy
		ON spse.SchoolYear = rsy.SchoolYear
	INNER JOIN RDS.DimPsInstitutions rdpi
		ON spse.[InstitutionIpedsUnitId] = rdpi.IPEDSIdentifier
		AND spse.EntryDate BETWEEN rdpi.RecordStartDateTime AND ISNULL(rdpi.RecordEndDateTime, GETDATE())
	INNER JOIN Staging.SourceSystemReferenceData sssrd
		ON sssrd.SchoolYear = rsy.SchoolYear
		AND sssrd.TableName = 'RefSex'
		AND spse.Sex = sssrd.InputCode
	LEFT JOIN RDS.DimPeople rdp
		ON spse.StudentIdentifierState = rdp.PsStudentIdentifierState
		AND ISNULL(spse.FirstName, '') = ISNULL(rdp.FirstName, '')
		AND ISNULL(spse.MiddleName, '') = ISNULL(rdp.MiddleName, '')
		AND ISNULL(spse.LastOrSurname, 'MISSING') = ISNULL(rdp.LastOrSurname, 'MISSING')
		AND ISNULL(spse.Birthdate, '1/1/1900') = ISNULL(rdp.BirthDate, '1/1/1900')
		AND spse.EntryDate BETWEEN rdp.RecordStartDatetime AND ISNULL(rdp.RecordEndDatetime , GETDATE())
	LEFT JOIN RDS.vwDimAcademicTermDesignators rdatd
		ON spse.AcademicTermDesignator = rdatd.AcademicTermDesignatorMap
		AND spse.SchoolYear = rdatd.SchoolYear
	LEFT JOIN RDS.vwDimPsInstitutionStatuses rdpsis
		ON rdpsis.[LevelOfInstitutionCode] = 'MISSING'
		AND rdpsis.[ControlOfInstitutionCode] = 'MISSING'
		AND rdpsis.[CarnegieBasicClassificationCode] = 'MISSING'
		AND (rdpsis.[MostPrevalentLevelOfInstitutionMap] = spi.MostPrevalentLevelOfInstitutionCode 
			OR (spi.MostPrevalentLevelOfInstitutionCode IS NULL 
				AND rdpsis.[MostPrevalentLevelOfInstitutionCode] = 'MISSING'))
		AND rdpsis.[PredominantCalendarSystemCode] = 'MISSING'
		AND rdpsis.VirtualIndicatorCode = 'MISSING'
		AND spse.SchoolYear = rdpsis.SchoolYear
	LEFT JOIN RDS.vwDimPsEnrollmentStatuses rdpes
		ON spse.SchoolYear = rdpes.SchoolYear
		AND spse.[PostsecondaryExitOrWithdrawalType] = rdpes.[PostsecondaryExitOrWithdrawalTypeMap]
	LEFT JOIN RDS.DimDates entryDate
		ON spse.EntryDate = entryDate.DateValue
	LEFT JOIN RDS.DimDates exitDate
		ON spse.ExitDate = exitDate.DateValue
	LEFT JOIN RDS.DimDates psEntryDate
		ON spse.EntryDateIntoPostsecondary = psEntryDate.DateValue
	WHERE @DataCollectionName IS NULL 
		OR spse.DataCollectionName = @DataCollectionName
	
	--Only use LEFT joins to junk tables

	INSERT INTO RDS.BridgePsStudentEnrollmentRaces
		(
			[FactPsStudentEnrollmentId]       
			, [RaceId]                          
		)
	SELECT DISTINCT
			rfpse.FactPsStudentEnrollmentId
		, ISNULL(rdr.DimRaceId, -1)
	FROM RDS.FactPsStudentEnrollments rfpse
	INNER JOIN RDS.DimSchoolYears rdsy
		ON rfpse.SchoolYearId = rdsy.DimSchoolYearId
	INNER JOIN RDS.DimPeople rdps
		ON rfpse.PsStudentId = rdps.DimPersonId
	INNER JOIN RDS.DimPsInstitutions rdpi
		ON rfpse.PsInstitutionId = rdpi.DimPsInstitutionId
	INNER JOIN RDS.vwDimAcademicTermDesignators rdatd
		ON rfpse.AcademicTermDesignatorId = rdatd.DimAcademicTermDesignatorId
		AND rdatd.SchoolYear = rdsy.SchoolYear
	INNER JOIN RDS.DimDates entryDate
		ON rfpse.EnrollmentEntryDateId = entryDate.DimDateId
	INNER JOIN RDS.DimDates exitDate
		ON rfpse.EnrollmentExitDateId = exitDate.DimDateId
	INNER JOIN RDS.DimDataCollections rddc
		ON rfpse.DataCollectionId = rddc.DimDataCollectionId
	LEFT JOIN Staging.PsPersonRace sppp
		ON rdps.PsStudentIdentifierState = sppp.StudentIdentifierState
		AND CONVERT(VARCHAR(100), rdpi.IPEDSIdentifier) = sppp.InstitutionIpedsUnitId
		AND rdatd.AcademicTermDesignatorMap = sppp.AcademicTermDesignator
	--	AND rdsy.SchoolYear = sppp.SchoolYear -- Can't join on School Year because it is set to the data collection school year in the RDS
		AND rddc.DataCollectionName = sppp.DataCollectionName
		AND entryDate.DateValue = sppp.RecordStartDateTime
		AND ISNULL(exitDate.DateValue, '1900-01-01') = ISNULL(sppp.RecordEndDateTime, '1900-01-01')
	LEFT JOIN Staging.PsStudentEnrollment spse
		ON rdps.PsStudentIdentifierState = spse.StudentIdentifierState
		AND rdpi.IPEDSIdentifier = spse.InstitutionIpedsUnitId
		AND spse.HispanicLatinoEthnicity = 1
		AND rdatd.AcademicTermDesignatorMap = spse.AcademicTermDesignator
	--	AND rdsy.SchoolYear = spse.SchoolYear -- Can't join on School Year because it is set to the data collection school year in the RDS
		AND rddc.DataCollectionName = spse.DataCollectionName
		AND entryDate.DateValue = spse.EntryDate
		AND ISNULL(exitDate.DateValue, '1900-01-01') = ISNULL(spse.ExitDate, '1900-01-01')
	LEFT JOIN RDS.vwDimRaces rdr
		ON ((ISNULL(sppp.RaceType, 'Race and Ethnicity Unknown') = rdr.RaceMap
				AND sppp.SchoolYear = rdr.SchoolYear)
			OR (ISNULL(spse.HispanicLatinoEthnicity, 0) = 1
				AND rdr.RaceCode = 'HispanicOrLatinoEthnicity'))

	--ALTER INDEX ALL ON RDS.FactPsStudentEnrollments REBUILD

END
