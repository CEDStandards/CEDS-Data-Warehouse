/*    
	Copyright 2023 Common Education Data Standards
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
    Version 11.0.0.0
	CEDS Junk Table Dimension Population Script
	  
    This script populates multiple Junk Dimension tables in the CEDS Data Warehouse
	version 11.0.0.0. It does not populate all of the tables. Additional work continues in
	Open Source Community to fully populate all of the Junk Dimension tables.

	Script 3 of 3
	To create the CEDS Data Warehouse including population of the dimension tables, the following 3 scripts are needed:

	Script 1: CEDS-Data-Warehouse-V11-0-0-0
	Script 2: CEDS-Elements-V11.0.0.0 (https://github.com/CEDStandards/CEDS-Elements/blob/master/src/CEDS-Elements-V11.0.0.0.sql)
	Script 3: Junk-Table-Dimension-Population-V11.0.0.0

	You must have the CEDS Data Warehouse version 11.0.0.0 installed first as well as
	the CEDS version 11.0.0.0 elements database. The CEDS schema tables house the element and option set information.
	These eight tables act as a source for the junk table dimension population.
      
    Questions on this script can be sent to https://ceds.ed.gov/ContactUs.aspx
      
    More information on the data model is available at the CEDS website:  
    http://ceds.ed.gov.
*/    

USE [CEDS-Data-Warehouse-V11-0-0-0]
GO

	SET NOCOUNT ON;

	PRINT 'Populate DimAeDemgraphics'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'HomelessnessStatus'

	IF OBJECT_ID('tempdb..#EnglishLearnerStatus') IS NOT NULL
		DROP TABLE #EnglishLearnerStatus

	CREATE TABLE #EnglishLearnerStatus (EnglishLearnerStatusCode VARCHAR(50), EnglishLearnerStatusDescription VARCHAR(200))

	INSERT INTO #EnglishLearnerStatus VALUES ('MISSING', 'MISSING')
	INSERT INTO #EnglishLearnerStatus 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EnglishLearnerStatus'

	IF OBJECT_ID('tempdb..#MigrantStatus') IS NOT NULL
		DROP TABLE #MigrantStatus

	CREATE TABLE #MigrantStatus (MigrantStatusCode VARCHAR(50), MigrantStatusDescription VARCHAR(200))

	INSERT INTO #MigrantStatus VALUES ('MISSING', 'MISSING')
	INSERT INTO #MigrantStatus 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MilitaryConnectedStudentIndicator'

	IF OBJECT_ID('tempdb..#HomelessPrimaryNighttimeResidence') IS NOT NULL
		DROP TABLE #HomelessPrimaryNighttimeResidence

	CREATE TABLE #HomelessPrimaryNighttimeResidence (HomelessPrimaryNighttimeResidenceCode VARCHAR(50), HomelessPrimaryNighttimeResidenceDescription VARCHAR(200))

	INSERT INTO #HomelessPrimaryNighttimeResidence VALUES ('MISSING', 'MISSING')
	INSERT INTO #HomelessPrimaryNighttimeResidence 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'HomelessPrimaryNighttimeResidence'

	IF OBJECT_ID('tempdb..#HomelessUnaccompaniedYouthStatus') IS NOT NULL
		DROP TABLE #HomelessUnaccompaniedYouthStatus

	CREATE TABLE #HomelessUnaccompaniedYouthStatus (HomelessUnaccompaniedYouthStatusCode VARCHAR(50), HomelessUnaccompaniedYouthStatusDescription VARCHAR(200))

	INSERT INTO #HomelessUnaccompaniedYouthStatus VALUES ('MISSING', 'MISSING')
	INSERT INTO #HomelessUnaccompaniedYouthStatus 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'HomelessUnaccompaniedYouthStatus'

	IF OBJECT_ID('tempdb..#Sex') IS NOT NULL
		DROP TABLE #Sex

	CREATE TABLE #Sex (SexCode VARCHAR(50), SexDescription VARCHAR(200))

	INSERT INTO #Sex VALUES ('MISSING', 'MISSING')
	INSERT INTO #Sex 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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


	PRINT 'Populate DimAeProgramTypes'

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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationInstructionalProgramType'

		CREATE TABLE #AeSpecialProgramType (AeSpecialProgramTypeCode VARCHAR(50), AeSpecialProgramTypeDescription VARCHAR(200))

		INSERT INTO #AeSpecialProgramType VALUES ('MISSING', 'MISSING')
		INSERT INTO #AeSpecialProgramType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationSpecialProgramType'

		CREATE TABLE #WioaCareerServiceType (WioaCareerServicesCode VARCHAR(50), WioaCareerServicesDescription VARCHAR(200))

		INSERT INTO #WioaCareerServiceType VALUES ('MISSING', 'MISSING')
		INSERT INTO #WioaCareerServiceType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'WioaCareerServices'

		CREATE TABLE #WioaTrainingServiceType (WioaTrainingServicesCode VARCHAR(50), WioaTrainingServicesDescription VARCHAR(200))

		INSERT INTO #WioaTrainingServiceType VALUES ('MISSING', 'MISSING')
		INSERT INTO #WioaTrainingServiceType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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


	PRINT 'Populate DimAeStudentStatuses'

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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AeFunctioningLevelAtIntake'

		CREATE TABLE #AeFunctioningLevelAtPosttest (AeFunctioningLevelAtPosttestCode VARCHAR(50), AeFunctioningLevelAtPosttestDescription VARCHAR(200))

		INSERT INTO #AeFunctioningLevelAtPosttest VALUES ('MISSING', 'MISSING')
		INSERT INTO #AeFunctioningLevelAtPosttest 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AeFunctioningLevelAtPosttest'

		CREATE TABLE #AePostsecondaryTransitionAction (AePostsecondaryTransitionActionCode VARCHAR(50), AePostsecondaryTransitionActionDescription VARCHAR(200))

		INSERT INTO #AePostsecondaryTransitionAction VALUES ('MISSING', 'MISSING')
		INSERT INTO #AePostsecondaryTransitionAction 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AePostsecondaryTransitionAction'

		CREATE TABLE #EmployedWhileEnrolled (EmployedWhileEnrolledCode VARCHAR(50), EmployedWhileEnrolledDescription VARCHAR(200))

		INSERT INTO #EmployedWhileEnrolled VALUES ('MISSING', 'MISSING')
		INSERT INTO #EmployedWhileEnrolled 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'EmployedWhileEnrolled'

		CREATE TABLE #EmployedAfterExit (EmployedAfterExitCode VARCHAR(50), EmployedAfterExitDescription VARCHAR(200))

		INSERT INTO #EmployedAfterExit VALUES ('MISSING', 'MISSING')
		INSERT INTO #EmployedAfterExit 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'EmployedAfterExit'

		CREATE TABLE #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator (AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode VARCHAR(50), AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription VARCHAR(200))

		INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator VALUES ('MISSING', 'MISSING')
		INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator'

		CREATE TABLE #AdultEducationCredentialAttainmentEmployedIndicator (AdultEducationCredentialAttainmentEmployedIndicatorCode VARCHAR(50),AdultEducationCredentialAttainmentEmployedIndicatorDescription VARCHAR(200))

		INSERT INTO #AdultEducationCredentialAttainmentEmployedIndicator VALUES ('MISSING', 'MISSING')
		INSERT INTO #AdultEducationCredentialAttainmentEmployedIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationCredentialAttainmentEmployedIndicator'

		CREATE TABLE #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator (AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode VARCHAR(50), AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription VARCHAR(200))

		INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator VALUES ('MISSING', 'MISSING')
		INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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

	PRINT 'Populate DimRaces'

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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping ceds
	LEFT JOIN rds.DimRaces main
		ON ceds.CedsOptionSetCode = main.RaceCode
	WHERE main.RaceCode IS NULL
		AND ceds.CedsElementTechnicalName = 'Race'

	IF NOT EXISTS (SELECT 1 FROM RDS.DimRaces WHERE RaceCode = 'HispanicOrLatinoEthnicity') BEGIN
		INSERT INTO RDS.DimRaces (RaceCode, RaceDescription, RaceEdFactsCode) VALUES ('HispanicorLatinoEthnicity', 'Hispanic', 'HI7')
	END

	PRINT 'Populate DimAges'

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


	PRINT 'Populate DimDimK12SchoolStatuses'

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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'MagnetOrSpecialProgramEmphasisSchool'


	CREATE TABLE #NationalSchoolLunchProgramStatus (NslpStatusCode VARCHAR(50), NslpStatusDescription VARCHAR(200), NslpStatusEdFactsCode VARCHAR(200))

		INSERT INTO #NationalSchoolLunchProgramStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #NationalSchoolLunchProgramStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'NationalSchoolLunchProgramStatus'



	CREATE TABLE #SharedTimeIndicator (SharedTimeIndicatorCode VARCHAR(50), SharedTimeIndicatorDescription VARCHAR(200), SharedTimeIndicatorEdFactsCode VARCHAR(200))

		INSERT INTO #SharedTimeIndicator VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #SharedTimeIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'VirtualSchoolStatus'

	-- This is no longer used in EdFacts.  Setting the EdFacts values to MISSING
	CREATE TABLE #SchoolImprovementStatus (SchoolImprovementStatusCode VARCHAR(50), SchoolImprovementStatusDescription VARCHAR(200), SchoolImprovementStatusEdFactsCode VARCHAR(200))

		INSERT INTO #SchoolImprovementStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #SchoolImprovementStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, 'MISSING' AS EdFactsOptionSetCode
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'SchoolImprovementStatus'


	CREATE TABLE #PersistentlyDangerousStatus (PersistentlyDangerousStatusCode VARCHAR(50), PersistentlyDangerousStatusDescription VARCHAR(200), PersistentlyDangerousStatusEdFactsCode VARCHAR(200))

		INSERT INTO #PersistentlyDangerousStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #PersistentlyDangerousStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'StatePovertyDesignation'


	CREATE TABLE #ProgressAchievingEnglishLanguageProficiencyIndicatorType(ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode VARCHAR(50), ProgressAchievingEnglishLanguageProficiencyIndicatorTypeDescription VARCHAR(200), ProgressAchievingEnglishLanguageProficiencyIndicatorTypeEdFactsCode VARCHAR(200))

		INSERT INTO #ProgressAchievingEnglishLanguageProficiencyIndicatorType VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #ProgressAchievingEnglishLanguageProficiencyIndicatorType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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



	PRINT 'Populate DimK12ProgramTypes'

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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimK12ProgramTypes main
		ON ceds.CedsOptionSetCode = main.ProgramTypeCode
	WHERE main.ProgramTypeCode IS NULL
		AND ceds.CedsElementName = 'Program Type'

	PRINT 'Populate DimSchoolYears'

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

	PRINT 'Populate DimK12CourseStatuses'

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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping ceds
	LEFT JOIN rds.DimK12CourseStatuses main
		ON ceds.CedsOptionSetCode = main.CourseLevelCharacteristicCode
	WHERE main.DimK12CourseStatusId IS NULL
		AND ceds.CedsElementName = 'Course Level Characteristic'

	PRINT 'Populate DimDates'

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


	PRINT 'Populate DimPsAcademicAwardStatuses'

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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PescAwardLevelType'

	CREATE TABLE #ProfessionalOrTechnicalCredentialConferred (ProfessionalOrTechnicalCredentialConferredCode VARCHAR(50), ProfessionalOrTechnicalCredentialConferredDescription VARCHAR(200))

	INSERT INTO #ProfessionalOrTechnicalCredentialConferred VALUES ('MISSING', 'MISSING')
	INSERT INTO #ProfessionalOrTechnicalCredentialConferred
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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


	PRINT 'Populate DimPsEnrollmentStatuses'

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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping ceds
	LEFT JOIN rds.DimPsEnrollmentStatuses main
		ON ceds.CedsOptionSetCode = main.PostsecondaryExitOrWithdrawalTypeCode
	WHERE main.DimPsEnrollmentStatusId IS NULL
		AND ceds.CedsElementTechnicalName = 'PostsecondaryExitOrWithdrawalType'


	PRINT 'Populate DimK12EnrollmentStatuses'

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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EnrollmentStatus'

	CREATE TABLE #EntryType (EntryTypeCode VARCHAR(50), EntryTypeDescription VARCHAR(200))

	INSERT INTO #EntryType VALUES ('MISSING', 'MISSING')
	INSERT INTO #EntryType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EntryType'

	CREATE TABLE #ExitOrWithdrawalType (ExitOrWithdrawalTypeCode VARCHAR(50), ExitOrWithdrawalTypeDescription VARCHAR(200))

	INSERT INTO #ExitOrWithdrawalType VALUES ('MISSING', 'MISSING')
	INSERT INTO #ExitOrWithdrawalType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ExitOrWithdrawalType'

	CREATE TABLE #PostSecondaryEnrollmentStatus (PostSecondaryEnrollmentStatusCode VARCHAR(50), PostSecondaryEnrollmentStatusDescription VARCHAR(200), PostSecondaryEnrollmentStatusEdFactsCode VARCHAR(50))

	INSERT INTO #PostSecondaryEnrollmentStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #PostSecondaryEnrollmentStatus 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PostSecondaryEnrollmentStatus'

	CREATE TABLE #EdFactsAcademicOrCareerAndTechnicalOutcomeType (EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode VARCHAR(50), EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription VARCHAR(200), EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode VARCHAR(50))

	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeType VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EdFactsAcademicOrCareerAndTechnicalOutcomeType'

	CREATE TABLE #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType (EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode VARCHAR(50), EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription VARCHAR(200), EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode VARCHAR(50))

	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'EdFactsAcademicOrCareerAndTechnicalOutcomeExitType'


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



	PRINT 'Populate DimPsInstitutionStatuses'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'LevelOfInstitution'

	CREATE TABLE #ControlOfInstitution (ControlOfInstitutionCode VARCHAR(50), ControlOfInstitutionDescription VARCHAR(200))

	INSERT INTO #ControlOfInstitution VALUES ('MISSING', 'MISSING')
	INSERT INTO #ControlOfInstitution
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ControlOfInstitution'

	CREATE TABLE #CarnegieBasicClassification (CarnegieBasicClassificationCode VARCHAR(50), CarnegieBasicClassificationDescription VARCHAR(200))

	INSERT INTO #CarnegieBasicClassification VALUES ('MISSING', 'MISSING')
	INSERT INTO #CarnegieBasicClassification 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CarnegieBasicClassification'

	CREATE TABLE #VirtualIndicator (VirtualIndicatorCode VARCHAR(50), VirtualIndicatorDescription VARCHAR(200))

	INSERT INTO #VirtualIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #VirtualIndicator 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'VirtualIndicator'

	CREATE TABLE #MostPrevalentLevelOfInstitution (MostPrevalentLevelOfInstitutionStatusCode VARCHAR(50), MostPrevalentLevelOfInstitutionDescription VARCHAR(200))

	INSERT INTO #MostPrevalentLevelOfInstitution VALUES ('MISSING', 'MISSING')
	INSERT INTO #MostPrevalentLevelOfInstitution 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MostPrevalentLevelOfInstitution'
	
	CREATE TABLE #PredominantCalendarSystem (PredominantCalendarSystemCode VARCHAR(50), PredominantCalendarSystemDescription VARCHAR(200))

	INSERT INTO #PredominantCalendarSystem VALUES ('MISSING', 'MISSING')
	INSERT INTO #PredominantCalendarSystem 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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


	PRINT 'Populate DimProgramTypes'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping ceds
	LEFT JOIN rds.DimProgramTypes main
		ON ceds.CedsOptionSetCode = main.ProgramTypeCode
	WHERE main.DimProgramTypeId IS NULL
		AND ceds.CedsElementTechnicalName = 'ProgramType'


	PRINT 'Populate DimAcademicTermDesignators'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAcademicTermDesignators main
		ON ceds.CedsOptionSetCode = main.AcademicTermDesignatorCode
	WHERE main.DimAcademicTermDesignatorId IS NULL
		AND ceds.CedsElementTechnicalName = 'AcademicTermDesignator'

	PRINT 'Populate DimDisabilityStatuses'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'DisabilityConditionType'

	CREATE TABLE #DisabilityDeterminationSourceType (DisabilityDeterminationSourceTypeCode VARCHAR(50), DisabilityDeterminationSourceTypeDescription VARCHAR(200))

	INSERT INTO #DisabilityDeterminationSourceType VALUES ('MISSING', 'MISSING')
	INSERT INTO #DisabilityDeterminationSourceType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'DisabilityDeterminationSourceType'

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


	PRINT 'Populate DimEnglishLearnerStatuses'
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
	
	PRINT 'Populate DimFosterCareStatuses'
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

	PRINT 'Populate DimHomelessnessStatuses'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'HomelessPrimaryNighttimeResidence'

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
	

	
	PRINT 'Populate DimMigrantStatuses'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping 
	WHERE CedsElementTechnicalName = 'MigrantEducationProgramEnrollmentType' 

	CREATE TABLE #ContinuationOfServices (ContinuationOfServicesReasonCode VARCHAR(50), ContinuationOfServicesReasonDescription VARCHAR(200))

	INSERT INTO #ContinuationOfServices VALUES ('MISSING', 'MISSING')
	INSERT INTO #ContinuationOfServices
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'ContinuationOfServicesReason'

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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'MigrantEducationProgramServicesType'

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

	PRINT 'Populate DimK12Demographics'
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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


	PRINT 'Populate DimK12AcademicAwardStatuses'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping c
	LEFT JOIN RDS.DimK12AcademicAwardStatuses main
		ON c.CedsOptionSetCode = main.HighSchoolDiplomaTypeCode
	WHERE main.DimK12AcademicAwardStatusId IS NULL
		AND c.CedsElementTechnicalName = 'HighSchoolDiplomaType'

	PRINT 'Populate DimResponsibleSchoolTypes'
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



	PRINT 'Populate DimIdeaStatuses'
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'SpecialEducationExitReason'

		CREATE TABLE #IdeaEducationalEnvironmentForSchoolAge (IdeaEducationalEnvironmentForSchoolAgeCode VARCHAR(50), IdeaEducationalEnvironmentForSchoolAgeDescription VARCHAR(200), IdeaEducationalEnvironmentForSchoolAgeEdFactsCode VARCHAR(200))

		INSERT INTO #IdeaEducationalEnvironmentForSchoolAge VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #IdeaEducationalEnvironmentForSchoolAge 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'IdeaEducationalEnvironmentForSchoolAge'

		CREATE TABLE #IdeaEducationalEnvironmentForEarlyChildhood (IdeaEducationalEnvironmentForEarlyChildhoodCode VARCHAR(50), IdeaEducationalEnvironmentForEarlyChildhoodDescription VARCHAR(200), IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode VARCHAR(200))

		INSERT INTO #IdeaEducationalEnvironmentForEarlyChildhood VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #IdeaEducationalEnvironmentForEarlyChildhood 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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

	PRINT 'Populate DimGradeLevels'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping ceds
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
	
	PRINT 'Populate DimChildOutcomeSummaries'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'COSRatingA'

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

	PRINT 'Populate DimIndividualizedProgramStatuses'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'IndividualizedProgramType'

	CREATE TABLE #StudentSupportServiceType (StudentSupportServiceTypeCode VARCHAR(50), StudentSupportServiceTypeDescription VARCHAR(200))

	INSERT INTO #StudentSupportServiceType VALUES ('MISSING', 'MISSING')
	INSERT INTO #StudentSupportServiceType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'StudentSupportServiceType'

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

	PRINT 'Populate DimIdeaDisabilityTypes'
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
           
    FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping ceds
    LEFT JOIN RDS.DimIdeaDisabilityTypes main
        ON ceds.CedsOptionSetCode = main.IdeaDisabilityTypeCode
    WHERE main.DimIdeaDisabilityTypeId IS NULL
        AND ceds.CedsElementTechnicalName = 'IdeaDisabilityType'


	PRINT 'Populate DimImmigrantStatuses'
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
	

	PRINT 'Populate DimMilitaryStatuses'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MilitaryActiveStudentIndicator'

	IF OBJECT_ID('tempdb..#MilitaryBranch') IS NOT NULL
		DROP TABLE #MilitaryBranch

	CREATE TABLE #MilitaryBranch (MilitaryBranchCode VARCHAR(50), MilitaryBranchDescription VARCHAR(200))

	INSERT INTO #MilitaryBranch VALUES ('MISSING', 'MISSING')
	INSERT INTO #MilitaryBranch 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MilitaryBranch'
	
	IF OBJECT_ID('tempdb..#MilitaryVeteranStudentIndicator') IS NOT NULL
		DROP TABLE #MilitaryVeteranStudentIndicator

	CREATE TABLE #MilitaryVeteranStudentIndicator (MilitaryVeteranStudentIndicatorCode VARCHAR(50), MilitaryVeteranStudentIndicatorDescription VARCHAR(200))

	INSERT INTO #MilitaryVeteranStudentIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #MilitaryVeteranStudentIndicator 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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


	PRINT 'Populate DimEconomicallyDisadvantagedStatuses'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EligibilityStatusForSchoolFoodServicePrograms'
	
	IF OBJECT_ID('tempdb..#NationalSchoolLunchProgramDirectCertificationIndicator') IS NOT NULL
		DROP TABLE #NationalSchoolLunchProgramDirectCertificationIndicator

	CREATE TABLE #NationalSchoolLunchProgramDirectCertificationIndicator (NationalSchoolLunchProgramDirectCertificationIndicatorCode VARCHAR(50), NationalSchoolLunchProgramDirectCertificationIndicatorDescription VARCHAR(200))

	INSERT INTO #NationalSchoolLunchProgramDirectCertificationIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #NationalSchoolLunchProgramDirectCertificationIndicator 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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


	PRINT 'Populate DimAssessmentAccommodations'
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AssessmentAccommodationCategory'

		IF OBJECT_ID('tempdb..#AccommodationType') IS NOT NULL
			DROP TABLE #AccommodationType

		CREATE TABLE #AccommodationType (AccommodationTypeCode VARCHAR(50), AccommodationTypeDescription VARCHAR(200))

		INSERT INTO #AccommodationType VALUES ('MISSING', 'MISSING')
		INSERT INTO #AccommodationType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
		

	PRINT 'Populate DimAssessmentParticipationSessions'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAssessmentParticipationSessions main
		ON ceds.CedsOptionSetCode = main.DimAssessmentParticipationSessionId
	WHERE main.DimAssessmentParticipationSessionId IS NULL
		AND ceds.CedsElementTechnicalName = 'AssessmentSessionSpecialCircumstanceType'


	PRINT 'Populate DimAssessmentRegistrations'
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AssessmentRegistrationParticipationIndicator'


		IF OBJECT_ID('tempdb..#AssessmentRegistrationCompletionStatus') IS NOT NULL
			DROP TABLE #AssessmentRegistrationCompletionStatus

		CREATE TABLE #AssessmentRegistrationCompletionStatus (AssessmentRegistrationCompletionStatusCode VARCHAR(50), AssessmentRegistrationCompletionStatusDescription VARCHAR(200))

		INSERT INTO #AssessmentRegistrationCompletionStatus VALUES ('MISSING', 'MISSING')
		INSERT INTO #AssessmentRegistrationCompletionStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
		arpi.AssessmentRegistrationParticipationIndicatorCode
		,arpi.AssessmentRegistrationParticipationIndicatorDescription
		,arcs.AssessmentRegistrationCompletionStatusCode
		,arcs.AssessmentRegistrationCompletionStatusDescription
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

	PRINT 'Populate DimAssessmentResults'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAssessmentResults main
		ON ceds.CedsOptionSetCode = main.DimAssessmentResultId
	WHERE main.DimAssessmentResultId IS NULL
		AND ceds.CedsElementTechnicalName = 'AssessmentScoreMetricType'


	PRINT 'Populate DimBuildingSpaceDesignTypes'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimBuildingSpaceDesignTypes main
		ON ceds.CedsOptionSetCode = main.DimBuildingSpaceDesignTypeId
	WHERE main.DimBuildingSpaceDesignTypeId IS NULL
		AND ceds.CedsElementTechnicalName = 'BuildingSpaceDesignType'


	PRINT 'Populate DimIncidentStatuses'
	-----------------------------------------------------
	-- Populate DimIncidentStatuses 		           --
	-----------------------------------------------------

	CREATE TABLE #IncidentBehavior (IncidentBehaviorCode VARCHAR(50), IncidentBehaviorDescription VARCHAR(200))

	INSERT INTO #IncidentBehavior VALUES ('MISSING', 'MISSING')
	INSERT INTO #IncidentBehavior 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'IncidentBehavior'

	CREATE TABLE #IdeaInterimRemovalReason (IdeaInterimRemovalReasonCode VARCHAR(50), IdeaInterimRemovalReasonDescription VARCHAR(200), IdeaInterimRemovalReasonEdFactsCode VARCHAR(50))

	INSERT INTO #IdeaInterimRemovalReason VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #IdeaInterimRemovalReason 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode 
			WHEN 'Drugs' THEN 'D'
			WHEN 'Weapons' THEN 'W'
			WHEN 'SeriousBodilyInjury' THEN 'SBI'
			ELSE 'MISSING'
		  END
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'IncidentBehavior'

	CREATE TABLE #DisciplineReason (DisciplineReasonCode VARCHAR(50), DisciplineReasonDescription VARCHAR(200))

	INSERT INTO #DisciplineReason VALUES ('MISSING', 'MISSING')
	INSERT INTO #DisciplineReason 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'DisciplineReason'

	CREATE TABLE #IncidentInjuryType (IncidentInjuryTypeCode VARCHAR(50), IncidentInjuryTypeDescription VARCHAR(200))

	INSERT INTO #IncidentInjuryType VALUES ('MISSING', 'MISSING')
	INSERT INTO #IncidentInjuryType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'IncidentInjuryType'


	IF NOT EXISTS (SELECT 1 FROM RDS.DimIncidentStatuses d WHERE d.DimIncidentStatusId = -1) 
	BEGIN
		SET IDENTITY_INSERT RDS.DimIncidentStatuses ON

		INSERT INTO RDS.DimIncidentStatuses (
			  DimIncidentStatusId
			, IncidentBehaviorCode
			, IncidentBehaviorDescription
			, IdeaInterimRemovalReasonCode
			, IdeaInterimRemovalReasonDescription
			, IdeaInterimRemovalReasonEdFactsCode
			, DisciplineReasonCode
			, DisciplineReasonDescription
			, IncidentInjuryTypeCode
			, IncidentInjuryTypeDescription
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
	SELECT 
			ib.IncidentBehaviorCode
		, ib.IncidentBehaviorDescription
		, iirr.IdeaInterimRemovalReasonCode
		, iirr.IdeaInterimRemovalReasonDescription
		, iirr.IdeaInterimRemovalReasonEdFactsCode
		, dr.DisciplineReasonCode
		, dr.DisciplineReasonDescription
		, iit.IncidentInjuryTypeCode
		, iit.IncidentInjuryTypeDescription
	FROM #IncidentBehavior ib
	CROSS JOIN #IdeaInterimRemovalReason iirr
	CROSS JOIN #DisciplineReason dr
	CROSS JOIN #IncidentInjuryType iit
	LEFT JOIN rds.DimIncidentStatuses rdi
		ON  ib.[IncidentBehaviorCode] = rdi.[IncidentBehaviorCode]
		AND iirr.[IdeaInterimRemovalReasonCode] = rdi.[IdeaInterimRemovalReasonCode]
		AND dr.[DisciplineReasonCode] = rdi.[DisciplineReasonCode]
		AND iit.[IncidentInjuryTypeCode] = rdi.[IncidentInjuryTypeCode]
	WHERE rdi.DimIncidentStatusId IS NULL

	DROP TABLE #IncidentBehavior
	DROP TABLE #IdeaInterimRemovalReason
	DROP TABLE #DisciplineReason
	DROP TABLE #IncidentInjuryType

	PRINT 'Populate DimFirearmDisciplineStatuses'
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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



	PRINT 'Populate DimFirearms'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimFirearms main
		ON ceds.CedsOptionSetCode = main.FirearmTypeCode
	WHERE main.DimFirearmId IS NULL
		AND ceds.CedsElementTechnicalName = 'FirearmType'

	PRINT 'Populate DimK12StaffCategories'
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
           ,[TitleIProgramStaffCategoryEdFactsCode]
		   ,[MigrantEducationProgramStaffCategoryCode]
		   ,[MigrantEducationProgramStaffCategoryDescription]
		   ,[ProfessionalEducationalJobClassificationCode]
		   ,[ProfessionalEducationalJobClassificationDescription]
		   )
		   VALUES (-1, 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING')

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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'TitleIProgramStaffCategory'
		
		IF OBJECT_ID('tempdb..#MigrantEducationProgramStaffCategory') IS NOT NULL
			DROP TABLE #MigrantEducationProgramStaffCategory

		CREATE TABLE #MigrantEducationProgramStaffCategory (MigrantEducationProgramStaffCategoryCode VARCHAR(50), MigrantEducationProgramStaffCategoryDescription VARCHAR(200))

		INSERT INTO #MigrantEducationProgramStaffCategory VALUES ('MISSING', 'MISSING')
		INSERT INTO #MigrantEducationProgramStaffCategory 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'MigrantEducationProgramStaffCategory'

		
		IF OBJECT_ID('tempdb..#ProfessionalEducationalJobClassification') IS NOT NULL
			DROP TABLE #ProfessionalEducationalJobClassification

		CREATE TABLE #ProfessionalEducationalJobClassification (ProfessionalEducationalJobClassificationCode VARCHAR(50), ProfessionalEducationalJobClassificationDescription VARCHAR(200))

		INSERT INTO #ProfessionalEducationalJobClassification VALUES ('MISSING', 'MISSING')
		INSERT INTO #ProfessionalEducationalJobClassification 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'ProfessionalEducationalJobClassification'



	INSERT INTO [RDS].[DimK12StaffCategories]
           ([K12StaffClassificationCode]
           ,[K12StaffClassificationDescription]
           ,[K12StaffClassificationEdFactsCode]
           ,[SpecialEducationSupportServicesCategoryCode]
           ,[SpecialEducationSupportServicesCategoryDescription]
           ,[SpecialEducationSupportServicesCategoryEdFactsCode]
           ,[TitleIProgramStaffCategoryCode]
           ,[TitleIProgramStaffCategoryDescription]
           ,[TitleIProgramStaffCategoryEdFactsCode]
		   ,[MigrantEducationProgramStaffCategoryCode]
		   ,[MigrantEducationProgramStaffCategoryDescription]
		   ,[ProfessionalEducationalJobClassificationCode]
		   ,[ProfessionalEducationalJobClassificationDescription]
		   )
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
		,mepsc.MigrantEducationProgramStaffCategoryCode
		,mepsc.MigrantEducationProgramStaffCategoryDescription
		,pejc.ProfessionalEducationalJobClassificationCode
		,pejc.ProfessionalEducationalJobClassificationDescription
	FROM #K12StaffClassification ksc
	CROSS JOIN #SpecialEducationSupportServicesCategory ssc
	CROSS JOIN #TitleIProgramStaffCategory tsc
	CROSS JOIN #MigrantEducationProgramStaffCategory mepsc
	CROSS JOIN #ProfessionalEducationalJobClassification pejc
	LEFT JOIN rds.DimK12StaffCategories dfd
		ON	ksc.K12StaffClassificationCode	= dfd.K12StaffClassificationCode								
		AND ssc.SpecialEducationSupportServicesCategoryCode = dfd.SpecialEducationSupportServicesCategoryCode
		AND tsc.TitleIProgramStaffCategoryCode = dfd.TitleIProgramStaffCategoryCode
		AND mepsc.MigrantEducationProgramStaffCategoryCode = dfd.MigrantEducationProgramStaffCategoryCode
		AND pejc.ProfessionalEducationalJobClassificationCode = dfd.ProfessionalEducationalJobClassificationCode
	WHERE dfd.DimK12StaffCategoryId IS NULL

	DROP TABLE #K12StaffClassification
	DROP TABLE #SpecialEducationSupportServicesCategory
	DROP TABLE #TitleIProgramStaffCategory
	DROP TABLE #MigrantEducationProgramStaffCategory
	DROP TABLE #ProfessionalEducationalJobClassification

	PRINT 'Populate DimAcademicTermDesignators'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAcademicTermDesignators main
		ON ceds.CedsOptionSetCode = main.AcademicTermDesignatorCode
	WHERE main.DimAcademicTermDesignatorId IS NULL
		AND ceds.CedsElementTechnicalName = 'AcademicTermDesignator'


	PRINT 'Populate DimPsDemographics'
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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

	PRINT 'Populate DimDisciplineStatuses'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	
	PRINT 'Populate DimK12StaffStatuses'
	------------------------------------------------
	-- Populate DimK12StaffStatuses			 ---
	------------------------------------------------
	IF NOT EXISTS (
			SELECT 1 FROM RDS.DimK12StaffStatuses 
			WHERE DimK12StaffStatusId = -1
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
			, ParaprofessionalQualificationStatusEdFactsCode
			, SpecialEducationRelatedServicesPersonnelCode
			, SpecialEducationRelatedServicesPersonnelDescription
			, TeachingCredentialBasisCode
			, TeachingCredentialBasisDescription
			, CTEInstructorIndustryCertificationCode
			, CTEInstructorIndustryCertificationDescription
			, SpecialEducationParaprofessionalCode
			, SpecialEducationParaprofessionalDescription
			, SpecialEducationTeacherCode
			, SpecialEducationTeacherDescription
			)
		VALUES (-1, 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING','MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING')

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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ParaprofessionalQualificationStatus'

	IF OBJECT_ID('tempdb..#SpecialEducationRelatedServicesPersonnel') IS NOT NULL BEGIN
		DROP TABLE #SpecialEducationRelatedServicesPersonnel
	END
	CREATE TABLE #SpecialEducationRelatedServicesPersonnel (SpecialEducationRelatedServicesPersonnelCode VARCHAR(50), SpecialEducationRelatedServicesPersonnelDescription VARCHAR(200))

	INSERT INTO #SpecialEducationRelatedServicesPersonnel VALUES ('MISSING', 'MISSING')
	INSERT INTO #SpecialEducationRelatedServicesPersonnel 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SpecialEducationRelatedServicesPersonnel'


	IF OBJECT_ID('tempdb..#TeachingCredentialBasis') IS NOT NULL BEGIN
		DROP TABLE #TeachingCredentialBasis
	END
	CREATE TABLE #TeachingCredentialBasis (TeachingCredentialBasisCode VARCHAR(50), TeachingCredentialBasisDescription VARCHAR(200))

	INSERT INTO #TeachingCredentialBasis VALUES ('MISSING', 'MISSING')
	INSERT INTO #TeachingCredentialBasis 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TeachingCredentialBasis'


	IF OBJECT_ID('tempdb..#CTEInstructorIndustryCertification') IS NOT NULL BEGIN
		DROP TABLE #CTEInstructorIndustryCertification
	END
	CREATE TABLE #CTEInstructorIndustryCertification (CTEInstructorIndustryCertificationCode VARCHAR(50), CTEInstructorIndustryCertificationDescription VARCHAR(200))

	INSERT INTO #CTEInstructorIndustryCertification VALUES ('MISSING', 'MISSING')
	INSERT INTO #CTEInstructorIndustryCertification 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CTEInstructorIndustryCertification'

	IF OBJECT_ID('tempdb..#SpecialEducationParaprofessional') IS NOT NULL BEGIN
		DROP TABLE #SpecialEducationParaprofessional
	END
	CREATE TABLE #SpecialEducationParaprofessional (SpecialEducationParaprofessionalCode VARCHAR(50), SpecialEducationParaprofessionalDescription VARCHAR(200))

	INSERT INTO #SpecialEducationParaprofessional VALUES ('MISSING', 'MISSING')
	INSERT INTO #SpecialEducationParaprofessional 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SpecialEducationParaprofessional'

	IF OBJECT_ID('tempdb..#SpecialEducationTeacher') IS NOT NULL BEGIN
		DROP TABLE #SpecialEducationTeacher
	END
	CREATE TABLE #SpecialEducationTeacher (SpecialEducationTeacherCode VARCHAR(50), SpecialEducationTeacherDescription VARCHAR(200))

	INSERT INTO #SpecialEducationTeacher VALUES ('MISSING', 'MISSING')
	INSERT INTO #SpecialEducationTeacher 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SpecialEducationTeacher'


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
			, SpecialEducationRelatedServicesPersonnelCode
			, SpecialEducationRelatedServicesPersonnelDescription
			, TeachingCredentialBasisCode
			, TeachingCredentialBasisDescription
			, CTEInstructorIndustryCertificationCode
			, CTEInstructorIndustryCertificationDescription
			, SpecialEducationParaprofessionalCode
			, SpecialEducationParaprofessionalDescription
			, SpecialEducationTeacherCode
			, SpecialEducationTeacherDescription
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
		, sersp.SpecialEducationRelatedServicesPersonnelCode
		, sersp.SpecialEducationRelatedServicesPersonnelDescription
		, tcb.TeachingCredentialBasisCode
		, tcb.TeachingCredentialBasisDescription
		, cteiic.CTEInstructorIndustryCertificationCode
		, cteiic.CTEInstructorIndustryCertificationDescription
		, sep.SpecialEducationParaprofessionalCode
		, sep.SpecialEducationParaprofessionalDescription
		, spet.SpecialEducationTeacherCode
		, spet.SpecialEducationTeacherDescription
	FROM #SpecialEducationAgeGroupTaught seagt
	CROSS JOIN #EdFactsCertificationStatus efcs
	CROSS JOIN #HighlyQualifiedTeacherIndicator hqti
	CROSS JOIN #EdFactsTeacherInexperiencedStatus dftis
	CROSS JOIN #TeachingCredentialType tct
	CROSS JOIN #EdFactsTeacherOutOfFieldStatus eftoofs
	CROSS JOIN #SpecialEducationTeacherQualificationStatus setqs
	CROSS JOIN #ParaprofessionalQualificationStatus pqs
	CROSS JOIN #SpecialEducationRelatedServicesPersonnel sersp
	CROSS JOIN #TeachingCredentialBasis tcb
	CROSS JOIN #CTEInstructorIndustryCertification cteiic
	CROSS JOIN #SpecialEducationParaprofessional sep
	CROSS JOIN #SpecialEducationTeacher spet
	LEFT JOIN rds.DimK12StaffStatuses main
		ON seagt.SpecialEducationAgeGroupTaughtCode = main.SpecialEducationAgeGroupTaughtCode
		AND efcs.EdFactsCertificationStatusCode = main.EdFactsCertificationStatusCode
		AND hqti.HighlyQualifiedTeacherIndicatorCode = main.HighlyQualifiedTeacherIndicatorCode
		AND dftis.EdFactsTeacherInexperiencedStatusCode = main.EdFactsTeacherInexperiencedStatusCode
		AND tct.TeachingCredentialTypeCode = main.TeachingCredentialTypeCode
		AND eftoofs.EdFactsTeacherOutOfFieldStatusCode = main.EdFactsTeacherOutOfFieldStatusCode
		AND setqs.SpecialEducationTeacherQualificationStatusCode = main.SpecialEducationTeacherQualificationStatusCode
		AND pqs.ParaprofessionalQualificationStatusCode = main.ParaprofessionalQualificationStatusCode
		AND sersp.SpecialEducationRelatedServicesPersonnelCode = main.SpecialEducationRelatedServicesPersonnelCode
		AND tcb.TeachingCredentialBasisCode = main.TeachingCredentialBasisCode
		AND cteiic.CTEInstructorIndustryCertificationCode = main.CTEInstructorIndustryCertificationCode
		AND sep.SpecialEducationParaprofessionalCode = main.SpecialEducationParaprofessionalCode
		AND spet.SpecialEducationTeacherCode = main.SpecialEducationTeacherCode
	WHERE main.DimK12StaffStatusId IS NULL

	DROP TABLE #SpecialEducationAgeGroupTaught
	DROP TABLE #EdFactsCertificationStatus
	DROP TABLE #HighlyQualifiedTeacherIndicator
	DROP TABLE #EdFactsTeacherInexperiencedStatus
	DROP TABLE #TeachingCredentialType
	DROP TABLE #EdFactsTeacherOutOfFieldStatus
	DROP TABLE #SpecialEducationTeacherQualificationStatus
	DROP TABLE #ParaprofessionalQualificationStatus
	DROP TABLE #SpecialEducationRelatedServicesPersonnel
	DROP TABLE #TeachingCredentialBasis
	DROP TABLE #CTEInstructorIndustryCertification
	DROP TABLE #SpecialEducationParaprofessional
	DROP TABLE #SpecialEducationTeacher



	PRINT 'Populate DimNOrDStatuses'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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


	PRINT 'Populate DimTitleIIIStatuses'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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

	PRINT 'Populate DimAttendances'
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
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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

	PRINT 'Populate DimCteStatuses'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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


	PRINT 'Populate DimLanguages'
	------------------------------------------------
	-- Populate DimLanguages			 ---
	------------------------------------------------
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
	From [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping iso2
		full outer join [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping iso3
			on iso2.CedsOptionSetCode = iso3.CedsOptionSetCode
		left outer join rds.DimLanguages dl
			on isnull(dl.Iso6392LanguageCodeCode,'') = isnull(iso2.CedsOptionSetCode,'')
				and isnull(dl.Iso6393LanguageCodeCode,'') = isnull(iso3.CedsOptionSetCode,'')
	Where iso2.CedsGlobalId = '000317'
		and iso3.CedsGlobalId = '001637'
		and dl.DimLanguageId is null



	PRINT 'Populate DimComprehensiveAndTargetedSupports'
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	

	PRINT 'Populate DimCharterSchoolStatuses'
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
	-- FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
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
	
	PRINT 'Populate DimFactTypes'
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

	PRINT 'Populate DimFederalFinancialAccountBalances'
		------------------------------------------------------------------
	-- Populate DimFederalFinancialAccountBalances  --
	------------------------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimFederalFinancialAccountBalances d WHERE d.DimFederalFinancialAccountBalanceId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimFederalFinancialAccountBalances ON

		INSERT INTO [RDS].[DimFederalFinancialAccountBalances]
           ([DimFederalFinancialAccountBalanceId]
           ,[FinancialAccountBalanceSheetCodeCode]
           ,[FinancialAccountBalanceSheetCodeDescription]
		   )
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimFederalFinancialAccountBalances OFF

	END

	IF OBJECT_ID('tempdb..#FinancialAccountBalanceCode') IS NOT NULL
		DROP TABLE #FinancialAccountBalanceCode

		CREATE TABLE #FinancialAccountBalanceCode (FinancialAccountBalanceSheetCodeCode VARCHAR(50), FinancialAccountBalanceSheetCodeDescription VARCHAR(200))

		INSERT INTO #FinancialAccountBalanceCode VALUES ('MISSING', 'MISSING')
		INSERT INTO #FinancialAccountBalanceCode 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'FinancialAccountBalanceSheetCode'


		INSERT INTO [RDS].[DimFederalFinancialAccountBalances]
           ([FinancialAccountBalanceSheetCodeCode]
           ,[FinancialAccountBalanceSheetCodeDescription]
		   )
		SELECT DISTINCT
			  h.FinancialAccountBalanceSheetCodeCode
			, h.FinancialAccountBalanceSheetCodeDescription
		FROM #FinancialAccountBalanceCode h
		LEFT JOIN rds.DimFederalFinancialAccountBalances main
			ON  h.FinancialAccountBalanceSheetCodeCode = main.FinancialAccountBalanceSheetCodeCode
		WHERE main.DimFederalFinancialAccountBalanceId IS NULL

	DROP TABLE #FinancialAccountBalanceCode


	PRINT 'Populate DimFederalFinancialAccountClassifications'
	-------------------------------------------------------------------------
	-- Populate DimFederalFinancialAccountClassifications   --
	-------------------------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM rds.DimFederalFinancialAccountClassifications d WHERE d.DimFederalFinancialAccountClassificationId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimFederalFinancialAccountClassifications ON

			INSERT INTO rds.DimFederalFinancialAccountClassifications (
						  DimFederalFinancialAccountClassificationId
						, FinancialAccountCategoryCode
						, FinancialAccountCategoryDescription
						, FinancialAccountProgramCodeCode
						, FinancialAccountProgramCodeDescription
						, FinancialAccountFundClassificationCode
						, FinancialAccountFundClassificationDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')

		SET IDENTITY_INSERT rds.DimFederalFinancialAccountClassifications OFF
	END

	IF OBJECT_ID('tempdb..#FinancialAccountCategory') IS NOT NULL
		DROP TABLE #FinancialAccountCategory

	CREATE TABLE #FinancialAccountCategory (FinancialAccountCategoryCode VARCHAR(50), FinancialAccountCategoryDescription VARCHAR(200))

	INSERT INTO #FinancialAccountCategory VALUES ('MISSING', 'MISSING')
	INSERT INTO #FinancialAccountCategory 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'FinancialAccountCategory'
	
	IF OBJECT_ID('tempdb..#FinancialAccountProgramCode') IS NOT NULL
		DROP TABLE #FinancialAccountProgramCode

	CREATE TABLE #FinancialAccountProgramCode (FinancialAccountProgramCodeCode VARCHAR(50), FinancialAccountProgramCodeDescription VARCHAR(200))

	INSERT INTO #FinancialAccountProgramCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #FinancialAccountProgramCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'FinancialAccountProgramCode'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#FinancialAccountFundClassification') IS NOT NULL
		DROP TABLE #FinancialAccountFundClassification

	CREATE TABLE #FinancialAccountFundClassification (FinancialAccountFundClassificationCode VARCHAR(50), FinancialAccountFundClassificationDescription VARCHAR(200))

	INSERT INTO #FinancialAccountFundClassification VALUES ('MISSING', 'MISSING')
	INSERT INTO #FinancialAccountFundClassification 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'FinancialAccountFundClassification'
	ORDER BY CedsOptionSetCode

	INSERT INTO rds.DimFederalFinancialAccountClassifications (
				  FinancialAccountCategoryCode
				, FinancialAccountCategoryDescription
				, FinancialAccountProgramCodeCode
				, FinancialAccountProgramCodeDescription
				, FinancialAccountFundClassificationCode
				, FinancialAccountFundClassificationDescription
			)
	SELECT 
		fac.FinancialAccountCategoryCode
		,fac.FinancialAccountCategoryDescription
		,fap.FinancialAccountProgramCodeCode
		,fap.FinancialAccountProgramCodeDescription
		,faf.FinancialAccountFundClassificationCode
		,faf.FinancialAccountFundClassificationDescription
	FROM #FinancialAccountCategory fac
	CROSS JOIN #FinancialAccountProgramCode fap
	CROSS JOIN #FinancialAccountFundClassification faf
	LEFT JOIN rds.DimFederalFinancialAccountClassifications ffac
		ON	fac.FinancialAccountCategoryCode								 = ffac.FinancialAccountCategoryCode								
		AND fap.FinancialAccountProgramCodeCode		 = ffac.FinancialAccountProgramCodeCode			
		AND faf.FinancialAccountFundClassificationCode = ffac.FinancialAccountFundClassificationCode
	WHERE ffac.DimFederalFinancialAccountClassificationId IS NULL

	DROP TABLE #FinancialAccountCategory
	DROP TABLE #FinancialAccountProgramCode
	DROP TABLE #FinancialAccountFundClassification


	PRINT 'Populate DimFederalFinancialRevenueClassifications'
		----------------------------------------------------------------------
	-- Populate DimFederalFinancialRevenueClassifications  --
	-------------------------------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimFederalFinancialRevenueClassifications d WHERE d.DimFederalFinancialRevenueClassificationId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimFederalFinancialRevenueClassifications ON

		INSERT INTO [RDS].[DimFederalFinancialRevenueClassifications]
           ([DimFederalFinancialRevenueClassificationId]
           ,[FinancialAccountRevenueCodeCode]
           ,[FinancialAccountRevenueCodeDescription]
		   )
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimFederalFinancialRevenueClassifications OFF

	END

	IF OBJECT_ID('tempdb..#FinancialAccountRevenueCode') IS NOT NULL
		DROP TABLE #FinancialAccountRevenueCode

		CREATE TABLE #FinancialAccountRevenueCode (FinancialAccountRevenueCodeCode VARCHAR(50), FinancialAccountRevenueCodeDescription VARCHAR(200))

		INSERT INTO #FinancialAccountRevenueCode VALUES ('MISSING', 'MISSING')
		INSERT INTO #FinancialAccountRevenueCode 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'FinancialAccountRevenueCode'


		INSERT INTO [RDS].[DimFederalFinancialRevenueClassifications]
           ([FinancialAccountRevenueCodeCode]
           ,[FinancialAccountRevenueCodeDescription]
		   )
		SELECT DISTINCT
			  h.FinancialAccountRevenueCodeCode
			, h.FinancialAccountRevenueCodeDescription
		FROM #FinancialAccountRevenueCode h
		LEFT JOIN rds.DimFederalFinancialRevenueClassifications main
			ON  h.FinancialAccountRevenueCodeCode = main.FinancialAccountRevenueCodeCode
		WHERE main.DimFederalFinancialRevenueClassificationId IS NULL

	DROP TABLE #FinancialAccountRevenueCode

	PRINT 'Populate DimFederalFinancialExpenditureClassifications'
	------------------------------------------------------------------------------
	-- Populate DimFederalFinancialExpenditureClassifications   --
	------------------------------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM rds.DimFederalFinancialExpenditureClassifications d WHERE d.DimFederalFinancialExpenditureClassificationId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimFederalFinancialExpenditureClassifications ON

			INSERT INTO rds.DimFederalFinancialExpenditureClassifications(
						  DimFederalFinancialExpenditureClassificationId
						, FinancialExpenditureFunctionCodeCode
						, FinancialExpenditureFunctionCodeDescription
						, FinancialExpenditureObjectCodeCode
						, FinancialExpenditureObjectCodeDescription
						, FinancialExpenditureLevelOfInstructionCodeCode
						, FinancialExpenditureLevelOfInstructionCodeDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')

		SET IDENTITY_INSERT rds.DimFederalFinancialExpenditureClassifications OFF
	END

	IF OBJECT_ID('tempdb..#FinancialExpenditureFunctionCode') IS NOT NULL
		DROP TABLE #FinancialExpenditureFunctionCode

	CREATE TABLE #FinancialExpenditureFunctionCode (FinancialExpenditureFunctionCodeCode VARCHAR(50), FinancialExpenditureFunctionCodeDescription VARCHAR(200))

	INSERT INTO #FinancialExpenditureFunctionCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #FinancialExpenditureFunctionCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'FinancialExpenditureFunctionCode'
	ORDER BY CedsOptionSetCode
	
	IF OBJECT_ID('tempdb..#FinancialExpenditureObjectCode') IS NOT NULL
		DROP TABLE #FinancialExpenditureObjectCode

	CREATE TABLE #FinancialExpenditureObjectCode (FinancialExpenditureObjectCodeCode VARCHAR(50), FinancialExpenditureObjectCodeDescription VARCHAR(200))

	INSERT INTO #FinancialExpenditureObjectCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #FinancialExpenditureObjectCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'FinancialExpenditureObjectCode'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#FinancialExpenditureLevelOfInstructionCode') IS NOT NULL
		DROP TABLE #FinancialExpenditureLevelOfInstructionCode

	CREATE TABLE #FinancialExpenditureLevelOfInstructionCode (FinancialExpenditureLevelOfInstructionCodeCode VARCHAR(50), FinancialExpenditureLevelOfInstructionCodeDescription VARCHAR(200))

	INSERT INTO #FinancialExpenditureLevelOfInstructionCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #FinancialExpenditureLevelOfInstructionCode
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'FinancialExpenditureLevelOfInstructionCode'
	ORDER BY CedsOptionSetCode


	INSERT INTO rds.DimFederalFinancialExpenditureClassifications(
				  FinancialExpenditureFunctionCodeCode
				, FinancialExpenditureFunctionCodeDescription
				, FinancialExpenditureObjectCodeCode
				, FinancialExpenditureObjectCodeDescription
				, FinancialExpenditureLevelOfInstructionCodeCode
				, FinancialExpenditureLevelOfInstructionCodeDescription
			)
	SELECT 
			fefc.FinancialExpenditureFunctionCodeCode
			,fefc.FinancialExpenditureFunctionCodeDescription
			,feoc.FinancialExpenditureObjectCodeCode
			,feoc.FinancialExpenditureObjectCodeDescription
			,feloc.FinancialExpenditureLevelOfInstructionCodeCode
			,feloc.FinancialExpenditureLevelOfInstructionCodeDescription
	FROM #FinancialExpenditureFunctionCode fefc
	CROSS JOIN #FinancialExpenditureObjectCode feoc
	CROSS JOIN #FinancialExpenditureLevelOfInstructionCode feloc
	LEFT JOIN rds.DimFederalFinancialExpenditureClassifications ffec
		ON	fefc.FinancialExpenditureFunctionCodeCode = ffec.FinancialExpenditureFunctionCodeCode								
		AND feoc.FinancialExpenditureObjectCodeCode = ffec.FinancialExpenditureObjectCodeCode			
		AND feloc.FinancialExpenditureLevelOfInstructionCodeCode = ffec.FinancialExpenditureLevelOfInstructionCodeCode
	WHERE ffec.DimFederalFinancialExpenditureClassificationId IS NULL

	DROP TABLE #FinancialExpenditureFunctionCode
	DROP TABLE #FinancialExpenditureObjectCode
	DROP TABLE #FinancialExpenditureLevelOfInstructionCode


	PRINT 'Populate DimAccessibleEducationMaterialStatuses'
	------------------------------------------------------------------------------
	-- Populate DimAccessibleEducationMaterialStatuses   --
	------------------------------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM rds.DimAccessibleEducationMaterialStatuses d WHERE d.DimAccessibleEducationMaterialStatusId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimAccessibleEducationMaterialStatuses ON

			INSERT INTO rds.DimAccessibleEducationMaterialStatuses(
						DimAccessibleEducationMaterialStatusId
						, AccessibleFormatIssuedIndicatorCode
						, AccessibleFormatIssuedIndicatorDescription
						, AccessibleFormatRequiredIndicatorCode
						, AccessibleFormatRequiredIndicatorDescription
						, AccessibleFormatTypeCode
						, AccessibleFormatTypeDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
				)

		SET IDENTITY_INSERT rds.DimAccessibleEducationMaterialStatuses OFF
	END
	
	IF OBJECT_ID('tempdb..#AccessibleFormatIssuedIndicatorCode') IS NOT NULL
		DROP TABLE #AccessibleFormatIssuedIndicatorCode

	CREATE TABLE #AccessibleFormatIssuedIndicatorCode (AccessibleFormatIssuedIndicatorCode VARCHAR(50), AccessibleFormatIssuedIndicatorDescription VARCHAR(200))

	INSERT INTO #AccessibleFormatIssuedIndicatorCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #AccessibleFormatIssuedIndicatorCode
	-- INSERT INTO #AccessibleFormatIssuedIndicatorCode 
	-- SELECT 
	-- 		CedsOptionSetCode
	-- 		, CedsOptionSetDescription
	-- FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	-- WHERE CedsElementTechnicalName = 'AccessibleFormatIssuedIndicator'
	-- ORDER BY CedsOptionSetCode
	VALUES ('Yes', 'Yes'), ('No', 'No')

	IF OBJECT_ID('tempdb..#AccessibleFormatRequiredIndicatorCode') IS NOT NULL
		DROP TABLE #AccessibleFormatRequiredIndicatorCode

	CREATE TABLE #AccessibleFormatRequiredIndicatorCode (AccessibleFormatRequiredIndicatorCodeCode VARCHAR(50), AccessibleFormatRequiredIndicatorCodeDescription VARCHAR(200))

	INSERT INTO #AccessibleFormatRequiredIndicatorCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #AccessibleFormatRequiredIndicatorCode 
	-- Temprary until we get the correct data
	-- SELECT 
	-- 		CedsOptionSetCode
	-- 		, CedsOptionSetDescription
	-- FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	-- WHERE CedsElementTechnicalName = 'AccessibleFormatRequiredIndicator'
	-- ORDER BY CedsOptionSetCode
	VALUES ('Yes', 'Yes'), ('No', 'No'), ('Unknown', 'Unknown')

	IF OBJECT_ID('tempdb..#AccessibleFormatTypeCode') IS NOT NULL
		DROP TABLE #AccessibleFormatTypeCode

	CREATE TABLE #AccessibleFormatTypeCode (AccessibleFormatTypeCodeCode VARCHAR(50), AccessibleFormatTypeCodeDescription VARCHAR(200))

	INSERT INTO #AccessibleFormatTypeCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #AccessibleFormatTypeCode 
	-- Temprary until we get the correct data
	-- SELECT 
	-- 		CedsOptionSetCode
	-- 		, CedsOptionSetDescription
	-- FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	-- WHERE CedsElementTechnicalName = 'AccessibleFormatType'
	-- ORDER BY CedsOptionSetCode
	VALUES ('Video with Synchronized American Sign Language', 'Video with Synchronized American Sign Language'),
		   ('Text Transcripts of Audio', 'Text Transcripts of Audio'),
		   ('Tactile Graphics', 'Tactile Graphics'),
		   ('Large Print', 'Large Print'),
		   ('Audio', 'Audio'),
		   ('Audio Described Video', 'Audio Described Video'),
		   ('Braille', 'Braille'),
		   ('Digital Text', 'Digital Text'),
		   ('Captioned Video', 'Captioned Video')

	-- Insert into DimAccessibleEducationMaterialStatuses table
	INSERT INTO [RDS].[DimAccessibleEducationMaterialStatuses] (
		[AccessibleFormatIssuedIndicatorCode],
		[AccessibleFormatIssuedIndicatorDescription],
		[AccessibleFormatRequiredIndicatorCode],
		[AccessibleFormatRequiredIndicatorDescription],
		[AccessibleFormatTypeCode],
		[AccessibleFormatTypeDescription]
	)
	SELECT
		afi.AccessibleFormatIssuedIndicatorCode,
		afi.AccessibleFormatIssuedIndicatorDescription,
		afri.AccessibleFormatRequiredIndicatorCodeCode,
		afri.AccessibleFormatRequiredIndicatorCodeDescription,
		aftc.AccessibleFormatTypeCodeCode,
		aftc.AccessibleFormatTypeCodeDescription
	FROM
		#AccessibleFormatIssuedIndicatorCode afi
		CROSS JOIN #AccessibleFormatRequiredIndicatorCode afri
		CROSS JOIN #AccessibleFormatTypeCode aftc

	-- Drop temp tables
	DROP TABLE #AccessibleFormatIssuedIndicatorCode
	DROP TABLE #AccessibleFormatRequiredIndicatorCode
	DROP TABLE #AccessibleFormatTypeCode
	

	PRINT 'Populate DimCredentialAwardStatuses'
	------------------------------------------------------------------------------
	-- Populate DimCredentialAwardStatuses --
	------------------------------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM rds.DimCredentialAwardStatuses d WHERE d.DimCredentialAwardStatusId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimCredentialAwardStatuses ON

			INSERT INTO rds.DimCredentialAwardStatuses(
						DimCredentialAwardStatusId
						, CredentialRevokedIndicatorCode
						, CredentialRevokedIndicatorDescription
						, CredentialRevokedReasonCode
						, CredentialRevokedReasonDescription
						, AdultEducationCertificationTypeCode
						, AdultEducationCertificationTypeDescription
						, CredentialSuspensionIndicatorCode
						, CredentialSuspensionIndicatorDescription
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

		SET IDENTITY_INSERT rds.DimCredentialAwardStatuses OFF
	END

	IF OBJECT_ID('tempdb..#CredentialRevokedIndicatorCode') IS NOT NULL
		DROP TABLE #CredentialRevokedIndicatorCode

	CREATE TABLE #CredentialRevokedIndicatorCode (CredentialRevokedIndicatorCode VARCHAR(50), CredentialRevokedIndicatorDescription VARCHAR(200))

	INSERT INTO #CredentialRevokedIndicatorCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #CredentialRevokedIndicatorCode 
	SELECT 
		CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CredentialRevokedIndicator'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#CredentialRevokedReasonCode') IS NOT NULL
		DROP TABLE #CredentialRevokedReasonCode

	CREATE TABLE #CredentialRevokedReasonCode (CredentialRevokedReasonCode VARCHAR(50), CredentialRevokedReasonDescription VARCHAR(200))

	INSERT INTO #CredentialRevokedReasonCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #CredentialRevokedReasonCode 
	SELECT 
		CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CredentialRevokedReason'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#AdultEducationCertificationTypeCode') IS NOT NULL
		DROP TABLE #AdultEducationCertificationTypeCode

	CREATE TABLE #AdultEducationCertificationTypeCode (AdultEducationCertificationTypeCode VARCHAR(50), AdultEducationCertificationTypeDescription VARCHAR(200))

	INSERT INTO #AdultEducationCertificationTypeCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #AdultEducationCertificationTypeCode 
	SELECT 
		CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AdultEducationCertificationType'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#CredentialSuspensionIndicatorCode') IS NOT NULL
		DROP TABLE #CredentialSuspensionIndicatorCode

	CREATE TABLE #CredentialSuspensionIndicatorCode (CredentialSuspensionIndicatorCode VARCHAR(50), CredentialSuspensionIndicatorDescription VARCHAR(200))

	INSERT INTO #CredentialSuspensionIndicatorCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #CredentialSuspensionIndicatorCode 
	VALUES ('Yes', 'Yes'), ('No', 'No')

	-- Uncomment when Credential Suspension Indicator is officially available in the CEDS-Elements database
	-- SELECT 
	-- 	  CedsOptionSetCode
	-- 	, CedsOptionSetDescription
	-- FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	-- WHERE CedsElementTechnicalName = 'CredentialSuspensionIndicator'
	-- ORDER BY CedsOptionSetCode


	INSERT INTO rds.DimCredentialAwardStatuses(
				CredentialRevokedIndicatorCode
				, CredentialRevokedIndicatorDescription
				, CredentialRevokedReasonCode
				, CredentialRevokedReasonDescription
				, AdultEducationCertificationTypeCode
				, AdultEducationCertificationTypeDescription
				, CredentialSuspensionIndicatorCode
				, CredentialSuspensionIndicatorDescription
			)
		SELECT 
				cric.CredentialRevokedIndicatorCode
				,cric.CredentialRevokedIndicatorDescription
				,crr.CredentialRevokedReasonCode
				,crr.CredentialRevokedReasonDescription
				,aec.AdultEducationCertificationTypeCode
				,aec.AdultEducationCertificationTypeDescription
				,csic.CredentialSuspensionIndicatorCode
				,csic.CredentialSuspensionIndicatorDescription
		FROM #CredentialRevokedIndicatorCode cric
		CROSS JOIN #CredentialRevokedReasonCode crr
		CROSS JOIN #AdultEducationCertificationTypeCode aec
		CROSS JOIN #CredentialSuspensionIndicatorCode csic
		LEFT JOIN rds.DimCredentialAwardStatuses cas
			ON	cric.CredentialRevokedIndicatorCode = cas.CredentialRevokedIndicatorCode								
			AND crr.CredentialRevokedReasonCode = cas.CredentialRevokedReasonCode
			AND aec.AdultEducationCertificationTypeCode = cas.AdultEducationCertificationTypeCode
			AND csic.CredentialSuspensionIndicatorCode = cas.CredentialSuspensionIndicatorCode
		WHERE cas.DimCredentialAwardStatusId IS NULL

	DROP TABLE #CredentialRevokedIndicatorCode
	DROP TABLE #CredentialRevokedReasonCode
	DROP TABLE #AdultEducationCertificationTypeCode
	DROP TABLE #CredentialSuspensionIndicatorCode


	PRINT 'Populate DimOnetSocOccupationTypes'
	------------------------------------------------------------------------------
	-- Populate DimOnetSocOccupationTypes --
	------------------------------------------------------------------------------

	-- Create temp table for DimOnetSocOccupationTypes
	IF OBJECT_ID('tempdb..#OnetSocOccupationTypeCode') IS NOT NULL
		DROP TABLE #OnetSocOccupationTypeCode

	CREATE TABLE #OnetSocOccupationTypeCode (OnetSocOccupationTypeCode VARCHAR(100), OnetSocOccupationTypeDescription VARCHAR(4000))

	-- Insert -1 record into temp table
	INSERT INTO #OnetSocOccupationTypeCode VALUES ('MISSING', 'MISSING')

	-- Insert values from CEDS-Elements database into temp table
	INSERT INTO #OnetSocOccupationTypeCode 
	SELECT 
		CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'OnetSocOccupationType'
	ORDER BY CedsOptionSetCode

	-- Insert into DimOnetSocOccupationTypes table
	INSERT INTO [RDS].[DimOnetSocOccupationTypes](
		[OnetSocOccupationTypeCode]
		, [OnetSocOccupationTypeDescription]
	)
	SELECT 
		osc.OnetSocOccupationTypeCode
		, osc.OnetSocOccupationTypeDescription
	FROM #OnetSocOccupationTypeCode osc
	LEFT JOIN [RDS].[DimOnetSocOccupationTypes] dot
		ON osc.OnetSocOccupationTypeCode = dot.OnetSocOccupationTypeCode
	WHERE dot.[DimOnetSocOccupationTypeId] IS NULL

	-- Drop temp table
	DROP TABLE #OnetSocOccupationTypeCode


	PRINT 'Populate DimK12EmploymentStatuses'
	------------------------------------------------------------------------------
	-- Populate DimK12EmploymentStatuses --
	------------------------------------------------------------------------------

	-- Create temp tables for all elements
	IF OBJECT_ID('tempdb..#EmploymentStatusCode') IS NOT NULL
		DROP TABLE #EmploymentStatusCode

	CREATE TABLE #EmploymentStatusCode (EmploymentStatusCode VARCHAR(50), EmploymentStatusDescription VARCHAR(200))

	INSERT INTO #EmploymentStatusCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #EmploymentStatusCode
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EmploymentStatus'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#EmploymentSeparationReasonCode') IS NOT NULL
		DROP TABLE #EmploymentSeparationReasonCode

	CREATE TABLE #EmploymentSeparationReasonCode (EmploymentSeparationReasonCode VARCHAR(50), EmploymentSeparationReasonDescription VARCHAR(200))

	INSERT INTO #EmploymentSeparationReasonCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #EmploymentSeparationReasonCode
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EmploymentSeparationReason'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#TitleITargetedAssistanceStaffFundedCode') IS NOT NULL
		DROP TABLE #TitleITargetedAssistanceStaffFundedCode

	CREATE TABLE #TitleITargetedAssistanceStaffFundedCode (TitleITargetedAssistanceStaffFundedCode VARCHAR(50), TitleITargetedAssistanceStaffFundedDescription VARCHAR(200))

	INSERT INTO #TitleITargetedAssistanceStaffFundedCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #TitleITargetedAssistanceStaffFundedCode
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TitleITargetedAssistanceStaffFunded'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#MEPPersonnelIndicatorCode') IS NOT NULL
		DROP TABLE #MEPPersonnelIndicatorCode

	CREATE TABLE #MEPPersonnelIndicatorCode (MEPPersonnelIndicatorCode VARCHAR(50), MEPPersonnelIndicatorDescription VARCHAR(200))

	INSERT INTO #MEPPersonnelIndicatorCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #MEPPersonnelIndicatorCode
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MEPPersonnelIndicatorCode'
	ORDER BY CedsOptionSetCode

	-- Insert into DimK12EmploymentStatuses table
	INSERT INTO [RDS].[DimK12EmploymentStatuses](
		[EmploymentStatusCode]
		, [EmploymentStatusDescription]
		, [EmploymentSeparationReasonCode]
		, [EmploymentSeparationReasonDescription]
		, [TitleITargetedAssistanceStaffFundedCode]
		, [TitleITargetedAssistanceStaffFundedDescription]
		, [MEPPersonnelIndicatorCode]
		, [MEPPersonnelIndicatorDescription]
	)
	SELECT 
		esc.EmploymentStatusCode
		, esc.EmploymentStatusDescription
		, esrc.EmploymentSeparationReasonCode
		, esrc.EmploymentSeparationReasonDescription
		, tiasfc.TitleITargetedAssistanceStaffFundedCode
		, tiasfc.TitleITargetedAssistanceStaffFundedDescription
		, mic.MEPPersonnelIndicatorCode
		, mic.MEPPersonnelIndicatorDescription
	FROM #EmploymentStatusCode esc
	CROSS JOIN #EmploymentSeparationReasonCode esrc
	CROSS JOIN #TitleITargetedAssistanceStaffFundedCode tiasfc
	CROSS JOIN #MEPPersonnelIndicatorCode mic
	LEFT JOIN [RDS].[DimK12EmploymentStatuses] kes
		ON esc.EmploymentStatusCode = kes.EmploymentStatusCode
		AND esrc.EmploymentSeparationReasonCode = kes.EmploymentSeparationReasonCode
		AND tiasfc.TitleITargetedAssistanceStaffFundedCode = kes.TitleITargetedAssistanceStaffFundedCode
		AND mic.MEPPersonnelIndicatorCode = kes.MEPPersonnelIndicatorCode
	WHERE kes.DimK12EmploymentStatusId IS NULL

	-- Drop temp tables
	DROP TABLE #EmploymentStatusCode
	DROP TABLE #EmploymentSeparationReasonCode
	DROP TABLE #TitleITargetedAssistanceStaffFundedCode
	DROP TABLE #MEPPersonnelIndicatorCode


	PRINT 'Populate DimK12StaffAssignmentStatuses'
	------------------------------------------------------------------------------
	-- Populate DimK12StaffAssignmentStatuses --
	------------------------------------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM rds.DimK12StaffAssignmentStatuses d WHERE d.DimK12StaffAssignmentStatusId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimK12StaffAssignmentStatuses ON

			INSERT INTO rds.DimK12StaffAssignmentStatuses (
						[DimK12StaffAssignmentStatusId]
						, [ItinerantTeacherCode]
						, [ItinerantTeacherDescription]
						, [ClassroomPositionTypeCode]
						, [ClassroomPositionTypeDescription]
						, [PrimaryAssignmentIndicatorCode]
						, [PrimaryAssignmentIndicatorDescription]
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')

		SET IDENTITY_INSERT rds.DimK12StaffAssignmentStatuses OFF
	END

	-- Create temp tables for all elements
	IF OBJECT_ID('tempdb..#ItinerantTeacherCode') IS NOT NULL
		DROP TABLE #ItinerantTeacherCode

	CREATE TABLE #ItinerantTeacherCode (ItinerantTeacherCode VARCHAR(50), ItinerantTeacherDescription VARCHAR(200))

	INSERT INTO #ItinerantTeacherCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #ItinerantTeacherCode
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ItinerantTeacher'
	ORDER BY CedsOptionSetCode

	-- Create temp tables for all elements
	IF OBJECT_ID('tempdb..#ClassroomPositionType') IS NOT NULL
		DROP TABLE #ClassroomPositionType

	CREATE TABLE #ClassroomPositionType (ClassroomPositionTypeCode VARCHAR(50), ClassroomPositionTypeDescription VARCHAR(200))

	INSERT INTO #ClassroomPositionType VALUES ('MISSING', 'MISSING')
	INSERT INTO #ClassroomPositionType
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ClassroomPositionType'
	ORDER BY CedsOptionSetCode

	-- Create temp tables for all elements
	IF OBJECT_ID('tempdb..#PrimaryAssignmentIndicator') IS NOT NULL
		DROP TABLE #PrimaryAssignmentIndicator

	CREATE TABLE #PrimaryAssignmentIndicator (PrimaryAssignmentIndicatorCode VARCHAR(50), PrimaryAssignmentIndicatorDescription VARCHAR(200))

	INSERT INTO #PrimaryAssignmentIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #PrimaryAssignmentIndicator
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PrimaryAssignmentIndicator'
	ORDER BY CedsOptionSetCode

	-- Insert into DimK12PositionStatuses table
	INSERT INTO [RDS].[DimK12StaffAssignmentStatuses] (
		[ItinerantTeacherCode]
		, [ItinerantTeacherDescription]
		, [ClassroomPositionTypeCode]
		, [ClassroomPositionTypeDescription]
		, [PrimaryAssignmentIndicatorCode]
		, [PrimaryAssignmentIndicatorDescription]
	)
	SELECT 
		itc.ItinerantTeacherCode
		, itc.ItinerantTeacherDescription
		, cpt.ClassroomPositionTypeCode
		, cpt.ClassroomPositionTypeDescription
		, pai.PrimaryAssignmentIndicatorCode
		, pai.PrimaryAssignmentIndicatorDescription
	FROM #ItinerantTeacherCode itc
	CROSS JOIN #ClassroomPositionType cpt
	CROSS JOIN #PrimaryAssignmentIndicator pai
	LEFT JOIN [RDS].[DimK12StaffAssignmentStatuses] kps
		ON itc.ItinerantTeacherCode = kps.ItinerantTeacherCode
		AND cpt.ClassroomPositionTypeCode = kps.ClassroomPositionTypeCode
		AND pai.PrimaryAssignmentIndicatorCode = kps.PrimaryAssignmentIndicatorCode
	WHERE kps.DimK12StaffAssignmentStatusId IS NULL

	-- Drop temp tables
	DROP TABLE #ItinerantTeacherCode
	DROP TABLE #ClassroomPositionType
	DROP TABLE #PrimaryAssignmentIndicator


------------------------------------------------------------------------------
-- Populate DimK12CourseSectionStatuses --
------------------------------------------------------------------------------

IF NOT EXISTS (SELECT 1 FROM rds.DimK12CourseSectionStatuses d WHERE d.DimK12CourseSectionStatusId = -1) BEGIN
	SET IDENTITY_INSERT rds.DimK12CourseSectionStatuses ON

		INSERT INTO rds.DimK12CourseSectionStatuses(
					  DimK12CourseSectionStatusId
					, BlendedLearningModelTypeCode
					, BlendedLearningModelTypeDescription
					, CourseInteractionModeCode
					, CourseInteractionModeDescription
					, CourseSectionAssessmentReportingMethodCode
					, CourseSectionAssessmentReportingMethodDescription
					, CourseSectionInstructionalDeliveryModeCode
					, CourseSectionInstructionalDeliveryModeDescription
					, ReceivingLocationOfInstructionCode
					, ReceivingLocationOfInstructionDescription
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
				, 'MISSING')

	SET IDENTITY_INSERT rds.DimK12CourseSectionStatuses OFF
END

-- Create temp tables for all elements
IF OBJECT_ID('tempdb..#BlendedLearningModelType') IS NOT NULL
	DROP TABLE #BlendedLearningModelType

CREATE TABLE #BlendedLearningModelType (BlendedLearningModelTypeCode VARCHAR(50), BlendedLearningModelTypeDescription VARCHAR(200))

INSERT INTO #BlendedLearningModelType VALUES ('MISSING', 'MISSING')
INSERT INTO #BlendedLearningModelType
SELECT 
		CedsOptionSetCode
	, CedsOptionSetDescription
FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
WHERE CedsElementTechnicalName = 'BlendedLearningModelType'
ORDER BY CedsOptionSetCode

-- Create temp tables for all elements
IF OBJECT_ID('tempdb..#CourseInteractionMode') IS NOT NULL
	DROP TABLE #CourseInteractionMode

CREATE TABLE #CourseInteractionMode (CourseInteractionModeCode VARCHAR(50), CourseInteractionModeDescription VARCHAR(200))

INSERT INTO #CourseInteractionMode VALUES ('MISSING', 'MISSING')
INSERT INTO #CourseInteractionMode
SELECT 
		CedsOptionSetCode
	, CedsOptionSetDescription
FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
WHERE CedsElementTechnicalName = 'CourseInteractionMode'
ORDER BY CedsOptionSetCode

-- Create temp tables for all elements
IF OBJECT_ID('tempdb..#CourseSectionAssessmentReportingMethod') IS NOT NULL
	DROP TABLE #CourseSectionAssessmentReportingMethod

CREATE TABLE #CourseSectionAssessmentReportingMethod (CourseSectionAssessmentReportingMethodCode VARCHAR(50), CourseSectionAssessmentReportingMethodDescription VARCHAR(200))

INSERT INTO #CourseSectionAssessmentReportingMethod VALUES ('MISSING', 'MISSING')
INSERT INTO #CourseSectionAssessmentReportingMethod
SELECT 
		CedsOptionSetCode
	, CedsOptionSetDescription
FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
WHERE CedsElementTechnicalName = 'CourseSectionAssessmentReportingMethod'
ORDER BY CedsOptionSetCode

-- Create temp tables for all elements
IF OBJECT_ID('tempdb..#CourseSectionInstructionalDeliveryMode') IS NOT NULL
	DROP TABLE #CourseSectionInstructionalDeliveryMode

CREATE TABLE #CourseSectionInstructionalDeliveryMode (CourseSectionInstructionalDeliveryModeCode VARCHAR(50), CourseSectionInstructionalDeliveryModeDescription VARCHAR(200))

INSERT INTO #CourseSectionInstructionalDeliveryMode VALUES ('MISSING', 'MISSING')
INSERT INTO #CourseSectionInstructionalDeliveryMode
SELECT 
		CedsOptionSetCode
	, CedsOptionSetDescription
FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
WHERE CedsElementTechnicalName = 'CourseSectionInstructionalDeliveryMode'
ORDER BY CedsOptionSetCode

-- Create temp tables for all elements
IF OBJECT_ID('tempdb..#ReceivingLocationOfInstruction') IS NOT NULL
	DROP TABLE #ReceivingLocationOfInstruction

CREATE TABLE #ReceivingLocationOfInstruction (ReceivingLocationOfInstructionCode VARCHAR(50), ReceivingLocationOfInstructionDescription VARCHAR(200))

INSERT INTO #ReceivingLocationOfInstruction VALUES ('MISSING', 'MISSING')
INSERT INTO #ReceivingLocationOfInstruction
SELECT 
		CedsOptionSetCode
	, CedsOptionSetDescription
FROM [CEDS-Elements-V11.0.0.0].[CEDS].CedsOptionSetMapping
WHERE CedsElementTechnicalName = 'ReceivingLocationOfInstruction'
ORDER BY CedsOptionSetCode

-- Insert into DimK12CourseSectionStatuses table
INSERT INTO [RDS].[DimK12CourseSectionStatuses](
	[BlendedLearningModelTypeCode]
	, [BlendedLearningModelTypeDescription]
	, [CourseInteractionModeCode]
	, [CourseInteractionModeDescription]
	, [CourseSectionAssessmentReportingMethodCode]
	, [CourseSectionAssessmentReportingMethodDescription]
	, [CourseSectionInstructionalDeliveryModeCode]
	, [CourseSectionInstructionalDeliveryModeDescription]
	, [ReceivingLocationOfInstructionCode]
	, [ReceivingLocationOfInstructionDescription]
)
SELECT 
	blmt.BlendedLearningModelTypeCode
	, blmt.BlendedLearningModelTypeDescription
	, cim.CourseInteractionModeCode
	, cim.CourseInteractionModeDescription
	, csarm.CourseSectionAssessmentReportingMethodCode
	, csarm.CourseSectionAssessmentReportingMethodDescription
	, csidm.CourseSectionInstructionalDeliveryModeCode
	, csidm.CourseSectionInstructionalDeliveryModeDescription
	, rloi.ReceivingLocationOfInstructionCode
	, rloi.ReceivingLocationOfInstructionDescription
FROM #BlendedLearningModelType blmt
CROSS JOIN #CourseInteractionMode cim
CROSS JOIN #CourseSectionAssessmentReportingMethod csarm
CROSS JOIN #CourseSectionInstructionalDeliveryMode csidm
CROSS JOIN #ReceivingLocationOfInstruction rloi
LEFT JOIN [RDS].[DimK12CourseSectionStatuses] kcs
	ON blmt.BlendedLearningModelTypeCode = kcs.BlendedLearningModelTypeCode
	AND cim.CourseInteractionModeCode = kcs.CourseInteractionModeCode
	AND csarm.CourseSectionAssessmentReportingMethodCode = kcs.CourseSectionAssessmentReportingMethodCode
	AND csidm.CourseSectionInstructionalDeliveryModeCode = kcs.CourseSectionInstructionalDeliveryModeCode
	AND rloi.ReceivingLocationOfInstructionCode = kcs.ReceivingLocationOfInstructionCode
WHERE kcs.DimK12CourseSectionStatusId IS NULL

-- Drop temp tables
DROP TABLE #BlendedLearningModelType
DROP TABLE #CourseInteractionMode
DROP TABLE #CourseSectionAssessmentReportingMethod
DROP TABLE #CourseSectionInstructionalDeliveryMode
DROP TABLE #ReceivingLocationOfInstruction





	------------------------------------------------
	-- Populate DimScedCodes					  --
	------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimScedCodes d WHERE d.DimScedCodeId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimScedCodes ON

		INSERT INTO RDS.DimScedCodes 
		(DimScedCodeId,ScedCourseCode,ScedCourseTitle,ScedCourseCodeDescription,ScedCourseLevelCode,ScedCourseLevelDescription,ScedCourseSubjectAreaCode,ScedCourseSubjectAreaDescription,ScedGradeSpan,ScedSequenceOfCourse)
		VALUES (-1,'-1','MISSING','MISSING','MISSING','MISSING','MISSING','MISSING','-1','MISSING')

		SET IDENTITY_INSERT RDS.DimScedCodes OFF
	END

	IF OBJECT_ID('tempdb..#ScedCodes') IS NOT NULL
		DROP TABLE #ScedCodes

	CREATE TABLE #ScedCodes (
		  ScedCourseCode NVARCHAR(100)
		, ScedCourseTitle NVARCHAR(255)
	)

	INSERT INTO #ScedCodes
	VALUES 
	('01001', 'English/Language Arts I (9th grade)'),
	('01002', 'English/Language Arts II (10th grade)'),
	('01003', 'English/Language Arts III (11th grade)'),
	('01004', 'English/Language Arts IV (12th grade)'),
	('01005', 'AP English Language and Composition'),
	('01006', 'AP English Literature and Composition'),
	('01007', 'IB Language A: Literature—English'),
	('01008', 'English as a Second Language'),
	('01009', 'Language Arts Laboratory'),
	('01010', 'IB Language A (English), Middle Years Program'),
	('01011', 'IB Language A: Language and Literature—English'),
	('01012', 'IB Literature and Performance'),
	('01013', 'AP Seminar: English'),
	('01014', 'CI English Language'),
	('01026', 'Language Arts (early childhood education)'),
	('01027', 'Language Arts (pre-kindergarten)'),
	('01028', 'Language Arts (kindergarten)'),
	('01029', 'Language Arts (grade 1)'),
	('01030', 'Language Arts (grade 2)'),
	('01031', 'Language Arts (grade 3)'),
	('01032', 'Language Arts (grade 4)'),
	('01033', 'Language Arts (grade 5)'),
	('01034', 'Language Arts (grade 6)'),
	('01035', 'Language Arts (grade 7)'),
	('01036', 'Language Arts (grade 8)'),
	('01037', 'Language Arts—General'),
	('01038', 'Reading (early childhood education)'),
	('01039', 'Reading (pre-kindergarten)'),
	('01040', 'Reading (kindergarten)'),
	('01041', 'Reading (grade 1)'),
	('01042', 'Reading (grade 2)'),
	('01043', 'Reading (grade 3)'),
	('01044', 'Reading (grade 4)'),
	('01045', 'Reading (grade 5)'),
	('01046', 'Reading (grade 6)'),
	('01047', 'Reading (grade 7)'),
	('01048', 'Reading (grade 8)'),
	('01049', 'Reading—General'),
	('01051', 'English/Literature (freshmen and sophomores)'),
	('01052', 'English/Literature (juniors and seniors)'),
	('01053', 'Literature'),
	('01054', 'American Literature'),
	('01055', 'American Literature/History'),
	('01056', 'British Literature'),
	('01057', 'British Literature/History'),
	('01058', 'World Literature'),
	('01059', 'Biblical Literature'),
	('01060', 'Literature of an Author'),
	('01061', 'Literature of a Genre'),
	('01062', 'Literature of a Period'),
	('01063', 'Literature of a Place'),
	('01064', 'Literature of a People'),
	('01065', 'Literature of a Theme'),
	('01066', 'Strategic Reading'),
	('01067', 'Assisted Reading'),
	('01068', 'Corrective Reading'),
	('01069', 'Mythology'),
	('01070', 'CI English Literature'),
	('01097', 'Literature—Independent Study'),
	('01098', 'Literature—Workplace Experience'),
	('01099', 'Literature—Other'),
	('01101', 'English/Composition (freshmen and sophomores)'),
	('01102', 'English/Composition (juniors and seniors)'),
	('01103', 'Composition'),
	('01104', 'Creative Writing'),
	('01105', 'Research/Technical Writing'),
	('01106', 'CI English General Paper'),
	('01128', 'Writing (early childhood education)'),
	('01129', 'Writing (pre-kindergarten)'),
	('01130', 'Writing (kindergarten)'),
	('01131', 'Writing (grade 1)'),
	('01132', 'Writing (grade 2)'),
	('01133', 'Writing (grade 3)'),
	('01134', 'Writing (grade 4)'),
	('01135', 'Writing (grade 5)'),
	('01136', 'Writing (grade 6)'),
	('01137', 'Writing (grade 7)'),
	('01138', 'Writing (grade 8)'),
	('01139', 'Writing—General'),
	('01147', 'Composition—Independent Study'),
	('01148', 'Composition—Workplace Experience'),
	('01149', 'Composition—Other'),
	('01151', 'Public Speaking'),
	('01152', 'Forensic Speech—Inclusive'),
	('01153', 'Forensic Speech—Debate'),
	('01154', 'Forensic Speech—Individual Event'),
	('01155', 'Communications'),
	('01156', 'Applied English and Communications'),
	('01197', 'Speech—Independent Study'),
	('01198', 'Speech—Workplace Experience'),
	('01199', 'Speech—Other'),
	('01201', 'English Morphology and Grammar'),
	('01202', 'History of the English Language'),
	('01203', 'English—Test Preparation'),
	('01204', 'English Grammar'),
	('01992', 'English Proficiency Development'),
	('01995', 'English Language and Literature—Aide'),
	('01996', 'English Language and Literature—Supplemental'),
	('01997', 'English Language and Literature—Independent Study'),
	('01998', 'English Language and Literature—Workplace Experience'),
	('01999', 'English Language and Literature—Other'),
	('02001', 'Informal Mathematics'),
	('02002', 'General Mathematics'),
	('02003', 'Particular Topics in Foundation Mathematics'),
	('02028', 'Mathematics (early childhood education)'),
	('02029', 'Mathematics (pre-kindergarten)'),
	('02030', 'Mathematics (kindergarten)'),
	('02031', 'Mathematics (grade 1)'),
	('02032', 'Mathematics (grade 2)'),
	('02033', 'Mathematics (grade 3)'),
	('02034', 'Mathematics (grade 4)'),
	('02035', 'Mathematics (grade 5)'),
	('02036', 'Mathematics (grade 6)'),
	('02037', 'Mathematics (grade 7)'),
	('02038', 'Mathematics (grade 8)'),
	('02039', 'Mathematics—General'),
	('02047', 'Foundation Mathematics—Independent Study'),
	('02049', 'Foundation Mathematics—Other'),
	('02051', 'Pre-Algebra'),
	('02052', 'Algebra I'),
	('02053', 'Algebra I—Part 1'),
	('02054', 'Algebra I—Part 2'),
	('02055', 'Transition Algebra'),
	('02056', 'Algebra II'),
	('02057', 'Algebra III'),
	('02058', 'Particular Topics in Algebra'),
	('02061', 'Integrated Math—multi-year equivalent'),
	('02062', 'Integrated Mathematics I'),
	('02063', 'Integrated Mathematics II'),
	('02064', 'Integrated Mathematics III'),
	('02065', 'Integrated Mathematics IV'),
	('02069', 'Algebra—Other'),
	('02071', 'Informal Geometry'),
	('02072', 'Geometry'),
	('02073', 'Analytic Geometry'),
	('02074', 'Principles of Algebra and Geometry'),
	('02075', 'Particular Topics in Geometry'),
	('02079', 'Geometry—Other'),
	('02101', 'Number Theory'),
	('02102', 'Discrete Mathematics'),
	('02103', 'Trigonometry'),
	('02104', 'Mathematic Analysis '),
	('02105', 'Trigonometry/Mathematic Analysis '),
	('02106', 'Trigonometry/Algebra'),
	('02107', 'Trigonometry/Analytic Geometry'),
	('02108', 'Mathematic Analysis/Analytic Geometry '),
	('02109', 'Elementary Functions'),
	('02110', 'Pre-Calculus'),
	('02111', 'Linear Algebra'),
	('02112', 'Linear Programming'),
	('02113', 'Abstract Algebra'),
	('02114', 'AP Precalculus'),
	('02121', 'Calculus'),
	('02122', 'Multivariate Calculus'),
	('02123', 'Differential Calculus'),
	('02124', 'AP Calculus AB'),
	('02125', 'AP Calculus BC'),
	('02126', 'Particular Topics in Calculus'),
	('02131', 'IB Mathematical Studies'),
	('02132', 'IB Mathematics'),
	('02133', 'IB Mathematics and Computing—SL '),
	('02134', 'IB Further Mathematics'),
	('02135', 'IB Mathematics, Middle Years Program'),
	('02136', 'Finite Mathematics'),
	('02137', 'Mathematical Modeling'),
	('02138', 'College Mathematics Preparation'),
	('02139', 'IB Mathematics: Applications and Interpretation'),
	('02140', 'IB Mathematics: Analysis and Approaches'),
	('02141', 'Particular Topics in Analytic Mathematics'),
	('02149', 'Analytic Mathematics—Other'),
	('02151', 'General Applied Mathematics '),
	('02152', 'Occupationally Applied Mathematics '),
	('02153', 'Technical Mathematics '),
	('02154', 'Business Mathematics '),
	('02155', 'Business Mathematics with Algebra '),
	('02156', 'Computer Mathematics with Algebra '),
	('02157', 'Consumer Mathematics '),
	('02158', 'Quantitative Reasoning'),
	('02201', 'Probability and Statistics'),
	('02202', 'Inferential Probability and Statistics'),
	('02203', 'AP Statistics'),
	('02204', 'Particular Topics in Probability and Statistics'),
	('02205', 'Statistics'),
	('02207', 'Probability and Statistics—Independent Study'),
	('02209', 'Probability and Statistics—Other'),
	('02991', 'History of Mathematics '),
	('02993', 'Mathematics—Test Preparation'),
	('02994', 'Mathematics Proficiency Development'),
	('02995', 'Mathematics—Aide'),
	('02996', 'Mathematics—Supplemental'),
	('02997', 'Mathematics—Independent Study'),
	('02998', 'Mathematics—Workplace Experience'),
	('02999', 'Mathematics—Other'),
	('03001', 'Earth Science'),
	('03002', 'Geology'),
	('03003', 'Environmental Science'),
	('03004', 'Astronomy'),
	('03005', 'Marine Science'),
	('03006', 'Meteorology'),
	('03007', 'Physical Geography'),
	('03008', 'Earth and Space Science'),
	('03009', 'Particular Topics in Earth Science'),
	('03010', 'Earth/Space Science (prior-to-secondary)'),
	('03011', 'Physical Science (prior-to-secondary)'),
	('03012', 'Energy and the Environment'),
	('03013', 'CI Marine Science'),
	('03047', 'Earth Science—Independent Study'),
	('03048', 'Earth Science—Workplace Experience'),
	('03049', 'Earth Science—Other'),
	('03051', 'Biology'),
	('03052', 'Biology—Advanced Studies'),
	('03053', 'Anatomy and Physiology'),
	('03054', 'Anatomy'),
	('03055', 'Physiology'),
	('03056', 'AP Biology'),
	('03057', 'IB Biology'),
	('03058', 'Botany'),
	('03059', 'Genetics'),
	('03060', 'Microbiology'),
	('03061', 'Zoology'),
	('03062', 'Conceptual Biology'),
	('03063', 'Particular Topics in Biology'),
	('03064', 'Regional Biology'),
	('03065', 'IB Sports, Exercise, and Health Science'),
	('03066', 'PLTW Principles of Biomedical Science'),
	('03067', 'PLTW Human Body Systems'),
	('03068', 'PLTW Medical Interventions'),
	('03069', 'Nutrition Science'),
	('03070', 'PLTW Biomedical Innovation'),
	('03097', 'Biology—Independent Study'),
	('03098', 'Biology—Workplace Experience'),
	('03099', 'Biology—Other'),
	('03101', 'Chemistry'),
	('03102', 'Chemistry—Advanced Studies'),
	('03103', 'Organic Chemistry'),
	('03104', 'Physical Chemistry'),
	('03105', 'Conceptual Chemistry'),
	('03106', 'AP Chemistry'),
	('03107', 'IB Chemistry'),
	('03108', 'Particular Topics in Chemistry'),
	('03147', 'Chemistry—Independent Study'),
	('03148', 'Chemistry—Workplace Experience'),
	('03149', 'Chemistry—Other'),
	('03151', 'Physics'),
	('03152', 'Physics—Advanced Studies'),
	('03153', 'Principles of Technology'),
	('03155', 'AP Physics B'),
	('03156', 'AP Physics C'),
	('03157', 'IB Physics'),
	('03158', 'Life Science'),
	('03159', 'Physical Science'),
	('03160', 'IB Physical Science'),
	('03161', 'Conceptual Physics'),
	('03162', 'Particular Topics in Physics'),
	('03163', 'AP Physics C: Electricity and Magnetism'),
	('03164', 'AP Physics C: Mechanics'),
	('03165', 'AP Physics 1'),
	('03166', 'AP Physics 2'),
	('03197', 'Physics—Independent Study'),
	('03198', 'Physics—Workplace Experience'),
	('03199', 'Physics—Other'),
	('03201', 'Integrated Science'),
	('03202', 'Unified Science'),
	('03203', 'Applied Biology/Chemistry'),
	('03204', 'Technological Inquiry'),
	('03205', 'Origins of Science'),
	('03206', 'IB Design Technology'),
	('03207', 'AP Environmental Science'),
	('03208', 'IB Environmental Systems and Societies'),
	('03209', 'Aerospace'),
	('03210', 'Science, Technology and Society'),
	('03211', 'Technical Science'),
	('03212', 'Scientific Research and Design'),
	('03213', 'IB Sciences, Middle Years Program'),
	('03214', 'Forensic Laboratory Science'),
	('03228', 'Science (early childhood education)'),
	('03229', 'Science (pre-kindergarten)'),
	('03230', 'Science (kindergarten)'),
	('03231', 'Science (grade 1)'),
	('03232', 'Science (grade 2)'),
	('03233', 'Science (grade 3)'),
	('03234', 'Science (grade 4)'),
	('03235', 'Science (grade 5)'),
	('03236', 'Science (grade 6)'),
	('03237', 'Science (grade 7)'),
	('03238', 'Science (grade 8)'),
	('03239', 'Science—General'),
	('03994', 'Life and Physical Sciences—Proficiency Development'),
	('03995', 'Life and Physical Sciences—Aide'),
	('03996', 'Life and Physical Sciences—Supplemental'),
	('03997', 'Life and Physical Sciences—Independent Study'),
	('03998', 'Life and Physical Sciences—Workplace Experience'),
	('03999', 'Life and Physical Sciences—Other'),
	('04001', 'World Geography'),
	('04002', 'Particular Topics in Geography'),
	('04003', 'IB Geography'),
	('04004', 'AP Human Geography'),
	('04005', 'U.S. Geography'),
	('04047', 'Geography—Independent Study'),
	('04048', 'Geography—Workplace Experience'),
	('04049', 'Geography—Other'),
	('04051', 'World History—Overview'),
	('04052', 'World History and Geography'),
	('04053', 'Modern World History'),
	('04054', 'IB History'),
	('04055', 'Modern European History'),
	('04056', 'AP European History'),
	('04057', 'AP World History'),
	('04058', 'Ancient Civilizations'),
	('04059', 'Medieval European History'),
	('04060', 'Ancient and Medieval History'),
	('04061', 'World Area Studies'),
	('04062', 'World People Studies'),
	('04063', 'Western Civilization'),
	('04064', 'Contemporary World Issues'),
	('04065', 'Particular Topics in World History'),
	('04066', 'IB Islamic History'),
	('04067', 'AP World History: Modern'),
	('04068', 'CI Global Perspectives & Independent Research'),
	('04097', 'World History—Independent Study'),
	('04098', 'World History—Workplace Experience'),
	('04099', 'World History—Other'),
	('04101', 'U.S. History—Comprehensive'),
	('04102', 'Early U.S. History'),
	('04103', 'Modern U.S. History'),
	('04104', 'AP U.S. History'),
	('04105', 'State-Specific Studies'),
	('04106', 'Contemporary U.S. Issues'),
	('04107', 'U.S. Ethnic Studies'),
	('04108', 'U.S. Gender Studies'),
	('04109', 'Particular Topics in U.S. History'),
	('04110', 'U.S. Wars and Military Conflicts'),
	('04111', 'CI U.S. History'),
	('04147', 'U.S. History—Independent Study'),
	('04148', 'U.S. History—Workplace Experience'),
	('04149', 'U.S. History—Other'),
	('04151', 'U.S. Government—Comprehensive'),
	('04152', 'Particular Topics in U.S. Government'),
	('04153', 'Political Science'),
	('04154', 'Comparative Government'),
	('04155', 'International Relations'),
	('04156', 'United States and World Affairs'),
	('04157', 'AP U.S. Government and Politics'),
	('04158', 'AP Comparative Government and Politics'),
	('04159', 'AP Government'),
	('04160', 'U.S. Government, Civics, and Economics'),
	('04161', 'Civics'),
	('04162', 'Law Studies'),
	('04163', 'Consumer Law'),
	('04164', 'Business Law'),
	('04165', 'Legal System'),
	('04166', 'Particular Topics in Law'),
	('04167', 'Simulated Political Process'),
	('04168', 'IB Twentieth Century World History'),
	('04169', 'IB Global Politics'),
	('04171', 'IB Individuals and Societies, Middle Years Program'),
	('04197', 'Government, Politics and Law—Independent Study'),
	('04198', 'Government, Politics and Law—Workplace Experience'),
	('04199', 'Government, Politics and Law—Other'),
	('04201', 'Economics'),
	('04202', 'Comparative Economics'),
	('04203', 'AP Microeconomics'),
	('04204', 'AP Macroeconomics'),
	('04205', 'AP Economics'),
	('04206', 'IB Economics'),
	('04207', 'Particular Topics in Economics'),
	('04208', 'Microeconomics'),
	('04209', 'Macroeconomics'),
	('04247', 'Economics—Independent Study'),
	('04248', 'Economics—Workplace Experience'),
	('04249', 'Economics—Other'),
	('04251', 'Anthropology'),
	('04252', 'Particular Topics in Anthropology'),
	('04253', 'IB Social and Cultural Anthropology'),
	('04254', 'Psychology'),
	('04255', 'Particular Topics in Psychology'),
	('04256', 'AP Psychology'),
	('04257', 'IB Psychology'),
	('04258', 'Sociology'),
	('04259', 'Particular Topics in Sociology'),
	('04260', 'Social Science'),
	('04261', 'Social Science Research'),
	('04262', 'IB Organization Studies '),
	('04297', 'Social Sciences—Independent Study'),
	('04298', 'Social Sciences—Workplace Experience'),
	('04299', 'Social Sciences—Other'),
	('04301', 'Humanities Survey'),
	('04302', 'Humanities'),
	('04303', 'Issues of Western Humanities'),
	('04304', 'IB Theory of Knowledge'),
	('04305', 'Social Studies'),
	('04306', 'Philosophy'),
	('04307', 'Particular Topics in Philosophy'),
	('04308', 'Modern Intellectual History'),
	('04309', 'IB Philosophy'),
	('04310', 'Particular Topics in Humanities'),
	('04311', 'CI Thinking Skills'),
	('04347', 'Humanities—Independent Study'),
	('04348', 'Humanities—Workplace Experience'),
	('04349', 'Humanities—Other'),
	('04428', 'Social Studies (early childhood education)'),
	('04429', 'Social Studies (pre-kindergarten)'),
	('04430', 'Social Studies (kindergarten)'),
	('04431', 'Social Studies (grade 1)'),
	('04432', 'Social Studies (grade 2)'),
	('04433', 'Social Studies (grade 3)'),
	('04434', 'Social Studies (grade 4)'),
	('04435', 'Social Studies (grade 5)'),
	('04436', 'Social Studies (grade 6)'),
	('04437', 'Social Studies (grade 7)'),
	('04438', 'Social Studies (grade 8)'),
	('04439', 'Social Studies—General'),
	('04994', 'Social Sciences and History—Proficiency Development'),
	('04995', 'Social Sciences and History—Aide'),
	('04996', 'Social Sciences and History—Supplemental'),
	('04997', 'Social Sciences and History—Independent Study'),
	('04998', 'Social Sciences and History—Workplace Experience'),
	('04999', 'Social Sciences and History—Other'),
	('05001', 'Dance Technique'),
	('05002', 'Dance Repertory'),
	('05003', 'General Dance'),
	('05004', 'Dance History and Appreciation'),
	('05005', 'Dance—Choreography'),
	('05006', 'Dance Survey'),
	('05007', 'Dance Improvisation'),
	('05008', 'World/Cultural Dance'),
	('05009', 'Technical Theater for Dance'),
	('05010', 'Social Dance'),
	('05011', 'Dance Composition/Composition Seminar'),
	('05012', 'IB Dance'),
	('05013', 'Dance for Musical Theater'),
	('05014', 'Ballet'),
	('05015', 'Jazz Dance'),
	('05016', 'Modern Dance'),
	('05017', 'Hip Hop'),
	('05018', 'Tap Dance'),
	('05028', 'Dance (early childhood education)'),
	('05029', 'Dance (pre-kindergarten)'),
	('05030', 'Dance (kindergarten)'),
	('05031', 'Dance (grade 1)'),
	('05032', 'Dance (grade 2)'),
	('05033', 'Dance (grade 3)'),
	('05034', 'Dance (grade 4)'),
	('05035', 'Dance (grade 5)'),
	('05036', 'Dance (grade 6)'),
	('05037', 'Dance (grade 7)'),
	('05038', 'Dance (grade 8)'),
	('05039', 'Dance—General'),
	('05047', 'Dance—Independent Study'),
	('05048', 'Dance—Workplace Experience'),
	('05049', 'Dance—Other'),
	('05051', 'Introduction to Theater'),
	('05052', 'Theater Arts'),
	('05053', 'Theater—Comprehensive'),
	('05054', 'Exploration in Drama'),
	('05055', 'Theater—Acting/Performance'),
	('05056', 'Theater—Stagecraft'),
	('05057', 'Theater—Directing'),
	('05058', 'Playwriting and Screenwriting'),
	('05059', 'History and Literature of the Theater'),
	('05060', 'Musical Theater'),
	('05061', 'Theatrical Production and Management'),
	('05062', 'IB Theatre'),
	('05068', 'Drama (early childhood education)'),
	('05069', 'Drama (pre-kindergarten)'),
	('05070', 'Drama (kindergarten)'),
	('05071', 'Drama (grade 1)'),
	('05072', 'Drama (grade 2)'),
	('05073', 'Drama (grade 3)'),
	('05074', 'Drama (grade 4)'),
	('05075', 'Drama (grade 5)'),
	('05076', 'Drama (grade 6)'),
	('05077', 'Drama (grade 7)'),
	('05078', 'Drama (grade 8)'),
	('05079', 'Drama—General'),
	('05097', 'Theater—Independent Study'),
	('05098', 'Theater—Workplace Experience'),
	('05099', 'Theater—Other'),
	('05101', 'General Band'),
	('05102', 'Concert Band'),
	('05103', 'Marching Band'),
	('05104', 'Orchestra'),
	('05105', 'Contemporary Instrumental Ensemble'),
	('05106', 'Small Ensemble'),
	('05107', 'Piano'),
	('05108', 'Guitar'),
	('05109', 'Individual Technique—Instrumental Music'),
	('05110', 'Chorus'),
	('05111', 'Vocal Ensemble'),
	('05112', 'Individual Technique—Vocal Music'),
	('05113', 'Music Theory'),
	('05114', 'AP Music Theory'),
	('05115', 'IB Music'),
	('05116', 'Music History/Appreciation'),
	('05117', 'Music History'),
	('05118', 'Music Appreciation'),
	('05119', 'Composition/Songwriting'),
	('05120', 'Strings'),
	('05121', 'Contemporary Vocal Ensemble'),
	('05122', 'Culturally Influenced Ensemble'),
	('05123', 'Recording and Production'),
	('05124', 'Technology/Electronic Music'),
	('05128', 'Music (early childhood education)'),
	('05129', 'Music (pre-kindergarten)'),
	('05130', 'Music (kindergarten)'),
	('05131', 'Music (grade 1)'),
	('05132', 'Music (grade 2)'),
	('05133', 'Music (grade 3)'),
	('05134', 'Music (grade 4)'),
	('05135', 'Music (grade 5)'),
	('05136', 'Music (grade 6)'),
	('05137', 'Music (grade 7)'),
	('05138', 'Music (grade 8)'),
	('05139', 'Music—General'),
	('05147', 'Music—Independent Study'),
	('05148', 'Music—Workplace Experience'),
	('05149', 'Music—Other'),
	('05151', 'Art Appreciation'),
	('05152', 'Art History'),
	('05153', 'AP Art History'),
	('05154', 'Visual Arts—Comprehensive'),
	('05155', 'Visual Arts—Drawing/Painting'),
	('05156', 'Visual Arts—Drawing'),
	('05157', 'Visual Arts—Painting'),
	('05158', 'Visual Arts—Sculpture'),
	('05159', 'Ceramics/Pottery'),
	('05160', 'Printmaking/Graphics'),
	('05161', 'Printmaking'),
	('05162', 'Visual Communications Design'),
	('05163', 'Advertising Design'),
	('05164', 'Fibers and Textile Design'),
	('05165', 'Crafts'),
	('05166', 'Jewelry'),
	('05167', 'Photography'),
	('05168', 'Cinematography/Video Production'),
	('05169', 'Multimedia Art'),
	('05170', 'Art Portfolio'),
	('05171', 'AP Studio Art—General Portfolio'),
	('05172', 'AP Drawing'),
	('05173', 'IB Visual Arts'),
	('05174', 'AP 2-D Art and Design'),
	('05175', 'AP 3-D Art and Design'),
	('05176', 'Calligraphy/Lettering'),
	('05177', 'Animation'),
	('05178', 'Art (early childhood education)'),
	('05179', 'Art (pre-kindergarten)'),
	('05180', 'Art (kindergarten)'),
	('05181', 'Art (grade 1)'),
	('05182', 'Art (grade 2)'),
	('05183', 'Art (grade 3)'),
	('05184', 'Art (grade 4)'),
	('05185', 'Art (grade 5)'),
	('05186', 'Art (grade 6)'),
	('05187', 'Art (grade 7)'),
	('05188', 'Art (grade 8)'),
	('05189', 'Art—General'),
	('05190', 'Fashion Design'),
	('05191', 'Industrial Design'),
	('05192', 'Architectural Design'),
	('05193', 'Interior Design'),
	('05194', 'IB Film'),
	('05195', 'Fundamentals of Design'),
	('05197', 'Visual Arts—Independent Study'),
	('05198', 'Visual Arts—Workplace Experience'),
	('05199', 'Visual Arts—Other'),
	('05201', 'Interdisciplinary Arts'),
	('05202', 'IB Arts, Middle Years Program'),
	('05203', 'Film Appreciation and Analysis'),
	('05250', 'Media Arts—Comprehensive'),
	('05251', 'Digital Imaging'),
	('05252', 'Interactive Design'),
	('05253', 'Interactive Game Design'),
	('05254', 'Web Design'),
	('05255', 'Moving Image'),
	('05256', 'Moving Image – Animation'),
	('05257', 'Digital Sound Design'),
	('05258', 'Virtual Design'),
	('05259', 'Media for Performance'),
	('05260', 'Multimedia Design'),
	('05261', 'Intermedia Design'),
	('05262', 'Media Arts Theory'),
	('05263', 'Media Literacy'),
	('05297', 'Media Arts—Independent Study'),
	('05298', 'Media Arts—Workplace Experience'),
	('05299', 'Media Arts—Other '),
	('05995', 'Visual and Performing Art—Aide'),
	('05997', 'Visual and Performing Art—Independent Study'),
	('05998', 'Visual and Performing Art—Workplace Experience'),
	('05999', 'Visual and Performing Art—Other'),
	('06028', 'Foreign Language (early childhood education)'),
	('06029', 'Foreign Language (pre-kindergarten)'),
	('06030', 'Foreign Language (kindergarten)'),
	('06031', 'Foreign Language (grade 1)'),
	('06032', 'Foreign Language (grade 2)'),
	('06033', 'Foreign Language (grade 3)'),
	('06034', 'Foreign Language (grade 4)'),
	('06035', 'Foreign Language (grade 5)'),
	('06036', 'Foreign Language (grade 6)'),
	('06037', 'Foreign Language (grade 7)'),
	('06038', 'Foreign Language (grade 8)'),
	('06039', 'Foreign Language—General'),
	('06100', 'Spanish (prior-to-secondary)'),
	('06101', 'Spanish I'),
	('06102', 'Spanish II'),
	('06103', 'Spanish III'),
	('06104', 'Spanish IV'),
	('06105', 'Spanish V'),
	('06106', 'Spanish for Native Speakers'),
	('06107', 'Spanish Field Experience'),
	('06108', 'Spanish Conversation and Culture'),
	('06109', 'Spanish Literature'),
	('06110', 'IB Language A: Literature—Spanish'),
	('06111', 'IB Language B—Spanish'),
	('06112', 'AP Spanish Language and Culture'),
	('06113', 'AP Spanish Literature and Culture'),
	('06114', 'IB Language B (Spanish), Middle Years Program'),
	('06115', 'IB Language A: Language and Literature—Spanish'),
	('06116', 'IB Language Ab Initio—Spanish'),
	('06120', 'French (prior-to-secondary)'),
	('06121', 'French I'),
	('06122', 'French II'),
	('06123', 'French III'),
	('06124', 'French IV'),
	('06125', 'French V'),
	('06126', 'French for Native Speakers'),
	('06127', 'French Field Experience'),
	('06128', 'French Conversation and Culture'),
	('06129', 'French Literature'),
	('06130', 'IB Language A: Literature—French'),
	('06131', 'IB Language B—French'),
	('06132', 'AP French Language and Culture'),
	('06133', 'AP French Literature'),
	('06134', 'IB Language B (French), Middle Years Program'),
	('06135', 'IB Language A: Language and Literature—French'),
	('06136', 'IB Language Ab Initio—French'),
	('06140', 'Italian (prior-to-secondary)'),
	('06141', 'Italian I'),
	('06142', 'Italian II'),
	('06143', 'Italian III'),
	('06144', 'Italian IV'),
	('06145', 'Italian V'),
	('06146', 'Italian for Native Speakers'),
	('06147', 'Italian Field Experience'),
	('06148', 'Italian Conversation and Culture'),
	('06149', 'Italian Literature'),
	('06150', 'IB Language A: Literature—Italian'),
	('06151', 'IB Language B—Italian'),
	('06152', 'AP Italian Language and Culture'),
	('06153', 'IB Language B (Italian), Middle Years Program'),
	('06154', 'IB Language A: Language and Literature—Italian'),
	('06155', 'IB Language Ab Initio—Italian'),
	('06160', 'Portuguese (prior-to-secondary)'),
	('06161', 'Portuguese I'),
	('06162', 'Portuguese II'),
	('06163', 'Portuguese III'),
	('06164', 'Portuguese IV'),
	('06165', 'Portuguese V'),
	('06166', 'Portuguese for Native Speakers'),
	('06167', 'Portuguese Field Experience'),
	('06168', 'Portuguese Conversation and Culture'),
	('06169', 'Portuguese Literature'),
	('06170', 'IB Language A: Literature—Portuguese'),
	('06171', 'IB Language B—Portuguese'),
	('06172', 'IB Language B (Portuguese), Middle Years Program'),
	('06173', 'IB Language A: Language and Literature—Portuguese'),
	('06174', 'IB Language Ab Initio—Portuguese'),
	('06181', 'Romance/Italic Language I'),
	('06182', 'Romance/Italic Language II'),
	('06183', 'Romance/Italic Language III'),
	('06184', 'Romance/Italic Language IV'),
	('06185', 'Romance/Italic Language V'),
	('06186', 'Romance/Italic Language for Native Speakers'),
	('06187', 'Romance/Italic Language Field Experience'),
	('06188', 'Romance/Italic Language Conversation and Culture'),
	('06189', 'Romance/Italic Literature'),
	('06190', 'IB Language A: Literature—Romance/Italic Language'),
	('06191', 'IB Language B—Romance/Italic Language'),
	('06192', 'IB Language A: Language and Literature—Romance/Italic Language'),
	('06193', 'IB Language Ab Initio—Romance/Italic Language'),
	('06199', 'Romance/Italic Language—Other'),
	('06200', 'German (prior-to-secondary)'),
	('06201', 'German I'),
	('06202', 'German II'),
	('06203', 'German III'),
	('06204', 'German IV'),
	('06205', 'German V'),
	('06206', 'German for Native Speakers'),
	('06207', 'German Field Experience'),
	('06208', 'German Conversation and Culture'),
	('06209', 'German Literature'),
	('06210', 'IB Language A: Literature—German'),
	('06211', 'IB Language B—German'),
	('06212', 'AP German Language and Culture'),
	('06213', 'IB Language B (German), Middle Years Program'),
	('06214', 'IB Language A: Language and Literature—German'),
	('06215', 'IB Language Ab Initio—German'),
	('06241', 'Germanic Language I'),
	('06242', 'Germanic Language II'),
	('06243', 'Germanic Language III'),
	('06244', 'Germanic Language IV'),
	('06245', 'Germanic Language V'),
	('06246', 'Germanic Language for Native Speakers'),
	('06247', 'Germanic Language Field Experience'),
	('06248', 'Germanic Language Conversation and Culture'),
	('06249', 'Germanic Literature'),
	('06250', 'IB Language A: Literature—Germanic Language'),
	('06251', 'IB Language B—Germanic Language'),
	('06252', 'IB Language A: Language and Literature—Germanic Language'),
	('06253', 'IB Language Ab Initio—Germanic Language'),
	('06259', 'Germanic Language—Other'),
	('06261', 'Celtic Language I'),
	('06262', 'Celtic Language II'),
	('06263', 'Celtic Language III'),
	('06264', 'Celtic Language IV'),
	('06265', 'Celtic Language V'),
	('06266', 'Celtic Language for Native Speakers'),
	('06267', 'Celtic Language Field Experience'),
	('06268', 'Celtic Language Conversation and Culture'),
	('06269', 'Celtic Literature'),
	('06270', 'IB Language A: Literature—Celtic Language'),
	('06271', 'IB Language B—Celtic Language'),
	('06272', 'IB Language A: Language and Literature—Celtic Language'),
	('06273', 'IB Language Ab Initio—Celtic Language'),
	('06279', 'Celtic Language—Other'),
	('06280', 'Greek (prior-to-secondary)'),
	('06281', 'Greek I'),
	('06282', 'Greek II'),
	('06283', 'Greek III'),
	('06284', 'Greek IV'),
	('06285', 'Greek V'),
	('06286', 'Greek for Native Speakers'),
	('06287', 'Greek Field Experience'),
	('06288', 'Greek Conversation and Culture'),
	('06289', 'Greek Literature'),
	('06290', 'IB Language A: Literature—Greek'),
	('06291', 'IB Language B: Literature—Greek'),
	('06292', 'IB Language A: Language and Literature—Greek'),
	('06293', 'IB Language Ab Initio—Greek'),
	('06299', 'Greek—Other'),
	('06300', 'Latin (prior-to-secondary)'),
	('06301', 'Latin I'),
	('06302', 'Latin II'),
	('06303', 'Latin III'),
	('06304', 'Latin IV'),
	('06305', 'Latin V'),
	('06311', 'IB Classical Languages—Latin'),
	('06313', 'AP Latin (Virgil, Catullus and Horace)'),
	('06320', 'Classical Greek (prior-to-secondary)'),
	('06321', 'Classical Greek I'),
	('06322', 'Classical Greek II'),
	('06323', 'Classical Greek III'),
	('06324', 'Classical Greek IV'),
	('06325', 'Classical Greek V'),
	('06331', 'IB Classical Languages—Greek'),
	('06332', 'IB Language B (Greek), Middle Years Program'),
	('06359', 'Classical Languages—Other'),
	('06400', 'Chinese (prior-to-secondary)'),
	('06401', 'Chinese I'),
	('06402', 'Chinese II'),
	('06403', 'Chinese III'),
	('06404', 'Chinese IV'),
	('06405', 'Chinese V'),
	('06406', 'Chinese for Native Speakers'),
	('06407', 'Chinese Field Experience'),
	('06408', 'Chinese Conversation and Culture'),
	('06409', 'Chinese Literature'),
	('06410', 'IB Language A: Literature—Chinese'),
	('06411', 'IB Language B—Chinese'),
	('06412', 'AP Chinese Language and Culture'),
	('06413', 'IB Language B (Chinese), Middle Years Program'),
	('06414', 'IB Language A: Language and Literature—Chinese'),
	('06415', 'IB Language Ab Initio—Chinese'),
	('06420', 'Japanese (prior-to-secondary)'),
	('06421', 'Japanese I'),
	('06422', 'Japanese II'),
	('06423', 'Japanese III'),
	('06424', 'Japanese IV'),
	('06425', 'Japanese V'),
	('06426', 'Japanese for Native Speakers'),
	('06427', 'Japanese Field Experience'),
	('06428', 'Japanese Conversation and Culture'),
	('06429', 'Japanese Literature'),
	('06430', 'IB Language A: Literature—Japanese'),
	('06431', 'IB Language B—Japanese'),
	('06432', 'AP Japanese Language and Culture'),
	('06433', 'IB Language B (Japanese), Middle Years Program'),
	('06434', 'IB Language A: Language and Literature—Japanese'),
	('06435', 'IB Language Ab Initio—Japanese'),
	('06440', 'Korean (prior-to-secondary)'),
	('06441', 'Korean I'),
	('06442', 'Korean II'),
	('06443', 'Korean III'),
	('06444', 'Korean IV'),
	('06445', 'Korean V'),
	('06446', 'Korean for Native Speakers'),
	('06447', 'Korean Field Experience'),
	('06448', 'Korean Conversation and Culture'),
	('06449', 'Korean Literature'),
	('06450', 'IB Language A: Literature—Korean'),
	('06451', 'IB Language B—Korean'),
	('06452', 'IB Language B (Korean), Middle Years Program'),
	('06453', 'IB Language A: Language and Literature—Korean'),
	('06454', 'IB Language Ab Initio—Korean'),
	('06481', 'East Asian Language I'),
	('06482', 'East Asian Language II'),
	('06483', 'East Asian Language III'),
	('06484', 'East Asian Language IV'),
	('06485', 'East Asian Language V'),
	('06486', 'East Asian Language for Native Speakers'),
	('06487', 'East Asian Language Field Experience'),
	('06488', 'East Asian Language Conversation and Culture'),
	('06489', 'East Asian Literature'),
	('06490', 'IB Language A: Literature—East Asian Language'),
	('06491', 'IB Language B—East Asian Language'),
	('06492', 'IB Language A: Language and Literature—East Asian Language'),
	('06493', 'IB Language Ab Initio—East Asian Language'),
	('06499', 'East Asian Language—Other'),
	('06500', 'Vietnamese (prior-to-secondary)'),
	('06501', 'Vietnamese I'),
	('06502', 'Vietnamese II'),
	('06503', 'Vietnamese III'),
	('06504', 'Vietnamese IV'),
	('06505', 'Vietnamese V'),
	('06506', 'Vietnamese for Native Speakers'),
	('06507', 'Vietnamese Field Experience'),
	('06508', 'Vietnamese Conversation and Culture'),
	('06509', 'Vietnamese Literature'),
	('06510', 'IB Language A: Literature—Vietnamese'),
	('06511', 'IB Language B—Vietnamese'),
	('06512', 'IB Language B (Vietnamese), Middle Years Program'),
	('06513', 'IB Language A: Language and Literature—Vietnamese'),
	('06514', 'IB Language Ab Initio—Vietnamese'),
	('06520', 'Filipino (prior-to-secondary)'),
	('06521', 'Filipino I'),
	('06522', 'Filipino II'),
	('06523', 'Filipino III'),
	('06524', 'Filipino IV'),
	('06525', 'Filipino V'),
	('06526', 'Filipino for Native Speakers'),
	('06527', 'Filipino Field Experience'),
	('06528', 'Filipino Conversation and Culture'),
	('06529', 'Filipino Literature'),
	('06530', 'IB Language A: Literature—Filipino'),
	('06531', 'IB Language B—Filipino'),
	('06532', 'IB Language B (Filipino), Middle Years Program'),
	('06533', 'IB Language A: Language and Literature—Filipino'),
	('06534', 'IB Language Ab Initio—Filipino'),
	('06581', 'Southeast Asian Language I'),
	('06582', 'Southeast Asian Language II'),
	('06583', 'Southeast Asian Language III'),
	('06584', 'Southeast Asian Language IV'),
	('06585', 'Southeast Asian Language V'),
	('06586', 'Southeast Asian Language for Native Speakers'),
	('06587', 'Southeast Asian Language Field Experience'),
	('06588', 'Southeast Asian Language Conversation and Culture'),
	('06589', 'Southeast Asian Literature'),
	('06590', 'IB Language A: Literature—Southeast Asian Language'),
	('06591', 'IB Language B—Southeast Asian Language'),
	('06592', 'IB Language A: Language and Literature—Southeast Asian Language'),
	('06593', 'IB Language Ab Initio—Southeast Asian Language'),
	('06599', 'Southeast Asian Language—Other'),
	('06600', 'Russian (prior-to-secondary)'),
	('06601', 'Russian I'),
	('06602', 'Russian II'),
	('06603', 'Russian III'),
	('06604', 'Russian IV'),
	('06605', 'Russian V'),
	('06606', 'Russian for Native Speakers'),
	('06607', 'Russian Field Experience'),
	('06608', 'Russian Conversation and Culture'),
	('06609', 'Russian Literature'),
	('06610', 'IB Language A: Literature—Russian'),
	('06611', 'IB Language B—Russian'),
	('06612', 'IB Language B (Russian), Middle Years Program'),
	('06613', 'IB Language A: Language and Literature—Russian'),
	('06614', 'IB Language Ab Initio—Russian'),
	('06641', 'Balto-Slavic Language I'),
	('06642', 'Balto-Slavic Language II'),
	('06643', 'Balto-Slavic Language III'),
	('06644', 'Balto-Slavic Language IV'),
	('06645', 'Balto-Slavic Language V'),
	('06646', 'Balto-Slavic Language for Native Speakers'),
	('06647', 'Balto-Slavic Language Field Experience'),
	('06648', 'Balto-Slavic Language Conversation and Culture'),
	('06649', 'Balto-Slavic Literature'),
	('06650', 'IB Language A: Literature—Balto-Slavic Language'),
	('06651', 'IB Language B—Balto-Slavic Language'),
	('06652', 'IB Language A: Language and Literature—Balto-Slavic Language'),
	('06653', 'IB Language Ab Initio—Balto-Slavic Language'),
	('06659', 'Balto-Slavic Language—Other'),
	('06661', 'Turkic/Ural-Altaic Language I'),
	('06662', 'Turkic/Ural-Altaic Language II'),
	('06663', 'Turkic/Ural-Altaic Language III'),
	('06664', 'Turkic/Ural-Altaic Language IV'),
	('06665', 'Turkic/Ural-Altaic Language V'),
	('06666', 'Turkic/Ural-Altaic Language for Native Speakers'),
	('06667', 'Turkic/Ural-Altaic Language Field Experience'),
	('06668', 'Turkic/Ural-Altaic Language Conversation and Culture'),
	('06669', 'Turkic/Ural-Altaic Literature'),
	('06670', 'IB Language A: Literature—Turkic/Ural-Altaic Language'),
	('06671', 'IB Language B—Turkic/Ural-Altaic Language'),
	('06672', 'IB Language A: Language and Literature—Turkic/Ural-Altaic Language'),
	('06673', 'IB Language Ab Initio—Turkic/Ural-Altaic Language'),
	('06679', 'Turkic/Ural-Altaic Language—Other'),
	('06681', 'Iranian/Persian Language I'),
	('06682', 'Iranian/Persian Language II'),
	('06683', 'Iranian/Persian Language III'),
	('06684', 'Iranian/Persian Language IV'),
	('06685', 'Iranian/Persian Language V'),
	('06686', 'Iranian/Persian Language for Native Speakers'),
	('06687', 'Iranian/Persian Language Field Experience'),
	('06688', 'Iranian/Persian Language Conversation and Culture'),
	('06689', 'Iranian/Persian Literature'),
	('06690', 'IB Language A: Literature—Iranian/Persian'),
	('06691', 'IB Language B—Iranian/Persian Language'),
	('06692', 'IB Language A: Language and Literature—Iranian/Persian'),
	('06693', 'IB Language Ab Initio—Iranian/Persian Language'),
	('06699', 'Iranian/Persian Language—Other'),
	('06700', 'Hebrew (prior-to-secondary)'),
	('06701', 'Hebrew I'),
	('06702', 'Hebrew II'),
	('06703', 'Hebrew III'),
	('06704', 'Hebrew IV'),
	('06705', 'Hebrew V'),
	('06706', 'Hebrew for Native Speakers'),
	('06707', 'Hebrew Field Experience'),
	('06708', 'Hebrew Conversation and Culture'),
	('06709', 'Hebrew Literature'),
	('06710', 'IB Language A: Literature—Hebrew'),
	('06711', 'IB Language B—Hebrew'),
	('06712', 'IB Classical Languages—Hebrew'),
	('06713', 'IB Language B (Hebrew), Middle Years Program'),
	('06714', 'IB Language A: Language and Literature—Hebrew'),
	('06715', 'IB Language Ab Initio—Hebrew'),
	('06720', 'Arabic (prior-to-secondary)'),
	('06721', 'Arabic I'),
	('06722', 'Arabic II'),
	('06723', 'Arabic III'),
	('06724', 'Arabic IV'),
	('06725', 'Arabic V'),
	('06726', 'Arabic for Native Speakers'),
	('06727', 'Arabic Field Experience'),
	('06728', 'Arabic Conversation and Culture'),
	('06729', 'Arabic Literature'),
	('06730', 'IB Language A: Literature—Arabic'),
	('06731', 'IB Language B—Arabic'),
	('06732', 'IB Classical Languages—Arabic'),
	('06733', 'IB Language B (Arabic), Middle Years Program'),
	('06734', 'IB Language A: Language and Literature—Arabic'),
	('06735', 'IB Language Ab Initio—Arabic'),
	('06759', 'Semitic and Near/Middle Eastern Languages—Other'),
	('06760', 'Swahili (prior-to-secondary)'),
	('06761', 'Swahili I'),
	('06762', 'Swahili II'),
	('06763', 'Swahili III'),
	('06764', 'Swahili IV'),
	('06765', 'Swahili V'),
	('06766', 'Swahili for Native Speakers'),
	('06767', 'Swahili Field Experience'),
	('06768', 'Swahili Conversation and Culture'),
	('06769', 'Swahili Literature'),
	('06770', 'IB Language A: Literature—Swahili'),
	('06771', 'IB Language B—Swahili'),
	('06772', 'IB Language B (Swahili), Middle Years Program'),
	('06773', 'IB Language A: Language and Literature—Swahili'),
	('06774', 'IB Language Ab Initio—Swahili'),
	('06781', 'Non-Semitic African Language I'),
	('06782', 'Non-Semitic African Language II'),
	('06783', 'Non-Semitic African Language III'),
	('06784', 'Non-Semitic African Language IV'),
	('06785', 'Non-Semitic African Language V'),
	('06786', 'Non-Semitic African Language for Native Speakers'),
	('06787', 'Non-Semitic African Language Field Experience'),
	('06788', 'Non-Semitic African Language Conversation and Culture'),
	('06789', 'Non-Semitic African Literature'),
	('06790', 'IB Language A: Literature—Non-Semitic African Language'),
	('06791', 'IB Language B—Non-Semitic African Language'),
	('06792', 'IB Language A: Language and Literature—Non-Semitic African Language'),
	('06793', 'IB Language Ab Initio—Non-Semitic African Language'),
	('06799', 'Non-Semitic African Language—Other'),
	('06800', 'American Sign Language (prior-to-secondary)'),
	('06801', 'American Sign Language I'),
	('06802', 'American Sign Language II'),
	('06803', 'American Sign Language III'),
	('06804', 'American Sign Language IV'),
	('06805', 'American Sign Language V'),
	('06806', 'IB Language B (American Sign Language), Middle Years Program'),
	('06819', 'American Sign Language—Other'),
	('06820', 'American Indian Language (prior-to-secondary)'),
	('06821', 'American Indian Language I'),
	('06822', 'American Indian Language II'),
	('06823', 'American Indian Language III'),
	('06824', 'American Indian Language IV'),
	('06825', 'American Indian Language V'),
	('06826', 'American Indian Language for Native Speakers'),
	('06827', 'American Indian Language Field Experience'),
	('06828', 'American Indian Language Conversation and Culture'),
	('06829', 'American Indian Literature'),
	('06830', 'IB Language A: Literature—American Indian Language')

	INSERT INTO #ScedCodes VALUES
	('06831', 'IB Language B—American Indian Language'),
	('06832', 'IB Language B (American Indian Language), Middle Years Program'),
	('06833', 'IB Language A: Language and Literature—American Indian Language'),
	('06834', 'IB Language Ab Initio—American Indian Language'),
	('06839', 'American Indian Language—Other'),
	('06841', 'Indic Language I'),
	('06842', 'Indic Language II'),
	('06843', 'Indic Language III'),
	('06844', 'Indic Language IV'),
	('06845', 'Indic Language V'),
	('06846', 'Indic Language for Native Speakers'),
	('06847', 'Indic Language Field Experience'),
	('06848', 'Indic Language Conversation and Culture'),
	('06849', 'Indic Literature'),
	('06850', 'IB Language A: Literature—Indic Language'),
	('06851', 'IB Language B—Indic Language'),
	('06852', 'IB Language A: Language and Literature—Indic Language'),
	('06853', 'IB Language Ab Initio—Indic Language'),
	('06859', 'Indic Language—Other'),
	('06861', 'Malayo-Polynesian Language I'),
	('06862', 'Malayo-Polynesian Language II'),
	('06863', 'Malayo-Polynesian Language III'),
	('06864', 'Malayo-Polynesian Language IV'),
	('06865', 'Malayo-Polynesian Language V'),
	('06866', 'Malayo-Polynesian Language for Native Speakers'),
	('06867', 'Malayo-Polynesian Language Field Experience'),
	('06868', 'Malayo-Polynesian Language Conversation and Culture'),
	('06869', 'Malayo-Polynesian Literature'),
	('06870', 'IB Language A: Literature—Malayo-Polynesian Language'),
	('06871', 'IB Language B—Malayo-Polynesian Language'),
	('06872', 'IB Language A: Language and Literature—Malayo-Polynesian Language'),
	('06873', 'IB Language Ab Initio—Malayo-Polynesian Language'),
	('06879', 'Malayo-Polynesian Language—Other'),
	('06995', 'Foreign Language and Literature—Aide'),
	('06997', 'Foreign Language and Literature—Independent Study'),
	('06998', 'Foreign Language and Literature—Workplace Experience'),
	('06999', 'Foreign Language and Literature—Other'),
	('07001', 'Religious Foundations'),
	('07002', 'Comparative Religion'),
	('07003', 'Eastern Religions'),
	('07004', 'Western Religions'),
	('07005', 'Scriptures'),
	('07006', 'Old Testament'),
	('07007', 'New Testament'),
	('07008', 'Bible History'),
	('07009', 'Christology'),
	('07010', 'Religious Figures'),
	('07011', 'Liturgy and Prayer'),
	('07012', 'Prayer and Spirituality'),
	('07013', 'Religious Ethics and Morality'),
	('07014', 'Justice, Peace, and Faith'),
	('07015', 'Faith and Lifestyle'),
	('07016', 'Ministry'),
	('07017', 'IB World Religions'),
	('07018', 'Particular Topics in Religion'),
	('07995', 'Religious Education and Theology—Aide'),
	('07997', 'Religious Education and Theology—Independent Study'),
	('07998', 'Religious Education and Theology—Workplace Experience'),
	('07999', 'Religious Education and Theology—Other'),
	('08001', 'Physical Education'),
	('08002', 'Team Sports'),
	('08003', 'Individual/Dual Sports'),
	('08004', 'Recreation Sports'),
	('08005', 'Fitness/Conditioning Activities'),
	('08006', 'Corps Movement'),
	('08007', 'Adapted Physical Education'),
	('08008', 'Gymnastics'),
	('08009', 'Weight Training'),
	('08010', 'Aquatics/Water Sports'),
	('08011', 'Tennis'),
	('08012', 'Self-defense'),
	('08013', 'Specific Sports Activities'),
	('08014', 'Physical Education Equivalent'),
	('08015', 'Off-Campus Sports'),
	('08016', 'Lifetime Fitness Education'),
	('08017', 'Sports Physiology'),
	('08018', 'Coaching'),
	('08019', 'Officiating'),
	('08028', 'Physical Education (early childhood education)'),
	('08029', 'Physical Education (pre-kindergarten)'),
	('08030', 'Physical Education (kindergarten)'),
	('08031', 'Physical Education (grade 1)'),
	('08032', 'Physical Education (grade 2)'),
	('08033', 'Physical Education (grade 3)'),
	('08034', 'Physical Education (grade 4)'),
	('08035', 'Physical Education (grade 5)'),
	('08036', 'Physical Education (grade 6)'),
	('08037', 'Physical Education (grade 7)'),
	('08038', 'Physical Education (grade 8)'),
	('08039', 'Physical Education—General'),
	('08040', 'IB Physical and Health Education, Middle Years Program'),
	('08047', 'Physical Education—Independent Study'),
	('08048', 'Physical Education—Workplace Experience'),
	('08049', 'Physical Education—Other'),
	('08051', 'Health Education'),
	('08052', 'Health and Fitness'),
	('08053', 'Community Health'),
	('08054', 'Special Needs Health Education'),
	('08055', 'Safety and First Aid'),
	('08056', 'Health for Parenting Teens'),
	('08057', 'Health and Life Management'),
	('08058', 'Substance Abuse Prevention'),
	('08068', 'Health Education (early childhood education)'),
	('08069', 'Health Education (pre-kindergarten)'),
	('08070', 'Health Education (kindergarten)'),
	('08071', 'Health Education (grade 1)'),
	('08072', 'Health Education (grade 2)'),
	('08073', 'Health Education (grade 3)'),
	('08074', 'Health Education (grade 4)'),
	('08075', 'Health Education (grade 5)'),
	('08076', 'Health Education (grade 6)'),
	('08077', 'Health Education (grade 7)'),
	('08078', 'Health Education (grade 8)'),
	('08079', 'Health Education—General'),
	('08097', 'Health Education—Independent Study'),
	('08098', 'Health Education—Workplace Experience'),
	('08099', 'Health Education—Other'),
	('08101', 'Physical and Health Education'),
	('08102', 'Physical and Health Education (early childhood education)'),
	('08103', 'Physical and Health Education (pre-kindergarten)'),
	('08104', 'Physical and Health Education (kindergarten)'),
	('08105', 'Physical and Health Education (grade 1)'),
	('08106', 'Physical and Health Education (grade 2)'),
	('08107', 'Physical and Health Education (grade 3)'),
	('08108', 'Physical and Health Education (grade 4)'),
	('08109', 'Physical and Health Education (grade 5)'),
	('08110', 'Physical and Health Education (grade 6)'),
	('08111', 'Physical and Health Education (grade 7)'),
	('08112', 'Physical and Health Education (grade 8)'),
	('08113', 'Physical and Health Education—General'),
	('08147', 'Physical and Health Education—Independent Study '),
	('08148', 'Physical and Health Education—Workplace Experience '),
	('08149', 'Physical and Health Education—Other '),
	('08151', 'Drivers’ Education—Classroom Only'),
	('08152', 'Drivers’ Education—Classroom and Laboratory'),
	('08197', 'Drivers’ Education—Independent Study'),
	('08198', 'Drivers’ Education—Workplace Experience'),
	('08199', 'Drivers’ Education—Other'),
	('08201', 'Physical Education/Health/Drivers’ Education'),
	('08995', 'Physical, Health, and Safety Education—Aide'),
	('08997', 'Physical, Health, and Safety Education—Independent Study'),
	('08998', 'Physical, Health, and Safety Education—Workplace Experience'),
	('08999', 'Physical, Health, and Safety Education—Other'),
	('09001', 'Introduction to Jr. ROTC'),
	('09002', 'Military Jr. ROTC—unspecified branch'),
	('09003', 'ROTC Drill'),
	('09004', 'Military Leadership'),
	('09051', 'Army Junior ROTC I'),
	('09052', 'Army Junior ROTC II'),
	('09053', 'Army Junior ROTC III'),
	('09054', 'Army Junior ROTC IV'),
	('09101', 'Naval Junior ROTC I'),
	('09102', 'Naval Junior ROTC II'),
	('09103', 'Naval Junior ROTC III'),
	('09104', 'Naval Junior ROTC IV'),
	('09151', 'Air Force Junior ROTC I'),
	('09152', 'Air Force Junior ROTC II'),
	('09153', 'Air Force Junior ROTC III'),
	('09154', 'Air Force Junior ROTC IV'),
	('09201', 'Marine Corps Junior ROTC I'),
	('09202', 'Marine Corps Junior ROTC II'),
	('09203', 'Marine Corps Junior ROTC III'),
	('09204', 'Marine Corps Junior ROTC IV'),
	('09995', 'Military Science—Aide'),
	('09997', 'Military Science—Independent Study'),
	('09998', 'Military Science—Workplace Experience'),
	('09999', 'Military Science—Other'),
	('10001', 'Introduction to Computer Technology'),
	('10002', 'Computing Systems'),
	('10003', 'Computer and Information Technology'),
	('10004', 'Computer Applications'),
	('10005', 'Business Computer Applications'),
	('10006', 'Telecommunications'),
	('10007', 'IB Digital Society'),
	('10008', 'Particular Topics in Computer Literacy'),
	('10009', 'Internet Skills'),
	('10010', 'Computer Literacy'),
	('10011', 'Computer Science Principles'),
	('10012', 'Exploring Computer Science'),
	('10013', 'PLTW Computer Science Essentials'),
	('10014', 'PLTW Computer Science A'),
	('10015', 'PLTW Computer Science Principles'),
	('10016', 'PLTW Cybersecurity'),
	('10017', 'PLTW Simulation and Modeling'),
	('10018', 'PLTW Artificial Intelligence'),
	('10019', 'AP Computer Science Principles'),
	('10020', 'Cybersecurity'),
	('10021', 'Computer Science Discoveries'),
	('10022', 'Computer Science (prior-to-secondary)'),
	('10047', 'Computer Literacy—Independent Study'),
	('10048', 'Computer Literacy—Workplace Experience'),
	('10049', 'Computer Literacy—Other'),
	('10051', 'Information Management'),
	('10052', 'Database Management and Data Warehousing'),
	('10053', 'Database Applications'),
	('10054', 'Data Systems/Processing'),
	('10055', 'Particular Topics in Management Information Systems'),
	('10097', 'Management Information Systems—Independent Study'),
	('10098', 'Management Information Systems—Workplace Experience'),
	('10099', 'Management Information Systems—Other'),
	('10101', 'Network Technology'),
	('10102', 'Networking Systems'),
	('10103', 'Area Network Design and Protocols'),
	('10104', 'Router Basics'),
	('10105', 'NetWare Routing'),
	('10106', 'Wide Area Telecommunications and Networking'),
	('10107', 'Wireless Networks'),
	('10108', 'Network Security'),
	('10109', 'Essentials of Network Operating Systems'),
	('10110', 'Microsoft Certified Professional (MCP)'),
	('10111', 'Particular Topics in Networking Systems'),
	('10112', 'Local Area Networking'),
	('10147', 'Networking Systems—Independent Study'),
	('10148', 'Networking Systems—Workplace Experience'),
	('10149', 'Networking Systems—Other'),
	('10151', 'Business Programming'),
	('10152', 'Computer Programming'),
	('10153', 'Visual Basic (VB) Programming'),
	('10154', 'C++ Programming'),
	('10155', 'Java Programming'),
	('10156', 'Computer Programming—Other Language'),
	('10157', 'AP Computer Science A'),
	('10158', 'AP Computer Science AB'),
	('10159', 'IB Computer Science'),
	('10160', 'Particular Topics in Computer Programming'),
	('10197', 'Computer Programming—Independent Study'),
	('10198', 'Computer Programming—Workplace Experience'),
	('10199', 'Computer Programming—Other'),
	('10201', 'Web Page Design'),
	('10202', 'Computer Graphics'),
	('10203', 'Interactive Media'),
	('10204', 'Particular Topics in Media Technology'),
	('10205', 'Computer Gaming and Design'),
	('10206', 'Mobile Applications'),
	('10247', 'Media Technology—Independent Study'),
	('10248', 'Media Technology—Workplace Experience'),
	('10249', 'Media Technology—Other'),
	('10251', 'Computer Technology'),
	('10252', 'Computer Maintenance'),
	('10253', 'Information Support and Services'),
	('10254', 'IT Essentials: PC Hardware and Software'),
	('10255', 'CISCO—The Panduit Network Infrastructure Essentials (PNIE)'),
	('10256', 'Particular Topics in Information Support and Services'),
	('10297', 'Information Support and Services—Independent Study'),
	('10298', 'Information Support and Services—Workplace Experience'),
	('10299', 'Information Support and Services—Other'),
	('10301', 'Computer Forensics'),
	('10302', 'Cyber Crime'),
	('10993', 'Information Technology—School-based Enterprise'),
	('10994', 'Information Technology—Career Project-based Learning'),
	('10995', 'Information Technology—Aide'),
	('10997', 'Information Technology—Independent Study'),
	('10998', 'Information Technology—Workplace Experience'),
	('10999', 'Information Technology—Other'),
	('11001', 'Introduction to Communication'),
	('11002', 'Communication Technology'),
	('11003', 'Particular Topics in Communication'),
	('11004', 'Social Media'),
	('11047', 'Communication—Independent Study'),
	('11048', 'Communication—Workplace Experience'),
	('11049', 'Communication—Other'),
	('11051', 'Audio/Visual Production'),
	('11052', 'Commercial Photography'),
	('11053', 'Photographic Laboratory and Darkroom'),
	('11054', 'Photo Imaging'),
	('11055', 'Video'),
	('11056', 'Particular Topics in Audio/Video Technology and Film'),
	('11097', 'Audio/Video Technology and Film—Independent Study'),
	('11098', 'Audio/Video Technology and Film—Workplace Experience'),
	('11099', 'Audio/Video Technology and Film—Other'),
	('11101', 'Journalism'),
	('11102', 'Photojournalism'),
	('11103', 'Broadcasting Technology'),
	('11104', 'Publication Production'),
	('11105', 'Particular Topics in Journalism and Broadcasting'),
	('11106', 'Emerging Technologies in Journalism'),
	('11107', 'Radio Production'),
	('11147', 'Journalism and Broadcasting—Independent Study'),
	('11148', 'Journalism and Broadcasting—Workplace Experience'),
	('11149', 'Journalism and Broadcasting—Other'),
	('11151', 'Digital Media Technology'),
	('11152', 'Desktop Publishing'),
	('11153', 'Digital Media Design and Production'),
	('11154', 'Commercial Graphic Design'),
	('11155', 'Graphic Technology'),
	('11156', 'Photography and Printing Technology'),
	('11157', 'Photoengraving'),
	('11158', 'Print Press Operations'),
	('11159', 'Particular Topics in Printing Technology and Production'),
	('11197', 'Printing Technology—Independent Study'),
	('11198', 'Printing Technology—Workplace Experience'),
	('11199', 'Printing Technology—Other'),
	('11993', 'Communication and Audio/Video Technology—School-based Enterprise'),
	('11994', 'Communication and Audio/Video Technology—Career Project-based Learning'),
	('11995', 'Communication and Audio/Video Technology—Aide'),
	('11997', 'Communication and Audio/Video Technology—Independent Study'),
	('11998', 'Communication and Audio/Video Technology—Workplace Experience'),
	('11999', 'Communication and Audio/Video Technology—Other'),
	('12001', 'Business/Office Career Exploration'),
	('12002', 'Office Procedures—Comprehensive'),
	('12003', 'Office and Administrative Technologies'),
	('12004', 'Office Services'),
	('12005', 'Keyboarding'),
	('12006', 'Word Processing'),
	('12007', 'Recordkeeping'),
	('12008', 'Particular Topics in Administration'),
	('12009', 'Business Communications'),
	('12047', 'Administration—Independent Study'),
	('12048', 'Administration—Workplace Experience'),
	('12049', 'Administration—Other'),
	('12051', 'Introductory Business'),
	('12052', 'Business Management'),
	('12053', 'Entrepreneurship'),
	('12054', 'Business Law'),
	('12055', 'Business Principles and Management'),
	('12056', 'International Business and Marketing'),
	('12057', 'Human Resources and Labor Relations'),
	('12058', 'Human Resources Management'),
	('12059', 'IB Business Management'),
	('12060', 'Business Ethics'),
	('12097', 'Management—Independent Study'),
	('12098', 'Management—Workplace Experience'),
	('12099', 'Management—Other'),
	('12101', 'Banking and Finance'),
	('12102', 'Banking'),
	('12103', 'Finance'),
	('12104', 'Accounting'),
	('12105', 'Business Economics'),
	('12106', 'Risk Management and Insurance'),
	('12107', 'Securities and Investments'),
	('12108', 'Cost Accounting'),
	('12109', 'Income Tax Accounting'),
	('12110', 'Payroll Accounting'),
	('12111', 'Particular Topics in Accounting'),
	('12147', 'Finance—Independent Study'),
	('12148', 'Finance—Workplace Experience'),
	('12149', 'Finance—Other'),
	('12151', 'Marketing Career Exploration'),
	('12152', 'Marketing—Comprehensive'),
	('12153', 'Marketing—Fashion'),
	('12154', 'Marketing—Real Estate'),
	('12155', 'Marketing—Transportation'),
	('12156', 'Marketing—Food/Beverage Industry'),
	('12157', 'Marketing—Insurance'),
	('12158', 'Marketing—Floristry'),
	('12159', 'Marketing—Hospitality/Tourism'),
	('12160', 'Marketing—Merchandising'),
	('12161', 'Retail Marketing'),
	('12162', 'Internet Marketing'),
	('12163', 'Sports and Entertainment Marketing'),
	('12164', 'Principles of Marketing'),
	('12165', 'Principles of Advertising'),
	('12166', 'Marketing Management'),
	('12167', 'Marketing—Other Specialization'),
	('12168', 'Marketing —Commodities'),
	('12169', 'Social Media Marketing'),
	('12197', 'Marketing—Independent Study'),
	('12198', 'Marketing—Workplace Experience'),
	('12199', 'Marketing—Other'),
	('12201', 'Cashier/Checker Operations'),
	('12202', 'Principles of Selling'),
	('12247', 'Sales—Independent Study'),
	('12248', 'Sales—Workplace Experience'),
	('12249', 'Sales—Other'),
	('12993', 'Business and Marketing—School-based Enterprise'),
	('12994', 'Business and Marketing—Career Project-based Learning'),
	('12995', 'Business and Marketing—Aide'),
	('12997', 'Business and Marketing—Independent Study'),
	('12998', 'Business and Marketing—Workplace Experience'),
	('12999', 'Business and Marketing—Other'),
	('13001', 'Exploration of Manufacturing Occupations'),
	('13002', 'Manufacturing—Comprehensive'),
	('13003', 'Industrial Arts'),
	('13004', 'Industrial Safety/First Aid'),
	('13052', 'Material and Processes'),
	('13053', 'Metal and Wood Processing/Production'),
	('13054', 'Wood Processing/Production'),
	('13055', 'Metal Processing/Production'),
	('13056', 'Plastics Processing/Production'),
	('13057', 'Ceramic Processing/Production'),
	('13058', 'Particular Topics in Processing and Production'),
	('13097', 'Processing/Production—Independent Study'),
	('13098', 'Processing/Production—Workplace Experience'),
	('13099', 'Processing/Production—Other'),
	('13101', 'Production Systems'),
	('13102', 'Electro-Mechanical Systems'),
	('13103', 'Product Development'),
	('13104', 'Mechatronics'),
	('13147', 'Production Systems—Independent Study'),
	('13148', 'Production Systems—Workplace Experience'),
	('13149', 'Production Systems—Other'),
	('13201', 'Metalwork Occupations'),
	('13202', 'Metalworking'),
	('13203', 'Machining'),
	('13204', 'Particular Topics in Machining'),
	('13205', 'Sheet Metal'),
	('13206', 'Particular Topics in Sheet Metal'),
	('13207', 'Welding'),
	('13208', 'Particular Topics in Welding'),
	('13209', 'Particular Topics in Metalwork'),
	('13247', 'Metalwork—Independent Study'),
	('13248', 'Metalwork—Workplace Experience'),
	('13249', 'Metalwork—Other'),
	('13301', 'Appliance Repair'),
	('13302', 'Equipment Maintenance and Repair'),
	('13303', 'Industrial Maintenance'),
	('13347', 'Repair—Independent Study'),
	('13348', 'Repair—Workplace Experience'),
	('13349', 'Repair—Other'),
	('13993', 'Manufacturing—School-based Enterprise'),
	('13994', 'Manufacturing—Career Project-based Learning'),
	('13995', 'Manufacturing—Aide'),
	('13997', 'Manufacturing—Independent Study'),
	('13998', 'Manufacturing—Workplace Experience'),
	('13999', 'Manufacturing—Other'),
	('14001', 'Exploration of Health Care Occupations'),
	('14002', 'Health Care Occupations—Comprehensive'),
	('14003', 'Medical Law and Ethics'),
	('14051', 'Nursing'),
	('14052', 'Nursing—LPN'),
	('14053', 'Home Health Care'),
	('14054', 'Dental Science'),
	('14055', 'Emergency Medical Technology'),
	('14056', 'Surgical Technology'),
	('14057', 'Vision Care'),
	('14058', 'Optometrics'),
	('14059', 'Gerontology'),
	('14060', 'Physical Therapy'),
	('14061', 'Respiratory Therapy'),
	('14062', 'Sports Medicine'),
	('14063', 'Particular Topics in Therapeutic Services'),
	('14097', 'Therapeutic Services—Independent Study'),
	('14098', 'Therapeutic Services—Workplace Experience'),
	('14099', 'Therapeutic Services—Other'),
	('14101', 'Dental Laboratory Technology'),
	('14102', 'Medical Lab Technology'),
	('14103', 'EKG Technology'),
	('14104', 'Phlebotomy'),
	('14105', 'Particular Topics in Diagnostic Services'),
	('14147', 'Diagnostic Services—Independent Study'),
	('14148', 'Diagnostic Services—Workplace Experience'),
	('14149', 'Diagnostic Services—Other'),
	('14151', 'Medical/Clerical Assisting'),
	('14152', 'Pharmacy Assisting'),
	('14153', 'Medical Office Procedures'),
	('14154', 'Medical Terminology'),
	('14155', 'Particular Topics in Health Information'),
	('14156', 'Medical Coding and Transcription'),
	('14157', 'Health Informatics and Data Management'),
	('14197', 'Health Information—Independent Study'),
	('14198', 'Health Information—Workplace Experience'),
	('14199', 'Health Information—Other'),
	('14201', 'Central Service Technology'),
	('14202', 'Health Support Services'),
	('14203', 'Health Unit Coordination'),
	('14204', 'Particular Topics in Health Support Services'),
	('14247', 'Health Support Services—Independent Study'),
	('14248', 'Health Support Services—Workplace Experience'),
	('14249', 'Health Support Services—Other'),
	('14251', 'Health Science'),
	('14252', 'Biotechnology'),
	('14253', 'Pharmacology'),
	('14254', 'Particular Topics in Health Sciences'),
	('14255', 'Biomedical Innovation'),
	('14297', 'Health Sciences—Independent Study'),
	('14298', 'Health Sciences—Workplace Experience'),
	('14299', 'Health Sciences—Other'),
	('14993', 'Health Care Sciences—School-based Enterprise'),
	('14994', 'Health Care Sciences—Career Project-based Learning'),
	('14995', 'Health Care Sciences—Aide'),
	('14997', 'Health Care Sciences—Independent Study'),
	('14998', 'Health Care Sciences—Workplace Experience'),
	('14999', 'Health Care Sciences—Other'),
	('15001', 'Exploration of Public Service Careers'),
	('15051', 'Criminal Justice'),
	('15052', 'Corrections'),
	('15053', 'Particular Topics in Law Enforcement'),
	('15054', 'Law Enforcement'),
	('15055', 'Forensic Science'),
	('15056', 'Crime Scene Management'),
	('15057', 'Criminal Law and Procedures'),
	('15058', 'Ethics in Criminal Justice'),
	('15097', 'Law Enforcement—Independent Study'),
	('15098', 'Law Enforcement—Workplace Experience'),
	('15099', 'Law Enforcement—Other'),
	('15101', 'Public Safety'),
	('15102', 'Security Services'),
	('15103', 'Particular Topics in Security'),
	('15104', 'Public Safety Telecommunications'),
	('15147', 'Security and Protection—Independent Study'),
	('15148', 'Security and Protection—Workplace Experience'),
	('15149', 'Security and Protection—Other'),
	('15151', 'Fire Science'),
	('15152', 'Fire Fighting'),
	('15153', 'Particular Topics in Fire Management'),
	('15197', 'Fire Management—Independent Study'),
	('15198', 'Fire Management—Workplace Experience'),
	('15199', 'Fire Management—Other'),
	('15201', 'Public Administration'),
	('15202', 'Community Protection'),
	('15203', 'Public Policy'),
	('15247', 'Government Service—Independent Study'),
	('15248', 'Government Service—Workplace Experience'),
	('15249', 'Government Service—Other'),
	('15993', 'Public, Protective, and Government Service—School-based Enterprise'),
	('15994', 'Public, Protective, and Government Service—Career Project-based Learning'),
	('15995', 'Public, Protective, and Government Service—Aide'),
	('15997', 'Public, Protective, and Government Service—Independent Study'),
	('15998', 'Public, Protective, and Government Service—Workplace Experience'),
	('15999', 'Public, Protective, and Government Service—Other'),
	('16001', 'Exploration of Hospitality Careers'),
	('16051', 'Exploration of Restaurant, Food and Beverage Services'),
	('16052', 'Restaurant, Food and Beverage Services—Comprehensive'),
	('16053', 'Food Service'),
	('16054', 'Nutrition and Food Preparation'),
	('16055', 'Restaurant Management and Operations'),
	('16056', 'Culinary Art Specialty'),
	('16057', 'Particular Topics in Restaurant, Food and Beverage Services'),
	('16097', 'Restaurant, Food and Beverage Services—Independent Study'),
	('16098', 'Restaurant, Food and Beverage Services—Workplace Experience'),
	('16099', 'Restaurant, Food and Beverage Services—Other'),
	('16101', 'Exploration of Lodging Careers'),
	('16102', 'Lodging—Comprehensive'),
	('16103', 'Institutional Maintenance'),
	('16104', 'Particular Topics in Lodging'),
	('16147', 'Lodging—Independent Study'),
	('16148', 'Lodging—Workplace Experience'),
	('16149', 'Lodging—Other'),
	('16151', 'Introduction to Travel and Tourism'),
	('16152', 'Travel and Tourism—Comprehensive'),
	('16153', 'World Travel and Tourism'),
	('16154', 'Eco-tourism'),
	('16155', 'Particular Topics in Travel and Tourism'),
	('16197', 'Travel and Tourism—Independent Study'),
	('16198', 'Travel and Tourism—Workplace Experience'),
	('16199', 'Travel and Tourism—Other'),
	('16201', 'Exploration of Recreation, Amusement and Attractions'),
	('16202', 'Recreation, Amusement and Attractions—Comprehensive'),
	('16203', 'Particular Topics in Recreation, Amusement and Attractions'),
	('16204', 'Recreation, Amusement, and Attractions Management'),
	('16247', 'Recreation, Amusement and Attractions—Independent Study'),
	('16248', 'Recreation, Amusement and Attractions—Workplace Experience'),
	('16249', 'Recreation, Amusement and Attractions—Other'),
	('16993', 'Hospitality and Tourism—School-based Enterprise'),
	('16994', 'Hospitality and Tourism—Career Project-based Learning'),
	('16995', 'Hospitality and Tourism—Aide'),
	('16997', 'Hospitality and Tourism—Independent Study'),
	('16998', 'Hospitality and Tourism—Workplace Experience'),
	('16999', 'Hospitality and Tourism—Other'),
	('17001', 'Construction Careers Exploration'),
	('17002', 'Construction—Comprehensive'),
	('17003', 'Carpentry'),
	('17004', 'Framing Carpentry'),
	('17005', 'Particular Topics in Carpentry'),
	('17006', 'Woodworking'),
	('17007', 'Cabinetmaking'),
	('17008', 'Masonry'),
	('17009', 'Building Repair and Maintenance'),
	('17010', 'Home Maintenance'),
	('17011', 'Wall Finishings'),
	('17012', 'Upholstering'),
	('17013', 'Commercial Construction'),
	('17014', 'Concrete Foundations'),
	('17015', 'Construction Estimating'),
	('17016', 'Construction Management'),
	('17017', 'Particular Topics in Construction'),
	('17047', 'General Construction—Independent Study'),
('17048', 'General Construction—Workplace Experience'),
('17049', 'General Construction—Other'),
('17051', 'Air Conditioning'),
('17052', 'Refrigeration'),
('17053', 'Heating'),
('17054', 'Air Conditioning/Refrigeration'),
('17055', 'Air Conditioning, Heating, and Refrigeration'),
('17056', 'Heating, Ventilation, and Air Conditioning'),
('17057', 'Particular Topics in HVACR'),
('17058', 'Plumbing'),
('17059', 'Plumbing and Heating'),
('17097', 'Air Conditioning, Heating and Plumbing—Independent Study'),
('17098', 'Air Conditioning, Heating and Plumbing—Workplace Experience'),
('17099', 'Air Conditioning, Heating and Plumbing—Other'),
('17101', 'Exploration of Electricity/Electronics'),
('17102', 'Electricity—Comprehensive'),
('17103', 'Residential Wiring'),
('17104', 'Industrial Electricity'),
('17105', 'Particular Topics in Electricity'),
('17106', 'Electronics—Comprehensive'),
('17107', 'Particular Topics in Electronics'),
('17108', 'Electricity/Electronics—General'),
('17109', 'Particular Topics in Electricity/Electronics'),
('17110', 'Analog and Digital Circuits'),
('17111', 'Analog Circuits'),
('17112', 'Digital Circuits'),
('17147', 'Electricity/Electronics—Independent Study'),
('17148', 'Electricity/Electronics—Workplace Experience'),
('17149', 'Electricity/Electronics—Other'),
('17993', 'Architecture and Construction—School-based Enterprise'),
('17994', 'Architecture and Construction—Career Project-based Learning'),
('17995', 'Architecture and Construction—Aide'),
('17997', 'Architecture and Construction—Independent study'),
('17998', 'Architecture and Construction—Workplace Experience'),
('17999', 'Architecture and Construction—Other'),
('18001', 'Introduction to Agriculture and Natural Resources'),
('18002', 'Agriculture—Comprehensive'),
('18003', 'Agriculture and Natural Resources—Comprehensive'),
('18004', 'Biological Applications in Agriculture'),
('18005', 'Particular Topics in Environmental Service Systems'),
('18051', 'Plant Systems/Science'),
('18052', 'Horticultural Science'),
('18053', 'Ornamental Horticulture'),
('18054', 'Turf and Landscape Management'),
('18055', 'Soil Science'),
('18056', 'Particular Topics in Plant Systems'),
('18097', 'Plant Systems—Independent Study'),
('18098', 'Plant Systems—Workplace Experience'),
('18099', 'Plant Systems—Other'),
('18101', 'Animal Production/Science'),
('18102', 'Small Animal Care'),
('18103', 'Large Animal Care'),
('18104', 'Equine Science'),
('18105', 'Veterinary Science'),
('18106', 'Particular Topics in Animal Systems'),
('18107', 'Animal Nutrition'),
('18108', 'Animal Genetics'),
('18109', 'Integrated Pest Management'),
('18147', 'Animal Systems—Independent Study'),
('18148', 'Animal Systems—Workplace Experience'),
('18149', 'Animal Systems—Other'),
('18201', 'Agribusiness Management'),
('18202', 'Agricultural Entrepreneurship'),
('18203', 'Agricultural Leadership'),
('18204', 'Particular Topics in Agribusiness'),
('18205', 'Agriculture Computers and Technology'),
('18247', 'Agribusiness—Independent Study'),
('18248', 'Agribusiness—Workplace Experience'),
('18249', 'Agribusiness—Other'),
('18301', 'Agricultural Production'),
('18302', 'Agricultural Processing'),
('18303', 'Plant Processing'),
('18304', 'Animal Processing'),
('18305', 'Food Product Processing'),
('18306', 'Aquaculture'),
('18307', 'Agriculture and Society'),
('18308', 'Agricultural Biotechnology'),
('18309', 'Particular Topics in Agricultural Production/Processing'),
('18310', 'Sustainable/Alternative Agriculture'),
('18311', 'Viticulture'),
('18347', 'Agricultural Production and Processing—Independent Study'),
('18348', 'Agricultural Production and Processing—Workplace Experience'),
('18349', 'Agricultural Production and Processing—Other'),
('18401', 'Agriculture Mechanics/Equipment/Structures'),
('18402', 'Agriculture Mechanics and Equipment'),
('18403', 'Agriculture Structures'),
('18404', 'Agricultural Metal Fabrication Technology'),
('18405', 'Particular Topics in Agricultural Mechanics and Construction'),
('18406', 'Water Treatment'),
('18447', 'Agricultural Mechanics and Construction—Independent Study'),
('18448', 'Agricultural Mechanics and Construction—Workplace Experience'),
('18449', 'Agricultural Mechanics and Construction—Other'),
('18501', 'Wildlife and Recreation Management'),
('18502', 'Forestry Management'),
('18503', 'Forestry Harvesting'),
('18504', 'Natural Resources Management'),
('18505', 'Particular Topics in Natural Resources'),
('18506', 'Alternative Energy'),
('18547', 'Natural Resources—Independent Study'),
('18548', 'Natural Resources—Workplace Experience'),
('18549', 'Natural Resources—Other'),
('18993', 'Agriculture, Food, and Natural Resources—School-based Enterprise'),
('18994', 'Agriculture, Food, and Natural Resources—Career Project-based Learning'),
('18995', 'Agriculture, Food, and Natural Resources—Aide'),
('18997', 'Agriculture, Food, and Natural Resources—Independent Study'),
('18998', 'Agriculture, Food, and Natural Resources—Workplace Experience'),
('18999', 'Agriculture, Food, and Natural Resources—Other'),
('19001', 'Human Services Career Exploration'),
('19051', 'Child Care'),
('19052', 'Child Development'),
('19053', 'Elder Care'),
('19054', 'Child and Adult Care Services'),
('19055', 'Particular Topics in Child and Elder Care'),
('19097', 'Child and Elder Care—Independent Study'),
('19098', 'Child and Elder Care—Workplace Experience'),
('19099', 'Child and Elder Care—Other'),
('19101', 'Cosmetology—Licensing'),
('19102', 'Barbering'),
('19103', 'Hair Styling'),
('19104', 'Cosmetology—Non-licensing'),
('19105', 'Cosmetology—Nail Specialization'),
('19106', 'Cosmetology—Facial Specialization'),
('19107', 'Particular Topics in Cosmetology'),
('19147', 'Cosmetology—Independent Study'),
('19148', 'Cosmetology—Workplace Experience'),
('19149', 'Cosmetology—Other'),
('19151', 'Teaching Profession'),
('19152', 'Educational Methodology'),
('19153', 'Teaching—Early Childhood Education'),
('19154', 'Particular Topics in Education'),
('19155', 'Instructional Technology'),
('19197', 'Education—Independent Study'),
('19198', 'Education—Workplace Experience'),
('19199', 'Education—Other'),
('19201', 'Clothing and Textiles'),
('19202', 'Clothing/Textile Maintenance'),
('19203', 'Apparel Construction'),
('19204', 'Apparel and Textile Services'),
('19205', 'Home Furnishing'),
('19206', 'Home Furnishings Production'),
('19207', 'Particular Topics in Apparel and Furnishings'),
('19247', 'Apparel and Furnishings—Independent Study'),
('19248', 'Apparel and Furnishings—Workplace Experience'),
('19249', 'Apparel and Furnishings—Other'),
('19251', 'Family and Consumer Sciences—Comprehensive'),
('19252', 'Food Preparation and Health Management'),
('19253', 'Nutrition and Wellness'),
('19254', 'Food Science'),
('19255', 'Child Development/Parenting'),
('19256', 'Clothing/Sewing'),
('19257', 'Life Skills'),
('19258', 'Personal and Career Readiness'),
('19259', 'Family and Interpersonal Relationships'),
('19260', 'Personal Development'),
('19261', 'Human Growth and Development'),
('19262', 'Consumer Economics/Personal Finance'),
('19263', 'Home Environments and Design'),
('19295', 'Family and Consumer Sciences—Aide'),
('19297', 'Family and Consumer Sciences—Independent Study'),
('19298', 'Family and Consumer Sciences—Workplace Experience'),
('19299', 'Family and Consumer Sciences—Other'),
('19301', 'Counseling and Mental Health'),
('19993', 'Human Services—School-based Enterprise'),
('19994', 'Human Services—Career Project-based Learning'),
('19995', 'Human Services—Aide'),
('19997', 'Human Services—Independent Study'),
('19998', 'Human Services—Workplace Experience'),
('19999', 'Human Services—Other'),
('20001', 'Exploration of Transportation, Distribution and Logistics'),
('20051', 'Truck and Bus Driving'),
('20052', 'Heavy Equipment Operation'),
('20053', 'Aviation'),
('20054', 'Boat Operation'),
('20055', 'Pilot Training'),
('20097', 'Operation—Independent Study'),
('20098', 'Operation—Workplace Experience'),
('20099', 'Operation—Other'),
('20101', 'Energy/Power'),
('20102', 'Power and Mechanics'),
('20103', 'Introduction to Automobiles'),
('20104', 'Automotive Mechanics—Comprehensive'),
('20105', 'Particular Topics in Automotive Mechanics'),
('20106', 'Automotive Service'),
('20107', 'Diesel Mechanics—Comprehensive'),
('20108', 'Particular Topics in Diesel Mechanics'),
('20109', 'Small Vehicle Mechanics'),
('20110', 'Small Engine Mechanics'),
('20111', 'Marine Mechanics'),
('20112', 'Heavy Equipment Mechanics'),
('20113', 'Aircraft Power Plant'),
('20114', 'Aircraft Airframe'),
('20115', 'Automotive Detailing and Reconditioning'),
('20116', 'Automotive Body Repair and Refinishing—Comprehensive'),
('20117', 'Particular Topics in Automotive Body Repair and Refinishing'),
('20118', 'Boat Repair/Refinishing'),
('20119', 'Hybrid Engines'),
('20120', 'Motorsports Technology'),
('20147', 'Mechanics and Repair—Independent Study'),
('20148', 'Mechanics and Repair—Workplace Experience'),
('20149', 'Mechanics and Repair—Other'),
('20151', 'Distribution—Comprehensive'),
('20152', 'Warehouse Operations'),
('20197', 'Distribution and Logistics—Independent Study'),
('20198', 'Distribution and Logistics—Workplace Experience'),
('20199', 'Distribution and Logistics—Other'),
('20993', 'Transportation, Distribution, and Logistics—School-based Enterprise'),
('20994', 'Transportation, Distribution, and Logistics—Career Project-based Learning'),
('20995', 'Transportation, Distribution and Logistics—Aide'),
('20997', 'Transportation, Distribution and Logistics—Independent Study'),
('20998', 'Transportation, Distribution and Logistics—Workplace Experience'),
('20999', 'Transportation, Distribution and Logistics—Other'),
('21001', 'Pre-Engineering Technology'),
('21002', 'Engineering Applications'),
('21003', 'Engineering Technology'),
('21004', 'Principles of Engineering'),
('21005', 'Engineering—Comprehensive'),
('21006', 'Engineering Design'),
('21007', 'Engineering Design and Development'),
('21008', 'Digital Electronics'),
('21009', 'Robotics'),
('21010', 'Computer Integrated Manufacturing'),
('21011', 'Civil Engineering'),
('21012', 'Civil Engineering and Architecture'),
('21013', 'Aerospace Engineering'),
('21014', 'Biotechnical Engineering'),
('21015', 'Particular Topics in Engineering'),
('21016', 'Engineering Analysis'),
('21017', 'PLTW Introduction to Engineering Design'),
('21018', 'PLTW Principles of Engineering'),
('21019', 'PLTW Aerospace Engineering'),
('21020', 'PLTW Biological Engineering'),
('21021', 'PLTW Civil Engineering and Architecture'),
('21022', 'PLTW Computer Integrated Manufacturing'),
('21023', 'PLTW Digital Electronics'),
('21024', 'PLTW Environmental Sustainability'),
('21025', 'PLTW Engineering Design and Development '),
('21026', 'PLTW Engineering Essentials'),
('21047', 'Engineering—Independent Study'),
('21048', 'Engineering—Workplace Experience'),
('21049', 'Engineering—Other'),
('21051', 'Technological Literacy'),
('21052', 'Technological Processes'),
('21053', 'Emerging Technologies'),
('21054', 'Technology Innovation and Assessment'),
('21055', 'Aerospace Technology'),
('21056', 'Particular Topics in Technology Applications'),
('21057', 'Laser/Fiber Optics'),
('21058', 'Geospatial Technology'),
('21059', 'Modeling and Simulation Technology'),
('21060', 'Wind Energy'),
('21061', 'Wind Turbine Construction and Operation'),
('21062', 'IB Design, Middle Years Program'),
('21097', 'Technology—Independent Study'),
('21098', 'Technology—Workplace Experience'),
('21099', 'Technology—Other'),
('21101', 'Drafting Careers Exploration'),
('21102', 'Drafting—General'),
('21103', 'Drafting—Architectural'),
('21104', 'Drafting—Civil/Structural'),
('21105', 'Drafting—Electrical/Electronic'),
('21106', 'Drafting—Technical/Mechanical'),
('21107', 'CAD Design and Software'),
('21108', 'Blueprint Reading'),
('21147', 'Drafting—Independent Study'),
('21148', 'Drafting—Workplace Experience'),
('21149', 'Drafting—Other'),
('21993', 'Engineering and Technology—School-based Enterprise'),
('21994', 'Engineering and Technology—Career Project-based Learning'),
('21995', 'Engineering and Technology—Aide'),
('21997', 'Engineering and Technology—Independent Study'),
('21998', 'Engineering and Technology—Workplace Experience'),
('21999', 'Engineering and Technology—Other'),
('22001', 'Standardized Test Preparation'),
('22002', 'State Test Preparation'),
('22003', 'Study Skills'),
('22004', 'Dropout Prevention Program'),
('22005', 'Tutorial'),
('22006', 'Study Hall'),
('22007', 'Advancement Via Individual Determination (AVID)'),
('22051', 'Office Aide'),
('22052', 'Guidance Aide'),
('22053', 'Library/AVC Aide'),
('22054', 'Tutoring Practicum'),
('22101', 'Leadership'),
('22102', 'School Orientation'),
('22103', 'School Governance'),
('22104', 'Community Service'),
('22105', 'Values Clarification'),
('22106', 'Seminar'),
('22107', 'Peer Counseling'),
('22108', 'IB Creativity, Activity, Service'),
('22109', 'IB Extended Essay'),
('22110', 'AP Seminar'),
('22111', 'IB Approaches to Learning'),
('22112', 'AP Research'),
('22113', 'IB Personal and Professional Skills'),
('22114', 'Personal and Professional Skills'),
('22115', 'Academic Competition'),
('22151', 'Career Exploration'),
('22152', 'Employability Skills'),
('22153', 'Diversified Occupations'),
('22160', 'Data Literacy'),
('22161', 'Data Science'),
('22162', 'Data Science Applications'),
('22201', 'Family and Consumer Science—Comprehensive'),
('22202', 'Food and Nutrition'),
('22203', 'Food Science'),
('22204', 'Child Development/Parenting'),
('22205', 'Clothing/Sewing'),
('22206', 'Life Skills'),
('22207', 'Self Management'),
('22208', 'Family Living'),
('22209', 'Personal Development'),
('22210', 'Consumer Economics/Personal Finance'),
('22211', 'Home Décor'),
('22245', 'Family and Consumer Science—Aide'),
('22247', 'Family and Consumer Science—Independent Study'),
('22249', 'Family and Consumer Science—Other'),
('22250', 'Exploratory'),
('22251', 'Community Living'),
('22252', 'Communication Instruction'),
('22253', 'Social Development Instruction'),
('22254', 'Developmental Support'),
('22260', 'IB Personal Project, Middle Years Program'),
('22995', 'Miscellaneous—Aide'),
('22997', 'Miscellaneous—Independent Study'),
('22998', 'Miscellaneous—Workplace Experience'),
('22999', 'Miscellaneous—Other'),
('23001', 'Early Childhood Education'),
('23002', 'Pre-kindergarten'),
('23003', 'Kindergarten'),
('23004', 'Grade 1'),
('23005', 'Grade 2'),
('23006', 'Grade 3'),
('23007', 'Grade 4'),
('23008', 'Grade 5'),
('23009', 'Grade 6'),
('23010', 'Grade 7'),
('23011', 'Grade 8'),
('23012', 'Prior-to-Secondary Education'),
('23041', 'IB Primary Years Program'),
('24039', 'World Language—General'),
('24040', 'Exploration of Multiple World Languages '),
('24041', 'Braille'),
('24042', 'IB Language B—English '),
('24043', 'IB Language Ab Initio—English'),
('24050', 'Spanish for Young Learners (prior-to-secondary)'),
('24051', 'Spanish Immersion (prior-to-secondary)'),
('24052', 'Spanish I '),
('24053', 'Spanish II '),
('24054', 'Spanish III '),
('24055', 'Spanish IV '),
('24056', 'Spanish V '),
('24057', 'Spanish for Native Speakers '),
('24058', 'Spanish Field Experience '),
('24059', 'Spanish Conversation and Culture '),
('24060', 'Spanish Literature '),
('24061', 'Particular Topics in Spanish'),
('24062', 'IB Language A: Literature—Spanish'),
('24063', 'IB Language B—Spanish '),
('24064', 'AP Spanish Language and Culture '),
('24065', 'AP Spanish Literature and Culture'),
('24066', 'IB Language B (Spanish), Middle Years Program'),
('24067', 'IB Language A: Language and Literature—Spanish'),
('24068', 'IB Language Ab Initio—Spanish'),
('24099', 'Spanish—Other'),
('24100', 'French for Young Learners (prior-to-secondary)'),
('24101', 'French Immersion (prior-to-secondary)'),
('24102', 'French I '),
('24103', 'French II '),
('24104', 'French III '),
('24105', 'French IV '),
('24106', 'French V '),
('24107', 'French for Native Speakers '),
('24108', 'French Field Experience '),
('24109', 'French Conversation and Culture '),
('24110', 'French Literature '),
('24111', 'Particular Topics in French'),
('24112', 'IB Language A: Literature—French'),
('24113', 'IB Language B—French '),
('24114', 'AP French Language and Culture'),
('24116', 'IB Language B (French), Middle Years Program'),
('24117', 'IB Language A: Language and Literature—French'),
('24118', 'IB Language Ab Initio—French'),
('24149', 'French—Other'),
('24150', 'Italian for Young Learners (prior-to-secondary)'),
('24151', 'Italian Immersion (prior-to-secondary)'),
('24152', 'Italian I '),
('24153', 'Italian II '),
('24154', 'Italian III '),
('24155', 'Italian IV '),
('24156', 'Italian V '),
('24157', 'Italian for Native Speakers '),
('24158', 'Italian Field Experience '),
('24159', 'Italian Conversation and Culture '),
('24160', 'Italian Literature '),
('24161', 'Particular Topics in Italian'),
('24162', 'IB Language A: Literature—Italian'),
('24163', 'IB Language B—Italian '),
('24164', 'AP Italian Language and Culture'),
('24166', 'IB Language B (Italian), Middle Years Program'),
('24167', 'IB Language A: Language and Literature—Italian'),
('24168', 'IB Language Ab Initio—Italian'),
('24199', 'Italian—Other'),
('24200', 'Portuguese for Young Learners (prior-to-secondary)'),
('24201', 'Portuguese Immersion (prior-to-secondary)'),
('24202', 'Portuguese I '),
('24203', 'Portuguese II '),
('24204', 'Portuguese III '),
('24205', 'Portuguese IV '),
('24206', 'Portuguese V '),
('24207', 'Portuguese for Native Speakers '),
('24208', 'Portuguese Field Experience '),
('24209', 'Portuguese Conversation and Culture '),
('24210', 'Portuguese Literature '),
('24211', 'Particular Topics in Portuguese'),
('24212', 'IB Language A: Literature—Portuguese'),
('24213', 'IB Language B—Portuguese '),
('24216', 'IB Language B (Portuguese), Middle Years Program'),
('24217', 'IB Language A: Language and Literature—Portuguese'),
('24249', 'Portuguese—Other'),
('24250', 'German for Young Learners (prior-to-secondary)'),
('24251', 'German Immersion (prior-to-secondary)'),
('24252', 'German I '),
('24253', 'German II '),
('24254', 'German III '),
('24255', 'German IV '),
('24256', 'German V '),
('24257', 'German for Native Speakers '),
('24258', 'German Field Experience '),
('24259', 'German Conversation and Culture '),
('24260', 'German Literature ')

INSERT INTO #ScedCodes VALUES
('24261', 'Particular Topics in German'),
('24262', 'IB Language A: Literature—German'),
('24263', 'IB Language B—German '),
('24264', 'AP German Language and Culture '),
('24266', 'IB Language B (German), Middle Years Program'),
('24267', 'IB Language A: Language and Literature—German'),
('24268', 'IB Language Ab Initio—German'),
('24269', 'IB Language A: Literature—Danish'),
('24270', 'IB Language A: Literature—Dutch'),
('24271', 'IB Language A: Literature—Swedish'),
('24272', 'IB Language B—Danish'),
('24273', 'IB Language B—Dutch'),
('24274', 'IB Language B—Swedish'),
('24275', 'IB Language A: Language and Literature—Dutch'),
('24276', 'IB Language A: Language and Literature—Swedish'),
('24277', 'IB Language Ab Initio—Danish'),
('24278', 'IB Language Ab Initio—Dutch'),
('24279', 'IB Language Ab Initio—Swedish'),
('24299', 'German—Other '),
('24300', 'Greek for Young Learners (prior-to-secondary)'),
('24301', 'Greek Immersion (prior-to-secondary)'),
('24302', 'Greek I '),
('24303', 'Greek II '),
('24304', 'Greek III '),
('24305', 'Greek IV '),
('24306', 'Greek V '),
('24307', 'Greek for Native Speakers '),
('24308', 'Greek Field Experience '),
('24309', 'Greek Conversation and Culture '),
('24310', 'Greek Literature '),
('24311', 'Particular Topics in Greek'),
('24312', 'IB Language A: Literature—Greek'),
('24316', 'IB Language B (Greek), Middle Years Program'),
('24317', 'IB Language A: Language and Literature—Greek'),
('24339', 'Greek—Other '),
('24340', 'Latin for Young Learners (prior-to-secondary)'),
('24342', 'Latin I '),
('24343', 'Latin II '),
('24344', 'Latin III '),
('24345', 'Latin IV '),
('24346', 'Latin V '),
('24351', 'Particular Topics in Latin'),
('24352', 'IB Classical Languages—Latin '),
('24355', 'AP Latin (Virgil, Catullus and Horace) '),
('24369', 'Latin—Other '),
('24370', 'Classical Greek for Young Learners (prior-to-secondary)'),
('24372', 'Classical Greek I '),
('24373', 'Classical Greek II '),
('24374', 'Classical Greek III '),
('24375', 'Classical Greek IV '),
('24376', 'Classical Greek V '),
('24381', 'Particular Topics in Classical Greek'),
('24382', 'IB Classical Languages—Greek '),
('24389', 'Classical Greek—Other '),
('24390', 'Classical Hebrew for Young Learners (prior-to-secondary)'),
('24391', 'Classical Hebrew I '),
('24392', 'Classical Hebrew II '),
('24393', 'Classical Hebrew III '),
('24394', 'Classical Hebrew IV '),
('24395', 'Classical Hebrew V '),
('24396', 'Particular Topics in Classical Hebrew'),
('24399', 'Classical Hebrew—Other '),
('24400', 'Chinese Languages for Young Learners (prior-to-secondary)'),
('24401', 'Chinese Languages Immersion (prior-to-secondary)'),
('24402', 'Chinese Languages I'),
('24403', 'Chinese Languages II'),
('24404', 'Chinese Languages III'),
('24405', 'Chinese Languages IV'),
('24406', 'Chinese Languages V'),
('24407', 'Chinese Languages for Native Speakers'),
('24408', 'Chinese Languages Field Experience'),
('24409', 'Chinese Languages Conversation and Culture'),
('24410', 'Chinese Languages Literature'),
('24411', 'Particular Topics in Chinese Languages'),
('24412', 'IB Language A: Literature—Chinese Languages'),
('24413', 'IB Language B—Chinese Languages'),
('24414', 'AP Chinese Languages: Language and Culture'),
('24416', 'IB Language B (Chinese Languages), Middle Years Program'),
('24417', 'IB Language A: Language and Literature—Chinese Languages'),
('24418', 'IB Language Ab Initio—Chinese Languages'),
('24449', 'Chinese—Other '),
('24450', 'Japanese for Young Learners (prior-to-secondary)'),
('24451', 'Japanese Immersion (prior-to-secondary)'),
('24452', 'Japanese I '),
('24453', 'Japanese II '),
('24454', 'Japanese III '),
('24455', 'Japanese IV '),
('24456', 'Japanese V '),
('24457', 'Japanese for Native Speakers '),
('24458', 'Japanese Field Experience '),
('24459', 'Japanese Conversation and Culture '),
('24460', 'Japanese Literature '),
('24461', 'Particular Topics in Japanese'),
('24462', 'IB Language A: Literature—Japanese'),
('24463', 'IB Language B—Japanese '),
('24464', 'AP Japanese Language and Culture'),
('24466', 'IB Language B (Japanese), Middle Years Program'),
('24467', 'IB Language A: Language and Literature—Japanese'),
('24468', 'IB Language Ab Initio—Japanese'),
('24499', 'Japanese—Other '),
('24500', 'Korean for Young Learners (prior-to-secondary)'),
('24501', 'Korean Immersion (prior-to-secondary)'),
('24502', 'Korean I '),
('24503', 'Korean II '),
('24504', 'Korean III '),
('24505', 'Korean IV '),
('24506', 'Korean V '),
('24507', 'Korean for Native Speakers '),
('24508', 'Korean Field Experience '),
('24509', 'Korean Conversation and Culture '),
('24510', 'Korean Literature '),
('24511', 'Particular Topics in Korean'),
('24512', 'IB Language A: Literature—Korean'),
('24513', 'IB Language B—Korean '),
('24516', 'IB Language B (Korean), Middle Years Program'),
('24517', 'IB Language A: Language and Literature—Korean'),
('24549', 'Korean—Other '),
('24550', 'Vietnamese for Young Learners (prior-to-secondary)'),
('24551', 'Vietnamese Immersion (prior-to-secondary)'),
('24552', 'Vietnamese I '),
('24553', 'Vietnamese II '),
('24554', 'Vietnamese III '),
('24555', 'Vietnamese IV '),
('24556', 'Vietnamese V '),
('24557', 'Vietnamese for Native Speakers '),
('24558', 'Vietnamese Field Experience '),
('24559', 'Vietnamese Conversation and Culture '),
('24560', 'Vietnamese Literature '),
('24561', 'Particular Topics in Vietnamese'),
('24562', 'IB Language A: Literature—Vietnamese'),
('24566', 'IB Language B (Vietnamese), Middle Years Program'),
('24567', 'IB Language A: Language and Literature—Vietnamese'),
('24599', 'Vietnamese—Other '),
('24600', 'Filipino (prior-to-secondary)'),
('24601', 'Filipino Immersion (prior-to-secondary)'),
('24602', 'Filipino I '),
('24603', 'Filipino II '),
('24604', 'Filipino III '),
('24605', 'Filipino IV '),
('24606', 'Filipino V '),
('24607', 'Filipino for Native Speakers '),
('24608', 'Filipino Field Experience '),
('24609', 'Filipino Conversation and Culture '),
('24610', 'Filipino Literature '),
('24611', 'Particular Topics in Filipino'),
('24612', 'IB Language A: Literature—Filipino'),
('24616', 'IB Language B (Filipino), Middle Years Program'),
('24617', 'IB Language A: Language and Literature—Filipino'),
('24649', 'Filipino—Other '),
('24650', 'Russian (prior-to-secondary)'),
('24651', 'Russian Immersion (prior-to-secondary)'),
('24652', 'Russian I '),
('24653', 'Russian II '),
('24654', 'Russian III '),
('24655', 'Russian IV '),
('24656', 'Russian V '),
('24657', 'Russian for Native Speakers '),
('24658', 'Russian Field Experience '),
('24659', 'Russian Conversation and Culture '),
('24660', 'Russian Literature '),
('24661', 'Particular Topics in Russian'),
('24662', 'IB Language A: Literature—Russian '),
('24663', 'IB Language B—Russian '),
('24666', 'IB Language B (Russian), Middle Years Program'),
('24667', 'IB Language A: Language and Literature—Russian '),
('24668', 'IB Language Ab Initio—Russian'),
('24699', 'Russian—Other '),
('24700', 'Hebrew (prior-to-secondary)'),
('24701', 'Hebrew Immersion (prior-to-secondary)'),
('24702', 'Hebrew I '),
('24703', 'Hebrew II '),
('24704', 'Hebrew III '),
('24705', 'Hebrew IV '),
('24706', 'Hebrew V '),
('24707', 'Hebrew for Native Speakers '),
('24708', 'Hebrew Field Experience '),
('24709', 'Hebrew Conversation and Culture '),
('24710', 'Hebrew Literature '),
('24711', 'Particular Topics in Hebrew'),
('24712', 'IB Language A: Literature—Hebrew'),
('24713', 'IB Language B—Hebrew '),
('24716', 'IB Language B (Hebrew), Middle Years Program'),
('24717', 'IB Language A: Language and Literature—Hebrew'),
('24749', 'Hebrew—Other '),
('24750', 'Arabic (prior-to-secondary)'),
('24751', 'Arabic Immersion (prior-to-secondary)'),
('24752', 'Arabic I '),
('24753', 'Arabic II '),
('24754', 'Arabic III '),
('24755', 'Arabic IV '),
('24756', 'Arabic V '),
('24757', 'Arabic for Native Speakers '),
('24758', 'Arabic Field Experience '),
('24759', 'Arabic Conversation and Culture '),
('24760', 'Arabic Literature '),
('24761', 'Particular Topics in Arabic'),
('24762', 'IB Language A: Literature—Arabic'),
('24763', 'IB Language B—Arabic '),
('24766', 'IB Language B (Arabic), Middle Years Program'),
('24767', 'IB Language A: Language and Literature—Arabic'),
('24768', 'IB Language Ab Initio—Arabic'),
('24799', 'Arabic—Other '),
('24800', 'Swahili (prior-to-secondary)'),
('24801', 'Swahili Immersion (prior-to-secondary)'),
('24802', 'Swahili I '),
('24803', 'Swahili II '),
('24804', 'Swahili III '),
('24805', 'Swahili IV '),
('24806', 'Swahili V '),
('24807', 'Swahili for Native Speakers '),
('24808', 'Swahili Field Experience '),
('24809', 'Swahili Conversation and Culture '),
('24810', 'Swahili Literature '),
('24811', 'Particular Topics in Swahili'),
('24812', 'IB Language A: Literature—Swahili'),
('24816', 'IB Language B (Swahili), Middle Years Program'),
('24817', 'IB Language A: Language and Literature—Swahili'),
('24818', 'IB Language Ab Initio—Swahili'),
('24849', 'Swahili—Other '),
('24850', 'American Sign Language (prior-to-secondary)'),
('24851', 'American Sign Language Immersion (prior-to-secondary)'),
('24852', 'American Sign Language I '),
('24853', 'American Sign Language II '),
('24854', 'American Sign Language III '),
('24855', 'American Sign Language IV '),
('24856', 'American Sign Language V '),
('24858', 'American Sign Language Field Experience'),
('24861', 'Particular Topics in American Sign Language'),
('24866', 'IB Language B (American Sign Language), Middle Years Program'),
('24899', 'American Sign Language—Other '),
('24900', 'American Indian Language (prior-to-secondary)'),
('24901', 'American Indian Language Immersion (prior-to-secondary)'),
('24902', 'American Indian Language I '),
('24903', 'American Indian Language II '),
('24904', 'American Indian Language III '),
('24905', 'American Indian Language IV '),
('24906', 'American Indian Language V '),
('24907', 'American Indian Language for Native Speakers '),
('24908', 'American Indian Language Field Experience '),
('24909', 'American Indian Language Conversation and Culture '),
('24910', 'American Indian Literature '),
('24911', 'Particular Topics in American Indian Language'),
('24912', 'IB Language A: Literature—American Indian Language'),
('24913', 'IB Language B—American Indian Language '),
('24916', 'IB Language B (American Indian Language), Middle Years Program'),
('24917', 'IB Language A: Language and Literature—American Indian Language'),
('24949', 'American Indian Language—Other '),
('24950', 'World Language (Other Language) for Young Learners (prior-to-secondary)'),
('24951', 'World Language (Other Language) Immersion (prior-to-secondary)'),
('24952', 'World Language (Other Language) I '),
('24953', 'World Language (Other Language) II '),
('24954', 'World Language (Other Language) III '),
('24955', 'World Language (Other Language) IV '),
('24956', 'World Language (Other Language) V '),
('24957', 'World Language (Other Language) for Native Speakers '),
('24958', 'World Language (Other Language) Field Experience '),
('24959', 'World Language (Other Language) Conversation and Culture '),
('24960', 'World Language (Other Language) Literature '),
('24961', 'Particular Topics in World Language (Other Language)'),
('24962', 'IB Language A: Literature—World Language (Other Language)'),
('24963', 'IB Language B—World Language (Other Language) '),
('24966', 'IB Language B (Other World Language), Middle Years Program'),
('24967', 'IB Language A: Language and Literature—(Other World Language)'),
('24968', 'IB Language Ab Initio—(Other World Language)'),
('24989', 'World Language (Other Language)—Other '),
('24995', 'World Language and Literature—Aide '),
('24997', 'World Language and Literature—Independent Study '),
('24998', 'World Language and Literature—Workplace Experience '),
('24999', 'World Language and Literature—Other '),
('51009', 'Language Arts Laboratory'),
('51053', 'Literature'),
('51066', 'Strategic Reading'),
('51067', 'Assisted Reading'),
('51068', 'Corrective Reading'),
('51097', 'Literature—Independent Study'),
('51099', 'Literature—Other'),
('51103', 'Composition'),
('51104', 'Creative Writing'),
('51147', 'Composition—Independent Study'),
('51149', 'Composition—Other'),
('51151', 'Public Speaking'),
('51155', 'Communications'),
('51199', 'Speech—Other'),
('51991', 'Language Arts Laboratory'),
('51992', 'English Proficiency Development'),
('51997', 'English Language and Literature—Independent Study'),
('51999', 'English Language and Literature—Other'),
('52001', 'Informal Mathematics'),
('52002', 'General Math'),
('52047', 'Foundation Math—Independent Study'),
('52049', 'Foundation Math—Other'),
('52051', 'Pre-Algebra'),
('52052', 'Algebra I'),
('52061', 'Integrated Math—Multiyear Equivalent'),
('52069', 'Algebra—Other'),
('52071', 'Informal Geometry'),
('52072', 'Geometry'),
('52073', 'Analytic Geometry'),
('52074', 'Principles of Algebra and Geometry'),
('52075', 'Particular Topics in Geometry'),
('52079', 'Geometry—Other'),
('52157', 'Consumer Math'),
('52991', 'History of Math'),
('52994', 'Mathematics Proficiency Development'),
('52997', 'Mathematics—Independent Study'),
('52999', 'Mathematics—Other'),
('53049', 'Earth Science—Other'),
('53051', 'Biology'),
('53063', 'Particular Topics in Biology'),
('53099', 'Biology—Other'),
('53101', 'Chemistry'),
('53108', 'Particular Topics in Chemistry'),
('53147', 'Chemistry—Independent Study'),
('53149', 'Chemistry—Other'),
('53151', 'Physics'),
('53162', 'Particular Topics in Physics'),
('53197', 'Physics—Independent Study'),
('53199', 'Physics—Other'),
('53201', 'Integrated Science'),
('53202', 'Unified Science'),
('53994', 'Life and Physical Sciences—Proficiency Development'),
('53997', 'Life and Physical Sciences—Independent Study'),
('53999', 'Life and Physical Sciences—Other'),
('54001', 'World Geography'),
('54002', 'Particular Topics in Geography'),
('54047', 'Geography—Independent Study'),
('54051', 'World History—Overview'),
('54061', 'World Area Studies'),
('54062', 'World People Studies'),
('54063', 'Western Civilization'),
('54064', 'Contemporary World Issues'),
('54097', 'World History—Independent Study'),
('54101', 'U.S. History—Comprehensive'),
('54105', 'State-Specific Studies'),
('54106', 'Contemporary U.S. Issues'),
('54149', 'U.S. History—Other'),
('54147', 'U.S. History—Independent Study'),
('54151', 'U.S. Government—Comprehensive'),
('54161', 'Civics'),
('54197', 'Government, Politics, and Law—Independent Study'),
('54199', 'Government, Politics, and Law—Other'),
('54997', 'Social Sciences and History—Independent Study'),
('54999', 'Social Sciences and History—Other'),
('55001', 'Dance Technique'),
('55002', 'Dance Repertory'),
('55003', 'Expressive Movement'),
('55004', 'Dance Appreciation'),
('55005', 'Choreography'),
('55047', 'Dance—Independent Study'),
('55049', 'Dance—Other'),
('55051', 'Introduction to the Theater'),
('55052', 'Theatre Arts'),
('55053', 'Drama—Comprehensive'),
('55054', 'Exploration in Drama'),
('55097', 'Drama—Independent Study'),
('55099', 'Drama—Other'),
('55101', 'General Band'),
('55102', 'Concert Band'),
('55103', 'Marching Band'),
('55104', 'Orchestra'),
('55105', 'Contemporary Band'),
('55106', 'Instrumental Ensembles'),
('55118', 'Music Appreciation'),
('55110', 'Chorus'),
('55111', 'Vocal Ensembles'),
('55116', 'Music History/Appreciation'),
('55147', 'Music—Independent Study'),
('55149', 'Music—Other'),
('55151', 'Art Appreciation'),
('55152', 'Art History'),
('55154', 'Creative Art—Comprehensive '),
('55155', 'Creative Art—Drawing/Painting '),
('55156', 'Creative Art—Drawing '),
('55157', 'Creative Art—Painting '),
('55158', 'Creative Art—Sculpture '),
('55159', 'Ceramics/Pottery '),
('55165', 'Crafts'),
('55167', 'Photography'),
('55168', 'Film/Videotape'),
('55197', 'Visual Art—Independent Study'),
('55199', 'Visual Arts—Other'),
('55201', 'Integrated Fine Arts'),
('55997', 'Fine and Performing Arts—Independent Study'),
('55999', 'Fine and Performing Arts—Other'),
('56997', 'Foreign Language and Literature—Independent Study'),
('56999', 'Foreign Language and Literature—Other'),
('57001', 'Religious Foundations'),
('57005', 'Scriptures'),
('57006', 'Old Testament'),
('57007', 'New Testament'),
('57008', 'Bible History'),
('57015', 'Faith and Lifestyle'),
('57997', 'Religious Education and Theology—Independent Study'),
('57999', 'Religious Education and Theology—Other'),
('58001', 'Physical Education'),
('58003', 'Individual/Dual Sports'),
('58004', 'Recreation Sports'),
('58005', 'Fitness/Conditioning Activities'),
('58007', 'Adapted Physical Education'),
('58008', 'Gymnastics'),
('58010', 'Aquatic/Water Sports'),
('58013', 'Specific Sports Activities'),
('58047', 'Physical Education—Independent Study'),
('58049', 'Physical Education—Other'),
('58051', 'Health Education'),
('58052', 'Health and Fitness'),
('58058', 'Substance Abuse Prevention'),
('58097', 'Health Education—Independent Study'),
('58997', 'Physical, Health, and Safety Education—Independent Study'),
('58999', 'Physical, Health, and Safety Education—Other'),
('60001', 'Introduction to Computers'),
('60002', 'Computing Systems'),
('60003', 'Computer and Information Technology'),
('60004', 'Computer Applications'),
('60008', 'Particular Topics in Computer Literacy'),
('60049', 'Computer Literacy—Other'),
('60201', 'Web Page Design'),
('60202', 'Computer Graphics'),
('60203', 'Interactive Media'),
('60247', 'Media Technology—Independent Study'),
('60997', 'Computer and Information Sciences—Independent Study'),
('60999', 'Computer and Information Sciences—Other'),
('61001', 'Introduction to Communication'),
('61002', 'Communication Technology'),
('61003', 'Particular Topics in Communication'),
('61047', 'Communication—Independent Study'),
('61049', 'Communication—Other'),
('61051', 'Audio/Visual Production'),
('61052', 'Commercial Photography'),
('61053', 'Photographic Laboratory and Darkroom'),
('61054', 'Photo Imaging'),
('61055', 'Video'),
('61056', 'Particular Topics in Audio/Video Technology and Film'),
('61099', 'Audio/Video Technology and Film—Other'),
('61101', 'Journalism'),
('61102', 'Photojournalism'),
('61103', 'Broadcasting Technology'),
('61104', 'Publication Production'),
('61105', 'Particular Topics in Journalism and Broadcasting'),
('61147', 'Journalism and Broadcasting—Independent Study'),
('61149', 'Journalism and Broadcasting—Other'),
('61151', 'Digital Media Technology'),
('61152', 'Desktop Publishing'),
('61197', 'Printing Technology—Independent Study'),
('61199', 'Printing Technology—Other'),
('61997', 'Communication and Audio/Video Technology—Independent Study'),
('61999', 'Communication and Audio/Video Technology—Other'),
('62001', 'Business/Office Career Exploration'),
('62005', 'Keyboarding'),
('62006', 'Word Processing'),
('62008', 'Particular Topics in Administration'),
('62047', 'Administration—Independent Study'),
('62051', 'Introductory Business'),
('62097', 'Management—Independent Study'),
('62101', 'Banking and Finance'),
('62147', 'Finance—Independent Study'),
('62197', 'Marketing—Independent Study'),
('62997', 'Business and Marketing—Independent Study'),
('62999', 'Business and Marketing—Other'),
('63001', 'Exploration of Manufacturing Occupations'),
('63003', 'Industrial Arts'),
('63052', 'Material and Processes'),
('63997', 'Manufacturing—Independent Study'),
('63999', 'Manufacturing—Other'),
('64002', 'Health Care Occupations—Comprehensive'),
('64997', 'Health Care Sciences—Independent Study'),
('64999', 'Health Care Sciences—Other'),
('65001', 'Exploration of Public Service Careers'),
('65997', 'Public, Protective, and Government Service—Independent Study'),
('65999', 'Public, Protective, and Government Services—Other'),
('66001', 'Exploration of Hospitality Careers'),
('66997', 'Hospitality and Tourism—Independent Study'),
('66999', 'Hospitality and Tourism—Other'),
('67001', 'Construction Careers Exploration'),
('67002', 'Construction—Comprehensive'),
('67997', 'Architecture and Construction—Independent Study'),
('67999', 'Architecture and Construction—Other'),
('68001', 'Introduction to Agriculture and Natural Resources'),
('68002', 'Agriculture—Comprehensive'),
('68003', 'Agriculture and Natural Resources—Comprehensive'),
('68997', 'Agriculture, Food, and Natural Resources—Independent Study'),
('68999', 'Agriculture, Food, and Natural Resources—Other'),
('69001', 'Human Services Career Exploration'),
('69997', 'Human Services—Independent Study'),
('69999', 'Human Services—Other'),
('70001', 'Exploration of Transportation, Distribution, and Logistics'),
('70997', 'Transportation, Distribution, and Logistics—Independent Study'),
('70999', 'Transportation, Distribution, and Logistics—Other'),
('71001', 'Pre-Engineering Technology'),
('71002', 'Engineering Applications'),
('71003', 'Engineering Technology'),
('71004', 'Principles of Engineering'),
('71005', 'Engineering—Comprehensive'),
('71006', 'Engineering Design'),
('71009', 'Robotics'),
('71047', 'Engineering—Independent Study'),
('71049', 'Engineering—Other'),
('71051', 'Technological Literacy'),
('71097', 'Technology—Independent Study'),
('71147', 'Drafting—Independent Study'),
('71997', 'Engineering and Technology—Independent Study'),
('71999', 'Engineering and Technology—Other'),
('72001', 'Standardized Test Preparation'),
('72002', 'State Test Preparation'),
('72003', 'Study Skills'),
('72005', 'Tutorial'),
('72006', 'Study Hall'),
('72101', 'Leadership'),
('72102', 'School Orientation'),
('72103', 'School Governance'),
('72104', 'Community Service'),
('72105', 'Values Clarification'),
('72106', 'Seminar'),
('72151', 'Career Exploration'),
('72152', 'Employability Skills'),
('72201', 'Family and Consumer Science—Comprehensive'),
('72202', 'Food and Nutrition'),
('72203', 'Food Science'),
('72205', 'Clothing/Sewing'),
('72208', 'Family Living'),
('72209', 'Personal Development'),
('72210', 'Consumer Economics/Personal Finance'),
('72249', 'Family and Consumer Science—Other'),
('72995', 'Miscellaneous—Aide'),
('72999', 'Miscellaneous—Other'),
('51007', 'IB Language A (English), Middle Years Program'),
('51008', 'English as a Second Language'),
('51026', 'Language Arts (early childhood education)'),
('51027', 'Language Arts (pre-kindergarten)'),
('51028', 'Language Arts (kindergarten)'),
('51029', 'Language Arts (grade 1)'),
('51030', 'Language Arts (grade 2)'),
('51031', 'Language Arts (grade 3)'),
('51032', 'Language Arts (grade 4)'),
('51033', 'Language Arts (grade 5)'),
('51034', 'Language Arts (grade 6)'),
('51035', 'Language Arts (grade 7)'),
('51036', 'Language Arts (grade 8)'),
('51038', 'Reading (early childhood education)'),
('51039', 'Reading (pre-kindergarten)'),
('51040', 'Reading (kindergarten)'),
('51041', 'Reading (grade 1)'),
('51042', 'Reading (grade 2)'),
('51043', 'Reading (grade 3)'),
('51044', 'Reading (grade 4)'),
('51045', 'Reading (grade 5)'),
('51046', 'Reading (grade 6)'),
('51047', 'Reading (grade 7)'),
('51048', 'Reading (grade 8)'),
('51128', 'Writing (early childhood education)'),
('51129', 'Writing (pre-kindergarten)'),
('51130', 'Writing (kindergarten)'),
('51131', 'Writing (grade 1)'),
('51132', 'Writing (grade 2)'),
('51133', 'Writing (grade 3)'),
('51134', 'Writing (grade 4)'),
('51135', 'Writing (grade 5)'),
('51136', 'Writing (grade 6)'),
('51137', 'Writing (grade 7)'),
('51138', 'Writing (grade 8)'),
('51996', 'English Language and Literature—Supplemental'),
('51197', 'Speech—Independent Study'),
('51203', 'English—Test Preparation'),
('52003', 'Particular Topics in Foundation Math'),
('52028', 'Mathematics (early childhood education)'),
('52029', 'Mathematics (pre-kindergarten)'),
('52030', 'Mathematics (kindergarten)'),
('52031', 'Mathematics (grade 1)'),
('52032', 'Mathematics (grade 2)'),
('52033', 'Mathematics (grade 3)'),
('52034', 'Mathematics (grade 4)'),
('52035', 'Mathematics (grade 5)'),
('52036', 'Mathematics (grade 6)'),
('52037', 'Mathematics (grade 7)'),
('52038', 'Mathematics (grade 8)'),
('52132', 'IB Mathematics, Middle Years Program'),
('52993', 'Mathematics—Test Preparation'),
('52996', 'Mathematics—Supplemental'),
('53009', 'Particular Topics in Earth Science'),
('53047', 'Earth Science—Independent Study'),
('53097', 'Biology—Independent Study'),
('53153', 'Principles of Technology'),
('53158', 'Life Science'),
('53203', 'IB Sciences, Middle Years Program'),
('53228', 'Science (early childhood education)'),
('53229', 'Science (pre-kindergarten)'),
('53230', 'Science (kindergarten)'),
('53231', 'Science (grade 1)'),
('53232', 'Science (grade 2)'),
('53233', 'Science (grade 3)'),
('53234', 'Science (grade 4)'),
('53235', 'Science (grade 5)'),
('53236', 'Science (grade 6)'),
('53237', 'Science (grade 7)'),
('53238', 'Science (grade 8)'),
('53996', 'Life and Physical Sciences—Supplemental'),
('54003', 'U.S. Geography'),
('54107', 'U.S. Ethnic Studies'),
('54171', 'IB Humanities, Middle Years Program'),
('54428', 'Social Studies (early childhood education)'),
('54429', 'Social Studies (pre-kindergarten)'),
('54430', 'Social Studies (kindergarten)'),
('54431', 'Social Studies (grade 1)'),
('54432', 'Social Studies (grade 2)'),
('54433', 'Social Studies (grade 3)'),
('54434', 'Social Studies (grade 4)'),
('54435', 'Social Studies (grade 5)'),
('54436', 'Social Studies (grade 6)'),
('54437', 'Social Studies (grade 7)'),
('54438', 'Social Studies (grade 8)'),
('54996', 'Social Sciences and History—Supplemental'),
('55028', 'Dance (early childhood education)'),
('55029', 'Dance (pre-kindergarten)'),
('55030', 'Dance (kindergarten)'),
('55031', 'Dance (grade 1)'),
('55032', 'Dance (grade 2)'),
('55033', 'Dance (grade 3)'),
('55034', 'Dance (grade 4)'),
('55035', 'Dance (grade 5)'),
('55036', 'Dance (grade 6)'),
('55037', 'Dance (grade 7)'),
('55038', 'Dance (grade 8)'),
('55068', 'Drama (early childhood education)'),
('55069', 'Drama (pre-kindergarten)'),
('55070', 'Drama (kindergarten)'),
('55071', 'Drama (grade 1)'),
('55072', 'Drama (grade 2)'),
('55073', 'Drama (grade 3)'),
('55074', 'Drama (grade 4)'),
('55075', 'Drama (grade 5)'),
('55076', 'Drama (grade 6)'),
('55077', 'Drama (grade 7)'),
('55078', 'Drama (grade 8)'),
('55128', 'Music (early childhood education)'),
('55129', 'Music (pre-kindergarten)'),
('55130', 'Music (kindergarten)'),
('55131', 'Music (grade 1)'),
('55132', 'Music (grade 2)'),
('55133', 'Music (grade 3)'),
('55134', 'Music (grade 4)'),
('55135', 'Music (grade 5)'),
('55136', 'Music (grade 6)'),
('55137', 'Music (grade 7)'),
('55138', 'Music (grade 8)'),
('55178', 'Art (early childhood education)'),
('55179', 'Art (pre-kindergarten)'),
('55180', 'Art (kindergarten)'),
('55181', 'Art (grade 1)'),
('55182', 'Art (grade 2)'),
('55183', 'Art (grade 3)'),
('55184', 'Art (grade 4)'),
('55185', 'Art (grade 5)'),
('55186', 'Art (grade 6)'),
('55187', 'Art (grade 7)'),
('55188', 'Art (grade 8)'),
('55202', 'IB Arts, Middle Years Program'),
('56028', 'Foreign Language (early childhood education)'),
('56029', 'Foreign Language (pre-kindergarten)'),
('56030', 'Foreign Language (kindergarten)'),
('56031', 'Foreign Language (grade 1)'),
('56032', 'Foreign Language (grade 2)'),
('56033', 'Foreign Language (grade 3)'),
('56034', 'Foreign Language (grade 4)'),
('56035', 'Foreign Language (grade 5)'),
('56036', 'Foreign Language (grade 6)'),
('56037', 'Foreign Language (grade 7)'),
('56038', 'Foreign Language (grade 8)'),
('56100', 'Spanish'),
('56101', 'IB Language B (Spanish), Middle Years Program'),
('56120', 'French'),
('56121', 'IB Language B (French), Middle Years Program'),
('56140', 'Italian'),
('56141', 'IB Language B (Italian), Middle Years Program'),
('56160', 'Portuguese'),
('56161', 'IB Language B (Portuguese), Middle Years Program'),
('56200', 'German'),
('56201', 'IB Language B (German), Middle Years Program'),
('56280', 'Greek'),
('56281', 'IB Language B (Greek), Middle Years Program'),
('56300', 'Latin'),
('56320', 'Classical Greek'),
('56400', 'Chinese'),
('56401', 'IB Language B (Chinese), Middle Years Program'),
('56420', 'Japanese'),
('56421', 'IB Language B (Japanese), Middle Years Program'),
('56440', 'Korean'),
('56441', 'IB Language B (Korean), Middle Years Program'),
('56500', 'Vietnamese'),
('56501', 'IB Language B (Vietnamese), Middle Years Program'),
('56520', 'Filipino'),
('56521', 'IB Language B (Filipino), Middle Years Program'),
('56600', 'Russian'),
('56601', 'IB Language B (Russian), Middle Years Program'),
('56700', 'Hebrew'),
('56701', 'IB Language B (Hebrew), Middle Years Program'),
('56720', 'Arabic'),
('56721', 'IB Language B (Arabic), Middle Years Program'),
('56760', 'Swahili'),
('56761', 'IB Language B (Swahili), Middle Years Program'),
('56800', 'American Sign Language'),
('56801', 'IB Language B (American Sign Language), Middle Years Program'),
('56820', 'American Indian Language'),
('56821', 'IB Language B (American Indian Language), Middle Years Program'),
('58002', 'Team Sports'),
('58014', 'Physical Education Equivalent'),
('58015', 'Off-Campus Sports'),
('58016', 'Lifetime Fitness Education'),
('58028', 'Physical Education (early childhood education)'),
('58029', 'Physical Education (pre-kindergarten)'),
('58030', 'Physical Education (kindergarten)'),
('58031', 'Physical Education (grade 1)'),
('58032', 'Physical Education (grade 2)'),
('58033', 'Physical Education (grade 3)'),
('58034', 'Physical Education (grade 4)'),
('58035', 'Physical Education (grade 5)'),
('58036', 'Physical Education (grade 6)'),
('58037', 'Physical Education (grade 7)'),
('58038', 'Physical Education (grade 8)'),
('58040', 'IB Physical Education, Middle Years Program'),
('58057', 'Health and Life Management'),
('60010', 'Computer Literacy'),
('61159', 'Particular Topics in Printing Technology and Production'),
('62151', 'Marketing Career Exploration'),
('62152', 'Marketing—Comprehensive'),
('64001', 'Exploration of Health Care Occupations'),
('71052', 'IB Technology, Middle Years Program'),
('71102', 'Drafting—General'),
('72004', 'Dropout Prevention Program'),
('72206', 'Life Skills'),
('72207', 'Self-Management'),
('72007', 'Advancement Via Individual Determination (AVID)'),
('72250', 'Exploratory'),
('72260', 'IB Personal Project, Middle Years Program'),
('53008', 'Earth/Space Science'),
('53159', 'Physical Science'),
('51037', 'Language Arts'),
('51139', 'Writing'),
('51049', 'Reading'),
('52039', 'Mathematics'),
('53239', 'Science'),
('54439', 'Social Studies'),
('55039', 'Dance'),
('55079', 'Drama'),
('55189', 'Art'),
('55139', 'Music'),
('56039', 'Foreign Language'),
('58039', 'Physical Education'),
('73028', 'Early Childhood Education'),
('73029', 'Pre-kindergarten'),
('73030', 'Kindergarten'),
('73031', 'Grade 1'),
('73032', 'Grade 2'),
('73033', 'Grade 3'),
('73034', 'Grade 4'),
('73035', 'Grade 5'),
('73036', 'Grade 6'),
('73037', 'Grade 7'),
('73038', 'Grade 8'),
('73039', 'Prior-to-Secondary Education'),
('73041', 'IB Primary Years Program')

	INSERT INTO RDS.DimScedCodes 
	  	(
		  ScedCourseCode
		, ScedCourseTitle
		, ScedCourseCodeDescription
		, ScedCourseLevelCode
		, ScedCourseLevelDescription
		, ScedCourseSubjectAreaCode
		, ScedCourseSubjectAreaDescription
		, ScedGradeSpan
		, ScedSequenceOfCourse    
		)
	SELECT
		  sc.ScedCourseCode 
		, sc.ScedCourseTitle		
		, 'MISSING'
		, 'MISSING'
		, 'MISSING'
		, 'MISSING'
		, 'MISSING'
		, '-1'
		, 'MISSING'
	FROM #ScedCodes sc
	LEFT JOIN RDS.DimScedCodes rdsc
		ON sc.ScedCourseCode = rdsc.ScedCourseCode
	WHERE rdsc.ScedCourseCode IS NULL 
