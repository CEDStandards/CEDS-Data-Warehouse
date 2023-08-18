
CREATE PROCEDURE [Staging].[Staging-to-FactPsStudentAcademicRecord]
AS

	ALTER INDEX ALL ON RDS.FactPsStudentAcademicRecords DISABLE

	DECLARE @firstDigit smallint = 1, @sql VARCHAR(MAX)

	WHILE @firstDigit < 10
	BEGIN
		
		drop table if exists #Temp
		drop table if exists #MiTemp

		SELECT distinct
			  rsy.DimSchoolYearId								AS SchoolYearId
			, -1												AS SeaId
			, rdpi.DimPsInstitutionId							AS PsInstitutionId
			, rdp.DimPersonId									AS PersonId
			, ISNULL(rdatd.DimAcademicTermDesignatorId, -1)		AS AcademicTermDesignatorId
			, ISNULL(rdpd.DimPsDemographicId,-1)				AS PsDemographicId
			, ISNULL(rdpsis.DimPsInstitutionStatusId, -1)		AS PsInstitutionStatusId
			, ISNULL(rdpes.DimPsEnrollmentStatusId, -1)			AS PsEnrollmentStatusId
			, ISNULL(entryDate.DimDateId, -1)					AS EnrollmentEntryDateId
			, ISNULL(exitDate.DimDateId, -1)					AS EnrollmentExitDate
			, ISNULL(rddc.DimDataCollectionId, -1)				AS DataCollectionId
			, spsar.InstructionalActivityHoursCompletedCredit					AS InstructionalActivityHoursCompletedCredit
			, -1 AS [GradePointAverage]
			, -1 AS [GradePointAverageCumulative]
			, -1 AS [DualCreditDualEnrollmentCreditsAwarded]
			, -1 AS [APCreditsAwarded]
			, -1 AS [CourseTotal]
			,  1 AS [StudentCourseCount]
		Into #Temp
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
			ON rddc.DataCollectionSchoolYear = cast(rsy.SchoolYear as nvarchar(10))
		JOIN RDS.DimPsInstitutions rdpi
			ON spsar.[InstitutionIpedsUnitId] = rdpi.IPEDSIdentifier
			AND spsar.EntryDate BETWEEN rdpi.RecordStartDateTime AND ISNULL(rdpi.RecordEndDateTime, GETDATE())
		LEFT JOIN RDS.vwDimAcademicTermDesignators rdatd
			ON spsar.AcademicTermDesignator = rdatd.AcademicTermDesignatorMap
			AND spsar.SchoolYear = rdatd.SchoolYear
		LEFT JOIN RDS.vwDimPsEnrollmentStatuses rdpes
			ON spsar.SchoolYear = rdpes.SchoolYear
			AND spse.[PostsecondaryExitOrWithdrawalType] = rdpes.[PostsecondaryExitOrWithdrawalTypeMap]
		LEFT JOIN RDS.DimDates entryDate
			ON spsar.EntryDate = entryDate.DateValue
		LEFT JOIN RDS.DimDates exitDate
			ON spsar.ExitDate = exitDate.DateValue		
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
			AND spse.RecordStartDateTime BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())
			AND ISNULL(spse.FirstName, '') = ISNULL(rdp.FirstName, '')
			AND ISNULL(spse.MiddleName, '') = ISNULL(rdp.MiddleName, '')
			AND ISNULL(spse.LastOrSurname, 'MISSING') = ISNULL(rdp.LastOrSurname, 'MISSING')
			AND ISNULL(spse.Birthdate, '1/1/1900') = ISNULL(rdp.BirthDate, '1/1/1900')	
			AND spsar.EntryDate BETWEEN rdp.RecordStartDatetime AND ISNULL(rdp.RecordEndDatetime , GETDATE())
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

		Insert Into RDS.FactPsStudentAcademicRecords Select * From #Temp 

		SELECT 
			rfpsar.FactPsStudentAcademicRecordId
			, rmdptes.MiDimPsTermEnrollmentStatusesId
		Into #MiTemp
		FROM RDS.FactPsStudentAcademicRecords rfpsar
		JOIN RDS.DimSchoolYears rdsy
			ON rfpsar.SchoolYearId = rdsy.DimSchoolYearId
		JOIN RDS.DimPeople rdps
			ON rfpsar.PsStudentId = rdps.DimPersonId
			AND rdps.PsStudentStudentIdentifierState like CAST(@firstDigit AS VARCHAR(1)) + '%'
		JOIN RDS.DimPsInstitutions rdpi
			ON rfpsar.PsInstitutionId = rdpi.DimPsInstitutionId
		JOIN RDS.vwDimAcademicTermDesignators rdatd
			ON rfpsar.AcademicTermDesignatorId = rdatd.DimAcademicTermDesignatorId
			AND rdatd.SchoolYear = rdsy.SchoolYear
		JOIN RDS.DimDates entryDate
			ON rfpsar.EnrollmentEntryDateId = entryDate.DimDateId
		JOIN RDS.DimDates exitDate
			ON rfpsar.EnrollmentExitDateId = exitDate.DimDateId
		JOIN Staging.MiPsStudentAcademicRecord smpsar
			ON rdps.PsStudentStudentIdentifierState = smpsar.StudentIdentifierState
			AND rdpi.IPEDSIdentifier = smpsar.InstitutionIpedsUnitId
			AND rdatd.AcademicTermDesignatorMap = smpsar.AcademicTermDesignator
			AND entryDate.DateValue = smpsar.EntryDate
			AND exitDate.DateValue = smpsar.ExitDate
		JOIN RDS.MiDimPsTermEnrollmentStatuses rmdptes
			ON ISNULL(CAST(smpsar.RemedialEslSession AS SMALLINT), -1) = rmdptes.RemedialEslSession
			AND ISNULL(CAST(smpsar.RemedialMathSession AS SMALLINT), -1) = rmdptes.RemedialMathSession
			AND ISNULL(CAST(smpsar.RemedialReadingSession AS SMALLINT), -1) = rmdptes.RemedialReadingSession
			AND ISNULL(CAST(smpsar.RemedialScienceSession AS SMALLINT), -1) = rmdptes.RemedialScienceSession
			AND ISNULL(CAST(smpsar.RemedialSession AS SMALLINT), -1) = rmdptes.RemedialSession
			AND ISNULL(CAST(smpsar.RemedialWritingSession AS SMALLINT), -1) = rmdptes.RemedialWritingSession
			AND ISNULL(CAST(smpsar.TransferedMidTermWithoutGrades AS SMALLINT), -1) = rmdptes.TransferedMidTermWithoutGrades
		JOIN #temp temp
			ON temp.PersonId=rfpsar.PsStudentId
			AND temp.SchoolYearId=rfpsar.SchoolYearId
			AND temp.PsInstitutionID=rfpsar.PsInstitutionID
			AND temp.EnrollmentEntryDateId=rfpsar.EnrollmentEntryDateId
			AND temp.EnrollmentExitDate=rfpsar.EnrollmentExitDateId
			AND temp.AcademicTermDesignatorId=rfpsar.AcademicTermDesignatorId
			AND temp.PsDemographicId=rfpsar.PsDemographicId
			AND temp.DataCollectionId=rfpsar.DataCollectionId
			AND temp.PsInstitutionStatusId=rfpsar.PsInstitutionStatusId
		LEFT JOIN RDS.MiFactPsStudentAcademicRecord m
			ON rfpsar.FactPsStudentAcademicRecordId=m.FactPsStudentAcademicRecordId
			AND rmdptes.MiDimPsTermEnrollmentStatusesId=m.MiDimPsTermEnrollmentStatusesId
		WHERE m.FactPsStudentAcademicRecordId IS NULL

		INSERT INTO RDS.MiFactPsStudentAcademicRecord	
		(
			[FactPsStudentAcademicRecordId]  
			, [MiDimPsTermEnrollmentStatusesId]
		)
		SELECT 
			t.FactPsStudentAcademicRecordId,
			t.MiDimPsTermEnrollmentStatusesId
		FROM #MiTemp t 
		
		DBCC SHRINKFILE ('CEDS-Data-Warehouse-V9-2-0-0_log', 1)
		SELECT @Sql = 'USE TempDB
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
						USE CEDS'
		exec (@sql)

		PRINT CAST(@firstDigit AS VARCHAR(1))  + '''s Done - FactPsStudentAcademicRecords'
		SET @firstDigit = @firstDigit + 1
	END

	ALTER INDEX ALL ON RDS.FactPsStudentAcademicRecords REBUILD

GO
