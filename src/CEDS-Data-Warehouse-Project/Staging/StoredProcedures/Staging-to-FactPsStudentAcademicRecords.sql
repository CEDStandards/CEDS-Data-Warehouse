
CREATE PROCEDURE [Staging].[Staging-to-FactPsStudentAcademicRecords]
AS

	ALTER INDEX ALL ON RDS.FactPsStudentAcademicRecords DISABLE

	DECLARE @SYEndDate DATE
	SELECT @SYEndDate = CAST('6/30/' + CAST((SELECT MAX(SchoolYear) FROM Staging.PsStudentEnrollment) AS VARCHAR(4)) AS DATE)

	DECLARE @firstDigit SMALLINT = 1

	WHILE @firstDigit < 10
	BEGIN
		
		IF OBJECT_ID(N'tempdb..#Temp') IS NOT NULL DROP TABLE #Temp

		SELECT DISTINCT
			  rsy.DimSchoolYearId								AS SchoolYearId
			, -1												AS SeaId
			, rdpi.DimPsInstitutionId							AS PsInstitutionId
			, rdp.DimPersonId									AS PersonId
			, ISNULL(rdatd.DimAcademicTermDesignatorId, -1)		AS AcademicTermDesignatorId
			, ISNULL(rdpd.DimPsDemographicId,-1)				AS PsDemographicId
			, ISNULL(rdpsis.DimPsInstitutionStatusId, -1)		AS PsInstitutionStatusId
			, ISNULL(rdpes.DimPsEnrollmentStatusId, -1)			AS PsEnrollmentStatusId
			, ISNULL(entryDate.DimDateId, -1)					AS EnrollmentEntryDateId
			, ISNULL(ExitDate.DimDateId, -1)					AS EnrollmentExitDate
			, ISNULL(rddc.DimDataCollectionId, -1)				AS DataCollectionId
			, spsar.InstructionalActivityHoursCompletedCredit					AS InstructionalActivityHoursCompletedCredit
			, -1 AS [GradePointAverage]
			, -1 AS [GradePointAverageCumulative]
			, -1 AS [DualCreditDualEnrollmentCreditsAwarded]
			, -1 AS [APCreditsAwarded]
			, -1 AS [CourseTotal]
			,  1 AS [StudentCourseCount]
		INTO #Temp
		FROM Staging.PsStudentAcademicRecord spsar
		JOIN Staging.PsStudentEnrollment spse
			ON spsar.InstitutionIpedsUnitId = spse.InstitutionIpedsUnitId
			AND spsar.StudentIdentifierState = spse.StudentIdentifierState
			AND spsar.AcademicTermDesignator = spse.AcademicTermDesignator
			AND spsar.DataCollectionName = spse.DataCollectionName
			AND spsar.SchoolYear = spse.SchoolYear
			AND spsar.EntryDate = spse.EntryDate 
			AND spsar.ExitDate = spse.ExitDate
		JOIN RDS.DimDataCollections rddc
			ON spsar.DataCollectionName = rddc.DataCollectionName
		JOIN RDS.DimSchoolYears rsy
			ON rddc.DataCollectionSchoolYear = cast(rsy.SchoolYear AS NVARCHAR(10))
		JOIN RDS.DimPsInstitutions rdpi
			ON spsar.[InstitutionIpedsUnitId] = rdpi.IPEDSIdentifier
			AND spsar.EntryDate BETWEEN rdpi.RecordStartDateTime AND ISNULL(rdpi.RecordEndDateTime, @SYEndDate)
		LEFT JOIN RDS.vwDimAcademicTermDesignators rdatd
			ON spsar.AcademicTermDesignator = rdatd.AcademicTermDesignatorMap
			AND spsar.SchoolYear = rdatd.SchoolYear
		LEFT JOIN RDS.vwDimPsEnrollmentStatuses rdpes
			ON spsar.SchoolYear = rdpes.SchoolYear
			AND spse.[PostsecondaryExitOrWithdrawalType] = rdpes.[PostsecondaryExitOrWithdrawalTypeMap]
		LEFT JOIN RDS.DimDates entryDate
			ON spsar.EntryDate = entryDate.DateValue
		LEFT JOIN RDS.DimDates ExitDate
			ON spsar.ExitDate = ExitDate.DateValue		
		JOIN Staging.PsInstitution spi
			ON spsar.InstitutionIpedsUnitId = spi.InstitutionIpedsUnitId
			AND spsar.SchoolYear = spi.SchoolYear
			AND spsar.DataCollectionName = spi.DataCollectionName
		LEFT JOIN RDS.vwDimPsInstitutionStatuses rdpsis
			ON rdpsis.[LevelOfInstitutionCode] = 'MISSING'
			AND rdpsis.[ControlOfInstitutionCode] = 'MISSING'
			AND rdpsis.[CarnegieBasicClassificationCode] = 'MISSING'
			AND ISNULL(rdpsis.[MostPrevalentLevelOfInstitutionMap], rdpsis.[MostPrevalentLevelOfInstitutionCode]) 
					= ISNULL(spi.MostPrevalentLevelOfInstitutionCode, 'MISSING')
			AND rdpsis.[PredominantCalendarSystemCode] = 'MISSING'
			AND rdpsis.VirtualIndicatorCode = 'MISSING'
			AND rdpsis.SchoolYear = spi.SchoolYear 
	    JOIN RDS.vwDimPsDemographics rdpd
			ON ISNULL(spse.Sex, 'MISSING') = ISNULL(rdpd.SexMap, rdpd.SexCode)
			AND spse.SchoolYear = rdpd.SchoolYear
		LEFT JOIN RDS.DimPeople rdp
			ON spse.StudentIdentifierState = rdp.PsStudentStudentIdentifierState
			AND spse.RecordStartDateTime BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, @SYEndDate)
			AND ISNULL(spse.FirstName, '') = ISNULL(rdp.FirstName, '')
			AND ISNULL(spse.MiddleName, '') = ISNULL(rdp.MiddleName, '')
			AND ISNULL(spse.LastOrSurname, 'MISSING') = ISNULL(rdp.LastOrSurname, 'MISSING')
			AND ISNULL(spse.Birthdate, '1/1/1900') = ISNULL(rdp.Birthdate, '1/1/1900')	
			AND spsar.EntryDate BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime , @SYEndDate)
		WHERE spsar.StudentIdentifierState like CAST(@firstDigit AS VARCHAR(1)) + '%'

		CREATE NONCLUSTERED INDEX [IX_temp] ON #Temp 
				(SchoolYearId
				, SeaId
				, PsInstitutionId
				, PersonId
				, AcademicTermDesignatorId
				, PsDemographicId
				, PsInstitutionStatusId
				, PsEnrollmentStatusId
				, EnrollmentEntryDateId
				, EnrollmentExitDate
				, DataCollectionId)

		INSERT INTO RDS.FactPsStudentAcademicRecords SELECT * FROM #Temp

		DECLARE @LogFileName sysname
		DECLARE @Sql NVARCHAR(MAX)

		SELECT @LogFileName = name
		FROM sys.database_files
		WHERE type_desc = 'LOG'

		SET @Sql = 'DBCC SHRINKFILE ([' + @LogFileName + '], 1)'

		EXEC (@Sql)

		SET @Sql = '
		USE TempDB
		DBCC FREEPROCCACHE
		DBCC SHRINKFILE (''tempdev'', 1633)
		DBCC SHRINKFILE (''temp2'', 1633)
		DBCC SHRINKFILE (''temp3'', 1633)
		DBCC SHRINKFILE (''temp4'', 1633)
		DBCC SHRINKFILE (''temp5'', 1633)
		DBCC SHRINKFILE (''temp6'', 1633)
		DBCC SHRINKFILE (''temp7'', 1633)
		DBCC SHRINKFILE (''temp8'', 1633)
		DBCC SHRINKFILE (''templog'', 1633)
		USE [' + DB_NAME() + ']'

		EXEC (@Sql)

		PRINT CAST(@firstDigit AS VARCHAR(1))  + '''s Done - FactPsStudentAcademicRecords'
		SET @firstDigit = @firstDigit + 1
	END

	ALTER INDEX ALL ON RDS.FactPsStudentAcademicRecords REBUILD

GO
