CREATE PROCEDURE Staging.[Staging-To-FactPsStudentAcademicAwards]
AS

	DROP TABLE IF EXISTS #saa
	SELECT 
		  rdpi.DimPsInstitutionId							AS [PsInstitutionId]
		, ISNULL(rdsy.DimSchoolYearId, -1)					AS [SchoolYearId]
		, -1												AS [PsStudentId]            
		, -1												AS [PsDemographicId] 
		, ISNULL(rdaat.DimPsAcademicAwardTitleId, -1)		AS [PsAcademicAwardTitleId] 
		, ISNULL(awardDate.DimDateId, -1)					AS [AcademicAwardDateId]    
		, ISNULL(rdaas.DimPsAcademicAwardStatusId, -1)		AS [PsAcademicAwardStatusId]
		, spsar.StudentIdentifierState						AS [PsStudentIdentifierState]
		, spsar.InstitutionIpedsUnitId						AS [InstitutionIpedsUnitId]
		, spsar.AcademicAwardTitle							AS [AcademicAwardTitle]
		, AwardDate.DateValue								AS [AcademicAwardDate]
		, spsar.EntryDate									AS [EntryDate]
		, spsar.ExitDate									AS [ExitDate]
	INTO #saa
	FROM Staging.PsStudentAcademicAward spsar
	LEFT JOIN RDS.DimPsInstitutions rdpi
		ON spsar.[InstitutionIpedsUnitId] = rdpi.IPEDSIdentifier
		AND spsar.EntryDate BETWEEN rdpi.RecordStartDateTime AND ISNULL(rdpi.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimPsAcademicAwardTitles rdaat
		ON spsar.AcademicAwardTitle = rdaat.AcademicAwardTitle
	LEFT JOIN RDS.vwDimPsAcademicAwardStatuses rdaas
		ON ISNULL(spsar.[PescAwardLevelType], 'MISSING') = ISNULL(rdaas.PescAwardLevelTypeMap, rdaas.PescAwardLevelTypeCode) 
		AND ISNULL(spsar.[ProfessionalOrTechnicalCredentialConferred], 'MISSING') = ISNULL(rdaas.ProfessionalOrTechnicalCredentialConferredMap, rdaas.ProfessionalOrTechnicalCredentialConferredCode)
		AND spsar.SchoolYear = rdaas.SchoolYear
	LEFT JOIN RDS.DimSchoolYears rdsy
		ON spsar.SchoolYear = rdsy.SchoolYear
	JOIN RDS.DimDates awardDate
		ON spsar.AcademicAwardDate = awardDate.DateValue

	DROP TABLE IF EXISTS #spse
	-- Students who exited school during or right before they received an award
	SELECT 
		  s.PsStudentIdentifierState
		, s.InstitutionIpedsUnitId
		, spse.Id						AS [StagingPsStudentEnrollmentId]
		, s.AcademicAwardDate
	INTO #spse
	FROM #saa s
	LEFT JOIN Staging.PsStudentEnrollment spse
		ON s.PsStudentIdentifierState = spse.StudentIdentifierState
		AND s.InstitutionIpedsUnitId = spse.InstitutionIpedsUnitId
		AND (s.EntryDate = spse.EntryDate
			OR s.AcademicAwardDate BETWEEN spse.EntryDate AND ISNULL(spse.ExitDate, GETDATE()))

	-- Students who received an award before enrolling in the institution
	; WITH cte AS (
		SELECT 
			  s.PsStudentIdentifierState
			, s.InstitutionIpedsUnitId
			, spse.Id						AS [StagingPsStudentEnrollmentId]
			, ROW_NUMBER() OVER (PARTITION BY s.PsStudentIdentifierState, s.InstitutionIpedsUnitId ORDER BY spse.EntryDate ASC) RowNumber
		FROM #spse s
		JOIN Staging.PsStudentEnrollment spse
			ON s.PsStudentIdentifierState = spse.StudentIdentifierState
			AND s.InstitutionIpedsUnitId = spse.InstitutionIpedsUnitId
			AND s.AcademicAwardDate < spse.EntryDate
	)
	UPDATE #spse
	SET StagingPsStudentEnrollmentId = c.StagingPsStudentEnrollmentId
	FROM #spse s
	JOIN cte c
		ON s.PsStudentIdentifierState = c.PsStudentIdentifierState
		AND s.InstitutionIpedsUnitId = c.InstitutionIpedsUnitId
		AND c.RowNumber = 1
	WHERE s.StagingPsStudentEnrollmentId IS NULL

	-- Students who received an award but there isn't an enrollment record, get the last record before their award date
	; WITH cte AS (
		SELECT 
			  s.PsStudentIdentifierState
			, s.InstitutionIpedsUnitId
			, spse.Id						AS [StagingPsStudentEnrollmentId]
			, ROW_NUMBER() OVER (PARTITION BY s.PsStudentIdentifierState, s.InstitutionIpedsUnitId ORDER BY spse.EntryDate DESC) RowNumber
		FROM #spse s
		JOIN Staging.PsStudentEnrollment spse
			ON s.PsStudentIdentifierState = spse.StudentIdentifierState
			AND s.AcademicAwardDate >= spse.EntryDate
		WHERE s.StagingPsStudentEnrollmentId IS NULL
	)
	UPDATE #spse
	SET StagingPsStudentEnrollmentId = c.StagingPsStudentEnrollmentId
	FROM #spse s
	JOIN cte c
		ON s.PsStudentIdentifierState = c.PsStudentIdentifierState
		AND s.InstitutionIpedsUnitId = c.InstitutionIpedsUnitId
		AND c.RowNumber = 1
	WHERE s.StagingPsStudentEnrollmentId IS NULL

	-- Students who received an award but there isn't an enrollment record, get the first record before their award date
	; WITH cte AS (
		SELECT 
			  s.PsStudentIdentifierState
			, s.InstitutionIpedsUnitId
			, spse.Id						AS [StagingPsStudentEnrollmentId]
			, ROW_NUMBER() OVER (PARTITION BY s.PsStudentIdentifierState, s.InstitutionIpedsUnitId ORDER BY spse.EntryDate ASC) RowNumber
		FROM #spse s
		JOIN Staging.PsStudentEnrollment spse
			ON s.PsStudentIdentifierState = spse.StudentIdentifierState
			AND s.AcademicAwardDate <= spse.EntryDate
		WHERE s.StagingPsStudentEnrollmentId IS NULL
	)
	UPDATE #spse
	SET StagingPsStudentEnrollmentId = c.StagingPsStudentEnrollmentId
	FROM #spse s
	JOIN cte c
		ON s.PsStudentIdentifierState = c.PsStudentIdentifierState
		AND s.InstitutionIpedsUnitId = c.InstitutionIpedsUnitId
		AND c.RowNumber = 1
	WHERE s.StagingPsStudentEnrollmentId IS NULL


	-- Create a DimPeople record for anyone that doesn't have one based on what's in Staging.PsStudentEnrollments
	UPDATE #saa
	SET   PsStudentId = rdp.DimPersonId
		, PsDemographicId = rdpd.DimPsDemographicId
	FROM #saa saa
	JOIN #spse s
		ON saa.PsStudentIdentifierState = s.PsStudentIdentifierState
		AND saa.InstitutionIpedsUnitId = s.InstitutionIpedsUnitId
		AND saa.AcademicAwardDate = s.AcademicAwardDate
	JOIN Staging.PsStudentEnrollment spse
		on s.StagingPsStudentEnrollmentId = spse.Id
	JOIN RDS.DimPeople rdp
		ON (spse.Id IS NOT NULL
			AND spse.StudentIdentifierState = rdp.PsStudentIdentifierState 
			AND ISNULL(spse.Birthdate, '01-01-1900') = ISNULL(rdp.Birthdate, '01-01-1900')
			AND spse.EntryDate BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())
			)
		OR
			(spse.Id IS NULL
			AND spse.StudentIdentifierState = rdp.PsStudentIdentifierState 
			)
	LEFT JOIN RDS.vwDimPsDemographics rdpd
		ON spse.SchoolYear = rdpd.SchoolYear
		AND ISNULL(spse.[Sex], 'MISSING') = ISNULL(rdpd.SexMap, rdpd.SexCode) 

	-- Get min and max of every institution to find a match for those missing one
	DROP TABLE IF EXISTS #Institutions
	SELECT 
		  MIN(DimPsInstitutionId) AS DimPsInstitutionId
		, IPEDSIdentifier
		, RecordStartDateTime AS RecordStartDateTime
	INTO #Institutions
	FROM RDS.DimPsInstitutions
	GROUP BY IPEDSIdentifier, RecordStartDateTime
	HAVING RecordStartDateTime = MIN(RecordStartDateTime)

	UPDATE #saa
	SET PsInstitutionId = DimPsInstitutionId
	FROM #saa s
	JOIN #Institutions i
		ON s.InstitutionIpedsUnitId = i.IPEDSIdentifier
	WHERE s.PsInstitutionId IS NULL

	INSERT INTO RDS.FactPsStudentAcademicAwards
	SELECT 
		  [SchoolYearId]
		, [PsInstitutionId]             
		, [PsStudentId]    
		, [PsDemographicId]
		, [PsAcademicAwardTitleId]        
		, [AcademicAwardDateId]         
		, [PsAcademicAwardStatusId]       
		, 1                
	FROM #saa

	ALTER INDEX ALL ON RDS.FactPsStudentAcademicAwards REBUILD