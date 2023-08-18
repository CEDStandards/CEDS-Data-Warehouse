CREATE PROCEDURE [Staging].[Staging-to-FactK12StudentCourseSections] AS 
BEGIN

	ALTER INDEX ALL ON RDS.FactK12StudentCourseSections DISABLE

	Begin Transaction
 
	INSERT INTO rds.FactK12StudentCourseSections
		(
		  SchoolYearId
		, DataCollectionId
		, SeaId
		, IeuId
		, LeaAccountabilityId
		, LeaAttendanceId
		, LeaFundingId
		, LeaGraduationId
		, LeaIndividualizedEducationProgramId
		, K12SchoolId
		, K12StudentId
		, K12DemographicId
		, K12CourseId
		, K12CourseStatusId
		, ScedCodeId
		, CipCodeId
		, LanguageId
		, EntryGradeLevelId
		, StudentCourseSectionCount
		)
	SELECT 
		  rsy.DimSchoolYearId
		, ISNULL(rddc.DimDataCollectionId, -1) AS DataCollectionId
		, ISNULL(rds.DimSeaId, -1) AS SeaId
		, ISNULL(rdi.DimIeuId, -1) AS IeuId
		, ISNULL(rdlAcc.DimLeaId, -1) AS LeaAccountabilityId
		, ISNULL(rdlAtt.DimLeaId, -1) AS LeaAttendanceId
		, ISNULL(rdlFun.DimLeaId, -1) AS LeaFundingId
		, ISNULL(rdlGrad.DimLeaId, -1) AS LeaGraduationId
		, ISNULL(rdlIep.DimLeaId, -1) AS LeaIndividualizedEducationProgramId
		, ISNULL(rdksch.DimK12SchoolId, -1) AS K12SchoolId
		, ISNULL(rdp.DimPersonId, -1) AS K12StudentId
		, ISNULL(rdkd.DimK12DemographicId, -1) AS K12DemographicId
		, -1 as DimK12CourseId
		, ISNULL(coursestatus.DimK12CourseStatusId,-1) as DimK12CourseStatusId
		, ISNULL(sced.DimScedCodeId,-1) as DimScedCodeId
		, -1 DimCipCodeId
		, -1 DimLanguageId
		, ISNULL(entryGrade.DimGradeLevelId, -1) As EntryGradeLevelId
		, 1 as StudentCourseSectionCount
	FROM Staging.K12Enrollment ske  
	JOIN Staging.K12StudentCourseSection sppse 
		ON ske.StudentIdentifierState = sppse.StudentIdentifierState
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(sppse.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '') = ISNULL(sppse.LeaIdentifierSeaAttendance, '')
		AND ISNULL(ske.LeaIdentifierSeaFunding, '') = ISNULL(sppse.LeaIdentifierSeaFunding, '')
		AND ISNULL(ske.LeaIdentifierSeaGraduation, '') = ISNULL(sppse.LeaIdentifierSeaGraduation, '')
		AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '') = ISNULL(sppse.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(sppse.SchoolIdentifierSea, '')
		--AND ISNULL(ske.EnrollmentExitDate,'1900-01-01') = ISNULL(sppse.ExitDate,'1900-01-01')
		--AND ske.EnrollmentEntryDate = sppse.EntryDate
		AND ske.DataCollectionName = sppse.DataCollectionName
		AND ske.SchoolYear = sppse.SchoolYear
	JOIN RDS.DimSchoolYears rsy
		ON ske.SchoolYear = rsy.SchoolYear
	LEFT JOIN RDS.DimLeas rdlAcc
		ON ske.LeaIdentifierSeaAccountability = rdlAcc.LeaIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdlAcc.RecordStartDateTime AND CASE WHEN rdlAcc.RecordEndDateTime IS NULL THEN GETDATE() ELSE rdlAcc.RecordEndDateTime END
	LEFT JOIN RDS.DimLeas rdlAtt
		ON ske.LeaIdentifierSeaAttendance = rdlAtt.LeaIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdlAtt.RecordStartDateTime AND CASE WHEN rdlAtt.RecordEndDateTime IS NULL THEN GETDATE() ELSE rdlAtt.RecordEndDateTime END
	LEFT JOIN RDS.DimLeas rdlFun
		ON ske.LeaIdentifierSeaFunding = rdlFun.LeaIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdlFun.RecordStartDateTime AND CASE WHEN rdlFun.RecordEndDateTime IS NULL THEN GETDATE() ELSE rdlFun.RecordEndDateTime END
	LEFT JOIN RDS.DimLeas rdlGrad
		ON ske.LeaIdentifierSeaGraduation = rdlGrad.LeaIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdlGrad.RecordStartDateTime AND CASE WHEN rdlGrad.RecordEndDateTime IS NULL THEN GETDATE() ELSE rdlGrad.RecordEndDateTime END
	LEFT JOIN RDS.DimLeas rdlIep
		ON ske.LeaIdentifierSeaIndividualizedEducationProgram = rdlIep.LeaIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdlIep.RecordStartDateTime AND CASE WHEN rdlIep.RecordEndDateTime IS NULL THEN GETDATE() ELSE rdlIep.RecordEndDateTime END
	LEFT JOIN RDS.DimK12Schools rdksch
		ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdksch.RecordStartDateTime AND  CASE WHEN rdksch.RecordEndDateTime IS NULL THEN GETDATE() ELSE rdksch.RecordEndDateTime END
	LEFT JOIN RDS.DimIeus rdi
		ON (ISNULL(rdksch.IeuOrganizationIdentifierSea, '') = rdi.IeuOrganizationIdentifierSea
			OR ISNULL(rdlAcc.IeuOrganizationIdentifierSea, '') = rdi.IeuOrganizationIdentifierSea)
		AND ske.RecordStartDateTime BETWEEN rdi.RecordStartDateTime AND CASE WHEN rdi.RecordEndDateTime IS NULL THEN GETDATE() ELSE rdi.RecordEndDateTime END
	JOIN RDS.DimSeas rds
		ON ske.RecordStartDateTime BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, GETDATE())
	JOIN RDS.DimDataCollections rddc
		ON ske.DataCollectionName = rddc.DataCollectionName 
	LEFT JOIN RDS.DimPeople rdp
		ON ske.StudentIdentifierState = rdp.K12StudentStudentIdentifierState
		AND ske.RecordStartDateTime BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())
		AND ISNULL(ske.FirstName, '') = ISNULL(rdp.FirstName, '')
		AND ISNULL(ske.MiddleName, '') = ISNULL(rdp.MiddleName, '')
		AND ISNULL(ske.LastOrSurname, 'MISSING') = ISNULL(rdp.LastOrSurname, 'MISSING')
		AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.BirthDate, '1/1/1900')
	LEFT JOIN RDS.vwDimK12Demographics rdkd
		ON rsy.SchoolYear = rdkd.SchoolYear
		AND ISNULL(ske.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)
	LEFT JOIN RDS.vwDimGradeLevels entryGrade
		ON ske.SchoolYear = entryGrade.SchoolYear
		AND ske.GradeLevel = entryGrade.GradeLevelMap
		AND entryGrade.GradeLevelTypeDescription = 'Entry Grade Level'
	LEFT JOIN RDS.vwDimK12CourseStatuses coursestatus
		ON rsy.SchoolYear = coursestatus.SchoolYear
		AND ISNULL(sppse.CourseLevelCharacteristic, 'MISSING') = ISNULL(coursestatus.CourseLevelCharacteristicMap,coursestatus.CourseLevelCharacteristicCode)
	LEFT JOIN RDS.DimScedCodes sced
		ON ISNULL(sppse.ScedCourseCode,'MISSING') = sced.ScedCourseCode
	
	
	INSERT INTO RDS.BridgeK12StudentCourseSectionRaces
		(
		  [FactK12StudentCourseSectionId]       
		, [RaceId]                          
		)
	SELECT
		  rfksc.FactK12StudentCourseSectionId
		 , ISNULL(rdr.DimRaceId, -1)
	FROM RDS.FactK12StudentCourseSections rfksc
	JOIN RDS.DimSchoolYears rdsy
		ON rfksc.SchoolYearId = rdsy.DimSchoolYearId
	JOIN RDS.DimPeople rdps
		ON rfksc.K12StudentId = rdps.DimPersonId
	JOIN RDS.DimK12Schools rdks
		ON rfksc.K12SchoolId = rdks.DimK12SchoolId
	JOIN RDS.DimLeas rdlsAcc
		ON rfksc.LeaAccountabilityId = rdlsAcc.DimLeaID
	JOIN RDS.DimLeas rdlsAtt
		ON rfksc.LeaAttendanceId = rdlsAtt.DimLeaID
	JOIN RDS.DimLeas rdlsFun
		ON rfksc.LeaFundingId = rdlsFun.DimLeaID
	JOIN RDS.DimLeas rdlsGrad
		ON rfksc.LeaGraduationId = rdlsGrad.DimLeaID
	JOIN RDS.DimDataCollections rddc
		ON rfksc.DataCollectionId = rddc.DimDataCollectionId
	LEFT JOIN Staging.K12PersonRace skpr
		ON rdps.K12StudentStudentIdentifierState = skpr.StudentIdentifierState
		AND CONVERT(VARCHAR(100), rdks.SchoolIdentifierSea) = skpr.SchoolIdentifierSea
		AND CONVERT(VARCHAR(100), rdlsAcc.LeaIdentifierSea) = skpr.LeaIdentifierSeaAccountability
		AND CONVERT(VARCHAR(100), rdlsAtt.LeaIdentifierSea) = skpr.LeaIdentifierSeaAttendance
		AND CONVERT(VARCHAR(100), rdlsFun.LeaIdentifierSea) = skpr.LeaIdentifierSeaFunding
		AND CONVERT(VARCHAR(100), rdlsGrad.LeaIdentifierSea) = skpr.LeaIdentifierSeaGraduation
		AND rddc.DataCollectionName = skpr.DataCollectionName
	LEFT JOIN Staging.K12Enrollment skse
		ON rdps.K12StudentStudentIdentifierState = skse.StudentIdentifierState
		AND rdks.SchoolIdentifierSea = skse.SchoolIdentifierSea
		AND ISNULL(skpr.LeaIdentifierSeaAccountability, '') = ISNULL(skse.LeaIdentifierSeaAccountability, '')
		AND ISNULL(skpr.LeaIdentifierSeaAttendance, '') = ISNULL(skse.LeaIdentifierSeaAttendance, '')
		AND ISNULL(skpr.LeaIdentifierSeaFunding, '') = ISNULL(skse.LeaIdentifierSeaFunding, '')
		AND ISNULL(skpr.LeaIdentifierSeaGraduation, '') = ISNULL(skse.LeaIdentifierSeaGraduation, '')
		AND skse.HispanicLatinoEthnicity = 1
	--AND rdatd.AcademicTermDesignatorMap = skse.AcademicTermDesignator
	--	AND rdsy.SchoolYear = spse.SchoolYear -- Can't join on School Year because it is set to the data collection school year in the RDS
		AND rddc.DataCollectionName = skse.DataCollectionName
	LEFT JOIN RDS.vwDimRaces rdr
		ON skpr.SchoolYear = rdr.SchoolYear
		AND (ISNULL(skpr.RaceType, 'Race and Ethnicity Unknown') = rdr.RaceMap
			OR (ISNULL(skse.HispanicLatinoEthnicity, 0) = 1
				AND rdr.RaceCode = 'HispanicOrLatinoEthnicity'))

	ALTER INDEX ALL ON RDS.FactK12StudentCourseSections REBUILD


Commit Transaction

END