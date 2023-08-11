/*    
	Copyright 2022 Common Education Data Standards
	----------------------------------------------
	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at
	
	    http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.


	Common Education Data Standards (CEDS)
    Version 10.0.0.0
	CEDS Junk Table Dimension Population Script
	  
    This script populates multiple Junk Dimension tables in the CEDS Data Warehouse
	version 10.0.0.0. It does not populate all of the tables. Additional work is underway
	to fully populate all of the Junk Dimension tables.

	Script 3 of 3
	To create the CEDS Data Warehouse including population of the dimension tables, the following 3 scripts are needed:

	Script 1: CEDS-Elements-V10.0.0.0
	Script 2: CEDS-Data-Warehouse-V10.0.0.0
	Script 3: Junk-Table-Dimension-Population-V10.0.0.0

	You must have the CEDS Data Warehouse version 10.0.0.0 installed first as well as
	the CEDS version 10.0.0.0 elements database. The CEDS schema tables house the element and option set information.
	These eight tables act as a source for the junk table dimension population.
      
    Questions on this script can be sent to https://ceds.ed.gov/ContactUs.aspx
      
    More information on the data model is available at the CEDS website:  
    http://ceds.ed.gov.
*/    

	SET NOCOUNT ON;

	------------------------------------------------
	-- Populate DimAeDemgraphics				 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAeDemographics d WHERE d.DimAeDemographicId = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimAeDemographics ON

		INSERT INTO [RDS].[DimAeDemographics]
			   ([DimAeDemographicId]
			   ,[EconomicDisadvantageStatusCode]
			   ,[EconomicDisadvantageStatusDescription]
			   ,[HomelessnessStatusCode]
			   ,[HomelessnessStatusDescription]
			   ,[EnglishLearnerStatusCode]
			   ,[EnglishLearnerStatusDescription]
			   ,[MigrantStatusCode]
			   ,[MigrantStatusDescription]
			   ,[MilitaryConnectedStudentIndicatorCode]
			   ,[MilitaryConnectedStudentIndicatorDescription]
			   ,[HomelessPrimaryNighttimeResidenceCode]
			   ,[HomelessPrimaryNighttimeResidenceDescription]
			   ,[HomelessUnaccompaniedYouthStatusCode]
			   ,[HomelessUnaccompaniedYouthStatusDescription]
			   ,[SexCode]
			   ,[SexDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimAeDemographics OFF

	END
	
	IF OBJECT_ID('tempdb..#EconomicDisadvantageStatus') IS NOT NULL
		DROP TABLE #EconomicDisadvantageStatus

	CREATE TABLE #EconomicDisadvantageStatus (EconomicDisadvantageStatusCode VARCHAR(50), EconomicDisadvantageStatusDescription VARCHAR(200), EconomicDisadvantageStatusEdFactsCode VARCHAR(100))

	INSERT INTO #EconomicDisadvantageStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EconomicDisadvantageStatus 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'Yes' THEN 'ECODIS'
			ELSE 'MISSING'
			END
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EconomicDisadvantageStatus'

	IF OBJECT_ID('tempdb..#HomelessnessStatus') IS NOT NULL
		DROP TABLE #HomelessnessStatus
	CREATE TABLE #HomelessnessStatus (HomelessnessStatusCode VARCHAR(50), HomelessnessStatusDescription VARCHAR(200), HomelessnessStatusEdFactsCode VARCHAR(50))

	INSERT INTO #HomelessnessStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #HomelessnessStatus 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'Yes' THEN 'ECODIS'
			ELSE 'MISSING'
			END
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'HomelessnessStatus'

	IF OBJECT_ID('tempdb..#EnglishLearnerStatus') IS NOT NULL
		DROP TABLE #EnglishLearnerStatus

	CREATE TABLE #EnglishLearnerStatus (EnglishLearnerStatusCode VARCHAR(50), EnglishLearnerStatusDescription VARCHAR(200))

	INSERT INTO #EnglishLearnerStatus VALUES ('MISSING', 'MISSING')
	INSERT INTO #EnglishLearnerStatus 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EnglishLearnerStatus'

	IF OBJECT_ID('tempdb..#MigrantStatus') IS NOT NULL
		DROP TABLE #MigrantStatus

	CREATE TABLE #MigrantStatus (MigrantStatusCode VARCHAR(50), MigrantStatusDescription VARCHAR(200))

	INSERT INTO #MigrantStatus VALUES ('MISSING', 'MISSING')
	INSERT INTO #MigrantStatus 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MigrantStatus'

	IF OBJECT_ID('tempdb..#MilitaryConnectedStudentIndicator') IS NOT NULL
		DROP TABLE #MilitaryConnectedStudentIndicator

	CREATE TABLE #MilitaryConnectedStudentIndicator (MilitaryConnectedStudentIndicatorCode VARCHAR(50), MilitaryConnectedStudentIndicatorDescription VARCHAR(200), MilitaryConnectedStudentIndicatorEdFactsCode VARCHAR(50))

	INSERT INTO #MilitaryConnectedStudentIndicator VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #MilitaryConnectedStudentIndicator 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'NotMilitaryConnected' THEN 'MISSING'
			WHEN 'NationalGuardOrReserve' THEN 'MILCNCTD'
			WHEN 'MISSING' THEN 'MISSING'
			WHEN 'ActiveDuty' THEN 'MILCNCTD'
			WHEN 'Unknown' THEN 'MISSING'
			ELSE 'MISSING'
			END
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MilitaryConnectedStudentIndicator'

	IF OBJECT_ID('tempdb..#HomelessPrimaryNighttimeResidence') IS NOT NULL
		DROP TABLE #HomelessPrimaryNighttimeResidence

	CREATE TABLE #HomelessPrimaryNighttimeResidence (HomelessPrimaryNighttimeResidenceCode VARCHAR(50), HomelessPrimaryNighttimeResidenceDescription VARCHAR(200))

	INSERT INTO #HomelessPrimaryNighttimeResidence VALUES ('MISSING', 'MISSING')
	INSERT INTO #HomelessPrimaryNighttimeResidence 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'HomelessPrimaryNighttimeResidence'

	IF OBJECT_ID('tempdb..#HomelessUnaccompaniedYouthStatus') IS NOT NULL
		DROP TABLE #HomelessUnaccompaniedYouthStatus

	CREATE TABLE #HomelessUnaccompaniedYouthStatus (HomelessUnaccompaniedYouthStatusCode VARCHAR(50), HomelessUnaccompaniedYouthStatusDescription VARCHAR(200))

	INSERT INTO #HomelessUnaccompaniedYouthStatus VALUES ('MISSING', 'MISSING')
	INSERT INTO #HomelessUnaccompaniedYouthStatus 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'HomelessUnaccompaniedYouthStatus'

	IF OBJECT_ID('tempdb..#Sex') IS NOT NULL
		DROP TABLE #Sex

	CREATE TABLE #Sex (SexCode VARCHAR(50), SexDescription VARCHAR(200))

	INSERT INTO #Sex VALUES ('MISSING', 'MISSING')
	INSERT INTO #Sex 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'Sex'


	INSERT INTO [RDS].[DimAeDemographics]
			([EconomicDisadvantageStatusCode]
			,[EconomicDisadvantageStatusDescription]
			,[HomelessnessStatusCode]
			,[HomelessnessStatusDescription]
			,[EnglishLearnerStatusCode]
			,[EnglishLearnerStatusDescription]
			,[MigrantStatusCode]
			,[MigrantStatusDescription]
			,[MilitaryConnectedStudentIndicatorCode]
			,[MilitaryConnectedStudentIndicatorDescription]
			,[HomelessPrimaryNighttimeResidenceCode]
			,[HomelessPrimaryNighttimeResidenceDescription]
			,[HomelessUnaccompaniedYouthStatusCode]
			,[HomelessUnaccompaniedYouthStatusDescription]
			,[SexCode]
			,[SexDescription])
	SELECT DISTINCT
			a.EconomicDisadvantageStatusCode
		, a.EconomicDisadvantageStatusDescription
		, b.HomelessnessStatusCode
		, b.HomelessnessStatusDescription
		, c.EnglishLearnerStatusCode
		, c.EnglishLearnerStatusDescription
		, d.MigrantStatusCode
		, d.MigrantStatusDescription
		, e.MilitaryConnectedStudentIndicatorCode
		, e.MilitaryConnectedStudentIndicatorDescription
		, f.HomelessPrimaryNighttimeResidenceCode
		, f.HomelessPrimaryNighttimeResidenceDescription
		, g.HomelessUnaccompaniedYouthStatusCode
		, g.HomelessUnaccompaniedYouthStatusDescription
		, h.SexCode
		, h.SexDescription
	FROM #EconomicDisadvantageStatus a
	CROSS JOIN #HomelessnessStatus b
	CROSS JOIN #EnglishLearnerStatus c
	CROSS JOIN #MigrantStatus d
	CROSS JOIN #MilitaryConnectedStudentIndicator e
	CROSS JOIN #HomelessPrimaryNighttimeResidence f
	CROSS JOIN #HomelessUnaccompaniedYouthStatus g
	CROSS JOIN #Sex h
	LEFT JOIN rds.DimAeDemographics main
		ON a.EconomicDisadvantageStatusCode = main.EconomicDisadvantageStatusCode
		AND b.HomelessnessStatusCode = main.HomelessnessStatusCode
		AND c.EnglishLearnerStatusCode = main.EnglishLearnerStatusCode
		AND d.MigrantStatusCode = main.MigrantStatusCode
		AND e.MilitaryConnectedStudentIndicatorCode = main.MilitaryConnectedStudentIndicatorCode
		AND f.HomelessPrimaryNighttimeResidenceCode = main.HomelessPrimaryNighttimeResidenceCode
		AND g.HomelessUnaccompaniedYouthStatusCode = main.HomelessUnaccompaniedYouthStatusCode
		AND h.SexCode = main.SexCode
	WHERE main.DimAeDemographicId IS NULL


	DROP TABLE #HomelessnessStatus
	DROP TABLE #EnglishLearnerStatus
	DROP TABLE #MigrantStatus
	DROP TABLE #HomelessUnaccompaniedYouthStatus
	DROP TABLE #HomelessPrimaryNighttimeResidence
	DROP TABLE #Sex



	------------------------------------------------
	-- Populate DimAeProgramTypes				 ---
	------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimAeProgramTypes d WHERE d.DimAeProgramTypeId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimAeProgramTypes ON

		INSERT INTO [RDS].[DimAeProgramTypes]
           ([DimAeProgramTypeId]
		   ,[AeInstructionalProgramTypeCode]
           ,[AeInstructionalProgramTypeDescription]
           ,[AeSpecialProgramTypeCode]
           ,[AeSpecialProgramTypeDescription]
           ,[WioaCareerServicesCode]
           ,[WioaCareerServicesDescription]
           ,[WioaTrainingServicesCode]
           ,[WioaTrainingServicesDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimAeProgramTypes OFF

	END
	

		CREATE TABLE #AeInstructionalProgramType (AeInstructionalProgramTypeCode VARCHAR(50), AeInstructionalProgramTypeDescription VARCHAR(200))

		INSERT INTO #AeInstructionalProgramType VALUES ('MISSING', 'MISSING')
		INSERT INTO #AeInstructionalProgramType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationInstructionalProgramType'

		CREATE TABLE #AeSpecialProgramType (AeSpecialProgramTypeCode VARCHAR(50), AeSpecialProgramTypeDescription VARCHAR(200))

		INSERT INTO #AeSpecialProgramType VALUES ('MISSING', 'MISSING')
		INSERT INTO #AeSpecialProgramType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationSpecialProgramType'

		CREATE TABLE #WioaCareerServiceType (WioaCareerServicesCode VARCHAR(50), WioaCareerServicesDescription VARCHAR(200))

		INSERT INTO #WioaCareerServiceType VALUES ('MISSING', 'MISSING')
		INSERT INTO #WioaCareerServiceType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'WioaCareerServices'

		CREATE TABLE #WioaTrainingServiceType (WioaTrainingServicesCode VARCHAR(50), WioaTrainingServicesDescription VARCHAR(200))

		INSERT INTO #WioaTrainingServiceType VALUES ('MISSING', 'MISSING')
		INSERT INTO #WioaTrainingServiceType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'WioaTrainingServices'


		INSERT INTO [RDS].[DimAeProgramTypes]
			([AeInstructionalProgramTypeCode]
			,[AeInstructionalProgramTypeDescription]
			,[AeSpecialProgramTypeCode]
			,[AeSpecialProgramTypeDescription]
			,[WioaCareerServicesCode]
			,[WioaCareerServicesDescription]
			,[WioaTrainingServicesCode]
			,[WioaTrainingServicesDescription])
		SELECT DISTINCT
			 a.[AeInstructionalProgramTypeCode]
			,a.[AeInstructionalProgramTypeDescription]
			,b.[AeSpecialProgramTypeCode]
			,b.[AeSpecialProgramTypeDescription]
			,c.[WioaCareerServicesCode]
			,c.[WioaCareerServicesDescription]
			,d.[WioaTrainingServicesCode]
			,d.[WioaTrainingServicesDescription]
		FROM #AeInstructionalProgramType a
		CROSS JOIN #AeSpecialProgramType b
		CROSS JOIN #WioaCareerServiceType c
		CROSS JOIN #WioaTrainingServiceType d
		LEFT JOIN rds.DimAeProgramTypes main
			ON a.AeInstructionalProgramTypeCode = main.AeInstructionalProgramTypeCode
			AND b.AeSpecialProgramTypeCode = main.AeSpecialProgramTypeCode
			AND c.WioaCareerServicesCode = main.WioaCareerServicesCode
			AND d.WioaTrainingServicesCode = main.WioaTrainingServicesCode
		WHERE main.DimAeProgramTypeId IS NULL


		DROP TABLE #AeInstructionalProgramType
		DROP TABLE #AeSpecialProgramType
		DROP TABLE #WioaCareerServiceType
		DROP TABLE #WioaTrainingServiceType


	------------------------------------------------
	-- Populate DimAeStudentStatuses			 ---
	------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimAeStudentStatuses d WHERE d.DimAeStudentStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimAeStudentStatuses ON

		INSERT INTO [RDS].[DimAeStudentStatuses]
           ([DimAeStudentStatusId]
		   ,[AeFunctioningLevelAtIntakeCode]
           ,[AeFunctioningLevelAtIntakeDescription]
           ,[AeFunctioningLevelAtPosttestCode]
           ,[AeFunctioningLevelAtPosttestDescription]
           ,[AePostsecondaryTransitionActionCode]
           ,[AePostsecondaryTransitionActionDescription]
           ,[EmployedWhileEnrolledCode]
           ,[EmployedWhileEnrolledDescription]
           ,[EmployedAfterExitCode]
           ,[EmployedAfterExitDescription]
           ,[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode]
           ,[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription]
           ,[AdultEducationCredentialAttainmentEmployedIndicatorCode]
           ,[AdultEducationCredentialAttainmentEmployedIndicatorDescription]
           ,[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode]
           ,[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimAeStudentStatuses OFF
	END
	

		CREATE TABLE #AeFunctioningLevelAtIntake (AeFunctioningLevelAtIntakeCode VARCHAR(50), AeFunctioningLevelAtIntakeDescription VARCHAR(200))

		INSERT INTO #AeFunctioningLevelAtIntake VALUES ('MISSING', 'MISSING')
		INSERT INTO #AeFunctioningLevelAtIntake 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AeFunctioningLevelAtIntake'

		CREATE TABLE #AeFunctioningLevelAtPosttest (AeFunctioningLevelAtPosttestCode VARCHAR(50), AeFunctioningLevelAtPosttestDescription VARCHAR(200))

		INSERT INTO #AeFunctioningLevelAtPosttest VALUES ('MISSING', 'MISSING')
		INSERT INTO #AeFunctioningLevelAtPosttest 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AeFunctioningLevelAtPosttest'

		CREATE TABLE #AePostsecondaryTransitionAction (AePostsecondaryTransitionActionCode VARCHAR(50), AePostsecondaryTransitionActionDescription VARCHAR(200))

		INSERT INTO #AePostsecondaryTransitionAction VALUES ('MISSING', 'MISSING')
		INSERT INTO #AePostsecondaryTransitionAction 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AePostsecondaryTransitionAction'

		CREATE TABLE #EmployedWhileEnrolled (EmployedWhileEnrolledCode VARCHAR(50), EmployedWhileEnrolledDescription VARCHAR(200))

		INSERT INTO #EmployedWhileEnrolled VALUES ('MISSING', 'MISSING')
		INSERT INTO #EmployedWhileEnrolled 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'EmployedWhileEnrolled'

		CREATE TABLE #EmployedAfterExit (EmployedAfterExitCode VARCHAR(50), EmployedAfterExitDescription VARCHAR(200))

		INSERT INTO #EmployedAfterExit VALUES ('MISSING', 'MISSING')
		INSERT INTO #EmployedAfterExit 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'EmployedAfterExit'

		CREATE TABLE #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator (AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode VARCHAR(50), AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription VARCHAR(200))

		INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator VALUES ('MISSING', 'MISSING')
		INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator'

		CREATE TABLE #AdultEducationCredentialAttainmentEmployedIndicator (AdultEducationCredentialAttainmentEmployedIndicatorCode VARCHAR(50),AdultEducationCredentialAttainmentEmployedIndicatorDescription VARCHAR(200))

		INSERT INTO #AdultEducationCredentialAttainmentEmployedIndicator VALUES ('MISSING', 'MISSING')
		INSERT INTO #AdultEducationCredentialAttainmentEmployedIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationCredentialAttainmentEmployedIndicator'

		CREATE TABLE #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator (AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode VARCHAR(50), AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription VARCHAR(200))

		INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator VALUES ('MISSING', 'MISSING')
		INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator'

		INSERT INTO [RDS].[DimAeStudentStatuses]
			([AeFunctioningLevelAtIntakeCode]
			,[AeFunctioningLevelAtIntakeDescription]
			,[AeFunctioningLevelAtPosttestCode]
			,[AeFunctioningLevelAtPosttestDescription]
			,[AePostsecondaryTransitionActionCode]
			,[AePostsecondaryTransitionActionDescription]
			,[EmployedWhileEnrolledCode]
			,[EmployedWhileEnrolledDescription]
			,[EmployedAfterExitCode]
			,[EmployedAfterExitDescription]
			,[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode]
			,[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription]
			,[AdultEducationCredentialAttainmentEmployedIndicatorCode]
			,[AdultEducationCredentialAttainmentEmployedIndicatorDescription]
			,[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode]
			,[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription])
		SELECT DISTINCT
			 a.[AeFunctioningLevelAtIntakeCode]
			,a.[AeFunctioningLevelAtIntakeDescription]
			,b.[AeFunctioningLevelAtPosttestCode]
			,b.[AeFunctioningLevelAtPosttestDescription]
			,c.[AePostsecondaryTransitionActionCode]
			,c.[AePostsecondaryTransitionActionDescription]
			,d.[EmployedWhileEnrolledCode]
			,d.[EmployedWhileEnrolledDescription]
			,e.[EmployedAfterExitCode]
			,e.[EmployedAfterExitDescription]
			,f.[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode]
			,f.[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription]
			,g.[AdultEducationCredentialAttainmentEmployedIndicatorCode]
			,g.[AdultEducationCredentialAttainmentEmployedIndicatorDescription]
			,h.[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode]
			,h.[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription]
		FROM #AeFunctioningLevelAtIntake a
		CROSS JOIN #AeFunctioningLevelAtPosttest b
		CROSS JOIN #AePostsecondaryTransitionAction c
		CROSS JOIN #EmployedWhileEnrolled d
		CROSS JOIN #EmployedAfterExit e
		CROSS JOIN #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator f
		CROSS JOIN #AdultEducationCredentialAttainmentEmployedIndicator g
		CROSS JOIN #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator h
		LEFT JOIN rds.DimAeStudentStatuses main
			ON a.AeFunctioningLevelAtIntakeCode = main.AeFunctioningLevelAtIntakeCode
			AND b.AeFunctioningLevelAtPosttestCode = main.AeFunctioningLevelAtPosttestCode
			AND c.AePostsecondaryTransitionActionCode = main.AePostsecondaryTransitionActionCode
			AND d.EmployedWhileEnrolledCode = main.EmployedWhileEnrolledCode
			AND e.EmployedAfterExitCode = main.EmployedAfterExitCode
			AND f.AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode = main.AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode
			AND g.AdultEducationCredentialAttainmentEmployedIndicatorCode = main.AdultEducationCredentialAttainmentEmployedIndicatorCode
			AND h.AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode = main.AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode
		WHERE main.DimAeStudentStatusId IS NULL


		DROP TABLE #AeFunctioningLevelAtIntake
		DROP TABLE #AeFunctioningLevelAtPosttest
		DROP TABLE #AePostsecondaryTransitionAction
		DROP TABLE #EmployedWhileEnrolled
		DROP TABLE #EmployedAfterExit
		DROP TABLE #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator
		DROP TABLE #AdultEducationCredentialAttainmentEmployedIndicator
		DROP TABLE #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator

	------------------------------------------------
	-- Populate DimRaces						 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimRaces d WHERE d.RaceCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimRaces ON

		INSERT INTO RDS.DimRaces (DimRaceId, RaceCode, RaceDescription, RaceEdFactsCode)
			VALUES (-1, 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimRaces OFF
	END

	INSERT INTO RDS.DimRaces
		(
			  RaceCode
			, RaceDescription
			, RaceEdFactsCode
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'AmericanIndianorAlaskaNative' THEN 'AM7'
			WHEN 'Asian' THEN 'AS7'
			WHEN 'BlackorAfricanAmerican' THEN 'BL7'
			WHEN 'NativeHawaiianorOtherPacificIslander' THEN 'PI7'
			WHEN 'White' THEN 'WH7'
			WHEN 'TwoorMoreRaces' THEN 'MU7'
			WHEN 'HispanicorLatinoEthnicity' THEN 'HI7'
			ELSE 'MISSING'
		  END
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN rds.DimRaces main
		ON ceds.CedsOptionSetCode = main.RaceCode
	WHERE main.RaceCode IS NULL
		AND ceds.CedsElementTechnicalName = 'Race'

	IF NOT EXISTS (SELECT 1 FROM RDS.DimRaces WHERE RaceCode = 'HispanicOrLatinoEthnicity') BEGIN
		INSERT INTO RDS.DimRaces (RaceCode, RaceDescription, RaceEdFactsCode) VALUES ('HispanicorLatinoEthnicity', 'Hispanic', 'HI7')
	END

	-------------------
	-- Populate DimAges
	-------------------
	-- Create MISSING record 
	IF NOT EXISTS (SELECT 1 FROM RDS.DimAges WHERE DimAgeId = -1) BEGIN 
		SET IDENTITY_INSERT RDS.DimAges ON;
		INSERT INTO RDS.DimAges (DimAgeId, AgeCode, AgeDescription, AgeEdFactsCode, AgeValue) VALUES (-1, 'MISSING', 'MISSING', 'MISSING', -1)
		SET IDENTITY_INSERT RDS.DimAges OFF;  
	END

	-- Create a temp table and fill it with ages 1-130
	CREATE TABLE #Ages (Age INT IDENTITY(1,1))

	DECLARE @loop INT = 1
	WHILE @loop <= 130 BEGIN
		INSERT INTO #Ages DEFAULT VALUES
		SET @loop = @loop + 1
	END

	-- Insert ages that aren't already in DimAges
	INSERT INTO RDS.DimAges
	SELECT CAST(Age AS VARCHAR(3)), 'Age ' + CAST(Age AS VARCHAR(3)), CAST(Age AS VARCHAR(3)), Age 
	FROM #Ages a
	LEFT JOIN RDS.DimAges da
		ON CAST(a.Age AS VARCHAR(3)) = da.AgeCode
	WHERE da.AgeCode IS NULL

	-- Drop the temp table
	DROP TABLE #Ages


	-----------------------------------------------------
	-- Populate DimDimK12SchoolStatuses		                   --
	-----------------------------------------------------
	SET NOCOUNT ON

	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12SchoolStatuses d WHERE d.DimK12SchoolStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimK12SchoolStatuses ON

		INSERT INTO [RDS].[DimK12SchoolStatuses]
           ([DimK12SchoolStatusId]
		   ,[MagnetOrSpecialProgramEmphasisSchoolCode]
           ,[MagnetOrSpecialProgramEmphasisSchoolDescription]
           ,[MagnetOrSpecialProgramEmphasisSchoolEdFactsCode]
           ,[NslpStatusCode]
           ,[NslpStatusDescription]
           ,[NslpStatusEdFactsCode]
           ,[SharedTimeIndicatorCode]
           ,[SharedTimeIndicatorDescription]
           ,[SharedTimeIndicatorEdFactsCode]
           ,[VirtualSchoolStatusCode]
           ,[VirtualSchoolStatusDescription]
           ,[VirtualSchoolStatusEdFactsCode]
           ,[SchoolImprovementStatusCode]
           ,[SchoolImprovementStatusDescription]
           ,[SchoolImprovementStatusEdFactsCode]
           ,[PersistentlyDangerousStatusCode]
           ,[PersistentlyDangerousStatusDescription]
           ,[PersistentlyDangerousStatusEdFactsCode]
           ,[StatePovertyDesignationCode]
           ,[StatePovertyDesignationDescription]
           ,[StatePovertyDesignationEdFactsCode]
           ,[ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode]
           ,[ProgressAchievingEnglishLanguageProficiencyIndicatorTypeDescription]
           ,[ProgressAchievingEnglishLanguageProficiencyIndicatorTypeEdFactsCode])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimK12SchoolStatuses OFF

	END

	CREATE TABLE #MagnetOrSpecialProgramEmphasisSchool (MagnetOrSpecialProgramEmphasisSchoolCode VARCHAR(50), MagnetOrSpecialProgramEmphasisSchoolDescription VARCHAR(200), MagnetOrSpecialProgramEmphasisSchoolEdFactsCode VARCHAR(200))

		INSERT INTO #MagnetOrSpecialProgramEmphasisSchool VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #MagnetOrSpecialProgramEmphasisSchool
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CASE
				when CedsOptionSetCode = 'All' then 'MAGYES'
				when CedsOptionSetCode = 'Some' then 'MAGYES'
				when CedsOptionSetCode = 'None' then 'MAGNO'
				else 'MISSING'
			END
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'MagnetOrSpecialProgramEmphasisSchool'


	CREATE TABLE #NationalSchoolLunchProgramStatus (NslpStatusCode VARCHAR(50), NslpStatusDescription VARCHAR(200), NslpStatusEdFactsCode VARCHAR(200))

		INSERT INTO #NationalSchoolLunchProgramStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #NationalSchoolLunchProgramStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'NationalSchoolLunchProgramStatus'



	CREATE TABLE #SharedTimeIndicator (SharedTimeIndicatorCode VARCHAR(50), SharedTimeIndicatorDescription VARCHAR(200), SharedTimeIndicatorEdFactsCode VARCHAR(200))

		INSERT INTO #SharedTimeIndicator VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #SharedTimeIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'SharedTimeIndicator'



	CREATE TABLE #VirtualSchoolStatus (VirtualSchoolStatusCode VARCHAR(50), VirtualSchoolStatusDescription VARCHAR(200), VirtualSchoolStatusEdFactsCode VARCHAR(200))

		INSERT INTO #VirtualSchoolStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #VirtualSchoolStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CASE
				when CedsOptionSetCode = 'SupplementalVirtual' then 'SUPPVIRTUAL'
				else CedsOptionSetCode
			END
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'VirtualSchoolStatus'

	-- This is no longer used in EdFacts.  Setting the EdFacts values to MISSING
	CREATE TABLE #SchoolImprovementStatus (SchoolImprovementStatusCode VARCHAR(50), SchoolImprovementStatusDescription VARCHAR(200), SchoolImprovementStatusEdFactsCode VARCHAR(200))

		INSERT INTO #SchoolImprovementStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #SchoolImprovementStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, 'MISSING' AS EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'SchoolImprovementStatus'


	CREATE TABLE #PersistentlyDangerousStatus (PersistentlyDangerousStatusCode VARCHAR(50), PersistentlyDangerousStatusDescription VARCHAR(200), PersistentlyDangerousStatusEdFactsCode VARCHAR(200))

		INSERT INTO #PersistentlyDangerousStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #PersistentlyDangerousStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'PersistentlyDangerousStatus'



	CREATE TABLE #StatePovertyDesignation (StatePovertyDesignationCode VARCHAR(50), StatePovertyDesignationDescription VARCHAR(200), StatePovertyDesignationEdFactsCode VARCHAR(200))

		INSERT INTO #StatePovertyDesignation VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #StatePovertyDesignation 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CASE
				when CedsOptionSetCode = 'HighQuartile' then 'HIGH'
				when CedsOptionSetCode = 'LowQuartile' then 'LOW'
				when CedsOptionSetCode = 'Neither' then 'NEITHER'
				else 'MISSING'
			END
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'StatePovertyDesignation'


	CREATE TABLE #ProgressAchievingEnglishLanguageProficiencyIndicatorType(ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode VARCHAR(50), ProgressAchievingEnglishLanguageProficiencyIndicatorTypeDescription VARCHAR(200), ProgressAchievingEnglishLanguageProficiencyIndicatorTypeEdFactsCode VARCHAR(200))

		INSERT INTO #ProgressAchievingEnglishLanguageProficiencyIndicatorType VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #ProgressAchievingEnglishLanguageProficiencyIndicatorType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'ProgressAchievingEnglishLanguageProficiencyIndicatorType'



		INSERT INTO [RDS].[DimK12SchoolStatuses]
           ([MagnetOrSpecialProgramEmphasisSchoolCode]
           ,[MagnetOrSpecialProgramEmphasisSchoolDescription]
           ,[MagnetOrSpecialProgramEmphasisSchoolEdFactsCode]
           ,[NslpStatusCode]
           ,[NslpStatusDescription]
           ,[NslpStatusEdFactsCode]
           ,[SharedTimeIndicatorCode]
           ,[SharedTimeIndicatorDescription]
           ,[SharedTimeIndicatorEdFactsCode]
           ,[VirtualSchoolStatusCode]
           ,[VirtualSchoolStatusDescription]
           ,[VirtualSchoolStatusEdFactsCode]
           ,[SchoolImprovementStatusCode]
           ,[SchoolImprovementStatusDescription]
           ,[SchoolImprovementStatusEdFactsCode]
           ,[PersistentlyDangerousStatusCode]
           ,[PersistentlyDangerousStatusDescription]
           ,[PersistentlyDangerousStatusEdFactsCode]
           ,[StatePovertyDesignationCode]
           ,[StatePovertyDesignationDescription]
           ,[StatePovertyDesignationEdFactsCode]
           ,[ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode]
           ,[ProgressAchievingEnglishLanguageProficiencyIndicatorTypeDescription]
           ,[ProgressAchievingEnglishLanguageProficiencyIndicatorTypeEdFactsCode])

		SELECT DISTINCT
			  a.MagnetOrSpecialProgramEmphasisSchoolCode
			, a.MagnetOrSpecialProgramEmphasisSchoolDescription
			, a.MagnetOrSpecialProgramEmphasisSchoolEdFactsCode
			
			, b.NslpStatusCode
			, b.NslpStatusDescription
			, b.NslpStatusEdFactsCode
			
			, c.SharedTimeIndicatorCode
			, c.SharedTimeIndicatorDescription
			, c.SharedTimeIndicatorEdFactsCode
			
			, d.VirtualSchoolStatusCode
			, d.VirtualSchoolStatusDescription
			, d.VirtualSchoolStatusEdFactsCode

			, e.SchoolImprovementStatusCode
			, e.SchoolImprovementStatusDescription
			, e.SchoolImprovementStatusEdFactsCode

			, f.PersistentlyDangerousStatusCode
			, f.PersistentlyDangerousStatusDescription
			, f.PersistentlyDangerousStatusEdFactsCode

			, g.StatePovertyDesignationCode
			, g.StatePovertyDesignationDescription
			, g.StatePovertyDesignationEdFactsCode

			, h.ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode
			, h.ProgressAchievingEnglishLanguageProficiencyIndicatorTypeDescription
			, h.ProgressAchievingEnglishLanguageProficiencyIndicatorTypeEdFactsCode

		FROM #MagnetOrSpecialProgramEmphasisSchool a
		CROSS JOIN #NationalSchoolLunchProgramStatus b
		CROSS JOIN #SharedTimeIndicator c
		CROSS JOIN #VirtualSchoolStatus d

		CROSS JOIN #SchoolImprovementStatus e
		CROSS JOIN #PersistentlyDangerousStatus f
		CROSS JOIN #StatePovertyDesignation g
		CROSS JOIN #ProgressAchievingEnglishLanguageProficiencyIndicatorType h


		LEFT JOIN RDS.DimK12SchoolStatuses main
			ON a.MagnetOrSpecialProgramEmphasisSchoolCode = main.MagnetOrSpecialProgramEmphasisSchoolCode
			AND b.NslpStatusCode = main.NslpStatusCode
			AND c.SharedTimeIndicatorCode = main.SharedTimeIndicatorCode
			AND d.VirtualSchoolStatusCode = main.VirtualSchoolStatusCode
			AND e.SchoolImprovementStatusCode = main.SchoolImprovementStatusCode
			AND f.PersistentlyDangerousStatusCode = main.PersistentlyDangerousStatusCode
			AND g.StatePovertyDesignationCode = main.StatePovertyDesignationCode
			AND h.ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode = main.ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode


		WHERE main.DimK12SchoolStatusId IS NULL

	DROP TABLE #MagnetOrSpecialProgramEmphasisSchool
	DROP TABLE #NationalSchoolLunchProgramStatus
	DROP TABLE #SharedTimeIndicator
	DROP TABLE #VirtualSchoolStatus

	DROP TABLE #SchoolImprovementStatus
	DROP TABLE #PersistentlyDangerousStatus
	DROP TABLE #StatePovertyDesignation
	DROP TABLE #ProgressAchievingEnglishLanguageProficiencyIndicatorType




	---------------------------------
	-- Populate DimK12ProgramTypes
	---------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12ProgramTypes WHERE ProgramTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimK12ProgramTypes ON

		INSERT INTO RDS.DimK12ProgramTypes (DimK12ProgramTypeId, ProgramTypeCode, ProgramTypeDescription, ProgramTypeDefinition)
			VALUES (-1, 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimK12ProgramTypes OFF
	END

	INSERT INTO RDS.DimK12ProgramTypes
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
		, ceds.CedsOptionSetDefinition
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimK12ProgramTypes main
		ON ceds.CedsOptionSetCode = main.ProgramTypeCode
	WHERE main.ProgramTypeCode IS NULL
		AND ceds.CedsElementName = 'Program Type'

	---------------------------------
	-- Populate DimSchoolYears
	---------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimSchoolYears s WHERE s.SchoolYear = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimSchoolYears ON

		INSERT INTO RDS.DimSchoolYears (DimSchoolYearId, SchoolYear, SessionBeginDate, SessionEndDate)
			VALUES (-1, -1, '1/1/1900', '1/1/1900')

		SET IDENTITY_INSERT RDS.DimSchoolYears OFF
	END

	-- Set the start and end years
	DECLARE @startYear INT = 1900;
	DECLARE @endYear INT = 2100;

	-- Initialize a counter variable
	DECLARE @year INT = @startYear;

	-- Loop through all the years and insert into the table
	WHILE @year <= @endYear
	BEGIN
		-- Calculate the session begin and end dates for each year
		DECLARE @beginDate DATE = DATEFROMPARTS(@year - 1, 7, 1);
		DECLARE @endDate DATE = DATEFROMPARTS(@year, 6, 30);
		
		-- Insert the data into the table
		IF NOT EXISTS (SELECT 1 FROM RDS.DimSchoolYears WHERE SchoolYear = @year) BEGIN
			INSERT INTO RDS.DimSchoolYears (SchoolYear, SessionBeginDate, SessionEndDate)
			VALUES (@year, @beginDate, @endDate);
		END

		-- Increment the counter variable
		SET @year = @year + 1;
	END

	------------------------------------------------
	-- Populate DimK12CourseStatuses			 ---
	------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12CourseStatuses d WHERE d.CourseLevelCharacteristicCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimK12CourseStatuses ON

		INSERT INTO RDS.DimK12CourseStatuses(DimK12CourseStatusId,CourseLevelCharacteristicCode, CourseLevelCharacteristicDescription)
		VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimK12CourseStatuses OFF
	END

	INSERT INTO RDS.DimK12CourseStatuses
		(
		  CourseLevelCharacteristicCode        
		, CourseLevelCharacteristicDescription     
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN rds.DimK12CourseStatuses main
		ON ceds.CedsOptionSetCode = main.CourseLevelCharacteristicCode
	WHERE main.DimK12CourseStatusId IS NULL
		AND ceds.CedsElementName = 'Course Level Characteristic'

	------------------------------------------------
	-- Populate DimDates						 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimDates d WHERE d.DimDateId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimDates ON

		INSERT INTO RDS.DimDates ([DimDateId], [DateValue], [Day], [DayOfWeek], [DayOfYear], [Month], [MonthName], SubmissionYear, [Year] )
			VALUES (-1, '1/1/1900', -1, 'MISSING', -1, -1, 'MISSING', 'MISSING', -1)

		SET IDENTITY_INSERT RDS.DimDates OFF
	END

	DECLARE @start DATE = '2000-01-01', @end DATE= '2050-12-31'

	WHILE @start <= @end
	BEGIN
		INSERT INTO RDS.DimDates (
			  DateValue
			, [Day]
			, [DayOfWeek]
			, [DayOfYear]
			, [Month]
			, [MonthName]
			, SubmissionYear
			, [Year] )
		SELECT 
			  @start
			, DATEPART(dd,@start)
			, DATEPART(dw,@start)
			, DATEPART(dy,@start) 
			, DATEPART(mm,@start)
			, DATENAME(mm,@start)
			, CASE 
				WHEN CAST(DATEPART(mm, @start) AS INT) >= 7 THEN YEAR(@start) + 1
				ELSE YEAR(@start)
			  END
			, YEAR(@start)
		WHERE NOT EXISTS (SELECT 1 FROM RDS.DimDates WHERE DateValue = @start)
	
		SET @start = DATEADD(dd,1,@start)
	  END


	------------------------------------------------
	-- Populate DimPsAcademicAwardStatuses		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimPsAcademicAwardStatuses d WHERE d.DimPsAcademicAwardStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimPsAcademicAwardStatuses ON

		INSERT INTO [RDS].[DimPsAcademicAwardStatuses]
           ([DimPsAcademicAwardStatusId]
		   ,[PescAwardLevelTypeCode]
           ,[PescAwardLevelTypeDescription]
           ,[ProfessionalOrTechnicalCredentialConferredCode]
           ,[ProfessionalOrTechnicalCredentialConferredDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimPsAcademicAwardStatuses OFF
	END


	CREATE TABLE #PescAwardLevelType (PescAwardLevelTypeCode VARCHAR(50), PescAwardLevelTypeDescription VARCHAR(200))

	INSERT INTO #PescAwardLevelType VALUES ('MISSING', 'MISSING')
	INSERT INTO #PescAwardLevelType 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PescAwardLevelType'

	CREATE TABLE #ProfessionalOrTechnicalCredentialConferred (ProfessionalOrTechnicalCredentialConferredCode VARCHAR(50), ProfessionalOrTechnicalCredentialConferredDescription VARCHAR(200))

	INSERT INTO #ProfessionalOrTechnicalCredentialConferred VALUES ('MISSING', 'MISSING')
	INSERT INTO #ProfessionalOrTechnicalCredentialConferred
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ProfessionalOrTechnicalCredentialConferred'

	-- Populate RDS.DimPsAcademicAwardStatuses
	INSERT INTO RDS.DimPsAcademicAwardStatuses
	SELECT
		  a.PescAwardLevelTypeCode
		, a.PescAwardLevelTypeDescription
		, b.ProfessionalOrTechnicalCredentialConferredCode
		, b.ProfessionalOrTechnicalCredentialConferredDescription
	FROM #PescAwardLevelType a
	CROSS JOIN #ProfessionalOrTechnicalCredentialConferred b
	LEFT JOIN RDS.DimPsAcademicAwardStatuses main
		ON a.PescAwardLevelTypeCode = main.PescAwardLevelTypeCode
		AND b.ProfessionalOrTechnicalCredentialConferredCode = main.ProfessionalOrTechnicalCredentialConferredCode
	WHERE main.DimPsAcademicAwardStatusId IS NULL

	DROP TABLE #PescAwardLevelType
	DROP TABLE #ProfessionalOrTechnicalCredentialConferred


	------------------------------------------------
	-- Populate DimPsEnrollmentStatuses			 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimPsEnrollmentStatuses d WHERE d.PostsecondaryExitOrWithdrawalTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimPsEnrollmentStatuses ON

		INSERT INTO RDS.DimPsEnrollmentStatuses (DimPsEnrollmentStatusId, PostsecondaryExitOrWithdrawalTypeCode, PostsecondaryExitOrWithdrawalTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimPsEnrollmentStatuses OFF
	END

	INSERT INTO RDS.DimPsEnrollmentStatuses
		(
			  PostsecondaryExitOrWithdrawalTypeCode
			, PostsecondaryExitOrWithdrawalTypeDescription
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN rds.DimPsEnrollmentStatuses main
		ON ceds.CedsOptionSetCode = main.PostsecondaryExitOrWithdrawalTypeCode
	WHERE main.DimPsEnrollmentStatusId IS NULL
		AND ceds.CedsElementTechnicalName = 'PostsecondaryExitOrWithdrawalType'


	------------------------------------------------
	-- Populate DimK12EnrollmentStatuses			 ---
	------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12EnrollmentStatuses d WHERE d.DimK12EnrollmentStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimK12EnrollmentStatuses ON

		INSERT INTO [RDS].[DimK12EnrollmentStatuses]
           ([DimK12EnrollmentStatusId]
		   ,[EnrollmentStatusCode]
           ,[EnrollmentStatusDescription]
           ,[EntryTypeCode]
           ,[EntryTypeDescription]
           ,[ExitOrWithdrawalTypeCode]
           ,[ExitOrWithdrawalTypeDescription]
           ,[PostSecondaryEnrollmentStatusCode]
           ,[PostSecondaryEnrollmentStatusDescription]
           ,[PostSecondaryEnrollmentStatusEdFactsCode]
           ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode]
           ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription]
           ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode]
           ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode]
           ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription]
           ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimK12EnrollmentStatuses OFF
	END

	CREATE TABLE #EnrollmentStatus (EnrollmentStatusCode VARCHAR(50), EnrollmentStatusDescription VARCHAR(200))

	INSERT INTO #EnrollmentStatus VALUES ('MISSING', 'MISSING')
	INSERT INTO #EnrollmentStatus 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EnrollmentStatus'

	CREATE TABLE #EntryType (EntryTypeCode VARCHAR(50), EntryTypeDescription VARCHAR(200))

	INSERT INTO #EntryType VALUES ('MISSING', 'MISSING')
	INSERT INTO #EntryType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EntryType'

	CREATE TABLE #ExitOrWithdrawalType (ExitOrWithdrawalTypeCode VARCHAR(50), ExitOrWithdrawalTypeDescription VARCHAR(200))

	INSERT INTO #ExitOrWithdrawalType VALUES ('MISSING', 'MISSING')
	INSERT INTO #ExitOrWithdrawalType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ExitOrWithdrawalType'

	CREATE TABLE #PostSecondaryEnrollmentStatus (PostSecondaryEnrollmentStatusCode VARCHAR(50), PostSecondaryEnrollmentStatusDescription VARCHAR(200), PostSecondaryEnrollmentStatusEdFactsCode VARCHAR(50))

	INSERT INTO #PostSecondaryEnrollmentStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #PostSecondaryEnrollmentStatus 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PostSecondaryEnrollmentStatus'

	CREATE TABLE #EdFactsAcademicOrCareerAndTechnicalOutcomeType (EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode VARCHAR(50), EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription VARCHAR(200), EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode VARCHAR(50))

	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeType VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EdFactsAcademicOrCareerAndTechnicalOutcomeType'

	CREATE TABLE #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType (EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode VARCHAR(50), EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription VARCHAR(200), EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode VARCHAR(50))

	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping WHERE CedsElementTechnicalName = 'EdFactsAcademicOrCareerAndTechnicalOutcomeExitType'


	INSERT INTO RDS.DimK12EnrollmentStatuses
		([EnrollmentStatusCode]
		,[EnrollmentStatusDescription]
		,[EntryTypeCode]
		,[EntryTypeDescription]
		,[ExitOrWithdrawalTypeCode]
		,[ExitOrWithdrawalTypeDescription]
		,[PostSecondaryEnrollmentStatusCode]
		,[PostSecondaryEnrollmentStatusDescription]
		,[PostSecondaryEnrollmentStatusEdFactsCode]
        ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode]
        ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription]
        ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode]
        ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode]
        ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription]
        ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode])
	SELECT DISTINCT
		  a.EnrollmentStatusCode
		, a.EnrollmentStatusDescription
		, b.EntryTypeCode
		, b.EntryTypeDescription
		, c.ExitOrWithdrawalTypeCode
		, c.ExitOrWithdrawalTypeDescription
		, d.PostSecondaryEnrollmentStatusCode
		, d.PostSecondaryEnrollmentStatusDescription
		, d.PostSecondaryEnrollmentStatusEdFactsCode
		, e.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode
		, e.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription
		, e.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode
		, f.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode
		, f.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription
		, f.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode
	FROM #EnrollmentStatus a
	CROSS JOIN #EntryType b
	CROSS JOIN #ExitOrWithdrawalType c
	CROSS JOIN #PostSecondaryEnrollmentStatus d
	CROSS JOIN #EdFactsAcademicOrCareerAndTechnicalOutcomeType e
	CROSS JOIN #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType f
	LEFT JOIN rds.DimK12EnrollmentStatuses main
		ON a.EnrollmentStatusCode = main.EnrollmentStatusCode
		AND b.EntryTypeCode = main.EntryTypeCode
		AND c.ExitOrWithdrawalTypeCode = main.ExitOrWithdrawalTypeCode
		AND d.PostSecondaryEnrollmentStatusCode = main.PostSecondaryEnrollmentStatusCode
		AND e.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode = main.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode
		AND f.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode = main.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode
	WHERE main.DimK12EnrollmentStatusId IS NULL

	DROP TABLE #EnrollmentStatus
	DROP TABLE #EntryType
	DROP TABLE #ExitOrWithdrawalType
	DROP TABLE #PostSecondaryEnrollmentStatus
	DROP TABLE #EdFactsAcademicOrCareerAndTechnicalOutcomeType
	DROP TABLE #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType



	------------------------------------------------
	-- Populate DimPsInstitutionStatuses		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimPsInstitutionStatuses d WHERE d.DimPsInstitutionStatusId= -1) BEGIN
		SET IDENTITY_INSERT RDS.DimPsInstitutionStatuses ON

		INSERT INTO RDS.DimPsInstitutionStatuses (
			  DimPsInstitutionStatusId
			, LevelOfInstitutionCode
			, LevelOfInstitutionDescription
			, ControlOfInstitutionCode
			, ControlOfInstitutionDescription
			, VirtualIndicatorCode
			, VirtualIndicatorDescription
			, CarnegieBasicClassificationCode
			, CarnegieBasicClassificationDescription
			, MostPrevalentLevelOfInstitutionCode
			, MostPrevalentLevelOfInstitutionDescription
			, PredominantCalendarSystemCode
			, PredominantCalendarSystemDescription
			)
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimPsInstitutionStatuses OFF
	END

	CREATE TABLE #LevelOfInstitution (LevelOfInstitutionCode VARCHAR(50), LevelOfInstitutionDescription VARCHAR(200))

	INSERT INTO #LevelOfInstitution VALUES ('MISSING', 'MISSING')
	INSERT INTO #LevelOfInstitution 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'LevelOfInstitution'

	CREATE TABLE #ControlOfInstitution (ControlOfInstitutionCode VARCHAR(50), ControlOfInstitutionDescription VARCHAR(200))

	INSERT INTO #ControlOfInstitution VALUES ('MISSING', 'MISSING')
	INSERT INTO #ControlOfInstitution
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ControlOfInstitution'

	CREATE TABLE #CarnegieBasicClassification (CarnegieBasicClassificationCode VARCHAR(50), CarnegieBasicClassificationDescription VARCHAR(200))

	INSERT INTO #CarnegieBasicClassification VALUES ('MISSING', 'MISSING')
	INSERT INTO #CarnegieBasicClassification 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CarnegieBasicClassification'

	CREATE TABLE #VirtualIndicator (VirtualIndicatorCode VARCHAR(50), VirtualIndicatorDescription VARCHAR(200))

	INSERT INTO #VirtualIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #VirtualIndicator 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'VirtualIndicator'

	CREATE TABLE #MostPrevalentLevelOfInstitution (MostPrevalentLevelOfInstitutionStatusCode VARCHAR(50), MostPrevalentLevelOfInstitutionDescription VARCHAR(200))

	INSERT INTO #MostPrevalentLevelOfInstitution VALUES ('MISSING', 'MISSING')
	INSERT INTO #MostPrevalentLevelOfInstitution 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MostPrevalentLevelOfInstitution'
	
	CREATE TABLE #PredominantCalendarSystem (PredominantCalendarSystemCode VARCHAR(50), PredominantCalendarSystemDescription VARCHAR(200))

	INSERT INTO #PredominantCalendarSystem VALUES ('MISSING', 'MISSING')
	INSERT INTO #PredominantCalendarSystem 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PredominantCalendarSystem'

	
	INSERT INTO RDS.DimPsInstitutionStatuses (
			  LevelOfInstitutionCode
			, LevelOfInstitutionDescription
			, ControlOfInstitutionCode
			, ControlOfInstitutionDescription
			, VirtualIndicatorCode
			, VirtualIndicatorDescription
			, CarnegieBasicClassificationCode
			, CarnegieBasicClassificationDescription
			, MostPrevalentLevelOfInstitutionCode
			, MostPrevalentLevelOfInstitutionDescription
			, PredominantCalendarSystemCode
			, PredominantCalendarSystemDescription
			)		
	SELECT DISTINCT
		  a.LevelOfInstitutionCode
		, a.LevelOfInstitutionDescription
		, b.ControlOfInstitutionCode
		, b.ControlOfInstitutionDescription
		, c.CarnegieBasicClassificationCode
		, c.CarnegieBasicClassificationDescription
		, d.VirtualIndicatorCode
		, d.VirtualIndicatorDescription
		, e.MostPrevalentLevelOfInstitutionStatusCode
		, e.MostPrevalentLevelOfInstitutionDescription
		, f.PredominantCalendarSystemCode
		, f.PredominantCalendarSystemDescription
	FROM #LevelOfInstitution a
	CROSS JOIN #ControlOfInstitution b
	CROSS JOIN #CarnegieBasicClassification c
	CROSS JOIN #VirtualIndicator d
	CROSS JOIN #MostPrevalentLevelOfInstitution e
	CROSS JOIN #PredominantCalendarSystem f
	LEFT JOIN rds.DimPsInstitutionStatuses main
		ON a.LevelOfInstitutionCode = main.LevelOfInstitutionCode
		AND b.ControlOfInstitutionCode = main.ControlOfInstitutionCode
		AND c.CarnegieBasicClassificationCode = main.CarnegieBasicClassificationCode
		AND d.VirtualIndicatorCode = main.VirtualIndicatorCode
		AND e.MostPrevalentLevelOfInstitutionStatusCode = main.MostPrevalentLevelOfInstitutionCode
		AND f.PredominantCalendarSystemCode = main.PredominantCalendarSystemCode
	WHERE main.DimPsInstitutionStatusId IS NULL

	DROP TABLE #LevelOfInstitution
	DROP TABLE #CarnegieBasicClassification
	DROP TABLE #ControlOfInstitution
	DROP TABLE #VirtualIndicator
	DROP TABLE #MostPrevalentLevelOfInstitution
	DROP TABLE #PredominantCalendarSystem


	------------------------------------------------
	-- Populate DimProgramTypes					 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimProgramTypes d WHERE d.ProgramTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimProgramTypes ON

		INSERT INTO RDS.DimProgramTypes (DimProgramTypeId, ProgramTypeCode, ProgramTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimProgramTypes OFF
	END

	INSERT INTO RDS.DimProgramTypes
		(
			  ProgramTypeCode
			, ProgramTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN rds.DimProgramTypes main
		ON ceds.CedsOptionSetCode = main.ProgramTypeCode
	WHERE main.DimProgramTypeId IS NULL


	------------------------------------------------
	-- Populate DimAcademicTermDesignators		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAcademicTermDesignators d WHERE d.AcademicTermDesignatorCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimAcademicTermDesignators ON

		INSERT INTO RDS.DimAcademicTermDesignators (DimAcademicTermDesignatorId, AcademicTermDesignatorCode, AcademicTermDesignatorDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAcademicTermDesignators OFF
	END

	INSERT INTO RDS.DimAcademicTermDesignators
		(
			  AcademicTermDesignatorCode
			, AcademicTermDesignatorDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAcademicTermDesignators main
		ON ceds.CedsOptionSetCode = main.AcademicTermDesignatorCode
	WHERE main.DimAcademicTermDesignatorId IS NULL
		AND ceds.CedsElementTechnicalName = 'AcademicTermDesignator'

	-----------------------------------------------------
	-- Populate DimDisabilityStatuses				   --
	-----------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM [RDS].[DimDisabilityStatuses] d WHERE d.DisabilityStatusCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT rds.DimDisabilityStatuses ON

			INSERT INTO rds.DimDisabilityStatuses (
						DimDisabilityStatusId
						, DisabilityStatusCode
						, DisabilityStatusDescription
						, Section504StatusCode
						, Section504StatusDescription
						, Section504StatusEdFactsCode
						, DisabilityConditionTypeCode
						, DisabilityConditionTypeDescription
						, DisabilityDeterminationSourceTypeCode
						, DisabilityDeterminationSourceTypeDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')

		SET IDENTITY_INSERT rds.DimDisabilityStatuses OFF
	END

	CREATE TABLE #DisabilityConditionType (DisabilityConditionTypeCode VARCHAR(50), DisabilityConditionTypeDescription VARCHAR(200))

	INSERT INTO #DisabilityConditionType VALUES ('MISSING', 'MISSING')
	INSERT INTO #DisabilityConditionType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping WHERE CedsElementTechnicalName = 'DisabilityConditionType'

	CREATE TABLE #DisabilityDeterminationSourceType (DisabilityDeterminationSourceTypeCode VARCHAR(50), DisabilityDeterminationSourceTypeDescription VARCHAR(200))

	INSERT INTO #DisabilityDeterminationSourceType VALUES ('MISSING', 'MISSING')
	INSERT INTO #DisabilityDeterminationSourceType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping WHERE CedsElementTechnicalName = 'DisabilityDeterminationSourceType'

	INSERT INTO rds.DimDisabilityStatuses 
		(
			DisabilityStatusCode
			, DisabilityStatusDescription
			, Section504StatusCode
			, Section504StatusDescription
			, Section504StatusEdFactsCode
			, DisabilityConditionTypeCode
			, DisabilityConditionTypeDescription
			, DisabilityDeterminationSourceTypeCode
			, DisabilityDeterminationSourceTypeDescription
		)
	SELECT 
		  Disability.CedsOptionSetCode
		, Disability.CedsOptionSetDescription
		, Section504.CedsOptionSetCode
		, Section504.CedsOptionSetDescription
		, Section504.EdFactsCode
		, dct.DisabilityConditionTypeCode
		, dct.DisabilityConditionTypeDescription
		, ddst.DisabilityDeterminationSourceTypeCode
		, ddst.DisabilityDeterminationSourceTypeDescription
	FROM (VALUES('Yes', 'Disability students'),('No', 'Not a Disability students'),('MISSING', 'MISSING')) Disability (CedsOptionSetCode, CedsOptionSetDescription)
	CROSS JOIN (VALUES('YES', 'Section 504 Students', 'SECTION504'),('NO', 'Non Section 504 Students','NONSECTION504'),('MISSING', 'MISSING', 'MISSING')) Section504 (CedsOptionSetCode, CedsOptionSetDescription, EdFactsCode)
	CROSS JOIN #DisabilityConditionType dct
	CROSS JOIN #DisabilityDeterminationSourceType ddst
	LEFT JOIN rds.DimDisabilityStatuses dds
	ON Disability.CedsOptionSetCode = dds.DisabilityStatusCode
		AND Section504.CedsOptionSetCode = dds.Section504StatusCode
		AND dct.DisabilityConditionTypeCode = dds.DisabilityConditionTypeCode
		AND ddst.DisabilityDeterminationSourceTypeCode = dds.DisabilityDeterminationSourceTypeCode
	WHERE dds.DimDisabilityStatusId IS NULL

	DROP TABLE #DisabilityConditionType
	DROP TABLE #DisabilityDeterminationSourceType


	-----------------------------------------------------
	-- Populate DimEnglishLearnerStatuses				   --
	-----------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM rds.DimEnglishLearnerStatuses d WHERE d.EnglishLearnerStatusCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT rds.DimEnglishLearnerStatuses ON

			INSERT INTO rds.DimEnglishLearnerStatuses (
						DimEnglishLearnerStatusId
						, EnglishLearnerStatusCode
						, EnglishLearnerStatusDescription
						, EnglishLearnerStatusEdFactsCode
						, PerkinsEnglishLearnerStatusCode
						, PerkinsEnglishLearnerStatusDescription
						, PerkinsEnglishLearnerStatusEdfactsCode
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')

		SET IDENTITY_INSERT rds.DimEnglishLearnerStatuses OFF
	END

	INSERT INTO rds.DimEnglishLearnerStatuses 
		(
			EnglishLearnerStatusCode
			, EnglishLearnerStatusDescription
			, EnglishLearnerStatusEdFactsCode
			, PerkinsEnglishLearnerStatusCode
			, PerkinsEnglishLearnerStatusDescription
			, PerkinsEnglishLearnerStatusEdfactsCode
		)
	SELECT 
		  EnglishLearner.CedsOptionSetCode
		, EnglishLearner.CedsOptionSetDescription
		, EnglishLearner.EdFactsCode
		, PerkinsEnglishLearner.CedsOptionSetCode
		, PerkinsEnglishLearner.CedsOptionSetDescription
		, PerkinsEnglishLearner.EdFactsCode
	FROM (VALUES('Yes', 'Limited English proficient (LEP) Student', 'LEP'),('No', 'Non-limited English proficient (non-LEP) Student', 'NLEP'),('MISSING', 'MISSING', 'MISSING')) EnglishLearner (CedsOptionSetCode, CedsOptionSetDescription, EdFactsCode)
	CROSS JOIN (VALUES('YES', 'Perkins EL students', 'LEPP'),('NO', 'Not Perkins EL students','MISSING'),('MISSING', 'MISSING', 'MISSING')) PerkinsEnglishLearner (CedsOptionSetCode, CedsOptionSetDescription, EdFactsCode)
	LEFT JOIN rds.DimEnglishLearnerStatuses dels
		ON EnglishLearner.CedsOptionSetCode = dels.EnglishLearnerStatusCode
		AND PerkinsEnglishLearner.CedsOptionSetCode = dels.PerkinsEnglishLearnerStatusCode
	WHERE dels.DimEnglishLearnerStatusId IS NULL
	
	-----------------------------------------------------
	-- Populate DimFosterCareStatuses                  --
	-----------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM rds.DimFosterCareStatuses d WHERE d.ProgramParticipationFosterCareCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT rds.DimFosterCareStatuses ON

		INSERT INTO rds.DimFosterCareStatuses (DimFosterCareStatusId, ProgramParticipationFosterCareCode, ProgramParticipationFosterCareDescription, ProgramParticipationFosterCareEdFactsCode)
			VALUES (-1, 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT rds.DimFosterCareStatuses OFF
	END

	INSERT INTO RDS.DimFosterCareStatuses
		(
			  ProgramParticipationFosterCareCode
			, ProgramParticipationFosterCareDescription
			, ProgramParticipationFosterCareEdFactsCode
		)
	SELECT 
		  FosterCare.CedsOptionSetCode
		, FosterCare.CedsOptionSetDescription
		, FosterCare.EdFactsCode
	FROM (VALUES('Yes', 'Foster Care Students', 'FOSTERCARE'), ('No', 'Non Foster Care Students', 'NONFOSTERCARE')) FosterCare(CedsOptionSetCode, CedsOptionSetDescription, EdFactsCode)
	LEFT JOIN rds.DimFosterCareStatuses dfcs
		ON FosterCare.CedsOptionSetCode = dfcs.ProgramParticipationFosterCareCode
	WHERE dfcs.DimFosterCareStatusId IS NULL

	-----------------------------------------------------
	-- Populate DimHomelessnessStatuses                --
	-----------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM rds.DimHomelessnessStatuses d WHERE d.HomelessnessStatusCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT rds.DimHomelessnessStatuses ON

		INSERT INTO rds.DimHomelessnessStatuses (
						DimHomelessnessStatusId
						, HomelessnessStatusCode
						, HomelessnessStatusDescription
						, HomelessnessStatusEdFactsCode
						, HomelessPrimaryNighttimeResidenceCode
						, HomelessPrimaryNighttimeResidenceDescription
						, HomelessPrimaryNighttimeResidenceEdfactsCode
						, HomelessServicedIndicatorCode
						, HomelessServicedIndicatorDescription
						, HomelessUnaccompaniedYouthStatusCode
						, HomelessUnaccompaniedYouthStatusDescription
						, HomelessUnaccompaniedYouthStatusEdfactsCode
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')

		SET IDENTITY_INSERT rds.DimHomelessnessStatuses OFF
	END

	CREATE TABLE #HomelessPrimaryNighttimeResidenceK12 (HomelessPrimaryNighttimeResidenceCode VARCHAR(50), HomelessPrimaryNighttimeResidenceDescription VARCHAR(200), HomelessPrimaryNighttimeResidenceEdFactsCode VARCHAR(50))

	INSERT INTO #HomelessPrimaryNighttimeResidenceK12 VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #HomelessPrimaryNighttimeResidenceK12 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'Shelter' THEN 'STH'
			WHEN 'DoubledUp' THEN 'D'
			WHEN 'Unsheltered' THEN 'U'
			WHEN 'HotelMotel' THEN 'HM'
			WHEN 'SheltersTransitionalHousing' THEN 'STH'
			WHEN 'TransitionalHousing' THEN 'STH'
		  END
	FROM CEDS.CedsOptionSetMapping WHERE CedsElementTechnicalName = 'HomelessPrimaryNighttimeResidence'

	INSERT INTO RDS.DimHomelessnessStatuses (
			HomelessnessStatusCode
			, HomelessnessStatusDescription
			, HomelessnessStatusEdFactsCode
			, HomelessPrimaryNighttimeResidenceCode
			, HomelessPrimaryNighttimeResidenceDescription
			, HomelessPrimaryNighttimeResidenceEdfactsCode
			, HomelessServicedIndicatorCode
			, HomelessServicedIndicatorDescription
			, HomelessUnaccompaniedYouthStatusCode
			, HomelessUnaccompaniedYouthStatusDescription
			, HomelessUnaccompaniedYouthStatusEdfactsCode
		)
	SELECT 
		  Homeless.CedsOptionSetCode
		, Homeless.CedsOptionSetDescription
		, Homeless.EdFactsCode
		, homelessres.HomelessPrimaryNighttimeResidenceCode
		, homelessres.HomelessPrimaryNighttimeResidenceDescription
		, homelessres.HomelessPrimaryNighttimeResidenceEdFactsCode
		, ServicedIndicator.CedsOptionSetCode
		, ServicedIndicator.CedsOptionSetDescription
		, UnaccYouth.CedsOptionSetCode
		, UnaccYouth.CedsOptionSetDescription
		, UnaccYouth.EdFactsCode
	FROM (VALUES('Yes', 'Homeless enrolled', 'HOMELSENRL'),('No', 'Not Homeless enrolled', 'MISSING'),('MISSING', 'MISSING', 'MISSING')) Homeless(CedsOptionSetCode, CedsOptionSetDescription, EdFactsCode)
	CROSS JOIN (VALUES('Yes', 'Homeless Serviced'),('No', 'Not Homeless Serviced'),('MISSING', 'MISSING')) ServicedIndicator(CedsOptionSetCode, CedsOptionSetDescription)
	CROSS JOIN (VALUES('Yes', 'Unaccompanied Youth', 'UY'),('No', 'Not Unaccompanied Youth', 'MISSING'),('MISSING', 'MISSING', 'MISSING')) UnaccYouth(CedsOptionSetCode, CedsOptionSetDescription, EdFactsCode)
	CROSS JOIN #HomelessPrimaryNighttimeResidenceK12 homelessres
	LEFT JOIN rds.DimHomelessnessStatuses dhs
		ON Homeless.CedsOptionSetCode = dhs.HomelessnessStatusCode
		AND ServicedIndicator.CedsOptionSetCode = dhs.HomelessServicedIndicatorCode
		AND UnaccYouth.CedsOptionSetCode = dhs.HomelessUnaccompaniedYouthStatusCode
		AND homelessres.HomelessPrimaryNighttimeResidenceCode = dhs.HomelessPrimaryNighttimeResidenceCode
	WHERE dhs.DimHomelessnessStatusId IS NULL

	DROP TABLE #HomelessPrimaryNighttimeResidenceK12
	

	
	-----------------------------------------------------
	-- Populate DimMigrantStatuses					   --
	-----------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM rds.DimMigrantStatuses d WHERE d.MigrantStatusCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT rds.DimMigrantStatuses ON

		INSERT INTO rds.DimMigrantStatuses (
					DimMigrantStatusId
					, MigrantStatusCode
					, MigrantStatusDescription
					, MigrantStatusEdFactsCode
					, MigrantEducationProgramEnrollmentTypeCode
					, MigrantEducationProgramEnrollmentTypeDescription
					, ContinuationOfServicesReasonCode
					, ContinuationOfServicesReasonDescription
					, MEPContinuationOfServicesStatusCode
					, MEPContinuationOfServicesStatusDescription
					, MEPContinuationOfServicesStatusEdFactsCode
					, ConsolidatedMEPFundsStatusCode
					, ConsolidatedMEPFundsStatusDescription
					, ConsolidatedMEPFundsStatusEdFactsCode
					, MigrantEducationProgramServicesTypeCode
					, MigrantEducationProgramServicesTypeDescription
					, MigrantEducationProgramServicesTypeEdFactsCode
					, MigrantPrioritizedForServicesCode
					, MigrantPrioritizedForServicesDescription
					, MigrantPrioritizedForServicesEdFactsCode
					)
			VALUES (
					  -1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					)

		SET IDENTITY_INSERT rds.DimMigrantStatuses OFF
	END

	CREATE TABLE #MepEnrollmentType (MigrantEducationProgramEnrollmentTypeCode VARCHAR(50), MigrantEducationProgramEnrollmentTypeDescription VARCHAR(200))

	INSERT INTO #MepEnrollmentType VALUES ('MISSING', 'MISSING')
	INSERT INTO #MepEnrollmentType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping 
	WHERE CedsElementTechnicalName = 'MigrantEducationProgramEnrollmentType' 

	CREATE TABLE #ContinuationOfServices (ContinuationOfServicesReasonCode VARCHAR(50), ContinuationOfServicesReasonDescription VARCHAR(200))

	INSERT INTO #ContinuationOfServices VALUES ('MISSING', 'MISSING')
	INSERT INTO #ContinuationOfServices
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping WHERE CedsElementTechnicalName = 'ContinuationOfServicesReason'

	CREATE TABLE #MepServiceType (MigrantEducationProgramServicesTypeCode VARCHAR(50), MigrantEducationProgramServicesTypeDescription VARCHAR(200), MigrantEducationProgramServicesTypeEdFactsCode VARCHAR(50))

	INSERT INTO #MepServiceType VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #MepServiceType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'CounselingServices' THEN 'COUNSELSERV'
			WHEN 'HighSchoolAccrual' THEN 'HSACCRUAL'
			WHEN 'InstructionalServices' THEN 'INTRSERV'
			WHEN 'MathematicsInstruction' THEN 'MATHINSTR'
			WHEN 'ReadingInstruction' THEN 'READINSTR'
			WHEN 'ReferralServices' THEN 'REFSERV'
			WHEN 'SupportServices' THEN 'SUPPSERV'
		  END
	FROM CEDS.CedsOptionSetMapping WHERE CedsElementTechnicalName = 'MigrantEducationProgramServicesType'

	INSERT INTO RDS.DimMigrantStatuses
		(
			MigrantStatusCode
			, MigrantStatusDescription
			, MigrantStatusEdFactsCode
			, MigrantEducationProgramEnrollmentTypeCode
			, MigrantEducationProgramEnrollmentTypeDescription
			, ContinuationOfServicesReasonCode
			, ContinuationOfServicesReasonDescription
			, MEPContinuationOfServicesStatusCode
			, MEPContinuationOfServicesStatusDescription
			, MEPContinuationOfServicesStatusEdFactsCode			
			, ConsolidatedMEPFundsStatusCode
			, ConsolidatedMEPFundsStatusDescription
			, ConsolidatedMEPFundsStatusEdFactsCode
			, MigrantEducationProgramServicesTypeCode
			, MigrantEducationProgramServicesTypeDescription
			, MigrantEducationProgramServicesTypeEdFactsCode
			, MigrantPrioritizedForServicesCode
			, MigrantPrioritizedForServicesDescription
			, MigrantPrioritizedForServicesEdFactsCode
		)
	SELECT 
		Migrant.CedsOptionSetCode
		, Migrant.CedsOptionSetDescription
		, Migrant.EdFactsCode
		, met.MigrantEducationProgramEnrollmentTypeCode
		, met.MigrantEducationProgramEnrollmentTypeDescription
		, cs.ContinuationOfServicesReasonCode
		, cs.ContinuationOfServicesReasonDescription
		, MEPContinuationOfServicesStatus.CedsOptionSetCode
		, MEPContinuationOfServicesStatus.CedsOptionSetDescription
		, MEPContinuationOfServicesStatus.EdFactsCode
		, ConsolidatedMEPFund.CedsOptionSetCode
		, ConsolidatedMEPFund.CedsOptionSetDescription
		, ConsolidatedMEPFund.EdFactsCode
		, mst.MigrantEducationProgramServicesTypeCode
		, mst.MigrantEducationProgramServicesTypeDescription
		, mst.MigrantEducationProgramServicesTypeEdFactsCode
		, PrioritizedForServices.CedsOptionSetCode
		, PrioritizedForServices.CedsOptionSetDescription
		, PrioritizedForServices.EdFactsCode
	FROM (VALUES('Yes', 'Migrant students', 'MS'),('No', 'Not a Migrant students', 'MISSING'),('MISSING', 'MISSING', 'MISSING')) Migrant(CedsOptionSetCode, CedsOptionSetDescription, EdFactsCode)
	CROSS JOIN (VALUES('Yes', 'Yes', 'YES'),('No', 'No','NO'),('NA', 'Not applicable','NA'),('MISSING', 'MISSING', 'MISSING')) ConsolidatedMEPFund(CedsOptionSetCode, CedsOptionSetDescription, EdFactsCode)
	CROSS JOIN (VALUES('YES', 'Prioritized for Services', 'PS'),('NO', 'Not Prioritized for Services', 'MISSING'),('MISSING', 'MISSING', 'MISSING')) PrioritizedForServices(CedsOptionSetCode, CedsOptionSetDescription, EdFactsCode)
	CROSS JOIN (VALUES('Yes', 'Receiving instructional or support services under the continuation of services authority ESEA Title III Section 1304(e)(2)-(3).', 'CONTINUED'),('No', 'Not receiving instructional or support services under the continuation of services authority ESEA Title III Section 1304(e)(2)-(3).', 'MISSING'),('MISSING', 'MISSING', 'MISSING')) MEPContinuationOfServicesStatus(CedsOptionSetCode, CedsOptionSetDescription, EdFactsCode)
	CROSS JOIN #MepEnrollmentType met
	CROSS JOIN #ContinuationOfServices cs
	CROSS JOIN #MepServiceType mst
	LEFT JOIN rds.DimMigrantStatuses dms
		ON Migrant.CedsOptionSetCode = dms.MigrantStatusCode
		AND met.MigrantEducationProgramEnrollmentTypeCode = dms.MigrantEducationProgramEnrollmentTypeCode
		AND cs.ContinuationOfServicesReasonCode = dms.ContinuationOfServicesReasonCode
		AND MEPContinuationOfServicesStatus.CedsOptionSetCode = dms.MEPContinuationOfServicesStatusCode
		AND mst.MigrantEducationProgramServicesTypeCode = dms.MigrantEducationProgramServicesTypeCode
		AND PrioritizedForServices.CedsOptionSetCode = dms.MigrantPrioritizedForServicesCode
		AND ConsolidatedMEPFund.CedsOptionSetCode = dms.ConsolidatedMEPFundsStatusCode
	WHERE dms.DimMigrantStatusId IS NULL

	DROP TABLE #MepEnrollmentType
	DROP TABLE #ContinuationOfServices
	DROP TABLE #MepServiceType

	-----------------------------------------------------
	-- Populate DimK12Demographics                     --
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12Demographics d WHERE d.DimK12DemographicId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimK12Demographics ON

		INSERT INTO [RDS].[DimK12Demographics]
           ([DimK12DemographicId]
           ,[SexCode]
           ,[SexDescription]
           ,[SexEdFactsCode]
		   )
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimK12Demographics OFF

	END


		CREATE TABLE #K12Sex (SexCode VARCHAR(50), SexDescription VARCHAR(200), SexEdFactsCode VARCHAR(200))

		INSERT INTO #K12Sex VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #K12Sex 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CASE CedsOptionSetCode
				WHEN 'Male' THEN 'M'
				WHEN 'Female' THEN 'F'
				ELSE 'MISSING'
			  END
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'Sex'


		INSERT INTO [RDS].[DimK12Demographics]
           ([SexCode]
           ,[SexDescription]
           ,[SexEdFactsCode]
		   )
		SELECT DISTINCT
			  h.SexCode
			, h.SexDescription
			, h.SexEdFactsCode
		FROM #K12Sex h
		LEFT JOIN rds.DimK12Demographics main
			ON  h.SexCode = main.SexCode
		WHERE main.DimK12DemographicId IS NULL

	DROP TABLE #K12Sex


	------------------------------------------------
	-- Populate DimK12AcademicAwardStatuses		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12AcademicAwardStatuses d WHERE d.HighSchoolDiplomaTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimK12AcademicAwardStatuses ON

		INSERT INTO RDS.DimK12AcademicAwardStatuses (DimK12AcademicAwardStatusId, HighSchoolDiplomaTypeCode, HighSchoolDiplomaTypeDescription, HighSchoolDiplomaTypeEdFactsCode)
			VALUES (-1, 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimK12AcademicAwardStatuses OFF
	END

	INSERT INTO RDS.DimK12AcademicAwardStatuses
		(
			  HighSchoolDiplomaTypeCode
			, HighSchoolDiplomaTypeDescription		
			, HighSchoolDiplomaTypeEdFactsCode
		)
	SELECT 
		  c.CedsOptionSetCode
		, c.CedsOptionSetDescription
		, CASE c.CedsOptionSetCode
			WHEN '00806' THEN 'REGDIP'
			WHEN '00807' THEN 'REGDIP'
			WHEN '00808' THEN 'REGDIP'
			WHEN '00809' THEN 'MISSING'
			WHEN '00810' THEN 'REGDIP'
			WHEN '00811' THEN 'REGDIP'
			WHEN '00812' THEN 'OTHCOM'
			WHEN '00813' THEN 'OTHCOM'
			WHEN '00814' THEN 'OTHCOM'
			WHEN '00815' THEN 'HSDGED'
			WHEN '00816' THEN 'HSDGED'
			WHEN '00818' THEN 'MISSING'
			WHEN '00819' THEN 'OTHCOM'
			ELSE 'MISSING'
		  END
	FROM CEDS.CedsOptionSetMapping c
	LEFT JOIN RDS.DimK12AcademicAwardStatuses main
		ON c.CedsOptionSetCode = main.HighSchoolDiplomaTypeCode
	WHERE main.DimK12AcademicAwardStatusId IS NULL
		AND c.CedsElementTechnicalName = 'HighSchoolDiplomaType'

	------------------------------------------------
	-- Populate DimResponsibleSchoolTypes		 ---
	------------------------------------------------


	INSERT INTO RDS.DimResponsibleSchoolTypes
		(
			  ResponsibleSchoolTypeAccountability
			, ResponsibleSchoolTypeAccountabilityCode
			, ResponsibleSchoolTypeAccountabilityDescription
			, ResponsibleSchoolTypeAttendance
			, ResponsibleSchoolTypeAttendanceCode
			, ResponsibleSchoolTypeAttendanceDescription
			, ResponsibleSchoolTypeFunding
			, ResponsibleSchoolTypeFundingCode
			, ResponsibleSchoolTypeFundingDescription
			, ResponsibleSchoolTypeGraduation
			, ResponsibleSchoolTypeGraduationCode
			, ResponsibleSchoolTypeGraduationDescription
			, ResponsibleSchoolTypeIndividualizedEducationProgram
			, ResponsibleSchoolTypeIndividualizedEducationProgramCode
			, ResponsibleSchoolTypeIndividualizedEducationProgramDescription
			, ResponsibleSchoolTypeTransportation
			, ResponsibleSchoolTypeTransportationCode
			, ResponsibleSchoolTypeTransportationDescription
			, ResponsibleSchoolTypeIepServiceProvider
			, ResponsibleSchoolTypeIepServiceProviderCode
			, ResponsibleSchoolTypeIepServiceProviderDescription
		)
	SELECT 
		  Accountability.CedsOptionSetValue
		, Accountability.CedsOptionSetCode
		, Accountability.CedsOptionSetDescription
		, Attendance.CedsOptionSetValue
		, Attendance.CedsOptionSetCode
		, Attendance.CedsOptionSetDescription
		, Funding.CedsOptionSetValue
		, Funding.CedsOptionSetCode
		, Funding.CedsOptionSetDescription
		, Graduation.CedsOptionSetValue
		, Graduation.CedsOptionSetCode
		, Graduation.CedsOptionSetDescription
		, IndividualizedEducationProgram.CedsOptionSetValue
		, IndividualizedEducationProgram.CedsOptionSetCode
		, IndividualizedEducationProgram.CedsOptionSetDescription
		, Transportation.CedsOptionSetValue
		, Transportation.CedsOptionSetCode
		, Transportation.CedsOptionSetDescription
		, IEPServiceProvider.CedsOptionSetValue
		, IEPServiceProvider.CedsOptionSetCode
		, IEPServiceProvider.CedsOptionSetDescription
	FROM (VALUES(1, 'Accountability', 'The role/relationship type assigned to an organization, institution, or agency responsible for student learning under Federal ESEA and State accountability plans.  (e.g. for AYP reporting)'),(0, 'Accountability', 'The role/relationship type assigned to an organization, institution, or agency responsible for student learning under Federal ESEA and State accountability plans.  (e.g. for AYP reporting)')) Accountability(CedsOptionSetValue, CedsOptionSetCode, CedsOptionSetDescription)
	CROSS JOIN (VALUES(1, 'Attendance', 'The role/relationship assigned to an organization, institution, or agency operating the physical or virtual site in which delivery of educational services take place.'), (0, 'Attendance', 'The role/relationship assigned to an organization, institution, or agency operating the physical or virtual site in which delivery of educational services take place.')) Attendance(CedsOptionSetValue, CedsOptionSetCode, CedsOptionSetDescription)
	CROSS JOIN (VALUES(1, 'Funding', 'The role/relationship assigned to an organization, institution, or agency responsible for funding related to a student enrollment.'), (0, 'Funding', 'The role/relationship assigned to an organization, institution, or agency responsible for funding related to a student enrollment.')) Funding(CedsOptionSetValue, CedsOptionSetCode, CedsOptionSetDescription)
	CROSS JOIN (VALUES(1, 'Graduation', 'The role/relationship assigned to an organization, institution, or agency responsible for issuing/awarding diplomas.  (e.g. for graduation-rate reporting)'), (0, 'Graduation', 'The role/relationship assigned to an organization, institution, or agency responsible for issuing/awarding diplomas.  (e.g. for graduation-rate reporting)')) Graduation(CedsOptionSetValue, CedsOptionSetCode, CedsOptionSetDescription)
	CROSS JOIN (VALUES(1, 'Individualized education program (IEP)', 'The role/relationship type assigned to an organization, institution, or agency responsible for creating and maintaining the student''s IEP, a written instructional plan for students with disabilities designated as special education students under the Individuals with Disabilities Education Act (IDEA-Part B) which includes: 1) a statement of present levels of educational performance of a child; 2) a statement of annual goals including short-term instructional objectives; 3) a statement of specific education and related services to be provided and the extent to which the child will be able to participate in regular educational programs; 4) a projected date for initiation and anticipated duration of services; and 5) appropriate objectives, criteria and evaluation procedures and schedules for determining, on at least an annual basis, whether instructional objectives are being achieved.'), (0, 'Individualized education program (IEP)', 'The role/relationship type assigned to an organization, institution, or agency responsible for creating and maintaining the student''s IEP, a written instructional plan for students with disabilities designated as special education students under the Individuals with Disabilities Education Act (IDEA-Part B) which includes: 1) a statement of present levels of educational performance of a child; 2) a statement of annual goals including short-term instructional objectives; 3) a statement of specific education and related services to be provided and the extent to which the child will be able to participate in regular educational programs; 4) a projected date for initiation and anticipated duration of services; and 5) appropriate objectives, criteria and evaluation procedures and schedules for determining, on at least an annual basis, whether instructional objectives are being achieved.')) IndividualizedEducationProgram(CedsOptionSetValue, CedsOptionSetCode, CedsOptionSetDescription)
	CROSS JOIN (VALUES(1, 'Transportation', 'The role/relationship type assigned to an organization, institution, or agency responsible for transporting the student to the physical location of the school or facility in which educational services are delivered.'), (0, 'Transportation', 'The role/relationship type assigned to an organization, institution, or agency responsible for transporting the student to the physical location of the school or facility in which educational services are delivered.')) Transportation(CedsOptionSetValue, CedsOptionSetCode, CedsOptionSetDescription)
	CROSS JOIN (VALUES(1, 'Individualized education program service provider', 'The role/relationship type assigned to an organization, institution, or agency responsible for providing services to meet the requirements of the student''s Individualized Education Program (IEP).'), (0, 'Individualized education program service provider', 'The role/relationship type assigned to an organization, institution, or agency responsible for providing services to meet the requirements of the student''s Individualized Education Program (IEP).')) IEPServiceProvider(CedsOptionSetValue, CedsOptionSetCode, CedsOptionSetDescription)
	LEFT JOIN RDS.DimResponsibleSchoolTypes rdrst
		ON  Accountability.CedsOptionSetValue = rdrst.ResponsibleSchoolTypeAccountability
		AND Attendance.CedsOptionSetValue = rdrst.ResponsibleSchoolTypeAttendance
		AND Funding.CedsOptionSetValue = rdrst.ResponsibleSchoolTypeFunding
		AND Graduation.CedsOptionSetValue = rdrst.ResponsibleSchoolTypeGraduation
		AND IndividualizedEducationProgram.CedsOptionSetValue = rdrst.ResponsibleSchoolTypeIndividualizedEducationProgram
		AND Transportation.CedsOptionSetValue = rdrst.ResponsibleSchoolTypeTransportation
		AND IEPServiceProvider.CedsOptionSetValue = rdrst.ResponsibleSchoolTypeIepServiceProvider
	WHERE rdrst.DimResponsibleSchoolTypeId IS NULL




	-----------------------------------------------------
	-- Populate DimIdeaStatuses		                   --
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimIdeaStatuses d WHERE d.DimIdeaStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimIdeaStatuses ON

		INSERT INTO [RDS].[DimIdeaStatuses]
           ([DimIdeaStatusId]
		   ,[SpecialEducationExitReasonCode]
           ,[SpecialEducationExitReasonDescription]
           ,[SpecialEducationExitReasonEdFactsCode]
           ,[IdeaEducationalEnvironmentForSchoolAgeCode]
           ,[IdeaEducationalEnvironmentForSchoolAgeDescription]
           ,[IdeaEducationalEnvironmentForSchoolAgeEdFactsCode]
           ,[IdeaEducationalEnvironmentForEarlyChildhoodCode]
           ,[IdeaEducationalEnvironmentForEarlyChildhoodDescription]
           ,[IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode]
           ,[IdeaIndicatorCode]
           ,[IdeaIndicatorDescription]
           ,[IdeaIndicatorEdFactsCode])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimIdeaStatuses OFF

	END

		CREATE TABLE #SpecialEducationExitReason (SpecialEducationExitReasonCode VARCHAR(50), SpecialEducationExitReasonDescription VARCHAR(200), SpecialEducationExitReasonEdFactsCode VARCHAR(200))

		INSERT INTO #SpecialEducationExitReason VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #SpecialEducationExitReason 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CASE CedsOptionSetCode
				WHEN 'PartCNoLongerEligible' THEN 'PartCNoLongerEligible'
				WHEN 'PartBEligibleContinuingPartC' THEN 'PartBEligibleContinuingPartC'
				WHEN 'WithdrawalByParent' THEN 'TRAN'
				WHEN 'PartBEligibilityNotDeterminedExitingPartC' THEN 'PartBEligibilityNotDeterminedExitingPartC'
				WHEN 'Unreachable' THEN 'DROPOUT'
				WHEN 'Died' THEN 'D'
				WHEN 'ReceivedCertificate' THEN 'RC'
				WHEN 'NotPartBEligibleExitingPartCWithoutReferrals' THEN 'NotPartBElgibleExitingPartCWithoutReferrrals'
				WHEN 'NotPartBEligibleExitingPartCWithReferrals' THEN 'NotPartBElgibleExitingPartCWithReferrrals'
				WHEN 'MISSING' THEN 'MISSING'
				WHEN 'MovedAndContinuing' THEN 'MKC'
				WHEN 'PartBEligibleExitingPartC' THEN 'PartBEligibleExitingPartC'
				WHEN 'MovedOutOfState' THEN 'MKC'
				WHEN 'ReachedMaximumAge' THEN 'RMA'
				WHEN 'GraduatedAlternateDiploma' THEN 'GRADALTDPL'
				WHEN 'DroppedOut' THEN 'DROPOUT'
				WHEN 'HighSchoolDiploma' THEN 'GHS'
				WHEN 'Transferred' THEN 'TRAN'			  
				ELSE 'MISSING'
			  END 
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'SpecialEducationExitReason'

		CREATE TABLE #IdeaEducationalEnvironmentForSchoolAge (IdeaEducationalEnvironmentForSchoolAgeCode VARCHAR(50), IdeaEducationalEnvironmentForSchoolAgeDescription VARCHAR(200), IdeaEducationalEnvironmentForSchoolAgeEdFactsCode VARCHAR(200))

		INSERT INTO #IdeaEducationalEnvironmentForSchoolAge VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #IdeaEducationalEnvironmentForSchoolAge 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'IdeaEducationalEnvironmentForSchoolAge'

		CREATE TABLE #IdeaEducationalEnvironmentForEarlyChildhood (IdeaEducationalEnvironmentForEarlyChildhoodCode VARCHAR(50), IdeaEducationalEnvironmentForEarlyChildhoodDescription VARCHAR(200), IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode VARCHAR(200))

		INSERT INTO #IdeaEducationalEnvironmentForEarlyChildhood VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #IdeaEducationalEnvironmentForEarlyChildhood 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'IdeaEducationalEnvironmentForEarlyChildhood'

		CREATE TABLE #IdeaIndicator (IdeaIndicatorCode VARCHAR(50), IdeaIndicatorDescription VARCHAR(200), IdeaIndicatorEdFactsCode VARCHAR(200))

		INSERT INTO #IdeaIndicator VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #IdeaIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CASE CedsOptionSetCode
				WHEN 'Yes' THEN 'IDEA'
				ELSE 'MISSING'
			  END
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'IdeaIndicator'



		INSERT INTO [RDS].[DimIdeaStatuses]
           ([SpecialEducationExitReasonCode]
           ,[SpecialEducationExitReasonDescription]
           ,[SpecialEducationExitReasonEdFactsCode]
           ,[IdeaEducationalEnvironmentForSchoolAgeCode]
           ,[IdeaEducationalEnvironmentForSchoolAgeDescription]
           ,[IdeaEducationalEnvironmentForSchoolAgeEdFactsCode]
           ,[IdeaEducationalEnvironmentForEarlyChildhoodCode]
           ,[IdeaEducationalEnvironmentForEarlyChildhoodDescription]
           ,[IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode]
           ,[IdeaIndicatorCode]
           ,[IdeaIndicatorDescription]
           ,[IdeaIndicatorEdFactsCode])
		SELECT DISTINCT
			  a.SpecialEducationExitReasonCode
			, a.SpecialEducationExitReasonDescription
			, a.SpecialEducationExitReasonEdFactsCode
			, c.IdeaEducationalEnvironmentForSchoolAgeCode
			, c.IdeaEducationalEnvironmentForSchoolAgeDescription
			, c.IdeaEducationalEnvironmentForSchoolAgeEdFactsCode
			, d.IdeaEducationalEnvironmentForEarlyChildhoodCode
			, d.IdeaEducationalEnvironmentForEarlyChildhoodDescription
			, d.IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode
			, e.IdeaIndicatorCode
			, e.IdeaIndicatorDescription
			, e.IdeaIndicatorEdFactsCode
		FROM #SpecialEducationExitReason a
		CROSS JOIN #IdeaEducationalEnvironmentForSchoolAge c
		CROSS JOIN #IdeaEducationalEnvironmentForEarlyChildhood d
		CROSS JOIN #IdeaIndicator e
		LEFT JOIN rds.DimIdeaStatuses main
			ON a.SpecialEducationExitReasonCode = main.SpecialEducationExitReasonCode
			AND c.IdeaEducationalEnvironmentForSchoolAgeCode = main.IdeaEducationalEnvironmentForSchoolAgeCode
			AND d.IdeaEducationalEnvironmentForEarlyChildhoodCode = main.IdeaEducationalEnvironmentForEarlyChildhoodCode
			AND e.IdeaIndicatorCode = main.IdeaIndicatorCode
		WHERE main.DimIdeaStatusId IS NULL

	DROP TABLE #SpecialEducationExitReason
	DROP TABLE #IdeaEducationalEnvironmentForSchoolAge
	DROP TABLE #IdeaEducationalEnvironmentForEarlyChildhood
	DROP TABLE #IdeaIndicator

	------------------------------------------------
	-- Populate DimGradeLevels					 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimGradeLevels d WHERE d.GradeLevelCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimGradeLevels ON

		INSERT INTO RDS.DimGradeLevels (DimGradeLevelId, GradeLevelCode, GradeLevelDescription, GradeLevelEdFactsCode)
			VALUES (-1, 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimGradeLevels OFF
	END

	INSERT INTO RDS.DimGradeLevels
		(
			  GradeLevelCode
			, GradeLevelDescription
			, GradeLevelEdFactsCode
		)
	SELECT DISTINCT
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
		, CASE CedsOptionSetCode 
			WHEN 'ABE' THEN 'AE'
			ELSE CedsOptionSetCode
		  END
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimGradeLevels main
		ON ceds.CedsOptionSetCode = main.GradeLevelCode
	WHERE main.DimGradeLevelId IS NULL
		AND ceds.CedsElementTechnicalName IN
			('AssessmentRegistrationGradeLevelToBeAssessed'
			,'EntryGradeLevel'
			,'ExitGradeLevel'
			,'GradeLevelsApproved'
			,'GradeLevelWhenAssessed'
			,'GradeLevelWhenCourseTaken'
			,'GradesOffered'
			,'Assessment Level for Which Designed')
	
	-----------------------------------------------------
	-- Populate DimChildOutcomeSummaries		       --
	-----------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM rds.DimChildOutcomeSummaries d WHERE d.COSRatingACode = 'MISSING') BEGIN
		SET IDENTITY_INSERT rds.DimChildOutcomeSummaries ON

			INSERT INTO rds.DimChildOutcomeSummaries (
						DimChildOutcomeSummaryId
						  , COSRatingACode
						  , COSRatingADescription
						  , COSRatingBCode
						  , COSRatingBDescription
						  , COSRatingCCode
						  , COSRatingCDescription
						  , COSProgressAIndicatorCode
						  , COSProgressAIndicatorDescription
						  , COSProgressBIndicatorCode
						  , COSProgressBIndicatorDescription
						  , COSProgressCIndicatorCode
						  , COSProgressCIndicatorDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')

		SET IDENTITY_INSERT rds.DimChildOutcomeSummaries OFF
	END

	CREATE TABLE #ChildOutcomesSummaryRating (COSRatingCode VARCHAR(50), COSRatingDescription VARCHAR(200))

	INSERT INTO #ChildOutcomesSummaryRating VALUES ('MISSING', 'MISSING')
	INSERT INTO #ChildOutcomesSummaryRating
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping WHERE CedsElementTechnicalName = 'COSRatingA'

	INSERT INTO rds.DimChildOutcomeSummaries 
		(
			COSRatingACode
			, COSRatingADescription
			, COSRatingBCode
			, COSRatingBDescription
			, COSRatingCCode
			, COSRatingCDescription
			, COSProgressAIndicatorCode
			, COSProgressAIndicatorDescription
			, COSProgressBIndicatorCode
			, COSProgressBIndicatorDescription
			, COSProgressCIndicatorCode
			, COSProgressCIndicatorDescription
		)
	SELECT 
		  cosra.COSRatingCode
		, cosra.COSRatingDescription
		, cosrb.COSRatingCode
		, cosrb.COSRatingDescription
		, cosrc.COSRatingCode
		, cosrc.COSRatingDescription
		, COSProgressA.CedsOptionSetCode
		, COSProgressA.CedsOptionSetDescription
		, COSProgressB.CedsOptionSetCode
		, COSProgressB.CedsOptionSetDescription
		, COSProgressC.CedsOptionSetCode
		, COSProgressC.CedsOptionSetDescription
	FROM (VALUES('Yes', 'Indicates that the child demonstrates progress in positive social-emotional skills, including social relationships'),('No', 'Indicates that the child did not demonstrate progress in positive social-emotional skills, including social relationships'),('MISSING', 'MISSING')) COSProgressA (CedsOptionSetCode, CedsOptionSetDescription)
	CROSS JOIN (VALUES('Yes', 'Indicates that the child demonstrates progress in acquisition and use of knowledge and skills, including early language/communication'),('No', 'Indicates that the child did not demonstrate progress in acquisition and use of knowledge and skills, including early language/communication'),('MISSING', 'MISSING')) COSProgressB (CedsOptionSetCode, CedsOptionSetDescription)
	CROSS JOIN (VALUES('Yes', 'Indicates that the child demonstrates progress in use of appropriate behaviors to meet their needs.'),('No', 'Indicates that the child did not demonstrate progress in use of appropriate behaviors to meet their needs'),('MISSING', 'MISSING')) COSProgressC (CedsOptionSetCode, CedsOptionSetDescription)
	CROSS JOIN #ChildOutcomesSummaryRating cosra
	CROSS JOIN #ChildOutcomesSummaryRating cosrb
	CROSS JOIN #ChildOutcomesSummaryRating cosrc
	LEFT JOIN rds.DimChildOutcomeSummaries dcos
	ON cosra.COSRatingCode = dcos.COSRatingACode
		AND cosrb.COSRatingCode = dcos.COSRatingBCode
		AND cosrc.COSRatingCode = dcos.COSRatingCCode
		AND COSProgressA.CedsOptionSetCode = dcos.COSProgressAIndicatorCode
		AND COSProgressB.CedsOptionSetCode = dcos.COSProgressBIndicatorCode
		AND COSProgressC.CedsOptionSetCode = dcos.COSProgressCIndicatorCode
	WHERE dcos.DimChildOutcomeSummaryId IS NULL

	DROP TABLE #ChildOutcomesSummaryRating
	-----------------------------------------------------
	-- Populate DimIndividualizedProgramStatuses	   --
	-----------------------------------------------------
	IF NOT EXISTS (SELECT * FROM rds.DimIndividualizedProgramStatuses d WHERE d.IndividualizedProgramTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT rds.DimIndividualizedProgramStatuses ON

			INSERT INTO rds.DimIndividualizedProgramStatuses (
						DimIndividualizedProgramStatusId
						  , IndividualizedProgramTypeCode
						  , IndividualizedProgramTypeDescription
						  , StudentSupportServiceTypeCode
						  , StudentSupportServiceTypeDescription
						  , ConsentToEvaluationIndicatorCode
						  , ConsentToEvaluationIndicatorDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')

		SET IDENTITY_INSERT rds.DimIndividualizedProgramStatuses OFF
	END

	CREATE TABLE #IndividualizedProgramType (IndividualizedProgramTypeCode VARCHAR(50), IndividualizedProgramTypeDescription VARCHAR(200))

	INSERT INTO #IndividualizedProgramType VALUES ('MISSING', 'MISSING')
	INSERT INTO #IndividualizedProgramType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping WHERE CedsElementTechnicalName = 'IndividualizedProgramType'

	CREATE TABLE #StudentSupportServiceType (StudentSupportServiceTypeCode VARCHAR(50), StudentSupportServiceTypeDescription VARCHAR(200))

	INSERT INTO #StudentSupportServiceType VALUES ('MISSING', 'MISSING')
	INSERT INTO #StudentSupportServiceType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping WHERE CedsElementTechnicalName = 'StudentSupportServiceType'

	INSERT INTO rds.DimIndividualizedProgramStatuses 
		(
			IndividualizedProgramTypeCode
			, IndividualizedProgramTypeDescription
			, StudentSupportServiceTypeCode
			, StudentSupportServiceTypeDescription
			, ConsentToEvaluationIndicatorCode
			, ConsentToEvaluationIndicatorDescription
		)
	SELECT 
		  ipt.IndividualizedProgramTypeCode
		, ipt.IndividualizedProgramTypeDescription
		, ssst.StudentSupportServiceTypeCode
		, ssst.StudentSupportServiceTypeDescription
		, ConsentToEvaluation.CedsOptionSetCode
		, ConsentToEvaluation.CedsOptionSetDescription
	FROM (VALUES('Yes', 'Indicates that parent agreed to evaluate student'),('No', 'Indicates that parent did not agree to evaluate student'),('MISSING', 'MISSING')) ConsentToEvaluation (CedsOptionSetCode, CedsOptionSetDescription)
	CROSS JOIN #IndividualizedProgramType ipt
	CROSS JOIN #StudentSupportServiceType ssst
	LEFT JOIN rds.DimIndividualizedProgramStatuses dips
	ON ipt.IndividualizedProgramTypeCode = dips.IndividualizedProgramTypeCode
		AND ssst.StudentSupportServiceTypeCode = dips.StudentSupportServiceTypeCode
		AND ConsentToEvaluation.CedsOptionSetCode = dips.ConsentToEvaluationIndicatorCode
	WHERE dips.DimIndividualizedProgramStatusId IS NULL

	DROP TABLE #IndividualizedProgramType
	DROP TABLE #StudentSupportServiceType

    ------------------------------------------------
    -- Populate DimIdeaDisabilityTypes                   ---
    ------------------------------------------------
    IF NOT EXISTS (SELECT 1 FROM RDS.DimIdeaDisabilityTypes d WHERE d.IdeaDisabilityTypeCode = 'MISSING') BEGIN
        SET IDENTITY_INSERT RDS.DimIdeaDisabilityTypes ON

        INSERT INTO RDS.DimIdeaDisabilityTypes (DimIdeaDisabilityTypeId, IdeaDisabilityTypeCode, IdeaDisabilityTypeDescription, IdeaDisabilityTypeEdFactsCode)
            VALUES (-1, 'MISSING', 'MISSING', 'MISSING')

        SET IDENTITY_INSERT RDS.DimIdeaDisabilityTypes OFF
    END

    INSERT INTO RDS.DimIdeaDisabilityTypes
        (
              IdeaDisabilityTypeCode
            , IdeaDisabilityTypeDescription
            , IdeaDisabilityTypeEdFactsCode
        )
    SELECT
          ceds.CedsOptionSetCode
        , ceds.CedsOptionSetDescription
        , CASE ceds.CedsOptionSetCode
            WHEN 'Autism' THEN 'AUT'
            WHEN 'Deafblindness' THEN 'DB'
            WHEN 'Deafness' THEN 'DB'
            WHEN 'Developmentaldelay' THEN 'DD'
            WHEN 'Emotionaldisturbance' THEN 'EMN'
            WHEN 'Hearingimpairment' THEN 'HI'
            WHEN 'Intellectualdisability' THEN 'ID'
            WHEN 'Multipledisabilities' THEN 'MD'
            WHEN 'Orthopedicimpairment' THEN 'OI'
            WHEN 'Otherhealthimpairment' THEN 'OHI'
            WHEN 'Specificlearningdisability' THEN 'SLD'
            WHEN 'Speechlanguageimpairment' THEN 'SLI'
            WHEN 'Traumaticbraininjury' THEN 'TBI'
            WHEN 'Visualimpairment' THEN 'VI'
            ELSE 'MISSING'
          END
           
    FROM CEDS.CedsOptionSetMapping ceds
    LEFT JOIN RDS.DimIdeaDisabilityTypes main
        ON ceds.CedsOptionSetCode = main.IdeaDisabilityTypeCode
    WHERE main.DimIdeaDisabilityTypeId IS NULL
        AND ceds.CedsElementTechnicalName = 'IdeaDisabilityType'

	-----------------------------------------------------
	-- Populate DimImmigrantStatuses				   --
	-----------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM rds.DimImmigrantStatuses d WHERE d.TitleIIIImmigrantStatusCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT rds.DimImmigrantStatuses ON

			INSERT INTO rds.DimImmigrantStatuses (
						DimImmigrantStatusId
						, TitleIIIImmigrantStatusCode
						, TitleIIIImmigrantStatusDescription
						, TitleIIIImmigrantStatusEdFactsCode
						, TitleIIIImmigrantParticipationStatusCode
						, TitleIIIImmigrantParticipationStatusDescription
						, TitleIIIImmigrantParticipationStatusEdFactsCode
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')

		SET IDENTITY_INSERT rds.DimImmigrantStatuses OFF
	END

	INSERT INTO rds.DimImmigrantStatuses 
		(
			TitleIIIImmigrantStatusCode
			, TitleIIIImmigrantStatusDescription
			, TitleIIIImmigrantStatusEdFactsCode
			, TitleIIIImmigrantParticipationStatusCode
			, TitleIIIImmigrantParticipationStatusDescription
			, TitleIIIImmigrantParticipationStatusEdFactsCode
		)
	SELECT 
		  TitleIIIImmigrant.CedsOptionSetCode
		, TitleIIIImmigrant.CedsOptionSetDescription
		, TitleIIIImmigrant.EdFactsCode
		, TitleIIIImmigrantParticipation.CedsOptionSetCode
		, TitleIIIImmigrantParticipation.CedsOptionSetDescription
		, TitleIIIImmigrantParticipation.EdFactsCode
	FROM (VALUES('Yes', 'The child is an immigrant according to the Title III of ESEA definition', 'PART'),('No', 'The child is not an immigrant according to the Title III of ESEA definition', 'MISSING'),('MISSING', 'MISSING', 'MISSING')) TitleIIIImmigrant (CedsOptionSetCode, CedsOptionSetDescription, EdFactsCode)
	CROSS JOIN (VALUES('Yes', 'Immigrant Title III Immigrant Program Participant', 'IMMIGNTTTLIII'),('No', 'Non Immigrant Title III Immigrant Program Participant', 'NONIMMIGNTTTLIII'),('MISSING', 'MISSING', 'MISSING')) TitleIIIImmigrantParticipation (CedsOptionSetCode, CedsOptionSetDescription, EdFactsCode)
	LEFT JOIN rds.DimImmigrantStatuses dis
	ON TitleIIIImmigrant.CedsOptionSetCode = dis.TitleIIIImmigrantStatusCode
		AND TitleIIIImmigrantParticipation.CedsOptionSetCode = dis.TitleIIIImmigrantParticipationStatusCode
	WHERE dis.DimImmigrantStatusId IS NULL
	

	-----------------------------------------------------
	-- Populate DimMilitaryStatuses					   --
	-----------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM rds.DimMilitaryStatuses d WHERE d.DimMilitaryStatusId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimMilitaryStatuses ON

			INSERT INTO rds.DimMilitaryStatuses (
						  DimMilitaryStatusId
						, [MilitaryConnectedStudentIndicatorCode]       
						, [MilitaryConnectedStudentIndicatorDescription]
						, [MilitaryConnectedStudentIndicatorEdFactsCode]
						, [MilitaryActiveStudentIndicatorCode]          
						, [MilitaryActiveStudentIndicatorDescription]   
						, [MilitaryBranchCode]                          
						, [MilitaryBranchDescription]                   
						, [MilitaryVeteranStudentIndicatorCode]         
						, [MilitaryVeteranStudentIndicatorDescription]  
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')

		SET IDENTITY_INSERT rds.DimMilitaryStatuses OFF
	END

	IF OBJECT_ID('tempdb..#MilitaryActiveStudentIndicator') IS NOT NULL
		DROP TABLE #MilitaryActiveStudentIndicator

	CREATE TABLE #MilitaryActiveStudentIndicator (MilitaryActiveStudentIndicatorCode VARCHAR(50), MilitaryActiveStudentIndicatorDescription VARCHAR(200))

	INSERT INTO #MilitaryActiveStudentIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #MilitaryActiveStudentIndicator 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MilitaryActiveStudentIndicator'

	IF OBJECT_ID('tempdb..#MilitaryBranch') IS NOT NULL
		DROP TABLE #MilitaryBranch

	CREATE TABLE #MilitaryBranch (MilitaryBranchCode VARCHAR(50), MilitaryBranchDescription VARCHAR(200))

	INSERT INTO #MilitaryBranch VALUES ('MISSING', 'MISSING')
	INSERT INTO #MilitaryBranch 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MilitaryBranch'
	
	IF OBJECT_ID('tempdb..#MilitaryVeteranStudentIndicator') IS NOT NULL
		DROP TABLE #MilitaryVeteranStudentIndicator

	CREATE TABLE #MilitaryVeteranStudentIndicator (MilitaryVeteranStudentIndicatorCode VARCHAR(50), MilitaryVeteranStudentIndicatorDescription VARCHAR(200))

	INSERT INTO #MilitaryVeteranStudentIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #MilitaryVeteranStudentIndicator 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MilitaryVeteranStudentIndicator'

	INSERT INTO rds.DimMilitaryStatuses 
		(
			  [MilitaryConnectedStudentIndicatorCode]       
			, [MilitaryConnectedStudentIndicatorDescription]
			, [MilitaryConnectedStudentIndicatorEdFactsCode]
			, [MilitaryActiveStudentIndicatorCode]          
			, [MilitaryActiveStudentIndicatorDescription]   
			, [MilitaryBranchCode]                          
			, [MilitaryBranchDescription]                   
			, [MilitaryVeteranStudentIndicatorCode]         
			, [MilitaryVeteranStudentIndicatorDescription]  
		)
	SELECT 
		  mcsi.MilitaryConnectedStudentIndicatorCode
		, mcsi.MilitaryConnectedStudentIndicatorDescription
		, ISNULL(mcsi.MilitaryConnectedStudentIndicatorEdFactsCode, 'MISSING')
		, masi.MilitaryActiveStudentIndicatorCode
		, masi.MilitaryActiveStudentIndicatorDescription
		, mb.MilitaryBranchCode
		, mb.MilitaryBranchDescription
		, mvsi.MilitaryVeteranStudentIndicatorCode
		, mvsi.MilitaryVeteranStudentIndicatorDescription
	FROM #MilitaryConnectedStudentIndicator mcsi
	CROSS JOIN #MilitaryActiveStudentIndicator masi
	CROSS JOIN #MilitaryVeteranStudentIndicator mvsi
	CROSS JOIN #MilitaryBranch mb
	LEFT JOIN rds.DimMilitaryStatuses rdms
		ON  mcsi.[MilitaryConnectedStudentIndicatorCode] = rdms.[MilitaryConnectedStudentIndicatorCode]
		AND masi.[MilitaryActiveStudentIndicatorCode]	 = rdms.[MilitaryActiveStudentIndicatorCode]
		AND mb.[MilitaryBranchCode]						 = rdms.[MilitaryBranchCode]
		AND rdms.[MilitaryVeteranStudentIndicatorCode]   = rdms.[MilitaryVeteranStudentIndicatorCode]
	WHERE rdms.DimMilitaryStatusId IS NULL

	DROP TABLE #MilitaryActiveStudentIndicator
	DROP TABLE #MilitaryVeteranStudentIndicator
	DROP TABLE #MilitaryBranch
	DROP TABLE #MilitaryConnectedStudentIndicator

	-----------------------------------------------------
	-- Populate DimEconomicallyDisadvantagedStatuses   --
	-----------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM rds.DimEconomicallyDisadvantagedStatuses d WHERE d.DimEconomicallyDisadvantagedStatusId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimEconomicallyDisadvantagedStatuses ON

			INSERT INTO rds.DimEconomicallyDisadvantagedStatuses (
						  DimEconomicallyDisadvantagedStatusId
						, EconomicDisadvantageStatusCode
						, EconomicDisadvantageStatusDescription
						, EconomicDisadvantageStatusEdFactsCode
						, EligibilityStatusForSchoolFoodServiceProgramsCode
						, EligibilityStatusForSchoolFoodServiceProgramsDescription
						, EligibilityStatusForSchoolFoodServiceProgramsEdFactsCode
						, NationalSchoolLunchProgramDirectCertificationIndicatorCode
						, NationalSchoolLunchProgramDirectCertificationIndicatorDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')

		SET IDENTITY_INSERT rds.DimEconomicallyDisadvantagedStatuses OFF
	END

	IF OBJECT_ID('tempdb..#EligibilityStatusForSchoolFoodServicePrograms') IS NOT NULL
		DROP TABLE #EligibilityStatusForSchoolFoodServicePrograms

	CREATE TABLE #EligibilityStatusForSchoolFoodServicePrograms (EligibilityStatusForSchoolFoodServiceProgramsCode VARCHAR(50), EligibilityStatusForSchoolFoodServiceProgramsDescription VARCHAR(200), EligibilityStatusForSchoolFoodServiceProgramsEdFactsCode VARCHAR(50))

	INSERT INTO #EligibilityStatusForSchoolFoodServicePrograms VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EligibilityStatusForSchoolFoodServicePrograms 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'Free' THEN 'FL'
			WHEN 'FullPrice' THEN 'MISSING'
			WHEN 'Other' THEN 'MISSING'
			WHEN 'ReducedPrice' THEN 'RPL'
			ELSE 'MISSING'
		  END
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EligibilityStatusForSchoolFoodServicePrograms'
	
	IF OBJECT_ID('tempdb..#NationalSchoolLunchProgramDirectCertificationIndicator') IS NOT NULL
		DROP TABLE #NationalSchoolLunchProgramDirectCertificationIndicator

	CREATE TABLE #NationalSchoolLunchProgramDirectCertificationIndicator (NationalSchoolLunchProgramDirectCertificationIndicatorCode VARCHAR(50), NationalSchoolLunchProgramDirectCertificationIndicatorDescription VARCHAR(200))

	INSERT INTO #NationalSchoolLunchProgramDirectCertificationIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #NationalSchoolLunchProgramDirectCertificationIndicator 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'NationalSchoolLunchProgramDirectCertificationIndicator'

	INSERT INTO rds.DimEconomicallyDisadvantagedStatuses 
		(
			  EconomicDisadvantageStatusCode
			, EconomicDisadvantageStatusDescription
			, EconomicDisadvantageStatusEdFactsCode
			, EligibilityStatusForSchoolFoodServiceProgramsCode
			, EligibilityStatusForSchoolFoodServiceProgramsDescription
			, EligibilityStatusForSchoolFoodServiceProgramsEdFactsCode
			, NationalSchoolLunchProgramDirectCertificationIndicatorCode
			, NationalSchoolLunchProgramDirectCertificationIndicatorDescription
		)
	SELECT 
		  eds.EconomicDisadvantageStatusCode
		, eds.EconomicDisadvantageStatusDescription
		, eds.EconomicDisadvantageStatusEdFactsCode
		, esfsfsp.EligibilityStatusForSchoolFoodServiceProgramsCode
		, esfsfsp.EligibilityStatusForSchoolFoodServiceProgramsDescription
		, esfsfsp.EligibilityStatusForSchoolFoodServiceProgramsEdFactsCode
		, nslpdci.NationalSchoolLunchProgramDirectCertificationIndicatorCode
		, nslpdci.NationalSchoolLunchProgramDirectCertificationIndicatorDescription
	FROM #EconomicDisadvantageStatus eds
	CROSS JOIN #EligibilityStatusForSchoolFoodServicePrograms esfsfsp
	CROSS JOIN #NationalSchoolLunchProgramDirectCertificationIndicator nslpdci
	LEFT JOIN rds.DimEconomicallyDisadvantagedStatuses rdeds
		ON	eds.EconomicDisadvantageStatusCode								 = rdeds.EconomicDisadvantageStatusCode								
		AND esfsfsp.EligibilityStatusForSchoolFoodServiceProgramsCode		 = rdeds.EligibilityStatusForSchoolFoodServiceProgramsCode			
		AND nslpdci.NationalSchoolLunchProgramDirectCertificationIndicatorCode = rdeds.NationalSchoolLunchProgramDirectCertificationIndicatorCode
	WHERE rdeds.DimEconomicallyDisadvantagedStatusId IS NULL

	DROP TABLE #EconomicDisadvantageStatus
	DROP TABLE #EligibilityStatusForSchoolFoodServicePrograms
	DROP TABLE #NationalSchoolLunchProgramDirectCertificationIndicator


	-----------------------------------------------------
	-- Populate DimAssessmentAccommodations            --
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAssessmentAccommodations d WHERE d.DimAssessmentAccommodationId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimAssessmentAccommodations ON

	INSERT INTO [RDS].[DimAssessmentAccommodations]
		   ([DimAssessmentAccommodationId]
           ,[AssessmentAccommodationCategoryCode]
           ,[AssessmentAccommodationCategoryDescription]
           ,[AccommodationTypeCode]
           ,[AccommodationTypeDescription]
		   )
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimAssessmentAccommodations OFF

	END

		IF OBJECT_ID('tempdb..#AssessmentAccommodationCategory') IS NOT NULL
			DROP TABLE #AssessmentAccommodationCategory

		CREATE TABLE #AssessmentAccommodationCategory (AssessmentAccommodationCategoryCode VARCHAR(50), AssessmentAccommodationCategoryDescription VARCHAR(200))

		INSERT INTO #AssessmentAccommodationCategory VALUES ('MISSING', 'MISSING')
		INSERT INTO #AssessmentAccommodationCategory 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AssessmentAccommodationCategory'

		IF OBJECT_ID('tempdb..#AccommodationType') IS NOT NULL
			DROP TABLE #AccommodationType

		CREATE TABLE #AccommodationType (AccommodationTypeCode VARCHAR(50), AccommodationTypeDescription VARCHAR(200))

		INSERT INTO #AccommodationType VALUES ('MISSING', 'MISSING')
		INSERT INTO #AccommodationType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AccommodationType'


	INSERT INTO [RDS].[DimAssessmentAccommodations]
           ([AssessmentAccommodationCategoryCode]
           ,[AssessmentAccommodationCategoryDescription]
           ,[AccommodationTypeCode]
           ,[AccommodationTypeDescription]
		   )
	SELECT 
		  eds.AssessmentAccommodationCategoryCode
		, eds.AssessmentAccommodationCategoryDescription
		, esfsfsp.AccommodationTypeCode
		, esfsfsp.AccommodationTypeDescription
	FROM #AssessmentAccommodationCategory eds
	CROSS JOIN #AccommodationType esfsfsp
	LEFT JOIN rds.DimAssessmentAccommodations rdeds
		ON	eds.AssessmentAccommodationCategoryCode								 = rdeds.AssessmentAccommodationCategoryCode								
		AND esfsfsp.AccommodationTypeCode		 = rdeds.AccommodationTypeCode			
	WHERE rdeds.DimAssessmentAccommodationId IS NULL

	DROP TABLE #AccommodationType
	DROP TABLE #AssessmentAccommodationCategory
		

	------------------------------------------------
	-- Populate DimAssessmentParticipationSessions					 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAssessmentParticipationSessions d WHERE d.DimAssessmentParticipationSessionId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimAssessmentParticipationSessions ON

	INSERT INTO [RDS].[DimAssessmentParticipationSessions]
           ([DimAssessmentParticipationSessionId]
		   ,[AssessmentSessionSpecialCircumstanceTypeCode]
           ,[AssessmentSessionSpecialCircumstanceTypeDescription])
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAssessmentParticipationSessions OFF
	END

	INSERT INTO RDS.DimAssessmentParticipationSessions
		(
			  AssessmentSessionSpecialCircumstanceTypeCode
			, AssessmentSessionSpecialCircumstanceTypeDescription
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAssessmentParticipationSessions main
		ON ceds.CedsOptionSetCode = main.DimAssessmentParticipationSessionId
	WHERE main.DimAssessmentParticipationSessionId IS NULL
		AND ceds.CedsElementTechnicalName = 'AssessmentSessionSpecialCircumstanceType'


	-----------------------------------------------------
	-- Populate DimAssessmentRegistrations             --
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAssessmentRegistrations d WHERE d.DimAssessmentRegistrationId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimAssessmentRegistrations ON

	INSERT INTO [RDS].[DimAssessmentRegistrations]
           ([DimAssessmentRegistrationId]
		   ,[AssessmentRegistrationParticipationIndicatorCode]
           ,[AssessmentRegistrationParticipationIndicatorDescription]
           ,[AssessmentRegistrationCompletionStatusCode]
           ,[AssessmentRegistrationCompletionStatusDescription]
           ,[StateFullAcademicYearCode]
           ,[StateFullAcademicYearDescription]
           ,[StateFullAcademicYearEdFactsCode]
           ,[LeaFullAcademicYearCode]
           ,[LeaFullAcademicYearDescription]
           ,[LeaFullAcademicYearEdFactsCode]
           ,[SchoolFullAcademicYearCode]
           ,[SchoolFullAcademicYearDescription]
           ,[SchoolFullAcademicYearEdFactsCode]
		   ,[AssessmentRegistrationReasonNotCompletingCode]	
		   ,[AssessmentRegistrationReasonNotCompletingDescription]
		   ,[AssessmentRegistrationReasonNotCompletingEdFactsCode]	
		   ,[ReasonNotTestedCode]	
		   ,[ReasonNotTestedDescription]	
		   ,[ReasonNotTestedEdFactsCode]
		   )
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimAssessmentRegistrations OFF

	END

		IF OBJECT_ID('tempdb..#AssessmentRegistrationParticipationIndicator') IS NOT NULL
			DROP TABLE  #AssessmentRegistrationParticipationIndicator
			
		CREATE TABLE #AssessmentRegistrationParticipationIndicator (AssessmentRegistrationParticipationIndicatorCode VARCHAR(50), AssessmentRegistrationParticipationIndicatorDescription VARCHAR(200))

		INSERT INTO #AssessmentRegistrationParticipationIndicator VALUES ('MISSING', 'MISSING')
		INSERT INTO #AssessmentRegistrationParticipationIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AssessmentRegistrationParticipationIndicator'


		IF OBJECT_ID('tempdb..#AssessmentRegistrationCompletionStatus') IS NOT NULL
			DROP TABLE #AssessmentRegistrationCompletionStatus

		CREATE TABLE #AssessmentRegistrationCompletionStatus (AssessmentRegistrationCompletionStatusCode VARCHAR(50), AssessmentRegistrationCompletionStatusDescription VARCHAR(200))

		INSERT INTO #AssessmentRegistrationCompletionStatus VALUES ('MISSING', 'MISSING')
		INSERT INTO #AssessmentRegistrationCompletionStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AssessmentRegistrationCompletionStatus'


		IF OBJECT_ID('tempdb..#StateFullAcademicYear') IS NOT NULL
			DROP TABLE #StateFullAcademicYear

		CREATE TABLE #StateFullAcademicYear (StateFullAcademicYearCode VARCHAR(50), StateFullAcademicYearDescription VARCHAR(200), StateFullAcademicYearEdFactsCode VARCHAR(50))

		INSERT INTO #StateFullAcademicYear VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #StateFullAcademicYear 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CASE CedsOptionSetCode
				WHEN 'Yes' THEN 'FULLYR'
				WHEN 'No' THEN 'NFULLYR'
				ELSE 'MISSING'
			  END
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'StateFullAcademicYear'


		IF OBJECT_ID('tempdb..#LeaFullAcademicYear') IS NOT NULL
			DROP TABLE #LeaFullAcademicYear

		CREATE TABLE #LeaFullAcademicYear (LeaFullAcademicYearCode VARCHAR(50), LeaFullAcademicYearDescription VARCHAR(200), LeaFullAcademicYearEdFactsCode VARCHAR(50))

		INSERT INTO #LeaFullAcademicYear VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #LeaFullAcademicYear 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CASE CedsOptionSetCode
				WHEN 'Yes' THEN 'FULLYR'
				WHEN 'No' THEN 'NFULLYR'
				ELSE 'MISSING'
			  END
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'LeaFullAcademicYear'

		IF OBJECT_ID('tempdb..#SchoolFullAcademicYear') IS NOT NULL
			DROP TABLE #SchoolFullAcademicYear

		CREATE TABLE #SchoolFullAcademicYear (SchoolFullAcademicYearCode VARCHAR(50), SchoolFullAcademicYearDescription VARCHAR(200), SchoolFullAcademicYearEdFactsCode VARCHAR(50))

		INSERT INTO #SchoolFullAcademicYear VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #SchoolFullAcademicYear 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CASE CedsOptionSetCode
				WHEN 'Yes' THEN 'FULLYR'
				WHEN 'No' THEN 'NFULLYR'
				ELSE 'MISSING'
			  END
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'SchoolFullAcademicYear'

		IF OBJECT_ID('tempdb..#AssessmentRegistrationReasonNotCompleting') IS NOT NULL
			DROP TABLE #AssessmentRegistrationReasonNotCompleting

		CREATE TABLE #AssessmentRegistrationReasonNotCompleting (AssessmentRegistrationReasonNotCompletingCode VARCHAR(50), AssessmentRegistrationReasonNotCompletingDescription VARCHAR(200), AssessmentRegistrationReasonNotCompletingEdFactsCode VARCHAR(50))

		INSERT INTO #AssessmentRegistrationReasonNotCompleting VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #AssessmentRegistrationReasonNotCompleting 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CASE 
				WHEN CedsOptionSetCode <> 'MISSING' THEN 'NPART'
				ELSE 'MISSING'
			  END
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AssessmentRegistrationReasonNotCompleting'

		IF OBJECT_ID('tempdb..#ReasonNotTested') IS NOT NULL
			DROP TABLE #ReasonNotTested
		
		CREATE TABLE #ReasonNotTested (ReasonNotTestedCode VARCHAR(50), ReasonNotTestedDescription VARCHAR(200), ReasonNotTestedEdFactsCode VARCHAR(50))

		INSERT INTO #ReasonNotTested VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #ReasonNotTested 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CASE CedsOptionSetCode
				WHEN '03451' THEN 'NPART'
				WHEN '03452' THEN 'NPART'
				WHEN '03453' THEN 'NPART'
				WHEN '03454' THEN 'MEDEXEMPT'
				WHEN '03455' THEN 'NPART'
				WHEN '03456' THEN 'NPART'
				WHEN '09999' THEN 'NPART'
				ELSE 'MISSING'
			  END
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'ReasonNotTested'


	INSERT INTO [RDS].[DimAssessmentRegistrations]
           ([AssessmentRegistrationParticipationIndicatorCode]
           ,[AssessmentRegistrationParticipationIndicatorDescription]
           ,[AssessmentRegistrationCompletionStatusCode]
           ,[AssessmentRegistrationCompletionStatusDescription]
           ,[StateFullAcademicYearCode]
           ,[StateFullAcademicYearDescription]
           ,[StateFullAcademicYearEdFactsCode]
           ,[LeaFullAcademicYearCode]
           ,[LeaFullAcademicYearDescription]
           ,[LeaFullAcademicYearEdFactsCode]
           ,[SchoolFullAcademicYearCode]
           ,[SchoolFullAcademicYearDescription]
           ,[SchoolFullAcademicYearEdFactsCode]
		   ,[AssessmentRegistrationReasonNotCompletingCode]	
		   ,[AssessmentRegistrationReasonNotCompletingDescription]
		   ,[AssessmentRegistrationReasonNotCompletingEdFactsCode]	
		   ,[ReasonNotTestedCode]	
		   ,[ReasonNotTestedDescription]	
		   ,[ReasonNotTestedEdFactsCode]
)
	SELECT 
		arcs.AssessmentRegistrationCompletionStatusCode
		,arcs.AssessmentRegistrationCompletionStatusDescription
		,arpi.AssessmentRegistrationParticipationIndicatorCode
		,arpi.AssessmentRegistrationParticipationIndicatorDescription
		,sfay.StateFullAcademicYearCode
		,sfay.StateFullAcademicYearDescription
		,sfay.StateFullAcademicYearEdFactsCode
		,lfay.LeaFullAcademicYearCode
		,lfay.LeaFullAcademicYearDescription
		,lfay.LeaFullAcademicYearEdFactsCode
		,schfay.SchoolFullAcademicYearCode
		,schfay.SchoolFullAcademicYearDescription
		,schfay.SchoolFullAcademicYearEdFactsCode
		,arrnc.AssessmentRegistrationReasonNotCompletingCode	
		,arrnc.AssessmentRegistrationReasonNotCompletingDescription
		,arrnc.AssessmentRegistrationReasonNotCompletingEdFactsCode	
		,rntc.ReasonNotTestedCode	
		,rntc.ReasonNotTestedDescription	
		,rntc.ReasonNotTestedEdFactsCode
	FROM #AssessmentRegistrationCompletionStatus arcs
	CROSS JOIN #AssessmentRegistrationParticipationIndicator arpi
	CROSS JOIN #StateFullAcademicYear sfay
	CROSS JOIN #LeaFullAcademicYear lfay
	CROSS JOIN #SchoolFullAcademicYear schfay
	CROSS JOIN #AssessmentRegistrationReasonNotCompleting arrnc
	CROSS JOIN #ReasonNotTested rntc
	LEFT JOIN rds.DimAssessmentRegistrations dar
		ON	arcs.AssessmentRegistrationCompletionStatusCode = dar.AssessmentRegistrationCompletionStatusCode
		AND arpi.AssessmentRegistrationParticipationIndicatorCode = dar.AssessmentRegistrationParticipationIndicatorCode
		AND sfay.StateFullAcademicYearCode = dar.StateFullAcademicYearCode
		AND lfay.LeaFullAcademicYearDescription = dar.LeaFullAcademicYearCode
		AND schfay.SchoolFullAcademicYearCode = dar.SchoolFullAcademicYearCode	
		AND arrnc.AssessmentRegistrationReasonNotCompletingCode = dar.AssessmentRegistrationReasonNotCompletingCode
		AND rntc.ReasonNotTestedCode = dar.ReasonNotTestedCode
	WHERE dar.DimAssessmentRegistrationId IS NULL

	DROP TABLE #AssessmentRegistrationCompletionStatus
	DROP TABLE #AssessmentRegistrationParticipationIndicator
	DROP TABLE #LeaFullAcademicYear
	DROP TABLE #SchoolFullAcademicYear
	DROP TABLE #StateFullAcademicYear
	DROP TABLE #AssessmentRegistrationReasonNotCompleting
	DROP TABLE #ReasonNotTested

	------------------------------------------------
	-- Populate DimAssessmentResults					 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAssessmentResults d WHERE d.DimAssessmentResultId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimAssessmentResults ON

	INSERT INTO [RDS].[DimAssessmentResults]
           ([DimAssessmentResultId]
		   ,[AssessmentScoreMetricTypeCode]
           ,[AssessmentScoreMetricTypeDescription])
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAssessmentResults OFF
	END

	INSERT INTO [RDS].[DimAssessmentResults]
           ([AssessmentScoreMetricTypeCode]
           ,[AssessmentScoreMetricTypeDescription])
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAssessmentResults main
		ON ceds.CedsOptionSetCode = main.DimAssessmentResultId
	WHERE main.DimAssessmentResultId IS NULL
		AND ceds.CedsElementTechnicalName = 'AssessmentScoreMetricType'


	------------------------------------------------
	-- Populate DimBuildingSpaceDesignTypes					 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimBuildingSpaceDesignTypes d WHERE d.DimBuildingSpaceDesignTypeId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimBuildingSpaceDesignTypes ON

	INSERT INTO [RDS].[DimBuildingSpaceDesignTypes]
           ([DimBuildingSpaceDesignTypeId]
		   ,[BuildingSpaceDesignTypeCode]
           ,[BuildingSpaceDesignTypeDescription])
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimBuildingSpaceDesignTypes OFF
	END

	INSERT INTO [RDS].[DimBuildingSpaceDesignTypes]
           ([BuildingSpaceDesignTypeCode]
           ,[BuildingSpaceDesignTypeDescription])
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimBuildingSpaceDesignTypes main
		ON ceds.CedsOptionSetCode = main.DimBuildingSpaceDesignTypeId
	WHERE main.DimBuildingSpaceDesignTypeId IS NULL
		AND ceds.CedsElementTechnicalName = 'BuildingSpaceDesignType'


	-----------------------------------------------------
	-- Populate DimIncidentStatuses 		           --
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimIncidentStatuses d WHERE d.DimIncidentStatusId = -1) 
	BEGIN
		SET IDENTITY_INSERT RDS.DimIncidentStatuses ON

		INSERT INTO [RDS].[DimIncidentStatuses] (
			[DimIncidentStatusId]
			, [IncidentBehaviorCode]
			, [IncidentBehaviorDescription]
			, [IdeaInterimRemovalReasonCode]
			, [IdeaInterimRemovalReasonDescription]
			, [IdeaInterimRemovalReasonEdFactsCode]
			, [DisciplineReasonCode]
			, [DisciplineReasonDescription]
			, [IncidentInjuryTypeCode]
			, [IncidentInjuryTypeDescription]		
		)
		VALUES (
			-1
			, 'MISSING'
			, 'MISSING'
			, 'MISSING'
			, 'MISSING'
			, 'MISSING'
			, 'MISSING'
			, 'MISSING'
			, 'MISSING'
			, 'MISSING'
		)

		SET IDENTITY_INSERT RDS.DimIncidentStatuses OFF

	END

/* NOTE */
--This needs to be removed when the full population of this table is completed
		--Insert temporary rows into this dimension for IDEA Interim Removal Reason

		INSERT INTO [RDS].[DimIncidentStatuses] (
			[IncidentBehaviorCode]
			, [IncidentBehaviorDescription]
			, [IdeaInterimRemovalReasonCode]
			, [IdeaInterimRemovalReasonDescription]
			, [IdeaInterimRemovalReasonEdFactsCode]
			, [DisciplineReasonCode]
			, [DisciplineReasonDescription]
			, [IncidentInjuryTypeCode]
			, [IncidentInjuryTypeDescription]		
		)
		VALUES ('MISSING', 'D', 'Drugs', 'D', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING'),
			('MISSING', 'W', 'Weapons', 'W', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING'),
			('MISSING', 'SBI', 'Serious Bodily Injury', 'SBI', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING')


	-----------------------------------------------------
	-- Populate DimFirearmDisciplineStatuses           --
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimFirearmDisciplineStatuses d WHERE d.DimFirearmDisciplineStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimFirearmDisciplineStatuses ON

	INSERT INTO [RDS].[DimFirearmDisciplineStatuses]
           ([DimFirearmDisciplineStatusId]
		   ,[DisciplineMethodForFirearmsIncidentsCode]
           ,[DisciplineMethodForFirearmsIncidentsDescription]
           ,[DisciplineMethodForFirearmsIncidentsEdFactsCode]
           ,[IdeaDisciplineMethodForFirearmsIncidentsCode]
           ,[IdeaDisciplineMethodForFirearmsIncidentsDescription]
           ,[IdeaDisciplineMethodForFirearmsIncidentsEdFactsCode])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimFirearmDisciplineStatuses OFF

	END

		IF OBJECT_ID('tempdb..#DisciplineMethodForFirearmsIncidents') IS NOT NULL
			DROP TABLE #DisciplineMethodForFirearmsIncidents

		CREATE TABLE #DisciplineMethodForFirearmsIncidents (DisciplineMethodForFirearmsIncidentsCode VARCHAR(50), DisciplineMethodForFirearmsIncidentsDescription VARCHAR(200), DisciplineMethodForFirearmsIncidentsEdFactsCode VARCHAR(50))

		INSERT INTO #DisciplineMethodForFirearmsIncidents VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #DisciplineMethodForFirearmsIncidents 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'DisciplineMethodForFirearmsIncidents'


		IF OBJECT_ID('tempdb..#IdeaDisciplineMethodForFirearmsIncidents') IS NOT NULL
			DROP TABLE #IdeaDisciplineMethodForFirearmsIncidents

		CREATE TABLE #IdeaDisciplineMethodForFirearmsIncidents (IdeaDisciplineMethodForFirearmsIncidentsCode VARCHAR(50), IdeaDisciplineMethodForFirearmsIncidentsDescription VARCHAR(200), IdeaDisciplineMethodForFirearmsIncidentsEdFactsCode VARCHAR(50))

		INSERT INTO #IdeaDisciplineMethodForFirearmsIncidents VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #IdeaDisciplineMethodForFirearmsIncidents 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'IdeaDisciplineMethodForFirearmsIncidents'


	INSERT INTO [RDS].[DimFirearmDisciplineStatuses]
           ([DisciplineMethodForFirearmsIncidentsCode]
           ,[DisciplineMethodForFirearmsIncidentsDescription]
           ,[DisciplineMethodForFirearmsIncidentsEdFactsCode]
           ,[IdeaDisciplineMethodForFirearmsIncidentsCode]
           ,[IdeaDisciplineMethodForFirearmsIncidentsDescription]
           ,[IdeaDisciplineMethodForFirearmsIncidentsEdFactsCode])
	SELECT 
		dm.DisciplineMethodForFirearmsIncidentsCode
		,dm.DisciplineMethodForFirearmsIncidentsDescription
		,dm.DisciplineMethodForFirearmsIncidentsEdFactsCode
		,idm.IdeaDisciplineMethodForFirearmsIncidentsCode
		,idm.IdeaDisciplineMethodForFirearmsIncidentsDescription
		,idm.IdeaDisciplineMethodForFirearmsIncidentsEdFactsCode
	FROM #DisciplineMethodForFirearmsIncidents dm
	CROSS JOIN #IdeaDisciplineMethodForFirearmsIncidents idm
	LEFT JOIN rds.DimFirearmDisciplineStatuses dfds
		ON	dm.DisciplineMethodForFirearmsIncidentsCode	= dfds.DisciplineMethodForFirearmsIncidentsCode								
		AND idm.IdeaDisciplineMethodForFirearmsIncidentsCode = dfds.IdeaDisciplineMethodForFirearmsIncidentsCode			
	WHERE dfds.DimFirearmDisciplineStatusId IS NULL

	DROP TABLE #DisciplineMethodForFirearmsIncidents
	DROP TABLE #IdeaDisciplineMethodForFirearmsIncidents



	------------------------------------------------
	-- Populate DimFirearms					 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimFirearms d WHERE d.DimFirearmId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimFirearms ON

	INSERT INTO [RDS].[DimFirearms]
           ([DimFirearmId]
		   ,[FirearmTypeCode]
           ,[FirearmTypeDescription]
           ,[FirearmTypeEdFactsCode])
			VALUES (-1, 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimFirearms OFF
	END

	INSERT INTO [RDS].[DimFirearms]
           ([FirearmTypeCode]
           ,[FirearmTypeDescription]
           ,[FirearmTypeEdFactsCode])
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimFirearms main
		ON ceds.CedsOptionSetCode = main.FirearmTypeCode
	WHERE main.DimFirearmId IS NULL
		AND ceds.CedsElementTechnicalName = 'FirearmType'

	------------------------------------------------
	-- Populate DimK12StaffCategories					 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12StaffCategories d WHERE d.DimK12StaffCategoryId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimK12StaffCategories ON

	INSERT INTO [RDS].[DimK12StaffCategories]
           ([DimK12StaffCategoryId]
		   ,[K12StaffClassificationCode]
           ,[K12StaffClassificationDescription]
           ,[K12StaffClassificationEdFactsCode]
           ,[SpecialEducationSupportServicesCategoryCode]
           ,[SpecialEducationSupportServicesCategoryDescription]
           ,[SpecialEducationSupportServicesCategoryEdFactsCode]
           ,[TitleIProgramStaffCategoryCode]
           ,[TitleIProgramStaffCategoryDescription]
           ,[TitleIProgramStaffCategoryEdFactsCode])
		   VALUES (-1, 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING')

			SET IDENTITY_INSERT RDS.DimK12StaffCategories OFF
	END

		IF OBJECT_ID('tempdb..#K12StaffClassification') IS NOT NULL
			DROP TABLE #K12StaffClassification

		CREATE TABLE #K12StaffClassification (K12StaffClassificationCode VARCHAR(50), K12StaffClassificationDescription VARCHAR(200), K12StaffClassificationEdFactsCode VARCHAR(50))

		INSERT INTO #K12StaffClassification VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #K12StaffClassification 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CASE CedsOptionSetCode
				WHEN 'AdministrativeSupportStaff' THEN 'LEASUP'
				WHEN 'Administrators' THEN 'LEAADM'
				WHEN 'AllOtherSupportStaff' THEN 'OTHSUP'
				WHEN 'ElementaryTeachers' THEN 'ELMTCH'
				WHEN 'InstructionalCoordinators' THEN 'CORSUP'
				WHEN 'KindergartenTeachers' THEN 'KGTCH'
				WHEN 'LibraryMediaSpecialists' THEN 'LIBSPE'
				WHEN 'LibraryMediaSupportStaff' THEN 'LIBSUP'
				WHEN 'Paraprofessionals' THEN 'PARA'
				WHEN 'Pre-KindergartenTeachers'	THEN 'PKTCH'
				WHEN 'SchoolCounselors' THEN 'ELMGUI'
				WHEN 'SchoolPsychologist' THEN 'SCHPSYCH'
				WHEN 'SecondaryTeachers' THEN 'SECTCH'
				WHEN 'SpecialEducationTeachers' THEN 'MISSING'
				WHEN 'StudentSupportServicesStaff' THEN 'STUSUP'
				WHEN 'UngradedTeachers' THEN 'UGTCH'
				ELSE 'MISSING'
			  END
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'K12StaffClassification'

		IF OBJECT_ID('tempdb..#SpecialEducationSupportServicesCategory') IS NOT NULL
			DROP TABLE #SpecialEducationSupportServicesCategory
		CREATE TABLE #SpecialEducationSupportServicesCategory (SpecialEducationSupportServicesCategoryCode VARCHAR(50), SpecialEducationSupportServicesCategoryDescription VARCHAR(200), SpecialEducationSupportServicesCategoryEdFactsCode VARCHAR(50))

		INSERT INTO #SpecialEducationSupportServicesCategory VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #SpecialEducationSupportServicesCategory 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'SpecialEducationSupportServicesCategory'

		IF OBJECT_ID('tempdb..#TitleIProgramStaffCategory') IS NOT NULL
			DROP TABLE #TitleIProgramStaffCategory

		CREATE TABLE #TitleIProgramStaffCategory (TitleIProgramStaffCategoryCode VARCHAR(50), TitleIProgramStaffCategoryDescription VARCHAR(200), TitleIProgramStaffCategoryEdFactsCode VARCHAR(50))

		INSERT INTO #TitleIProgramStaffCategory VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #TitleIProgramStaffCategory 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CASE CedsOptionSetCode
				WHEN 'TitleISupportStaff' THEN 'TITSUP'
				WHEN 'TitleIOtherParaprofessional' THEN 'TITO'
				WHEN 'TitleIParaprofessional' THEN 'TITPARA'
				WHEN 'TitleITeacher' THEN 'TITTCH'
				WHEN 'TitleIAdministrator' THEN 'TITADM'
				ELSE 'MISSING'
			  END
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'TitleIProgramStaffCategory'



	INSERT INTO [RDS].[DimK12StaffCategories]
           ([K12StaffClassificationCode]
           ,[K12StaffClassificationDescription]
           ,[K12StaffClassificationEdFactsCode]
           ,[SpecialEducationSupportServicesCategoryCode]
           ,[SpecialEducationSupportServicesCategoryDescription]
           ,[SpecialEducationSupportServicesCategoryEdFactsCode]
           ,[TitleIProgramStaffCategoryCode]
           ,[TitleIProgramStaffCategoryDescription]
           ,[TitleIProgramStaffCategoryEdFactsCode])


	SELECT 
		ksc.K12StaffClassificationCode
		,ksc.K12StaffClassificationDescription
		,ksc.K12StaffClassificationEdFactsCode
		,ssc.SpecialEducationSupportServicesCategoryCode
		,ssc.SpecialEducationSupportServicesCategoryDescription
		,ssc.SpecialEducationSupportServicesCategoryEdFactsCode
		,tsc.TitleIProgramStaffCategoryCode
		,tsc.TitleIProgramStaffCategoryDescription
		,tsc.TitleIProgramStaffCategoryEdFactsCode
	FROM #K12StaffClassification ksc
	CROSS JOIN #SpecialEducationSupportServicesCategory ssc
	CROSS JOIN #TitleIProgramStaffCategory tsc
	LEFT JOIN rds.DimK12StaffCategories dfd
		ON	ksc.K12StaffClassificationCode	= dfd.K12StaffClassificationCode								
		AND ssc.SpecialEducationSupportServicesCategoryCode = dfd.SpecialEducationSupportServicesCategoryCode
		AND tsc.TitleIProgramStaffCategoryCode = dfd.TitleIProgramStaffCategoryCode
	WHERE dfd.DimK12StaffCategoryId IS NULL

	DROP TABLE #K12StaffClassification
	DROP TABLE #SpecialEducationSupportServicesCategory
	DROP TABLE #TitleIProgramStaffCategory

		------------------------------------------------
	-- Populate DimAcademicTermDesignators		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAcademicTermDesignators d WHERE d.AcademicTermDesignatorCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimAcademicTermDesignators ON

		INSERT INTO RDS.DimAcademicTermDesignators (DimAcademicTermDesignatorId, AcademicTermDesignatorCode, AcademicTermDesignatorDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAcademicTermDesignators OFF
	END

	INSERT INTO RDS.DimAcademicTermDesignators
		(
			  AcademicTermDesignatorCode
			, AcademicTermDesignatorDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAcademicTermDesignators main
		ON ceds.CedsOptionSetCode = main.AcademicTermDesignatorCode
	WHERE main.DimAcademicTermDesignatorId IS NULL
		AND ceds.CedsElementTechnicalName = 'AcademicTermDesignator'


	-----------------------------------------------------
	-- Populate DimPsDemographics                     --
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimPsDemographics d WHERE d.DimPsDemographicId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimPsDemographics ON

		INSERT INTO [RDS].[DimPsDemographics]
           ([DimPsDemographicId]
           ,[SexCode]
           ,[SexDescription]
		   )
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimPsDemographics OFF

	END


		CREATE TABLE #PsSex (SexCode VARCHAR(50), SexDescription VARCHAR(200))

		INSERT INTO #PsSex VALUES ('MISSING', 'MISSING')
		INSERT INTO #PsSex 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'Sex'


		INSERT INTO [RDS].[DimPsDemographics]
           ([SexCode]
           ,[SexDescription]
		   )
		SELECT DISTINCT
			  h.SexCode
			, h.SexDescription
		FROM #PsSex h
		LEFT JOIN rds.DimPsDemographics main
			ON  h.SexCode = main.SexCode
		WHERE main.DimPsDemographicId IS NULL

	DROP TABLE #PsSex

	------------------------------------------------
	-- Populate DimDisciplineStatuses			 ---
	------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimDisciplineStatuses 
			WHERE DisciplinaryActionTakenCode = 'MISSING'
			AND DisciplineMethodOfChildrenWithDisabilitiesCode = 'MISSING'
			AND IdeaInterimRemovalReasonCode = 'MISSING'
			AND EducationalServicesAfterRemovalCode = 'MISSING'
			AND IdeaInterimRemovalCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimDisciplineStatuses ON

		INSERT INTO RDS.DimDisciplineStatuses (
			  DimDisciplineStatusId
			, DisciplinaryActionTakenCode
			, DisciplinaryActionTakenDescription
			, DisciplinaryActionTakenEdFactsCode
			, DisciplineMethodOfChildrenWithDisabilitiesCode
			, DisciplineMethodOfChildrenWithDisabilitiesDescription
			, DisciplineMethodOfChildrenWithDisabilitiesEdFactsCode
			, EducationalServicesAfterRemovalCode
			, EducationalServicesAfterRemovalDescription
			, EducationalServicesAfterRemovalEdFactsCode
			, IdeaInterimRemovalReasonCode
			, IdeaInterimRemovalReasonDescription
			, IdeaInterimRemovalReasonEdFactsCode
			, IdeaInterimRemovalCode
			, IdeaInterimRemovalDescription
			, IdeaInterimRemovalEdFactsCode)
		VALUES (-1, 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimDisciplineStatuses OFF
	END

	IF OBJECT_ID('tempdb..#DisciplinaryActionTaken') IS NOT NULL BEGIN
		DROP TABLE #DisciplinaryActionTaken
	END

	CREATE TABLE #DisciplinaryActionTaken (DisciplinaryActionTakenCode VARCHAR(50), DisciplinaryActionTakenDescription VARCHAR(200), DisciplinaryActionTakenEdFactsCode VARCHAR(50))

	INSERT INTO #DisciplinaryActionTaken VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #DisciplinaryActionTaken 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'DisciplinaryActionTaken'

	IF OBJECT_ID('tempdb..#DisciplineMethodOfChildrenWithDisabilities') IS NOT NULL BEGIN
		DROP TABLE #DisciplineMethodOfChildrenWithDisabilities
	END

	CREATE TABLE #DisciplineMethodOfChildrenWithDisabilities (DisciplineMethodOfChildrenWithDisabilitiesCode VARCHAR(50), DisciplineMethodOfChildrenWithDisabilitiesDescription VARCHAR(200), DisciplineMethodOfChildrenWithDisabilitiesEdFactsCode VARCHAR(50))

	INSERT INTO #DisciplineMethodOfChildrenWithDisabilities VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #DisciplineMethodOfChildrenWithDisabilities 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, UPPER(CedsOptionSetCode) AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'DisciplineMethodOfChildrenWithDisabilities'

	IF OBJECT_ID('tempdb..#EducationalServicesAfterRemoval') IS NOT NULL BEGIN
		DROP TABLE #EducationalServicesAfterRemoval
	END

	CREATE TABLE #EducationalServicesAfterRemoval (EducationalServicesAfterRemovalCode VARCHAR(50), EducationalServicesAfterRemovalDescription VARCHAR(200), EducationalServicesAfterRemovalEdFactsCode VARCHAR(50))

	INSERT INTO #EducationalServicesAfterRemoval VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EducationalServicesAfterRemoval 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EducationalServicesAfterRemoval'
	
--EDFacts Code is incorrectly populated with the CEDS Code
	UPDATE #EducationalServicesAfterRemoval
	SET EducationalServicesAfterRemovalEdFactsCode = 'SERVPROV'
	WHERE EducationalServicesAfterRemovalEdFactsCode = 'Yes'

	UPDATE #EducationalServicesAfterRemoval
	SET EducationalServicesAfterRemovalEdFactsCode = 'SERVNOTPROV'
	WHERE EducationalServicesAfterRemovalEdFactsCode = 'No'


	IF OBJECT_ID('tempdb..#IdeaInterimRemovalReason') IS NOT NULL BEGIN
		DROP TABLE #IdeaInterimRemovalReason
	END

	CREATE TABLE #IdeaInterimRemovalReason (IdeaInterimRemovalReasonCode VARCHAR(50), IdeaInterimRemovalReasonDescription VARCHAR(200), IdeaInterimRemovalReasonEdFactsCode VARCHAR(50))

	INSERT INTO #IdeaInterimRemovalReason VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #IdeaInterimRemovalReason 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'IdeaInterimRemovalReason'

--EDFacts Code is incorrectly populated with the CEDS Code
	UPDATE #IdeaInterimRemovalReason
	SET IdeaInterimRemovalReasonEdFactsCode = 'D'
	WHERE IdeaInterimRemovalReasonEdFactsCode = 'Drugs'

	UPDATE #IdeaInterimRemovalReason
	SET IdeaInterimRemovalReasonEdFactsCode = 'W'
	WHERE IdeaInterimRemovalReasonEdFactsCode = 'Weapons'

	UPDATE #IdeaInterimRemovalReason
	SET IdeaInterimRemovalReasonEdFactsCode = 'SBI'
	WHERE IdeaInterimRemovalReasonEdFactsCode = 'SeriousBodilyInjury'


	IF OBJECT_ID('tempdb..#IdeaInterimRemoval') IS NOT NULL BEGIN
		DROP TABLE #IdeaInterimRemoval
	END
	CREATE TABLE #IdeaInterimRemoval (IdeaInterimRemovalCode VARCHAR(50), IdeaInterimRemovalDescription VARCHAR(200), IdeaInterimRemovalEdFactsCode VARCHAR(50))

	INSERT INTO #IdeaInterimRemoval VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #IdeaInterimRemoval 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'IdeaInterimRemoval'

	   
	INSERT INTO RDS.DimDisciplineStatuses
		(
			  DisciplinaryActionTakenCode
			, DisciplinaryActionTakenDescription
			, DisciplinaryActionTakenEdFactsCode
			, DisciplineMethodOfChildrenWithDisabilitiesCode
			, DisciplineMethodOfChildrenWithDisabilitiesDescription
			, DisciplineMethodOfChildrenWithDisabilitiesEdFactsCode
			, EducationalServicesAfterRemovalCode
			, EducationalServicesAfterRemovalDescription
			, EducationalServicesAfterRemovalEdFactsCode
			, IdeaInterimRemovalReasonCode
			, IdeaInterimRemovalReasonDescription
			, IdeaInterimRemovalReasonEdFactsCode
			, IdeaInterimRemovalCode
			, IdeaInterimRemovalDescription
			, IdeaInterimRemovalEdFactsCode   
		)
	SELECT 
		  dat.DisciplinaryActionTakenCode
		, dat.DisciplinaryActionTakenDescription
		, dat.DisciplinaryActionTakenEdFactsCode
		, dmocwd.DisciplineMethodOfChildrenWithDisabilitiesCode
		, dmocwd.DisciplineMethodOfChildrenWithDisabilitiesDescription
		, dmocwd.DisciplineMethodOfChildrenWithDisabilitiesEdFactsCode
		, esar.EducationalServicesAfterRemovalCode
		, esar.EducationalServicesAfterRemovalDescription
		, esar.EducationalServicesAfterRemovalEdFactsCode
		, iirr.IdeaInterimRemovalReasonCode
		, iirr.IdeaInterimRemovalReasonDescription
		, iirr.IdeaInterimRemovalReasonEdFactsCode
		, iir.IdeaInterimRemovalCode
		, iir.IdeaInterimRemovalDescription
		, iir.IdeaInterimRemovalEdFactsCode
	FROM #DisciplinaryActionTaken dat
	CROSS JOIN #DisciplineMethodOfChildrenWithDisabilities dmocwd
	CROSS JOIN #EducationalServicesAfterRemoval esar
	CROSS JOIN #IdeaInterimRemovalReason iirr
	CROSS JOIN #IdeaInterimRemoval iir
	LEFT JOIN rds.DimDisciplineStatuses main
		ON dat.DisciplinaryActionTakenCode = main.DisciplinaryActionTakenCode
		AND dmocwd.DisciplineMethodOfChildrenWithDisabilitiesCode = main.DisciplineMethodOfChildrenWithDisabilitiesCode
		AND esar.EducationalServicesAfterRemovalCode = main.EducationalServicesAfterRemovalCode
		AND iirr.IdeaInterimRemovalReasonCode = main.IdeaInterimRemovalReasonCode
		AND iir.IdeaInterimRemovalCode = main.IdeaInterimRemovalCode
	WHERE main.DimDisciplineStatusId IS NULL

	DROP TABLE #DisciplinaryActionTaken
	DROP TABLE #DisciplineMethodOfChildrenWithDisabilities
	DROP TABLE #EducationalServicesAfterRemoval
	DROP TABLE #IdeaInterimRemovalReason
	DROP TABLE #IdeaInterimRemoval
	
	------------------------------------------------
	-- Populate DimK12StaffStatuses			 ---
	------------------------------------------------
	IF NOT EXISTS (
			SELECT 1 FROM RDS.DimK12StaffStatuses 
			WHERE SpecialEducationAgeGroupTaughtCode = 'MISSING'
			AND EdFactsCertificationStatusCode = 'MISSING'
			AND HighlyQualifiedTeacherIndicatorCode = 'MISSING'
			AND EdFactsTeacherInexperiencedStatusCode = 'MISSING'
			AND TeachingCredentialTypeCode = 'MISSING'
			AND EdFactsTeacherOutOfFieldStatusCode = 'MISSING'
			AND SpecialEducationTeacherQualificationStatusCode = 'MISSING'
			AND ParaprofessionalQualificationStatusCode = 'MISSING'
		) 
		BEGIN
		SET IDENTITY_INSERT RDS.DimK12StaffStatuses ON

		INSERT INTO RDS.DimK12StaffStatuses (
			  DimK12StaffStatusId
			, SpecialEducationAgeGroupTaughtCode
			, SpecialEducationAgeGroupTaughtDescription
			, SpecialEducationAgeGroupTaughtEdFactsCode
			, EdFactsCertificationStatusCode
			, EdFactsCertificationStatusDescription
			, EdFactsCertificationStatusEdFactsCode
			, HighlyQualifiedTeacherIndicatorCode
			, HighlyQualifiedTeacherIndicatorDescription
			, HighlyQualifiedTeacherIndicatorEdFactsCode
			, EdFactsTeacherInexperiencedStatusCode
			, EdFactsTeacherInexperiencedStatusDescription
			, EdFactsTeacherInexperiencedStatusEdFactsCode
			, TeachingCredentialTypeCode
			, TeachingCredentialTypeDescription
			, TeachingCredentialTypeEdFactsCode
			, EdFactsTeacherOutOfFieldStatusCode
			, EdFactsTeacherOutOfFieldStatusDescription
			, EdFactsTeacherOutOfFieldStatusEdFactsCode
			, SpecialEducationTeacherQualificationStatusCode
			, SpecialEducationTeacherQualificationStatusDescription
			, SpecialEducationTeacherQualificationStatusEdFactsCode
			, ParaprofessionalQualificationStatusCode
			, ParaprofessionalQualificationStatusDescription
			, ParaprofessionalQualificationStatusEdFactsCode)
		VALUES (-1, 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING','MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimK12StaffStatuses OFF
	END

	IF OBJECT_ID('tempdb..#SpecialEducationAgeGroupTaught') IS NOT NULL BEGIN
		DROP TABLE #SpecialEducationAgeGroupTaught
	END

	CREATE TABLE #SpecialEducationAgeGroupTaught (SpecialEducationAgeGroupTaughtCode VARCHAR(50), SpecialEducationAgeGroupTaughtDescription VARCHAR(200), SpecialEducationAgeGroupTaughtEdFactsCode VARCHAR(50))

	INSERT INTO #SpecialEducationAgeGroupTaught VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #SpecialEducationAgeGroupTaught 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SpecialEducationAgeGroupTaught'

	IF OBJECT_ID('tempdb..#EdFactsCertificationStatus') IS NOT NULL BEGIN
		DROP TABLE #EdFactsCertificationStatus
	END

	IF OBJECT_ID('tempdb..#EdFactsCertificationStatus') IS NOT NULL BEGIN
		DROP TABLE #EdFactsCertificationStatus
	END

	CREATE TABLE #EdFactsCertificationStatus (EdFactsCertificationStatusCode VARCHAR(50), EdFactsCertificationStatusDescription VARCHAR(200), EdFactsCertificationStatusEdFactsCode VARCHAR(50))

	INSERT INTO #EdFactsCertificationStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EdFactsCertificationStatus
	SELECT DISTINCT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EdFactsCertificationStatus'

	IF OBJECT_ID('tempdb..#HighlyQualifiedTeacherIndicator') IS NOT NULL BEGIN
		DROP TABLE #HighlyQualifiedTeacherIndicator
	END

	CREATE TABLE #HighlyQualifiedTeacherIndicator (HighlyQualifiedTeacherIndicatorCode VARCHAR(50), HighlyQualifiedTeacherIndicatorDescription VARCHAR(200), HighlyQualifiedTeacherIndicatorEdFactsCode VARCHAR(50))

	INSERT INTO #HighlyQualifiedTeacherIndicator VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #HighlyQualifiedTeacherIndicator 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'HighlyQualifiedTeacherIndicator'

	IF OBJECT_ID('tempdb..#EdFactsTeacherInexperiencedStatus') IS NOT NULL BEGIN
		DROP TABLE #EdFactsTeacherInexperiencedStatus
	END
	CREATE TABLE #EdFactsTeacherInexperiencedStatus (EdFactsTeacherInexperiencedStatusCode VARCHAR(50), EdFactsTeacherInexperiencedStatusDescription VARCHAR(200), EdFactsTeacherInexperiencedStatusEdFactsCode VARCHAR(50))

	INSERT INTO #EdFactsTeacherInexperiencedStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EdFactsTeacherInexperiencedStatus 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EdFactsTeacherInexperiencedStatus'

	IF OBJECT_ID('tempdb..#TeachingCredentialType') IS NOT NULL BEGIN
		DROP TABLE #TeachingCredentialType
	END
	CREATE TABLE #TeachingCredentialType (TeachingCredentialTypeCode VARCHAR(50), TeachingCredentialTypeDescription VARCHAR(200), TeachingCredentialTypeEdFactsCode VARCHAR(50))

	INSERT INTO #TeachingCredentialType VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #TeachingCredentialType 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'Emergency' THEN 'TCHWEMRPRVCRD'
			WHEN 'Master' THEN 'TCHWOEMRPRVCRD'
			WHEN 'Professional' THEN 'TCHWOEMRPRVCRD'
			WHEN 'Provisional' THEN 'TCHWEMRPRVCRD'
			WHEN 'Regular' THEN 'TCHWOEMRPRVCRD'
			WHEN 'Specialist' THEN 'TCHWOEMRPRVCRD'
			ELSE 'MISSING'
		  END
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TeachingCredentialType'

	IF OBJECT_ID('tempdb..#EdFactsTeacherOutOfFieldStatus') IS NOT NULL BEGIN
		DROP TABLE #EdFactsTeacherOutOfFieldStatus
	END
	CREATE TABLE #EdFactsTeacherOutOfFieldStatus (EdFactsTeacherOutOfFieldStatusCode VARCHAR(50), EdFactsTeacherOutOfFieldStatusDescription VARCHAR(200), EdFactsTeacherOutOfFieldStatusEdFactsCode VARCHAR(50))

	INSERT INTO #EdFactsTeacherOutOfFieldStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EdFactsTeacherOutOfFieldStatus 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EdFactsTeacherOutOfFieldStatus'

	IF OBJECT_ID('tempdb..#SpecialEducationTeacherQualificationStatus') IS NOT NULL BEGIN
		DROP TABLE #SpecialEducationTeacherQualificationStatus
	END
	CREATE TABLE #SpecialEducationTeacherQualificationStatus (SpecialEducationTeacherQualificationStatusCode VARCHAR(50), SpecialEducationTeacherQualificationStatusDescription VARCHAR(200), SpecialEducationTeacherQualificationStatusEdFactsCode VARCHAR(50))

	INSERT INTO #SpecialEducationTeacherQualificationStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #SpecialEducationTeacherQualificationStatus 
	SELECT DISTINCT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SpecialEducationTeacherQualificationStatus'

	IF OBJECT_ID('tempdb..#ParaprofessionalQualificationStatus') IS NOT NULL BEGIN
		DROP TABLE #ParaprofessionalQualificationStatus
	END
	CREATE TABLE #ParaprofessionalQualificationStatus (ParaprofessionalQualificationStatusCode VARCHAR(50), ParaprofessionalQualificationStatusDescription VARCHAR(200), ParaprofessionalQualificationStatusEdFactsCode VARCHAR(50))

	INSERT INTO #ParaprofessionalQualificationStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #ParaprofessionalQualificationStatus 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode 
			WHEN 'Qualified' THEN 'Q'
			WHEN 'NotQualified' THEN 'NQ'
		  END AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ParaprofessionalQualificationStatus'


	INSERT INTO RDS.DimK12StaffStatuses
		(
			  SpecialEducationAgeGroupTaughtCode
			, SpecialEducationAgeGroupTaughtDescription
			, SpecialEducationAgeGroupTaughtEdFactsCode
			, EdFactsCertificationStatusCode
			, EdFactsCertificationStatusDescription
			, EdFactsCertificationStatusEdFactsCode
			, HighlyQualifiedTeacherIndicatorCode
			, HighlyQualifiedTeacherIndicatorDescription
			, HighlyQualifiedTeacherIndicatorEdFactsCode
			, EdFactsTeacherInexperiencedStatusCode
			, EdFactsTeacherInexperiencedStatusDescription
			, EdFactsTeacherInexperiencedStatusEdFactsCode
			, TeachingCredentialTypeCode
			, TeachingCredentialTypeDescription
			, TeachingCredentialTypeEdFactsCode
			, EdFactsTeacherOutOfFieldStatusCode
			, EdFactsTeacherOutOfFieldStatusDescription
			, EdFactsTeacherOutOfFieldStatusEdFactsCode
			, SpecialEducationTeacherQualificationStatusCode
			, SpecialEducationTeacherQualificationStatusDescription
			, SpecialEducationTeacherQualificationStatusEdFactsCode
			, ParaprofessionalQualificationStatusCode
			, ParaprofessionalQualificationStatusDescription
			, ParaprofessionalQualificationStatusEdFactsCode
	)
	SELECT 
		  seagt.SpecialEducationAgeGroupTaughtCode 
		, seagt.SpecialEducationAgeGroupTaughtDescription
		, seagt.SpecialEducationAgeGroupTaughtEdFactsCode
		, efcs.EdFactsCertificationStatusCode
		, efcs.EdFactsCertificationStatusDescription
		, efcs.EdFactsCertificationStatusEdFactsCode
		, hqti.HighlyQualifiedTeacherIndicatorCode
		, hqti.HighlyQualifiedTeacherIndicatorDescription
		, hqti.HighlyQualifiedTeacherIndicatorEdFactsCode
		, dftis.EdFactsTeacherInexperiencedStatusCode
		, dftis.EdFactsTeacherInexperiencedStatusDescription
		, dftis.EdFactsTeacherInexperiencedStatusEdFactsCode
		, tct.TeachingCredentialTypeCode
		, tct.TeachingCredentialTypeDescription
		, tct.TeachingCredentialTypeEdFactsCode
		, eftoofs.EdFactsTeacherOutOfFieldStatusCode
		, eftoofs.EdFactsTeacherOutOfFieldStatusDescription
		, eftoofs.EdFactsTeacherOutOfFieldStatusEdFactsCode
		, setqs.SpecialEducationTeacherQualificationStatusCode
		, setqs.SpecialEducationTeacherQualificationStatusDescription
		, setqs.SpecialEducationTeacherQualificationStatusEdFactsCode	
		, pqs.ParaprofessionalQualificationStatusCode
		, pqs.ParaprofessionalQualificationStatusDescription
		, pqs.ParaprofessionalQualificationStatusEdFactsCode
	FROM #SpecialEducationAgeGroupTaught seagt
	CROSS JOIN #EdFactsCertificationStatus efcs
	CROSS JOIN #HighlyQualifiedTeacherIndicator hqti
	CROSS JOIN #EdFactsTeacherInexperiencedStatus dftis
	CROSS JOIN #TeachingCredentialType tct
	CROSS JOIN #EdFactsTeacherOutOfFieldStatus eftoofs
	CROSS JOIN #SpecialEducationTeacherQualificationStatus setqs
	CROSS JOIN #ParaprofessionalQualificationStatus pqs
	LEFT JOIN rds.DimK12StaffStatuses main
		ON seagt.SpecialEducationAgeGroupTaughtCode = main.SpecialEducationAgeGroupTaughtCode
		AND efcs.EdFactsCertificationStatusCode = main.EdFactsCertificationStatusCode
		AND hqti.HighlyQualifiedTeacherIndicatorCode = main.HighlyQualifiedTeacherIndicatorCode
		AND dftis.EdFactsTeacherInexperiencedStatusCode = main.EdFactsTeacherInexperiencedStatusCode
		AND tct.TeachingCredentialTypeCode = main.TeachingCredentialTypeCode
		AND eftoofs.EdFactsTeacherOutOfFieldStatusCode = main.EdFactsTeacherOutOfFieldStatusCode
		AND setqs.SpecialEducationTeacherQualificationStatusCode = main.SpecialEducationTeacherQualificationStatusCode
		AND pqs.ParaprofessionalQualificationStatusCode = main.ParaprofessionalQualificationStatusCode
	WHERE main.DimK12StaffStatusId IS NULL

	DROP TABLE #SpecialEducationAgeGroupTaught
	DROP TABLE #EdFactsCertificationStatus
	DROP TABLE #HighlyQualifiedTeacherIndicator
	DROP TABLE #EdFactsTeacherInexperiencedStatus
	DROP TABLE #TeachingCredentialType
	DROP TABLE #EdFactsTeacherOutOfFieldStatus
	DROP TABLE #SpecialEducationTeacherQualificationStatus
	DROP TABLE #ParaprofessionalQualificationStatus
	------------------------------------------------
	-- Populate DimNOrDStatuses			 ---
	------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimNOrDStatuses 
			WHERE NeglectedOrDelinquentProgramTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimNOrDStatuses ON

		INSERT INTO RDS.DimNOrDStatuses (
			  DimNOrDStatusId
			, NeglectedOrDelinquentProgramTypeCode
			, NeglectedOrDelinquentProgramTypeDescription
			, NeglectedOrDelinquentProgramTypeEdFactsCode)
		VALUES (-1, 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimNOrDStatuses OFF
	END

	CREATE TABLE #NeglectedOrDelinquentProgramType (NeglectedOrDelinquentProgramTypeCode VARCHAR(50), NeglectedOrDelinquentProgramTypeDescription VARCHAR(200), NeglectedOrDelinquentProgramTypeEdFactsCode VARCHAR(50))

	INSERT INTO #NeglectedOrDelinquentProgramType VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #NeglectedOrDelinquentProgramType
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'AdultCorrection' THEN 'ADLTCORR'
			WHEN 'AtRiskPrograms' THEN 'ATRISK'
			WHEN 'JuvenileCorrection' THEN 'JUVCORR'
			WHEN 'JuvenileDetention' THEN 'JUVDET'
			WHEN 'NeglectedPrograms' THEN 'NEGLECT'
			WHEN 'OtherPrograms' THEN 'OTHER'
		  END
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'NeglectedOrDelinquentProgramType'

	   
	INSERT INTO RDS.DimNOrDStatuses
		(
			  NeglectedOrDelinquentProgramTypeCode
			, NeglectedOrDelinquentProgramTypeDescription
			, NeglectedOrDelinquentProgramTypeEdFactsCode
		)
	SELECT 
		  nodpt.NeglectedOrDelinquentProgramTypeCode
		, nodpt.NeglectedOrDelinquentProgramTypeDescription
		, nodpt.NeglectedOrDelinquentProgramTypeEdFactsCode
	FROM #NeglectedOrDelinquentProgramType nodpt
	LEFT JOIN rds.DimNOrDStatuses main
		ON nodpt.NeglectedOrDelinquentProgramTypeCode = main.NeglectedOrDelinquentProgramTypeCode
	WHERE main.DimNOrDStatusId IS NULL

	DROP TABLE #NeglectedOrDelinquentProgramType


	------------------------------------------------
	-- Populate DimTitleIIIStatuses			 ---
	------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimTitleIIIStatuses 
			WHERE ProgramParticipationTitleIIILiepCode = 'MISSING'
			AND TitleIIIImmigrantParticipationStatusCode = 'MISSING'
			AND ProficiencyStatusCode = 'MISSING'
			AND TitleIIIAccountabilityProgressStatusCode = 'MISSING'
			AND TitleIIILanguageInstructionProgramTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimTitleIIIStatuses ON

		INSERT INTO RDS.DimTitleIIIStatuses (
			  DimTitleIIIStatusId
			, ProgramParticipationTitleIIILiepCode
			, ProgramParticipationTitleIIILiepDescription
			, TitleIIIImmigrantParticipationStatusCode
			, TitleIIIImmigrantParticipationStatusDescription
			, TitleIIIImmigrantParticipationStatusEdFactsCode
			, ProficiencyStatusCode
			, ProficiencyStatusDescription
			, ProficiencyStatusEdFactsCode
			, TitleIIIAccountabilityProgressStatusCode
			, TitleIIIAccountabilityProgressStatusDescription
			, TitleIIIAccountabilityProgressStatusEdFactsCode
			, TitleIIILanguageInstructionProgramTypeCode
			, TitleIIILanguageInstructionProgramTypeDescription
			, TitleIIILanguageInstructionProgramTypeEdFactsCode)
		VALUES (-1, 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimTitleIIIStatuses OFF
	END

	IF OBJECT_ID('tempdb..#ProgramParticipationTitleIIILiep') IS NOT NULL BEGIN
		DROP TABLE #ProgramParticipationTitleIIILiep
	END

	CREATE TABLE #ProgramParticipationTitleIIILiep (ProgramParticipationTitleIIILiepCode VARCHAR(50), ProgramParticipationTitleIIILiepDescription VARCHAR(200))

	INSERT INTO #ProgramParticipationTitleIIILiep VALUES ('MISSING', 'MISSING')
	INSERT INTO #ProgramParticipationTitleIIILiep 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = ''

	IF OBJECT_ID('tempdb..#TitleIIIImmigrantParticipationStatus') IS NOT NULL BEGIN
		DROP TABLE #TitleIIIImmigrantParticipationStatus
	END

	CREATE TABLE #TitleIIIImmigrantParticipationStatus (TitleIIIImmigrantParticipationStatusCode VARCHAR(50), TitleIIIImmigrantParticipationStatusDescription VARCHAR(200), TitleIIIImmigrantParticipationStatusEdFactsCode VARCHAR(50))

	INSERT INTO #TitleIIIImmigrantParticipationStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #TitleIIIImmigrantParticipationStatus
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'Yes' THEN 'IMMIGNTTTLIII'
			WHEN 'No' THEN 'NONIMMIGNTTTLIII'
			ELSE 'MISSING'
		  END 
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TitleIIIImmigrantParticipationStatus'

	IF OBJECT_ID('tempdb..#ProficiencyStatus') IS NOT NULL BEGIN
		DROP TABLE #ProficiencyStatus
	END

	CREATE TABLE #ProficiencyStatus (ProficiencyStatusCode VARCHAR(50), ProficiencyStatusDescription VARCHAR(200), ProficiencyStatusEdFactsCode VARCHAR(50))

	INSERT INTO #ProficiencyStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #ProficiencyStatus
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, UPPER(CedsOptionSetCode) AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ProficiencyStatus'

	IF OBJECT_ID('tempdb..#TitleIIIAccountabilityProgressStatus') IS NOT NULL BEGIN
		DROP TABLE #TitleIIIAccountabilityProgressStatus
	END

	CREATE TABLE #TitleIIIAccountabilityProgressStatus (TitleIIIAccountabilityProgressStatusCode VARCHAR(50), TitleIIIAccountabilityProgressStatusDescription VARCHAR(200), TitleIIIAccountabilityProgressStatusEdFactsCode VARCHAR(50))

	INSERT INTO #TitleIIIAccountabilityProgressStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #TitleIIIAccountabilityProgressStatus
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TitleIIIAccountabilityProgressStatus'

	IF OBJECT_ID('tempdb..#TitleIIILanguageInstructionProgramType') IS NOT NULL BEGIN
		DROP TABLE #TitleIIILanguageInstructionProgramType
	END

	CREATE TABLE #TitleIIILanguageInstructionProgramType (TitleIIILanguageInstructionProgramTypeCode VARCHAR(50), TitleIIILanguageInstructionProgramTypeDescription VARCHAR(200), TitleIIILanguageInstructionProgramTypeEdFactsCode VARCHAR(50))

	INSERT INTO #TitleIIILanguageInstructionProgramType VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #TitleIIILanguageInstructionProgramType
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'ContentBasedESL' THEN 'LNGPRGESLSUPP'
			WHEN 'DualLanguage' THEN 'LNGPRGDU'
			WHEN 'NewcomerPrograms' THEN 'LNGPRGNEW'
			WHEN 'Other' THEN 'LNGPRGOTH'
			WHEN 'PullOutESL' THEN 'LNGPRGESLELD'
			WHEN 'TransitionalBilingual' THEN 'LNGPRGBI'
			WHEN 'TwoWayImmersion' THEN 'LNGPRGDU'
			ELSE 'MISSING'
		  END
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TitleIIILanguageInstructionProgramType'

	   
	INSERT INTO RDS.DimTitleIIIStatuses
		(
			  ProgramParticipationTitleIIILiepCode
			, ProgramParticipationTitleIIILiepDescription
			, TitleIIIImmigrantParticipationStatusCode
			, TitleIIIImmigrantParticipationStatusDescription
			, TitleIIIImmigrantParticipationStatusEdFactsCode
			, ProficiencyStatusCode
			, ProficiencyStatusDescription
			, ProficiencyStatusEdFactsCode
			, TitleIIIAccountabilityProgressStatusCode
			, TitleIIIAccountabilityProgressStatusDescription
			, TitleIIIAccountabilityProgressStatusEdFactsCode
			, TitleIIILanguageInstructionProgramTypeCode
			, TitleIIILanguageInstructionProgramTypeDescription
			, TitleIIILanguageInstructionProgramTypeEdFactsCode		)
	SELECT 
			  ppt.ProgramParticipationTitleIIILiepCode
			, ppt.ProgramParticipationTitleIIILiepDescription
			, tips.TitleIIIImmigrantParticipationStatusCode
			, tips.TitleIIIImmigrantParticipationStatusDescription
			, tips.TitleIIIImmigrantParticipationStatusEdFactsCode
			, ps.ProficiencyStatusCode
			, ps.ProficiencyStatusDescription
			, ps.ProficiencyStatusEdFactsCode
			, taps.TitleIIIAccountabilityProgressStatusCode
			, taps.TitleIIIAccountabilityProgressStatusDescription
			, taps.TitleIIIAccountabilityProgressStatusEdFactsCode
			, tlip.TitleIIILanguageInstructionProgramTypeCode
			, tlip.TitleIIILanguageInstructionProgramTypeDescription
			, tlip.TitleIIILanguageInstructionProgramTypeEdFactsCode		
	FROM #ProgramParticipationTitleIIILiep ppt
	CROSS JOIN #TitleIIIImmigrantParticipationStatus tips
	CROSS JOIN #ProficiencyStatus ps
	CROSS JOIN #TitleIIIAccountabilityProgressStatus taps
	CROSS JOIN #TitleIIILanguageInstructionProgramType tlip
	LEFT JOIN rds.DimTitleIIIStatuses main
		ON ppt.ProgramParticipationTitleIIILiepCode = main.ProgramParticipationTitleIIILiepCode
		AND tips.TitleIIIImmigrantParticipationStatusCode = main.TitleIIIImmigrantParticipationStatusCode
		AND ps.ProficiencyStatusCode = main.ProficiencyStatusCode
		AND taps.TitleIIIAccountabilityProgressStatusCode = main.TitleIIIAccountabilityProgressStatusCode
		AND tlip.TitleIIILanguageInstructionProgramTypeCode = main.TitleIIILanguageInstructionProgramTypeCode
	WHERE main.DimTitleIIIStatusId IS NULL

	DROP TABLE #ProgramParticipationTitleIIILiep
	DROP TABLE #TitleIIIImmigrantParticipationStatus
	DROP TABLE #ProficiencyStatus
	DROP TABLE #TitleIIIAccountabilityProgressStatus
	DROP TABLE #TitleIIILanguageInstructionProgramType

	-----------------------------------------------------
	-- Populate DimAttendances                     --
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAttendances d WHERE d.DimAttendanceId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimAttendances ON

		INSERT INTO [RDS].[DimAttendances]
           ([DimAttendanceId]
           ,[AbsenteeismCode]
           ,[AbsenteeismDescription]
		   ,[AbsenteeismEdFactsCode]
		   )
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimAttendances OFF

	END


		CREATE TABLE #AbsenteeismCode (AbsenteeismCode VARCHAR(50), AbsenteeismDescription VARCHAR(200), AbsenteeismEdFactsCode VARCHAR(50))

		INSERT INTO #AbsenteeismCode VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #AbsenteeismCode 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AbsenteeismCode'


		INSERT INTO [RDS].[DimAttendances]
           ([AbsenteeismCode]
           ,[AbsenteeismDescription]
		   ,[AbsenteeismEdFactsCode]
		   )
		SELECT DISTINCT
			  h.AbsenteeismCode
			, h.AbsenteeismDescription
			, h.AbsenteeismEdFactsCode
		FROM #AbsenteeismCode h
		LEFT JOIN rds.DimAttendances main
			ON  h.AbsenteeismCode = main.AbsenteeismCode
		WHERE main.DimAttendanceId IS NULL

	DROP TABLE #AbsenteeismCode

	------------------------------------------------
	-- Populate DimCteStatuses			 ---
	------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimCteStatuses 
			WHERE CteAeDisplacedHomemakerIndicatorCode = 'MISSING'
			AND CteNontraditionalGenderStatusCode = 'MISSING'
			AND CteNontraditionalCompletionCode = 'MISSING'
			AND SingleParentOrSinglePregnantWomanStatusCode = 'MISSING'
			AND CteGraduationRateInclusionCode = 'MISSING'
			AND CteParticipantCode = 'MISSING'
			AND CteConcentratorCode = 'MISSING') 
	BEGIN
		SET IDENTITY_INSERT RDS.DimCteStatuses ON

		INSERT INTO RDS.DimCteStatuses (
			  DimCteStatusId
			, CteAeDisplacedHomemakerIndicatorCode
			, CteAeDisplacedHomemakerIndicatorDescription
			, CteAeDisplacedHomemakerIndicatorEdFactsCode
			, CteNontraditionalGenderStatusCode
			, CteNontraditionalGenderStatusDescription
			, CteNontraditionalGenderStatusEdFactsCode
			, CteNontraditionalCompletionCode
			, CteNontraditionalCompletionDescription
			, CteNontraditionalCompletionEdFactsCode
			, SingleParentOrSinglePregnantWomanStatusCode
			, SingleParentOrSinglePregnantWomanStatusDescription
			, SingleParentOrSinglePregnantWomanStatusEdFactsCode
			, CteGraduationRateInclusionCode
			, CteGraduationRateInclusionDescription
			, CteGraduationRateInclusionEdFactsCode
			, CteParticipantCode
			, CteParticipantDescription
			, CteParticipantEdFactsCode
			, CteConcentratorCode
			, CteConcentratorDescription
			, CteConcentratorEdFactsCode)
		VALUES (-1, 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimCteStatuses OFF
	END

	IF OBJECT_ID('tempdb..#CteAeDisplacedHomemakerIndicator') IS NOT NULL BEGIN
		DROP TABLE #CteAeDisplacedHomemakerIndicator
	END

	CREATE TABLE #CteAeDisplacedHomemakerIndicator (CteAeDisplacedHomemakerIndicatorCode VARCHAR(50), CteAeDisplacedHomemakerIndicatorDescription VARCHAR(200), CteAeDisplacedHomemakerIndicatorEdFactsCode VARCHAR(50))

	INSERT INTO #CteAeDisplacedHomemakerIndicator VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #CteAeDisplacedHomemakerIndicator 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode	
			WHEN 'Yes' THEN 'DH'
			ELSE 'MISSING'
		  END
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CteAeDisplacedHomemakerIndicator'

	IF OBJECT_ID('tempdb..#CteNontraditionalGenderStatus') IS NOT NULL BEGIN
		DROP TABLE #CteNontraditionalGenderStatus
	END

	CREATE TABLE #CteNontraditionalGenderStatus (CteNontraditionalGenderStatusCode VARCHAR(50), CteNontraditionalGenderStatusDescription VARCHAR(200), CteNontraditionalGenderStatusEdFactsCode VARCHAR(50))

	INSERT INTO #CteNontraditionalGenderStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #CteNontraditionalGenderStatus
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'NotUnderrepresented' THEN 'NM'
			WHEN 'Underrepresented' THEN 'MEM'
			ELSE 'MISSING'
		  END 
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CteNontraditionalGenderStatus'

	IF OBJECT_ID('tempdb..#CteNontraditionalCompletion') IS NOT NULL BEGIN
		DROP TABLE #CteNontraditionalCompletion
	END

	CREATE TABLE #CteNontraditionalCompletion (CteNontraditionalCompletionCode VARCHAR(50), CteNontraditionalCompletionDescription VARCHAR(200), CteNontraditionalCompletionEdFactsCode VARCHAR(50))

	INSERT INTO #CteNontraditionalCompletion VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #CteNontraditionalCompletion
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'No' THEN 'NM'
			WHEN 'Yes' THEN 'MEM'
			ELSE 'MISSING'
		  END 
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CteNontraditionalCompletion'

	IF OBJECT_ID('tempdb..#SingleParentOrSinglePregnantWomanStatus') IS NOT NULL BEGIN
		DROP TABLE #SingleParentOrSinglePregnantWomanStatus
	END

	CREATE TABLE #SingleParentOrSinglePregnantWomanStatus (SingleParentOrSinglePregnantWomanStatusCode VARCHAR(50), SingleParentOrSinglePregnantWomanStatusDescription VARCHAR(200), SingleParentOrSinglePregnantWomanStatusEdFactsCode VARCHAR(50))

	INSERT INTO #SingleParentOrSinglePregnantWomanStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #SingleParentOrSinglePregnantWomanStatus
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'Yes' THEN 'SPPT'
			ELSE 'MISSING'
		  END
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SingleParentOrSinglePregnantWomanStatus'

	IF OBJECT_ID('tempdb..#CteGraduationRateInclusion') IS NOT NULL BEGIN
		DROP TABLE #CteGraduationRateInclusion
	END

	CREATE TABLE #CteGraduationRateInclusion (CteGraduationRateInclusionCode VARCHAR(50), CteGraduationRateInclusionDescription VARCHAR(200), CteGraduationRateInclusionEdFactsCode VARCHAR(50))

	INSERT INTO #CteGraduationRateInclusion VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #CteGraduationRateInclusion
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'IncludedAsGraduated' THEN 'GRAD'
			WHEN 'NotIncludedAsGraduated' THEN 'NOTG'
			ELSE 'MISSING'
		  END
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CteGraduationRateInclusion'

	IF OBJECT_ID('tempdb..#CteParticipant') IS NOT NULL BEGIN
		DROP TABLE #CteParticipant
	END

	CREATE TABLE #CteParticipant (CteParticipantCode VARCHAR(50), CteParticipantDescription VARCHAR(200), CteParticipantEdFactsCode VARCHAR(50))

	INSERT INTO #CteParticipant VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #CteParticipant
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'Yes' THEN 'CTEPART'
			WHEN 'No' THEN 'NONCTEPART'
			ELSE 'MISSING'
		  END
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CteParticipant' 

	IF OBJECT_ID('tempdb..#CteConcentrator') IS NOT NULL BEGIN
		DROP TABLE #CteConcentrator
	END

	CREATE TABLE #CteConcentrator (CteConcentratorCode VARCHAR(50), CteConcentratorDescription VARCHAR(200), CteConcentratorEdFactsCode VARCHAR(50))

	INSERT INTO #CteConcentrator VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #CteConcentrator
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'Yes' THEN 'CTEPART'
			WHEN 'No' THEN 'NONCTEPART'
			ELSE 'MISSING'
		  END
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CteConcentrator'

	   
	INSERT INTO RDS.DimCteStatuses
		(
			  CteAeDisplacedHomemakerIndicatorCode
			, CteAeDisplacedHomemakerIndicatorDescription
			, CteAeDisplacedHomemakerIndicatorEdFactsCode
			, CteNontraditionalGenderStatusCode
			, CteNontraditionalGenderStatusDescription
			, CteNontraditionalGenderStatusEdFactsCode
			, CteNontraditionalCompletionCode
			, CteNontraditionalCompletionDescription
			, CteNontraditionalCompletionEdFactsCode
			, SingleParentOrSinglePregnantWomanStatusCode
			, SingleParentOrSinglePregnantWomanStatusDescription
			, SingleParentOrSinglePregnantWomanStatusEdFactsCode
			, CteGraduationRateInclusionCode
			, CteGraduationRateInclusionDescription
			, CteGraduationRateInclusionEdFactsCode
			, CteParticipantCode
			, CteParticipantDescription
			, CteParticipantEdFactsCode
			, CteConcentratorCode
			, CteConcentratorDescription
			, CteConcentratorEdFactsCode
		)
	SELECT 
			  cadhi.CteAeDisplacedHomemakerIndicatorCode
			, cadhi.CteAeDisplacedHomemakerIndicatorDescription
			, cadhi.CteAeDisplacedHomemakerIndicatorEdFactsCode
			, cngs.CteNontraditionalGenderStatusCode
			, cngs.CteNontraditionalGenderStatusDescription
			, cngs.CteNontraditionalGenderStatusEdFactsCode
			, cnc.CteNontraditionalCompletionCode
			, cnc.CteNontraditionalCompletionDescription
			, cnc.CteNontraditionalCompletionEdFactsCode
			, spospws.SingleParentOrSinglePregnantWomanStatusCode
			, spospws.SingleParentOrSinglePregnantWomanStatusDescription
			, spospws.SingleParentOrSinglePregnantWomanStatusEdFactsCode
			, cgri.CteGraduationRateInclusionCode
			, cgri.CteGraduationRateInclusionDescription
			, cgri.CteGraduationRateInclusionEdFactsCode
			, cp.CteParticipantCode
			, cp.CteParticipantDescription
			, cp.CteParticipantEdFactsCode
			, cc.CteConcentratorCode
			, cc.CteConcentratorDescription
			, cc.CteConcentratorEdFactsCode
	FROM #CteAeDisplacedHomemakerIndicator cadhi
	CROSS JOIN #CteNontraditionalGenderStatus cngs
	CROSS JOIN #CteNontraditionalCompletion cnc
	CROSS JOIN #SingleParentOrSinglePregnantWomanStatus spospws
	CROSS JOIN #CteGraduationRateInclusion cgri
	CROSS JOIN #CteParticipant cp
	CROSS JOIN #CteConcentrator cc
	LEFT JOIN rds.DimCteStatuses main
		ON cadhi.CteAeDisplacedHomemakerIndicatorCode = main.CteAeDisplacedHomemakerIndicatorCode
		AND cngs.CteNontraditionalGenderStatusCode = main.CteNontraditionalGenderStatusCode
		AND cnc.CteNontraditionalCompletionCode = main.CteNontraditionalCompletionCode
		AND spospws.SingleParentOrSinglePregnantWomanStatusCode = main.SingleParentOrSinglePregnantWomanStatusCode
		AND cgri.CteGraduationRateInclusionCode = main.CteGraduationRateInclusionCode
		AND cp.CteParticipantCode = main.CteParticipantCode
		AND cc.CteConcentratorCode = main.CteConcentratorCode
	WHERE main.DimCteStatusId IS NULL

	DROP TABLE #CteAeDisplacedHomemakerIndicator
	DROP TABLE #CteNontraditionalGenderStatus
	DROP TABLE #CteNontraditionalCompletion
	DROP TABLE #SingleParentOrSinglePregnantWomanStatus
	DROP TABLE #CteGraduationRateInclusion
	DROP TABLE #CteParticipant
	DROP TABLE #CteConcentrator


	-- Create MISSING record 
	IF NOT EXISTS (SELECT 1 FROM RDS.DimLanguages WHERE DimLanguageId = -1) BEGIN 
		SET IDENTITY_INSERT RDS.DimLanguages ON;
		INSERT INTO RDS.DimLanguages (DimLanguageId) VALUES (-1)
		SET IDENTITY_INSERT RDS.DimLanguages OFF;  
	END

	Insert Into rds.DimLanguages
	(
		Iso6392LanguageCodeCode
		,Iso6392LanguageCodeDescription
		,Iso6392LanguageCodeEdFactsCode
		,Iso6393LanguageCodeCode
		,Iso6393LanguageCodeDescription
	)
	Select 
		iso2.CedsOptionSetCode as Iso6392LanguageCodeCode, 
		iso2.CedsOptionSetDescription as Iso6392LanguageCodeDescription, 
		iso2.CedsOptionSetCode as Iso6392LanguageCodeEdFactsCode,
		iso3.CedsOptionSetCode as Iso6393LanguageCodeCode, 
		iso3.CedsOptionSetDescription as Iso6393LanguageCodeDescription
	From CEDS.CedsOptionSetMapping iso2
		full outer join CEDS.CedsOptionSetMapping iso3
			on iso2.CedsOptionSetCode = iso3.CedsOptionSetCode
		left outer join rds.DimLanguages dl
			on isnull(dl.Iso6392LanguageCodeCode,'') = isnull(iso2.CedsOptionSetCode,'')
				and isnull(dl.Iso6393LanguageCodeCode,'') = isnull(iso3.CedsOptionSetCode,'')
	Where iso2.CedsGlobalId = '000317'
		and iso3.CedsGlobalId = '001637'
		and dl.DimLanguageId is null



	------------------------------------------------
	-- Populate DimComprehensiveAndTargetedSupports			 ---
	------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimComprehensiveAndTargetedSupports
			WHERE AdditionalTargetedSupportAndImprovementStatusCode = 'MISSING'
			AND ComprehensiveSupportAndImprovementStatusCode = 'MISSING'
			AND TargetedSupportAndImprovementStatusCode = 'MISSING') 
	BEGIN
		SET IDENTITY_INSERT RDS.DimComprehensiveAndTargetedSupports ON

		INSERT INTO RDS.DimComprehensiveAndTargetedSupports (
			  DimComprehensiveAndTargetedSupportId
			, AdditionalTargetedSupportAndImprovementStatusCode
			, AdditionalTargetedSupportAndImprovementStatusDescription
			, AdditionalTargetedSupportAndImprovementStatusEDFactsCode
			, ComprehensiveSupportAndImprovementStatusCode
			, ComprehensiveSupportAndImprovementStatusDescription
			, ComprehensiveSupportAndImprovementStatusEdFactsCode
			, TargetedSupportAndImprovementStatusCode
			, TargetedSupportAndImprovementStatusDescription
			, TargetedSupportAndImprovementStatusEdFactsCode
			)

		VALUES (-1, 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimComprehensiveAndTargetedSupports OFF
	END

	IF OBJECT_ID('tempdb..#AdditionalTargetedSupportAndImprovementStatus') IS NOT NULL BEGIN
		DROP TABLE #AdditionalTargetedSupportAndImprovementStatus
	END

	CREATE TABLE #AdditionalTargetedSupportAndImprovementStatus (AdditionalTargetedSupportAndImprovementStatusCode VARCHAR(50), AdditionalTargetedSupportAndImprovementStatusDescription VARCHAR(200), AdditionalTargetedSupportAndImprovementStatusEdFactsCode VARCHAR(50))

	INSERT INTO #AdditionalTargetedSupportAndImprovementStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #AdditionalTargetedSupportAndImprovementStatus 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AdditionalTargetedSupportAndImprovementStatus'



	IF OBJECT_ID('tempdb..#ComprehensiveSupportAndImprovementStatus') IS NOT NULL BEGIN
		DROP TABLE #ComprehensiveSupportAndImprovementStatus
	END

	CREATE TABLE #ComprehensiveSupportAndImprovementStatus (ComprehensiveSupportAndImprovementStatusCode VARCHAR(50), ComprehensiveSupportAndImprovementStatusDescription VARCHAR(200), ComprehensiveSupportAndImprovementStatusEdFactsCode VARCHAR(50))

	INSERT INTO #ComprehensiveSupportAndImprovementStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #ComprehensiveSupportAndImprovementStatus 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ComprehensiveSupportAndImprovementStatus'



	IF OBJECT_ID('tempdb..#TargetedSupportAndImprovementStatus') IS NOT NULL BEGIN
		DROP TABLE #TargetedSupportAndImprovementStatus
	END

	CREATE TABLE #TargetedSupportAndImprovementStatus (TargetedSupportAndImprovementStatusCode VARCHAR(50), TargetedSupportAndImprovementStatusDescription VARCHAR(200), TargetedSupportAndImprovementStatusEdFactsCode VARCHAR(50))

	INSERT INTO #TargetedSupportAndImprovementStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #TargetedSupportAndImprovementStatus 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TargetedSupportAndImprovementStatus'

   
	INSERT INTO RDS.DimComprehensiveAndTargetedSupports
		(
			  AdditionalTargetedSupportAndImprovementStatusCode
			, AdditionalTargetedSupportAndImprovementStatusDescription
			, AdditionalTargetedSupportAndImprovementStatusEDFactsCode
			, ComprehensiveSupportAndImprovementStatusCode
			, ComprehensiveSupportAndImprovementStatusDescription
			, ComprehensiveSupportAndImprovementStatusEdFactsCode
			, TargetedSupportAndImprovementStatusCode
			, TargetedSupportAndImprovementStatusDescription
			, TargetedSupportAndImprovementStatusEdFactsCode
		)
	SELECT 
			  atsais.AdditionalTargetedSupportAndImprovementStatusCode
			, atsais.AdditionalTargetedSupportAndImprovementStatusDescription
			, atsais.AdditionalTargetedSupportAndImprovementStatusEDFactsCode
			, csais.ComprehensiveSupportAndImprovementStatusCode
			, csais.ComprehensiveSupportAndImprovementStatusDescription
			, csais.ComprehensiveSupportAndImprovementStatusEdFactsCode
			, tsais.TargetedSupportAndImprovementStatusCode
			, tsais.TargetedSupportAndImprovementStatusDescription
			, tsais.TargetedSupportAndImprovementStatusEdFactsCode
	FROM #AdditionalTargetedSupportAndImprovementStatus atsais
	CROSS JOIN #ComprehensiveSupportAndImprovementStatus csais
	CROSS JOIN #TargetedSupportAndImprovementStatus tsais
	LEFT JOIN rds.DimComprehensiveAndTargetedSupports main
		ON atsais.AdditionalTargetedSupportAndImprovementStatusCode = main.AdditionalTargetedSupportAndImprovementStatusCode
		AND csais.ComprehensiveSupportAndImprovementStatusCode = main.ComprehensiveSupportAndImprovementStatusCode
		AND tsais.TargetedSupportAndImprovementStatusCode = main.TargetedSupportAndImprovementStatusCode
	WHERE main.DimComprehensiveAndTargetedSupportId IS NULL

	DROP TABLE #AdditionalTargetedSupportAndImprovementStatus
	DROP TABLE #ComprehensiveSupportAndImprovementStatus
	DROP TABLE #TargetedSupportAndImprovementStatus
	
	-- ------------------------------------------------
	-- -- Populate DimCharterSchoolStatuses			 ---
	-- ------------------------------------------------
	-- IF NOT EXISTS (SELECT 1 FROM RDS.DimCharterSchoolStatuses WHERE AppropriationMethodCode = 'MISSING')
	-- BEGIN
	-- 	SET IDENTITY_INSERT RDS.DimComprehensiveAndTargetedSupports ON

	-- 	INSERT INTO RDS.DimCharterSchoolStatuses (
	-- 		  DimComprehensiveAndTargetedSupportId
	-- 		, AppropriationMethodCode
	-- 		, AppropriationMethodDescription
	-- 		, AppropriationMethodEDFactsCode
	-- 		)

	-- 	VALUES (-1, 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING')

	-- 	SET IDENTITY_INSERT RDS.DimCharterSchoolStatuses OFF
	-- END

	-- IF OBJECT_ID('tempdb..#AppropriationMethod') IS NOT NULL BEGIN
	-- 	DROP TABLE #AppropriationMethod
	-- END
	-- CREATE TABLE #AppropriationMethod (AppropriationMethodCode VARCHAR(50), AppropriationMethodDescription VARCHAR(200), AppropriationMethodEdFactsCode VARCHAR(50))

	-- INSERT INTO #AppropriationMethod VALUES ('MISSING', 'MISSING', 'MISSING')
	-- INSERT INTO #AppropriationMethod 
	-- SELECT
	-- 	  CedsOptionSetCode
	-- 	, CedsOptionSetDescription
	-- 	, CedsOptionSetCode
	-- FROM CEDS.CedsOptionSetMapping
	-- WHERE CedsElementTechnicalName = 'AppropriationMethod'

   
	-- INSERT INTO RDS.DimCharterSchoolStatuses
	-- 	(
	-- 		  AppropriationMethodCode
	-- 		, AppropriationMethodDescription
	-- 		, AppropriationMethodEDFactsCode
	-- 	)
	-- SELECT 
	-- 		  atsais.AppropriationMethodCode
	-- 		, atsais.AppropriationMethodDescription
	-- 		, atsais.AppropriationMethodEDFactsCode
	-- FROM #AppropriationMethod atsais
	-- LEFT JOIN rds.DimCharterSchoolStatuses main
	-- 	ON atsais.AppropriationMethodCode = main.AppropriationMethodCode
	-- WHERE main.DimComprehensiveAndTargetedSupportId IS NULL

	-- DROP TABLE #AppropriationMethod
	
	------------------------------------------------
	-- Populate DimFactTypes					 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimFactTypes d WHERE d.DimFactTypeId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimFactTypes ON


	INSERT INTO [RDS].[DimFactTypes]
           ([DimFactTypeId]
		   ,[FactTypeCode]
           ,[FactTypeDescription])
			VALUES (-1, 'NA', 'NotApplicable')
				,('1',	'datapopulation',	'Generate Data Population Summary')
				,('2',	'submission',	'EDFacts Submission Reports')
				,('3',	'childcount',	'EDFacs Child Count')
				,('4',	'specedexit',	'EDFacts Exit from Special Education')
				,('5',	'cte',	'EDFacts ECareer and Technical Education')
				,('6',	'membership',	'EDFacts EMemebership')
				,('7',	'dropout',	'EDFacts EDropout')
				,('8',	'grad',	'EDFacts EGraduation/Completer')
				,('9',	'titleIIIELOct',	'EDFacts ETitle III EL Students')
				,('10',	'titleIIIELSY',	'EDFacts ETitle III EL Students')
				,('11',	'sppapr',	'EDFacts ESPP APR Students')
				,('12',	'titleI',	'EDFacts ETitle I Students')
				,('13',	'mep',	'EDFacts EMEP Students')
				,('14',	'immigrant',	'EDFacts EImmigrant Students')
				,('15',	'nord',	'EDFacts EN or D Students')
				,('16',	'homeless',	'EDFacts EHomeless Students')
				,('17',	'chronic',	'EDFacts EChronic Absenteeism')
				,('18',	'gradrate',	'EDFacts EGrad Rate')
				,('19',	'hsgradenroll',	'EDFacts EHS Grad PS Enrollment')
				,('20',	'other',	'Generate Other Reports like State defined reports')
				,('21',	'directory',	'EDFacts EDirectory related reports')
				,('22',	'organizationstatus',	'EDFacts EOrganization Status related reports')
				,('23',	'compsupport',	'EDFacts EComprehensive Support Identification Type')

		SET IDENTITY_INSERT RDS.DimFactTypes OFF
	END

