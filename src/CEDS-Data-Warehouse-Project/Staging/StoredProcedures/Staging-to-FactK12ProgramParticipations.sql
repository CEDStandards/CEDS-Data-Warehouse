CREATE PROCEDURE [Staging].[Staging-to-FactK12ProgramParticipations]
	@DataCollectionName	VARCHAR(60) = NULL
AS BEGIN

	CREATE TABLE #Facts (
		   [StagingId]									INT
		 , [DataCollectionId]                   		INT NULL
		 , [SchoolYearId]                       		INT NULL
		 , [SeaId]                              		INT NULL
		 , [IeuId]                              		INT NULL
		 , [LeaAccountabilityId]                		INT NULL
		 , [LeaAttendanceId]                    		INT NULL
		 , [LeaFundingId]                       		INT NULL
		 , [LeaGraduationId]                    		INT NULL
		 , [LeaIndividualizedEducationProgramId]		INT NULL
		 , [K12SchoolId]                        		INT NULL
		 , [K12StudentId]                       		INT NULL
		 , [IdeaStatusId]                       		INT NULL
		 , [K12DemographicId]                   		INT NULL
		 , [K12ProgramTypeId]                   		INT NULL
		 , [ProgramParticipationStartDateId]    		INT NULL
		 , [ProgramParticipationExitDateId]     		INT NULL
		 , [StudentCount]                       		INT NULL
	)

	INSERT INTO #Facts
	(
		  [StagingId]
		, [DataCollectionId]                                 
		, [SchoolYearId]                                     
		, [SeaId]                                            
		, [IeuId]                                            
		, [LeaAccountabilityId]                              
		, [LeaAttendanceId]                                  
		, [LeaFundingId]                                     
		, [LeaGraduationId]                                  
		, [LeaIndividualizedEducationProgramId]              
		, [K12SchoolId]                                      
		, [K12StudentId]                                     
		, [IdeaStatusId]                                     
		, [K12DemographicId]                                 
		, [K12ProgramTypeId]                                 
		, [ProgramParticipationStartDateId]                  
		, [ProgramParticipationExitDateId]                   
		, [StudentCount]                                     
	)
	SELECT DISTINCT 
		  ske.Id
		, ISNULL(rddc.DimDataCollectionId, -1) AS DimDataCollectionId
		, rsy.DimSchoolYearId
		, ISNULL(rds.DimSeaId, -1) AS DimSeaId
		, ISNULL(rdi.DimIeuId, -1) AS DimIeuId
		, ISNULL(rdlAcc.DimLeaId, -1) AS DimLeaAccountabilityId
		, ISNULL(rdlAtt.DimLeaId, -1) AS DimLeaAttendanceId
		, ISNULL(rdlFun.DimLeaId, -1) AS DimLeaFundingId
		, ISNULL(rdlGrad.DimLeaId, -1) AS DimLeaGraduationId
		, ISNULL(rdlIep.DimLeaId, -1) AS DimLeaIndividualizedEducationProgramId
		, ISNULL(rdksch.DimK12SchoolId, -1) AS DimK12SchoolId
		, ISNULL(rdp.DimPersonId, -1) AS DimK12StudentId
		, ISNULL(rdis.DimIdeaStatusId, -1) AS DimIdeaStatusId
		, ISNULL(rdkd.DimK12DemographicId, -1) AS DimK12DemographicId
		, ISNULL(rdkpt.DimK12ProgramTypeId, -1) AS DimK12ProgramTypeID
		, ISNULL(entryDate.DimDateId, -1) As EntryDateId
		, ISNULL(exitDate.DimDateId, -1) AS ExitDateId
		, 1 AS StudentCount
	FROM Staging.K12ProgramParticipation skpp
	JOIN Staging.K12Enrollment ske
		ON ISNULL(skpp.DataCollectionName, '')								= ISNULL(ske.DataCollectionName, '')
		AND ISNULL(skpp.LeaIdentifierSeaAccountability, '')					= ISNULL(ske.LeaIdentifierSeaAccountability, '')
		AND ISNULL(skpp.LeaIdentifierSeaAttendance, '')						= ISNULL(ske.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(skpp.LeaIdentifierSeaFunding, '')						= ISNULL(ske.LeaIdentifierSeaFunding, '')
		--AND ISNULL(skpp.LeaIdentifierSeaGraduation, '')						= ISNULL(ske.LeaIdentifierSeaAccountability, '')
		--AND ISNULL(skpp.LeaIdentifierSeaIndividualizedEducationProgram, '') = ISNULL(ske.LeaIdentifierSeaAccountability, '')
		AND ISNULL(skpp.SchoolIdentifierSea, '')							= ISNULL(ske.SchoolIdentifierSea, '')
		AND ISNULL(skpp.ResponsibleSchoolTypeAttendance, 0)					= ISNULL(ske.ResponsibleSchoolTypeAttendance, 0)
		AND ISNULL(skpp.ResponsibleSchoolTypeAccountability, 0)				= ISNULL(ske.ResponsibleSchoolTypeAccountability, 0)
		AND ISNULL(skpp.StudentIdentifierState, '')							= ISNULL(ske.StudentIdentifierState, '')
	LEFT JOIN Staging.PersonStatus sps
		ON ISNULL(skpp.DataCollectionName, '')								= ISNULL(sps.DataCollectionName, '')
		AND ISNULL(skpp.LeaIdentifierSeaAccountability, '')					= ISNULL(sps.LeaIdentifierSeaAccountability, '')
		AND ISNULL(skpp.LeaIdentifierSeaAttendance, '')						= ISNULL(sps.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(skpp.LeaIdentifierSeaFunding, '')						= ISNULL(sps.LeaIdentifierSeaFunding, '')
		--AND ISNULL(skpp.LeaIdentifierSeaGraduation, '')						= ISNULL(sps.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(skpp.LeaIdentifierSeaIndividualizedEducationProgram, '') = ISNULL(sps.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(skpp.SchoolIdentifierSea, '')							= ISNULL(sps.SchoolIdentifierSea, '')
		AND ISNULL(skpp.ResponsibleSchoolTypeAttendance, 0)					= ISNULL(sps.ResponsibleSchoolTypeAttendance, 0)
		AND ISNULL(skpp.ResponsibleSchoolTypeAccountability, 0)				= ISNULL(sps.ResponsibleSchoolTypeAccountability, 0)
		AND ISNULL(skpp.StudentIdentifierState, '')							= ISNULL(sps.StudentIdentifierState, '')
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900')						= ISNULL(sps.RecordStartDateTime, '1/1/1900')
		AND ISNULL(ske.EnrollmentEntryDate, '1/1/1900')						= ISNULL(sps.EnrollmentEntryDate, '1/1/1900')
		AND ISNULL(ske.EnrollmentExitDate, '1/1/1900')						= ISNULL(sps.EnrollmentExitDate, '1/1/1900')
	LEFT JOIN Staging.ProgramParticipationSpecialEducation sppse
		ON ISNULL(skpp.DataCollectionName, '')								= ISNULL(sppse.DataCollectionName, '')
		AND ISNULL(skpp.LeaIdentifierSeaAccountability, '')					= ISNULL(sppse.LeaIdentifierSeaAccountability, '')
		AND ISNULL(skpp.LeaIdentifierSeaAttendance, '')						= ISNULL(sppse.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(skpp.LeaIdentifierSeaFunding, '')						= ISNULL(sppse.LeaIdentifierSeaFunding, '')
		--AND ISNULL(skpp.LeaIdentifierSeaGraduation, '')						= ISNULL(sppse.LeaIdentifierSeaAccountability, '')
		--AND ISNULL(skpp.LeaIdentifierSeaIndividualizedEducationProgram, '') = ISNULL(sppse.LeaIdentifierSeaAccountability, '')
		AND ISNULL(skpp.SchoolIdentifierSea, '')							= ISNULL(sppse.SchoolIdentifierSea, '')
		AND ISNULL(skpp.ResponsibleSchoolTypeAttendance, 0)					= ISNULL(sppse.ResponsibleSchoolTypeAttendance, 0)
		AND ISNULL(skpp.ResponsibleSchoolTypeAccountability, 0)				= ISNULL(sppse.ResponsibleSchoolTypeAccountability, 0)
		AND ISNULL(skpp.StudentIdentifierState, '')							= ISNULL(sppse.StudentIdentifierState, '')
	JOIN RDS.DimPeople rdp
		ON skpp.StudentIdentifierState												= rdp.K12StudentIdentifierState
		AND ske.RecordStartDateTime													BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())
		AND ISNULL(ske.FirstName, '')												= ISNULL(rdp.FirstName, '')
		AND ISNULL(ske.MiddleName, '')												= ISNULL(rdp.MiddleName, '')
		AND ISNULL(ske.LastOrSurname, 'MISSING')									= ISNULL(rdp.LastOrSurname, 'MISSING')
		AND ISNULL(ske.Birthdate, '1/1/1900')										= ISNULL(rdp.BirthDate, '1/1/1900')
	LEFT JOIN RDS.DimLeas rdlAcc
		ON ske.LeaIdentifierSeaAccountability = rdlAcc.LeaIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdlAcc.RecordStartDateTime AND ISNULL(rdlAcc.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimLeas rdlAtt
		ON ske.LeaIdentifierSeaAttendance = rdlAtt.LeaIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdlAtt.RecordStartDateTime AND ISNULL(rdlAtt.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimLeas rdlFun
		ON ske.LeaIdentifierSeaFunding = rdlFun.LeaIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdlFun.RecordStartDateTime AND ISNULL(rdlFun.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimLeas rdlGrad
		ON ske.LeaIdentifierSeaGraduation = rdlGrad.LeaIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdlGrad.RecordStartDateTime AND ISNULL(rdlGrad.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimLeas rdlIep
		ON ske.LeaIdentifierSeaIndividualizedEducationProgram = rdlIep.LeaIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdlIep.RecordStartDateTime AND ISNULL(rdlIep.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimK12Schools rdksch
		ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimIeus rdi
		ON (ISNULL(rdksch.IeuOrganizationIdentifierSea, '') = rdi.IeuOrganizationIdentifierSea
			OR ISNULL(rdlAcc.IeuOrganizationIdentifierSea, '') = rdi.IeuOrganizationIdentifierSea
			OR ISNULL(rdlAtt.IeuOrganizationIdentifierSea, '') = rdi.IeuOrganizationIdentifierSea)
		AND ske.RecordStartDateTime BETWEEN rdi.RecordStartDateTime AND ISNULL(rdi.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimSeas rds
		ON ske.RecordStartDateTime BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, GETDATE())
	JOIN RDS.DimDataCollections rddc
		ON skpp.DataCollectionName = rddc.DataCollectionName 
	JOIN RDS.DimDates entryDate
		ON skpp.EntryDate = entryDate.DateValue
	JOIN RDS.DimDates exitDate
		ON skpp.exitDate = exitDate.DateValue
	LEFT JOIN RDS.vwDimK12ProgramTypes rdkpt
		ON ISNULL(skpp.ProgramType, 'MISSING')										= ISNULL(rdkpt.ProgramTypeMap, rdkpt.ProgramTypeCode)
		AND skpp.SchoolYear = rdkpt.SchoolYear
	LEFT JOIN RDS.vwDimK12Demographics rdkd
		ON skpp.SchoolYear = rdkd.SchoolYear
		AND ISNULL(ske.Sex, 'MISSING')												= ISNULL(rdkd.SexMap, rdkd.SexCode)
	LEFT JOIN RDS.vwDimIdeaStatuses rdis
		ON skpp.SchoolYear = rdis.SchoolYear
		AND ISNULL(CAST(sps.IDEAIndicator AS SMALLINT), -1)							= rdis.IdeaIndicatorMap
		AND ISNULL(sppse.IDEAEducationalEnvironmentForEarlyChildhood, 'MISSING')	= ISNULL(rdis.IdeaEducationalEnvironmentForEarlyChildhoodMap, rdis.IdeaEducationalEnvironmentForEarlyChildhoodCode)
		AND ISNULL(sppse.IDEAEducationalEnvironmentForSchoolAge, 'MISSING')			= ISNULL(rdis.IdeaEducationalEnvironmentForSchoolAgeMap, rdis.IdeaEducationalEnvironmentForSchoolAgeCode)			
		AND ISNULL(sppse.SpecialEducationExitReason, 'MISSING')						= ISNULL(rdis.SpecialEducationExitReasonMap, rdis.SpecialEducationExitReasonCode)						
	LEFT JOIN RDS.DimSchoolYears rsy
		ON skpp.SchoolYear = rsy.SchoolYear
	WHERE @dataCollectionName IS NULL 
		OR skpp.DataCollectionName = @dataCollectionName


	
	-- Find DimPeople records that may have been missed using enrollment dates rather than RecordStartDateTime (Grab the MAX DimPersonId)
	UPDATE #Facts
	SET   K12StudentId = p.DimPersonId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	JOIN 
	( 
		SELECT 
			  DimPersonId
			, rdp.K12StudentIdentifierState
			, ROW_NUMBER() OVER (PARTITION BY rdp.K12StudentIdentifierState ORDER BY rdp.RecordStartDateTime)		AS RecNum
		FROM #Facts fact
		JOIN Staging.K12Enrollment ske
			ON fact.StagingId = ske.Id
		LEFT JOIN RDS.DimPeople rdp
			ON ske.StudentIdentifierState																			= rdp.K12StudentIdentifierState
			AND ISNULL(ske.EnrollmentEntryDate, GETDATE())															<= ISNULL(rdp.RecordEndDateTime, GETDATE())
			AND ISNULL(ske.EnrollmentExitDate, GETDATE())															>= ISNULL(rdp.RecordStartDateTime, GETDATE())
			AND ISNULL(ske.FirstName, 'MISSING')																	= ISNULL(rdp.FirstName, 'MISSING')
			AND ISNULL(ske.MiddleName, 'MISSING')																	= ISNULL(rdp.MiddleName, 'MISSING')
			AND ISNULL(ske.LastOrSurname, 'MISSING')																= ISNULL(rdp.LastOrSurname, 'MISSING')
			AND ISNULL(ske.Birthdate, '1/1/1900')																	= ISNULL(rdp.BirthDate, '1/1/1900')
		WHERE fact.K12StudentId IS NULL
	) p
		ON ske.StudentIdentifierState = p.K12StudentIdentifierState
		AND p.RecNum = 1
		
	-- Get the FIRST DimPersonId since there isn't an overlap between enrollment dates
	-- This means the enrollment dates are BEFORE the first recordstartdatetime in DimPeople
	UPDATE #Facts
	SET   K12StudentId = p.DimPersonId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	JOIN 
	( 
		SELECT 
			  DimPersonId
			, rdp.K12StudentIdentifierState
			, ROW_NUMBER() OVER (PARTITION BY rdp.K12StudentIdentifierState ORDER BY rdp.RecordStartDateTime)		AS RecNum
		FROM #Facts fact
		JOIN Staging.K12Enrollment ske
			ON fact.StagingId = ske.Id
		LEFT JOIN RDS.DimPeople rdp
			ON ske.StudentIdentifierState																			= rdp.K12StudentIdentifierState
			AND ISNULL(ske.FirstName, 'MISSING')																	= ISNULL(rdp.FirstName, 'MISSING')
			AND ISNULL(ske.MiddleName, 'MISSING')																	= ISNULL(rdp.MiddleName, 'MISSING')
			AND ISNULL(ske.LastOrSurname, 'MISSING')																= ISNULL(rdp.LastOrSurname, 'MISSING')
			AND ISNULL(ske.Birthdate, '1/1/1900')																	= ISNULL(rdp.BirthDate, '1/1/1900')
		WHERE fact.K12StudentId IS NULL
	) p
		ON ske.StudentIdentifierState = p.K12StudentIdentifierState
		AND p.RecNum = 1


	INSERT INTO RDS.FactK12ProgramParticipations
		SELECT DISTINCT 
		  ISNULL(DimDataCollectionId, -1) AS DimDataCollectionId
		, ISNULL(DimSchoolYearId, -1) AS DimSchoolYearId
		, ISNULL(rds.DimSeaId, -1) AS DimSeaId
		, ISNULL(rdi.DimIeuId, -1) AS DimIeuId
		, ISNULL(rdlAcc.DimLeaId, -1) AS DimLeaAccountabilityId
		, ISNULL(rdlAtt.DimLeaId, -1) AS DimLeaAttendanceId
		, ISNULL(rdlFun.DimLeaId, -1) AS DimLeaFundingId
		, ISNULL(rdlGrad.DimLeaId, -1) AS DimLeaGraduationId
		, ISNULL(rdlIep.DimLeaId, -1) AS DimLeaIndividualizedEducationProgramId
		, ISNULL(rdksch.DimK12SchoolId, -1) AS DimK12SchoolId
		, ISNULL(rdp.DimPersonId, -1) AS DimK12StudentId
		, ISNULL(rdis.DimIdeaStatusId, -1) AS DimIdeaStatusId
		, ISNULL(rdkd.DimK12DemographicId, -1) AS DimK12DemographicId
		, ISNULL(rdkpt.DimK12ProgramTypeId, -1) AS DimK12ProgramTypeID
		, ISNULL(entryDate.DimDateId, -1) As EntryDateId
		, ISNULL(exitDate.DimDateId, -1) AS ExitDateId
		, ISNULL(StudentCount, 1) AS StudentCount
	FROM #Facts


	ALTER INDEX ALL ON RDS.FactK12ProgramParticipations REBUILD
	DROP TABLE IF EXISTS #temp

	SELECT DISTINCT
		  rfkse.FactK12ProgramParticipationId
		, ske.SchoolYear
		, ISNULL(skpr.RaceType,'MISSING') as RaceType
		, ISNULL(ske.HispanicLatinoEthnicity,0) as HispanicLatinoEthnicity
		--, ISNULL(rdr.DimRaceId, -1) as DimRaceId
	INTO #temp
	FROM RDS.FactK12ProgramParticipations rfkse
	JOIN RDS.DimSchoolYears rdsy
		ON rfkse.SchoolYearId = rdsy.DimSchoolYearId
	JOIN RDS.DimPeople rdp
		ON rfkse.K12StudentId = rdp.DimPersonId
	JOIN RDS.DimK12Schools rdks
		ON rfkse.K12SchoolId = rdks.DimK12SchoolId
	JOIN RDS.DimLeas rdlsAcc
		ON rfkse.LeaAccountabilityId = rdlsAcc.DimLeaID
	JOIN RDS.DimLeas rdlsAtt
		ON rfkse.LeaAttendanceId = rdlsAtt.DimLeaID
	JOIN RDS.DimLeas rdlsFun
		ON rfkse.LeaFundingId = rdlsFun.DimLeaID
	JOIN RDS.DimLeas rdlsGrad
		ON rfkse.LeaGraduationId = rdlsGrad.DimLeaID
	JOIN RDS.DimLeas rdlsIep
		ON rfkse.LeaIndividualizedEducationProgramId = rdlsIep.DimLeaID
	JOIN RDS.DimSeas rdlsSea
		ON rfkse.SeaId = rdlsSea.DimSeaId
	JOIN RDS.DimDataCollections rddc
		ON rfkse.DataCollectionId = rddc.DimDataCollectionId
		--AND rddc.DataCollectionName = 'SY-MSDS-GSR-DM 2017'
	JOIN RDS.DimProgramTypes dpt
		ON rfkse.K12ProgramTypeId = dpt.DimProgramTypeId
	JOIN RDS.DimK12Demographics dkd
		ON rfkse.K12DemographicId = dkd.DimK12DemographicId
	JOIN RDS.DimIdeaStatuses dis
		ON rfkse.IdeaStatusId = dis.DimIdeaStatusId
	JOIN RDS.DimDates countStartDate
		ON rfkse.ProgramParticipationStartDateId = countStartDate.DimDateId
	JOIN RDS.DimDates countEndDate
		ON rfkse.ProgramParticipationExitDateId = countEndDate.DimDateId
	LEFT JOIN Staging.K12Enrollment ske
		ON rdp.K12StudentIdentifierState = ske.StudentIdentifierState
		AND ISNULL(rdks.SchoolIdentifierSea, '') = ISNULL(ske.SchoolIdentifierSea, '')
		AND ISNULL(rdlsAcc.LeaIdentifierSea, '') = ISNULL(ske.LeaIdentifierSeaAccountability, '')
		AND ISNULL(rdlsAtt.LeaIdentifierSea, '') = ISNULL(ske.LeaIdentifierSeaAttendance, '')
		AND ISNULL(rdlsFun.LeaIdentifierSea, '') = ISNULL(ske.LeaIdentifierSeaFunding, '')
		AND ISNULL(rdlsGrad.LeaIdentifierSea, '') = ISNULL(ske.LeaIdentifierSeaGraduation, '')
		AND ISNULL(rdlsIep.LeaIdentifierSea, '') = ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')
		--AND ske.HispanicLatinoEthnicity = 1
		AND ISNULL(rddc.DataCollectionName, '') = ISNULL(ske.DataCollectionName, '')
		AND countStartDate.DateValue BETWEEN ske.RecordStartDateTime AND ISNULL(ske.RecordEndDateTime, GETDATE())
	LEFT JOIN Staging.K12PersonRace skpr
		ON rdp.K12StudentIdentifierState = skpr.StudentIdentifierState
		AND	ISNULL(rdks.SchoolIdentifierSea, '') = ISNULL(skpr.SchoolIdentifierSea, '')
		AND ISNULL(ske.ResponsibleSchoolTypeAttendance, 0)		= ISNULL(skpr.ResponsibleSchoolTypeAttendance, 0)
		AND ISNULL(ske.ResponsibleSchoolTypeAccountability, 0)	= ISNULL(skpr.ResponsibleSchoolTypeAccountability, 0)
		AND	ISNULL(rdlsAcc.LeaIdentifierSea, '') = ISNULL(skpr.LeaIdentifierSeaAccountability, '')
		AND ISNULL(rdlsAtt.LeaIdentifierSea, '') = ISNULL(skpr.LeaIdentifierSeaAttendance, '')
		AND ISNULL(rdlsFun.LeaIdentifierSea, '') = ISNULL(skpr.LeaIdentifierSeaFunding, '')
		AND ISNULL(rdlsGrad.LeaIdentifierSea, '') = ISNULL(skpr.LeaIdentifierSeaGraduation, '')
		AND ISNULL(rdlsIep.LeaIdentifierSea, '') = ISNULL(skpr.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(rddc.DataCollectionName, '') = ISNULL(skpr.DataCollectionName, '')
		AND countStartDate.DateValue	BETWEEN skpr.RecordStartDateTime AND ISNULL(skpr.RecordEndDateTime, GETDATE())

	Insert Into RDS.BridgeK12ProgramParticipationRaces
			(
			FactK12ProgramParticipationId       
			, [RaceId]                          
			)
	Select distinct t.FactK12ProgramParticipationId,rdr.DimRaceId From #temp t 
		join RDS.vwDimRaces rdr
			on t.SchoolYear=rdr.SchoolYear
				and Case When t.RaceType = 'MISSING' and t.HispanicLatinoEthnicity = 0 Then 'Race and Ethnicity Unknown'
						When t.RaceType = 'MISSING' and t.HispanicLatinoEthnicity = 1 Then 'HispanicorLatinoEthnicity'
					Else t.RaceType End = rdr.RaceMap
	
	DROP TABLE IF EXISTS #temp

END