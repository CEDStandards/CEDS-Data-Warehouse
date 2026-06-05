/*    
	Copyright 2025 Common Education Data Standards
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
    Version 13.0.0.0
	CEDS Junk Table Dimension Population Script
	  
    This script populates multiple Junk Dimension tables in the CEDS Data Warehouse
	version 13.0.0.0. It does not populate all of the tables. Additional work continues in
	Open Source Community to fully populate all of the Junk Dimension tables.

	Script 2 of 2
	To create the CEDS Data Warehouse including population of the dimension tables, the following 3 scripts are needed:

	Script 1: CEDS-Data-Warehouse-V14-0-0-0
	Script 2: Junk-Table-Dimension-Population-V14.0.0.0

	You must have the CEDS Data Warehouse version 13.0.0.0 installed first. The CEDS schema tables in the warehouse house the element and option set information.
	These six tables act as a source for the junk table dimension population.
      
    Questions on this script can be sent to https://ceds.ed.gov/ContactUs.aspx
      
    More information on the data model is available at the CEDS website:  
    http://ceds.ed.gov.
*/    

USE [CEDS-Data-Warehouse-V14-0-0-0]
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
			   ,[SexCode]
			   ,[SexDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimAeDemographics OFF

	END

	IF OBJECT_ID('tempdb..#Sex') IS NOT NULL
		DROP TABLE #Sex

	CREATE TABLE #Sex (SexCode VARCHAR(50), SexDescription VARCHAR(200))

	INSERT INTO #Sex VALUES ('MISSING', 'MISSING')
	INSERT INTO #Sex 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'Sex'


	INSERT INTO [RDS].[DimAeDemographics]
			([SexCode]
			,[SexDescription])
	SELECT DISTINCT
		  a.SexCode
		, a.SexDescription
	FROM #Sex a
	LEFT JOIN RDS.DimAeDemographics main
		ON a.SexCode = main.SexCode
	WHERE main.DimAeDemographicId IS NULL

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
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationInstructionalProgramType'

		CREATE TABLE #AeSpecialProgramType (AeSpecialProgramTypeCode VARCHAR(50), AeSpecialProgramTypeDescription VARCHAR(200))

		INSERT INTO #AeSpecialProgramType VALUES ('MISSING', 'MISSING')
		INSERT INTO #AeSpecialProgramType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationSpecialProgramType'

		CREATE TABLE #WioaCareerServiceType (WioaCareerServicesCode VARCHAR(50), WioaCareerServicesDescription VARCHAR(200))

		INSERT INTO #WioaCareerServiceType VALUES ('MISSING', 'MISSING')
		INSERT INTO #WioaCareerServiceType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'WioaCareerServices'

		CREATE TABLE #WioaTrainingServiceType (WioaTrainingServicesCode VARCHAR(50), WioaTrainingServicesDescription VARCHAR(200))

		INSERT INTO #WioaTrainingServiceType VALUES ('MISSING', 'MISSING')
		INSERT INTO #WioaTrainingServiceType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS].CedsOptionSetMapping
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
		LEFT JOIN RDS.DimAeProgramTypes main
			ON a.AeInstructionalProgramTypeCode = main.AeInstructionalProgramTypeCode
			AND b.AeSpecialProgramTypeCode = main.AeSpecialProgramTypeCode
			AND c.WioaCareerServicesCode = main.WioaCareerServicesCode
			AND d.WioaTrainingServicesCode = main.WioaTrainingServicesCode
		WHERE main.DimAeProgramTypeId IS NULL


		DROP TABLE #AeInstructionalProgramType
		DROP TABLE #AeSpecialProgramType
		DROP TABLE #WioaCareerServiceType
		DROP TABLE #WioaTrainingServiceType


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
			WHEN 'AmericanIndianOrAlaskaNative' THEN 'AM7'
			WHEN 'Asian' THEN 'AS7'
			WHEN 'BlackOrAfricanAmerican' THEN 'BL7'
			WHEN 'NativeHawaiianOrPacificIslander' THEN 'PI7'
			WHEN 'White' THEN 'WH7'
			WHEN '(Deprecated)DemographicRaceTwoOrMoreRaces' THEN 'MU7'
			WHEN 'HispanicOrLatino' THEN 'HI7'
			WHEN 'MiddleEasternOrNorthAfrican' THEN 'MISSING'
			WHEN 'MultiracialAndOrMultiethnic' THEN 'MISSING'
			WHEN 'RaceAndEthnicityUnknown' THEN 'MISSING'
			ELSE 'MISSING'
		  END
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimRaces main
		ON ceds.CedsOptionSetCode = main.RaceCode
	WHERE main.RaceCode IS NULL
		AND ceds.CedsElementTechnicalName = 'Race And Ethnicity'

	IF NOT EXISTS (SELECT 1 FROM RDS.DimRaces WHERE RaceCode = 'HispanicOrLatino') BEGIN
		INSERT INTO RDS.DimRaces (RaceCode, RaceDescription, RaceEdFactsCode) VALUES ('HispanicOrLatino', 'Hispanic or Latino', 'HI7')
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
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'MagnetOrSpecialProgramEmphasisSchool'


	CREATE TABLE #NationalSchoolLunchProgramStatus (NslpStatusCode VARCHAR(50), NslpStatusDescription VARCHAR(200), NslpStatusEdFactsCode VARCHAR(200))

		INSERT INTO #NationalSchoolLunchProgramStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #NationalSchoolLunchProgramStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'NationalSchoolLunchProgramStatus'



	CREATE TABLE #SharedTimeIndicator (SharedTimeIndicatorCode VARCHAR(50), SharedTimeIndicatorDescription VARCHAR(200), SharedTimeIndicatorEdFactsCode VARCHAR(200))

		INSERT INTO #SharedTimeIndicator VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #SharedTimeIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode
		FROM [CEDS].CedsOptionSetMapping
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
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'VirtualSchoolStatus'

	-- This is no longer used in EdFacts.  Setting the EdFacts values to MISSING
	CREATE TABLE #SchoolImprovementStatus (SchoolImprovementStatusCode VARCHAR(50), SchoolImprovementStatusDescription VARCHAR(200), SchoolImprovementStatusEdFactsCode VARCHAR(200))

		INSERT INTO #SchoolImprovementStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #SchoolImprovementStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, 'MISSING' AS EdFactsOptionSetCode
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'SchoolImprovementStatus'


	CREATE TABLE #PersistentlyDangerousStatus (PersistentlyDangerousStatusCode VARCHAR(50), PersistentlyDangerousStatusDescription VARCHAR(200), PersistentlyDangerousStatusEdFactsCode VARCHAR(200))

		INSERT INTO #PersistentlyDangerousStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #PersistentlyDangerousStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM [CEDS].CedsOptionSetMapping
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
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'StatePovertyDesignation'


	CREATE TABLE #ProgressAchievingEnglishLanguageProficiencyIndicatorType(ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode VARCHAR(50), ProgressAchievingEnglishLanguageProficiencyIndicatorTypeDescription VARCHAR(200), ProgressAchievingEnglishLanguageProficiencyIndicatorTypeEdFactsCode VARCHAR(200))

		INSERT INTO #ProgressAchievingEnglishLanguageProficiencyIndicatorType VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #ProgressAchievingEnglishLanguageProficiencyIndicatorType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping ceds
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
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimK12CourseStatuses main
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
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PescAwardLevelType'

	CREATE TABLE #ProfessionalOrTechnicalCredentialConferred (ProfessionalOrTechnicalCredentialConferredCode VARCHAR(50), ProfessionalOrTechnicalCredentialConferredDescription VARCHAR(200))

	INSERT INTO #ProfessionalOrTechnicalCredentialConferred VALUES ('MISSING', 'MISSING')
	INSERT INTO #ProfessionalOrTechnicalCredentialConferred
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
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

	---------------------------------------------------
	-- Populate DimPsEnrollmentStatuses ---
	---------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimPsEnrollmentStatuses WHERE DimPsEnrollmentStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimPsEnrollmentStatuses ON

		INSERT INTO [RDS].DimPsEnrollmentStatuses
           ([DimPsEnrollmentStatusId]
		   ,[PostsecondaryExitOrWithdrawalTypeCode]
		   ,[PostsecondaryExitOrWithdrawalTypeDescription]
		   ,[PostsecondaryEnrollmentStatusCode]
		   ,[PostsecondaryEnrollmentStatusDescription]
		   ,[PostSecondaryEnrollmentStatusEdFactsCode])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimPsEnrollmentStatuses OFF
	END


	CREATE TABLE #PostsecondaryExitOrWithdrawalType (PostsecondaryExitOrWithdrawalTypeCode VARCHAR(50), PostsecondaryExitOrWithdrawalTypeDescription VARCHAR(200))

	INSERT INTO #PostsecondaryExitOrWithdrawalType VALUES ('MISSING', 'MISSING')

	INSERT INTO #PostsecondaryExitOrWithdrawalType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PostsecondaryExitOrWithdrawalType'


	CREATE TABLE #PostsecondaryEnrollmentStatus (PostsecondaryEnrollmentStatusCode VARCHAR(50), PostsecondaryEnrollmentStatusDescription VARCHAR(200), PostSecondaryEnrollmentStatusEdFactsCode VARCHAR(200))

	INSERT INTO #PostsecondaryEnrollmentStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #PostsecondaryEnrollmentStatus
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PostsecondaryEnrollmentStatus'


	INSERT INTO RDS.DimPsEnrollmentStatuses
		  ([PostsecondaryExitOrWithdrawalTypeCode]
		   ,[PostsecondaryExitOrWithdrawalTypeDescription]
		   ,[PostsecondaryEnrollmentStatusCode]
		   ,[PostsecondaryEnrollmentStatusDescription]
		   ,[PostSecondaryEnrollmentStatusEdFactsCode])
	SELECT DISTINCT
		  a.PostsecondaryExitOrWithdrawalTypeCode
		, a.PostsecondaryExitOrWithdrawalTypeDescription
		, b.PostsecondaryEnrollmentStatusCode
		, b.PostsecondaryEnrollmentStatusDescription
		, b.PostSecondaryEnrollmentStatusEdFactsCode
	FROM #PostsecondaryExitOrWithdrawalType a
	CROSS JOIN #PostsecondaryEnrollmentStatus b
	LEFT JOIN RDS.DimPsEnrollmentStatuses main
		ON a.PostsecondaryExitOrWithdrawalTypeCode = main.PostsecondaryEnrollmentStatusCode
		AND b.PostsecondaryEnrollmentStatusCode = main.PostsecondaryEnrollmentStatusCode
	WHERE main.DimPsEnrollmentStatusId IS NULL

	DROP TABLE #PostsecondaryExitOrWithdrawalType
	DROP TABLE #PostsecondaryEnrollmentStatus


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
		   ,[AdjustedExitOrWithdrawalTypeCode]
		   ,[AdjustedExitOrWithdrawalTypeDescription]
		   ,[ExitOrWithdrawalStatusCode]
		   ,[ExitOrWithdrawalStatusDescription])
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
				)

		SET IDENTITY_INSERT RDS.DimK12EnrollmentStatuses OFF
	END

	CREATE TABLE #EnrollmentStatus (EnrollmentStatusCode VARCHAR(50), EnrollmentStatusDescription VARCHAR(200))

	INSERT INTO #EnrollmentStatus VALUES ('MISSING', 'MISSING')
	INSERT INTO #EnrollmentStatus 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EnrollmentStatus'

	CREATE TABLE #EntryType (EntryTypeCode VARCHAR(50), EntryTypeDescription VARCHAR(200))

	INSERT INTO #EntryType VALUES ('MISSING', 'MISSING')
	INSERT INTO #EntryType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EntryType'

	CREATE TABLE #ExitOrWithdrawalType (ExitOrWithdrawalTypeCode VARCHAR(50), ExitOrWithdrawalTypeDescription VARCHAR(200))

	INSERT INTO #ExitOrWithdrawalType VALUES ('MISSING', 'MISSING')
	INSERT INTO #ExitOrWithdrawalType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ExitOrWithdrawalType'


	CREATE TABLE #AdjustedExitOrWithdrawalType (AdjustedExitOrWithdrawalTypeCode VARCHAR(50), AdjustedExitOrWithdrawalTypeDescription VARCHAR(200))

	INSERT INTO #AdjustedExitOrWithdrawalType VALUES ('MISSING', 'MISSING')
	INSERT INTO #AdjustedExitOrWithdrawalType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AdjustedExitOrWithdrawalType'


	CREATE TABLE #ExitOrWithdrawalStatus (ExitOrWithdrawalStatusCode VARCHAR(50), ExitOrWithdrawalStatusDescription VARCHAR(200))

	INSERT INTO #ExitOrWithdrawalStatus VALUES ('MISSING', 'MISSING')
	INSERT INTO #ExitOrWithdrawalStatus
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ExitOrWithdrawalStatus'


	INSERT INTO RDS.DimK12EnrollmentStatuses
		([EnrollmentStatusCode]
		,[EnrollmentStatusDescription]
		,[EntryTypeCode]
		,[EntryTypeDescription]
		,[ExitOrWithdrawalTypeCode]
		,[ExitOrWithdrawalTypeDescription]
		,[AdjustedExitOrWithdrawalTypeCode]
		,[AdjustedExitOrWithdrawalTypeDescription]
		,[ExitOrWithdrawalStatusCode]
		,[ExitOrWithdrawalStatusDescription])
	SELECT DISTINCT
		  a.EnrollmentStatusCode
		, a.EnrollmentStatusDescription
		, b.EntryTypeCode
		, b.EntryTypeDescription
		, c.ExitOrWithdrawalTypeCode
		, c.ExitOrWithdrawalTypeDescription
		, d.AdjustedExitOrWithdrawalTypeCode
		, d.AdjustedExitOrWithdrawalTypeDescription
		, e.ExitOrWithdrawalStatusCode
		, e.ExitOrWithdrawalStatusDescription
	FROM #EnrollmentStatus a
	CROSS JOIN #EntryType b
	CROSS JOIN #ExitOrWithdrawalType c
	CROSS JOIN #AdjustedExitOrWithdrawalType d
	CROSS JOIN #ExitOrWithdrawalStatus e
	LEFT JOIN RDS.DimK12EnrollmentStatuses main
		ON a.EnrollmentStatusCode = main.EnrollmentStatusCode
		AND b.EntryTypeCode = main.EntryTypeCode
		AND c.ExitOrWithdrawalTypeCode = main.ExitOrWithdrawalTypeCode
		AND d.AdjustedExitOrWithdrawalTypeCode = main.AdjustedExitOrWithdrawalTypeCode
		AND e.ExitOrWithdrawalStatusCode = main.ExitOrWithdrawalStatusCode
	WHERE main.DimK12EnrollmentStatusId IS NULL

	DROP TABLE #EnrollmentStatus
	DROP TABLE #EntryType
	DROP TABLE #ExitOrWithdrawalType
	DROP TABLE #AdjustedExitOrWithdrawalType
	DROP TABLE #ExitOrWithdrawalStatus


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
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'LevelOfInstitution'

	CREATE TABLE #ControlOfInstitution (ControlOfInstitutionCode VARCHAR(50), ControlOfInstitutionDescription VARCHAR(200))

	INSERT INTO #ControlOfInstitution VALUES ('MISSING', 'MISSING')
	INSERT INTO #ControlOfInstitution
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ControlOfInstitution'

	CREATE TABLE #CarnegieBasicClassification (CarnegieBasicClassificationCode VARCHAR(50), CarnegieBasicClassificationDescription VARCHAR(200))

	INSERT INTO #CarnegieBasicClassification VALUES ('MISSING', 'MISSING')
	INSERT INTO #CarnegieBasicClassification 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CarnegieBasicClassification'

	CREATE TABLE #VirtualIndicator (VirtualIndicatorCode VARCHAR(50), VirtualIndicatorDescription VARCHAR(200))

	INSERT INTO #VirtualIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #VirtualIndicator 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'VirtualIndicator'

	CREATE TABLE #MostPrevalentLevelOfInstitution (MostPrevalentLevelOfInstitutionStatusCode VARCHAR(50), MostPrevalentLevelOfInstitutionDescription VARCHAR(200))

	INSERT INTO #MostPrevalentLevelOfInstitution VALUES ('MISSING', 'MISSING')
	INSERT INTO #MostPrevalentLevelOfInstitution 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MostPrevalentLevelOfInstitution'
	
	CREATE TABLE #PredominantCalendarSystem (PredominantCalendarSystemCode VARCHAR(50), PredominantCalendarSystemDescription VARCHAR(200))

	INSERT INTO #PredominantCalendarSystem VALUES ('MISSING', 'MISSING')
	INSERT INTO #PredominantCalendarSystem 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
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
	LEFT JOIN RDS.DimPsInstitutionStatuses main
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
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimProgramTypes main
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
	FROM [CEDS].CedsOptionSetMapping ceds
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
	FROM [CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'DisabilityConditionType'

	CREATE TABLE #DisabilityDeterminationSourceType (DisabilityDeterminationSourceTypeCode VARCHAR(50), DisabilityDeterminationSourceTypeDescription VARCHAR(200))

	INSERT INTO #DisabilityDeterminationSourceType VALUES ('MISSING', 'MISSING')
	INSERT INTO #DisabilityDeterminationSourceType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'DisabilityDeterminationSourceType'

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
	LEFT JOIN RDS.DimDisabilityStatuses dds
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
	IF NOT EXISTS (SELECT 1 FROM RDS.DimEnglishLearnerStatuses d WHERE d.EnglishLearnerStatusCode = 'MISSING') BEGIN
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
	FROM (VALUES('Yes', 'Yes', 'LEP'),('No', 'No', 'NLEP'),('MISSING', 'MISSING', 'MISSING')) EnglishLearner (CedsOptionSetCode, CedsOptionSetDescription, EdFactsCode)
	CROSS JOIN (VALUES('Yes', 'Yes', 'LEPP'),('No', 'No','MISSING'),('MISSING', 'MISSING', 'MISSING')) PerkinsEnglishLearner (CedsOptionSetCode, CedsOptionSetDescription, EdFactsCode)
	LEFT JOIN RDS.DimEnglishLearnerStatuses dels
		ON EnglishLearner.CedsOptionSetCode = dels.EnglishLearnerStatusCode
		AND PerkinsEnglishLearner.CedsOptionSetCode = dels.PerkinsEnglishLearnerStatusCode
	WHERE dels.DimEnglishLearnerStatusId IS NULL
	
	PRINT 'Populate DimFosterCareStatuses'
	-----------------------------------------------------
	-- Populate DimFosterCareStatuses                  --
	-----------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimFosterCareStatuses d WHERE d.ProgramParticipationFosterCareCode = 'MISSING') BEGIN
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
	LEFT JOIN RDS.DimFosterCareStatuses dfcs
		ON FosterCare.CedsOptionSetCode = dfcs.ProgramParticipationFosterCareCode
	WHERE dfcs.DimFosterCareStatusId IS NULL

	PRINT 'Populate DimHomelessnessStatuses'
	-----------------------------------------------------
	-- Populate DimHomelessnessStatuses                --
	-----------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimHomelessnessStatuses d WHERE d.HomelessnessStatusCode = 'MISSING') BEGIN
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
	FROM [CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'HomelessPrimaryNighttimeResidence'

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
	LEFT JOIN RDS.DimHomelessnessStatuses dhs
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
	IF NOT EXISTS (SELECT 1 FROM RDS.DimMigrantStatuses d WHERE d.MigrantStatusCode = 'MISSING') BEGIN
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
	FROM [CEDS].CedsOptionSetMapping 
	WHERE CedsElementTechnicalName = 'MigrantEducationProgramEnrollmentType' 

	CREATE TABLE #ContinuationOfServices (ContinuationOfServicesReasonCode VARCHAR(50), ContinuationOfServicesReasonDescription VARCHAR(200))

	INSERT INTO #ContinuationOfServices VALUES ('MISSING', 'MISSING')
	INSERT INTO #ContinuationOfServices
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'ContinuationOfServicesReason'

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
	FROM [CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'MigrantEducationProgramServicesType'

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
	LEFT JOIN RDS.DimMigrantStatuses dms
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
		FROM [CEDS].CedsOptionSetMapping
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
		LEFT JOIN RDS.DimK12Demographics main
			ON  h.SexCode = main.SexCode
		WHERE main.DimK12DemographicId IS NULL

	DROP TABLE #K12Sex


	PRINT 'Populate DimK12AcademicAwardStatuses'
	----------------------------------------------------------------
	-- Populate DimK12AcademicAwardStatuses		 ---
	----------------------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12AcademicAwardStatuses d WHERE d.HighSchoolDiplomaTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimK12AcademicAwardStatuses ON

		INSERT INTO RDS.DimK12AcademicAwardStatuses (DimK12AcademicAwardStatusId, HighSchoolDiplomaTypeCode, HighSchoolDiplomaTypeDescription, HighSchoolDiplomaTypeEdFactsCode, HighSchoolDiplomaDistinctionTypeCode, HighSchoolDiplomaDistinctionTypeDescription, ProjectedHighSchoolDiplomaTypeCode, ProjectedHighSchoolDiplomaTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimK12AcademicAwardStatuses OFF
	END

	IF OBJECT_ID('tempdb..#HighSchoolDiplomaTypeCode') IS NOT NULL
		DROP TABLE #HighSchoolDiplomaTypeCode

	CREATE TABLE #HighSchoolDiplomaTypeCode (HighSchoolDiplomaTypeCode VARCHAR(50), HighSchoolDiplomaTypeDescription VARCHAR(200), HighSchoolDiplomaTypeEdFactsCode VARCHAR(50))

	INSERT INTO #HighSchoolDiplomaTypeCode VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #HighSchoolDiplomaTypeCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
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
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'HighSchoolDiplomaType'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#HighSchoolDiplomaDistinctionTypeCode') IS NOT NULL
		DROP TABLE #HighSchoolDiplomaDistinctionTypeCode

	CREATE TABLE #HighSchoolDiplomaDistinctionTypeCode (HighSchoolDiplomaDistinctionTypeCode VARCHAR(50), HighSchoolDiplomaDistinctionTypeDescription VARCHAR(200))

	INSERT INTO #HighSchoolDiplomaDistinctionTypeCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #HighSchoolDiplomaDistinctionTypeCode
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'HighSchoolDiplomaDistinctionType'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#ProjectedHighSchoolDiplomaTypeCode') IS NOT NULL
		DROP TABLE #ProjectedHighSchoolDiplomaTypeCode

	CREATE TABLE #ProjectedHighSchoolDiplomaTypeCode (ProjectedHighSchoolDiplomaTypeCode VARCHAR(50), ProjectedHighSchoolDiplomaTypeDescription VARCHAR(200))

	INSERT INTO #ProjectedHighSchoolDiplomaTypeCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #ProjectedHighSchoolDiplomaTypeCode
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ProjectedHighSchoolDiplomaType'
	ORDER BY CedsOptionSetCode

	INSERT INTO rds.DimK12AcademicAwardStatuses(
			 HighSchoolDiplomaTypeCode
			,HighSchoolDiplomaTypeDescription
			,HighSchoolDiplomaTypeEdFactsCode
			,HighSchoolDiplomaDistinctionTypeCode
			,HighSchoolDiplomaDistinctionTypeDescription
			,ProjectedHighSchoolDiplomaTypeCode
			,ProjectedHighSchoolDiplomaTypeDescription
			)
	SELECT 
			 a.HighSchoolDiplomaTypeCode
			,a.HighSchoolDiplomaTypeDescription
			,a.HighSchoolDiplomaTypeEdFactsCode
			,b.HighSchoolDiplomaDistinctionTypeCode
			,b.HighSchoolDiplomaDistinctionTypeDescription
			,c.ProjectedHighSchoolDiplomaTypeCode
			,c.ProjectedHighSchoolDiplomaTypeDescription
	FROM #HighSchoolDiplomaTypeCode a
	CROSS JOIN #HighSchoolDiplomaDistinctionTypeCode b
	CROSS JOIN #ProjectedHighSchoolDiplomaTypeCode c
	LEFT JOIN RDS.DimK12AcademicAwardStatuses main
		ON	a.HighSchoolDiplomaTypeCode = main.HighSchoolDiplomaTypeCode					
		AND b.HighSchoolDiplomaDistinctionTypeCode = main.HighSchoolDiplomaDistinctionTypeCode			
		AND c.ProjectedHighSchoolDiplomaTypeCode = main.ProjectedHighSchoolDiplomaTypeCode			
	WHERE main.DimK12AcademicAwardStatusId IS NULL

	DROP TABLE #HighSchoolDiplomaTypeCode
	DROP TABLE #ProjectedHighSchoolDiplomaTypeCode
	DROP TABLE #HighSchoolDiplomaDistinctionTypeCode




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
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'SpecialEducationExitReason'

		CREATE TABLE #IdeaEducationalEnvironmentForSchoolAge (IdeaEducationalEnvironmentForSchoolAgeCode VARCHAR(50), IdeaEducationalEnvironmentForSchoolAgeDescription VARCHAR(200), IdeaEducationalEnvironmentForSchoolAgeEdFactsCode VARCHAR(200))

		INSERT INTO #IdeaEducationalEnvironmentForSchoolAge VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #IdeaEducationalEnvironmentForSchoolAge 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'IdeaEducationalEnvironmentForSchoolAge'

		CREATE TABLE #IdeaEducationalEnvironmentForEarlyChildhood (IdeaEducationalEnvironmentForEarlyChildhoodCode VARCHAR(50), IdeaEducationalEnvironmentForEarlyChildhoodDescription VARCHAR(200), IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode VARCHAR(200))

		INSERT INTO #IdeaEducationalEnvironmentForEarlyChildhood VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #IdeaEducationalEnvironmentForEarlyChildhood 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, CedsOptionSetCode AS EdFactsOptionSetCode
		FROM [CEDS].CedsOptionSetMapping
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
		FROM [CEDS].CedsOptionSetMapping
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
		LEFT JOIN RDS.DimIdeaStatuses main
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
	FROM [CEDS].CedsOptionSetMapping ceds
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
	IF NOT EXISTS (SELECT 1 FROM RDS.DimChildOutcomeSummaries d WHERE d.COSRatingACode = 'MISSING') BEGIN
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
	FROM [CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'COSRatingA'

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
	LEFT JOIN RDS.DimChildOutcomeSummaries dcos
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
	IF NOT EXISTS (SELECT * FROM RDS.DimIndividualizedProgramStatuses d WHERE d.IndividualizedProgramTypeCode = 'MISSING') BEGIN
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
	FROM [CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'IndividualizedProgramType'

	CREATE TABLE #StudentSupportServiceType (StudentSupportServiceTypeCode VARCHAR(50), StudentSupportServiceTypeDescription VARCHAR(200))

	INSERT INTO #StudentSupportServiceType VALUES ('MISSING', 'MISSING')
	INSERT INTO #StudentSupportServiceType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping WHERE CedsElementTechnicalName = 'StudentSupportServiceType'

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
	LEFT JOIN RDS.DimIndividualizedProgramStatuses dips
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
           
    FROM [CEDS].CedsOptionSetMapping ceds
    LEFT JOIN RDS.DimIdeaDisabilityTypes main
        ON ceds.CedsOptionSetCode = main.IdeaDisabilityTypeCode
    WHERE main.DimIdeaDisabilityTypeId IS NULL
        AND ceds.CedsElementTechnicalName = 'IdeaDisabilityType'


	PRINT 'Populate DimImmigrantStatuses'
	-----------------------------------------------------
	-- Populate DimImmigrantStatuses				   --
	-----------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimImmigrantStatuses d WHERE d.TitleIIIImmigrantStatusCode = 'MISSING') BEGIN
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
	LEFT JOIN RDS.DimImmigrantStatuses dis
	ON TitleIIIImmigrant.CedsOptionSetCode = dis.TitleIIIImmigrantStatusCode
		AND TitleIIIImmigrantParticipation.CedsOptionSetCode = dis.TitleIIIImmigrantParticipationStatusCode
	WHERE dis.DimImmigrantStatusId IS NULL
	

	PRINT 'Populate DimMilitaryStatuses'
	-----------------------------------------------------
	-- Populate DimMilitaryStatuses					   --
	-----------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimMilitaryStatuses d WHERE d.DimMilitaryStatusId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimMilitaryStatuses ON

			INSERT INTO rds.DimMilitaryStatuses (
						  DimMilitaryStatusId
						, MilitaryConnectedStudentIndicatorCode       
						, MilitaryConnectedStudentIndicatorDescription
						, MilitaryConnectedStudentIndicatorEdFactsCode
						, ActiveMilitaryStatusIndicatorCode          
						, ActiveMilitaryStatusIndicatorDescription   
						, MilitaryBranchCode                          
						, MilitaryBranchDescription                   
						, MilitaryVeteranStatusIndicatorCode         
						, MilitaryVeteranStatusIndicatorDescription  
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

	IF OBJECT_ID('tempdb..#MilitaryConnectedStudentIndicator') IS NOT NULL
		DROP TABLE #MilitaryConnectedStudentIndicator

	CREATE TABLE #MilitaryConnectedStudentIndicator (MilitaryConnectedStudentIndicatorCode VARCHAR(50), MilitaryConnectedStudentIndicatorDescription VARCHAR(200), MilitaryConnectedStudentIndicatorEdFactsCode VARCHAR(50))

	INSERT INTO #MilitaryConnectedStudentIndicator VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #MilitaryConnectedStudentIndicator 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MilitaryConnectedStudentIndicator'

	IF OBJECT_ID('tempdb..#ActiveMilitaryStatusIndicator') IS NOT NULL
		DROP TABLE #ActiveMilitaryStatusIndicator

	CREATE TABLE #ActiveMilitaryStatusIndicator (ActiveMilitaryStatusIndicatorCode VARCHAR(50), ActiveMilitaryStatusIndicatorDescription VARCHAR(200))

	INSERT INTO #ActiveMilitaryStatusIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #ActiveMilitaryStatusIndicator 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ActiveMilitaryStatusIndicator'

	IF OBJECT_ID('tempdb..#MilitaryBranch') IS NOT NULL
		DROP TABLE #MilitaryBranch

	CREATE TABLE #MilitaryBranch (MilitaryBranchCode VARCHAR(50), MilitaryBranchDescription VARCHAR(200))

	INSERT INTO #MilitaryBranch VALUES ('MISSING', 'MISSING')
	INSERT INTO #MilitaryBranch 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MilitaryBranch'
	
	IF OBJECT_ID('tempdb..#MilitaryVeteranStatusIndicator') IS NOT NULL
		DROP TABLE #MilitaryVeteranStatusIndicator

	CREATE TABLE #MilitaryVeteranStatusIndicator (MilitaryVeteranStatusIndicatorCode VARCHAR(50), MilitaryVeteranStatusIndicatorDescription VARCHAR(200))

	INSERT INTO #MilitaryVeteranStatusIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #MilitaryVeteranStatusIndicator 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MilitaryVeteranStatusIndicator'

	INSERT INTO rds.DimMilitaryStatuses 
		(
			  MilitaryConnectedStudentIndicatorCode       
			, MilitaryConnectedStudentIndicatorDescription
			, MilitaryConnectedStudentIndicatorEdFactsCode
			, ActiveMilitaryStatusIndicatorCode          
			, ActiveMilitaryStatusIndicatorDescription   
			, MilitaryBranchCode                          
			, MilitaryBranchDescription                   
			, MilitaryVeteranStatusIndicatorCode         
			, MilitaryVeteranStatusIndicatorDescription  
		)
	SELECT 
		  a.MilitaryConnectedStudentIndicatorCode
		, a.MilitaryConnectedStudentIndicatorDescription
		, a.MilitaryConnectedStudentIndicatorEdFactsCode
		, b.ActiveMilitaryStatusIndicatorCode
		, b.ActiveMilitaryStatusIndicatorDescription
		, c.MilitaryBranchCode
		, c.MilitaryBranchDescription
		, d.MilitaryVeteranStatusIndicatorCode
		, d.MilitaryVeteranStatusIndicatorDescription
	FROM #MilitaryConnectedStudentIndicator a
	CROSS JOIN #ActiveMilitaryStatusIndicator b
	CROSS JOIN #MilitaryBranch c
	CROSS JOIN #MilitaryVeteranStatusIndicator d
	LEFT JOIN RDS.DimMilitaryStatuses main
		ON  a.MilitaryConnectedStudentIndicatorCode = main.MilitaryConnectedStudentIndicatorCode
		AND b.ActiveMilitaryStatusIndicatorCode	 = main.ActiveMilitaryStatusIndicatorCode
		AND c.MilitaryBranchCode						 = main.MilitaryBranchCode
		AND d.MilitaryVeteranStatusIndicatorCode   = main.MilitaryVeteranStatusIndicatorCode
	WHERE main.DimMilitaryStatusId IS NULL

	DROP TABLE #MilitaryConnectedStudentIndicator
	DROP TABLE #ActiveMilitaryStatusIndicator
	DROP TABLE #MilitaryBranch
	DROP TABLE #MilitaryVeteranStatusIndicator


	PRINT 'Populate DimEconomicallyDisadvantagedStatuses'
	-----------------------------------------------------
	-- Populate DimEconomicallyDisadvantagedStatuses   --
	-----------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimEconomicallyDisadvantagedStatuses d WHERE d.DimEconomicallyDisadvantagedStatusId = -1) BEGIN
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

	IF OBJECT_ID('tempdb..#EconomicDisadvantageStatus') IS NOT NULL
		DROP TABLE #EconomicDisadvantageStatus

	CREATE TABLE #EconomicDisadvantageStatus (EconomicDisadvantageStatusCode VARCHAR(50), EconomicDisadvantageStatusDescription VARCHAR(200), EconomicDisadvantageStatusEdFactsCode VARCHAR(50))

	INSERT INTO #EconomicDisadvantageStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EconomicDisadvantageStatus 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CASE CedsOptionSetCode
			WHEN 'Yes' THEN 'ECODIS'
			ELSE 'MISSING'
		  END
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EconomicDisadvantageStatus'


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
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EligibilityStatusForSchoolFoodServicePrograms'
	
	IF OBJECT_ID('tempdb..#NationalSchoolLunchProgramDirectCertificationIndicator') IS NOT NULL
		DROP TABLE #NationalSchoolLunchProgramDirectCertificationIndicator

	CREATE TABLE #NationalSchoolLunchProgramDirectCertificationIndicator (NationalSchoolLunchProgramDirectCertificationIndicatorCode VARCHAR(50), NationalSchoolLunchProgramDirectCertificationIndicatorDescription VARCHAR(200))

	INSERT INTO #NationalSchoolLunchProgramDirectCertificationIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #NationalSchoolLunchProgramDirectCertificationIndicator 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
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
	LEFT JOIN RDS.DimEconomicallyDisadvantagedStatuses rdeds
		ON	eds.EconomicDisadvantageStatusCode								 = rdeds.EconomicDisadvantageStatusCode								
		AND esfsfsp.EligibilityStatusForSchoolFoodServiceProgramsCode		 = rdeds.EligibilityStatusForSchoolFoodServiceProgramsCode			
		AND nslpdci.NationalSchoolLunchProgramDirectCertificationIndicatorCode = rdeds.NationalSchoolLunchProgramDirectCertificationIndicatorCode
	WHERE rdeds.DimEconomicallyDisadvantagedStatusId IS NULL

	DROP TABLE #EconomicDisadvantageStatus
	DROP TABLE #EligibilityStatusForSchoolFoodServicePrograms
	DROP TABLE #NationalSchoolLunchProgramDirectCertificationIndicator


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
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AssessmentRegistrationParticipationIndicator'


		IF OBJECT_ID('tempdb..#AssessmentRegistrationCompletionStatus') IS NOT NULL
			DROP TABLE #AssessmentRegistrationCompletionStatus

		CREATE TABLE #AssessmentRegistrationCompletionStatus (AssessmentRegistrationCompletionStatusCode VARCHAR(50), AssessmentRegistrationCompletionStatusDescription VARCHAR(200))

		INSERT INTO #AssessmentRegistrationCompletionStatus VALUES ('MISSING', 'MISSING')
		INSERT INTO #AssessmentRegistrationCompletionStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS].CedsOptionSetMapping
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
		FROM [CEDS].CedsOptionSetMapping
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
		FROM [CEDS].CedsOptionSetMapping
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
		FROM [CEDS].CedsOptionSetMapping
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
		FROM [CEDS].CedsOptionSetMapping
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
		FROM [CEDS].CedsOptionSetMapping
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
	LEFT JOIN RDS.DimAssessmentRegistrations dar
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
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimBuildingSpaceDesignTypes main
		ON ceds.CedsOptionSetCode = main.DimBuildingSpaceDesignTypeId
	WHERE main.DimBuildingSpaceDesignTypeId IS NULL
		AND ceds.CedsElementTechnicalName = 'BuildingSpaceDesignType'


	PRINT 'Populate DimIncidentStatuses'
	-----------------------------------------------------
	-- Populate DimIncidentStatuses 		           --
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimIncidentStatuses d WHERE d.DimIncidentStatusId = -1) 
	BEGIN
		SET IDENTITY_INSERT RDS.DimIncidentStatuses ON

		INSERT INTO RDS.DimIncidentStatuses (
			  DimIncidentStatusId
			, IdeaInterimRemovalReasonCode
			, IdeaInterimRemovalReasonDescription
			, IdeaInterimRemovalReasonEdFactsCode
			, DisciplineReasonCode
			, DisciplineReasonDescription
			, IncidentInjuryTypeCode
			, IncidentInjuryTypeDescription
			, IncidentReportedToLawEnforcementIndicatorCode
			, IncidentReportedToLawEnforcementIndicatorDescription
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
	
	IF OBJECT_ID('tempdb..#IdeaInterimRemovalReason') IS NOT NULL
	DROP TABLE #IdeaInterimRemovalReason

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
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'IdeaInterimRemovalReason'

	IF OBJECT_ID('tempdb..#DisciplineReason') IS NOT NULL
	DROP TABLE #DisciplineReason

	CREATE TABLE #DisciplineReason (DisciplineReasonCode VARCHAR(50), DisciplineReasonDescription VARCHAR(200))

	INSERT INTO #DisciplineReason VALUES ('MISSING', 'MISSING')
	INSERT INTO #DisciplineReason 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'DisciplineReason'

	IF OBJECT_ID('tempdb..#IncidentInjuryType') IS NOT NULL
	DROP TABLE #IncidentInjuryType

	CREATE TABLE #IncidentInjuryType (IncidentInjuryTypeCode VARCHAR(50), IncidentInjuryTypeDescription VARCHAR(200))

	INSERT INTO #IncidentInjuryType VALUES ('MISSING', 'MISSING')
	INSERT INTO #IncidentInjuryType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'IncidentInjuryType'

	IF OBJECT_ID('tempdb..#IncidentReportedToLawEnforcementIndicator') IS NOT NULL
	DROP TABLE #IncidentReportedToLawEnforcementIndicator
	
	CREATE TABLE #IncidentReportedToLawEnforcementIndicator (IncidentReportedToLawEnforcementIndicatorCode VARCHAR(50), IncidentReportedToLawEnforcementIndicatorDescription VARCHAR(200))

	INSERT INTO #IncidentReportedToLawEnforcementIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #IncidentReportedToLawEnforcementIndicator 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'IncidentReportedToLawEnforcementIndicator'


	INSERT INTO [RDS].[DimIncidentStatuses] (
		  [IdeaInterimRemovalReasonCode]
		, [IdeaInterimRemovalReasonDescription]
		, [IdeaInterimRemovalReasonEdFactsCode]
		, [DisciplineReasonCode]
		, [DisciplineReasonDescription]
		, [IncidentInjuryTypeCode]
		, [IncidentInjuryTypeDescription]	
		, IncidentReportedToLawEnforcementIndicatorCode
		, IncidentReportedToLawEnforcementIndicatorDescription
	)
	SELECT 
		  a.IdeaInterimRemovalReasonCode
		, a.IdeaInterimRemovalReasonDescription
		, a.IdeaInterimRemovalReasonEdFactsCode
		, b.DisciplineReasonCode
		, b.DisciplineReasonDescription
		, c.IncidentInjuryTypeCode
		, c.IncidentInjuryTypeDescription
		, d.IncidentReportedToLawEnforcementIndicatorCode
		, d.IncidentReportedToLawEnforcementIndicatorDescription
	FROM #IdeaInterimRemovalReason a
	CROSS JOIN #DisciplineReason b
	CROSS JOIN #IncidentInjuryType c
	CROSS JOIN #IncidentReportedToLawEnforcementIndicator d
	LEFT JOIN RDS.DimIncidentStatuses main
		ON  a.IdeaInterimRemovalReasonCode = main.IdeaInterimRemovalReasonCode
		AND b.DisciplineReasonCode = main.DisciplineReasonCode
		AND c.IncidentInjuryTypeCode = main.IncidentInjuryTypeCode
		AND d.IncidentReportedToLawEnforcementIndicatorCode = main.IncidentReportedToLawEnforcementIndicatorCode
	WHERE main.DimIncidentStatusId IS NULL

	DROP TABLE #IdeaInterimRemovalReason
	DROP TABLE #DisciplineReason
	DROP TABLE #IncidentInjuryType
	DROP TABLE #IncidentReportedToLawEnforcementIndicator

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
		FROM [CEDS].CedsOptionSetMapping
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
		FROM [CEDS].CedsOptionSetMapping
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
	LEFT JOIN RDS.DimFirearmDisciplineStatuses dfds
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
	FROM [CEDS].CedsOptionSetMapping ceds
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
				WHEN 'SchoolCounselors' THEN 'GUI'
				WHEN 'SchoolPsychologist' THEN 'SCHPSYCH'
				WHEN 'SecondaryTeachers' THEN 'SECTCH'
				WHEN 'SpecialEducationTeachers' THEN 'MISSING'
				WHEN 'StudentSupportServicesStaff' THEN 'STUSUP'
				WHEN 'UngradedTeachers' THEN 'UGTCH'
				WHEN 'ElementarySchoolCounselors' THEN 'ELMGUI'
				WHEN 'SecondarySchoolCounselors' THEN 'SECGUI'
				WHEN 'LeaAdministrators' THEN 'LEAADM'
				WHEN 'LeaAdministrativeSupportStaff' THEN 'LEASUP'
				WHEN 'SchoolAdministrators' THEN 'SCHADM'
				WHEN 'SchoolAdministrativeSupportStaff' THEN 'SCHSUP'
				ELSE 'MISSING'
			  END
		FROM [CEDS].CedsOptionSetMapping
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
		FROM [CEDS].CedsOptionSetMapping
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
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'TitleIProgramStaffCategory'
		
		IF OBJECT_ID('tempdb..#MigrantEducationProgramStaffCategory') IS NOT NULL
			DROP TABLE #MigrantEducationProgramStaffCategory

		CREATE TABLE #MigrantEducationProgramStaffCategory (MigrantEducationProgramStaffCategoryCode VARCHAR(50), MigrantEducationProgramStaffCategoryDescription VARCHAR(200))

		INSERT INTO #MigrantEducationProgramStaffCategory VALUES ('MISSING', 'MISSING')
		INSERT INTO #MigrantEducationProgramStaffCategory 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'MigrantEducationProgramStaffCategory'

		
		IF OBJECT_ID('tempdb..#ProfessionalEducationalJobClassification') IS NOT NULL
			DROP TABLE #ProfessionalEducationalJobClassification

		CREATE TABLE #ProfessionalEducationalJobClassification (ProfessionalEducationalJobClassificationCode VARCHAR(50), ProfessionalEducationalJobClassificationDescription VARCHAR(200))

		INSERT INTO #ProfessionalEducationalJobClassification VALUES ('MISSING', 'MISSING')
		INSERT INTO #ProfessionalEducationalJobClassification 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS].CedsOptionSetMapping
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
	LEFT JOIN RDS.DimK12StaffCategories dfd
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
	FROM [CEDS].CedsOptionSetMapping ceds
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
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'Sex'


		INSERT INTO [RDS].[DimPsDemographics]
           ([SexCode]
           ,[SexDescription]
		   )
		SELECT DISTINCT
			  h.SexCode
			, h.SexDescription
		FROM #PsSex h
		LEFT JOIN RDS.DimPsDemographics main
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EducationalServicesAfterRemoval'
	
--EDFacts Code is incorrectly populated with the CEDS Code
	UPDATE #EducationalServicesAfterRemoval
	SET EducationalServicesAfterRemovalEdFactsCode = 'SERVPROV'
	WHERE EducationalServicesAfterRemovalEdFactsCode = 'Yes'

	UPDATE #EducationalServicesAfterRemoval
	SET EducationalServicesAfterRemovalEdFactsCode = 'SERVNOTPROV'
	WHERE EducationalServicesAfterRemovalEdFactsCode = 'No'


	IF OBJECT_ID('tempdb..#IdeaInterimRemovalReason2') IS NOT NULL BEGIN
		DROP TABLE #IdeaInterimRemovalReason2
	END

	CREATE TABLE #IdeaInterimRemovalReason2 (IdeaInterimRemovalReasonCode VARCHAR(50), IdeaInterimRemovalReasonDescription VARCHAR(200), IdeaInterimRemovalReasonEdFactsCode VARCHAR(50))

	INSERT INTO #IdeaInterimRemovalReason2 VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #IdeaInterimRemovalReason2 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, CedsOptionSetCode AS EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'IdeaInterimRemovalReason'

--EDFacts Code is incorrectly populated with the CEDS Code
	UPDATE #IdeaInterimRemovalReason2
	SET IdeaInterimRemovalReasonEdFactsCode = 'D'
	WHERE IdeaInterimRemovalReasonEdFactsCode = 'Drugs'

	UPDATE #IdeaInterimRemovalReason2
	SET IdeaInterimRemovalReasonEdFactsCode = 'W'
	WHERE IdeaInterimRemovalReasonEdFactsCode = 'Weapons'

	UPDATE #IdeaInterimRemovalReason2
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
	FROM [CEDS].CedsOptionSetMapping
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
	CROSS JOIN #IdeaInterimRemovalReason2 iirr
	CROSS JOIN #IdeaInterimRemoval iir
	LEFT JOIN RDS.DimDisciplineStatuses main
		ON dat.DisciplinaryActionTakenCode = main.DisciplinaryActionTakenCode
		AND dmocwd.DisciplineMethodOfChildrenWithDisabilitiesCode = main.DisciplineMethodOfChildrenWithDisabilitiesCode
		AND esar.EducationalServicesAfterRemovalCode = main.EducationalServicesAfterRemovalCode
		AND iirr.IdeaInterimRemovalReasonCode = main.IdeaInterimRemovalReasonCode
		AND iir.IdeaInterimRemovalCode = main.IdeaInterimRemovalCode
	WHERE main.DimDisciplineStatusId IS NULL

	DROP TABLE #DisciplinaryActionTaken
	DROP TABLE #DisciplineMethodOfChildrenWithDisabilities
	DROP TABLE #EducationalServicesAfterRemoval
	DROP TABLE #IdeaInterimRemovalReason2
	DROP TABLE #IdeaInterimRemoval


	PRINT 'Populate DimTeachingCredentialStatuses'
	-------------------------------------------------------------------------
	-- Populate DimTeachingCredentialStatuses   --
	-------------------------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimTeachingCredentialStatuses d WHERE d.DimTeachingCredentialStatusId = -1) 
	BEGIN
		SET IDENTITY_INSERT rds.DimTeachingCredentialStatuses ON

			INSERT INTO rds.DimTeachingCredentialStatuses (
						  DimTeachingCredentialStatusId
						, TeachingCredentialTypeCode
						, TeachingCredentialTypeDescription
						, TeachingCredentialTypeEdFactsCode
						, TeachingCredentialBasisCode
						, TeachingCredentialBasisDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')

		SET IDENTITY_INSERT rds.DimTeachingCredentialStatuses OFF
	END

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
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TeachingCredentialType'


	IF OBJECT_ID('tempdb..#TeachingCredentialBasis') IS NOT NULL BEGIN
		DROP TABLE #TeachingCredentialBasis
	END
	CREATE TABLE #TeachingCredentialBasis (TeachingCredentialBasisCode VARCHAR(50), TeachingCredentialBasisDescription VARCHAR(200))

	INSERT INTO #TeachingCredentialBasis VALUES ('MISSING', 'MISSING')
	INSERT INTO #TeachingCredentialBasis 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TeachingCredentialBasis'


	INSERT INTO rds.DimTeachingCredentialStatuses (
				  TeachingCredentialTypeCode
				, TeachingCredentialTypeDescription
				, TeachingCredentialTypeEdFactsCode
				, TeachingCredentialBasisCode
				, TeachingCredentialBasisDescription
			)
	SELECT 
		a.TeachingCredentialTypeCode
		,a.TeachingCredentialTypeDescription
		,a.TeachingCredentialTypeEdFactsCode
		,b.TeachingCredentialBasisCode
		,b.TeachingCredentialBasisDescription
	FROM #TeachingCredentialType a
	CROSS JOIN #TeachingCredentialBasis b
	LEFT JOIN RDS.DimTeachingCredentialStatuses main
		ON	a.TeachingCredentialTypeCode = main.TeachingCredentialTypeCode								
		AND b.TeachingCredentialBasisCode = main.TeachingCredentialBasisCode			
	WHERE main.DimTeachingCredentialStatusId IS NULL

	DROP TABLE #TeachingCredentialType
	DROP TABLE #TeachingCredentialBasis


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
			, CTEInstructorIndustryCertificationCode
			, CTEInstructorIndustryCertificationDescription
			, SpecialEducationParaprofessionalCode
			, SpecialEducationParaprofessionalDescription
			, SpecialEducationTeacherCode
			, SpecialEducationTeacherDescription
			)
		VALUES (-1, 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING')

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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EdFactsTeacherInexperiencedStatus'

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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SpecialEducationRelatedServicesPersonnel'


	IF OBJECT_ID('tempdb..#CTEInstructorIndustryCertification') IS NOT NULL BEGIN
		DROP TABLE #CTEInstructorIndustryCertification
	END
	CREATE TABLE #CTEInstructorIndustryCertification (CTEInstructorIndustryCertificationCode VARCHAR(50), CTEInstructorIndustryCertificationDescription VARCHAR(200))

	INSERT INTO #CTEInstructorIndustryCertification VALUES ('MISSING', 'MISSING')
	INSERT INTO #CTEInstructorIndustryCertification 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	CROSS JOIN #EdFactsTeacherOutOfFieldStatus eftoofs
	CROSS JOIN #SpecialEducationTeacherQualificationStatus setqs
	CROSS JOIN #ParaprofessionalQualificationStatus pqs
	CROSS JOIN #SpecialEducationRelatedServicesPersonnel sersp
	CROSS JOIN #CTEInstructorIndustryCertification cteiic
	CROSS JOIN #SpecialEducationParaprofessional sep
	CROSS JOIN #SpecialEducationTeacher spet
	LEFT JOIN RDS.DimK12StaffStatuses main
		ON seagt.SpecialEducationAgeGroupTaughtCode = main.SpecialEducationAgeGroupTaughtCode
		AND efcs.EdFactsCertificationStatusCode = main.EdFactsCertificationStatusCode
		AND hqti.HighlyQualifiedTeacherIndicatorCode = main.HighlyQualifiedTeacherIndicatorCode
		AND dftis.EdFactsTeacherInexperiencedStatusCode = main.EdFactsTeacherInexperiencedStatusCode
		AND eftoofs.EdFactsTeacherOutOfFieldStatusCode = main.EdFactsTeacherOutOfFieldStatusCode
		AND setqs.SpecialEducationTeacherQualificationStatusCode = main.SpecialEducationTeacherQualificationStatusCode
		AND pqs.ParaprofessionalQualificationStatusCode = main.ParaprofessionalQualificationStatusCode
		AND sersp.SpecialEducationRelatedServicesPersonnelCode = main.SpecialEducationRelatedServicesPersonnelCode
		AND cteiic.CTEInstructorIndustryCertificationCode = main.CTEInstructorIndustryCertificationCode
		AND sep.SpecialEducationParaprofessionalCode = main.SpecialEducationParaprofessionalCode
		AND spet.SpecialEducationTeacherCode = main.SpecialEducationTeacherCode
	WHERE main.DimK12StaffStatusId IS NULL

	DROP TABLE #SpecialEducationAgeGroupTaught
	DROP TABLE #EdFactsCertificationStatus
	DROP TABLE #HighlyQualifiedTeacherIndicator
	DROP TABLE #EdFactsTeacherInexperiencedStatus
	DROP TABLE #EdFactsTeacherOutOfFieldStatus
	DROP TABLE #SpecialEducationTeacherQualificationStatus
	DROP TABLE #ParaprofessionalQualificationStatus
	DROP TABLE #SpecialEducationRelatedServicesPersonnel
	DROP TABLE #CTEInstructorIndustryCertification
	DROP TABLE #SpecialEducationParaprofessional
	DROP TABLE #SpecialEducationTeacher



	PRINT 'Populate DimNOrDStatuses'
	------------------------------------------------
	-- Populate DimNOrDStatuses			 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimNOrDStatuses d WHERE d.DimNOrDStatusId = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimNOrDStatuses ON

		INSERT INTO RDS.DimNOrDStatuses
			   (DimNOrDStatusId
			   ,[NeglectedOrDelinquentLongTermStatusCode]
			   ,[NeglectedOrDelinquentLongTermStatusDescription]
			   ,[NeglectedOrDelinquentLongTermStatusEdFactsCode]
			   ,[NeglectedOrDelinquentProgramTypeCode]
			   ,[NeglectedOrDelinquentProgramTypeDescription]
			   ,[NeglectedOrDelinquentProgramTypeEdFactsCode]
			   ,[NeglectedProgramTypeCode]
			   ,[NeglectedProgramTypeDescription]
			   ,[NeglectedProgramTypeEdFactsCode]
			   ,[DelinquentProgramTypeCode]
			   ,[DelinquentProgramTypeDescription]
			   ,[DelinquentProgramTypeEdFactsCode]
			   ,[NeglectedOrDelinquentStatusCode]
			   ,[NeglectedOrDelinquentStatusDescription]
			   ,[NeglectedOrDelinquentProgramEnrollmentSubpartCode]
			   ,[NeglectedOrDelinquentProgramEnrollmentSubpartDescription]
			   ,[NeglectedOrDelinquentAcademicAchievementIndicatorCode]
			   ,[NeglectedOrDelinquentAcademicAchievementIndicatorDescription]
			   ,[NeglectedOrDelinquentAcademicOutcomeIndicatorCode]
			   ,[NeglectedOrDelinquentAcademicOutcomeIndicatorDescription])
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
				)

		SET IDENTITY_INSERT RDS.DimNOrDStatuses OFF

	END
	
	IF OBJECT_ID('tempdb..#NeglectedOrDelinquentLongTermStatus') IS NOT NULL
		DROP TABLE #NeglectedOrDelinquentLongTermStatus
	
	CREATE TABLE #NeglectedOrDelinquentLongTermStatus (NeglectedOrDelinquentLongTermStatusCode VARCHAR(50), 
	NeglectedOrDelinquentLongTermStatusDescription VARCHAR(100), NeglectedOrDelinquentLongTermStatusEdFactsCode VARCHAR(50))

	INSERT INTO #NeglectedOrDelinquentLongTermStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #NeglectedOrDelinquentLongTermStatus VALUES ('NDLONGTERM', 'Long-Term N or D Students', 'NDLONGTERM')
	
	IF OBJECT_ID('tempdb..#NeglectedOrDelinquentProgramType') IS NOT NULL
		DROP TABLE #NeglectedOrDelinquentProgramType

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
			ELSE 'MISSING'
		END
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'NeglectedOrDelinquentProgramType'

	IF OBJECT_ID('tempdb..#NeglectedProgramType') IS NOT NULL
		DROP TABLE #NeglectedProgramType

	CREATE TABLE #NeglectedProgramType (NeglectedProgramTypeCode VARCHAR(50), NeglectedProgramTypeDescription VARCHAR(200), NeglectedProgramTypeEdFactsCode VARCHAR(50))

	INSERT INTO #NeglectedProgramType VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #NeglectedProgramType
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'NeglectedProgramType'

	IF OBJECT_ID('tempdb..#DelinquentProgramType') IS NOT NULL
		DROP TABLE #DelinquentProgramType

	CREATE TABLE #DelinquentProgramType (DelinquentProgramTypeCode VARCHAR(50), DelinquentProgramTypeDescription VARCHAR(200), DelinquentProgramTypeEdFactsCode VARCHAR(50))

	INSERT INTO #DelinquentProgramType VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #DelinquentProgramType
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'DelinquentProgramType'

	IF OBJECT_ID('tempdb..#NeglectedOrDelinquentStatus') IS NOT NULL
		DROP TABLE #NeglectedOrDelinquentStatus

	CREATE TABLE #NeglectedOrDelinquentStatus (NeglectedOrDelinquentStatusCode VARCHAR(50), NeglectedOrDelinquentStatusDescription VARCHAR(200))

	INSERT INTO #NeglectedOrDelinquentStatus VALUES ('MISSING', 'MISSING')
	INSERT INTO #NeglectedOrDelinquentStatus
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'NeglectedOrDelinquentStatus'

	IF OBJECT_ID('tempdb..#NeglectedOrDelinquentProgramEnrollmentSubpart') IS NOT NULL
		DROP TABLE #NeglectedOrDelinquentProgramEnrollmentSubpart

	CREATE TABLE #NeglectedOrDelinquentProgramEnrollmentSubpart (NeglectedOrDelinquentProgramEnrollmentSubpartCode VARCHAR(50), NeglectedOrDelinquentProgramEnrollmentSubpartDescription VARCHAR(200))

	INSERT INTO #NeglectedOrDelinquentProgramEnrollmentSubpart VALUES ('MISSING', 'MISSING')

	INSERT INTO #NeglectedOrDelinquentProgramEnrollmentSubpart
		VALUES
			 ('Subpart1', 'State Agency')
			,('Subpart2', 'Local Agency')
	--Uncomment V14
	--INSERT INTO #NeglectedOrDelinquentProgramEnrollmentSubpart
	--SELECT
	--	  CedsOptionSetCode
	--	, CedsOptionSetDescription
	--FROM [CEDS].CedsOptionSetMapping
	--WHERE CedsElementTechnicalName = 'NeglectedOrDelinquentProgramEnrollmentSubpart'

	IF OBJECT_ID('tempdb..#NeglectedOrDelinquentAcademicAchievementIndicator') IS NOT NULL
		DROP TABLE #NeglectedOrDelinquentAcademicAchievementIndicator

	CREATE TABLE #NeglectedOrDelinquentAcademicAchievementIndicator (NeglectedOrDelinquentAcademicAchievementIndicatorCode VARCHAR(50), NeglectedOrDelinquentAcademicAchievementIndicatorDescription VARCHAR(200))

	INSERT INTO #NeglectedOrDelinquentAcademicAchievementIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #NeglectedOrDelinquentAcademicAchievementIndicator
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'NeglectedOrDelinquentAcademicAchievementIndicator'

	IF OBJECT_ID('tempdb..#NeglectedOrDelinquentAcademicOutcomeIndicator') IS NOT NULL
		DROP TABLE #NeglectedOrDelinquentAcademicOutcomeIndicator

	CREATE TABLE #NeglectedOrDelinquentAcademicOutcomeIndicator (NeglectedOrDelinquentAcademicOutcomeIndicatorCode VARCHAR(50), NeglectedOrDelinquentAcademicOutcomeIndicatorDescription VARCHAR(200))

	INSERT INTO #NeglectedOrDelinquentAcademicOutcomeIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #NeglectedOrDelinquentAcademicOutcomeIndicator
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'NeglectedOrDelinquentAcademicOutcomeIndicator'
   

	INSERT INTO RDS.DimNOrDStatuses
		(
			    [NeglectedOrDelinquentLongTermStatusCode]
			   ,[NeglectedOrDelinquentLongTermStatusDescription]
			   ,[NeglectedOrDelinquentLongTermStatusEdFactsCode]
			   ,[NeglectedOrDelinquentProgramTypeCode]
			   ,[NeglectedOrDelinquentProgramTypeDescription]
			   ,[NeglectedOrDelinquentProgramTypeEdFactsCode]
			   ,[NeglectedProgramTypeCode]
			   ,[NeglectedProgramTypeDescription]
			   ,[NeglectedProgramTypeEdFactsCode]
			   ,[DelinquentProgramTypeCode]
			   ,[DelinquentProgramTypeDescription]
			   ,[DelinquentProgramTypeEdFactsCode]
			   ,[NeglectedOrDelinquentStatusCode]
			   ,[NeglectedOrDelinquentStatusDescription]
			   ,[NeglectedOrDelinquentProgramEnrollmentSubpartCode]
			   ,[NeglectedOrDelinquentProgramEnrollmentSubpartDescription]
			   ,[NeglectedOrDelinquentAcademicAchievementIndicatorCode]
			   ,[NeglectedOrDelinquentAcademicAchievementIndicatorDescription]
			   ,[NeglectedOrDelinquentAcademicOutcomeIndicatorCode]
			   ,[NeglectedOrDelinquentAcademicOutcomeIndicatorDescription])

	SELECT		a.[NeglectedOrDelinquentLongTermStatusCode]
			   ,a.[NeglectedOrDelinquentLongTermStatusDescription]
			   ,a.[NeglectedOrDelinquentLongTermStatusEdFactsCode]
			   ,b.[NeglectedOrDelinquentProgramTypeCode]
			   ,b.[NeglectedOrDelinquentProgramTypeDescription]
			   ,b.[NeglectedOrDelinquentProgramTypeEdFactsCode]
			   ,c.[NeglectedProgramTypeCode]
			   ,c.[NeglectedProgramTypeDescription]
			   ,c.[NeglectedProgramTypeEdFactsCode]
			   ,d.[DelinquentProgramTypeCode]
			   ,d.[DelinquentProgramTypeDescription]
			   ,d.[DelinquentProgramTypeEdFactsCode]
			   ,e.[NeglectedOrDelinquentStatusCode]
			   ,e.[NeglectedOrDelinquentStatusDescription]
			   ,f.[NeglectedOrDelinquentProgramEnrollmentSubpartCode]
			   ,f.[NeglectedOrDelinquentProgramEnrollmentSubpartDescription]
			   ,g.[NeglectedOrDelinquentAcademicAchievementIndicatorCode]
			   ,g.[NeglectedOrDelinquentAcademicAchievementIndicatorDescription]
			   ,h.[NeglectedOrDelinquentAcademicOutcomeIndicatorCode]
			   ,h.[NeglectedOrDelinquentAcademicOutcomeIndicatorDescription]
	FROM #NeglectedOrDelinquentLongTermStatus a
	CROSS JOIN #NeglectedOrDelinquentProgramType b
	CROSS JOIN #NeglectedProgramType c
	CROSS JOIN #DelinquentProgramType d
	CROSS JOIN #NeglectedOrDelinquentStatus e
	CROSS JOIN #NeglectedOrDelinquentProgramEnrollmentSubpart f
	CROSS JOIN #NeglectedOrDelinquentAcademicAchievementIndicator g
	CROSS JOIN #NeglectedOrDelinquentAcademicOutcomeIndicator h
	LEFT JOIN RDS.DimNOrDStatuses main
		ON a.NeglectedOrDelinquentLongTermStatusCode = main.NeglectedOrDelinquentLongTermStatusCode
		AND b.NeglectedOrDelinquentProgramTypeCode = main.NeglectedOrDelinquentProgramTypeCode
		AND c.NeglectedProgramTypeCode = main.NeglectedProgramTypeCode
		AND d.DelinquentProgramTypeCode = main.DelinquentProgramTypeCode
		AND e.NeglectedOrDelinquentStatusCode = main.NeglectedOrDelinquentStatusCode
		AND f.NeglectedOrDelinquentProgramEnrollmentSubpartCode = main.NeglectedOrDelinquentProgramEnrollmentSubpartCode
		AND g.NeglectedOrDelinquentAcademicAchievementIndicatorCode = main.NeglectedOrDelinquentAcademicAchievementIndicatorCode
		AND h.NeglectedOrDelinquentAcademicOutcomeIndicatorCode = main.NeglectedOrDelinquentAcademicOutcomeIndicatorCode
	WHERE main.DimNOrDStatusId IS NULL

	DROP TABLE #NeglectedOrDelinquentProgramType
	DROP TABLE #NeglectedProgramType
	DROP TABLE #DelinquentProgramType
	DROP TABLE #NeglectedOrDelinquentLongTermStatus
	DROP TABLE #NeglectedOrDelinquentStatus
	DROP TABLE #NeglectedOrDelinquentProgramEnrollmentSubpart
	DROP TABLE #NeglectedOrDelinquentAcademicAchievementIndicator
	DROP TABLE #NeglectedOrDelinquentAcademicOutcomeIndicator


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
			, TitleIIILanguageInstructionProgramTypeEdFactsCode
			, EnglishLearnerExitedStatusCode
			, EnglishLearnerExitedStatusDescription
			, EnglishLearnerExitedStatusEdFactsCode)
		VALUES (-1, 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimTitleIIIStatuses OFF
	END

	IF OBJECT_ID('tempdb..#ProgramParticipationTitleIIILiep') IS NOT NULL BEGIN
		DROP TABLE #ProgramParticipationTitleIIILiep
	END

	CREATE TABLE #ProgramParticipationTitleIIILiep (ProgramParticipationTitleIIILiepCode VARCHAR(50), ProgramParticipationTitleIIILiepDescription VARCHAR(200))

	INSERT INTO #ProgramParticipationTitleIIILiep VALUES ('MISSING', 'MISSING')
	INSERT INTO #ProgramParticipationTitleIIILiep
	VALUES 
		('Yes', 'Yes')
		,('No', 'No')

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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TitleIIILanguageInstructionProgramType'

	IF OBJECT_ID('tempdb..#EnglishLearnerExitedStatus') IS NOT NULL BEGIN
		DROP TABLE #EnglishLearnerExitedStatus
	END

	CREATE TABLE #EnglishLearnerExitedStatus (EnglishLearnerExitedStatusCode VARCHAR(50), EnglishLearnerExitedStatusDescription VARCHAR(200), EnglishLearnerExitedStatusEdFactsCode VARCHAR(50))

	INSERT INTO #EnglishLearnerExitedStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EnglishLearnerExitedStatus
	VALUES
		('Yes', 'Yes', 'Yes')
		,('No', 'No', 'No')

	   
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
			, TitleIIILanguageInstructionProgramTypeEdFactsCode
			, EnglishLearnerExitedStatusCode
			, EnglishLearnerExitedStatusDescription
			, EnglishLearnerExitedStatusEdFactsCode)
	SELECT 
			  a.ProgramParticipationTitleIIILiepCode
			, a.ProgramParticipationTitleIIILiepDescription
			, b.TitleIIIImmigrantParticipationStatusCode
			, b.TitleIIIImmigrantParticipationStatusDescription
			, b.TitleIIIImmigrantParticipationStatusEdFactsCode
			, c.ProficiencyStatusCode
			, c.ProficiencyStatusDescription
			, c.ProficiencyStatusEdFactsCode
			, d.TitleIIIAccountabilityProgressStatusCode
			, d.TitleIIIAccountabilityProgressStatusDescription
			, d.TitleIIIAccountabilityProgressStatusEdFactsCode
			, e.TitleIIILanguageInstructionProgramTypeCode
			, e.TitleIIILanguageInstructionProgramTypeDescription
			, e.TitleIIILanguageInstructionProgramTypeEdFactsCode
			, f.EnglishLearnerExitedStatusCode
			, f.EnglishLearnerExitedStatusDescription
			, f.EnglishLearnerExitedStatusEdFactsCode
	FROM #ProgramParticipationTitleIIILiep a
	CROSS JOIN #TitleIIIImmigrantParticipationStatus b
	CROSS JOIN #ProficiencyStatus c
	CROSS JOIN #TitleIIIAccountabilityProgressStatus d
	CROSS JOIN #TitleIIILanguageInstructionProgramType e
	CROSS JOIN #EnglishLearnerExitedStatus f
	LEFT JOIN RDS.DimTitleIIIStatuses main
		ON a.ProgramParticipationTitleIIILiepCode = main.ProgramParticipationTitleIIILiepCode
		AND b.TitleIIIImmigrantParticipationStatusCode = main.TitleIIIImmigrantParticipationStatusCode
		AND c.ProficiencyStatusCode = main.ProficiencyStatusCode
		AND d.TitleIIIAccountabilityProgressStatusCode = main.TitleIIIAccountabilityProgressStatusCode
		AND e.TitleIIILanguageInstructionProgramTypeCode = main.TitleIIILanguageInstructionProgramTypeCode
		AND f.EnglishLearnerExitedStatusCode = main.EnglishLearnerExitedStatusCode
	WHERE main.DimTitleIIIStatusId IS NULL

	DROP TABLE #ProgramParticipationTitleIIILiep
	DROP TABLE #TitleIIIImmigrantParticipationStatus
	DROP TABLE #ProficiencyStatus
	DROP TABLE #TitleIIIAccountabilityProgressStatus
	DROP TABLE #TitleIIILanguageInstructionProgramType
	DROP TABLE #EnglishLearnerExitedStatus

	PRINT 'Populate DimAttendances'
	-----------------------------------------------------
	-- Populate DimAttendances                     --
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAttendances d WHERE d.DimAttendanceId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimAttendances ON

		INSERT INTO [RDS].[DimAttendances]
           ([DimAttendanceId]
           ,ChronicStudentAbsenteeismIndicatorCode
           ,ChronicStudentAbsenteeismIndicatorDescription
		   ,ChronicStudentAbsenteeismIndicatorEdFactsCode
		   ,AttendanceEventTypeCode
		   ,AttendanceEventTypeDescription
		   ,AttendanceStatusCode
		   ,AttendanceStatusDescription
		   ,PresentAttendanceCategoryCode
		   ,PresentAttendanceCategoryDescription
		   ,AbsentAttendanceCategoryCode
		   ,AbsentAttendanceCategoryDescription
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
				)

		SET IDENTITY_INSERT RDS.DimAttendances OFF

	END


	IF OBJECT_ID('tempdb..#ChronicStudentAbsenteeismIndicator') IS NOT NULL BEGIN
		DROP TABLE #ChronicStudentAbsenteeismIndicator
	END

	CREATE TABLE #ChronicStudentAbsenteeismIndicator (ChronicStudentAbsenteeismIndicatorCode VARCHAR(50), ChronicStudentAbsenteeismIndicatorDescription VARCHAR(200), ChronicStudentAbsenteeismIndicatorEdFactsCode VARCHAR(50))

	INSERT INTO #ChronicStudentAbsenteeismIndicator VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #ChronicStudentAbsenteeismIndicator 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ChronicStudentAbsenteeismIndicator'

	IF OBJECT_ID('tempdb..#AttendanceEventType') IS NOT NULL BEGIN
		DROP TABLE #AttendanceEventType
	END

	CREATE TABLE #AttendanceEventType (AttendanceEventTypeCode VARCHAR(50), AttendanceEventTypeDescription VARCHAR(200))

	INSERT INTO #AttendanceEventType VALUES ('MISSING', 'MISSING')
	INSERT INTO #AttendanceEventType 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AttendanceEventType'

	IF OBJECT_ID('tempdb..#AttendanceStatus') IS NOT NULL BEGIN
		DROP TABLE #AttendanceStatus
	END

	CREATE TABLE #AttendanceStatus (AttendanceStatusCode VARCHAR(50), AttendanceStatusDescription VARCHAR(200))

	INSERT INTO #AttendanceStatus VALUES ('MISSING', 'MISSING')
	INSERT INTO #AttendanceStatus 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AttendanceStatus'

	IF OBJECT_ID('tempdb..#PresentAttendanceCategory') IS NOT NULL BEGIN
		DROP TABLE #PresentAttendanceCategory
	END

	CREATE TABLE #PresentAttendanceCategory (PresentAttendanceCategoryCode VARCHAR(50), PresentAttendanceCategoryDescription VARCHAR(200))

	INSERT INTO #PresentAttendanceCategory VALUES ('MISSING', 'MISSING')
	INSERT INTO #PresentAttendanceCategory 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PresentAttendanceCategory'

	IF OBJECT_ID('tempdb..#AbsentAttendanceCategory') IS NOT NULL BEGIN
		DROP TABLE #AbsentAttendanceCategory
	END

	CREATE TABLE #AbsentAttendanceCategory (AbsentAttendanceCategoryCode VARCHAR(50), AbsentAttendanceCategoryDescription VARCHAR(200))

	INSERT INTO #AbsentAttendanceCategory VALUES ('MISSING', 'MISSING')
	INSERT INTO #AbsentAttendanceCategory 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AbsentAttendanceCategory'

	INSERT INTO RDS.DimAttendances
		(
			  ChronicStudentAbsenteeismIndicatorCode
			, ChronicStudentAbsenteeismIndicatorDescription
			, ChronicStudentAbsenteeismIndicatorEdFactsCode
			, AttendanceEventTypeCode
			, AttendanceEventTypeDescription
			, AttendanceStatusCode
			, AttendanceStatusDescription
			, PresentAttendanceCategoryCode
			, PresentAttendanceCategoryDescription
			, AbsentAttendanceCategoryCode
			, AbsentAttendanceCategoryDescription
		)
	SELECT 
			  a.ChronicStudentAbsenteeismIndicatorCode
			, a.ChronicStudentAbsenteeismIndicatorDescription
			, a.ChronicStudentAbsenteeismIndicatorEdFactsCode
			, b.AttendanceEventTypeCode
			, b.AttendanceEventTypeDescription
			, c.AttendanceStatusCode
			, c.AttendanceStatusDescription
			, d.PresentAttendanceCategoryCode
			, d.PresentAttendanceCategoryDescription
			, e.AbsentAttendanceCategoryCode
			, e.AbsentAttendanceCategoryDescription

	FROM #ChronicStudentAbsenteeismIndicator a
	CROSS JOIN #AttendanceEventType b
	CROSS JOIN #AttendanceStatus c
	CROSS JOIN #PresentAttendanceCategory d
	CROSS JOIN #AbsentAttendanceCategory e
	LEFT JOIN RDS.DimAttendances main
		ON a.ChronicStudentAbsenteeismIndicatorCode = main.ChronicStudentAbsenteeismIndicatorCode
		AND b.AttendanceEventTypeCode = main.AttendanceEventTypeCode
		AND c.AttendanceStatusCode = main.AttendanceStatusCode
		AND d.PresentAttendanceCategoryCode = main.PresentAttendanceCategoryCode
		AND e.AbsentAttendanceCategoryCode = main.AbsentAttendanceCategoryCode
	WHERE main.DimAttendanceId IS NULL

	DROP TABLE #ChronicStudentAbsenteeismIndicator
	DROP TABLE #AttendanceEventType
	DROP TABLE #AttendanceStatus
	DROP TABLE #PresentAttendanceCategory
	DROP TABLE #AbsentAttendanceCategory

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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	LEFT JOIN RDS.DimCteStatuses main
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
		INSERT INTO RDS.DimLanguages (
			  DimLanguageId
			, Iso6392LanguageCodeCode
			, Iso6392LanguageCodeDescription
			, Iso6392LanguageCodeEdFactsCode
			, Iso6393LanguageCodeCode
			, Iso6393LanguageCodeDescription) 
		VALUES ('-1', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING')
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
	From [CEDS].CedsOptionSetMapping iso2
		full outer join [CEDS].CedsOptionSetMapping iso3
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	LEFT JOIN RDS.DimComprehensiveAndTargetedSupports main
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
	-- FROM [CEDS].CedsOptionSetMapping
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
	-- LEFT JOIN RDS.DimCharterSchoolStatuses main
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
           (DimFactTypeId
		   ,FactTypeCode
           ,FactTypeDescription
		   ,FactTypeLabel)
			VALUES (-1, 'NA', 'NotApplicable', NULL)
				,('1',	'datapopulation',	'DATAPOPULATION - studentsex,studentswdtitle1,studentcount,studentdiscipline,studentdisability,studentsubpopulation,studentrace', NULL)
				,('3',	'childcount',	'CHILDCOUNT - 002,089', 'Child Count')
				,('4',	'exiting',	'EXITING - 009', 'Exiting')
				,('5',	'cte',	'CTE - 082,083,154,155,156,158,169', NULL)
				,('6',	'membership',	'MEMBERSHIP - 033,052,226', 'Membership')
				,('7',	'dropout',	'DROPOUT - 032', 'Dropout')
				,('8',	'graduatescompleters',	'GRADUATESCOMPLETERS - 040', 'Graduates/Completers')
				,('9',	'titleIIIELOct',	'TITLEIIIELOCT - 141', 'Title III English Learner Students - October')
				,('10',	'titleIIIELSY',	'TITLEIIIELSY - 045,116,210,211', 'Title III English Learner Students - School Year')
				,('11',	'sppapr',	'SPPAPR - indicator4a,indicator4b,indicator9,indicator10', NULL)
				,('12',	'titleI',	'TITLEI - 037,134,222', 'Title I')
				,('13',	'migranteducationprogram',	'MIGRANTEDUCATIONPROGRAM - 054,121,145,165', 'Migrant Education Program')
				,('14',	'immigrant',	'IMMIGRANT -', 'Immigrant')
				,('15',	'neglectedordelinquent',	'NEGLECTEDORDELINQUENT - 119,127,218,219,220,221', 'Neglected or Delinquent')
				,('16',	'homeless',	'HOMELESS - 118,194', 'Homeless')
				,('17',	'chronicabsenteeism',	'CHRONIC - 195', 'Chronic Absenteeism')
				,('18',	'graduationrate',	'GRADUATIONRATE - 150,151', 'Graduation Rate')
				,('19',	'hsgradenroll',	'HSGRADPSENROLL - 160', 'High School Graduates Postsecondary Enrollment')
				,('20',	'other',	'OTHER - Other Miscellaneous Reports', NULL)
				,('21',	'directory',	'Directory related reports - 029,035,039,129,130,131,132,163,170,190,193,196,197,198,205,206,207,223', 'Directory')
				,('22',	'organizationstatus',	'ORGANIZATIONSTATUS - 199,200,201,202', NULL)
				,('23',	'compsupport',	'COMPSUPPORT - 212', 'Comprehensive Support and Targeted Support Identification')
				,('24',	'discipline',	'DISCIPLINE - 005,006,007,086,088,143,144', 'Discipline')
				,('25',	'assessment',	'ASSESSMENT - 050,113,125,126,137,138,139,175,178,179,185,188,189,224,225', 'Assessment')
				,('26',	'staff',	'STAFF - 059,067,070,099,112,203', 'Staff')


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
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'FinancialAccountBalanceSheetCode'


		INSERT INTO [RDS].[DimFederalFinancialAccountBalances]
           ([FinancialAccountBalanceSheetCodeCode]
           ,[FinancialAccountBalanceSheetCodeDescription]
		   )
		SELECT DISTINCT
			  h.FinancialAccountBalanceSheetCodeCode
			, h.FinancialAccountBalanceSheetCodeDescription
		FROM #FinancialAccountBalanceCode h
		LEFT JOIN RDS.DimFederalFinancialAccountBalances main
			ON  h.FinancialAccountBalanceSheetCodeCode = main.FinancialAccountBalanceSheetCodeCode
		WHERE main.DimFederalFinancialAccountBalanceId IS NULL

	DROP TABLE #FinancialAccountBalanceCode


	PRINT 'Populate DimFederalFinancialAccountClassifications'
	-------------------------------------------------------------------------
	-- Populate DimFederalFinancialAccountClassifications   --
	-------------------------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimFederalFinancialAccountClassifications d WHERE d.DimFederalFinancialAccountClassificationId = -1) BEGIN
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
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'FinancialAccountCategory'
	
	IF OBJECT_ID('tempdb..#FinancialAccountProgramCode') IS NOT NULL
		DROP TABLE #FinancialAccountProgramCode

	CREATE TABLE #FinancialAccountProgramCode (FinancialAccountProgramCodeCode VARCHAR(50), FinancialAccountProgramCodeDescription VARCHAR(200))

	INSERT INTO #FinancialAccountProgramCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #FinancialAccountProgramCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	LEFT JOIN RDS.DimFederalFinancialAccountClassifications ffac
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
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'FinancialAccountRevenueCode'


		INSERT INTO [RDS].[DimFederalFinancialRevenueClassifications]
           ([FinancialAccountRevenueCodeCode]
           ,[FinancialAccountRevenueCodeDescription]
		   )
		SELECT DISTINCT
			  h.FinancialAccountRevenueCodeCode
			, h.FinancialAccountRevenueCodeDescription
		FROM #FinancialAccountRevenueCode h
		LEFT JOIN RDS.DimFederalFinancialRevenueClassifications main
			ON  h.FinancialAccountRevenueCodeCode = main.FinancialAccountRevenueCodeCode
		WHERE main.DimFederalFinancialRevenueClassificationId IS NULL

	DROP TABLE #FinancialAccountRevenueCode

	PRINT 'Populate DimFederalFinancialExpenditureClassifications'
	------------------------------------------------------------------------------
	-- Populate DimFederalFinancialExpenditureClassifications   --
	------------------------------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimFederalFinancialExpenditureClassifications d WHERE d.DimFederalFinancialExpenditureClassificationId = -1) BEGIN
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	LEFT JOIN RDS.DimFederalFinancialExpenditureClassifications ffec
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
	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibleEducationMaterialStatuses d WHERE d.DimAccessibleEducationMaterialStatusId = -1) BEGIN
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
	SELECT 
	 	CedsOptionSetCode
	 	, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AccessibleFormatIssuedIndicator'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#AccessibleFormatRequiredIndicatorCode') IS NOT NULL
		DROP TABLE #AccessibleFormatRequiredIndicatorCode

	CREATE TABLE #AccessibleFormatRequiredIndicatorCode (AccessibleFormatRequiredIndicatorCode VARCHAR(50), AccessibleFormatRequiredIndicatorDescription VARCHAR(200))

	INSERT INTO #AccessibleFormatRequiredIndicatorCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #AccessibleFormatRequiredIndicatorCode 
	SELECT 
	 	CedsOptionSetCode
	 	, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AccessibleFormatRequiredIndicator'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#AccessibleFormatTypeCode') IS NOT NULL
		DROP TABLE #AccessibleFormatTypeCode

	CREATE TABLE #AccessibleFormatTypeCode (AccessibleFormatTypeCode VARCHAR(50), AccessibleFormatTypeDescription VARCHAR(200))

	INSERT INTO #AccessibleFormatTypeCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #AccessibleFormatTypeCode 
	SELECT 
	 	CedsOptionSetCode
	 	, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AccessibleFormatType'
	ORDER BY CedsOptionSetCode

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
		a.AccessibleFormatIssuedIndicatorCode,
		a.AccessibleFormatIssuedIndicatorDescription,
		b.AccessibleFormatRequiredIndicatorCode,
		b.AccessibleFormatRequiredIndicatorDescription,
		c.AccessibleFormatTypeCode,
		c.AccessibleFormatTypeDescription
	FROM
		#AccessibleFormatIssuedIndicatorCode a
		CROSS JOIN #AccessibleFormatRequiredIndicatorCode b
		CROSS JOIN #AccessibleFormatTypeCode c
		LEFT JOIN [RDS].[DimAccessibleEducationMaterialStatuses] main
			ON a.AccessibleFormatIssuedIndicatorCode = main.AccessibleFormatIssuedIndicatorCode
			AND b.AccessibleFormatRequiredIndicatorCode = main.AccessibleFormatRequiredIndicatorCode
			AND c.AccessibleFormatTypeCode = main.AccessibleFormatTypeCode
		WHERE main.DimAccessibleEducationMaterialStatusId IS NULL

	-- Drop temp tables
	DROP TABLE #AccessibleFormatIssuedIndicatorCode
	DROP TABLE #AccessibleFormatRequiredIndicatorCode
	DROP TABLE #AccessibleFormatTypeCode
	

	PRINT 'Populate DimCredentialAwardStatuses'
	------------------------------------------------------------------------------
	-- Populate DimCredentialAwardStatuses --
	------------------------------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimCredentialAwardStatuses d WHERE d.DimCredentialAwardStatusId = -1) BEGIN
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AdultEducationCertificationType'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#CredentialSuspensionIndicatorCode') IS NOT NULL
		DROP TABLE #CredentialSuspensionIndicatorCode

	CREATE TABLE #CredentialSuspensionIndicatorCode (CredentialSuspensionIndicatorCode VARCHAR(50), CredentialSuspensionIndicatorDescription VARCHAR(200))

	INSERT INTO #CredentialSuspensionIndicatorCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #CredentialSuspensionIndicatorCode 
	VALUES ('Yes', 'Yes'), ('No', 'No')

	-- Uncomment when Credential Suspension Indicator is officially available in the CEDS-Elements database
	 --SELECT 
	 --	  CedsOptionSetCode
	 --	, CedsOptionSetDescription
	 --FROM [CEDS].CedsOptionSetMapping
	 --WHERE CedsElementTechnicalName = 'CredentialSuspensionIndicator'
	 --ORDER BY CedsOptionSetCode


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
		LEFT JOIN RDS.DimCredentialAwardStatuses cas
			ON	cric.CredentialRevokedIndicatorCode = cas.CredentialRevokedIndicatorCode								
			AND crr.CredentialRevokedReasonCode = cas.CredentialRevokedReasonCode
			AND aec.AdultEducationCertificationTypeCode = cas.AdultEducationCertificationTypeCode
			AND csic.CredentialSuspensionIndicatorCode = cas.CredentialSuspensionIndicatorCode
		WHERE cas.DimCredentialAwardStatusId IS NULL

	DROP TABLE #CredentialRevokedIndicatorCode
	DROP TABLE #CredentialRevokedReasonCode
	DROP TABLE #AdultEducationCertificationTypeCode
	DROP TABLE #CredentialSuspensionIndicatorCode


	PRINT 'Populate DimK12EmploymentStatuses'
	------------------------------------------------------------------------------
	-- Populate DimK12EmploymentStatuses --
	------------------------------------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12EmploymentStatuses d WHERE d.DimK12EmploymentStatusId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimK12EmploymentStatuses ON

			INSERT INTO rds.DimK12EmploymentStatuses (
						  DimK12EmploymentStatusId
						, EmploymentStatusCode
						, EmploymentStatusDescription
						, EmploymentSeparationReasonCode
						, EmploymentSeparationReasonDescription
						, EmploymentSeparationTypeCode
						, EmploymentSeparationTypeDescription
						, TitleITargetedAssistanceStaffFundedCode
						, TitleITargetedAssistanceStaffFundedDescription
						, MEPPersonnelIndicatorCode
						, MEPPersonnelIndicatorDescription
						, SalaryForTeachingAssignmentOnlyIndicatorCode
						, SalaryForTeachingAssignmentOnlyIndicatorDescription
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
	SET IDENTITY_INSERT rds.DimK12EmploymentStatuses OFF
	END

	-- Create temp tables for all elements
	IF OBJECT_ID('tempdb..#EmploymentStatusCode') IS NOT NULL
		DROP TABLE #EmploymentStatusCode

	CREATE TABLE #EmploymentStatusCode (EmploymentStatusCode VARCHAR(50), EmploymentStatusDescription VARCHAR(200))

	INSERT INTO #EmploymentStatusCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #EmploymentStatusCode
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EmploymentSeparationReason'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#EmploymentSeparationTypeCode') IS NOT NULL
		DROP TABLE #EmploymentSeparationTypeCode

	CREATE TABLE #EmploymentSeparationTypeCode (EmploymentSeparationTypeCode VARCHAR(50), EmploymentSeparationTypeDescription VARCHAR(200))

	INSERT INTO #EmploymentSeparationTypeCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #EmploymentSeparationTypeCode
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EmploymentSeparationType'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#TitleITargetedAssistanceStaffFundedCode') IS NOT NULL
		DROP TABLE #TitleITargetedAssistanceStaffFundedCode

	CREATE TABLE #TitleITargetedAssistanceStaffFundedCode (TitleITargetedAssistanceStaffFundedCode VARCHAR(50), TitleITargetedAssistanceStaffFundedDescription VARCHAR(200))

	INSERT INTO #TitleITargetedAssistanceStaffFundedCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #TitleITargetedAssistanceStaffFundedCode
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MEPPersonnelIndicatorCode'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#SalaryForTeachingAssignmentOnlyIndicatorCode') IS NOT NULL
		DROP TABLE #SalaryForTeachingAssignmentOnlyIndicatorCode

	CREATE TABLE #SalaryForTeachingAssignmentOnlyIndicatorCode (SalaryForTeachingAssignmentOnlyIndicatorCode VARCHAR(50), SalaryForTeachingAssignmentOnlyIndicatorDescription VARCHAR(200))

	INSERT INTO #SalaryForTeachingAssignmentOnlyIndicatorCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #SalaryForTeachingAssignmentOnlyIndicatorCode
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SalaryForTeachingAssignmentOnlyIndicator'
	ORDER BY CedsOptionSetCode

	-- Insert into DimK12EmploymentStatuses table
	INSERT INTO [RDS].[DimK12EmploymentStatuses](
		  [EmploymentStatusCode]
		, [EmploymentStatusDescription]
		, [EmploymentSeparationReasonCode]
		, [EmploymentSeparationReasonDescription]
		, [EmploymentSeparationTypeCode]
		, EmploymentSeparationTypeDescription
		, [TitleITargetedAssistanceStaffFundedCode]
		, [TitleITargetedAssistanceStaffFundedDescription]
		, [MEPPersonnelIndicatorCode]
		, [MEPPersonnelIndicatorDescription]
		, [SalaryForTeachingAssignmentOnlyIndicatorCode]
		, [SalaryForTeachingAssignmentOnlyIndicatorDescription]
	)
	SELECT 
		a.EmploymentStatusCode
		, a.EmploymentStatusDescription
		, b.EmploymentSeparationReasonCode
		, b.EmploymentSeparationReasonDescription
		, c.EmploymentSeparationTypeCode
		, c.EmploymentSeparationTypeDescription
		, d.TitleITargetedAssistanceStaffFundedCode
		, d.TitleITargetedAssistanceStaffFundedDescription
		, e.MEPPersonnelIndicatorCode
		, e.MEPPersonnelIndicatorDescription
		, f.SalaryForTeachingAssignmentOnlyIndicatorCode
		, f.SalaryForTeachingAssignmentOnlyIndicatorDescription
	FROM #EmploymentStatusCode a
	CROSS JOIN #EmploymentSeparationReasonCode b
	CROSS JOIN #EmploymentSeparationTypeCode c
	CROSS JOIN #TitleITargetedAssistanceStaffFundedCode d
	CROSS JOIN #MEPPersonnelIndicatorCode e
	CROSS JOIN #SalaryForTeachingAssignmentOnlyIndicatorCode f
	LEFT JOIN [RDS].[DimK12EmploymentStatuses] main
		ON a.EmploymentStatusCode = main.EmploymentStatusCode
		AND b.EmploymentSeparationReasonCode = main.EmploymentSeparationReasonCode
		AND c.EmploymentSeparationTypeCode = main.EmploymentSeparationTypeCode
		AND d.TitleITargetedAssistanceStaffFundedCode = main.TitleITargetedAssistanceStaffFundedCode
		AND e.MEPPersonnelIndicatorCode = main.MEPPersonnelIndicatorCode
		AND f.SalaryForTeachingAssignmentOnlyIndicatorCode = main.SalaryForTeachingAssignmentOnlyIndicatorCode
	WHERE main.DimK12EmploymentStatusId IS NULL

	-- Drop temp tables
	DROP TABLE #EmploymentStatusCode
	DROP TABLE #EmploymentSeparationReasonCode
	DROP TABLE #EmploymentSeparationTypeCode
	DROP TABLE #TitleITargetedAssistanceStaffFundedCode
	DROP TABLE #MEPPersonnelIndicatorCode
	DROP TABLE #SalaryForTeachingAssignmentOnlyIndicatorCode


	PRINT 'Populate DimK12StaffAssignmentStatuses'
	------------------------------------------------------------------------------
	-- Populate DimK12StaffAssignmentStatuses --
	------------------------------------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12StaffAssignmentStatuses d WHERE d.DimK12StaffAssignmentStatusId = -1) BEGIN
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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
	FROM [CEDS].CedsOptionSetMapping
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


	PRINT 'Populate DimK12CourseSectionStatuses'
------------------------------------------------------------------------------
-- Populate DimK12CourseSectionStatuses --
------------------------------------------------------------------------------

IF NOT EXISTS (SELECT 1 FROM RDS.DimK12CourseSectionStatuses d WHERE d.DimK12CourseSectionStatusId = -1) BEGIN
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
					, VirtualIndicatorCode
					, VirtualIndicatorDescription
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
FROM [CEDS].CedsOptionSetMapping
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
FROM [CEDS].CedsOptionSetMapping
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
FROM [CEDS].CedsOptionSetMapping
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
FROM [CEDS].CedsOptionSetMapping
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
FROM [CEDS].CedsOptionSetMapping
WHERE CedsElementTechnicalName = 'ReceivingLocationOfInstruction'
ORDER BY CedsOptionSetCode

-- Create temp tables for all elements
IF OBJECT_ID('tempdb..#VirtualIndicator2') IS NOT NULL
	DROP TABLE #VirtualIndicator2

CREATE TABLE #VirtualIndicator2 (VirtualIndicatorCode VARCHAR(50), VirtualIndicatorDescription VARCHAR(200))

INSERT INTO #VirtualIndicator2 VALUES ('MISSING', 'MISSING')
INSERT INTO #VirtualIndicator2
SELECT 
		CedsOptionSetCode
	, CedsOptionSetDescription
FROM [CEDS].CedsOptionSetMapping
WHERE CedsElementTechnicalName = 'VirtualIndicator'
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
	, [VirtualIndicatorCode]
	, [VirtualIndicatorDescription]
)
SELECT 
	a.BlendedLearningModelTypeCode
	, a.BlendedLearningModelTypeDescription
	, b.CourseInteractionModeCode
	, b.CourseInteractionModeDescription
	, c.CourseSectionAssessmentReportingMethodCode
	, c.CourseSectionAssessmentReportingMethodDescription
	, d.CourseSectionInstructionalDeliveryModeCode
	, d.CourseSectionInstructionalDeliveryModeDescription
	, e.ReceivingLocationOfInstructionCode
	, e.ReceivingLocationOfInstructionDescription
	, f.VirtualIndicatorCode
	, f.VirtualIndicatorDescription
FROM #BlendedLearningModelType a
CROSS JOIN #CourseInteractionMode b
CROSS JOIN #CourseSectionAssessmentReportingMethod c
CROSS JOIN #CourseSectionInstructionalDeliveryMode d
CROSS JOIN #ReceivingLocationOfInstruction e
CROSS JOIN #VirtualIndicator2 f
LEFT JOIN [RDS].[DimK12CourseSectionStatuses] main
	ON a.BlendedLearningModelTypeCode = main.BlendedLearningModelTypeCode
	AND b.CourseInteractionModeCode = main.CourseInteractionModeCode
	AND c.CourseSectionAssessmentReportingMethodCode = main.CourseSectionAssessmentReportingMethodCode
	AND d.CourseSectionInstructionalDeliveryModeCode = main.CourseSectionInstructionalDeliveryModeCode
	AND e.ReceivingLocationOfInstructionCode = main.ReceivingLocationOfInstructionCode
	AND f.VirtualIndicatorCode = main.VirtualIndicatorCode
WHERE main.DimK12CourseSectionStatusId IS NULL

-- Drop temp tables
DROP TABLE #BlendedLearningModelType
DROP TABLE #CourseInteractionMode
DROP TABLE #CourseSectionAssessmentReportingMethod
DROP TABLE #CourseSectionInstructionalDeliveryMode
DROP TABLE #ReceivingLocationOfInstruction
DROP TABLE #VirtualIndicator2


	PRINT 'Populate DimScedCodes'
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

	DROP TABLE #ScedCodes

PRINT 'Populate DimRuralStatuses'
------------------------------------------------
-- Populate DimRuralStatuses
------------------------------------------------

IF NOT EXISTS (SELECT 1 FROM RDS.DimRuralStatuses d WHERE d.DimRuralStatusId = -1) BEGIN
    SET IDENTITY_INSERT RDS.DimRuralStatuses ON

    INSERT INTO [RDS].[DimRuralStatuses]
       ([DimRuralStatusId]
       ,[ERSRuralUrbanContinuumCodeCode]
       ,[ERSRuralUrbanContinuumCodeDescription]
       ,[RuralResidencyStatusCode]
       ,[RuralResidencyStatusDescription])
    VALUES (
          -1
        , 'MISSING'
        , 'MISSING'
        , 'MISSING'
        , 'MISSING'
        )

    SET IDENTITY_INSERT RDS.DimRuralStatuses OFF
END

CREATE TABLE #ERSRuralUrbanContinuumCode (ERSRuralUrbanContinuumCodeCode NVARCHAR(50), ERSRuralUrbanContinuumCodeDescription NVARCHAR(200))

INSERT INTO #ERSRuralUrbanContinuumCode VALUES ('MISSING', 'MISSING')
INSERT INTO #ERSRuralUrbanContinuumCode 
SELECT 
      CedsOptionSetCode
    , CedsOptionSetDescription
FROM [CEDS].CedsOptionSetMapping
WHERE CedsElementTechnicalName = 'ERSRuralUrbanContinuumCode'

CREATE TABLE #RuralResidencyStatusCode (RuralResidencyStatusCode NVARCHAR(50), RuralResidencyStatusDescription NVARCHAR(200))

INSERT INTO #RuralResidencyStatusCode VALUES ('MISSING', 'MISSING')
INSERT INTO #RuralResidencyStatusCode 
SELECT 
      CedsOptionSetCode
    , CedsOptionSetDescription
FROM [CEDS].CedsOptionSetMapping
WHERE CedsElementTechnicalName = 'RuralResidencyStatus'

INSERT INTO [RDS].[DimRuralStatuses]
    ([ERSRuralUrbanContinuumCodeCode]
    ,[ERSRuralUrbanContinuumCodeDescription]
    ,[RuralResidencyStatusCode]
    ,[RuralResidencyStatusDescription])
SELECT DISTINCT
     a.[ERSRuralUrbanContinuumCodeCode]
    ,a.[ERSRuralUrbanContinuumCodeDescription]
    ,b.[RuralResidencyStatusCode]
    ,b.[RuralResidencyStatusDescription]
FROM #ERSRuralUrbanContinuumCode a
CROSS JOIN #RuralResidencyStatusCode b
LEFT JOIN RDS.DimRuralStatuses main
    ON a.ERSRuralUrbanContinuumCodeCode = main.ERSRuralUrbanContinuumCodeCode
    AND b.RuralResidencyStatusCode = main.RuralResidencyStatusCode
WHERE main.DimRuralStatusId IS NULL

DROP TABLE #ERSRuralUrbanContinuumCode
DROP TABLE #RuralResidencyStatusCode

	PRINT 'Populate DimCalendarSessionIndicators'
	-------------------------------------------------------
	-- Populate DimCalendarSessionIndicators--
	-------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimCalendarSessionIndicators d WHERE d.DimCalendarSessionIndicatorId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimCalendarSessionIndicators ON

			INSERT INTO rds.DimCalendarSessionIndicators(
						  DimCalendarSessionIndicatorId
						 ,SessionTypeCode
						 ,SessionTypeDescription
						 ,SessionMarkingTermIndicatorCode
					     ,SessionMarkingTermIndicatorDescription
						 ,SessionSchedulingTermIndicatorCode
						 ,SessionSchedulingTermIndicatorDescription
						 ,SessionAttendanceTermIndicatorCode
						 ,SessionAttendanceTermIndicatorDescription
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

		SET IDENTITY_INSERT rds.DimCalendarSessionIndicators OFF
	END

	IF OBJECT_ID('tempdb..#SessionTypeCode') IS NOT NULL
		DROP TABLE #SessionTypeCode

	CREATE TABLE #SessionTypeCode (SessionTypeCode VARCHAR(50), SessionTypeDescription VARCHAR(200))

	INSERT INTO #SessionTypeCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #SessionTypeCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SessionType'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#SessionMarkingTermIndicatorCode') IS NOT NULL
		DROP TABLE #SessionMarkingTermIndicatorCode

	CREATE TABLE #SessionMarkingTermIndicatorCode (SessionMarkingTermIndicatorCode VARCHAR(50), SessionMarkingTermIndicatorDescription VARCHAR(200))

	INSERT INTO #SessionMarkingTermIndicatorCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #SessionMarkingTermIndicatorCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SessionMarkingTermIndicator'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#SessionSchedulingTermIndicatorCode') IS NOT NULL
		DROP TABLE #SessionSchedulingTermIndicatorCode

	CREATE TABLE #SessionSchedulingTermIndicatorCode (SessionSchedulingTermIndicatorCode VARCHAR(50), SessionSchedulingTermIndicatorDescription VARCHAR(200))

	INSERT INTO #SessionSchedulingTermIndicatorCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #SessionSchedulingTermIndicatorCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SessionSchedulingTermIndicator'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#SessionAttendanceTermIndicatorCode') IS NOT NULL
		DROP TABLE #SessionAttendanceTermIndicatorCode

	CREATE TABLE #SessionAttendanceTermIndicatorCode (SessionAttendanceTermIndicatorCode VARCHAR(50), SessionAttendanceTermIndicatorDescription VARCHAR(200))

	INSERT INTO #SessionAttendanceTermIndicatorCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #SessionAttendanceTermIndicatorCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SessionAttendanceTermIndicator'
	ORDER BY CedsOptionSetCode
	

	INSERT INTO rds.DimCalendarSessionIndicators(
			 SessionTypeCode
			,SessionTypeDescription
			,SessionMarkingTermIndicatorCode
			,SessionMarkingTermIndicatorDescription
			,SessionSchedulingTermIndicatorCode
			,SessionSchedulingTermIndicatorDescription
			,SessionAttendanceTermIndicatorCode
			,SessionAttendanceTermIndicatorDescription
			)
	SELECT 
			stc.SessionTypeCode
			,stc.SessionTypeDescription
			,smtc.SessionMarkingTermIndicatorCode
			,smtc.SessionMarkingTermIndicatorDescription
			,sstc.SessionSchedulingTermIndicatorCode
			,sstc.SessionSchedulingTermIndicatorDescription
			,satc.SessionAttendanceTermIndicatorCode
			,satc.SessionAttendanceTermIndicatorDescription
	FROM #SessionTypeCode stc
	CROSS JOIN #SessionMarkingTermIndicatorCode smtc
	CROSS JOIN #SessionSchedulingTermIndicatorCode sstc
	CROSS JOIN #SessionAttendanceTermIndicatorCode satc
	LEFT JOIN RDS.DimCalendarSessionIndicators dcs
		ON	stc.SessionTypeCode = dcs.SessionTypeCode								
		AND smtc.SessionMarkingTermIndicatorCode = dcs.SessionMarkingTermIndicatorCode			
		AND sstc.SessionSchedulingTermIndicatorCode = dcs.SessionSchedulingTermIndicatorCode
		AND satc.SessionAttendanceTermIndicatorCode = dcs.SessionAttendanceTermIndicatorCode
	WHERE dcs.DimCalendarSessionIndicatorId IS NULL

	DROP TABLE #SessionAttendanceTermIndicatorCode
	DROP TABLE #SessionMarkingTermIndicatorCode
	DROP TABLE #SessionSchedulingTermIndicatorCode
	DROP TABLE #SessionTypeCode

	PRINT 'Populate DimCalendarEventIndicators'
	-----------------------------------------------------
	-- Populate DimCalendarEventIndicators--
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimCalendarEventIndicators d WHERE d.DimCalendarEventIndicatorId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimCalendarEventIndicators ON

		INSERT INTO [RDS].[DimCalendarEventIndicators]
           ([DimCalendarEventIndicatorId]
           ,[CalendarEventTypeCode]
           ,[CalendarEventTypeDescription]
		   )
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimCalendarEventIndicators OFF

	END


		CREATE TABLE #CalendarEventTypeCode (CalendarEventTypeCode VARCHAR(50), CalendarEventTypeDescription VARCHAR(200))

		INSERT INTO #CalendarEventTypeCode VALUES ('MISSING', 'MISSING')
		INSERT INTO #CalendarEventTypeCode 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM [CEDS].CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'CalendarEventType'


		INSERT INTO [RDS].[DimCalendarEventIndicators]
           ([CalendarEventTypeCode]
           ,[CalendarEventTypeDescription]
		   )
		SELECT DISTINCT
			  h.CalendarEventTypeCode
			, h.CalendarEventTypeDescription
		FROM #CalendarEventTypeCode h
		LEFT JOIN RDS.DimCalendarEventIndicators main
			ON  h.CalendarEventTypeCode = main.CalendarEventTypeCode
		WHERE main.DimCalendarEventIndicatorId IS NULL

	DROP TABLE #CalendarEventTypeCode

	PRINT 'Populate DimTimes'
	------------------------------------------------
	-- Populate DimTimes					    ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimTimes d WHERE d.DimTimeId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimTimes ON

		INSERT INTO RDS.DimTimes (DimTimeId, TimeTime, TimeHour, TimeMinute)
			VALUES (-1, NULL, -1, -1)

		SET IDENTITY_INSERT RDS.DimTimes OFF
	END

	DECLARE @starttime TIME = '00:00:00'

	WHILE @starttime < '23:59:00'
	BEGIN
		INSERT INTO RDS.DimTimes(
				TimeTime
			  ,TimeHour
			  ,TimeMinute)
		SELECT 
			  @starttime
			  ,NULL
			  ,NULL
		WHERE NOT EXISTS (SELECT 1 FROM RDS.DimTimes WHERE TimeTime = @starttime)
	
		SET @starttime = DATEADD(mi,1,@starttime)
	  END

		INSERT INTO RDS.DimTimes (TimeTime, TimeHour, TimeMinute)
			VALUES ('23:59', NULL, NULL)

		UPDATE RDS.DimTimes
		SET TimeHour = CONVERT(INT, LEFT(REPLACE(CONVERT(VARCHAR(8), TimeTime), ':', ''), 2))
		WHERE DimTimeId <> '-1'

		UPDATE RDS.DimTimes
		SET TimeMinute = CONVERT(INT, SUBSTRING(REPLACE(CONVERT(VARCHAR(8), TimeTime), ':', ''), 3, 2))
		WHERE DimTimeId <> '-1'

		UPDATE RDS.DimTimes
		SET TimeTime = '00:00:00'
		WHERE DimTimeId = '-1'

	PRINT 'Populate DimContactIndicators'
	-------------------------------------------------------
	-- Populate DimContactIndicators --
	-------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimContactIndicators d WHERE d.DimContactIndicatorId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimContactIndicators ON

			INSERT INTO rds.DimContactIndicators (
						  DimContactIndicatorId
						, PrimaryContactIndicatorCode
						, PrimaryContactIndicatorDescription
						, EmergencyContactIndicatorCode
						, EmergencyContactIndicatorDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')
	SET IDENTITY_INSERT rds.DimContactIndicators OFF
	END

	IF OBJECT_ID('tempdb..#PrimaryContactIndicatorCode') IS NOT NULL
		DROP TABLE #PrimaryContactIndicatorCode

	CREATE TABLE #PrimaryContactIndicatorCode (PrimaryContactIndicatorCode VARCHAR(50), PrimaryContactIndicatorDescription VARCHAR(200))

	INSERT INTO #PrimaryContactIndicatorCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #PrimaryContactIndicatorCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PrimaryContactIndicator'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#EmergencyContactIndicatorCode') IS NOT NULL
		DROP TABLE #EmergencyContactIndicatorCode

	CREATE TABLE #EmergencyContactIndicatorCode (EmergencyContactIndicatorCode VARCHAR(50), EmergencyContactIndicatorDescription VARCHAR(200))

	INSERT INTO #EmergencyContactIndicatorCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #EmergencyContactIndicatorCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EmergencyContactIndicator'
	ORDER BY CedsOptionSetCode	

	INSERT INTO rds.DimContactIndicators(
			 PrimaryContactIndicatorCode
			,PrimaryContactIndicatorDescription
			,EmergencyContactIndicatorCode
			,EmergencyContactIndicatorDescription
			)
	SELECT 
			a.PrimaryContactIndicatorCode
			,a.PrimaryContactIndicatorDescription
			,b.EmergencyContactIndicatorCode
			,b.EmergencyContactIndicatorDescription
	FROM #PrimaryContactIndicatorCode a
	CROSS JOIN #EmergencyContactIndicatorCode b
	LEFT JOIN RDS.DimContactIndicators main
		ON	a.PrimaryContactIndicatorCode = main.PrimaryContactIndicatorCode								
		AND b.EmergencyContactIndicatorCode = main.EmergencyContactIndicatorCode			
	WHERE main.DimContactIndicatorId IS NULL

	DROP TABLE #PrimaryContactIndicatorCode
	DROP TABLE #EmergencyContactIndicatorCode

	PRINT 'Populate DimParentOrGuardianIndicators'
	----------------------------------------------------------
	-- Populate DimParentOrGuardianIndicators --
	----------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimParentOrGuardianIndicators d WHERE d.DimParentOrGuardianIndicatorId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimParentOrGuardianIndicators ON

			INSERT INTO rds.DimParentOrGuardianIndicators (
						  DimParentOrGuardianIndicatorId
						, CustodialParentOrGuardianIndicatorCode
						, CustodialParentOrGuardianIndicatorDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING')
	SET IDENTITY_INSERT rds.DimParentOrGuardianIndicators OFF
	END

	IF OBJECT_ID('tempdb..#CustodialParentOrGuardianIndicatorCode') IS NOT NULL
		DROP TABLE #CustodialParentOrGuardianIndicatorCode

	CREATE TABLE #CustodialParentOrGuardianIndicatorCode (CustodialParentOrGuardianIndicatorCode VARCHAR(50), CustodialParentOrGuardianIndicatorDescription VARCHAR(200))

	INSERT INTO #CustodialParentOrGuardianIndicatorCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #CustodialParentOrGuardianIndicatorCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CustodialParentOrGuardianIndicator'
	ORDER BY CedsOptionSetCode

	INSERT INTO rds.DimParentOrGuardianIndicators(
			 CustodialParentOrGuardianIndicatorCode
			,CustodialParentOrGuardianIndicatorDescription
			)
	SELECT 
			a.CustodialParentOrGuardianIndicatorCode
			,a.CustodialParentOrGuardianIndicatorDescription
	FROM #CustodialParentOrGuardianIndicatorCode a
	LEFT JOIN RDS.DimParentOrGuardianIndicators main
		ON	a.CustodialParentOrGuardianIndicatorCode = main.CustodialParentOrGuardianIndicatorCode								
	WHERE main.DimParentOrGuardianIndicatorId IS NULL

	DROP TABLE #CustodialParentOrGuardianIndicatorCode


	PRINT 'Populate DimPersonRelationships'
	----------------------------------------------------------
	-- Populate DimPersonRelationships --
	----------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimPersonRelationships d WHERE d.DimPersonRelationshipId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimPersonRelationships ON

			INSERT INTO rds.DimPersonRelationships (
						  DimPersonRelationshipId
						,PersonRelationshipTypeCode
						,PersonRelationshipTypeDescription
						,LivesWithIndicatorCode
						,LivesWithIndicatorCodeDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')
	SET IDENTITY_INSERT rds.DimPersonRelationships OFF
	END

	IF OBJECT_ID('tempdb..#PersonRelationshipTypeCode') IS NOT NULL
		DROP TABLE #PersonRelationshipTypeCode

	CREATE TABLE #PersonRelationshipTypeCode (PersonRelationshipTypeCode VARCHAR(50), PersonRelationshipTypeDescription VARCHAR(200))

	INSERT INTO #PersonRelationshipTypeCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #PersonRelationshipTypeCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PersonRelationshipType'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#LivesWithIndicatorCode') IS NOT NULL
		DROP TABLE #LivesWithIndicatorCode

	CREATE TABLE #LivesWithIndicatorCode (LivesWithIndicatorCode VARCHAR(50), LivesWithIndicatorDescription VARCHAR(200))

	INSERT INTO #LivesWithIndicatorCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #LivesWithIndicatorCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PersonRelationshipToLearnerLivesWithIndicator'
	ORDER BY CedsOptionSetCode
	----Version 13 - need to change the above from "PersonRelationshipToLearnerLivesWithIndicator" to "LivesWithIndicator"

	INSERT INTO rds.DimPersonRelationships(
			 PersonRelationshipTypeCode
			,PersonRelationshipTypeDescription
			,LivesWithIndicatorCode
			,LivesWithIndicatorCodeDescription
			)
	SELECT 
			a.PersonRelationshipTypeCode
			,a.PersonRelationshipTypeDescription
			,b.LivesWithIndicatorCode
			,b.LivesWithIndicatorDescription
	FROM #PersonRelationshipTypeCode a
	CROSS JOIN #LivesWithIndicatorCode b
	LEFT JOIN RDS.DimPersonRelationships main
		ON	a.PersonRelationshipTypeCode = main.PersonRelationshipTypeCode								
		AND b.LivesWithIndicatorCode = main.LivesWithIndicatorCode			
	WHERE main.DimPersonRelationshipId IS NULL

	DROP TABLE #PersonRelationshipTypeCode
	DROP TABLE #LivesWithIndicatorCode

	PRINT 'Populate DimK12CourseSectionEnrollmentStatuses'
	----------------------------------------------------------------------
	-- Populate DimK12CourseSectionEnrollmentStatuses --
	----------------------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12CourseSectionEnrollmentStatuses d WHERE d.DimK12CourseSectionEnrollmentStatusId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimK12CourseSectionEnrollmentStatuses ON

			INSERT INTO rds.DimK12CourseSectionEnrollmentStatuses (
						  DimK12CourseSectionEnrollmentStatusId
						,CourseSectionEnrollmentStatusTypeCode
						,CourseSectionEnrollmentStatusTypeDescription
						,CourseSectionEntryTypeCode
						,CourseSectionEntryTypeDescription
						,CourseSectionExitTypeCode
						,CourseSectionExitTypeDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')
	SET IDENTITY_INSERT rds.DimK12CourseSectionEnrollmentStatuses OFF
	END

	IF OBJECT_ID('tempdb..#CourseSectionEnrollmentStatusTypeCode') IS NOT NULL
		DROP TABLE #CourseSectionEnrollmentStatusTypeCode

	CREATE TABLE #CourseSectionEnrollmentStatusTypeCode (CourseSectionEnrollmentStatusTypeCode VARCHAR(50), CourseSectionEnrollmentStatusTypeDescription VARCHAR(200))

	INSERT INTO #CourseSectionEnrollmentStatusTypeCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #CourseSectionEnrollmentStatusTypeCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CourseSectionEnrollmentStatusType'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#CourseSectionEntryTypeCode') IS NOT NULL
		DROP TABLE #CourseSectionEntryTypeCode

	CREATE TABLE #CourseSectionEntryTypeCode (CourseSectionEntryTypeCode VARCHAR(50), CourseSectionEntryTypeDescription VARCHAR(200))

	INSERT INTO #CourseSectionEntryTypeCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #CourseSectionEntryTypeCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CourseSectionEntryType'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#CourseSectionExitTypeCode') IS NOT NULL
		DROP TABLE #CourseSectionExitTypeCode

	CREATE TABLE #CourseSectionExitTypeCode (CourseSectionExitTypeCode VARCHAR(50), CourseSectionExitTypeDescription VARCHAR(200))

	INSERT INTO #CourseSectionExitTypeCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #CourseSectionExitTypeCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CourseSectionExitType'
	ORDER BY CedsOptionSetCode

	INSERT INTO rds.DimK12CourseSectionEnrollmentStatuses(
			 CourseSectionEnrollmentStatusTypeCode
			,CourseSectionEnrollmentStatusTypeDescription
			,CourseSectionEntryTypeCode
			,CourseSectionEntryTypeDescription
			,CourseSectionExitTypeCode
			,CourseSectionExitTypeDescription
			)
	SELECT 
			a.CourseSectionEnrollmentStatusTypeCode
			,a.CourseSectionEnrollmentStatusTypeDescription
			,b.CourseSectionEntryTypeCode
			,b.CourseSectionEntryTypeDescription
			,c.CourseSectionExitTypeCode
			,c.CourseSectionExitTypeDescription
	FROM #CourseSectionEnrollmentStatusTypeCode a
	CROSS JOIN #CourseSectionEntryTypeCode b
	CROSS JOIN #CourseSectionExitTypeCode c
	LEFT JOIN RDS.DimK12CourseSectionEnrollmentStatuses main
		ON	a.CourseSectionEnrollmentStatusTypeCode = main.CourseSectionEnrollmentStatusTypeCode								
		AND b.CourseSectionEntryTypeCode = main.CourseSectionEntryTypeCode
		AND c.CourseSectionExitTypeCode = main.CourseSectionExitTypeCode
	WHERE main.DimK12CourseSectionEnrollmentStatusId IS NULL

	DROP TABLE #CourseSectionEnrollmentStatusTypeCode
	DROP TABLE #CourseSectionEntryTypeCode
	DROP TABLE #CourseSectionExitTypeCode

	PRINT 'Populate DimWorkBasedLearningStatuses'
	-----------------------------------------------------------------
	-- Populate DimWorkBasedLearningStatuses --
	-----------------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimWorkBasedLearningStatuses d WHERE d.DimWorkBasedLearningStatusId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimWorkBasedLearningStatuses ON

			INSERT INTO rds.DimWorkBasedLearningStatuses(
						  DimWorkBasedLearningStatusId
						, WorkBasedLearningOpportunityTypeCode
						, WorkBasedLearningOpportunityTypeDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING')
	SET IDENTITY_INSERT rds.DimWorkBasedLearningStatuses OFF
	END

	IF OBJECT_ID('tempdb..#WorkBasedLearningOpportunityTypeCode') IS NOT NULL
		DROP TABLE #WorkBasedLearningOpportunityTypeCode

	CREATE TABLE #WorkBasedLearningOpportunityTypeCode (WorkBasedLearningOpportunityTypeCode VARCHAR(50), WorkBasedLearningOpportunityTypeDescription VARCHAR(200))

	INSERT INTO #WorkBasedLearningOpportunityTypeCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #WorkBasedLearningOpportunityTypeCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'WorkBasedLearningOpportunityType'
	ORDER BY CedsOptionSetCode

	INSERT INTO rds.DimWorkBasedLearningStatuses(
			 WorkBasedLearningOpportunityTypeCode
			,WorkBasedLearningOpportunityTypeDescription
			)
	SELECT 
			a.WorkBasedLearningOpportunityTypeCode
			,a.WorkBasedLearningOpportunityTypeDescription
	FROM #WorkBasedLearningOpportunityTypeCode a
	LEFT JOIN RDS.DimWorkBasedLearningStatuses main
		ON	a.WorkBasedLearningOpportunityTypeCode = main.WorkBasedLearningOpportunityTypeCode								
	WHERE main.DimWorkBasedLearningStatusId IS NULL

	DROP TABLE #WorkBasedLearningOpportunityTypeCode

	PRINT 'Populate DimGiftedAndTalentedStatuses'
	-----------------------------------------------------------------
	-- Populate DimGiftedAndTalentedStatuses --
	-----------------------------------------------------------------
	
	IF NOT EXISTS (SELECT 1 FROM [RDS].[DimGiftedAndTalentedStatuses] d WHERE d.DimGiftedAndTalentedStatusId = -1) BEGIN
		SET IDENTITY_INSERT [RDS].[DimGiftedAndTalentedStatuses] ON

			INSERT INTO [RDS].[DimGiftedAndTalentedStatuses] (
						  DimGiftedAndTalentedStatusId
						, GiftedAndTalentedIndicatorCode
						, GiftedAndTalentedIndicatorDescription
						, ProgramGiftedEligibilityCriteriaCode
						, ProgramGiftedEligibilityCriteriaDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING')
		SET IDENTITY_INSERT [RDS].[DimGiftedAndTalentedStatuses] OFF
	END

	IF OBJECT_ID('tempdb..#GiftedAndTalentedIndicator') IS NOT NULL
		DROP TABLE #GiftedAndTalentedIndicator

	CREATE TABLE #GiftedAndTalentedIndicator (
		GiftedAndTalentedIndicatorCode NVARCHAR(50),
		GiftedAndTalentedIndicatorDescription NVARCHAR(200)
	)

	INSERT INTO #GiftedAndTalentedIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #GiftedAndTalentedIndicator 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'GiftedAndTalentedIndicator'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#ProgramGiftedEligibilityCriteria') IS NOT NULL
		DROP TABLE #ProgramGiftedEligibilityCriteria

	CREATE TABLE #ProgramGiftedEligibilityCriteria (
		ProgramGiftedEligibilityCriteriaCode NVARCHAR(50),
		ProgramGiftedEligibilityCriteriaDescription NVARCHAR(200)
	)

	INSERT INTO #ProgramGiftedEligibilityCriteria VALUES ('MISSING', 'MISSING')
	INSERT INTO #ProgramGiftedEligibilityCriteria 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ProgramGiftedEligibilityCriteria'
	ORDER BY CedsOptionSetCode

	INSERT INTO [RDS].[DimGiftedAndTalentedStatuses] (
		GiftedAndTalentedIndicatorCode,
		GiftedAndTalentedIndicatorDescription,
		ProgramGiftedEligibilityCriteriaCode,
		ProgramGiftedEligibilityCriteriaDescription
	)
	SELECT 
		a.GiftedAndTalentedIndicatorCode,
		a.GiftedAndTalentedIndicatorDescription,
		b.ProgramGiftedEligibilityCriteriaCode,
		b.ProgramGiftedEligibilityCriteriaDescription
	FROM #GiftedAndTalentedIndicator a
	CROSS JOIN #ProgramGiftedEligibilityCriteria b
	LEFT JOIN [RDS].[DimGiftedAndTalentedStatuses] main
		ON a.GiftedAndTalentedIndicatorCode = main.GiftedAndTalentedIndicatorCode
		AND b.ProgramGiftedEligibilityCriteriaCode = main.ProgramGiftedEligibilityCriteriaCode
	WHERE main.DimGiftedAndTalentedStatusId IS NULL

	DROP TABLE #GiftedAndTalentedIndicator
	DROP TABLE #ProgramGiftedEligibilityCriteria

	PRINT 'Populate DimK12DropoutStatuses'
	-------------------------------------------------
	-- Populate DimK12DropoutStatuses ---
	-------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12DropoutStatuses d WHERE d.DimK12DropoutStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimK12DropoutStatuses ON

		INSERT INTO [RDS].DimK12DropoutStatuses
           ([DimK12DropoutStatusId]
		   ,[StudentDropoutStatusCode]
		   ,[StudentDropoutStatusDescription]
		   ,[DropoutReasonTypeCode]
		   ,[DropoutReasonTypeDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimK12DropoutStatuses OFF
	END

	CREATE TABLE #StudentDropoutStatus (StudentDropoutStatusCode VARCHAR(50), StudentDropoutStatusDescription VARCHAR(200))

	INSERT INTO #StudentDropoutStatus VALUES ('MISSING', 'MISSING')
	INSERT INTO #StudentDropoutStatus 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'StudentDropoutStatus'

	CREATE TABLE #DropoutReasonType (DropoutReasonTypeCode VARCHAR(50), DropoutReasonTypeDescription VARCHAR(200))

	INSERT INTO #DropoutReasonType VALUES ('MISSING', 'MISSING')
	INSERT INTO #DropoutReasonType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'DropoutReasonType'


	INSERT INTO RDS.DimK12DropoutStatuses
		  ([StudentDropoutStatusCode]
		   ,[StudentDropoutStatusDescription]
		   ,[DropoutReasonTypeCode]
		   ,[DropoutReasonTypeDescription])
	SELECT DISTINCT
		  a.StudentDropoutStatusCode
		, a.StudentDropoutStatusDescription
		, b.DropoutReasonTypeCode
		, b.DropoutReasonTypeDescription
	FROM #StudentDropoutStatus a
	CROSS JOIN #DropoutReasonType b
	LEFT JOIN RDS.DimK12DropoutStatuses main
		ON a.StudentDropoutStatusCode = main.StudentDropoutStatusCode
		AND b.DropoutReasonTypeCode = main.DropoutReasonTypeCode
	WHERE main.DimK12DropoutStatusId IS NULL

	DROP TABLE #StudentDropoutStatus
	DROP TABLE #DropoutReasonType


		PRINT 'Populate DimCteOutcomeIndicators'
	----------------------------------------------------
	-- Populate DimCteOutcomeIndicators ---
	----------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimCteOutcomeIndicators d WHERE d.DimCteOutcomeIndicatorId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimCteOutcomeIndicators ON

		INSERT INTO [RDS].DimCteOutcomeIndicators
           ([DimCteOutcomeIndicatorId]
		   ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode]
		   ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription]
		   ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode]
		   ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode]
		   ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription]
		   ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode]
		   ,[PerkinsPostProgramPlacementIndicatorCode]
		   ,[PerkinsPostProgramPlacementIndicatorDescription])
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

		SET IDENTITY_INSERT RDS.DimCteOutcomeIndicators OFF
	END

	CREATE TABLE #EdFactsAcademicOrCareerAndTechnicalOutcomeType (EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode VARCHAR(50), EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription VARCHAR(200), EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode VARCHAR(50))

	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeType VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EdFactsAcademicOrCareerAndTechnicalOutcomeType'

	CREATE TABLE #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType (EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode VARCHAR(50), EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription VARCHAR(200), EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode VARCHAR(50))

	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EdFactsAcademicOrCareerAndTechnicalOutcomeExitType'

	CREATE TABLE #PerkinsPostProgramPlacementIndicator (PerkinsPostProgramPlacementIndicatorCode VARCHAR(50), PerkinsPostProgramPlacementIndicatorDescription VARCHAR(200))

	INSERT INTO #PerkinsPostProgramPlacementIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #PerkinsPostProgramPlacementIndicator
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PerkinsPostProgramPlacementIndicator'


	INSERT INTO RDS.DimCteOutcomeIndicators
		   ([EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode]
		   ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription]
		   ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode]
		   ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode]
		   ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription]
		   ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode]
		   ,[PerkinsPostProgramPlacementIndicatorCode]
		   ,[PerkinsPostProgramPlacementIndicatorDescription])
	SELECT DISTINCT
		  a.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode
		, a.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription
		, a.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode
		, b.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode
		, b.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription
		, b.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode
		, c.PerkinsPostProgramPlacementIndicatorCode
		, c.PerkinsPostProgramPlacementIndicatorDescription
	FROM #EdFactsAcademicOrCareerAndTechnicalOutcomeType a
	CROSS JOIN #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType b
	CROSS JOIN #PerkinsPostProgramPlacementIndicator c
	LEFT JOIN RDS.DimCteOutcomeIndicators main
		ON a.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode = main.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode
		AND b.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode = main.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode
		AND c.PerkinsPostProgramPlacementIndicatorCode = main.PerkinsPostProgramPlacementIndicatorCode
	WHERE main.DimCteOutcomeIndicatorId IS NULL

	DROP TABLE #EdFactsAcademicOrCareerAndTechnicalOutcomeType
	DROP TABLE #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType
	DROP TABLE #PerkinsPostProgramPlacementIndicator

	PRINT 'Populate DimK12RetentionStatuses'
	---------------------------------------------------
	-- Populate DimK12RetentionStatuses ---
	---------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12RetentionStatuses d WHERE d.DimK12RetentionStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimK12RetentionStatuses ON

		INSERT INTO [RDS].DimK12RetentionStatuses
           ([DimK12RetentionStatusId]
		   ,[RetentionExemptionReasonCode]
		   ,[RetentionExemptionReasonDescription]
		   ,[EndOfTermStatusCode]
		   ,[EndOfTermStatusDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimK12RetentionStatuses OFF
	END


	CREATE TABLE #RetentionExemptionReason (RetentionExemptionReasonCode VARCHAR(50), RetentionExemptionReasonDescription VARCHAR(200))

	INSERT INTO #RetentionExemptionReason VALUES ('MISSING', 'MISSING')

	INSERT INTO #RetentionExemptionReason 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'RetentionExemptionReason'


	CREATE TABLE #EndOfTermStatusType (EndOfTermStatusCode VARCHAR(50), EndOfTermStatusDescription VARCHAR(200))

	INSERT INTO #EndOfTermStatusType VALUES ('MISSING', 'MISSING')
	INSERT INTO #EndOfTermStatusType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EndOfTermStatus'


	INSERT INTO RDS.DimK12RetentionStatuses
		  ([RetentionExemptionReasonCode]
		   ,[RetentionExemptionReasonDescription]
		   ,[EndOfTermStatusCode]
		   ,[EndOfTermStatusDescription])
	SELECT DISTINCT
		  a.RetentionExemptionReasonCode
		, a.RetentionExemptionReasonDescription
		, b.EndOfTermStatusCode
		, b.EndOfTermStatusDescription
	FROM #RetentionExemptionReason a
	CROSS JOIN #EndOfTermStatusType b
	LEFT JOIN RDS.DimK12RetentionStatuses main
		ON a.RetentionExemptionReasonCode = main.RetentionExemptionReasonCode
		AND b.EndOfTermStatusCode = main.EndOfTermStatusCode
	WHERE main.DimK12RetentionStatusId IS NULL

	DROP TABLE #RetentionExemptionReason
	DROP TABLE #EndOfTermStatusType

	PRINT 'Populate DimStaffCompensationTypes'
    -------------------------------------------------------
	-- Populate DimStaffCompensationTypes ---
	-------------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimStaffCompensationTypes d WHERE d.DimStaffCompensationTypeId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimStaffCompensationTypes ON

		INSERT INTO [RDS].DimStaffCompensationTypes
           ([DimStaffCompensationTypeId]
		   ,[StaffCompensationTypeCode]
		   ,[StaffCompensationTypeDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimStaffCompensationTypes OFF
	END


	CREATE TABLE #StaffCompensationType (StaffCompensationTypeCode VARCHAR(50), StaffCompensationTypeDescription VARCHAR(200))

	INSERT INTO #StaffCompensationType VALUES ('MISSING', 'MISSING')

	----Uncomment in when Version 14 is released and update CEDS-Elements Database to V14---

	--INSERT INTO #StaffCompensationType 
	--SELECT 
	--	  CedsOptionSetCode
	--	, CedsOptionSetDescription
	--FROM [CEDS].CedsOptionSetMapping
	--WHERE CedsElementTechnicalName = 'StaffCompensationType'

	----Remove this code related to RetentionExemptionReason when V14 is released

	INSERT INTO #StaffCompensationType 
	VALUES
		('BaseSalary', 'Base Salary')
		,('HealthBenefits', 'Health Benefits')
		,('RetirementBenefits', 'Retirement Benefits')
		,('OtherBenefits', 'Other Benefits')
		,('TotalBenefits', 'Total Benefits')
		,('TotalSalary', 'Total Salary')
		,('Longevity', 'Longevity')
		,('AnnualSupplement', 'Annual Supplement')
		,('9999', 'Other')

	INSERT INTO RDS.DimStaffCompensationTypes
		  ([StaffCompensationTypeCode]
		   ,[StaffCompensationTypeDescription])
	SELECT DISTINCT
		  a.StaffCompensationTypeCode
		, a.StaffCompensationTypeDescription
	FROM #StaffCompensationType a
	LEFT JOIN RDS.DimStaffCompensationTypes main
		ON a.StaffCompensationTypeCode = main.StaffCompensationTypeCode
	WHERE main.DimStaffCompensationTypeId IS NULL

	DROP TABLE #StaffCompensationType

	PRINT 'Populate DimEmploymentRecordSources'
	----------------------------------------------------------
	-- Populate DimEmploymentRecordSources---
	----------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimEmploymentRecordSources d WHERE d.DimEmploymentRecordSourceId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimEmploymentRecordSources ON

			INSERT INTO rds.DimEmploymentRecordSources (
						  DimEmploymentRecordSourceId
						, EmploymentRecordAdministrativeDataSourceCode
						, EmploymentRecordAdministrativeDataSourceDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING')
	SET IDENTITY_INSERT rds.DimEmploymentRecordSources OFF
	END

	IF OBJECT_ID('tempdb..#EmploymentRecordAdministrativeDataSource') IS NOT NULL
		DROP TABLE #EmploymentRecordAdministrativeDataSource

	CREATE TABLE #EmploymentRecordAdministrativeDataSource (EmploymentRecordAdministrativeDataSourceCode VARCHAR(50), EmploymentRecordAdministrativeDataSourceDescription VARCHAR(200))

	INSERT INTO #EmploymentRecordAdministrativeDataSource VALUES ('MISSING', 'MISSING')
	INSERT INTO #EmploymentRecordAdministrativeDataSource 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EmploymentRecordAdministrativeDataSource'
	ORDER BY CedsOptionSetCode

	INSERT INTO rds.DimEmploymentRecordSources(
			 EmploymentRecordAdministrativeDataSourceCode
			,EmploymentRecordAdministrativeDataSourceDescription
			)
	SELECT 
			a.EmploymentRecordAdministrativeDataSourceCode
			,a.EmploymentRecordAdministrativeDataSourceDescription
	FROM #EmploymentRecordAdministrativeDataSource a
	LEFT JOIN RDS.DimEmploymentRecordSources main
		ON	a.EmploymentRecordAdministrativeDataSourceCode = main.EmploymentRecordAdministrativeDataSourceCode								
	WHERE main.DimEmploymentRecordSourceId IS NULL

	DROP TABLE #EmploymentRecordAdministrativeDataSource

	PRINT 'Populate DimEmploymentLocations'
	----------------------------------------------------------
	-- Populate DimEmploymentLocations  --------
	----------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimEmploymentLocations d WHERE d.DimEmploymentLocationId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimEmploymentLocations ON

			INSERT INTO rds.DimEmploymentLocations (
						  DimEmploymentLocationId
						, EmploymentLocationCode
						, EmploymentLocationDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING')
	SET IDENTITY_INSERT rds.DimEmploymentLocations OFF
	END

	IF OBJECT_ID('tempdb..#EmploymentLocation') IS NOT NULL
		DROP TABLE #EmploymentLocation

	CREATE TABLE #EmploymentLocation (EmploymentLocationCode VARCHAR(50), EmploymentLocationDescription VARCHAR(200))

	INSERT INTO #EmploymentLocation VALUES ('MISSING', 'MISSING')
	INSERT INTO #EmploymentLocation 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EmploymentLocation'
	ORDER BY CedsOptionSetCode

	INSERT INTO rds.DimEmploymentLocations(
			 EmploymentLocationCode
			,EmploymentLocationDescription
			)
	SELECT 
			a.EmploymentLocationCode
			,a.EmploymentLocationDescription
	FROM #EmploymentLocation a
	LEFT JOIN RDS.DimEmploymentLocations main
		ON	a.EmploymentLocationCode = main.EmploymentLocationCode								
	WHERE main.DimEmploymentLocationId IS NULL

	DROP TABLE #EmploymentLocation


	PRINT 'Populate DimNaicsCodes'
	---------------------------------------------------------------
	-- Populate DimNaicsCodes  ---
	----------------------------------------------------------------

	--All of the NAICS codes relate to each other, to avoid a cross join, the values are directly inserted instead of querying from the elements table.

	IF NOT EXISTS (SELECT 1 FROM RDS.DimNaicsCodes d WHERE d.DimNaicsCodeId = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimNaicsCodes ON

		INSERT INTO [RDS].[DimNaicsCodes]
				   ([DimNaicsCodeId]
				   ,[NaicsSectorCode]
				   ,[NaicsSectorDescription]
				   ,[NaicsSubsectorCode]
				   ,[NaicsSubsectorDescription]
				   ,[NaicsIndustryGroupCode]
				   ,[NaicsIndustryGroupDescription]
				   ,[NaicsIndustryCode]
				   ,[NaicsIndustryDescription]
				   ,[NaicsNationalIndustryCode]
				   ,[NaicsNationalIndustryDescription]
				   ,[NaicsVersion])
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
				)

		SET IDENTITY_INSERT RDS.DimNaicsCodes OFF

	END

		INSERT INTO [RDS].[DimNaicsCodes]
				   ([NaicsSectorCode]
				   ,[NaicsSectorDescription]
				   ,[NaicsSubsectorCode]
				   ,[NaicsSubsectorDescription]
				   ,[NaicsIndustryGroupCode]
				   ,[NaicsIndustryGroupDescription]
				   ,[NaicsIndustryCode]
				   ,[NaicsIndustryDescription]
				   ,[NaicsNationalIndustryCode]
				   ,[NaicsNationalIndustryDescription]
				   ,[NaicsVersion])

VALUES
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1111', 	'Oilseed and Grain Farming', 	'11111', 	'Soybean Farming', 	'111110', 	'Soybean Farming', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1111', 	'Oilseed and Grain Farming', 	'11112', 	'Oilseed (except Soybean) Farming', 	'111120', 	'Oilseed (except Soybean) Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1111', 	'Oilseed and Grain Farming', 	'11113', 	'Dry Pea and Bean Farming', 	'111130', 	'Dry Pea and Bean Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1111', 	'Oilseed and Grain Farming', 	'11114', 	'Wheat Farming', 	'111140', 	'Wheat Farming', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1111', 	'Oilseed and Grain Farming', 	'11115', 	'Corn Farming', 	'111150', 	'Corn Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1111', 	'Oilseed and Grain Farming', 	'11116', 	'Rice Farming', 	'111160', 	'Rice Farming', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1111', 	'Oilseed and Grain Farming', 	'11119', 	'Other Grain Farming', 	'111191', 	'Oilseed and Grain Combination Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1111', 	'Oilseed and Grain Farming', 	'11119', 	'Other Grain Farming', 	'111199', 	'All Other Grain Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1112', 	'Vegetable and Melon Farming', 	'11121', 	'Vegetable and Melon Farming', 	'111211', 	'Potato Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1112', 	'Vegetable and Melon Farming', 	'11121', 	'Vegetable and Melon Farming', 	'111219', 	'Other Vegetable (except Potato) and Melon Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1113', 	'Fruit and Tree Nut Farming', 	'11131', 	'Orange Groves', 	'111310', 	'Orange Groves', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1113', 	'Fruit and Tree Nut Farming', 	'11132', 	'Citrus (except Orange) Groves', 	'111320', 	'Citrus (except Orange) Groves ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1113', 	'Fruit and Tree Nut Farming', 	'11133', 	'Noncitrus Fruit and Tree Nut Farming', 	'111331', 	'Apple Orchards ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1113', 	'Fruit and Tree Nut Farming', 	'11133', 	'Noncitrus Fruit and Tree Nut Farming', 	'111332', 	'Grape Vineyards ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1113', 	'Fruit and Tree Nut Farming', 	'11133', 	'Noncitrus Fruit and Tree Nut Farming', 	'111333', 	'Strawberry Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1113', 	'Fruit and Tree Nut Farming', 	'11133', 	'Noncitrus Fruit and Tree Nut Farming', 	'111334', 	'Berry (except Strawberry) Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1113', 	'Fruit and Tree Nut Farming', 	'11133', 	'Noncitrus Fruit and Tree Nut Farming', 	'111335', 	'Tree Nut Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1113', 	'Fruit and Tree Nut Farming', 	'11133', 	'Noncitrus Fruit and Tree Nut Farming', 	'111336', 	'Fruit and Tree Nut Combination Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1113', 	'Fruit and Tree Nut Farming', 	'11133', 	'Noncitrus Fruit and Tree Nut Farming', 	'111339', 	'Other Noncitrus Fruit Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1114', 	'Greenhouse, Nursery, and Floriculture Production', 	'11141', 	'Food Crops Grown Under Cover', 	'111411', 	'Mushroom Production ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1114', 	'Greenhouse, Nursery, and Floriculture Production', 	'11141', 	'Food Crops Grown Under Cover', 	'111419', 	'Other Food Crops Grown Under Cover ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1114', 	'Greenhouse, Nursery, and Floriculture Production', 	'11142', 	'Nursery and Floriculture Production', 	'111421', 	'Nursery and Tree Production ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1114', 	'Greenhouse, Nursery, and Floriculture Production', 	'11142', 	'Nursery and Floriculture Production', 	'111422', 	'Floriculture Production ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1119', 	'Other Crop Farming', 	'11191', 	'Tobacco Farming', 	'111910', 	'Tobacco Farming', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1119', 	'Other Crop Farming', 	'11192', 	'Cotton Farming', 	'111920', 	'Cotton Farming', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1119', 	'Other Crop Farming', 	'11193', 	'Sugarcane Farming', 	'111930', 	'Sugarcane Farming', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1119', 	'Other Crop Farming', 	'11194', 	'Hay Farming', 	'111940', 	'Hay Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1119', 	'Other Crop Farming', 	'11199', 	'All Other Crop Farming', 	'111991', 	'Sugar Beet Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1119', 	'Other Crop Farming', 	'11199', 	'All Other Crop Farming', 	'111992', 	'Peanut Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'111', 	'Crop Production', 	'1119', 	'Other Crop Farming', 	'11199', 	'All Other Crop Farming', 	'111998', 	'All Other Miscellaneous Crop Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1121', 	'Cattle Ranching and Farming', 	'11211', 	'Beef Cattle Ranching and Farming, including Feedlots', 	'112111', 	'Beef Cattle Ranching and Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1121', 	'Cattle Ranching and Farming', 	'11211', 	'Beef Cattle Ranching and Farming, including Feedlots', 	'112112', 	'Cattle Feedlots ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1121', 	'Cattle Ranching and Farming', 	'11212', 	'Dairy Cattle and Milk Production', 	'112120', 	'Dairy Cattle and Milk Production', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1121', 	'Cattle Ranching and Farming', 	'11213', 	'Dual-Purpose Cattle Ranching and Farming', 	'112130', 	'Dual-Purpose Cattle Ranching and Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1122', 	'Hog and Pig Farming', 	'11221', 	'Hog and Pig Farming', 	'112210', 	'Hog and Pig Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1123', 	'Poultry and Egg Production', 	'11231', 	'Chicken Egg Production', 	'112310', 	'Chicken Egg Production ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1123', 	'Poultry and Egg Production', 	'11232', 	'Broilers and Other Meat Type Chicken Production', 	'112320', 	'Broilers and Other Meat Type Chicken Production ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1123', 	'Poultry and Egg Production', 	'11233', 	'Turkey Production', 	'112330', 	'Turkey Production', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1123', 	'Poultry and Egg Production', 	'11234', 	'Poultry Hatcheries', 	'112340', 	'Poultry Hatcheries', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1123', 	'Poultry and Egg Production', 	'11239', 	'Other Poultry Production', 	'112390', 	'Other Poultry Production ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1124', 	'Sheep and Goat Farming', 	'11241', 	'Sheep Farming', 	'112410', 	'Sheep Farming', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1124', 	'Sheep and Goat Farming', 	'11242', 	'Goat Farming', 	'112420', 	'Goat Farming', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1125', 	'Aquaculture', 	'11251', 	'Aquaculture', 	'112511', 	'Finfish Farming and Fish Hatcheries ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1125', 	'Aquaculture', 	'11251', 	'Aquaculture', 	'112512', 	'Shellfish Farming ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1125', 	'Aquaculture', 	'11251', 	'Aquaculture', 	'112519', 	'Other Aquaculture ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1129', 	'Other Animal Production', 	'11291', 	'Apiculture', 	'112910', 	'Apiculture', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1129', 	'Other Animal Production', 	'11292', 	'Horses and Other Equine Production', 	'112920', 	'Horses and Other Equine Production', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1129', 	'Other Animal Production', 	'11293', 	'Fur-Bearing Animal and Rabbit Production', 	'112930', 	'Fur-Bearing Animal and Rabbit Production', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'112', 	'Animal Production and Aquaculture', 	'1129', 	'Other Animal Production', 	'11299', 	'All Other Animal Production', 	'112990', 	'All Other Animal Production ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'113', 	'Forestry and Logging', 	'1131', 	'Timber Tract Operations', 	'11311', 	'Timber Tract Operations', 	'113110', 	'Timber Tract Operations', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'113', 	'Forestry and Logging', 	'1132', 	'Forest Nurseries and Gathering of Forest Products', 	'11321', 	'Forest Nurseries and Gathering of Forest Products', 	'113210', 	'Forest Nurseries and Gathering of Forest Products ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'113', 	'Forestry and Logging', 	'1133', 	'Logging', 	'11331', 	'Logging', 	'113310', 	'Logging ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'114', 	'Fishing, Hunting and Trapping', 	'1141', 	'Fishing', 	'11411', 	'Fishing', 	'114111', 	'Finfish Fishing ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'114', 	'Fishing, Hunting and Trapping', 	'1141', 	'Fishing', 	'11411', 	'Fishing', 	'114112', 	'Shellfish Fishing ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'114', 	'Fishing, Hunting and Trapping', 	'1141', 	'Fishing', 	'11411', 	'Fishing', 	'114119', 	'Other Marine Fishing ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'114', 	'Fishing, Hunting and Trapping', 	'1142', 	'Hunting and Trapping', 	'11421', 	'Hunting and Trapping', 	'114210', 	'Hunting and Trapping', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'115', 	'Support Activities for Agriculture and Forestry', 	'1151', 	'Support Activities for Crop Production', 	'11511', 	'Support Activities for Crop Production', 	'115111', 	'Cotton Ginning ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'115', 	'Support Activities for Agriculture and Forestry', 	'1151', 	'Support Activities for Crop Production', 	'11511', 	'Support Activities for Crop Production', 	'115112', 	'Soil Preparation, Planting, and Cultivating ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'115', 	'Support Activities for Agriculture and Forestry', 	'1151', 	'Support Activities for Crop Production', 	'11511', 	'Support Activities for Crop Production', 	'115113', 	'Crop Harvesting, Primarily by Machine ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'115', 	'Support Activities for Agriculture and Forestry', 	'1151', 	'Support Activities for Crop Production', 	'11511', 	'Support Activities for Crop Production', 	'115114', 	'Postharvest Crop Activities (except Cotton Ginning) ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'115', 	'Support Activities for Agriculture and Forestry', 	'1151', 	'Support Activities for Crop Production', 	'11511', 	'Support Activities for Crop Production', 	'115115', 	'Farm Labor Contractors and Crew Leaders ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'115', 	'Support Activities for Agriculture and Forestry', 	'1151', 	'Support Activities for Crop Production', 	'11511', 	'Support Activities for Crop Production', 	'115116', 	'Farm Management Services ', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'115', 	'Support Activities for Agriculture and Forestry', 	'1152', 	'Support Activities for Animal Production', 	'11521', 	'Support Activities for Animal Production', 	'115210', 	'Support Activities for Animal Production', 	'2022'),
('11', 	'Agriculture, Forestry, Fishing and Hunting', 	'115', 	'Support Activities for Agriculture and Forestry', 	'1153', 	'Support Activities for Forestry', 	'11531', 	'Support Activities for Forestry', 	'115310', 	'Support Activities for Forestry', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'211', 	'Oil and Gas Extraction', 	'2111', 	'Oil and Gas Extraction', 	'21112', 	'Crude Petroleum Extraction ', 	'211120', 	'Crude Petroleum Extraction ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'211', 	'Oil and Gas Extraction', 	'2111', 	'Oil and Gas Extraction', 	'21113', 	'Natural Gas Extraction ', 	'211130', 	'Natural Gas Extraction ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'212', 	'Mining (except Oil and Gas)', 	'2121', 	'Coal Mining', 	'21211', 	'Coal Mining', 	'212114', 	'Surface Coal Mining ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'212', 	'Mining (except Oil and Gas)', 	'2121', 	'Coal Mining', 	'21211', 	'Coal Mining', 	'212115', 	'Underground Coal Mining ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'212', 	'Mining (except Oil and Gas)', 	'2122', 	'Metal Ore Mining', 	'21221', 	'Iron Ore Mining', 	'212210', 	'Iron Ore Mining', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'212', 	'Mining (except Oil and Gas)', 	'2122', 	'Metal Ore Mining', 	'21222', 	'Gold Ore and Silver Ore Mining', 	'212220', 	'Gold Ore and Silver Ore Mining ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'212', 	'Mining (except Oil and Gas)', 	'2122', 	'Metal Ore Mining', 	'21223', 	'Copper, Nickel, Lead, and Zinc Mining', 	'212230', 	'Copper, Nickel, Lead, and Zinc Mining ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'212', 	'Mining (except Oil and Gas)', 	'2122', 	'Metal Ore Mining', 	'21229', 	'Other Metal Ore Mining', 	'212290', 	'Other Metal Ore Mining ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'212', 	'Mining (except Oil and Gas)', 	'2123', 	'Nonmetallic Mineral Mining and Quarrying', 	'21231', 	'Stone Mining and Quarrying', 	'212311', 	'Dimension Stone Mining and Quarrying ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'212', 	'Mining (except Oil and Gas)', 	'2123', 	'Nonmetallic Mineral Mining and Quarrying', 	'21231', 	'Stone Mining and Quarrying', 	'212312', 	'Crushed and Broken Limestone Mining and Quarrying ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'212', 	'Mining (except Oil and Gas)', 	'2123', 	'Nonmetallic Mineral Mining and Quarrying', 	'21231', 	'Stone Mining and Quarrying', 	'212313', 	'Crushed and Broken Granite Mining and Quarrying ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'212', 	'Mining (except Oil and Gas)', 	'2123', 	'Nonmetallic Mineral Mining and Quarrying', 	'21231', 	'Stone Mining and Quarrying', 	'212319', 	'Other Crushed and Broken Stone Mining and Quarrying ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'212', 	'Mining (except Oil and Gas)', 	'2123', 	'Nonmetallic Mineral Mining and Quarrying', 	'21232', 	'Sand, Gravel, Clay, and Ceramic and Refractory Minerals Mining and Quarrying', 	'212321', 	'Construction Sand and Gravel Mining ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'212', 	'Mining (except Oil and Gas)', 	'2123', 	'Nonmetallic Mineral Mining and Quarrying', 	'21232', 	'Sand, Gravel, Clay, and Ceramic and Refractory Minerals Mining and Quarrying', 	'212322', 	'Industrial Sand Mining ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'212', 	'Mining (except Oil and Gas)', 	'2123', 	'Nonmetallic Mineral Mining and Quarrying', 	'21232', 	'Sand, Gravel, Clay, and Ceramic and Refractory Minerals Mining and Quarrying', 	'212323', 	'Kaolin, Clay, and Ceramic and Refractory Minerals Mining ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'212', 	'Mining (except Oil and Gas)', 	'2123', 	'Nonmetallic Mineral Mining and Quarrying', 	'21239', 	'Other Nonmetallic Mineral Mining and Quarrying', 	'212390', 	'Other Nonmetallic Mineral Mining and Quarrying ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'213', 	'Support Activities for Mining', 	'2131', 	'Support Activities for Mining', 	'21311', 	'Support Activities for Mining', 	'213111', 	'Drilling Oil and Gas Wells', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'213', 	'Support Activities for Mining', 	'2131', 	'Support Activities for Mining', 	'21311', 	'Support Activities for Mining', 	'213112', 	'Support Activities for Oil and Gas Operations ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'213', 	'Support Activities for Mining', 	'2131', 	'Support Activities for Mining', 	'21311', 	'Support Activities for Mining', 	'213113', 	'Support Activities for Coal Mining ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'213', 	'Support Activities for Mining', 	'2131', 	'Support Activities for Mining', 	'21311', 	'Support Activities for Mining', 	'213114', 	'Support Activities for Metal Mining ', 	'2022'),
('21', 	'Mining, Quarrying, and Oil and Gas Extraction', 	'213', 	'Support Activities for Mining', 	'2131', 	'Support Activities for Mining', 	'21311', 	'Support Activities for Mining', 	'213115', 	'Support Activities for Nonmetallic Minerals (except Fuels) Mining ', 	'2022'),
('22', 	'Utilities', 	'221', 	'Utilities ', 	'2211', 	'Electric Power Generation, Transmission and Distribution', 	'22111', 	'Electric Power Generation ', 	'221111', 	'Hydroelectric Power Generation ', 	'2022'),
('22', 	'Utilities', 	'221', 	'Utilities ', 	'2211', 	'Electric Power Generation, Transmission and Distribution', 	'22111', 	'Electric Power Generation ', 	'221112', 	'Fossil Fuel Electric Power Generation ', 	'2022'),
('22', 	'Utilities', 	'221', 	'Utilities ', 	'2211', 	'Electric Power Generation, Transmission and Distribution', 	'22111', 	'Electric Power Generation ', 	'221113', 	'Nuclear Electric Power Generation ', 	'2022'),
('22', 	'Utilities', 	'221', 	'Utilities ', 	'2211', 	'Electric Power Generation, Transmission and Distribution', 	'22111', 	'Electric Power Generation ', 	'221114', 	'Solar Electric Power Generation ', 	'2022'),
('22', 	'Utilities', 	'221', 	'Utilities ', 	'2211', 	'Electric Power Generation, Transmission and Distribution', 	'22111', 	'Electric Power Generation ', 	'221115', 	'Wind Electric Power Generation ', 	'2022'),
('22', 	'Utilities', 	'221', 	'Utilities ', 	'2211', 	'Electric Power Generation, Transmission and Distribution', 	'22111', 	'Electric Power Generation ', 	'221116', 	'Geothermal Electric Power Generation ', 	'2022'),
('22', 	'Utilities', 	'221', 	'Utilities ', 	'2211', 	'Electric Power Generation, Transmission and Distribution', 	'22111', 	'Electric Power Generation ', 	'221117', 	'Biomass Electric Power Generation ', 	'2022'),
('22', 	'Utilities', 	'221', 	'Utilities ', 	'2211', 	'Electric Power Generation, Transmission and Distribution', 	'22111', 	'Electric Power Generation ', 	'221118', 	'Other Electric Power Generation ', 	'2022'),
('22', 	'Utilities', 	'221', 	'Utilities ', 	'2211', 	'Electric Power Generation, Transmission and Distribution', 	'22112', 	'Electric Power Transmission, Control, and Distribution ', 	'221121', 	'Electric Bulk Power Transmission and Control ', 	'2022'),
('22', 	'Utilities', 	'221', 	'Utilities ', 	'2211', 	'Electric Power Generation, Transmission and Distribution', 	'22112', 	'Electric Power Transmission, Control, and Distribution ', 	'221122', 	'Electric Power Distribution ', 	'2022'),
('22', 	'Utilities', 	'221', 	'Utilities ', 	'2212', 	'Natural Gas Distribution ', 	'22121', 	'Natural Gas Distribution ', 	'221210', 	'Natural Gas Distribution ', 	'2022'),
('22', 	'Utilities', 	'221', 	'Utilities ', 	'2213', 	'Water, Sewage and Other Systems ', 	'22131', 	'Water Supply and Irrigation Systems ', 	'221310', 	'Water Supply and Irrigation Systems ', 	'2022'),
('22', 	'Utilities', 	'221', 	'Utilities ', 	'2213', 	'Water, Sewage and Other Systems ', 	'22132', 	'Sewage Treatment Facilities ', 	'221320', 	'Sewage Treatment Facilities ', 	'2022'),
('22', 	'Utilities', 	'221', 	'Utilities ', 	'2213', 	'Water, Sewage and Other Systems ', 	'22133', 	'Steam and Air-Conditioning Supply ', 	'221330', 	'Steam and Air-Conditioning Supply ', 	'2022'),
('23', 	'Construction', 	'236', 	'Construction of Buildings', 	'2361', 	'Residential Building Construction', 	'23611', 	'Residential Building Construction', 	'236115', 	'New Single-Family Housing Construction (except For-Sale Builders) ', 	'2022'),
('23', 	'Construction', 	'236', 	'Construction of Buildings', 	'2361', 	'Residential Building Construction', 	'23611', 	'Residential Building Construction', 	'236116', 	'New Multifamily Housing Construction (except For-Sale Builders) ', 	'2022'),
('23', 	'Construction', 	'236', 	'Construction of Buildings', 	'2361', 	'Residential Building Construction', 	'23611', 	'Residential Building Construction', 	'236117', 	'New Housing For-Sale Builders ', 	'2022'),
('23', 	'Construction', 	'236', 	'Construction of Buildings', 	'2361', 	'Residential Building Construction', 	'23611', 	'Residential Building Construction', 	'236118', 	'Residential Remodelers ', 	'2022'),
('23', 	'Construction', 	'236', 	'Construction of Buildings', 	'2362', 	'Nonresidential Building Construction', 	'23621', 	'Industrial Building Construction', 	'236210', 	'Industrial Building Construction ', 	'2022'),
('23', 	'Construction', 	'236', 	'Construction of Buildings', 	'2362', 	'Nonresidential Building Construction', 	'23622', 	'Commercial and Institutional Building Construction', 	'236220', 	'Commercial and Institutional Building Construction ', 	'2022'),
('23', 	'Construction', 	'237', 	'Heavy and Civil Engineering Construction', 	'2371', 	'Utility System Construction', 	'23711', 	'Water and Sewer Line and Related Structures Construction', 	'237110', 	'Water and Sewer Line and Related Structures Construction ', 	'2022'),
('23', 	'Construction', 	'237', 	'Heavy and Civil Engineering Construction', 	'2371', 	'Utility System Construction', 	'23712', 	'Oil and Gas Pipeline and Related Structures Construction', 	'237120', 	'Oil and Gas Pipeline and Related Structures Construction ', 	'2022'),
('23', 	'Construction', 	'237', 	'Heavy and Civil Engineering Construction', 	'2371', 	'Utility System Construction', 	'23713', 	'Power and Communication Line and Related Structures Construction', 	'237130', 	'Power and Communication Line and Related Structures Construction ', 	'2022'),
('23', 	'Construction', 	'237', 	'Heavy and Civil Engineering Construction', 	'2372', 	'Land Subdivision', 	'23721', 	'Land Subdivision', 	'237210', 	'Land Subdivision ', 	'2022'),
('23', 	'Construction', 	'237', 	'Heavy and Civil Engineering Construction', 	'2373', 	'Highway, Street, and Bridge Construction', 	'23731', 	'Highway, Street, and Bridge Construction', 	'237310', 	'Highway, Street, and Bridge Construction ', 	'2022'),
('23', 	'Construction', 	'237', 	'Heavy and Civil Engineering Construction', 	'2379', 	'Other Heavy and Civil Engineering Construction', 	'23799', 	'Other Heavy and Civil Engineering Construction', 	'237990', 	'Other Heavy and Civil Engineering Construction ', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2381', 	'Foundation, Structure, and Building Exterior Contractors', 	'23811', 	'Poured Concrete Foundation and Structure Contractors ', 	'238110', 	'Poured Concrete Foundation and Structure Contractors ', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2381', 	'Foundation, Structure, and Building Exterior Contractors', 	'23812', 	'Structural Steel and Precast Concrete Contractors ', 	'238120', 	'Structural Steel and Precast Concrete Contractors ', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2381', 	'Foundation, Structure, and Building Exterior Contractors', 	'23813', 	'Framing Contractors ', 	'238130', 	'Framing Contractors ', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2381', 	'Foundation, Structure, and Building Exterior Contractors', 	'23814', 	'Masonry Contractors ', 	'238140', 	'Masonry Contractors ', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2381', 	'Foundation, Structure, and Building Exterior Contractors', 	'23815', 	'Glass and Glazing Contractors ', 	'238150', 	'Glass and Glazing Contractors ', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2381', 	'Foundation, Structure, and Building Exterior Contractors', 	'23816', 	'Roofing Contractors ', 	'238160', 	'Roofing Contractors ', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2381', 	'Foundation, Structure, and Building Exterior Contractors', 	'23817', 	'Siding Contractors ', 	'238170', 	'Siding Contractors ', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2381', 	'Foundation, Structure, and Building Exterior Contractors', 	'23819', 	'Other Foundation, Structure, and Building Exterior Contractors ', 	'238190', 	'Other Foundation, Structure, and Building Exterior Contractors ', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2382', 	'Building Equipment Contractors', 	'23821', 	'Electrical Contractors and Other Wiring Installation Contractors', 	'238210', 	'Electrical Contractors and Other Wiring Installation Contractors', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2382', 	'Building Equipment Contractors', 	'23822', 	'Plumbing, Heating, and Air-Conditioning Contractors', 	'238220', 	'Plumbing, Heating, and Air-Conditioning Contractors ', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2382', 	'Building Equipment Contractors', 	'23829', 	'Other Building Equipment Contractors', 	'238290', 	'Other Building Equipment Contractors ', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2383', 	'Building Finishing Contractors', 	'23831', 	'Drywall and Insulation Contractors', 	'238310', 	'Drywall and Insulation Contractors ', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2383', 	'Building Finishing Contractors', 	'23832', 	'Painting and Wall Covering Contractors', 	'238320', 	'Painting and Wall Covering Contractors', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2383', 	'Building Finishing Contractors', 	'23833', 	'Flooring Contractors', 	'238330', 	'Flooring Contractors', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2383', 	'Building Finishing Contractors', 	'23834', 	'Tile and Terrazzo Contractors', 	'238340', 	'Tile and Terrazzo Contractors', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2383', 	'Building Finishing Contractors', 	'23835', 	'Finish Carpentry Contractors', 	'238350', 	'Finish Carpentry Contractors', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2383', 	'Building Finishing Contractors', 	'23839', 	'Other Building Finishing Contractors', 	'238390', 	'Other Building Finishing Contractors', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2389', 	'Other Specialty Trade Contractors', 	'23891', 	'Site Preparation Contractors', 	'238910', 	'Site Preparation Contractors', 	'2022'),
('23', 	'Construction', 	'238', 	'Specialty Trade Contractors', 	'2389', 	'Other Specialty Trade Contractors', 	'23899', 	'All Other Specialty Trade Contractors', 	'238990', 	'All Other Specialty Trade Contractors', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4231', 	'Motor Vehicle and Motor Vehicle Parts and Supplies Merchant Wholesalers ', 	'42311', 	'Automobile and Other Motor Vehicle Merchant Wholesalers ', 	'423110', 	'Automobile and Other Motor Vehicle Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4231', 	'Motor Vehicle and Motor Vehicle Parts and Supplies Merchant Wholesalers ', 	'42312', 	'Motor Vehicle Supplies and New Parts Merchant Wholesalers ', 	'423120', 	'Motor Vehicle Supplies and New Parts Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4231', 	'Motor Vehicle and Motor Vehicle Parts and Supplies Merchant Wholesalers ', 	'42313', 	'Tire and Tube Merchant Wholesalers ', 	'423130', 	'Tire and Tube Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4231', 	'Motor Vehicle and Motor Vehicle Parts and Supplies Merchant Wholesalers ', 	'42314', 	'Motor Vehicle Parts (Used) Merchant Wholesalers ', 	'423140', 	'Motor Vehicle Parts (Used) Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4232', 	'Furniture and Home Furnishing Merchant Wholesalers ', 	'42321', 	'Furniture Merchant Wholesalers ', 	'423210', 	'Furniture Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4232', 	'Furniture and Home Furnishing Merchant Wholesalers ', 	'42322', 	'Home Furnishing Merchant Wholesalers ', 	'423220', 	'Home Furnishing Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4233', 	'Lumber and Other Construction Materials Merchant Wholesalers ', 	'42331', 	'Lumber, Plywood, Millwork, and Wood Panel Merchant Wholesalers ', 	'423310', 	'Lumber, Plywood, Millwork, and Wood Panel Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4233', 	'Lumber and Other Construction Materials Merchant Wholesalers ', 	'42332', 	'Brick, Stone, and Related Construction Material Merchant Wholesalers ', 	'423320', 	'Brick, Stone, and Related Construction Material Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4233', 	'Lumber and Other Construction Materials Merchant Wholesalers ', 	'42333', 	'Roofing, Siding, and Insulation Material Merchant Wholesalers ', 	'423330', 	'Roofing, Siding, and Insulation Material Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4233', 	'Lumber and Other Construction Materials Merchant Wholesalers ', 	'42339', 	'Other Construction Material Merchant Wholesalers ', 	'423390', 	'Other Construction Material Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4234', 	'Professional and Commercial Equipment and Supplies Merchant Wholesalers ', 	'42341', 	'Photographic Equipment and Supplies Merchant Wholesalers ', 	'423410', 	'Photographic Equipment and Supplies Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4234', 	'Professional and Commercial Equipment and Supplies Merchant Wholesalers ', 	'42342', 	'Office Equipment Merchant Wholesalers ', 	'423420', 	'Office Equipment Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4234', 	'Professional and Commercial Equipment and Supplies Merchant Wholesalers ', 	'42343', 	'Computer and Computer Peripheral Equipment and Software Merchant Wholesalers ', 	'423430', 	'Computer and Computer Peripheral Equipment and Software Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4234', 	'Professional and Commercial Equipment and Supplies Merchant Wholesalers ', 	'42344', 	'Other Commercial Equipment Merchant Wholesalers ', 	'423440', 	'Other Commercial Equipment Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4234', 	'Professional and Commercial Equipment and Supplies Merchant Wholesalers ', 	'42345', 	'Medical, Dental, and Hospital Equipment and Supplies Merchant Wholesalers ', 	'423450', 	'Medical, Dental, and Hospital Equipment and Supplies Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4234', 	'Professional and Commercial Equipment and Supplies Merchant Wholesalers ', 	'42346', 	'Ophthalmic Goods Merchant Wholesalers ', 	'423460', 	'Ophthalmic Goods Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4234', 	'Professional and Commercial Equipment and Supplies Merchant Wholesalers ', 	'42349', 	'Other Professional Equipment and Supplies Merchant Wholesalers ', 	'423490', 	'Other Professional Equipment and Supplies Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4235', 	'Metal and Mineral (except Petroleum) Merchant Wholesalers ', 	'42351', 	'Metal Service Centers and Other Metal Merchant Wholesalers ', 	'423510', 	'Metal Service Centers and Other Metal Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4235', 	'Metal and Mineral (except Petroleum) Merchant Wholesalers ', 	'42352', 	'Coal and Other Mineral and Ore Merchant Wholesalers ', 	'423520', 	'Coal and Other Mineral and Ore Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4236', 	'Household Appliances and Electrical and Electronic Goods Merchant Wholesalers ', 	'42361', 	'Electrical Apparatus and Equipment, Wiring Supplies, and Related Equipment Merchant Wholesalers ', 	'423610', 	'Electrical Apparatus and Equipment, Wiring Supplies, and Related Equipment Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4236', 	'Household Appliances and Electrical and Electronic Goods Merchant Wholesalers ', 	'42362', 	'Household Appliances, Electric Housewares, and Consumer Electronics Merchant Wholesalers ', 	'423620', 	'Household Appliances, Electric Housewares, and Consumer Electronics Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4236', 	'Household Appliances and Electrical and Electronic Goods Merchant Wholesalers ', 	'42369', 	'Other Electronic Parts and Equipment Merchant Wholesalers ', 	'423690', 	'Other Electronic Parts and Equipment Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4237', 	'Hardware, and Plumbing and Heating Equipment and Supplies Merchant Wholesalers ', 	'42371', 	'Hardware Merchant Wholesalers ', 	'423710', 	'Hardware Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4237', 	'Hardware, and Plumbing and Heating Equipment and Supplies Merchant Wholesalers ', 	'42372', 	'Plumbing and Heating Equipment and Supplies (Hydronics) Merchant Wholesalers ', 	'423720', 	'Plumbing and Heating Equipment and Supplies (Hydronics) Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4237', 	'Hardware, and Plumbing and Heating Equipment and Supplies Merchant Wholesalers ', 	'42373', 	'Warm Air Heating and Air-Conditioning Equipment and Supplies Merchant Wholesalers ', 	'423730', 	'Warm Air Heating and Air-Conditioning Equipment and Supplies Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4237', 	'Hardware, and Plumbing and Heating Equipment and Supplies Merchant Wholesalers ', 	'42374', 	'Refrigeration Equipment and Supplies Merchant Wholesalers ', 	'423740', 	'Refrigeration Equipment and Supplies Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4238', 	'Machinery, Equipment, and Supplies Merchant Wholesalers ', 	'42381', 	'Construction and Mining (except Oil Well) Machinery and Equipment Merchant Wholesalers ', 	'423810', 	'Construction and Mining (except Oil Well) Machinery and Equipment Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4238', 	'Machinery, Equipment, and Supplies Merchant Wholesalers ', 	'42382', 	'Farm and Garden Machinery and Equipment Merchant Wholesalers ', 	'423820', 	'Farm and Garden Machinery and Equipment Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4238', 	'Machinery, Equipment, and Supplies Merchant Wholesalers ', 	'42383', 	'Industrial Machinery and Equipment Merchant Wholesalers ', 	'423830', 	'Industrial Machinery and Equipment Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4238', 	'Machinery, Equipment, and Supplies Merchant Wholesalers ', 	'42384', 	'Industrial Supplies Merchant Wholesalers ', 	'423840', 	'Industrial Supplies Merchant Wholesalers', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4238', 	'Machinery, Equipment, and Supplies Merchant Wholesalers ', 	'42385', 	'Service Establishment Equipment and Supplies Merchant Wholesalers ', 	'423850', 	'Service Establishment Equipment and Supplies Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4238', 	'Machinery, Equipment, and Supplies Merchant Wholesalers ', 	'42386', 	'Transportation Equipment and Supplies (except Motor Vehicle) Merchant Wholesalers ', 	'423860', 	'Transportation Equipment and Supplies (except Motor Vehicle) Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4239', 	'Miscellaneous Durable Goods Merchant Wholesalers ', 	'42391', 	'Sporting and Recreational Goods and Supplies Merchant Wholesalers', 	'423910', 	'Sporting and Recreational Goods and Supplies Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4239', 	'Miscellaneous Durable Goods Merchant Wholesalers ', 	'42392', 	'Toy and Hobby Goods and Supplies Merchant Wholesalers ', 	'423920', 	'Toy and Hobby Goods and Supplies Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4239', 	'Miscellaneous Durable Goods Merchant Wholesalers ', 	'42393', 	'Recyclable Material Merchant Wholesalers ', 	'423930', 	'Recyclable Material Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4239', 	'Miscellaneous Durable Goods Merchant Wholesalers ', 	'42394', 	'Jewelry, Watch, Precious Stone, and Precious Metal Merchant Wholesalers ', 	'423940', 	'Jewelry, Watch, Precious Stone, and Precious Metal Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'423', 	'Merchant Wholesalers, Durable Goods ', 	'4239', 	'Miscellaneous Durable Goods Merchant Wholesalers ', 	'42399', 	'Other Miscellaneous Durable Goods Merchant Wholesalers ', 	'423990', 	'Other Miscellaneous Durable Goods Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4241', 	'Paper and Paper Product Merchant Wholesalers ', 	'42411', 	'Printing and Writing Paper Merchant Wholesalers ', 	'424110', 	'Printing and Writing Paper Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4241', 	'Paper and Paper Product Merchant Wholesalers ', 	'42412', 	'Stationery and Office Supplies Merchant Wholesalers ', 	'424120', 	'Stationery and Office Supplies Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4241', 	'Paper and Paper Product Merchant Wholesalers ', 	'42413', 	'Industrial and Personal Service Paper Merchant Wholesalers ', 	'424130', 	'Industrial and Personal Service Paper Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4242', 	'Drugs and Druggists'' Sundries Merchant Wholesalers ', 	'42421', 	'Drugs and Druggists'' Sundries Merchant Wholesalers ', 	'424210', 	'Drugs and Druggists'' Sundries Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4243', 	'Apparel, Piece Goods, and Notions Merchant Wholesalers ', 	'42431', 	'Piece Goods, Notions, and Other Dry Goods Merchant Wholesalers ', 	'424310', 	'Piece Goods, Notions, and Other Dry Goods Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4243', 	'Apparel, Piece Goods, and Notions Merchant Wholesalers ', 	'42434', 	'Footwear Merchant Wholesalers ', 	'424340', 	'Footwear Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4243', 	'Apparel, Piece Goods, and Notions Merchant Wholesalers ', 	'42435', 	'Clothing and Clothing Accessories Merchant Wholesalers', 	'424350', 	'Clothing and Clothing Accessories Merchant Wholesalers', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4244', 	'Grocery and Related Product Merchant Wholesalers ', 	'42441', 	'General Line Grocery Merchant Wholesalers ', 	'424410', 	'General Line Grocery Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4244', 	'Grocery and Related Product Merchant Wholesalers ', 	'42442', 	'Packaged Frozen Food Merchant Wholesalers ', 	'424420', 	'Packaged Frozen Food Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4244', 	'Grocery and Related Product Merchant Wholesalers ', 	'42443', 	'Dairy Product (except Dried or Canned) Merchant Wholesalers ', 	'424430', 	'Dairy Product (except Dried or Canned) Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4244', 	'Grocery and Related Product Merchant Wholesalers ', 	'42444', 	'Poultry and Poultry Product Merchant Wholesalers ', 	'424440', 	'Poultry and Poultry Product Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4244', 	'Grocery and Related Product Merchant Wholesalers ', 	'42445', 	'Confectionery Merchant Wholesalers ', 	'424450', 	'Confectionery Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4244', 	'Grocery and Related Product Merchant Wholesalers ', 	'42446', 	'Fish and Seafood Merchant Wholesalers ', 	'424460', 	'Fish and Seafood Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4244', 	'Grocery and Related Product Merchant Wholesalers ', 	'42447', 	'Meat and Meat Product Merchant Wholesalers ', 	'424470', 	'Meat and Meat Product Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4244', 	'Grocery and Related Product Merchant Wholesalers ', 	'42448', 	'Fresh Fruit and Vegetable Merchant Wholesalers ', 	'424480', 	'Fresh Fruit and Vegetable Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4244', 	'Grocery and Related Product Merchant Wholesalers ', 	'42449', 	'Other Grocery and Related Products Merchant Wholesalers ', 	'424490', 	'Other Grocery and Related Products Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4245', 	'Farm Product Raw Material Merchant Wholesalers ', 	'42451', 	'Grain and Field Bean Merchant Wholesalers ', 	'424510', 	'Grain and Field Bean Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4245', 	'Farm Product Raw Material Merchant Wholesalers ', 	'42452', 	'Livestock Merchant Wholesalers ', 	'424520', 	'Livestock Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4245', 	'Farm Product Raw Material Merchant Wholesalers ', 	'42459', 	'Other Farm Product Raw Material Merchant Wholesalers ', 	'424590', 	'Other Farm Product Raw Material Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4246', 	'Chemical and Allied Products Merchant Wholesalers ', 	'42461', 	'Plastics Materials and Basic Forms and Shapes Merchant Wholesalers ', 	'424610', 	'Plastics Materials and Basic Forms and Shapes Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4246', 	'Chemical and Allied Products Merchant Wholesalers ', 	'42469', 	'Other Chemical and Allied Products Merchant Wholesalers ', 	'424690', 	'Other Chemical and Allied Products Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4247', 	'Petroleum and Petroleum Products Merchant Wholesalers ', 	'42471', 	'Petroleum Bulk Stations and Terminals ', 	'424710', 	'Petroleum Bulk Stations and Terminals ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4247', 	'Petroleum and Petroleum Products Merchant Wholesalers ', 	'42472', 	'Petroleum and Petroleum Products Merchant Wholesalers (except Bulk Stations and Terminals) ', 	'424720', 	'Petroleum and Petroleum Products Merchant Wholesalers (except Bulk Stations and Terminals) ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4248', 	'Beer, Wine, and Distilled Alcoholic Beverage Merchant Wholesalers ', 	'42481', 	'Beer and Ale Merchant Wholesalers ', 	'424810', 	'Beer and Ale Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4248', 	'Beer, Wine, and Distilled Alcoholic Beverage Merchant Wholesalers ', 	'42482', 	'Wine and Distilled Alcoholic Beverage Merchant Wholesalers ', 	'424820', 	'Wine and Distilled Alcoholic Beverage Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4249', 	'Miscellaneous Nondurable Goods Merchant Wholesalers ', 	'42491', 	'Farm Supplies Merchant Wholesalers ', 	'424910', 	'Farm Supplies Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4249', 	'Miscellaneous Nondurable Goods Merchant Wholesalers ', 	'42492', 	'Book, Periodical, and Newspaper Merchant Wholesalers ', 	'424920', 	'Book, Periodical, and Newspaper Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4249', 	'Miscellaneous Nondurable Goods Merchant Wholesalers ', 	'42493', 	'Flower, Nursery Stock, and Florists'' Supplies Merchant Wholesalers ', 	'424930', 	'Flower, Nursery Stock, and Florists'' Supplies Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4249', 	'Miscellaneous Nondurable Goods Merchant Wholesalers ', 	'42494', 	'Tobacco Product and Electronic Cigarette Merchant Wholesalers ', 	'424940', 	'Tobacco Product and Electronic Cigarette Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4249', 	'Miscellaneous Nondurable Goods Merchant Wholesalers ', 	'42495', 	'Paint, Varnish, and Supplies Merchant Wholesalers ', 	'424950', 	'Paint, Varnish, and Supplies Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'424', 	'Merchant Wholesalers, Nondurable Goods ', 	'4249', 	'Miscellaneous Nondurable Goods Merchant Wholesalers ', 	'42499', 	'Other Miscellaneous Nondurable Goods Merchant Wholesalers ', 	'424990', 	'Other Miscellaneous Nondurable Goods Merchant Wholesalers ', 	'2022'),
('42', 	'Wholesale Trade', 	'425', 	'Wholesale Trade Agents and Brokers ', 	'4251', 	'Wholesale Trade Agents and Brokers ', 	'42512', 	'Wholesale Trade Agents and Brokers ', 	'425120', 	'Wholesale Trade Agents and Brokers ', 	'2022'),
('51', 	'Information', 	'512', 	'Motion Picture and Sound Recording Industries', 	'5121', 	'Motion Picture and Video Industries', 	'51211', 	'Motion Picture and Video Production', 	'512110', 	'Motion Picture and Video Production ', 	'2022'),
('51', 	'Information', 	'512', 	'Motion Picture and Sound Recording Industries', 	'5121', 	'Motion Picture and Video Industries', 	'51212', 	'Motion Picture and Video Distribution', 	'512120', 	'Motion Picture and Video Distribution', 	'2022'),
('51', 	'Information', 	'512', 	'Motion Picture and Sound Recording Industries', 	'5121', 	'Motion Picture and Video Industries', 	'51213', 	'Motion Picture and Video Exhibition', 	'512131', 	'Motion Picture Theaters (except Drive-Ins) ', 	'2022'),
('51', 	'Information', 	'512', 	'Motion Picture and Sound Recording Industries', 	'5121', 	'Motion Picture and Video Industries', 	'51213', 	'Motion Picture and Video Exhibition', 	'512132', 	'Drive-In Motion Picture Theaters ', 	'2022'),
('51', 	'Information', 	'512', 	'Motion Picture and Sound Recording Industries', 	'5121', 	'Motion Picture and Video Industries', 	'51219', 	'Postproduction Services and Other Motion Picture and Video Industries', 	'512191', 	'Teleproduction and Other Postproduction Services ', 	'2022'),
('51', 	'Information', 	'512', 	'Motion Picture and Sound Recording Industries', 	'5121', 	'Motion Picture and Video Industries', 	'51219', 	'Postproduction Services and Other Motion Picture and Video Industries', 	'512199', 	'Other Motion Picture and Video Industries ', 	'2022'),
('51', 	'Information', 	'512', 	'Motion Picture and Sound Recording Industries', 	'5122', 	'Sound Recording Industries', 	'51223', 	'Music Publishers', 	'512230', 	'Music Publishers', 	'2022'),
('51', 	'Information', 	'512', 	'Motion Picture and Sound Recording Industries', 	'5122', 	'Sound Recording Industries', 	'51224', 	'Sound Recording Studios', 	'512240', 	'Sound Recording Studios', 	'2022'),
('51', 	'Information', 	'512', 	'Motion Picture and Sound Recording Industries', 	'5122', 	'Sound Recording Industries', 	'51225', 	'Record Production and Distribution', 	'512250', 	'Record Production and Distribution', 	'2022'),
('51', 	'Information', 	'512', 	'Motion Picture and Sound Recording Industries', 	'5122', 	'Sound Recording Industries', 	'51229', 	'Other Sound Recording Industries', 	'512290', 	'Other Sound Recording Industries', 	'2022'),
('51', 	'Information', 	'513', 	'Publishing Industries', 	'5131', 	'Newspaper, Periodical, Book, and Directory Publishers', 	'51311', 	'Newspaper Publishers', 	'513110', 	'Newspaper Publishers ', 	'2022'),
('51', 	'Information', 	'513', 	'Publishing Industries', 	'5131', 	'Newspaper, Periodical, Book, and Directory Publishers', 	'51312', 	'Periodical Publishers', 	'513120', 	'Periodical Publishers ', 	'2022'),
('51', 	'Information', 	'513', 	'Publishing Industries', 	'5131', 	'Newspaper, Periodical, Book, and Directory Publishers', 	'51313', 	'Book Publishers', 	'513130', 	'Book Publishers ', 	'2022'),
('51', 	'Information', 	'513', 	'Publishing Industries', 	'5131', 	'Newspaper, Periodical, Book, and Directory Publishers', 	'51314', 	'Directory and Mailing List Publishers', 	'513140', 	'Directory and Mailing List Publishers ', 	'2022'),
('51', 	'Information', 	'513', 	'Publishing Industries', 	'5131', 	'Newspaper, Periodical, Book, and Directory Publishers', 	'51319', 	'Other Publishers', 	'513191', 	'Greeting Card Publishers ', 	'2022'),
('51', 	'Information', 	'513', 	'Publishing Industries', 	'5131', 	'Newspaper, Periodical, Book, and Directory Publishers', 	'51319', 	'Other Publishers', 	'513199', 	'All Other Publishers ', 	'2022'),
('51', 	'Information', 	'513', 	'Publishing Industries', 	'5132', 	'Software Publishers', 	'51321', 	'Software Publishers', 	'513210', 	'Software Publishers', 	'2022'),
('51', 	'Information', 	'516', 	'Broadcasting and Content Providers', 	'5161', 	'Radio and Television Broadcasting Stations', 	'51611', 	'Radio Broadcasting Stations', 	'516110', 	'Radio Broadcasting Stations ', 	'2022'),
('51', 	'Information', 	'516', 	'Broadcasting and Content Providers', 	'5161', 	'Radio and Television Broadcasting Stations', 	'51612', 	'Television Broadcasting Stations', 	'516120', 	'Television Broadcasting Stations', 	'2022'),
('51', 	'Information', 	'516', 	'Broadcasting and Content Providers', 	'5162', 	'Media Streaming Distribution Services, Social Networks, and Other Media Networks and Content Providers', 	'51621', 	'Media Streaming Distribution Services, Social Networks, and Other Media Networks and Content Providers', 	'516210', 	'Media Streaming Distribution Services, Social Networks, and Other Media Networks and Content Providers', 	'2022'),
('51', 	'Information', 	'517', 	'Telecommunications', 	'5171', 	'Wired and Wireless Telecommunications (except Satellite)', 	'51711', 	'Wired and Wireless Telecommunications Carriers (except Satellite)', 	'517111', 	'Wired Telecommunications Carriers ', 	'2022'),
('51', 	'Information', 	'517', 	'Telecommunications', 	'5171', 	'Wired and Wireless Telecommunications (except Satellite)', 	'51711', 	'Wired and Wireless Telecommunications Carriers (except Satellite)', 	'517112', 	'Wireless Telecommunications Carriers (except Satellite)', 	'2022'),
('51', 	'Information', 	'517', 	'Telecommunications', 	'5171', 	'Wired and Wireless Telecommunications (except Satellite)', 	'51712', 	'Telecommunications Resellers and Agents for Wireless Telecommunication Services', 	'517121', 	'Telecommunications Resellers', 	'2022'),
('51', 	'Information', 	'517', 	'Telecommunications', 	'5171', 	'Wired and Wireless Telecommunications (except Satellite)', 	'51712', 	'Telecommunications Resellers and Agents for Wireless Telecommunication Services', 	'517122', 	'Agents for Wireless Telecommunications Services', 	'2022'),
('51', 	'Information', 	'517', 	'Telecommunications', 	'5174', 	'Satellite Telecommunications', 	'51741', 	'Satellite Telecommunications', 	'517410', 	'Satellite Telecommunications', 	'2022'),
('51', 	'Information', 	'517', 	'Telecommunications', 	'5178', 	'All Other Telecommunications', 	'51781', 	'All Other Telecommunications', 	'517810', 	'All Other Telecommunications ', 	'2022'),
('51', 	'Information', 	'518', 	'Computing Infrastructure Providers, Data Processing, Web Hosting, and Related Services', 	'5182', 	'Computing Infrastructure Providers, Data Processing, Web Hosting, and Related Services', 	'51821', 	'Computing Infrastructure Providers, Data Processing, Web Hosting, and Related Services', 	'518210', 	'Computing Infrastructure Providers, Data Processing, Web Hosting, and Related Services', 	'2022'),
('51', 	'Information', 	'519', 	'Web Search Portals, Libraries, Archives, and Other Information Services', 	'5192', 	'Web Search Portals, Libraries, Archives, and Other Information Services', 	'51921', 	'Libraries and Archives', 	'519210', 	'Libraries and Archives ', 	'2022'),
('51', 	'Information', 	'519', 	'Web Search Portals, Libraries, Archives, and Other Information Services', 	'5192', 	'Web Search Portals, Libraries, Archives, and Other Information Services', 	'51929', 	'Web Search Portals and All Other Information Services', 	'519290', 	'Web Search Portals and All Other Information Services', 	'2022'),
('52', 	'Finance and Insurance', 	'521', 	'Monetary Authorities-Central Bank', 	'5211', 	'Monetary Authorities-Central Bank', 	'52111', 	'Monetary Authorities-Central Bank', 	'521110', 	'Monetary Authorities-Central Bank', 	'2022'),
('52', 	'Finance and Insurance', 	'522', 	'Credit Intermediation and Related Activities', 	'5221', 	'Depository Credit Intermediation ', 	'52211', 	'Commercial Banking ', 	'522110', 	'Commercial Banking ', 	'2022'),
('52', 	'Finance and Insurance', 	'522', 	'Credit Intermediation and Related Activities', 	'5221', 	'Depository Credit Intermediation ', 	'52213', 	'Credit Unions ', 	'522130', 	'Credit Unions ', 	'2022'),
('52', 	'Finance and Insurance', 	'522', 	'Credit Intermediation and Related Activities', 	'5221', 	'Depository Credit Intermediation ', 	'52218', 	'Savings Institutions and Other Depository Credit Intermediation ', 	'522180', 	'Savings Institutions and Other Depository Credit Intermediation ', 	'2022'),
('52', 	'Finance and Insurance', 	'522', 	'Credit Intermediation and Related Activities', 	'5222', 	'Nondepository Credit Intermediation ', 	'52221', 	'Credit Card Issuing ', 	'522210', 	'Credit Card Issuing ', 	'2022'),
('52', 	'Finance and Insurance', 	'522', 	'Credit Intermediation and Related Activities', 	'5222', 	'Nondepository Credit Intermediation ', 	'52222', 	'Sales Financing ', 	'522220', 	'Sales Financing ', 	'2022'),
('52', 	'Finance and Insurance', 	'522', 	'Credit Intermediation and Related Activities', 	'5222', 	'Nondepository Credit Intermediation ', 	'52229', 	'Other Nondepository Credit Intermediation ', 	'522291', 	'Consumer Lending ', 	'2022'),
('52', 	'Finance and Insurance', 	'522', 	'Credit Intermediation and Related Activities', 	'5222', 	'Nondepository Credit Intermediation ', 	'52229', 	'Other Nondepository Credit Intermediation ', 	'522292', 	'Real Estate Credit ', 	'2022'),
('52', 	'Finance and Insurance', 	'522', 	'Credit Intermediation and Related Activities', 	'5222', 	'Nondepository Credit Intermediation ', 	'52229', 	'Other Nondepository Credit Intermediation ', 	'522299', 	'International, Secondary Market, and All Other Nondepository Credit Intermediation ', 	'2022'),
('52', 	'Finance and Insurance', 	'522', 	'Credit Intermediation and Related Activities', 	'5223', 	'Activities Related to Credit Intermediation ', 	'52231', 	'Mortgage and Nonmortgage Loan Brokers ', 	'522310', 	'Mortgage and Nonmortgage Loan Brokers ', 	'2022'),
('52', 	'Finance and Insurance', 	'522', 	'Credit Intermediation and Related Activities', 	'5223', 	'Activities Related to Credit Intermediation ', 	'52232', 	'Financial Transactions Processing, Reserve, and Clearinghouse Activities ', 	'522320', 	'Financial Transactions Processing, Reserve, and Clearinghouse Activities ', 	'2022'),
('52', 	'Finance and Insurance', 	'522', 	'Credit Intermediation and Related Activities', 	'5223', 	'Activities Related to Credit Intermediation ', 	'52239', 	'Other Activities Related to Credit Intermediation ', 	'522390', 	'Other Activities Related to Credit Intermediation ', 	'2022'),
('52', 	'Finance and Insurance', 	'523', 	'Securities, Commodity Contracts, and Other Financial Investments and Related Activities', 	'5231', 	'Securities and Commodity Contracts Intermediation and Brokerage', 	'52315', 	'Investment Banking and Securities Intermediation ', 	'523150', 	'Investment Banking and Securities Intermediation ', 	'2022'),
('52', 	'Finance and Insurance', 	'523', 	'Securities, Commodity Contracts, and Other Financial Investments and Related Activities', 	'5231', 	'Securities and Commodity Contracts Intermediation and Brokerage', 	'52316', 	'Commodity Contracts Intermediation ', 	'523160', 	'Commodity Contracts Intermediation ', 	'2022'),
('52', 	'Finance and Insurance', 	'523', 	'Securities, Commodity Contracts, and Other Financial Investments and Related Activities', 	'5232', 	'Securities and Commodity Exchanges', 	'52321', 	'Securities and Commodity Exchanges', 	'523210', 	'Securities and Commodity Exchanges', 	'2022'),
('52', 	'Finance and Insurance', 	'523', 	'Securities, Commodity Contracts, and Other Financial Investments and Related Activities', 	'5239', 	'Other Financial Investment Activities', 	'52391', 	'Miscellaneous Intermediation ', 	'523910', 	'Miscellaneous Intermediation ', 	'2022'),
('52', 	'Finance and Insurance', 	'523', 	'Securities, Commodity Contracts, and Other Financial Investments and Related Activities', 	'5239', 	'Other Financial Investment Activities', 	'52394', 	'Portfolio Management and Investment Advice ', 	'523940', 	'Portfolio Management and Investment Advice ', 	'2022'),
('52', 	'Finance and Insurance', 	'523', 	'Securities, Commodity Contracts, and Other Financial Investments and Related Activities', 	'5239', 	'Other Financial Investment Activities', 	'52399', 	'All Other Financial Investment Activities ', 	'523991', 	'Trust, Fiduciary, and Custody Activities ', 	'2022'),
('52', 	'Finance and Insurance', 	'523', 	'Securities, Commodity Contracts, and Other Financial Investments and Related Activities', 	'5239', 	'Other Financial Investment Activities', 	'52399', 	'All Other Financial Investment Activities ', 	'523999', 	'Miscellaneous Financial Investment Activities ', 	'2022'),
('52', 	'Finance and Insurance', 	'524', 	'Insurance Carriers and Related Activities', 	'5241', 	'Insurance Carriers', 	'52411', 	'Direct Life, Health, and Medical Insurance Carriers ', 	'524113', 	'Direct Life Insurance Carriers ', 	'2022'),
('52', 	'Finance and Insurance', 	'524', 	'Insurance Carriers and Related Activities', 	'5241', 	'Insurance Carriers', 	'52411', 	'Direct Life, Health, and Medical Insurance Carriers ', 	'524114', 	'Direct Health and Medical Insurance Carriers ', 	'2022'),
('52', 	'Finance and Insurance', 	'524', 	'Insurance Carriers and Related Activities', 	'5241', 	'Insurance Carriers', 	'52412', 	'Direct Insurance (except Life, Health, and Medical) Carriers ', 	'524126', 	'Direct Property and Casualty Insurance Carriers ', 	'2022'),
('52', 	'Finance and Insurance', 	'524', 	'Insurance Carriers and Related Activities', 	'5241', 	'Insurance Carriers', 	'52412', 	'Direct Insurance (except Life, Health, and Medical) Carriers ', 	'524127', 	'Direct Title Insurance Carriers ', 	'2022'),
('52', 	'Finance and Insurance', 	'524', 	'Insurance Carriers and Related Activities', 	'5241', 	'Insurance Carriers', 	'52412', 	'Direct Insurance (except Life, Health, and Medical) Carriers ', 	'524128', 	'Other Direct Insurance (except Life, Health, and Medical) Carriers ', 	'2022'),
('52', 	'Finance and Insurance', 	'524', 	'Insurance Carriers and Related Activities', 	'5241', 	'Insurance Carriers', 	'52413', 	'Reinsurance Carriers ', 	'524130', 	'Reinsurance Carriers ', 	'2022'),
('52', 	'Finance and Insurance', 	'524', 	'Insurance Carriers and Related Activities', 	'5242', 	'Agencies, Brokerages, and Other Insurance Related Activities', 	'52421', 	'Insurance Agencies and Brokerages ', 	'524210', 	'Insurance Agencies and Brokerages ', 	'2022'),
('52', 	'Finance and Insurance', 	'524', 	'Insurance Carriers and Related Activities', 	'5242', 	'Agencies, Brokerages, and Other Insurance Related Activities', 	'52429', 	'Other Insurance Related Activities ', 	'524291', 	'Claims Adjusting ', 	'2022'),
('52', 	'Finance and Insurance', 	'524', 	'Insurance Carriers and Related Activities', 	'5242', 	'Agencies, Brokerages, and Other Insurance Related Activities', 	'52429', 	'Other Insurance Related Activities ', 	'524292', 	'Pharmacy Benefit Management and Other Third Party Administration of Insurance and Pension Funds ', 	'2022'),
('52', 	'Finance and Insurance', 	'524', 	'Insurance Carriers and Related Activities', 	'5242', 	'Agencies, Brokerages, and Other Insurance Related Activities', 	'52429', 	'Other Insurance Related Activities ', 	'524298', 	'All Other Insurance Related Activities ', 	'2022'),
('52', 	'Finance and Insurance', 	'525', 	'Funds, Trusts, and Other Financial Vehicles ', 	'5251', 	'Insurance and Employee Benefit Funds ', 	'52511', 	'Pension Funds ', 	'525110', 	'Pension Funds ', 	'2022'),
('52', 	'Finance and Insurance', 	'525', 	'Funds, Trusts, and Other Financial Vehicles ', 	'5251', 	'Insurance and Employee Benefit Funds ', 	'52512', 	'Health and Welfare Funds ', 	'525120', 	'Health and Welfare Funds ', 	'2022'),
('52', 	'Finance and Insurance', 	'525', 	'Funds, Trusts, and Other Financial Vehicles ', 	'5251', 	'Insurance and Employee Benefit Funds ', 	'52519', 	'Other Insurance Funds ', 	'525190', 	'Other Insurance Funds ', 	'2022'),
('52', 	'Finance and Insurance', 	'525', 	'Funds, Trusts, and Other Financial Vehicles ', 	'5259', 	'Other Investment Pools and Funds', 	'52591', 	'Open-End Investment Funds ', 	'525910', 	'Open-End Investment Funds ', 	'2022'),
('52', 	'Finance and Insurance', 	'525', 	'Funds, Trusts, and Other Financial Vehicles ', 	'5259', 	'Other Investment Pools and Funds', 	'52592', 	'Trusts, Estates, and Agency Accounts ', 	'525920', 	'Trusts, Estates, and Agency Accounts ', 	'2022'),
('52', 	'Finance and Insurance', 	'525', 	'Funds, Trusts, and Other Financial Vehicles ', 	'5259', 	'Other Investment Pools and Funds', 	'52599', 	'Other Financial Vehicles ', 	'525990', 	'Other Financial Vehicles ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'531', 	'Real Estate', 	'5311', 	'Lessors of Real Estate', 	'53111', 	'Lessors of Residential Buildings and Dwellings ', 	'531110', 	'Lessors of Residential Buildings and Dwellings ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'531', 	'Real Estate', 	'5311', 	'Lessors of Real Estate', 	'53112', 	'Lessors of Nonresidential Buildings (except Miniwarehouses) ', 	'531120', 	'Lessors of Nonresidential Buildings (except Miniwarehouses) ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'531', 	'Real Estate', 	'5311', 	'Lessors of Real Estate', 	'53113', 	'Lessors of Miniwarehouses and Self-Storage Units ', 	'531130', 	'Lessors of Miniwarehouses and Self-Storage Units ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'531', 	'Real Estate', 	'5311', 	'Lessors of Real Estate', 	'53119', 	'Lessors of Other Real Estate Property ', 	'531190', 	'Lessors of Other Real Estate Property ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'531', 	'Real Estate', 	'5312', 	'Offices of Real Estate Agents and Brokers', 	'53121', 	'Offices of Real Estate Agents and Brokers', 	'531210', 	'Offices of Real Estate Agents and Brokers', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'531', 	'Real Estate', 	'5313', 	'Activities Related to Real Estate', 	'53131', 	'Real Estate Property Managers ', 	'531311', 	'Residential Property Managers ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'531', 	'Real Estate', 	'5313', 	'Activities Related to Real Estate', 	'53131', 	'Real Estate Property Managers ', 	'531312', 	'Nonresidential Property Managers ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'531', 	'Real Estate', 	'5313', 	'Activities Related to Real Estate', 	'53132', 	'Offices of Real Estate Appraisers ', 	'531320', 	'Offices of Real Estate Appraisers ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'531', 	'Real Estate', 	'5313', 	'Activities Related to Real Estate', 	'53139', 	'Other Activities Related to Real Estate ', 	'531390', 	'Other Activities Related to Real Estate ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'532', 	'Rental and Leasing Services', 	'5321', 	'Automotive Equipment Rental and Leasing', 	'53211', 	'Passenger Car Rental and Leasing', 	'532111', 	'Passenger Car Rental ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'532', 	'Rental and Leasing Services', 	'5321', 	'Automotive Equipment Rental and Leasing', 	'53211', 	'Passenger Car Rental and Leasing', 	'532112', 	'Passenger Car Leasing ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'532', 	'Rental and Leasing Services', 	'5321', 	'Automotive Equipment Rental and Leasing', 	'53212', 	'Truck, Utility Trailer, and RV (Recreational Vehicle) Rental and Leasing', 	'532120', 	'Truck, Utility Trailer, and RV (Recreational Vehicle) Rental and Leasing ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'532', 	'Rental and Leasing Services', 	'5322', 	'Consumer Goods Rental', 	'53221', 	'Consumer Electronics and Appliances Rental', 	'532210', 	'Consumer Electronics and Appliances Rental', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'532', 	'Rental and Leasing Services', 	'5322', 	'Consumer Goods Rental', 	'53228', 	'Other Consumer Goods Rental ', 	'532281', 	'Formal Wear and Costume Rental', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'532', 	'Rental and Leasing Services', 	'5322', 	'Consumer Goods Rental', 	'53228', 	'Other Consumer Goods Rental ', 	'532282', 	'Video Tape and Disc Rental', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'532', 	'Rental and Leasing Services', 	'5322', 	'Consumer Goods Rental', 	'53228', 	'Other Consumer Goods Rental ', 	'532283', 	'Home Health Equipment Rental ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'532', 	'Rental and Leasing Services', 	'5322', 	'Consumer Goods Rental', 	'53228', 	'Other Consumer Goods Rental ', 	'532284', 	'Recreational Goods Rental ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'532', 	'Rental and Leasing Services', 	'5322', 	'Consumer Goods Rental', 	'53228', 	'Other Consumer Goods Rental ', 	'532289', 	'All Other Consumer Goods Rental ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'532', 	'Rental and Leasing Services', 	'5323', 	'General Rental Centers', 	'53231', 	'General Rental Centers', 	'532310', 	'General Rental Centers', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'532', 	'Rental and Leasing Services', 	'5324', 	'Commercial and Industrial Machinery and Equipment Rental and Leasing', 	'53241', 	'Construction, Transportation, Mining, and Forestry Machinery and Equipment Rental and Leasing', 	'532411', 	'Commercial Air, Rail, and Water Transportation Equipment Rental and Leasing ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'532', 	'Rental and Leasing Services', 	'5324', 	'Commercial and Industrial Machinery and Equipment Rental and Leasing', 	'53241', 	'Construction, Transportation, Mining, and Forestry Machinery and Equipment Rental and Leasing', 	'532412', 	'Construction, Mining, and Forestry Machinery and Equipment Rental and Leasing ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'532', 	'Rental and Leasing Services', 	'5324', 	'Commercial and Industrial Machinery and Equipment Rental and Leasing', 	'53242', 	'Office Machinery and Equipment Rental and Leasing', 	'532420', 	'Office Machinery and Equipment Rental and Leasing', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'532', 	'Rental and Leasing Services', 	'5324', 	'Commercial and Industrial Machinery and Equipment Rental and Leasing', 	'53249', 	'Other Commercial and Industrial Machinery and Equipment Rental and Leasing', 	'532490', 	'Other Commercial and Industrial Machinery and Equipment Rental and Leasing ', 	'2022'),
('53', 	'Real Estate and Rental and Leasing', 	'533', 	'Lessors of Nonfinancial Intangible Assets (except Copyrighted Works)', 	'5331', 	'Lessors of Nonfinancial Intangible Assets (except Copyrighted Works)', 	'53311', 	'Lessors of Nonfinancial Intangible Assets (except Copyrighted Works)', 	'533110', 	'Lessors of Nonfinancial Intangible Assets (except Copyrighted Works)', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5411', 	'Legal Services', 	'54111', 	'Offices of Lawyers', 	'541110', 	'Offices of Lawyers', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5411', 	'Legal Services', 	'54112', 	'Offices of Notaries', 	'541120', 	'Offices of Notaries', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5411', 	'Legal Services', 	'54119', 	'Other Legal Services', 	'541191', 	'Title Abstract and Settlement Offices ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5411', 	'Legal Services', 	'54119', 	'Other Legal Services', 	'541199', 	'All Other Legal Services ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5412', 	'Accounting, Tax Preparation, Bookkeeping, and Payroll Services', 	'54121', 	'Accounting, Tax Preparation, Bookkeeping, and Payroll Services', 	'541211', 	'Offices of Certified Public Accountants ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5412', 	'Accounting, Tax Preparation, Bookkeeping, and Payroll Services', 	'54121', 	'Accounting, Tax Preparation, Bookkeeping, and Payroll Services', 	'541213', 	'Tax Preparation Services ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5412', 	'Accounting, Tax Preparation, Bookkeeping, and Payroll Services', 	'54121', 	'Accounting, Tax Preparation, Bookkeeping, and Payroll Services', 	'541214', 	'Payroll Services ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5412', 	'Accounting, Tax Preparation, Bookkeeping, and Payroll Services', 	'54121', 	'Accounting, Tax Preparation, Bookkeeping, and Payroll Services', 	'541219', 	'Other Accounting Services ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5413', 	'Architectural, Engineering, and Related Services', 	'54131', 	'Architectural Services', 	'541310', 	'Architectural Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5413', 	'Architectural, Engineering, and Related Services', 	'54132', 	'Landscape Architectural Services', 	'541320', 	'Landscape Architectural Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5413', 	'Architectural, Engineering, and Related Services', 	'54133', 	'Engineering Services', 	'541330', 	'Engineering Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5413', 	'Architectural, Engineering, and Related Services', 	'54134', 	'Drafting Services', 	'541340', 	'Drafting Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5413', 	'Architectural, Engineering, and Related Services', 	'54135', 	'Building Inspection Services', 	'541350', 	'Building Inspection Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5413', 	'Architectural, Engineering, and Related Services', 	'54136', 	'Geophysical Surveying and Mapping Services', 	'541360', 	'Geophysical Surveying and Mapping Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5413', 	'Architectural, Engineering, and Related Services', 	'54137', 	'Surveying and Mapping (except Geophysical) Services', 	'541370', 	'Surveying and Mapping (except Geophysical) Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5413', 	'Architectural, Engineering, and Related Services', 	'54138', 	'Testing Laboratories and Services', 	'541380', 	'Testing Laboratories and Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5414', 	'Specialized Design Services', 	'54141', 	'Interior Design Services', 	'541410', 	'Interior Design Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5414', 	'Specialized Design Services', 	'54142', 	'Industrial Design Services', 	'541420', 	'Industrial Design Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5414', 	'Specialized Design Services', 	'54143', 	'Graphic Design Services', 	'541430', 	'Graphic Design Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5414', 	'Specialized Design Services', 	'54149', 	'Other Specialized Design Services', 	'541490', 	'Other Specialized Design Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5415', 	'Computer Systems Design and Related Services', 	'54151', 	'Computer Systems Design and Related Services', 	'541511', 	'Custom Computer Programming Services ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5415', 	'Computer Systems Design and Related Services', 	'54151', 	'Computer Systems Design and Related Services', 	'541512', 	'Computer Systems Design Services ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5415', 	'Computer Systems Design and Related Services', 	'54151', 	'Computer Systems Design and Related Services', 	'541513', 	'Computer Facilities Management Services ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5415', 	'Computer Systems Design and Related Services', 	'54151', 	'Computer Systems Design and Related Services', 	'541519', 	'Other Computer Related Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5416', 	'Management, Scientific, and Technical Consulting Services', 	'54161', 	'Management Consulting Services', 	'541611', 	'Administrative Management and General Management Consulting Services ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5416', 	'Management, Scientific, and Technical Consulting Services', 	'54161', 	'Management Consulting Services', 	'541612', 	'Human Resources Consulting Services ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5416', 	'Management, Scientific, and Technical Consulting Services', 	'54161', 	'Management Consulting Services', 	'541613', 	'Marketing Consulting Services ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5416', 	'Management, Scientific, and Technical Consulting Services', 	'54161', 	'Management Consulting Services', 	'541614', 	'Process, Physical Distribution, and Logistics Consulting Services ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5416', 	'Management, Scientific, and Technical Consulting Services', 	'54161', 	'Management Consulting Services', 	'541618', 	'Other Management Consulting Services ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5416', 	'Management, Scientific, and Technical Consulting Services', 	'54162', 	'Environmental Consulting Services', 	'541620', 	'Environmental Consulting Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5416', 	'Management, Scientific, and Technical Consulting Services', 	'54169', 	'Other Scientific and Technical Consulting Services', 	'541690', 	'Other Scientific and Technical Consulting Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5417', 	'Scientific Research and Development Services', 	'54171', 	'Research and Development in the Physical, Engineering, and Life Sciences', 	'541713', 	'Research and Development in Nanotechnology ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5417', 	'Scientific Research and Development Services', 	'54171', 	'Research and Development in the Physical, Engineering, and Life Sciences', 	'541714', 	'Research and Development in Biotechnology (except Nanobiotechnology)', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5417', 	'Scientific Research and Development Services', 	'54171', 	'Research and Development in the Physical, Engineering, and Life Sciences', 	'541715', 	'Research and Development in the Physical, Engineering, and Life Sciences (except Nanotechnology and Biotechnology) ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5417', 	'Scientific Research and Development Services', 	'54172', 	'Research and Development in the Social Sciences and Humanities', 	'541720', 	'Research and Development in the Social Sciences and Humanities ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5418', 	'Advertising, Public Relations, and Related Services', 	'54181', 	'Advertising Agencies', 	'541810', 	'Advertising Agencies', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5418', 	'Advertising, Public Relations, and Related Services', 	'54182', 	'Public Relations Agencies', 	'541820', 	'Public Relations Agencies', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5418', 	'Advertising, Public Relations, and Related Services', 	'54183', 	'Media Buying Agencies', 	'541830', 	'Media Buying Agencies', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5418', 	'Advertising, Public Relations, and Related Services', 	'54184', 	'Media Representatives', 	'541840', 	'Media Representatives', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5418', 	'Advertising, Public Relations, and Related Services', 	'54185', 	'Indoor and Outdoor Display Advertising', 	'541850', 	'Indoor and Outdoor Display Advertising', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5418', 	'Advertising, Public Relations, and Related Services', 	'54186', 	'Direct Mail Advertising', 	'541860', 	'Direct Mail Advertising', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5418', 	'Advertising, Public Relations, and Related Services', 	'54187', 	'Advertising Material Distribution Services', 	'541870', 	'Advertising Material Distribution Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5418', 	'Advertising, Public Relations, and Related Services', 	'54189', 	'Other Services Related to Advertising', 	'541890', 	'Other Services Related to Advertising ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5419', 	'Other Professional, Scientific, and Technical Services', 	'54191', 	'Marketing Research and Public Opinion Polling', 	'541910', 	'Marketing Research and Public Opinion Polling', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5419', 	'Other Professional, Scientific, and Technical Services', 	'54192', 	'Photographic Services', 	'541921', 	'Photography Studios, Portrait ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5419', 	'Other Professional, Scientific, and Technical Services', 	'54192', 	'Photographic Services', 	'541922', 	'Commercial Photography ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5419', 	'Other Professional, Scientific, and Technical Services', 	'54193', 	'Translation and Interpretation Services', 	'541930', 	'Translation and Interpretation Services', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5419', 	'Other Professional, Scientific, and Technical Services', 	'54194', 	'Veterinary Services', 	'541940', 	'Veterinary Services ', 	'2022'),
('54', 	'Professional, Scientific, and Technical Services', 	'541', 	'Professional, Scientific, and Technical Services', 	'5419', 	'Other Professional, Scientific, and Technical Services', 	'54199', 	'All Other Professional, Scientific, and Technical Services', 	'541990', 	'All Other Professional, Scientific, and Technical Services', 	'2022'),
('55', 	'Management of Companies and Enterprises', 	'551', 	'Management of Companies and Enterprises', 	'5511', 	'Management of Companies and Enterprises', 	'55111', 	'Management of Companies and Enterprises', 	'551111', 	'Offices of Bank Holding Companies ', 	'2022'),
('55', 	'Management of Companies and Enterprises', 	'551', 	'Management of Companies and Enterprises', 	'5511', 	'Management of Companies and Enterprises', 	'55111', 	'Management of Companies and Enterprises', 	'551112', 	'Offices of Other Holding Companies ', 	'2022'),
('55', 	'Management of Companies and Enterprises', 	'551', 	'Management of Companies and Enterprises', 	'5511', 	'Management of Companies and Enterprises', 	'55111', 	'Management of Companies and Enterprises', 	'551114', 	'Corporate, Subsidiary, and Regional Managing Offices ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5611', 	'Office Administrative Services', 	'56111', 	'Office Administrative Services', 	'561110', 	'Office Administrative Services', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5612', 	'Facilities Support Services', 	'56121', 	'Facilities Support Services', 	'561210', 	'Facilities Support Services', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5613', 	'Employment Services', 	'56131', 	'Employment Placement Agencies and Executive Search Services', 	'561311', 	'Employment Placement Agencies ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5613', 	'Employment Services', 	'56131', 	'Employment Placement Agencies and Executive Search Services', 	'561312', 	'Executive Search Services ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5613', 	'Employment Services', 	'56132', 	'Temporary Help Services', 	'561320', 	'Temporary Help Services', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5613', 	'Employment Services', 	'56133', 	'Professional Employer Organizations', 	'561330', 	'Professional Employer Organizations', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5614', 	'Business Support Services', 	'56141', 	'Document Preparation Services', 	'561410', 	'Document Preparation Services', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5614', 	'Business Support Services', 	'56142', 	'Telephone Call Centers', 	'561421', 	'Telephone Answering Services ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5614', 	'Business Support Services', 	'56142', 	'Telephone Call Centers', 	'561422', 	'Telemarketing Bureaus and Other Contact Centers ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5614', 	'Business Support Services', 	'56143', 	'Business Service Centers', 	'561431', 	'Private Mail Centers ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5614', 	'Business Support Services', 	'56143', 	'Business Service Centers', 	'561439', 	'Other Business Service Centers (including Copy Shops) ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5614', 	'Business Support Services', 	'56144', 	'Collection Agencies', 	'561440', 	'Collection Agencies', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5614', 	'Business Support Services', 	'56145', 	'Credit Bureaus', 	'561450', 	'Credit Bureaus', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5614', 	'Business Support Services', 	'56149', 	'Other Business Support Services', 	'561491', 	'Repossession Services ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5614', 	'Business Support Services', 	'56149', 	'Other Business Support Services', 	'561492', 	'Court Reporting and Stenotype Services ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5614', 	'Business Support Services', 	'56149', 	'Other Business Support Services', 	'561499', 	'All Other Business Support Services ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5615', 	'Travel Arrangement and Reservation Services', 	'56151', 	'Travel Agencies', 	'561510', 	'Travel Agencies', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5615', 	'Travel Arrangement and Reservation Services', 	'56152', 	'Tour Operators', 	'561520', 	'Tour Operators', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5615', 	'Travel Arrangement and Reservation Services', 	'56159', 	'Other Travel Arrangement and Reservation Services', 	'561591', 	'Convention and Visitors Bureaus ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5615', 	'Travel Arrangement and Reservation Services', 	'56159', 	'Other Travel Arrangement and Reservation Services', 	'561599', 	'All Other Travel Arrangement and Reservation Services ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5616', 	'Investigation and Security Services', 	'56161', 	'Investigation, Guard, and Armored Car Services', 	'561611', 	'Investigation and Personal Background Check Services ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5616', 	'Investigation and Security Services', 	'56161', 	'Investigation, Guard, and Armored Car Services', 	'561612', 	'Security Guards and Patrol Services ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5616', 	'Investigation and Security Services', 	'56161', 	'Investigation, Guard, and Armored Car Services', 	'561613', 	'Armored Car Services ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5616', 	'Investigation and Security Services', 	'56162', 	'Security Systems Services', 	'561621', 	'Security Systems Services (except Locksmiths) ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5616', 	'Investigation and Security Services', 	'56162', 	'Security Systems Services', 	'561622', 	'Locksmiths ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5617', 	'Services to Buildings and Dwellings', 	'56171', 	'Exterminating and Pest Control Services', 	'561710', 	'Exterminating and Pest Control Services', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5617', 	'Services to Buildings and Dwellings', 	'56172', 	'Janitorial Services', 	'561720', 	'Janitorial Services ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5617', 	'Services to Buildings and Dwellings', 	'56173', 	'Landscaping Services', 	'561730', 	'Landscaping Services', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5617', 	'Services to Buildings and Dwellings', 	'56174', 	'Carpet and Upholstery Cleaning Services', 	'561740', 	'Carpet and Upholstery Cleaning Services', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5617', 	'Services to Buildings and Dwellings', 	'56179', 	'Other Services to Buildings and Dwellings', 	'561790', 	'Other Services to Buildings and Dwellings ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5619', 	'Other Support Services', 	'56191', 	'Packaging and Labeling Services', 	'561910', 	'Packaging and Labeling Services', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5619', 	'Other Support Services', 	'56192', 	'Convention and Trade Show Organizers', 	'561920', 	'Convention and Trade Show Organizers', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'561', 	'Administrative and Support Services', 	'5619', 	'Other Support Services', 	'56199', 	'All Other Support Services', 	'561990', 	'All Other Support Services', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'562', 	'Waste Management and Remediation Services', 	'5621', 	'Waste Collection ', 	'56211', 	'Waste Collection ', 	'562111', 	'Solid Waste Collection ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'562', 	'Waste Management and Remediation Services', 	'5621', 	'Waste Collection ', 	'56211', 	'Waste Collection ', 	'562112', 	'Hazardous Waste Collection ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'562', 	'Waste Management and Remediation Services', 	'5621', 	'Waste Collection ', 	'56211', 	'Waste Collection ', 	'562119', 	'Other Waste Collection ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'562', 	'Waste Management and Remediation Services', 	'5622', 	'Waste Treatment and Disposal ', 	'56221', 	'Waste Treatment and Disposal ', 	'562211', 	'Hazardous Waste Treatment and Disposal ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'562', 	'Waste Management and Remediation Services', 	'5622', 	'Waste Treatment and Disposal ', 	'56221', 	'Waste Treatment and Disposal ', 	'562212', 	'Solid Waste Landfill ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'562', 	'Waste Management and Remediation Services', 	'5622', 	'Waste Treatment and Disposal ', 	'56221', 	'Waste Treatment and Disposal ', 	'562213', 	'Solid Waste Combustors and Incinerators ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'562', 	'Waste Management and Remediation Services', 	'5622', 	'Waste Treatment and Disposal ', 	'56221', 	'Waste Treatment and Disposal ', 	'562219', 	'Other Nonhazardous Waste Treatment and Disposal ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'562', 	'Waste Management and Remediation Services', 	'5629', 	'Remediation and Other Waste Management Services ', 	'56291', 	'Remediation Services ', 	'562910', 	'Remediation Services ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'562', 	'Waste Management and Remediation Services', 	'5629', 	'Remediation and Other Waste Management Services ', 	'56292', 	'Materials Recovery Facilities ', 	'562920', 	'Materials Recovery Facilities ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'562', 	'Waste Management and Remediation Services', 	'5629', 	'Remediation and Other Waste Management Services ', 	'56299', 	'All Other Waste Management Services ', 	'562991', 	'Septic Tank and Related Services ', 	'2022'),
('56', 	'Administrative and Support and Waste Management and Remediation Services', 	'562', 	'Waste Management and Remediation Services', 	'5629', 	'Remediation and Other Waste Management Services ', 	'56299', 	'All Other Waste Management Services ', 	'562998', 	'All Other Miscellaneous Waste Management Services ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6111', 	'Elementary and Secondary Schools', 	'61111', 	'Elementary and Secondary Schools ', 	'611110', 	'Elementary and Secondary Schools ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6112', 	'Junior Colleges', 	'61121', 	'Junior Colleges', 	'611210', 	'Junior Colleges ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6113', 	'Colleges, Universities, and Professional Schools', 	'61131', 	'Colleges, Universities, and Professional Schools', 	'611310', 	'Colleges, Universities, and Professional Schools ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6114', 	'Business Schools and Computer and Management Training', 	'61141', 	'Business and Secretarial Schools', 	'611410', 	'Business and Secretarial Schools ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6114', 	'Business Schools and Computer and Management Training', 	'61142', 	'Computer Training', 	'611420', 	'Computer Training ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6114', 	'Business Schools and Computer and Management Training', 	'61143', 	'Professional and Management Development Training', 	'611430', 	'Professional and Management Development Training ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6115', 	'Technical and Trade Schools ', 	'61151', 	'Technical and Trade Schools', 	'611511', 	'Cosmetology and Barber Schools ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6115', 	'Technical and Trade Schools ', 	'61151', 	'Technical and Trade Schools', 	'611512', 	'Flight Training ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6115', 	'Technical and Trade Schools ', 	'61151', 	'Technical and Trade Schools', 	'611513', 	'Apprenticeship Training ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6115', 	'Technical and Trade Schools ', 	'61151', 	'Technical and Trade Schools', 	'611519', 	'Other Technical and Trade Schools ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6116', 	'Other Schools and Instruction', 	'61161', 	'Fine Arts Schools', 	'611610', 	'Fine Arts Schools ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6116', 	'Other Schools and Instruction', 	'61162', 	'Sports and Recreation Instruction', 	'611620', 	'Sports and Recreation Instruction ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6116', 	'Other Schools and Instruction', 	'61163', 	'Language Schools', 	'611630', 	'Language Schools ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6116', 	'Other Schools and Instruction', 	'61169', 	'All Other Schools and Instruction', 	'611691', 	'Exam Preparation and Tutoring ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6116', 	'Other Schools and Instruction', 	'61169', 	'All Other Schools and Instruction', 	'611692', 	'Automobile Driving Schools ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6116', 	'Other Schools and Instruction', 	'61169', 	'All Other Schools and Instruction', 	'611699', 	'All Other Miscellaneous Schools and Instruction ', 	'2022'),
('61', 	'Educational Services', 	'611', 	'Educational Services', 	'6117', 	'Educational Support Services', 	'61171', 	'Educational Support Services', 	'611710', 	'Educational Support Services', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6211', 	'Offices of Physicians', 	'62111', 	'Offices of Physicians', 	'621111', 	'Offices of Physicians (except Mental Health Specialists) ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6211', 	'Offices of Physicians', 	'62111', 	'Offices of Physicians', 	'621112', 	'Offices of Physicians, Mental Health Specialists ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6212', 	'Offices of Dentists', 	'62121', 	'Offices of Dentists', 	'621210', 	'Offices of Dentists ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6213', 	'Offices of Other Health Practitioners', 	'62131', 	'Offices of Chiropractors', 	'621310', 	'Offices of Chiropractors ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6213', 	'Offices of Other Health Practitioners', 	'62132', 	'Offices of Optometrists', 	'621320', 	'Offices of Optometrists', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6213', 	'Offices of Other Health Practitioners', 	'62133', 	'Offices of Mental Health Practitioners (except Physicians)', 	'621330', 	'Offices of Mental Health Practitioners (except Physicians) ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6213', 	'Offices of Other Health Practitioners', 	'62134', 	'Offices of Physical, Occupational and Speech Therapists, and Audiologists', 	'621340', 	'Offices of Physical, Occupational and Speech Therapists, and Audiologists ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6213', 	'Offices of Other Health Practitioners', 	'62139', 	'Offices of All Other Health Practitioners', 	'621391', 	'Offices of Podiatrists ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6213', 	'Offices of Other Health Practitioners', 	'62139', 	'Offices of All Other Health Practitioners', 	'621399', 	'Offices of All Other Miscellaneous Health Practitioners ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6214', 	'Outpatient Care Centers', 	'62141', 	'Family Planning Centers', 	'621410', 	'Family Planning Centers ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6214', 	'Outpatient Care Centers', 	'62142', 	'Outpatient Mental Health and Substance Abuse Centers', 	'621420', 	'Outpatient Mental Health and Substance Abuse Centers ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6214', 	'Outpatient Care Centers', 	'62149', 	'Other Outpatient Care Centers', 	'621491', 	'HMO Medical Centers ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6214', 	'Outpatient Care Centers', 	'62149', 	'Other Outpatient Care Centers', 	'621492', 	'Kidney Dialysis Centers ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6214', 	'Outpatient Care Centers', 	'62149', 	'Other Outpatient Care Centers', 	'621493', 	'Freestanding Ambulatory Surgical and Emergency Centers ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6214', 	'Outpatient Care Centers', 	'62149', 	'Other Outpatient Care Centers', 	'621498', 	'All Other Outpatient Care Centers ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6215', 	'Medical and Diagnostic Laboratories', 	'62151', 	'Medical and Diagnostic Laboratories', 	'621511', 	'Medical Laboratories ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6215', 	'Medical and Diagnostic Laboratories', 	'62151', 	'Medical and Diagnostic Laboratories', 	'621512', 	'Diagnostic Imaging Centers ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6216', 	'Home Health Care Services', 	'62161', 	'Home Health Care Services', 	'621610', 	'Home Health Care Services', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6219', 	'Other Ambulatory Health Care Services', 	'62191', 	'Ambulance Services', 	'621910', 	'Ambulance Services ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6219', 	'Other Ambulatory Health Care Services', 	'62199', 	'All Other Ambulatory Health Care Services', 	'621991', 	'Blood and Organ Banks ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'621', 	'Ambulatory Health Care Services', 	'6219', 	'Other Ambulatory Health Care Services', 	'62199', 	'All Other Ambulatory Health Care Services', 	'621999', 	'All Other Miscellaneous Ambulatory Health Care Services ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'622', 	'Hospitals', 	'6221', 	'General Medical and Surgical Hospitals', 	'62211', 	'General Medical and Surgical Hospitals', 	'622110', 	'General Medical and Surgical Hospitals ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'622', 	'Hospitals', 	'6222', 	'Psychiatric and Substance Abuse Hospitals', 	'62221', 	'Psychiatric and Substance Abuse Hospitals', 	'622210', 	'Psychiatric and Substance Abuse Hospitals ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'622', 	'Hospitals', 	'6223', 	'Specialty (except Psychiatric and Substance Abuse) Hospitals', 	'62231', 	'Specialty (except Psychiatric and Substance Abuse) Hospitals', 	'622310', 	'Specialty (except Psychiatric and Substance Abuse) Hospitals ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'623', 	'Nursing and Residential Care Facilities', 	'6231', 	'Nursing Care Facilities (Skilled Nursing Facilities)', 	'62311', 	'Nursing Care Facilities (Skilled Nursing Facilities)', 	'623110', 	'Nursing Care Facilities (Skilled Nursing Facilities) ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'623', 	'Nursing and Residential Care Facilities', 	'6232', 	'Residential Intellectual and Developmental Disability, Mental Health, and Substance Abuse Facilities', 	'62321', 	'Residential Intellectual and Developmental Disability Facilities', 	'623210', 	'Residential Intellectual and Developmental Disability Facilities ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'623', 	'Nursing and Residential Care Facilities', 	'6232', 	'Residential Intellectual and Developmental Disability, Mental Health, and Substance Abuse Facilities', 	'62322', 	'Residential Mental Health and Substance Abuse Facilities', 	'623220', 	'Residential Mental Health and Substance Abuse Facilities ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'623', 	'Nursing and Residential Care Facilities', 	'6233', 	'Continuing Care Retirement Communities and Assisted Living Facilities for the Elderly', 	'62331', 	'Continuing Care Retirement Communities and Assisted Living Facilities for the Elderly', 	'623311', 	'Continuing Care Retirement Communities ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'623', 	'Nursing and Residential Care Facilities', 	'6233', 	'Continuing Care Retirement Communities and Assisted Living Facilities for the Elderly', 	'62331', 	'Continuing Care Retirement Communities and Assisted Living Facilities for the Elderly', 	'623312', 	'Assisted Living Facilities for the Elderly ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'623', 	'Nursing and Residential Care Facilities', 	'6239', 	'Other Residential Care Facilities', 	'62399', 	'Other Residential Care Facilities', 	'623990', 	'Other Residential Care Facilities ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'624', 	'Social Assistance', 	'6241', 	'Individual and Family Services', 	'62411', 	'Child and Youth Services', 	'624110', 	'Child and Youth Services ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'624', 	'Social Assistance', 	'6241', 	'Individual and Family Services', 	'62412', 	'Services for the Elderly and Persons with Disabilities', 	'624120', 	'Services for the Elderly and Persons with Disabilities ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'624', 	'Social Assistance', 	'6241', 	'Individual and Family Services', 	'62419', 	'Other Individual and Family Services', 	'624190', 	'Other Individual and Family Services ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'624', 	'Social Assistance', 	'6242', 	'Community Food and Housing, and Emergency and Other Relief Services', 	'62421', 	'Community Food Services', 	'624210', 	'Community Food Services ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'624', 	'Social Assistance', 	'6242', 	'Community Food and Housing, and Emergency and Other Relief Services', 	'62422', 	'Community Housing Services', 	'624221', 	'Temporary Shelters ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'624', 	'Social Assistance', 	'6242', 	'Community Food and Housing, and Emergency and Other Relief Services', 	'62422', 	'Community Housing Services', 	'624229', 	'Other Community Housing Services ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'624', 	'Social Assistance', 	'6242', 	'Community Food and Housing, and Emergency and Other Relief Services', 	'62423', 	'Emergency and Other Relief Services', 	'624230', 	'Emergency and Other Relief Services ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'624', 	'Social Assistance', 	'6243', 	'Vocational Rehabilitation Services', 	'62431', 	'Vocational Rehabilitation Services', 	'624310', 	'Vocational Rehabilitation Services ', 	'2022'),
('62', 	'Health Care and Social Assistance', 	'624', 	'Social Assistance', 	'6244', 	'Child Care Services', 	'62441', 	'Child Care Services', 	'624410', 	'Child Care Services ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'711', 	'Performing Arts, Spectator Sports, and Related Industries', 	'7111', 	'Performing Arts Companies', 	'71111', 	'Theater Companies and Dinner Theaters', 	'711110', 	'Theater Companies and Dinner Theaters ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'711', 	'Performing Arts, Spectator Sports, and Related Industries', 	'7111', 	'Performing Arts Companies', 	'71112', 	'Dance Companies', 	'711120', 	'Dance Companies ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'711', 	'Performing Arts, Spectator Sports, and Related Industries', 	'7111', 	'Performing Arts Companies', 	'71113', 	'Musical Groups and Artists', 	'711130', 	'Musical Groups and Artists ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'711', 	'Performing Arts, Spectator Sports, and Related Industries', 	'7111', 	'Performing Arts Companies', 	'71119', 	'Other Performing Arts Companies', 	'711190', 	'Other Performing Arts Companies ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'711', 	'Performing Arts, Spectator Sports, and Related Industries', 	'7112', 	'Spectator Sports', 	'71121', 	'Spectator Sports', 	'711211', 	'Sports Teams and Clubs ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'711', 	'Performing Arts, Spectator Sports, and Related Industries', 	'7112', 	'Spectator Sports', 	'71121', 	'Spectator Sports', 	'711212', 	'Racetracks ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'711', 	'Performing Arts, Spectator Sports, and Related Industries', 	'7112', 	'Spectator Sports', 	'71121', 	'Spectator Sports', 	'711219', 	'Other Spectator Sports ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'711', 	'Performing Arts, Spectator Sports, and Related Industries', 	'7113', 	'Promoters of Performing Arts, Sports, and Similar Events', 	'71131', 	'Promoters of Performing Arts, Sports, and Similar Events with Facilities', 	'711310', 	'Promoters of Performing Arts, Sports, and Similar Events with Facilities ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'711', 	'Performing Arts, Spectator Sports, and Related Industries', 	'7113', 	'Promoters of Performing Arts, Sports, and Similar Events', 	'71132', 	'Promoters of Performing Arts, Sports, and Similar Events without Facilities', 	'711320', 	'Promoters of Performing Arts, Sports, and Similar Events without Facilities ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'711', 	'Performing Arts, Spectator Sports, and Related Industries', 	'7114', 	'Agents and Managers for Artists, Athletes, Entertainers, and Other Public Figures', 	'71141', 	'Agents and Managers for Artists, Athletes, Entertainers, and Other Public Figures', 	'711410', 	'Agents and Managers for Artists, Athletes, Entertainers, and Other Public Figures', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'711', 	'Performing Arts, Spectator Sports, and Related Industries', 	'7115', 	'Independent Artists, Writers, and Performers', 	'71151', 	'Independent Artists, Writers, and Performers', 	'711510', 	'Independent Artists, Writers, and Performers ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'712', 	'Museums, Historical Sites, and Similar Institutions', 	'7121', 	'Museums, Historical Sites, and Similar Institutions', 	'71211', 	'Museums', 	'712110', 	'Museums ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'712', 	'Museums, Historical Sites, and Similar Institutions', 	'7121', 	'Museums, Historical Sites, and Similar Institutions', 	'71212', 	'Historical Sites', 	'712120', 	'Historical Sites', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'712', 	'Museums, Historical Sites, and Similar Institutions', 	'7121', 	'Museums, Historical Sites, and Similar Institutions', 	'71213', 	'Zoos and Botanical Gardens', 	'712130', 	'Zoos and Botanical Gardens ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'712', 	'Museums, Historical Sites, and Similar Institutions', 	'7121', 	'Museums, Historical Sites, and Similar Institutions', 	'71219', 	'Nature Parks and Other Similar Institutions', 	'712190', 	'Nature Parks and Other Similar Institutions', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'713', 	'Amusement, Gambling, and Recreation Industries', 	'7131', 	'Amusement Parks and Arcades', 	'71311', 	'Amusement and Theme Parks', 	'713110', 	'Amusement and Theme Parks ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'713', 	'Amusement, Gambling, and Recreation Industries', 	'7131', 	'Amusement Parks and Arcades', 	'71312', 	'Amusement Arcades', 	'713120', 	'Amusement Arcades', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'713', 	'Amusement, Gambling, and Recreation Industries', 	'7132', 	'Gambling Industries', 	'71321', 	'Casinos (except Casino Hotels)', 	'713210', 	'Casinos (except Casino Hotels)', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'713', 	'Amusement, Gambling, and Recreation Industries', 	'7132', 	'Gambling Industries', 	'71329', 	'Other Gambling Industries', 	'713290', 	'Other Gambling Industries ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'713', 	'Amusement, Gambling, and Recreation Industries', 	'7139', 	'Other Amusement and Recreation Industries', 	'71391', 	'Golf Courses and Country Clubs', 	'713910', 	'Golf Courses and Country Clubs', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'713', 	'Amusement, Gambling, and Recreation Industries', 	'7139', 	'Other Amusement and Recreation Industries', 	'71392', 	'Skiing Facilities', 	'713920', 	'Skiing Facilities', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'713', 	'Amusement, Gambling, and Recreation Industries', 	'7139', 	'Other Amusement and Recreation Industries', 	'71393', 	'Marinas', 	'713930', 	'Marinas', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'713', 	'Amusement, Gambling, and Recreation Industries', 	'7139', 	'Other Amusement and Recreation Industries', 	'71394', 	'Fitness and Recreational Sports Centers', 	'713940', 	'Fitness and Recreational Sports Centers ', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'713', 	'Amusement, Gambling, and Recreation Industries', 	'7139', 	'Other Amusement and Recreation Industries', 	'71395', 	'Bowling Centers', 	'713950', 	'Bowling Centers', 	'2022'),
('71', 	'Arts, Entertainment, and Recreation', 	'713', 	'Amusement, Gambling, and Recreation Industries', 	'7139', 	'Other Amusement and Recreation Industries', 	'71399', 	'All Other Amusement and Recreation Industries', 	'713990', 	'All Other Amusement and Recreation Industries ', 	'2022'),
('72', 	'Accommodation and Food Services', 	'721', 	'Accommodation', 	'7211', 	'Traveler Accommodation', 	'72111', 	'Hotels (except Casino Hotels) and Motels', 	'721110', 	'Hotels (except Casino Hotels) and Motels ', 	'2022'),
('72', 	'Accommodation and Food Services', 	'721', 	'Accommodation', 	'7211', 	'Traveler Accommodation', 	'72112', 	'Casino Hotels', 	'721120', 	'Casino Hotels', 	'2022'),
('72', 	'Accommodation and Food Services', 	'721', 	'Accommodation', 	'7211', 	'Traveler Accommodation', 	'72119', 	'Other Traveler Accommodation', 	'721191', 	'Bed-and-Breakfast Inns ', 	'2022'),
('72', 	'Accommodation and Food Services', 	'721', 	'Accommodation', 	'7211', 	'Traveler Accommodation', 	'72119', 	'Other Traveler Accommodation', 	'721199', 	'All Other Traveler Accommodation ', 	'2022'),
('72', 	'Accommodation and Food Services', 	'721', 	'Accommodation', 	'7212', 	'RV (Recreational Vehicle) Parks and Recreational Camps', 	'72121', 	'RV (Recreational Vehicle) Parks and Recreational Camps', 	'721211', 	'RV (Recreational Vehicle) Parks and Campgrounds ', 	'2022'),
('72', 	'Accommodation and Food Services', 	'721', 	'Accommodation', 	'7212', 	'RV (Recreational Vehicle) Parks and Recreational Camps', 	'72121', 	'RV (Recreational Vehicle) Parks and Recreational Camps', 	'721214', 	'Recreational and Vacation Camps (except Campgrounds) ', 	'2022'),
('72', 	'Accommodation and Food Services', 	'721', 	'Accommodation', 	'7213', 	'Rooming and Boarding Houses, Dormitories, and Workers'' Camps', 	'72131', 	'Rooming and Boarding Houses, Dormitories, and Workers'' Camps', 	'721310', 	'Rooming and Boarding Houses, Dormitories, and Workers'' Camps ', 	'2022'),
('72', 	'Accommodation and Food Services', 	'722', 	'Food Services and Drinking Places', 	'7223', 	'Special Food Services', 	'72231', 	'Food Service Contractors', 	'722310', 	'Food Service Contractors', 	'2022'),
('72', 	'Accommodation and Food Services', 	'722', 	'Food Services and Drinking Places', 	'7223', 	'Special Food Services', 	'72232', 	'Caterers', 	'722320', 	'Caterers', 	'2022'),
('72', 	'Accommodation and Food Services', 	'722', 	'Food Services and Drinking Places', 	'7223', 	'Special Food Services', 	'72233', 	'Mobile Food Services', 	'722330', 	'Mobile Food Services', 	'2022'),
('72', 	'Accommodation and Food Services', 	'722', 	'Food Services and Drinking Places', 	'7224', 	'Drinking Places (Alcoholic Beverages)', 	'72241', 	'Drinking Places (Alcoholic Beverages)', 	'722410', 	'Drinking Places (Alcoholic Beverages) ', 	'2022'),
('72', 	'Accommodation and Food Services', 	'722', 	'Food Services and Drinking Places', 	'7225', 	'Restaurants and Other Eating Places', 	'72251', 	'Restaurants and Other Eating Places', 	'722511', 	'Full-Service Restaurants ', 	'2022'),
('72', 	'Accommodation and Food Services', 	'722', 	'Food Services and Drinking Places', 	'7225', 	'Restaurants and Other Eating Places', 	'72251', 	'Restaurants and Other Eating Places', 	'722513', 	'Limited-Service Restaurants ', 	'2022'),
('72', 	'Accommodation and Food Services', 	'722', 	'Food Services and Drinking Places', 	'7225', 	'Restaurants and Other Eating Places', 	'72251', 	'Restaurants and Other Eating Places', 	'722514', 	'Cafeterias, Grill Buffets, and Buffets ', 	'2022'),
('72', 	'Accommodation and Food Services', 	'722', 	'Food Services and Drinking Places', 	'7225', 	'Restaurants and Other Eating Places', 	'72251', 	'Restaurants and Other Eating Places', 	'722515', 	'Snack and Nonalcoholic Beverage Bars ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'811', 	'Repair and Maintenance', 	'8111', 	'Automotive Repair and Maintenance', 	'81111', 	'Automotive Mechanical and Electrical Repair and Maintenance', 	'811111', 	'General Automotive Repair ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'811', 	'Repair and Maintenance', 	'8111', 	'Automotive Repair and Maintenance', 	'81111', 	'Automotive Mechanical and Electrical Repair and Maintenance', 	'811114', 	'Specialized Automotive Repair ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'811', 	'Repair and Maintenance', 	'8111', 	'Automotive Repair and Maintenance', 	'81112', 	'Automotive Body, Paint, Interior, and Glass Repair', 	'811121', 	'Automotive Body, Paint, and Interior Repair and Maintenance ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'811', 	'Repair and Maintenance', 	'8111', 	'Automotive Repair and Maintenance', 	'81112', 	'Automotive Body, Paint, Interior, and Glass Repair', 	'811122', 	'Automotive Glass Replacement Shops ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'811', 	'Repair and Maintenance', 	'8111', 	'Automotive Repair and Maintenance', 	'81119', 	'Other Automotive Repair and Maintenance', 	'811191', 	'Automotive Oil Change and Lubrication Shops ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'811', 	'Repair and Maintenance', 	'8111', 	'Automotive Repair and Maintenance', 	'81119', 	'Other Automotive Repair and Maintenance', 	'811192', 	'Car Washes ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'811', 	'Repair and Maintenance', 	'8111', 	'Automotive Repair and Maintenance', 	'81119', 	'Other Automotive Repair and Maintenance', 	'811198', 	'All Other Automotive Repair and Maintenance ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'811', 	'Repair and Maintenance', 	'8112', 	'Electronic and Precision Equipment Repair and Maintenance', 	'81121', 	'Electronic and Precision Equipment Repair and Maintenance', 	'811210', 	'Electronic and Precision Equipment Repair and Maintenance ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'811', 	'Repair and Maintenance', 	'8113', 	'Commercial and Industrial Machinery and Equipment (except Automotive and Electronic) Repair and Maintenance', 	'81131', 	'Commercial and Industrial Machinery and Equipment (except Automotive and Electronic) Repair and Maintenance', 	'811310', 	'Commercial and Industrial Machinery and Equipment (except Automotive and Electronic) Repair and Maintenance ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'811', 	'Repair and Maintenance', 	'8114', 	'Personal and Household Goods Repair and Maintenance', 	'81141', 	'Home and Garden Equipment and Appliance Repair and Maintenance', 	'811411', 	'Home and Garden Equipment Repair and Maintenance ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'811', 	'Repair and Maintenance', 	'8114', 	'Personal and Household Goods Repair and Maintenance', 	'81141', 	'Home and Garden Equipment and Appliance Repair and Maintenance', 	'811412', 	'Appliance Repair and Maintenance ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'811', 	'Repair and Maintenance', 	'8114', 	'Personal and Household Goods Repair and Maintenance', 	'81142', 	'Reupholstery and Furniture Repair', 	'811420', 	'Reupholstery and Furniture Repair', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'811', 	'Repair and Maintenance', 	'8114', 	'Personal and Household Goods Repair and Maintenance', 	'81143', 	'Footwear and Leather Goods Repair', 	'811430', 	'Footwear and Leather Goods Repair', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'811', 	'Repair and Maintenance', 	'8114', 	'Personal and Household Goods Repair and Maintenance', 	'81149', 	'Other Personal and Household Goods Repair and Maintenance', 	'811490', 	'Other Personal and Household Goods Repair and Maintenance ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8121', 	'Personal Care Services ', 	'81211', 	'Hair, Nail, and Skin Care Services ', 	'812111', 	'Barber Shops ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8121', 	'Personal Care Services ', 	'81211', 	'Hair, Nail, and Skin Care Services ', 	'812112', 	'Beauty Salons ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8121', 	'Personal Care Services ', 	'81211', 	'Hair, Nail, and Skin Care Services ', 	'812113', 	'Nail Salons ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8121', 	'Personal Care Services ', 	'81219', 	'Other Personal Care Services ', 	'812191', 	'Diet and Weight Reducing Centers ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8121', 	'Personal Care Services ', 	'81219', 	'Other Personal Care Services ', 	'812199', 	'Other Personal Care Services ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8122', 	'Death Care Services ', 	'81221', 	'Funeral Homes and Funeral Services ', 	'812210', 	'Funeral Homes and Funeral Services ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8122', 	'Death Care Services ', 	'81222', 	'Cemeteries and Crematories ', 	'812220', 	'Cemeteries and Crematories ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8123', 	'Drycleaning and Laundry Services ', 	'81231', 	'Coin-Operated Laundries and Drycleaners ', 	'812310', 	'Coin-Operated Laundries and Drycleaners ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8123', 	'Drycleaning and Laundry Services ', 	'81232', 	'Drycleaning and Laundry Services (except Coin-Operated) ', 	'812320', 	'Drycleaning and Laundry Services (except Coin-Operated) ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8123', 	'Drycleaning and Laundry Services ', 	'81233', 	'Linen and Uniform Supply ', 	'812331', 	'Linen Supply ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8123', 	'Drycleaning and Laundry Services ', 	'81233', 	'Linen and Uniform Supply ', 	'812332', 	'Industrial Launderers ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8129', 	'Other Personal Services ', 	'81291', 	'Pet Care (except Veterinary) Services ', 	'812910', 	'Pet Care (except Veterinary) Services ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8129', 	'Other Personal Services ', 	'81292', 	'Photofinishing ', 	'812921', 	'Photofinishing Laboratories (except One-Hour) ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8129', 	'Other Personal Services ', 	'81292', 	'Photofinishing ', 	'812922', 	'One-Hour Photofinishing ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8129', 	'Other Personal Services ', 	'81293', 	'Parking Lots and Garages ', 	'812930', 	'Parking Lots and Garages ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'812', 	'Personal and Laundry Services', 	'8129', 	'Other Personal Services ', 	'81299', 	'All Other Personal Services ', 	'812990', 	'All Other Personal Services ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'813', 	'Religious, Grantmaking, Civic, Professional, and Similar Organizations', 	'8131', 	'Religious Organizations ', 	'81311', 	'Religious Organizations ', 	'813110', 	'Religious Organizations ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'813', 	'Religious, Grantmaking, Civic, Professional, and Similar Organizations', 	'8132', 	'Grantmaking and Giving Services ', 	'81321', 	'Grantmaking and Giving Services ', 	'813211', 	'Grantmaking Foundations ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'813', 	'Religious, Grantmaking, Civic, Professional, and Similar Organizations', 	'8132', 	'Grantmaking and Giving Services ', 	'81321', 	'Grantmaking and Giving Services ', 	'813212', 	'Voluntary Health Organizations ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'813', 	'Religious, Grantmaking, Civic, Professional, and Similar Organizations', 	'8132', 	'Grantmaking and Giving Services ', 	'81321', 	'Grantmaking and Giving Services ', 	'813219', 	'Other Grantmaking and Giving Services ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'813', 	'Religious, Grantmaking, Civic, Professional, and Similar Organizations', 	'8133', 	'Social Advocacy Organizations ', 	'81331', 	'Social Advocacy Organizations ', 	'813311', 	'Human Rights Organizations ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'813', 	'Religious, Grantmaking, Civic, Professional, and Similar Organizations', 	'8133', 	'Social Advocacy Organizations ', 	'81331', 	'Social Advocacy Organizations ', 	'813312', 	'Environment, Conservation and Wildlife Organizations ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'813', 	'Religious, Grantmaking, Civic, Professional, and Similar Organizations', 	'8133', 	'Social Advocacy Organizations ', 	'81331', 	'Social Advocacy Organizations ', 	'813319', 	'Other Social Advocacy Organizations ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'813', 	'Religious, Grantmaking, Civic, Professional, and Similar Organizations', 	'8134', 	'Civic and Social Organizations ', 	'81341', 	'Civic and Social Organizations ', 	'813410', 	'Civic and Social Organizations ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'813', 	'Religious, Grantmaking, Civic, Professional, and Similar Organizations', 	'8139', 	'Business, Professional, Labor, Political, and Similar Organizations ', 	'81391', 	'Business Associations ', 	'813910', 	'Business Associations ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'813', 	'Religious, Grantmaking, Civic, Professional, and Similar Organizations', 	'8139', 	'Business, Professional, Labor, Political, and Similar Organizations ', 	'81392', 	'Professional Organizations ', 	'813920', 	'Professional Organizations ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'813', 	'Religious, Grantmaking, Civic, Professional, and Similar Organizations', 	'8139', 	'Business, Professional, Labor, Political, and Similar Organizations ', 	'81393', 	'Labor Unions and Similar Labor Organizations ', 	'813930', 	'Labor Unions and Similar Labor Organizations ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'813', 	'Religious, Grantmaking, Civic, Professional, and Similar Organizations', 	'8139', 	'Business, Professional, Labor, Political, and Similar Organizations ', 	'81394', 	'Political Organizations ', 	'813940', 	'Political Organizations ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'813', 	'Religious, Grantmaking, Civic, Professional, and Similar Organizations', 	'8139', 	'Business, Professional, Labor, Political, and Similar Organizations ', 	'81399', 	'Other Similar Organizations (except Business, Professional, Labor, and Political Organizations) ', 	'813990', 	'Other Similar Organizations (except Business, Professional, Labor, and Political Organizations) ', 	'2022'),
('81', 	'Other Services (except Public Administration)', 	'814', 	'Private Households', 	'8141', 	'Private Households', 	'81411', 	'Private Households', 	'814110', 	'Private Households', 	'2022'),
('92', 	'Public Administration', 	'921', 	'Executive, Legislative, and Other General Government Support ', 	'9211', 	'Executive, Legislative, and Other General Government Support ', 	'92111', 	'Executive Offices ', 	'921110', 	'Executive Offices ', 	'2022'),
('92', 	'Public Administration', 	'921', 	'Executive, Legislative, and Other General Government Support ', 	'9211', 	'Executive, Legislative, and Other General Government Support ', 	'92112', 	'Legislative Bodies ', 	'921120', 	'Legislative Bodies ', 	'2022'),
('92', 	'Public Administration', 	'921', 	'Executive, Legislative, and Other General Government Support ', 	'9211', 	'Executive, Legislative, and Other General Government Support ', 	'92113', 	'Public Finance Activities ', 	'921130', 	'Public Finance Activities ', 	'2022'),
('92', 	'Public Administration', 	'921', 	'Executive, Legislative, and Other General Government Support ', 	'9211', 	'Executive, Legislative, and Other General Government Support ', 	'92114', 	'Executive and Legislative Offices, Combined ', 	'921140', 	'Executive and Legislative Offices, Combined ', 	'2022'),
('92', 	'Public Administration', 	'921', 	'Executive, Legislative, and Other General Government Support ', 	'9211', 	'Executive, Legislative, and Other General Government Support ', 	'92115', 	'American Indian and Alaska Native Tribal Governments ', 	'921150', 	'American Indian and Alaska Native Tribal Governments ', 	'2022'),
('92', 	'Public Administration', 	'921', 	'Executive, Legislative, and Other General Government Support ', 	'9211', 	'Executive, Legislative, and Other General Government Support ', 	'92119', 	'Other General Government Support ', 	'921190', 	'Other General Government Support ', 	'2022'),
('92', 	'Public Administration', 	'922', 	'Justice, Public Order, and Safety Activities ', 	'9221', 	'Justice, Public Order, and Safety Activities ', 	'92211', 	'Courts ', 	'922110', 	'Courts ', 	'2022'),
('92', 	'Public Administration', 	'922', 	'Justice, Public Order, and Safety Activities ', 	'9221', 	'Justice, Public Order, and Safety Activities ', 	'92212', 	'Police Protection ', 	'922120', 	'Police Protection ', 	'2022'),
('92', 	'Public Administration', 	'922', 	'Justice, Public Order, and Safety Activities ', 	'9221', 	'Justice, Public Order, and Safety Activities ', 	'92213', 	'Legal Counsel and Prosecution ', 	'922130', 	'Legal Counsel and Prosecution ', 	'2022'),
('92', 	'Public Administration', 	'922', 	'Justice, Public Order, and Safety Activities ', 	'9221', 	'Justice, Public Order, and Safety Activities ', 	'92214', 	'Correctional Institutions ', 	'922140', 	'Correctional Institutions ', 	'2022'),
('92', 	'Public Administration', 	'922', 	'Justice, Public Order, and Safety Activities ', 	'9221', 	'Justice, Public Order, and Safety Activities ', 	'92215', 	'Parole Offices and Probation Offices ', 	'922150', 	'Parole Offices and Probation Offices ', 	'2022'),
('92', 	'Public Administration', 	'922', 	'Justice, Public Order, and Safety Activities ', 	'9221', 	'Justice, Public Order, and Safety Activities ', 	'92216', 	'Fire Protection ', 	'922160', 	'Fire Protection ', 	'2022'),
('92', 	'Public Administration', 	'922', 	'Justice, Public Order, and Safety Activities ', 	'9221', 	'Justice, Public Order, and Safety Activities ', 	'92219', 	'Other Justice, Public Order, and Safety Activities ', 	'922190', 	'Other Justice, Public Order, and Safety Activities ', 	'2022'),
('92', 	'Public Administration', 	'923', 	'Administration of Human Resource Programs ', 	'9231', 	'Administration of Human Resource Programs ', 	'92311', 	'Administration of Education Programs ', 	'923110', 	'Administration of Education Programs ', 	'2022'),
('92', 	'Public Administration', 	'923', 	'Administration of Human Resource Programs ', 	'9231', 	'Administration of Human Resource Programs ', 	'92312', 	'Administration of Public Health Programs ', 	'923120', 	'Administration of Public Health Programs ', 	'2022'),
('92', 	'Public Administration', 	'923', 	'Administration of Human Resource Programs ', 	'9231', 	'Administration of Human Resource Programs ', 	'92313', 	'Administration of Human Resource Programs (except Education, Public Health, and Veterans'' Affairs Programs) ', 	'923130', 	'Administration of Human Resource Programs (except Education, Public Health, and Veterans'' Affairs Programs) ', 	'2022'),
('92', 	'Public Administration', 	'923', 	'Administration of Human Resource Programs ', 	'9231', 	'Administration of Human Resource Programs ', 	'92314', 	'Administration of Veterans'' Affairs ', 	'923140', 	'Administration of Veterans'' Affairs ', 	'2022'),
('92', 	'Public Administration', 	'924', 	'Administration of Environmental Quality Programs ', 	'9241', 	'Administration of Environmental Quality Programs ', 	'92411', 	'Administration of Air and Water Resource and Solid Waste Management Programs ', 	'924110', 	'Administration of Air and Water Resource and Solid Waste Management Programs ', 	'2022'),
('92', 	'Public Administration', 	'924', 	'Administration of Environmental Quality Programs ', 	'9241', 	'Administration of Environmental Quality Programs ', 	'92412', 	'Administration of Conservation Programs ', 	'924120', 	'Administration of Conservation Programs ', 	'2022'),
('92', 	'Public Administration', 	'925', 	'Administration of Housing Programs, Urban Planning, and Community Development ', 	'9251', 	'Administration of Housing Programs, Urban Planning, and Community Development ', 	'92511', 	'Administration of Housing Programs ', 	'925110', 	'Administration of Housing Programs ', 	'2022'),
('92', 	'Public Administration', 	'925', 	'Administration of Housing Programs, Urban Planning, and Community Development ', 	'9251', 	'Administration of Housing Programs, Urban Planning, and Community Development ', 	'92512', 	'Administration of Urban Planning and Community and Rural Development ', 	'925120', 	'Administration of Urban Planning and Community and Rural Development ', 	'2022'),
('92', 	'Public Administration', 	'926', 	'Administration of Economic Programs ', 	'9261', 	'Administration of Economic Programs ', 	'92611', 	'Administration of General Economic Programs ', 	'926110', 	'Administration of General Economic Programs ', 	'2022'),
('92', 	'Public Administration', 	'926', 	'Administration of Economic Programs ', 	'9261', 	'Administration of Economic Programs ', 	'92612', 	'Regulation and Administration of Transportation Programs ', 	'926120', 	'Regulation and Administration of Transportation Programs ', 	'2022'),
('92', 	'Public Administration', 	'926', 	'Administration of Economic Programs ', 	'9261', 	'Administration of Economic Programs ', 	'92613', 	'Regulation and Administration of Communications, Electric, Gas, and Other Utilities ', 	'926130', 	'Regulation and Administration of Communications, Electric, Gas, and Other Utilities ', 	'2022'),
('92', 	'Public Administration', 	'926', 	'Administration of Economic Programs ', 	'9261', 	'Administration of Economic Programs ', 	'92614', 	'Regulation of Agricultural Marketing and Commodities ', 	'926140', 	'Regulation of Agricultural Marketing and Commodities ', 	'2022'),
('92', 	'Public Administration', 	'926', 	'Administration of Economic Programs ', 	'9261', 	'Administration of Economic Programs ', 	'92615', 	'Regulation, Licensing, and Inspection of Miscellaneous Commercial Sectors ', 	'926150', 	'Regulation, Licensing, and Inspection of Miscellaneous Commercial Sectors ', 	'2022'),
('92', 	'Public Administration', 	'927', 	'Space Research and Technology ', 	'9271', 	'Space Research and Technology ', 	'92711', 	'Space Research and Technology ', 	'927110', 	'Space Research and Technology ', 	'2022'),
('92', 	'Public Administration', 	'928', 	'National Security and International Affairs ', 	'9281', 	'National Security and International Affairs ', 	'92811', 	'National Security ', 	'928110', 	'National Security ', 	'2022'),
('92', 	'Public Administration', 	'928', 	'National Security and International Affairs ', 	'9281', 	'National Security and International Affairs ', 	'92812', 	'International Affairs ', 	'928120', 	'International Affairs ', 	'2022')


	PRINT 'Populate DimAeEmploymentBarriers'
	------------------------------------------------------
	-- Populate DimAeEmploymentBarriers  ---
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAeEmploymentBarriers d WHERE d.DimAeEmploymentBarrierId = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimAeEmploymentBarriers ON

		INSERT INTO [RDS].[DimAeEmploymentBarriers]
			   ([DimAeEmploymentBarrierId]
			   ,[WIOABarrierstoEmploymentCode]
			   ,[WIOABarrierstoEmploymentDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimAeEmploymentBarriers OFF

	END

	IF OBJECT_ID('tempdb..#WIOABarrierstoEmployment') IS NOT NULL
		DROP TABLE #WIOABarrierstoEmployment

	CREATE TABLE #WIOABarrierstoEmployment (WIOABarrierstoEmploymentCode VARCHAR(50), WIOABarrierstoEmploymentDescription VARCHAR(200))

	INSERT INTO #WIOABarrierstoEmployment VALUES ('MISSING', 'MISSING')
	INSERT INTO #WIOABarrierstoEmployment 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'WIOABarrierstoEmployment'


	INSERT INTO [RDS].[DimAeEmploymentBarriers]
			([WIOABarrierstoEmploymentCode]
			,[WIOABarrierstoEmploymentDescription])
	SELECT DISTINCT
		  a.WIOABarrierstoEmploymentCode
		, a.WIOABarrierstoEmploymentDescription
	FROM #WIOABarrierstoEmployment a
	LEFT JOIN RDS.DimAeEmploymentBarriers main
		ON a.WIOABarrierstoEmploymentCode = main.WIOABarrierstoEmploymentCode
	WHERE main.DimAeEmploymentBarrierId IS NULL

	DROP TABLE #WIOABarrierstoEmployment



	PRINT 'Populate DimAeProgramEmploymentIndicators'
	-------------------------------------------------------------------
	-- Populate DimAeProgramEmploymentIndicators  ---
	-------------------------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAeProgramEmploymentIndicators d WHERE d.DimAeProgramEmploymentIndicatorId = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimAeProgramEmploymentIndicators ON

		INSERT INTO [RDS].[DimAeProgramEmploymentIndicators]
			   ([DimAeProgramEmploymentIndicatorId]
			   ,[EmployedAfterExitCode]
			   ,[EmployedAfterExitDescription]
			   ,[EmployedWhileEnrolledCode]
			   ,[EmployedWhileEnrolledDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimAeProgramEmploymentIndicators OFF

	END

	IF OBJECT_ID('tempdb..#EmployedAfterExit') IS NOT NULL
		DROP TABLE #EmployedAfterExit

	CREATE TABLE #EmployedAfterExit (EmployedAfterExitCode VARCHAR(50), EmployedAfterExitDescription VARCHAR(200))

	INSERT INTO #EmployedAfterExit VALUES ('MISSING', 'MISSING')
	INSERT INTO #EmployedAfterExit 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EmployedAfterExit'

	IF OBJECT_ID('tempdb..#EmployedWhileEnrolled') IS NOT NULL
		DROP TABLE #EmployedWhileEnrolled

	CREATE TABLE #EmployedWhileEnrolled (EmployedWhileEnrolledCode VARCHAR(50), EmployedWhileEnrolledDescription VARCHAR(200))

	INSERT INTO #EmployedWhileEnrolled VALUES ('MISSING', 'MISSING')
	INSERT INTO #EmployedWhileEnrolled 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EmployedWhileEnrolled'


	INSERT INTO [RDS].[DimAeProgramEmploymentIndicators]
			([EmployedAfterExitCode]
			,[EmployedAfterExitDescription]
			,[EmployedWhileEnrolledCode]
			,[EmployedWhileEnrolledDescription])
	SELECT DISTINCT
		  a.EmployedAfterExitCode
		, a.EmployedAfterExitDescription
		, b.EmployedWhileEnrolledCode
		, b.EmployedWhileEnrolledDescription
	FROM #EmployedAfterExit a
	CROSS JOIN #EmployedWhileEnrolled b
	LEFT JOIN RDS.DimAeProgramEmploymentIndicators main
		ON a.EmployedAfterExitCode = main.EmployedAfterExitCode
		AND b.EmployedWhileEnrolledCode = main.EmployedWhileEnrolledCode
	WHERE main.DimAeProgramEmploymentIndicatorId IS NULL

	DROP TABLE #EmployedAfterExit
	DROP TABLE #EmployedWhileEnrolled



	PRINT 'Populate DimAeProgramParticipantAssessmentIndicators'
	--------------------------------------------------------------------------------
	-- Populate DimAeProgramParticipantAssessmentIndicators  ---
	--------------------------------------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAeProgramParticipantAssessmentIndicators d WHERE d.DimAeProgramParticipantAssessmentIndicatorId = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimAeProgramParticipantAssessmentIndicators ON

		INSERT INTO [RDS].[DimAeProgramParticipantAssessmentIndicators]
			   ([DimAeProgramParticipantAssessmentIndicatorId]
			   ,[AeFunctioningLevelAtIntakeCode]
			   ,[AeFunctioningLevelAtIntakeDescription]
			   ,[AeFunctioningLevelAtPosttestCode]
			   ,[AeFunctioningLevelAtPosttestDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimAeProgramParticipantAssessmentIndicators OFF

	END

	IF OBJECT_ID('tempdb..#AeFunctioningLevelAtIntake') IS NOT NULL
		DROP TABLE #AeFunctioningLevelAtIntake

	CREATE TABLE #AeFunctioningLevelAtIntake (AeFunctioningLevelAtIntakeCode VARCHAR(50), AeFunctioningLevelAtIntakeDescription VARCHAR(200))

	INSERT INTO #AeFunctioningLevelAtIntake VALUES ('MISSING', 'MISSING')
	INSERT INTO #AeFunctioningLevelAtIntake 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AeFunctioningLevelAtIntake'

	IF OBJECT_ID('tempdb..#AeFunctioningLevelAtPosttest') IS NOT NULL
		DROP TABLE #AeFunctioningLevelAtPosttest

	CREATE TABLE #AeFunctioningLevelAtPosttest (AeFunctioningLevelAtPosttestCode VARCHAR(50), AeFunctioningLevelAtPosttestDescription VARCHAR(200))

	INSERT INTO #AeFunctioningLevelAtPosttest VALUES ('MISSING', 'MISSING')
	INSERT INTO #AeFunctioningLevelAtPosttest 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AeFunctioningLevelAtPosttest'


	INSERT INTO [RDS].[DimAeProgramParticipantAssessmentIndicators]
			([AeFunctioningLevelAtIntakeCode]
			,[AeFunctioningLevelAtIntakeDescription]
			,[AeFunctioningLevelAtPosttestCode]
			,[AeFunctioningLevelAtPosttestDescription])
	SELECT DISTINCT
		  a.AeFunctioningLevelAtIntakeCode
		, a.AeFunctioningLevelAtIntakeDescription
		, b.AeFunctioningLevelAtPosttestCode
		, b.AeFunctioningLevelAtPosttestDescription
	FROM #AeFunctioningLevelAtIntake a
	CROSS JOIN #AeFunctioningLevelAtPosttest b
	LEFT JOIN RDS.DimAeProgramParticipantAssessmentIndicators main
		ON a.AeFunctioningLevelAtIntakeCode = main.AeFunctioningLevelAtIntakeCode
		AND b.AeFunctioningLevelAtPosttestCode = main.AeFunctioningLevelAtPosttestDescription
	WHERE main.DimAeProgramParticipantAssessmentIndicatorId IS NULL

	DROP TABLE #AeFunctioningLevelAtIntake
	DROP TABLE #AeFunctioningLevelAtPosttest


	PRINT 'Populate DimAeProgramParticipantGoals'
	-----------------------------------------------------------
	-- Populate DimAeProgramParticipantGoals  ---
	-----------------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAeProgramParticipantGoals d WHERE d.DimAeProgramParticipantGoalId = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimAeProgramParticipantGoals ON

		INSERT INTO [RDS].[DimAeProgramParticipantGoals]
			   ([DimAeProgramParticipantGoalId]
			   ,[GoalsForAttendingAdultEducationCode]
			   ,[GoalsForAttendingAdultEducationDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimAeProgramParticipantGoals OFF

	END

	IF OBJECT_ID('tempdb..#GoalsForAttendingAdultEducation') IS NOT NULL
		DROP TABLE #GoalsForAttendingAdultEducation

	CREATE TABLE #GoalsForAttendingAdultEducation (GoalsForAttendingAdultEducationCode VARCHAR(50), GoalsForAttendingAdultEducationDescription VARCHAR(200))

	INSERT INTO #GoalsForAttendingAdultEducation VALUES ('MISSING', 'MISSING')
	INSERT INTO #GoalsForAttendingAdultEducation 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'GoalsForAttendingAdultEducation'


	INSERT INTO [RDS].[DimAeProgramParticipantGoals]
			([GoalsForAttendingAdultEducationCode]
			,[GoalsForAttendingAdultEducationDescription])
	SELECT DISTINCT
		  a.GoalsForAttendingAdultEducationCode
		, a.GoalsForAttendingAdultEducationDescription
	FROM #GoalsForAttendingAdultEducation a
	LEFT JOIN RDS.DimAeProgramParticipantGoals main
		ON a.GoalsForAttendingAdultEducationCode = main.GoalsForAttendingAdultEducationCode
	WHERE main.DimAeProgramParticipantGoalId IS NULL

	DROP TABLE #GoalsForAttendingAdultEducation


	PRINT 'Populate DimAeProgramParticipantIndicators'
	-----------------------------------------------------------------
	-- Populate DimAeProgramParticipantIndicators  ---
	-----------------------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAeProgramParticipantIndicators d WHERE d.DimAeProgramParticipantIndicatorId = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimAeProgramParticipantIndicators ON

		INSERT INTO [RDS].[DimAeProgramParticipantIndicators]
			   ([DimAeProgramParticipantIndicatorId]
			   ,[CorrectionalEducationReentryServicesParticipationIndicatorCode]
			   ,[CorrectionalEducationReentryServicesParticipationIndicatorDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimAeProgramParticipantIndicators OFF

	END

	IF OBJECT_ID('tempdb..#CorrectionalEducationReentryServicesParticipationIndicator') IS NOT NULL
		DROP TABLE #CorrectionalEducationReentryServicesParticipationIndicator

	CREATE TABLE #CorrectionalEducationReentryServicesParticipationIndicator (CorrectionalEducationReentryServicesParticipationIndicatorCode VARCHAR(50), CorrectionalEducationReentryServicesParticipationIndicatorDescription VARCHAR(200))

	INSERT INTO #CorrectionalEducationReentryServicesParticipationIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #CorrectionalEducationReentryServicesParticipationIndicator 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CorrectionalEducationReentryServicesParticipationIndicator'


	INSERT INTO [RDS].[DimAeProgramParticipantIndicators]
			([CorrectionalEducationReentryServicesParticipationIndicatorCode]
			,[CorrectionalEducationReentryServicesParticipationIndicatorDescription])
	SELECT DISTINCT
		  a.CorrectionalEducationReentryServicesParticipationIndicatorCode
		, a.CorrectionalEducationReentryServicesParticipationIndicatorDescription
	FROM #CorrectionalEducationReentryServicesParticipationIndicator a
	LEFT JOIN RDS.DimAeProgramParticipantIndicators main
		ON a.CorrectionalEducationReentryServicesParticipationIndicatorCode = main.CorrectionalEducationReentryServicesParticipationIndicatorCode
	WHERE main.DimAeProgramParticipantIndicatorId IS NULL

	DROP TABLE #CorrectionalEducationReentryServicesParticipationIndicator


	PRINT 'Populate DimAeProgramTransitionIndicators'
	---------------------------------------------------------------
	-- Populate DimAeProgramTransitionIndicators  ---
	----------------------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAeProgramTransitionIndicators d WHERE d.DimAeProgramTransitionIndicatorId = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimAeProgramTransitionIndicators ON

		INSERT INTO [RDS].[DimAeProgramTransitionIndicators]
			   ([DimAeProgramTransitionIndicatorId]
			   ,[AePostsecondaryTransitionActionCode]
			   ,[AePostsecondaryTransitionActionDescription]
			   ,[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode]
			   ,[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription]
			   ,[AdultEducationCredentialAttainmentEmployedIndicatorCode]
			   ,[AdultEducationCredentialAttainmentEmployedIndicatorDescription]
			   ,[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode]
			   ,[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription]
			   ,[AdultEducationProgramExitReasonCode]
			   ,[AdultEducationProgramExitReasonDescription])
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
				)

		SET IDENTITY_INSERT RDS.DimAeProgramTransitionIndicators OFF

	END

	IF OBJECT_ID('tempdb..#AePostsecondaryTransitionAction') IS NOT NULL
		DROP TABLE #AePostsecondaryTransitionAction

	CREATE TABLE #AePostsecondaryTransitionAction (AePostsecondaryTransitionActionCode VARCHAR(50), AePostsecondaryTransitionActionDescription VARCHAR(200))

	INSERT INTO #AePostsecondaryTransitionAction VALUES ('MISSING', 'MISSING')
	INSERT INTO #AePostsecondaryTransitionAction 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AdultEducationPostsecondaryTransitionAction'

	IF OBJECT_ID('tempdb..#AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator') IS NOT NULL
		DROP TABLE #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator

	CREATE TABLE #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator (AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode VARCHAR(50), AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription VARCHAR(200))

	INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator'

	IF OBJECT_ID('tempdb..#AdultEducationCredentialAttainmentEmployedIndicator') IS NOT NULL
		DROP TABLE #AdultEducationCredentialAttainmentEmployedIndicator

	CREATE TABLE #AdultEducationCredentialAttainmentEmployedIndicator (AdultEducationCredentialAttainmentEmployedIndicatorCode VARCHAR(50), AdultEducationCredentialAttainmentEmployedIndicatorDescription VARCHAR(200))

	INSERT INTO #AdultEducationCredentialAttainmentEmployedIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #AdultEducationCredentialAttainmentEmployedIndicator 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AdultEducationCredentialAttainmentEmployedIndicator'

	IF OBJECT_ID('tempdb..#AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator') IS NOT NULL
		DROP TABLE #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator

	CREATE TABLE #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator (AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode VARCHAR(50), AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription VARCHAR(200))

	INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator'

	IF OBJECT_ID('tempdb..#AdultEducationProgramExitReason') IS NOT NULL
		DROP TABLE #AdultEducationProgramExitReason

	CREATE TABLE #AdultEducationProgramExitReason (AdultEducationProgramExitReasonCode VARCHAR(50), AdultEducationProgramExitReasonDescription VARCHAR(200))

	INSERT INTO #AdultEducationProgramExitReason VALUES ('MISSING', 'MISSING')
	INSERT INTO #AdultEducationProgramExitReason 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AdultEducationProgramExitReason'


	INSERT INTO [RDS].[DimAeProgramTransitionIndicators]
		([AePostsecondaryTransitionActionCode]
		,[AePostsecondaryTransitionActionDescription]
		,[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode]
		,[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription]
		,[AdultEducationCredentialAttainmentEmployedIndicatorCode]
		,[AdultEducationCredentialAttainmentEmployedIndicatorDescription]
		,[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode]
		,[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription]
		,[AdultEducationProgramExitReasonCode]
		,[AdultEducationProgramExitReasonDescription])
	SELECT DISTINCT
		  a.AePostsecondaryTransitionActionCode
		, a.AePostsecondaryTransitionActionDescription
		, b.AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode
		, b.AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription
		, c.AdultEducationCredentialAttainmentEmployedIndicatorCode
		, c.AdultEducationCredentialAttainmentEmployedIndicatorDescription
		, d.AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode
		, d.AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription
		, e.AdultEducationProgramExitReasonCode
		, e.AdultEducationProgramExitReasonDescription
	FROM #AePostsecondaryTransitionAction a
	CROSS JOIN #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator b
	CROSS JOIN #AdultEducationCredentialAttainmentEmployedIndicator c
	CROSS JOIN #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator d
	CROSS JOIN #AdultEducationProgramExitReason e
	LEFT JOIN RDS.DimAeProgramTransitionIndicators main
		ON a.AePostsecondaryTransitionActionCode = main.AePostsecondaryTransitionActionCode
		AND b.AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode = main.AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode
		AND c.AdultEducationCredentialAttainmentEmployedIndicatorCode = main.AdultEducationCredentialAttainmentEmployedIndicatorCode
		AND d.AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode = main.AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode
		AND e.AdultEducationProgramExitReasonCode = main.AdultEducationProgramExitReasonCode
	WHERE main.DimAeProgramTransitionIndicatorId IS NULL

	DROP TABLE #AePostsecondaryTransitionAction
	DROP TABLE #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator
	DROP TABLE #AdultEducationCredentialAttainmentEmployedIndicator
	DROP TABLE #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator
	DROP TABLE #AdultEducationProgramExitReason



	PRINT 'Populate DimIncidentBehaviors'
	------------------------------------------------------
	-- Populate DimIncidentBehaviors  ---
	------------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimIncidentBehaviors d WHERE d.DimIncidentBehaviorId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimIncidentBehaviors ON

		INSERT INTO [RDS].DimIncidentBehaviors
           (DimIncidentBehaviorId
		   ,IncidentBehaviorCode
		   ,IncidentBehaviorDescription
		   ,SecondaryIncidentBehaviorCode
		   ,SecondaryIncidentBehaviorDescription)
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimIncidentBehaviors OFF
	END

	CREATE TABLE #IncidentBehavior (IncidentBehaviorCode VARCHAR(50), IncidentBehaviorDescription VARCHAR(200))

	INSERT INTO #IncidentBehavior VALUES ('MISSING', 'MISSING')
	INSERT INTO #IncidentBehavior
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'IncidentBehavior'

	CREATE TABLE #SecondaryIncidentBehavior (SecondaryIncidentBehaviorCode VARCHAR(50), SecondaryIncidentBehaviorDescription VARCHAR(200))

	INSERT INTO #SecondaryIncidentBehavior VALUES ('MISSING', 'MISSING')
	INSERT INTO #SecondaryIncidentBehavior
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'IncidentBehavior'

	INSERT INTO RDS.DimIncidentBehaviors
		   (IncidentBehaviorCode
		   ,IncidentBehaviorDescription
		   ,SecondaryIncidentBehaviorCode
		   ,SecondaryIncidentBehaviorDescription)
	SELECT DISTINCT
		  a.IncidentBehaviorCode
		, a.IncidentBehaviorDescription
		, b.SecondaryIncidentBehaviorCode
		, b.SecondaryIncidentBehaviorDescription
	FROM #IncidentBehavior a
	CROSS JOIN #SecondaryIncidentBehavior b
	LEFT JOIN RDS.DimIncidentBehaviors main
		ON a.IncidentBehaviorCode = main.IncidentBehaviorCode
		AND b.SecondaryIncidentBehaviorCode = main.SecondaryIncidentBehaviorCode
	WHERE main.DimIncidentBehaviorId IS NULL

	DROP TABLE #IncidentBehavior
	DROP TABLE #SecondaryIncidentBehavior


	PRINT 'Populate DimIncidentTimeIndicators'
	------------------------------------------------------
	-- Populate DimIncidentTimeIndicators  ---
	------------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimIncidentTimeIndicators d WHERE d.DimIncidentTimeIndicatorId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimIncidentTimeIndicators ON

		INSERT INTO [RDS].DimIncidentTimeIndicators
           ([DimIncidentTimeIndicatorId]
		   ,[IncidentTimeDescriptionCodeCode]
		   ,[IncidentTimeDescriptionCodeDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimIncidentTimeIndicators OFF
	END

	CREATE TABLE #IncidentTimeDescriptionCode (IncidentTimeDescriptionCodeCode VARCHAR(50), IncidentTimeDescriptionCodeDescription VARCHAR(200))

	INSERT INTO #IncidentTimeDescriptionCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #IncidentTimeDescriptionCode
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'IncidentTimeDescriptionCode'

	INSERT INTO RDS.DimIncidentTimeIndicators
		   ([IncidentTimeDescriptionCodeCode]
		   ,[IncidentTimeDescriptionCodeDescription])
	SELECT DISTINCT
		  a.IncidentTimeDescriptionCodeCode
		, a.IncidentTimeDescriptionCodeDescription
	FROM #IncidentTimeDescriptionCode a
	LEFT JOIN RDS.DimIncidentTimeIndicators main
		ON a.IncidentTimeDescriptionCodeCode = main.IncidentTimeDescriptionCodeDescription
	WHERE main.DimIncidentTimeIndicatorId IS NULL

	DROP TABLE #IncidentTimeDescriptionCode


	PRINT 'Populate DimIncidentSettings'
	-------------------------------------------------
	-- Populate DimIncidentSettings        ---
	-------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimIncidentSettings d WHERE d.DimIncidentSettingId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimIncidentSettings ON

		INSERT INTO [RDS].DimIncidentSettings
           ([DimIncidentSettingId]
		   ,[IncidentLocationCode]
		   ,[IncidentLocationDescription]
		   ,[IncidentActivityCode]
		   ,[IncidentActivityDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimIncidentSettings OFF
	END

	CREATE TABLE #IncidentLocation (IncidentLocationCode VARCHAR(50), IncidentLocationDescription VARCHAR(200))

	INSERT INTO #IncidentLocation VALUES ('MISSING', 'MISSING')
	INSERT INTO #IncidentLocation
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'IncidentLocation'

	CREATE TABLE #IncidentActivity (IncidentActivityCode VARCHAR(50), IncidentActivityDescription VARCHAR(200))

	INSERT INTO #IncidentActivity VALUES ('MISSING', 'MISSING')
	INSERT INTO #IncidentActivity
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'IncidentActivity'


	INSERT INTO RDS.DimIncidentSettings
		   ([IncidentLocationCode]
		   ,[IncidentLocationDescription]
		   ,[IncidentActivityCode]
		   ,[IncidentActivityDescription])
	SELECT DISTINCT
		  a.IncidentLocationCode
		, a.IncidentLocationDescription
		, b.IncidentActivityCode
		, b.IncidentActivityDescription
	FROM #IncidentLocation a
	CROSS JOIN #IncidentActivity b
	LEFT JOIN RDS.DimIncidentSettings main
		ON a.IncidentLocationCode = main.IncidentLocationCode
		AND b.IncidentActivityCode = main.IncidentActivityCode
	WHERE main.DimIncidentSettingId IS NULL

	DROP TABLE #IncidentLocation
	DROP TABLE #IncidentActivity

	PRINT 'Populate DimRecordStatuses'
	--------------------------------------------------------
	-- Populate DimRecordStatuses   ---------------
	--------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimRecordStatuses d WHERE d.DimRecordStatusId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimRecordStatuses ON

			INSERT INTO rds.DimRecordStatuses(
						  DimRecordStatusId
						 ,RecordStatusTypeCode
					     ,RecordStatusTypeDescription
					     ,RecordStatusCreatorEntityCode
					     ,RecordStatusCreatorEntityDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					)

		SET IDENTITY_INSERT rds.DimRecordStatuses OFF
	END

	IF OBJECT_ID('tempdb..#RecordStatusTypeCode') IS NOT NULL
		DROP TABLE #RecordStatusTypeCode

	CREATE TABLE #RecordStatusTypeCode (RecordStatusTypeCode VARCHAR(50), RecordStatusTypeDescription VARCHAR(200))

	INSERT INTO #RecordStatusTypeCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #RecordStatusTypeCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'RecordStatusType'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#RecordStatusCreatorEntityCode') IS NOT NULL
		DROP TABLE #RecordStatusCreatorEntityCode

	CREATE TABLE #RecordStatusCreatorEntityCode (RecordStatusCreatorEntityCode VARCHAR(50), RecordStatusCreatorEntityDescription VARCHAR(200))

	INSERT INTO #RecordStatusCreatorEntityCode VALUES ('MISSING', 'MISSING')
	INSERT INTO #RecordStatusCreatorEntityCode
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'RecordStatusCreatorEntity'
	ORDER BY CedsOptionSetCode

	INSERT INTO rds.DimRecordStatuses(
			 RecordStatusTypeCode
			,RecordStatusTypeDescription
			,RecordStatusCreatorEntityCode
			,RecordStatusCreatorEntityDescription
			)
	SELECT 
			 a.RecordStatusTypeCode
			,a.RecordStatusTypeDescription
			,b.RecordStatusCreatorEntityCode
			,b.RecordStatusCreatorEntityDescription
	FROM #RecordStatusTypeCode a
	CROSS JOIN #RecordStatusCreatorEntityCode b
	LEFT JOIN RDS.DimRecordStatuses main
		ON	a.RecordStatusTypeCode = main.RecordStatusTypeCode								
		AND b.RecordStatusCreatorEntityCode = main.RecordStatusCreatorEntityCode			
	WHERE main.DimRecordStatusId IS NULL

	DROP TABLE #RecordStatusTypeCode
	DROP TABLE #RecordStatusCreatorEntityCode

	PRINT 'Populate DimK12OrganizationStatuses'
	--------------------------------------------------------
	-- Populate DimK12OrganizationStatuses   --
	--------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12OrganizationStatuses d WHERE d.DimK12OrganizationStatusId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimK12OrganizationStatuses ON

			INSERT INTO rds.DimK12OrganizationStatuses(
						  DimK12OrganizationStatusId
						 ,ReapAlternativeFundingStatusCode
					     ,ReapAlternativeFundingStatusDescription
					     ,ReapAlternativeFundingStatusEdFactsCode
					     ,GunFreeSchoolsActReportingStatusCode
					     ,GunFreeSchoolsActReportingStatusDescription
					     ,GunFreeSchoolsActReportingStatusEdFactsCode
					     ,HighSchoolGraduationRateIndicatorStatusCode
					     ,HighSchoolGraduationRateIndicatorStatusDescription
					     ,HighSchoolGraduationRateIndicatorStatusEdFactsCode
					     ,McKinneyVentoSubgrantRecipientCode
					     ,McKinneyVentoSubgrantRecipientDescription
				  	     ,McKinneyVentoSubgrantRecipientEdFactsCode
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

		SET IDENTITY_INSERT rds.DimK12OrganizationStatuses OFF
	END

	IF OBJECT_ID('tempdb..#ReapAlternativeFundingStatusCode') IS NOT NULL
		DROP TABLE #ReapAlternativeFundingStatusCode

	CREATE TABLE #ReapAlternativeFundingStatusCode (ReapAlternativeFundingStatusCode VARCHAR(50), ReapAlternativeFundingStatusDescription VARCHAR(200), ReapAlternativeFundingStatusEdFactsCode VARCHAR(50))

	INSERT INTO #ReapAlternativeFundingStatusCode VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #ReapAlternativeFundingStatusCode 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ReapAlternativeFundingStatus'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#GunFreeSchoolsActReportingStatusCode') IS NOT NULL
		DROP TABLE #GunFreeSchoolsActReportingStatusCode

	CREATE TABLE #GunFreeSchoolsActReportingStatusCode (GunFreeSchoolsActReportingStatusCode VARCHAR(50), GunFreeSchoolsActReportingStatusDescription VARCHAR(200), GunFreeSchoolsActReportingStatusEdFactsCode VARCHAR(50))

	INSERT INTO #GunFreeSchoolsActReportingStatusCode VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #GunFreeSchoolsActReportingStatusCode
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'GunFreeSchoolsActReportingStatus'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#HighSchoolGraduationRateIndicatorStatusCode') IS NOT NULL
		DROP TABLE #HighSchoolGraduationRateIndicatorStatusCode

	CREATE TABLE #HighSchoolGraduationRateIndicatorStatusCode (HighSchoolGraduationRateIndicatorStatusCode VARCHAR(50), HighSchoolGraduationRateIndicatorStatusDescription VARCHAR(200), HighSchoolGraduationRateIndicatorStatusEdFactsCode VARCHAR(50))

	INSERT INTO #HighSchoolGraduationRateIndicatorStatusCode VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #HighSchoolGraduationRateIndicatorStatusCode
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'HighSchoolGraduationRateIndicatorStatus'
	ORDER BY CedsOptionSetCode

	IF OBJECT_ID('tempdb..#McKinneyVentoSubgrantRecipientCode') IS NOT NULL
		DROP TABLE #McKinneyVentoSubgrantRecipientCode

	CREATE TABLE #McKinneyVentoSubgrantRecipientCode (McKinneyVentoSubgrantRecipientCode VARCHAR(50), McKinneyVentoSubgrantRecipientDescription VARCHAR(200), McKinneyVentoSubgrantRecipientEdFactsCode VARCHAR(50))

	INSERT INTO #McKinneyVentoSubgrantRecipientCode VALUES ('MISSING', 'MISSING', 'MISSING')

	--Remove this code when this element has been added to CEDS (V14)
	INSERT INTO #McKinneyVentoSubgrantRecipientCode VALUES ('Yes', 'Yes', 'MISSING')
	INSERT INTO #McKinneyVentoSubgrantRecipientCode VALUES ('No', 'No', 'MISSING')

	--Uncomment when this element has been added to CEDS (V14)
	--INSERT INTO #McKinneyVentoSubgrantRecipientCode
	--SELECT 
	--	  CedsOptionSetCode
	--	, CedsOptionSetDescription
	--	, EdFactsOptionSetCode
	--FROM [CEDS].CedsOptionSetMapping
	--WHERE CedsElementTechnicalName = 'McKinneyVentoSubgrantRecipient'
	--ORDER BY CedsOptionSetCode

	INSERT INTO rds.DimK12OrganizationStatuses(
			 ReapAlternativeFundingStatusCode
			,ReapAlternativeFundingStatusDescription
			,ReapAlternativeFundingStatusEdFactsCode
			,GunFreeSchoolsActReportingStatusCode
			,GunFreeSchoolsActReportingStatusDescription
			,GunFreeSchoolsActReportingStatusEdFactsCode
			,HighSchoolGraduationRateIndicatorStatusCode
			,HighSchoolGraduationRateIndicatorStatusDescription
			,HighSchoolGraduationRateIndicatorStatusEdFactsCode
			,McKinneyVentoSubgrantRecipientCode
			,McKinneyVentoSubgrantRecipientDescription
			,McKinneyVentoSubgrantRecipientEdFactsCode
			)
	SELECT 
			 a.ReapAlternativeFundingStatusCode
			,a.ReapAlternativeFundingStatusDescription
			,a.ReapAlternativeFundingStatusEdFactsCode
			,b.GunFreeSchoolsActReportingStatusCode
			,b.GunFreeSchoolsActReportingStatusDescription
			,b.GunFreeSchoolsActReportingStatusEdFactsCode
			,c.HighSchoolGraduationRateIndicatorStatusCode
			,c.HighSchoolGraduationRateIndicatorStatusDescription
			,c.HighSchoolGraduationRateIndicatorStatusEdFactsCode
			,d.McKinneyVentoSubgrantRecipientCode
			,d.McKinneyVentoSubgrantRecipientDescription
			,d.McKinneyVentoSubgrantRecipientEdFactsCode
	FROM #ReapAlternativeFundingStatusCode a
	CROSS JOIN #GunFreeSchoolsActReportingStatusCode b
	CROSS JOIN #HighSchoolGraduationRateIndicatorStatusCode c
	CROSS JOIN #McKinneyVentoSubgrantRecipientCode d
	LEFT JOIN RDS.DimK12OrganizationStatuses main
		ON	a.ReapAlternativeFundingStatusCode = main.ReapAlternativeFundingStatusCode								
		AND b.GunFreeSchoolsActReportingStatusCode = main.GunFreeSchoolsActReportingStatusCode			
		AND c.HighSchoolGraduationRateIndicatorStatusCode = main.HighSchoolGraduationRateIndicatorStatusCode
		AND d.McKinneyVentoSubgrantRecipientCode = main.McKinneyVentoSubgrantRecipientCode
	WHERE main.DimK12OrganizationStatusId IS NULL

	DROP TABLE #ReapAlternativeFundingStatusCode
	DROP TABLE #GunFreeSchoolsActReportingStatusCode
	DROP TABLE #HighSchoolGraduationRateIndicatorStatusCode
	DROP TABLE #McKinneyVentoSubgrantRecipientCode


	PRINT 'Populate DimAccessibilityFeatureAlternateResponseOptions'
	------------------------------------------------
	-- Populate DimAccessibilityFeatureAlternateResponseOptions		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibilityFeatureAlternateResponseOptions d WHERE d.AlternateResponseOptionTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureAlternateResponseOptions ON

		INSERT INTO RDS.DimAccessibilityFeatureAlternateResponseOptions (DimAccessibilityFeatureAlternateResponseOptionId, AlternateResponseOptionTypeCode, AlternateResponseOptionTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureAlternateResponseOptions OFF
	END

	INSERT INTO RDS.DimAccessibilityFeatureAlternateResponseOptions
		(
			  AlternateResponseOptionTypeCode
			, AlternateResponseOptionTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAccessibilityFeatureAlternateResponseOptions main
		ON ceds.CedsOptionSetCode = main.AlternateResponseOptionTypeCode
	WHERE main.DimAccessibilityFeatureAlternateResponseOptionId IS NULL
		AND ceds.CedsElementTechnicalName = 'AlternateResponseOptionType'


	PRINT 'Populate DimAccessibilityFeatureAssessmentExtendedTimes'
	------------------------------------------------
	-- Populate DimAccessibilityFeatureAssessmentExtendedTimes		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibilityFeatureAssessmentExtendedTimes d WHERE d.AssessmentExtendedTimeTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureAssessmentExtendedTimes ON

		INSERT INTO RDS.DimAccessibilityFeatureAssessmentExtendedTimes (DimAccessibilityFeatureAssessmentExtendedTimeId, AssessmentExtendedTimeTypeCode, AssessmentExtendedTimeTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureAssessmentExtendedTimes OFF
	END

	INSERT INTO RDS.DimAccessibilityFeatureAssessmentExtendedTimes
		(
			  AssessmentExtendedTimeTypeCode
			, AssessmentExtendedTimeTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAccessibilityFeatureAssessmentExtendedTimes main
		ON ceds.CedsOptionSetCode = main.AssessmentExtendedTimeTypeCode
	WHERE main.DimAccessibilityFeatureAssessmentExtendedTimeId IS NULL
		AND ceds.CedsElementTechnicalName = 'AlternateResponseOptionType'


	PRINT 'Populate DimAccessibilityFeatureBrailles'
	---------------------------------------------------------------
	-- Populate DimAccessibilityFeatureBrailles  ---
	----------------------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibilityFeatureBrailles d WHERE d.DimAccessibilityFeatureBrailleId = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureBrailles ON

		INSERT INTO [RDS].DimAccessibilityFeatureBrailles
			   ([DimAccessibilityFeatureBrailleId]
			   ,BrailleAccessTypeCode
			   ,BrailleAccessTypeDescription
			   ,BrailleApplicationTypeCode
			   ,BrailleApplicationTypeDescription
			   ,BrailleCodeTypeCode
			   ,BrailleCodeTypeDescription
			   ,BrailleVersionTypeCode
			   ,BrailleVersionTypeDescription)
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

		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureBrailles OFF

	END

	IF OBJECT_ID('tempdb..#BrailleAccessType') IS NOT NULL
		DROP TABLE #BrailleAccessType

	CREATE TABLE #BrailleAccessType (BrailleAccessTypeCode VARCHAR(50), BrailleAccessTypeDescription VARCHAR(200))

	INSERT INTO #BrailleAccessType VALUES ('MISSING', 'MISSING')
	INSERT INTO #BrailleAccessType 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'BrailleAccessType'

	IF OBJECT_ID('tempdb..#BrailleApplicationType') IS NOT NULL
		DROP TABLE #BrailleApplicationType

	CREATE TABLE #BrailleApplicationType (BrailleApplicationTypeCode VARCHAR(50), BrailleApplicationTypeDescription VARCHAR(200))

	INSERT INTO #BrailleApplicationType VALUES ('MISSING', 'MISSING')
	INSERT INTO #BrailleApplicationType 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'BrailleApplicationType'

	IF OBJECT_ID('tempdb..#BrailleCodeType') IS NOT NULL
		DROP TABLE #BrailleCodeType

	CREATE TABLE #BrailleCodeType (BrailleCodeTypeCode VARCHAR(50), BrailleCodeTypeDescription VARCHAR(200))

	INSERT INTO #BrailleCodeType VALUES ('MISSING', 'MISSING')
	INSERT INTO #BrailleCodeType 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'BrailleCodeType'

	IF OBJECT_ID('tempdb..#BrailleVersionType') IS NOT NULL
		DROP TABLE #BrailleVersionType

	CREATE TABLE #BrailleVersionType (BrailleVersionTypeCode VARCHAR(50), BrailleVersionTypeDescription VARCHAR(200))

	INSERT INTO #BrailleVersionType VALUES ('MISSING', 'MISSING')
	INSERT INTO #BrailleVersionType 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'BrailleVersionType'


	INSERT INTO [RDS].DimAccessibilityFeatureBrailles
		(BrailleAccessTypeCode
		,BrailleAccessTypeDescription
		,BrailleApplicationTypeCode
		,BrailleApplicationTypeDescription
		,BrailleCodeTypeCode
		,BrailleCodeTypeDescription
		,BrailleVersionTypeCode
		,BrailleVersionTypeDescription)
	SELECT DISTINCT
		  a.BrailleAccessTypeCode
		, a.BrailleAccessTypeDescription
		, b.BrailleApplicationTypeCode
		, b.BrailleApplicationTypeDescription
		, c.BrailleCodeTypeCode
		, c.BrailleCodeTypeDescription
		, d.BrailleVersionTypeCode
		, d.BrailleVersionTypeDescription
	FROM #BrailleAccessType a
	CROSS JOIN #BrailleApplicationType b
	CROSS JOIN #BrailleCodeType c
	CROSS JOIN #BrailleVersionType d
	LEFT JOIN RDS.DimAccessibilityFeatureBrailles main
		ON a.BrailleAccessTypeCode = main.BrailleAccessTypeCode
		AND b.BrailleApplicationTypeCode = main.BrailleApplicationTypeCode
		AND c.BrailleCodeTypeCode = main.BrailleCodeTypeCode
		AND d.BrailleVersionTypeCode = main.BrailleVersionTypeCode
	WHERE main.DimAccessibilityFeatureBrailleId IS NULL

	DROP TABLE #BrailleAccessType
	DROP TABLE #BrailleApplicationType
	DROP TABLE #BrailleCodeType
	DROP TABLE #BrailleVersionType


	PRINT 'Populate DimAccessibilityFeatureBreaks'
	--------------------------------------------------------
	-- Populate DimAccessibilityFeatureBreaks   ---------------
	--------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibilityFeatureBreaks d WHERE d.DimAccessibilityFeatureBreakId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimAccessibilityFeatureBreaks ON

			INSERT INTO rds.DimAccessibilityFeatureBreaks(
						  DimAccessibilityFeatureBreakId
						 ,BreakLocationTypeCode
					     ,BreakLocationTypeDescription
					     ,BreakTypeCode
					     ,BreakTypeDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					)

		SET IDENTITY_INSERT rds.DimAccessibilityFeatureBreaks OFF
	END

	IF OBJECT_ID('tempdb..#BreakLocationType') IS NOT NULL
		DROP TABLE #BreakLocationType

	CREATE TABLE #BreakLocationType (BreakLocationTypeCode VARCHAR(50), BreakLocationTypeDescription VARCHAR(200))

	INSERT INTO #BreakLocationType VALUES ('MISSING', 'MISSING')
	INSERT INTO #BreakLocationType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'BreakLocationType'

	IF OBJECT_ID('tempdb..#BreakType') IS NOT NULL
		DROP TABLE #BreakType

	CREATE TABLE #BreakType (BreakTypeCode VARCHAR(50), BreakTypeDescription VARCHAR(200))

	INSERT INTO #BreakType VALUES ('MISSING', 'MISSING')
	INSERT INTO #BreakType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'BreakType'

	INSERT INTO rds.DimAccessibilityFeatureBreaks(
			 BreakLocationTypeCode
			,BreakLocationTypeDescription
			,BreakTypeCode
			,BreakTypeDescription
			)
	SELECT 
			 a.BreakLocationTypeCode
			,a.BreakLocationTypeDescription
			,b.BreakTypeCode
			,b.BreakTypeDescription
	FROM #BreakLocationType a
	CROSS JOIN #BreakType b
	LEFT JOIN RDS.DimAccessibilityFeatureBreaks main
		ON	a.BreakLocationTypeCode = main.BreakLocationTypeCode								
		AND b.BreakTypeCode = main.BreakTypeCode			
	WHERE main.DimAccessibilityFeatureBreakId IS NULL

	DROP TABLE #BreakLocationType
	DROP TABLE #BreakType


	PRINT 'Populate DimAccessibilityFeatureCalculators'
	--------------------------------------------------------
	-- Populate DimAccessibilityFeatureCalculators   ---------------
	--------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibilityFeatureCalculators d WHERE d.DimAccessibilityFeatureCalculatorId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimAccessibilityFeatureCalculators ON

			INSERT INTO rds.DimAccessibilityFeatureCalculators(
						  DimAccessibilityFeatureCalculatorId
						 ,AdaptiveCalculatorTypeCode
					     ,AdaptiveCalculatorTypeDescription
					     ,CalculatorTypeCode
					     ,CalculatorTypeDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					)

		SET IDENTITY_INSERT rds.DimAccessibilityFeatureCalculators OFF
	END

	IF OBJECT_ID('tempdb..#AdaptiveCalculatorType') IS NOT NULL
		DROP TABLE #AdaptiveCalculatorType

	CREATE TABLE #AdaptiveCalculatorType (AdaptiveCalculatorTypeCode VARCHAR(50), AdaptiveCalculatorTypeDescription VARCHAR(200))

	INSERT INTO #AdaptiveCalculatorType VALUES ('MISSING', 'MISSING')
	INSERT INTO #AdaptiveCalculatorType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AdaptiveCalculatorType'

	IF OBJECT_ID('tempdb..#CalculatorType') IS NOT NULL
		DROP TABLE #CalculatorType

	CREATE TABLE #CalculatorType (CalculatorTypeCode VARCHAR(50), CalculatorTypeDescription VARCHAR(200))

	INSERT INTO #CalculatorType VALUES ('MISSING', 'MISSING')
	INSERT INTO #CalculatorType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CalculatorType'

	INSERT INTO rds.DimAccessibilityFeatureCalculators(
			 AdaptiveCalculatorTypeCode
			,AdaptiveCalculatorTypeDescription
			,CalculatorTypeCode
			,CalculatorTypeDescription
			)
	SELECT 
			 a.AdaptiveCalculatorTypeCode
			,a.AdaptiveCalculatorTypeDescription
			,b.CalculatorTypeCode
			,b.CalculatorTypeDescription
	FROM #AdaptiveCalculatorType a
	CROSS JOIN #CalculatorType b
	LEFT JOIN RDS.DimAccessibilityFeatureCalculators main
		ON	a.AdaptiveCalculatorTypeCode = main.AdaptiveCalculatorTypeCode								
		AND b.CalculatorTypeCode = main.CalculatorTypeCode			
	WHERE main.DimAccessibilityFeatureCalculatorId IS NULL

	DROP TABLE #AdaptiveCalculatorType
	DROP TABLE #CalculatorType


	PRINT 'Populate DimAccessibilityFeatureDisplayFormatAdjustments'
	------------------------------------------------
	-- Populate DimAccessibilityFeatureDisplayFormatAdjustments		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibilityFeatureDisplayFormatAdjustments d WHERE d.DisplayFormatAdjustmentTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureDisplayFormatAdjustments ON

		INSERT INTO RDS.DimAccessibilityFeatureDisplayFormatAdjustments (DimAccessibilityFeatureDisplayFormatAdjustmentId, DisplayFormatAdjustmentTypeCode, DisplayFormatAdjustmentTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureDisplayFormatAdjustments OFF
	END

	INSERT INTO RDS.DimAccessibilityFeatureDisplayFormatAdjustments
		(
			  DisplayFormatAdjustmentTypeCode
			, DisplayFormatAdjustmentTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAccessibilityFeatureDisplayFormatAdjustments main
		ON ceds.CedsOptionSetCode = main.DisplayFormatAdjustmentTypeCode
	WHERE main.DimAccessibilityFeatureDisplayFormatAdjustmentId IS NULL
		AND ceds.CedsElementTechnicalName = 'DisplayFormatAdjustmentType'


	PRINT 'Populate DimAccessibilityFeatureGroupSizes'
	------------------------------------------------
	-- Populate DimAccessibilityFeatureGroupSizes		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibilityFeatureGroupSizes d WHERE d.GroupSizeTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureGroupSizes ON

		INSERT INTO RDS.DimAccessibilityFeatureGroupSizes (DimAccessibilityFeatureGroupSizeId, GroupSizeTypeCode, GroupSizeTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureGroupSizes OFF
	END

	INSERT INTO RDS.DimAccessibilityFeatureGroupSizes
		(
			  GroupSizeTypeCode
			, GroupSizeTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAccessibilityFeatureGroupSizes main
		ON ceds.CedsOptionSetCode = main.GroupSizeTypeCode
	WHERE main.DimAccessibilityFeatureGroupSizeId IS NULL
		AND ceds.CedsElementTechnicalName = 'GroupSizeType'



	PRINT 'Populate DimAccessibilityFeatureMedicalSupports'
	------------------------------------------------
	-- Populate DimAccessibilityFeatureMedicalSupports		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibilityFeatureMedicalSupports d WHERE d.MedicalSupportTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureMedicalSupports ON

		INSERT INTO RDS.DimAccessibilityFeatureMedicalSupports (DimAccessibilityFeatureMedicalSupportId, MedicalSupportTypeCode, MedicalSupportTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureMedicalSupports OFF
	END

	INSERT INTO RDS.DimAccessibilityFeatureMedicalSupports
		(
			  MedicalSupportTypeCode
			, MedicalSupportTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAccessibilityFeatureMedicalSupports main
		ON ceds.CedsOptionSetCode = main.MedicalSupportTypeCode
	WHERE main.DimAccessibilityFeatureMedicalSupportId IS NULL
		AND ceds.CedsElementTechnicalName = 'MedicalSupportType'


	PRINT 'Populate DimAccessibilityFeatureReadAlouds'
	------------------------------------------------
	-- Populate DimAccessibilityFeatureReadAlouds		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibilityFeatureReadAlouds d WHERE d.ReadAloudTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureReadAlouds ON

		INSERT INTO RDS.DimAccessibilityFeatureReadAlouds (DimAccessibilityFeatureReadAloudId, ReadAloudTypeCode, ReadAloudTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureReadAlouds OFF
	END

	INSERT INTO RDS.DimAccessibilityFeatureReadAlouds
		(
			  ReadAloudTypeCode
			, ReadAloudTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAccessibilityFeatureReadAlouds main
		ON ceds.CedsOptionSetCode = main.ReadAloudTypeCode
	WHERE main.DimAccessibilityFeatureReadAloudId IS NULL
		AND ceds.CedsElementTechnicalName = 'ReadAloudType'


	PRINT 'Populate DimAccessibilityFeatureReferenceSheets'
	------------------------------------------------
	-- Populate DimAccessibilityFeatureReferenceSheets		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibilityFeatureReferenceSheets d WHERE d.ReferenceSheetTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureReferenceSheets ON

		INSERT INTO RDS.DimAccessibilityFeatureReferenceSheets (DimAccessibilityFeatureReferenceSheetId, ReferenceSheetTypeCode, ReferenceSheetTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureReferenceSheets OFF
	END

	INSERT INTO RDS.DimAccessibilityFeatureReferenceSheets
		(
			  ReferenceSheetTypeCode
			, ReferenceSheetTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAccessibilityFeatureReferenceSheets main
		ON ceds.CedsOptionSetCode = main.ReferenceSheetTypeCode
	WHERE main.DimAccessibilityFeatureReferenceSheetId IS NULL
		AND ceds.CedsElementTechnicalName = 'ReferenceSheetType'


	PRINT 'Populate DimAccessibilityFeatures'
	---------------------------------------------------------------
	-- Populate DimAccessibilityFeatures  ---
	----------------------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibilityFeatures d WHERE d.DimAccessibilityFeatureId = -1)
	BEGIN
		SET IDENTITY_INSERT RDS.DimAccessibilityFeatures ON

		INSERT INTO [RDS].DimAccessibilityFeatures
			   (DimAccessibilityFeatureId
			   ,AccessibilityFeatureTypeCode
			   ,AccessibilityFeatureTypeDescription
			   ,AccessibilityFeatureApplicationTypeCode
			   ,AccessibilityFeatureApplicationTypeDescription
			   ,AccessibilityFeatureCategoryCode
			   ,AccessibilityFeatureCategoryDescription
			   ,AccessibilityFeatureDeliveryMethodCode
			   ,AccessibilityFeatureDeliveryMethodDescription
			   ,AccessibilityFeatureEmbeddedIndicatorCode
			   ,AccessibilityFeatureEmbeddedIndicatorDescription
			   ,AccessibilityFeaturePausesTheClockIndicatorCode
			   ,AccessibilityFeaturePausesTheClockIndicatorDescription)
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

		SET IDENTITY_INSERT RDS.DimAccessibilityFeatures OFF

	END

	IF OBJECT_ID('tempdb..#AccessibilityFeatureType') IS NOT NULL
		DROP TABLE #AccessibilityFeatureType

	CREATE TABLE #AccessibilityFeatureType (AccessibilityFeatureTypeCode VARCHAR(50), AccessibilityFeatureTypeDescription VARCHAR(200))

	INSERT INTO #AccessibilityFeatureType VALUES ('MISSING', 'MISSING')
	INSERT INTO #AccessibilityFeatureType 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AccessibilityFeatureType'

	IF OBJECT_ID('tempdb..#AccessibilityFeatureApplicationType') IS NOT NULL
		DROP TABLE #AccessibilityFeatureApplicationType

	CREATE TABLE #AccessibilityFeatureApplicationType (AccessibilityFeatureApplicationTypeCode VARCHAR(50), AccessibilityFeatureApplicationTypeDescription VARCHAR(200))

	INSERT INTO #AccessibilityFeatureApplicationType VALUES ('MISSING', 'MISSING')
	INSERT INTO #AccessibilityFeatureApplicationType 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AccessibilityFeatureApplicationType'

	IF OBJECT_ID('tempdb..#AccessibilityFeatureCategory') IS NOT NULL
		DROP TABLE #AccessibilityFeatureCategory

	CREATE TABLE #AccessibilityFeatureCategory (AccessibilityFeatureCategoryCode VARCHAR(50), AccessibilityFeatureCategoryDescription VARCHAR(200))

	INSERT INTO #AccessibilityFeatureCategory VALUES ('MISSING', 'MISSING')
	INSERT INTO #AccessibilityFeatureCategory 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AccessibilityFeatureCategory'

	IF OBJECT_ID('tempdb..#AccessibilityFeatureDeliveryMethod') IS NOT NULL
		DROP TABLE #AccessibilityFeatureDeliveryMethod

	CREATE TABLE #AccessibilityFeatureDeliveryMethod (AccessibilityFeatureDeliveryMethodCode VARCHAR(50), AccessibilityFeatureDeliveryMethodDescription VARCHAR(200))

	INSERT INTO #AccessibilityFeatureDeliveryMethod VALUES ('MISSING', 'MISSING')
	INSERT INTO #AccessibilityFeatureDeliveryMethod 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AccessibilityFeatureDeliveryMethod'

	IF OBJECT_ID('tempdb..#AccessibilityFeatureEmbeddedIndicator') IS NOT NULL
		DROP TABLE #AccessibilityFeatureEmbeddedIndicator

	CREATE TABLE #AccessibilityFeatureEmbeddedIndicator (AccessibilityFeatureEmbeddedIndicatorCode VARCHAR(50), AccessibilityFeatureEmbeddedIndicatorDescription VARCHAR(200))

	INSERT INTO #AccessibilityFeatureEmbeddedIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #AccessibilityFeatureEmbeddedIndicator 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AccessibilityFeatureEmbeddedIndicator'

	IF OBJECT_ID('tempdb..#AccessibilityFeaturePausesTheClockIndicator') IS NOT NULL
		DROP TABLE #AccessibilityFeaturePausesTheClockIndicator

	CREATE TABLE #AccessibilityFeaturePausesTheClockIndicator (AccessibilityFeaturePausesTheClockIndicatorCode VARCHAR(50), AccessibilityFeaturePausesTheClockIndicatorDescription VARCHAR(200))

	INSERT INTO #AccessibilityFeaturePausesTheClockIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #AccessibilityFeaturePausesTheClockIndicator 
	SELECT 
			CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'AccessibilityFeaturePausesTheClockIndicator'


	INSERT INTO [RDS].DimAccessibilityFeatures
		(AccessibilityFeatureTypeCode
		,AccessibilityFeatureTypeDescription
		,AccessibilityFeatureApplicationTypeCode
		,AccessibilityFeatureApplicationTypeDescription
		,AccessibilityFeatureCategoryCode
		,AccessibilityFeatureCategoryDescription
		,AccessibilityFeatureDeliveryMethodCode
		,AccessibilityFeatureDeliveryMethodDescription
		,AccessibilityFeatureEmbeddedIndicatorCode
		,AccessibilityFeatureEmbeddedIndicatorDescription
		,AccessibilityFeaturePausesTheClockIndicatorCode
		,AccessibilityFeaturePausesTheClockIndicatorDescription)
	SELECT DISTINCT
		  a.AccessibilityFeatureTypeCode
		, a.AccessibilityFeatureTypeDescription
		, b.AccessibilityFeatureApplicationTypeCode
		, b.AccessibilityFeatureApplicationTypeDescription
		, c.AccessibilityFeatureCategoryCode
		, c.AccessibilityFeatureCategoryDescription
		, d.AccessibilityFeatureDeliveryMethodCode
		, d.AccessibilityFeatureDeliveryMethodDescription
		, e.AccessibilityFeatureEmbeddedIndicatorCode
		, e.AccessibilityFeatureEmbeddedIndicatorDescription
		, f.AccessibilityFeaturePausesTheClockIndicatorCode
		, f.AccessibilityFeaturePausesTheClockIndicatorDescription
	FROM #AccessibilityFeatureType a
	CROSS JOIN #AccessibilityFeatureApplicationType b
	CROSS JOIN #AccessibilityFeatureCategory c
	CROSS JOIN #AccessibilityFeatureDeliveryMethod d
	CROSS JOIN #AccessibilityFeatureEmbeddedIndicator e
	CROSS JOIN #AccessibilityFeaturePausesTheClockIndicator f
	LEFT JOIN RDS.DimAccessibilityFeatures main
		ON a.AccessibilityFeatureTypeCode = main.AccessibilityFeatureTypeCode
		AND b.AccessibilityFeatureApplicationTypeCode = main.AccessibilityFeatureApplicationTypeCode
		AND c.AccessibilityFeatureCategoryCode = main.AccessibilityFeatureCategoryCode
		AND d.AccessibilityFeatureDeliveryMethodCode = main.AccessibilityFeatureDeliveryMethodCode
		AND e.AccessibilityFeatureEmbeddedIndicatorCode = main.AccessibilityFeatureEmbeddedIndicatorCode
		AND f.AccessibilityFeaturePausesTheClockIndicatorCode = main.AccessibilityFeaturePausesTheClockIndicatorCode
	WHERE main.DimAccessibilityFeatureId IS NULL

	DROP TABLE #AccessibilityFeatureType
	DROP TABLE #AccessibilityFeatureApplicationType
	DROP TABLE #AccessibilityFeatureCategory
	DROP TABLE #AccessibilityFeatureDeliveryMethod
	DROP TABLE #AccessibilityFeatureEmbeddedIndicator
	DROP TABLE #AccessibilityFeaturePausesTheClockIndicator


	PRINT 'Populate DimAccessibilityFeatureSettings'
	------------------------------------------------
	-- Populate DimAccessibilityFeatureSettings		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibilityFeatureSettings d WHERE d.SettingTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureSettings ON

		INSERT INTO RDS.DimAccessibilityFeatureSettings (DimAccessibilityFeatureSettingId, SettingTypeCode, SettingTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureSettings OFF
	END

	INSERT INTO RDS.DimAccessibilityFeatureSettings
		(
			  SettingTypeCode
			, SettingTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAccessibilityFeatureSettings main
		ON ceds.CedsOptionSetCode = main.SettingTypeCode
	WHERE main.DimAccessibilityFeatureSettingId IS NULL
		AND ceds.CedsElementTechnicalName = 'SettingType'


	PRINT 'Populate DimAccessibilityFeatureSignedAdministrations'
	--------------------------------------------------------
	-- Populate DimAccessibilityFeatureSignedAdministrations   ---------------
	--------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibilityFeatureSignedAdministrations d WHERE d.DimAccessibilityFeatureSignedAdministrationId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimAccessibilityFeatureSignedAdministrations ON

			INSERT INTO rds.DimAccessibilityFeatureSignedAdministrations(
						  DimAccessibilityFeatureSignedAdministrationId
						 ,SignedAdministrationDeliveryMethodCode
					     ,SignedAdministrationDeliveryMethodDescription
					     ,SignedAdministrationTypeCode
					     ,SignedAdministrationTypeDescription
					)
			VALUES (
					-1
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					, 'MISSING'
					)

		SET IDENTITY_INSERT rds.DimAccessibilityFeatureSignedAdministrations OFF
	END

	IF OBJECT_ID('tempdb..#SignedAdministrationDeliveryMethod') IS NOT NULL
		DROP TABLE #SignedAdministrationDeliveryMethod

	CREATE TABLE #SignedAdministrationDeliveryMethod (SignedAdministrationDeliveryMethodCode VARCHAR(50), SignedAdministrationDeliveryMethodDescription VARCHAR(200))

	INSERT INTO #SignedAdministrationDeliveryMethod VALUES ('MISSING', 'MISSING')
	INSERT INTO #SignedAdministrationDeliveryMethod 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SignedAdministrationDeliveryMethod'

	IF OBJECT_ID('tempdb..#SignedAdministrationType') IS NOT NULL
		DROP TABLE #SignedAdministrationType

	CREATE TABLE #SignedAdministrationType (SignedAdministrationTypeCode VARCHAR(50), SignedAdministrationTypeDescription VARCHAR(200))

	INSERT INTO #SignedAdministrationType VALUES ('MISSING', 'MISSING')
	INSERT INTO #SignedAdministrationType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SignedAdministrationType'

	INSERT INTO rds.DimAccessibilityFeatureSignedAdministrations(
			 SignedAdministrationDeliveryMethodCode
			,SignedAdministrationDeliveryMethodDescription
			,SignedAdministrationTypeCode
			,SignedAdministrationTypeDescription
			)
	SELECT 
			 a.SignedAdministrationDeliveryMethodCode
			,a.SignedAdministrationDeliveryMethodDescription
			,b.SignedAdministrationTypeCode
			,b.SignedAdministrationTypeDescription
	FROM #SignedAdministrationDeliveryMethod a
	CROSS JOIN #SignedAdministrationType b
	LEFT JOIN RDS.DimAccessibilityFeatureSignedAdministrations main
		ON	a.SignedAdministrationDeliveryMethodCode = main.SignedAdministrationDeliveryMethodCode								
		AND b.SignedAdministrationTypeCode = main.SignedAdministrationTypeCode			
	WHERE main.DimAccessibilityFeatureSignedAdministrationId IS NULL

	DROP TABLE #SignedAdministrationDeliveryMethod
	DROP TABLE #SignedAdministrationType


	PRINT 'Populate DimAccessibilityFeatureTactileMediums'
	------------------------------------------------
	-- Populate DimAccessibilityFeatureTactileMediums		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibilityFeatureTactileMediums d WHERE d.TactileMediumTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureTactileMediums ON

		INSERT INTO RDS.DimAccessibilityFeatureTactileMediums (DimAccessibilityFeatureTactileMediumId, TactileMediumTypeCode, TactileMediumTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureTactileMediums OFF
	END

	INSERT INTO RDS.DimAccessibilityFeatureTactileMediums
		(
			  TactileMediumTypeCode
			, TactileMediumTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAccessibilityFeatureTactileMediums main
		ON ceds.CedsOptionSetCode = main.TactileMediumTypeCode
	WHERE main.DimAccessibilityFeatureTactileMediumId IS NULL
		AND ceds.CedsElementTechnicalName = 'TactileMediumType'


	PRINT 'Populate DimAccessibilityFeatureTranslationPresentations'
	------------------------------------------------
	-- Populate DimAccessibilityFeatureTranslationPresentations		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibilityFeatureTranslationPresentations d WHERE d.TranslationPresentationTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureTranslationPresentations ON

		INSERT INTO RDS.DimAccessibilityFeatureTranslationPresentations (DimAccessibilityFeatureTranslationPresentationId, TranslationPresentationTypeCode, TranslationPresentationTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAccessibilityFeatureTranslationPresentations OFF
	END

	INSERT INTO RDS.DimAccessibilityFeatureTranslationPresentations
		(
			  TranslationPresentationTypeCode
			, TranslationPresentationTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAccessibilityFeatureTranslationPresentations main
		ON ceds.CedsOptionSetCode = main.TranslationPresentationTypeCode
	WHERE main.DimAccessibilityFeatureTranslationPresentationId IS NULL
		AND ceds.CedsElementTechnicalName = 'TranslationPresentationType'

	PRINT 'Populate DimAlternativeSchoolStatuses'
	------------------------------------------------
	-- Populate DimAlternativeSchoolStatuses		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAlternativeSchoolStatuses d WHERE d.AlternativeSchoolFocusTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimAlternativeSchoolStatuses ON

		INSERT INTO RDS.DimAlternativeSchoolStatuses (DimAlternativeSchoolStatusId, AlternativeSchoolFocusTypeCode, AlternativeSchoolFocusTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAlternativeSchoolStatuses OFF
	END

	INSERT INTO RDS.DimAlternativeSchoolStatuses
		(
			  AlternativeSchoolFocusTypeCode
			, AlternativeSchoolFocusTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAlternativeSchoolStatuses main
		ON ceds.CedsOptionSetCode = main.AlternativeSchoolFocusTypeCode
	WHERE main.DimAlternativeSchoolStatusId IS NULL
		AND ceds.CedsElementTechnicalName = 'AlternativeSchoolFocusType'

	PRINT 'Populate DimAssessmentComponents'
	------------------------------------------------
	-- Populate DimAssessmentComponents		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAssessmentComponents d WHERE d.AssessmentComponentTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimAssessmentComponents ON

		INSERT INTO RDS.DimAssessmentComponents (DimAssessmentComponentId, AssessmentComponentTypeCode, AssessmentComponentTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAssessmentComponents OFF
	END

	INSERT INTO RDS.DimAssessmentComponents
		(
			  AssessmentComponentTypeCode
			, AssessmentComponentTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAssessmentComponents main
		ON ceds.CedsOptionSetCode = main.AssessmentComponentTypeCode
	WHERE main.DimAssessmentComponentId IS NULL
		AND ceds.CedsElementTechnicalName = 'AssessmentComponentType'





	PRINT 'Populate DimCipCodes'
	--------------------------------------------------------
	-- Populate DimCipCodes   ---------------
	--------------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimCipCodes d WHERE d.DimCipCodeId = -1) BEGIN
		SET IDENTITY_INSERT rds.DimCipCodes ON

			INSERT INTO RDS.DimCipCodes(
						  DimCipCodeId
						 ,CipCode
					     ,CipDescription
					     ,CipUseCode
					     ,CipUseDescription
						 ,CipVersionCode
						 ,CipVersionDescription
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

		SET IDENTITY_INSERT RDS.DimCipCodes OFF
	END

	IF OBJECT_ID('tempdb..#CipCodeAndVersion') IS NOT NULL
		DROP TABLE #CipCodeAndVersion

	CREATE TABLE #CipCodeAndVersion (CipCode VARCHAR(50), CipDescription VARCHAR(200), CipVersionCode VARCHAR(50), CipVersionDescription VARCHAR(200))

	INSERT INTO #CipCodeAndVersion VALUES ('MISSING', 'MISSING', 'MISSING','MISSING')
	INSERT INTO #CipCodeAndVersion
	VALUES

		('01', 'AGRICULTURAL/ANIMAL/PLANT/VETERINARY SCIENCE AND RELATED FIELDS.', 'CIP2020', 'CIP 2020')
		,('01.00', 'Agriculture, General.', 'CIP2020', 'CIP 2020')
		,('01.0000', 'Agriculture, General.', 'CIP2020', 'CIP 2020')
		,('01.01', 'Agricultural Business and Management.', 'CIP2020', 'CIP 2020')
		,('01.0101', 'Agricultural Business and Management, General.', 'CIP2020', 'CIP 2020')
		,('01.0102', 'Agribusiness/Agricultural Business Operations.', 'CIP2020', 'CIP 2020')
		,('01.0103', 'Agricultural Economics.', 'CIP2020', 'CIP 2020')
		,('01.0104', 'Farm/Farm and Ranch Management.', 'CIP2020', 'CIP 2020')
		,('01.0105', 'Agricultural/Farm Supplies Retailing and Wholesaling.', 'CIP2020', 'CIP 2020')
		,('01.0106', 'Agricultural Business Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('01.0199', 'Agricultural Business and Management, Other.', 'CIP2020', 'CIP 2020')
		,('01.02', 'Agricultural Mechanization.', 'CIP2020', 'CIP 2020')
		,('01.0201', 'Agricultural Mechanization, General.', 'CIP2020', 'CIP 2020')
		,('01.0204', 'Agricultural Power Machinery Operation.', 'CIP2020', 'CIP 2020')
		,('01.0205', 'Agricultural Mechanics and Equipment/Machine Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('01.0207', 'Irrigation Management Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('01.0299', 'Agricultural Mechanization, Other.', 'CIP2020', 'CIP 2020')
		,('01.03', 'Agricultural Production Operations.', 'CIP2020', 'CIP 2020')
		,('01.0301', 'Agricultural Production Operations, General.', 'CIP2020', 'CIP 2020')
		,('01.0302', 'Animal/Livestock Husbandry and Production.', 'CIP2020', 'CIP 2020')
		,('01.0303', 'Aquaculture.', 'CIP2020', 'CIP 2020')
		,('01.0304', 'Crop Production.', 'CIP2020', 'CIP 2020')
		,('01.0306', 'Dairy Husbandry and Production.', 'CIP2020', 'CIP 2020')
		,('01.0307', 'Horse Husbandry/Equine Science and Management.', 'CIP2020', 'CIP 2020')
		,('01.0308', 'Agroecology and Sustainable Agriculture.', 'CIP2020', 'CIP 2020')
		,('01.1004', 'Viticulture and Enology.', 'CIP2020', 'CIP 2020')
		,('01.0310', 'Apiculture.', 'CIP2020', 'CIP 2020')
		,('01.0399', 'Agricultural Production Operations, Other.', 'CIP2020', 'CIP 2020')
		,('01.04', 'Agricultural and Food Products Processing.', 'CIP2020', 'CIP 2020')
		,('01.0401', 'Agricultural and Food Products Processing.', 'CIP2020', 'CIP 2020')
		,('01.0480', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('01.05', 'Agricultural and Domestic Animal Services.', 'CIP2020', 'CIP 2020')
		,('01.0504', 'Dog/Pet/Animal Grooming.', 'CIP2020', 'CIP 2020')
		,('01.0505', 'Animal Training.', 'CIP2020', 'CIP 2020')
		,('01.0507', 'Equestrian/Equine Studies.', 'CIP2020', 'CIP 2020')
		,('01.0508', 'Taxidermy/Taxidermist.', 'CIP2020', 'CIP 2020')
		,('01.0509', 'Farrier Science.', 'CIP2020', 'CIP 2020')
		,('01.0599', 'Agricultural and Domestic Animal Services, Other.', 'CIP2020', 'CIP 2020')
		,('01.06', 'Applied Horticulture and Horticultural Business Services.', 'CIP2020', 'CIP 2020')
		,('01.0601', 'Applied Horticulture/Horticulture Operations, General.', 'CIP2020', 'CIP 2020')
		,('01.0603', 'Ornamental Horticulture.', 'CIP2020', 'CIP 2020')
		,('01.0604', 'Greenhouse Operations and Management.', 'CIP2020', 'CIP 2020')
		,('01.0605', 'Landscaping and Groundskeeping.', 'CIP2020', 'CIP 2020')
		,('01.0606', 'Plant Nursery Operations and Management.', 'CIP2020', 'CIP 2020')
		,('01.0607', 'Turf and Turfgrass Management.', 'CIP2020', 'CIP 2020')
		,('01.0608', 'Floriculture/Floristry Operations and Management.', 'CIP2020', 'CIP 2020')
		,('01.0609', 'Public Horticulture.', 'CIP2020', 'CIP 2020')
		,('01.0610', 'Urban and Community Horticulture.', 'CIP2020', 'CIP 2020')
		,('01.0680', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('01.0699', 'Applied Horticulture/Horticultural Business Services, Other.', 'CIP2020', 'CIP 2020')
		,('01.07', 'International Agriculture.', 'CIP2020', 'CIP 2020')
		,('01.0701', 'International Agriculture.', 'CIP2020', 'CIP 2020')
		,('01.08', 'Agricultural Public Services.', 'CIP2020', 'CIP 2020')
		,('01.0801', 'Agricultural and Extension Education Services.', 'CIP2020', 'CIP 2020')
		,('01.0802', 'Agricultural Communication/Journalism.', 'CIP2020', 'CIP 2020')
		,('01.0899', 'Agricultural Public Services, Other.', 'CIP2020', 'CIP 2020')
		,('01.09', 'Animal Sciences.', 'CIP2020', 'CIP 2020')
		,('01.0901', 'Animal Sciences, General.', 'CIP2020', 'CIP 2020')
		,('01.0902', 'Agricultural Animal Breeding.', 'CIP2020', 'CIP 2020')
		,('01.0903', 'Animal Health.', 'CIP2020', 'CIP 2020')
		,('01.0904', 'Animal Nutrition.', 'CIP2020', 'CIP 2020')
		,('01.0905', 'Dairy Science.', 'CIP2020', 'CIP 2020')
		,('01.0906', 'Livestock Management.', 'CIP2020', 'CIP 2020')
		,('01.0907', 'Poultry Science.', 'CIP2020', 'CIP 2020')
		,('01.0999', 'Animal Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('01.10', 'Food Science and Technology.', 'CIP2020', 'CIP 2020')
		,('01.1001', 'Food Science.', 'CIP2020', 'CIP 2020')
		,('01.1002', 'Food Technology and Processing.', 'CIP2020', 'CIP 2020')
		,('01.1003', 'Brewing Science.', 'CIP2020', 'CIP 2020')
		,('01.1005', 'Zymology/Fermentation Science.', 'CIP2020', 'CIP 2020')
		,('01.1099', 'Food Science and Technology, Other.', 'CIP2020', 'CIP 2020')
		,('01.11', 'Plant Sciences.', 'CIP2020', 'CIP 2020')
		,('01.1101', 'Plant Sciences, General.', 'CIP2020', 'CIP 2020')
		,('01.1102', 'Agronomy and Crop Science.', 'CIP2020', 'CIP 2020')
		,('01.1103', 'Horticultural Science.', 'CIP2020', 'CIP 2020')
		,('01.1104', 'Agricultural and Horticultural Plant Breeding.', 'CIP2020', 'CIP 2020')
		,('01.1105', 'Plant Protection and Integrated Pest Management.', 'CIP2020', 'CIP 2020')
		,('01.1106', 'Range Science and Management.', 'CIP2020', 'CIP 2020')
		,('01.1180', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('01.1199', 'Plant Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('01.12', 'Soil Sciences.', 'CIP2020', 'CIP 2020')
		,('01.1201', 'Soil Science and Agronomy, General.', 'CIP2020', 'CIP 2020')
		,('01.1202', 'Soil Chemistry and Physics.', 'CIP2020', 'CIP 2020')
		,('01.1203', 'Soil Microbiology.', 'CIP2020', 'CIP 2020')
		,('01.1299', 'Soil Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('01.13', 'Agriculture/Veterinary Preparatory Programs.', 'CIP2020', 'CIP 2020')
		,('01.1399', 'Agriculture/Veterinary Preparatory Programs, Other.', 'CIP2020', 'CIP 2020')
		,('01.82', 'Veterinary Administrative Services.', 'CIP2020', 'CIP 2020')
		,('01.8201', 'Veterinary Administrative Services, General.', 'CIP2020', 'CIP 2020')
		,('01.8202', 'Veterinary Office Management/Administration.', 'CIP2020', 'CIP 2020')
		,('01.8203', 'Veterinary Reception/Receptionist.', 'CIP2020', 'CIP 2020')
		,('01.8204', 'Veterinary Administrative/Executive Assistant and Veterinary Secretary.', 'CIP2020', 'CIP 2020')
		,('01.8299', 'Veterinary Administrative Services, Other.', 'CIP2020', 'CIP 2020')
		,('01.83', 'Veterinary/Animal Health Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('01.8399', 'Veterinary/Animal Health Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('01.99', 'Agricultural/Animal/Plant/Veterinary Science and Related Fields, Other.', 'CIP2020', 'CIP 2020')
		,('01.9999', 'Agricultural/Animal/Plant/Veterinary Science and Related Fields, Other.', 'CIP2020', 'CIP 2020')
		,('03', 'NATURAL RESOURCES AND CONSERVATION.', 'CIP2020', 'CIP 2020')
		,('03.01', 'Natural Resources Conservation and Research.', 'CIP2020', 'CIP 2020')
		,('03.0101', 'Natural Resources/Conservation, General.', 'CIP2020', 'CIP 2020')
		,('03.0103', 'Environmental Studies.', 'CIP2020', 'CIP 2020')
		,('03.0104', 'Environmental Science.', 'CIP2020', 'CIP 2020')
		,('03.0199', 'Natural Resources Conservation and Research, Other.', 'CIP2020', 'CIP 2020')
		,('03.02', 'Environmental/Natural Resources Management and Policy.', 'CIP2020', 'CIP 2020')
		,('03.0201', 'Environmental/Natural Resources Management and Policy, General.', 'CIP2020', 'CIP 2020')
		,('03.0204', 'Environmental/Natural Resource Economics.', 'CIP2020', 'CIP 2020')
		,('03.0205', 'Water, Wetlands, and Marine Resources Management.', 'CIP2020', 'CIP 2020')
		,('03.0206', 'Land Use Planning and Management/Development.', 'CIP2020', 'CIP 2020')
		,('03.0207', 'Environmental/Natural Resource Recreation and Tourism.', 'CIP2020', 'CIP 2020')
		,('03.0208', 'Environmental/Natural Resources Law Enforcement and Protective Services.', 'CIP2020', 'CIP 2020')
		,('03.0209', 'Energy and Environmental Policy.', 'CIP2020', 'CIP 2020')
		,('03.0210', 'Bioenergy.', 'CIP2020', 'CIP 2020')
		,('03.0299', 'Environmental/Natural Resources Management and Policy, Other.', 'CIP2020', 'CIP 2020')
		,('03.03', 'Fishing and Fisheries Sciences and Management.', 'CIP2020', 'CIP 2020')
		,('03.0301', 'Fishing and Fisheries Sciences and Management.', 'CIP2020', 'CIP 2020')
		,('03.05', 'Forestry.', 'CIP2020', 'CIP 2020')
		,('03.0501', 'Forestry, General.', 'CIP2020', 'CIP 2020')
		,('03.0502', 'Forest Sciences and Biology.', 'CIP2020', 'CIP 2020')
		,('03.0506', 'Forest Management/Forest Resources Management.', 'CIP2020', 'CIP 2020')
		,('03.0508', 'Urban Forestry.', 'CIP2020', 'CIP 2020')
		,('03.0509', 'Wood Science and Wood Products/Pulp and Paper Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('03.0510', 'Forest Resources Production and Management.', 'CIP2020', 'CIP 2020')
		,('03.0511', 'Forest Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('03.0599', 'Forestry, Other.', 'CIP2020', 'CIP 2020')
		,('03.06', 'Wildlife and Wildlands Science and Management.', 'CIP2020', 'CIP 2020')
		,('03.0601', 'Wildlife, Fish and Wildlands Science and Management.', 'CIP2020', 'CIP 2020')
		,('03.99', 'Natural Resources and Conservation, Other.', 'CIP2020', 'CIP 2020')
		,('03.9999', 'Natural Resources and Conservation, Other.', 'CIP2020', 'CIP 2020')
		,('04', 'ARCHITECTURE AND RELATED SERVICES.', 'CIP2020', 'CIP 2020')
		,('04.02', 'Architecture.', 'CIP2020', 'CIP 2020')
		,('04.0200', 'Pre-Architecture Studies.', 'CIP2020', 'CIP 2020')
		,('04.0201', 'Architecture.', 'CIP2020', 'CIP 2020')
		,('04.0202', 'Architectural Design.', 'CIP2020', 'CIP 2020')
		,('04.0299', 'Architecture, Other.', 'CIP2020', 'CIP 2020')
		,('04.03', 'City/Urban, Community, and Regional Planning.', 'CIP2020', 'CIP 2020')
		,('04.0301', 'City/Urban, Community, and Regional Planning.', 'CIP2020', 'CIP 2020')
		,('04.04', 'Environmental Design.', 'CIP2020', 'CIP 2020')
		,('04.0401', 'Environmental Design/Architecture.', 'CIP2020', 'CIP 2020')
		,('04.0402', 'Healthcare Environment Design/Architecture.', 'CIP2020', 'CIP 2020')
		,('04.0403', 'Sustainable Design/Architecture.', 'CIP2020', 'CIP 2020')
		,('04.0499', 'Environmental Design, Other.', 'CIP2020', 'CIP 2020')
		,('04.05', 'Interior Architecture.', 'CIP2020', 'CIP 2020')
		,('04.0501', 'Interior Architecture.', 'CIP2020', 'CIP 2020')
		,('04.06', 'Landscape Architecture.', 'CIP2020', 'CIP 2020')
		,('04.0601', 'Landscape Architecture.', 'CIP2020', 'CIP 2020')
		,('04.08', 'Architectural History, Criticism, and Conservation.', 'CIP2020', 'CIP 2020')
		,('04.0801', 'Architectural History and Criticism, General.', 'CIP2020', 'CIP 2020')
		,('04.0802', 'Architectural Conservation.', 'CIP2020', 'CIP 2020')
		,('04.0803', 'Architectural Studies.', 'CIP2020', 'CIP 2020')
		,('04.0899', 'Architectural History, Criticism, and Conservation, Other.', 'CIP2020', 'CIP 2020')
		,('04.09', 'Architectural Sciences and Technology.', 'CIP2020', 'CIP 2020')
		,('04.0901', 'Architectural Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('04.0902', 'Architectural and Building Sciences/Technology.', 'CIP2020', 'CIP 2020')
		,('04.0999', 'Architectural Sciences and Technology, Other.', 'CIP2020', 'CIP 2020')
		,('04.10', 'Real Estate Development.', 'CIP2020', 'CIP 2020')
		,('04.1001', 'Real Estate Development.', 'CIP2020', 'CIP 2020')
		,('04.99', 'Architecture and Related Services, Other.', 'CIP2020', 'CIP 2020')
		,('04.9999', 'Architecture and Related Services, Other.', 'CIP2020', 'CIP 2020')
		,('05', 'AREA, ETHNIC, CULTURAL, GENDER, AND GROUP STUDIES.', 'CIP2020', 'CIP 2020')
		,('05.01', 'Area Studies.', 'CIP2020', 'CIP 2020')
		,('05.0101', 'African Studies.', 'CIP2020', 'CIP 2020')
		,('05.0102', 'American/United States Studies/Civilization.', 'CIP2020', 'CIP 2020')
		,('05.0103', 'Asian Studies/Civilization.', 'CIP2020', 'CIP 2020')
		,('05.0104', 'East Asian Studies.', 'CIP2020', 'CIP 2020')
		,('05.0105', 'Russian, Central European, East European and Eurasian Studies.', 'CIP2020', 'CIP 2020')
		,('05.0106', 'European Studies/Civilization.', 'CIP2020', 'CIP 2020')
		,('05.0107', 'Latin American Studies.', 'CIP2020', 'CIP 2020')
		,('05.0108', 'Near and Middle Eastern Studies.', 'CIP2020', 'CIP 2020')
		,('05.0109', 'Pacific Area/Pacific Rim Studies.', 'CIP2020', 'CIP 2020')
		,('05.0110', 'Russian Studies.', 'CIP2020', 'CIP 2020')
		,('05.0111', 'Scandinavian Studies.', 'CIP2020', 'CIP 2020')
		,('05.0112', 'South Asian Studies.', 'CIP2020', 'CIP 2020')
		,('05.0113', 'Southeast Asian Studies.', 'CIP2020', 'CIP 2020')
		,('05.0114', 'Western European Studies.', 'CIP2020', 'CIP 2020')
		,('05.0115', 'Canadian Studies.', 'CIP2020', 'CIP 2020')
		,('05.0116', 'Balkans Studies.', 'CIP2020', 'CIP 2020')
		,('05.0117', 'Baltic Studies.', 'CIP2020', 'CIP 2020')
		,('05.0118', 'Slavic Studies.', 'CIP2020', 'CIP 2020')
		,('05.0119', 'Caribbean Studies.', 'CIP2020', 'CIP 2020')
		,('05.0120', 'Ural-Altaic and Central Asian Studies.', 'CIP2020', 'CIP 2020')
		,('05.0121', 'Commonwealth Studies.', 'CIP2020', 'CIP 2020')
		,('05.0122', 'Regional Studies (U.S., Canadian, Foreign).', 'CIP2020', 'CIP 2020')
		,('05.0123', 'Chinese Studies.', 'CIP2020', 'CIP 2020')
		,('05.0124', 'French Studies.', 'CIP2020', 'CIP 2020')
		,('05.0125', 'German Studies.', 'CIP2020', 'CIP 2020')
		,('05.0126', 'Italian Studies.', 'CIP2020', 'CIP 2020')
		,('05.0127', 'Japanese Studies.', 'CIP2020', 'CIP 2020')
		,('05.0128', 'Korean Studies.', 'CIP2020', 'CIP 2020')
		,('05.0129', 'Polish Studies.', 'CIP2020', 'CIP 2020')
		,('05.0130', 'Spanish and Iberian Studies.', 'CIP2020', 'CIP 2020')
		,('05.0131', 'Tibetan Studies.', 'CIP2020', 'CIP 2020')
		,('05.0132', 'Ukraine Studies.', 'CIP2020', 'CIP 2020')
		,('05.0133', 'Irish Studies.', 'CIP2020', 'CIP 2020')
		,('05.0134', 'Latin American and Caribbean Studies.', 'CIP2020', 'CIP 2020')
		,('05.0135', 'Appalachian Studies.', 'CIP2020', 'CIP 2020')
		,('05.0136', 'Arctic Studies.', 'CIP2020', 'CIP 2020')
		,('05.0199', 'Area Studies, Other.', 'CIP2020', 'CIP 2020')
		,('05.02', 'Ethnic, Cultural Minority, Gender, and Group Studies.', 'CIP2020', 'CIP 2020')
		,('05.0200', 'Ethnic Studies.', 'CIP2020', 'CIP 2020')
		,('05.0201', 'African-American/Black Studies.', 'CIP2020', 'CIP 2020')
		,('05.0202', 'American Indian/Native American Studies.', 'CIP2020', 'CIP 2020')
		,('05.0203', 'Hispanic-American, Puerto Rican, and Mexican-American/Chicano Studies.', 'CIP2020', 'CIP 2020')
		,('05.0206', 'Asian-American Studies.', 'CIP2020', 'CIP 2020')
		,('05.0207', 'Women&#39;s Studies.', 'CIP2020', 'CIP 2020')
		,('05.0208', 'Gay/Lesbian Studies.', 'CIP2020', 'CIP 2020')
		,('05.0209', 'Folklore Studies.', 'CIP2020', 'CIP 2020')
		,('05.0210', 'Disability Studies.', 'CIP2020', 'CIP 2020')
		,('05.0211', 'Deaf Studies.', 'CIP2020', 'CIP 2020')
		,('05.0212', 'Comparative Group Studies.', 'CIP2020', 'CIP 2020')
		,('05.0299', 'Ethnic, Cultural Minority, Gender, and Group Studies, Other.', 'CIP2020', 'CIP 2020')
		,('05.99', 'Area, Ethnic, Cultural, Gender, and Group Studies, Other.', 'CIP2020', 'CIP 2020')
		,('05.9999', 'Area, Ethnic, Cultural, Gender, and Group Studies, Other.', 'CIP2020', 'CIP 2020')
		,('09', 'COMMUNICATION, JOURNALISM, AND RELATED PROGRAMS.', 'CIP2020', 'CIP 2020')
		,('09.01', 'Communication and Media Studies.', 'CIP2020', 'CIP 2020')
		,('09.0100', 'Communication, General.', 'CIP2020', 'CIP 2020')
		,('09.0101', 'Speech Communication and Rhetoric.', 'CIP2020', 'CIP 2020')
		,('09.0102', 'Mass Communication/Media Studies.', 'CIP2020', 'CIP 2020')
		,('09.0199', 'Communication and Media Studies, Other.', 'CIP2020', 'CIP 2020')
		,('09.04', 'Journalism.', 'CIP2020', 'CIP 2020')
		,('09.0401', 'Journalism.', 'CIP2020', 'CIP 2020')
		,('09.0402', 'Broadcast Journalism.', 'CIP2020', 'CIP 2020')
		,('09.0404', 'Photojournalism.', 'CIP2020', 'CIP 2020')
		,('09.0405', 'Business and Economic Journalism.', 'CIP2020', 'CIP 2020')
		,('09.0406', 'Cultural Journalism.', 'CIP2020', 'CIP 2020')
		,('09.0407', 'Science/Health/Environmental Journalism.', 'CIP2020', 'CIP 2020')
		,('09.0499', 'Journalism, Other.', 'CIP2020', 'CIP 2020')
		,('09.07', 'Radio, Television, and Digital Communication.', 'CIP2020', 'CIP 2020')
		,('09.0701', 'Radio and Television.', 'CIP2020', 'CIP 2020')
		,('09.0702', 'Digital Communication and Media/Multimedia.', 'CIP2020', 'CIP 2020')
		,('09.0799', 'Radio, Television, and Digital Communication, Other.', 'CIP2020', 'CIP 2020')
		,('09.09', 'Public Relations, Advertising, and Applied Communication.', 'CIP2020', 'CIP 2020')
		,('09.0900', 'Public Relations, Advertising, and Applied Communication.', 'CIP2020', 'CIP 2020')
		,('09.0901', 'Organizational Communication, General.', 'CIP2020', 'CIP 2020')
		,('09.0902', 'Public Relations/Image Management.', 'CIP2020', 'CIP 2020')
		,('09.0903', 'Advertising.', 'CIP2020', 'CIP 2020')
		,('09.0904', 'Political Communication.', 'CIP2020', 'CIP 2020')
		,('09.0905', 'Health Communication.', 'CIP2020', 'CIP 2020')
		,('09.0906', 'Sports Communication.', 'CIP2020', 'CIP 2020')
		,('09.0907', 'International and Intercultural Communication.', 'CIP2020', 'CIP 2020')
		,('09.0908', 'Technical and Scientific Communication.', 'CIP2020', 'CIP 2020')
		,('09.0909', 'Communication Management and Strategic Communications.', 'CIP2020', 'CIP 2020')
		,('09.0999', 'Public Relations, Advertising, and Applied Communication, Other.', 'CIP2020', 'CIP 2020')
		,('09.10', 'Publishing.', 'CIP2020', 'CIP 2020')
		,('09.1001', 'Publishing.', 'CIP2020', 'CIP 2020')
		,('09.99', 'Communication, Journalism, and Related Programs, Other.', 'CIP2020', 'CIP 2020')
		,('09.9999', 'Communication, Journalism, and Related Programs, Other.', 'CIP2020', 'CIP 2020')
		,('10', 'COMMUNICATIONS TECHNOLOGIES/TECHNICIANS AND SUPPORT SERVICES.', 'CIP2020', 'CIP 2020')
		,('10.01', 'Communications Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('10.0105', 'Communications Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('10.02', 'Audiovisual Communications Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('10.0201', 'Photographic and Film/Video Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('10.0202', 'Radio and Television Broadcasting Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('10.0203', 'Recording Arts Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('10.0204', 'Voice Writing Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('10.0299', 'Audiovisual Communications Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('10.03', 'Graphic Communications.', 'CIP2020', 'CIP 2020')
		,('10.0301', 'Graphic Communications, General.', 'CIP2020', 'CIP 2020')
		,('10.0302', 'Printing Management.', 'CIP2020', 'CIP 2020')
		,('10.0303', 'Prepress/Desktop Publishing and Digital Imaging Design.', 'CIP2020', 'CIP 2020')
		,('10.0304', 'Animation, Interactive Technology, Video Graphics, and Special Effects.', 'CIP2020', 'CIP 2020')
		,('10.0305', 'Graphic and Printing Equipment Operator, General Production.', 'CIP2020', 'CIP 2020')
		,('10.0306', 'Platemaker/Imager.', 'CIP2020', 'CIP 2020')
		,('10.0307', 'Printing Press Operator.', 'CIP2020', 'CIP 2020')
		,('10.0308', 'Computer Typography and Composition Equipment Operator.', 'CIP2020', 'CIP 2020')
		,('10.0399', 'Graphic Communications, Other.', 'CIP2020', 'CIP 2020')
		,('10.99', 'Communications Technologies/Technicians and Support Services, Other.', 'CIP2020', 'CIP 2020')
		,('10.9999', 'Communications Technologies/Technicians and Support Services, Other.', 'CIP2020', 'CIP 2020')
		,('11', 'COMPUTER AND INFORMATION SCIENCES AND SUPPORT SERVICES.', 'CIP2020', 'CIP 2020')
		,('11.01', 'Computer and Information Sciences, General.', 'CIP2020', 'CIP 2020')
		,('11.0101', 'Computer and Information Sciences, General.', 'CIP2020', 'CIP 2020')
		,('11.0102', 'Artificial Intelligence.', 'CIP2020', 'CIP 2020')
		,('11.0103', 'Information Technology.', 'CIP2020', 'CIP 2020')
		,('11.0104', 'Informatics.', 'CIP2020', 'CIP 2020')
		,('11.0105', 'Human-Centered Technology Design.', 'CIP2020', 'CIP 2020')
		,('11.0199', 'Computer and Information Sciences,  Other.', 'CIP2020', 'CIP 2020')
		,('11.02', 'Computer Programming.', 'CIP2020', 'CIP 2020')
		,('11.0201', 'Computer Programming/Programmer, General.', 'CIP2020', 'CIP 2020')
		,('11.0202', 'Computer Programming, Specific Applications.', 'CIP2020', 'CIP 2020')
		,('11.0203', 'Computer Programming, Vendor/Product Certification.', 'CIP2020', 'CIP 2020')
		,('11.0204', 'Computer Game Programming.', 'CIP2020', 'CIP 2020')
		,('11.0205', 'Computer Programming, Specific Platforms.', 'CIP2020', 'CIP 2020')
		,('11.0299', 'Computer Programming, Other.', 'CIP2020', 'CIP 2020')
		,('11.03', 'Data Processing.', 'CIP2020', 'CIP 2020')
		,('11.0301', 'Data Processing and Data Processing Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('11.04', 'Information Science/Studies.', 'CIP2020', 'CIP 2020')
		,('11.0401', 'Information Science/Studies.', 'CIP2020', 'CIP 2020')
		,('11.05', 'Computer Systems Analysis.', 'CIP2020', 'CIP 2020')
		,('11.0501', 'Computer Systems Analysis/Analyst.', 'CIP2020', 'CIP 2020')
		,('11.06', 'Data Entry/Microcomputer Applications.', 'CIP2020', 'CIP 2020')
		,('11.0601', 'Data Entry/Microcomputer Applications, General.', 'CIP2020', 'CIP 2020')
		,('11.0602', 'Word Processing.', 'CIP2020', 'CIP 2020')
		,('11.0699', 'Data Entry/Microcomputer Applications, Other.', 'CIP2020', 'CIP 2020')
		,('11.07', 'Computer Science.', 'CIP2020', 'CIP 2020')
		,('11.0701', 'Computer Science.', 'CIP2020', 'CIP 2020')
		,('11.08', 'Computer Software and Media Applications.', 'CIP2020', 'CIP 2020')
		,('11.0801', 'Web Page, Digital/Multimedia and Information Resources Design.', 'CIP2020', 'CIP 2020')
		,('11.0802', 'Data Modeling/Warehousing and Database Administration.', 'CIP2020', 'CIP 2020')
		,('11.0803', 'Computer Graphics.', 'CIP2020', 'CIP 2020')
		,('11.0804', 'Modeling, Virtual Environments and Simulation.', 'CIP2020', 'CIP 2020')
		,('11.0899', 'Computer Software and Media Applications, Other.', 'CIP2020', 'CIP 2020')
		,('11.09', 'Computer Systems Networking and Telecommunications.', 'CIP2020', 'CIP 2020')
		,('11.0901', 'Computer Systems Networking and Telecommunications.', 'CIP2020', 'CIP 2020')
		,('11.0902', 'Cloud Computing.', 'CIP2020', 'CIP 2020')
		,('11.0999', 'Computer Systems Networking and Telecommunications, Other.', 'CIP2020', 'CIP 2020')
		,('11.10', 'Computer/Information Technology Administration and Management.', 'CIP2020', 'CIP 2020')
		,('11.1001', 'Network and System Administration/Administrator.', 'CIP2020', 'CIP 2020')
		,('11.1002', 'System, Networking, and LAN/WAN Management/Manager.', 'CIP2020', 'CIP 2020')
		,('11.1003', 'Computer and Information Systems Security/Auditing/Information Assurance.', 'CIP2020', 'CIP 2020')
		,('11.1004', 'Web/Multimedia Management and Webmaster.', 'CIP2020', 'CIP 2020')
		,('11.1005', 'Information Technology Project Management.', 'CIP2020', 'CIP 2020')
		,('11.1006', 'Computer Support Specialist.', 'CIP2020', 'CIP 2020')
		,('11.1099', 'Computer/Information Technology Services Administration and Management, Other.', 'CIP2020', 'CIP 2020')
		,('11.99', 'Computer and Information Sciences and Support Services, Other.', 'CIP2020', 'CIP 2020')
		,('11.9999', 'Computer and Information Sciences and Support Services, Other.', 'CIP2020', 'CIP 2020')
		,('12', 'CULINARY, ENTERTAINMENT, AND PERSONAL SERVICES.', 'CIP2020', 'CIP 2020')
		,('12.03', 'Funeral Service and Mortuary Science.', 'CIP2020', 'CIP 2020')
		,('12.0301', 'Funeral Service and Mortuary Science, General.', 'CIP2020', 'CIP 2020')
		,('12.0302', 'Funeral Direction/Service.', 'CIP2020', 'CIP 2020')
		,('12.0303', 'Mortuary Science and Embalming/Embalmer.', 'CIP2020', 'CIP 2020')
		,('12.0399', 'Funeral Service and Mortuary Science, Other.', 'CIP2020', 'CIP 2020')
		,('12.04', 'Cosmetology and Related Personal Grooming Services.', 'CIP2020', 'CIP 2020')
		,('12.0401', 'Cosmetology/Cosmetologist, General.', 'CIP2020', 'CIP 2020')
		,('12.0402', 'Barbering/Barber.', 'CIP2020', 'CIP 2020')
		,('12.0404', 'Electrolysis/Electrology and Electrolysis Technician.', 'CIP2020', 'CIP 2020')
		,('12.0406', 'Make-Up Artist/Specialist.', 'CIP2020', 'CIP 2020')
		,('12.0407', 'Hair Styling/Stylist and Hair Design.', 'CIP2020', 'CIP 2020')
		,('12.0408', 'Facial Treatment Specialist/Facialist.', 'CIP2020', 'CIP 2020')
		,('12.0409', 'Aesthetician/Esthetician and Skin Care Specialist.', 'CIP2020', 'CIP 2020')
		,('12.0410', 'Nail Technician/Specialist and Manicurist.', 'CIP2020', 'CIP 2020')
		,('12.0411', 'Permanent Cosmetics/Makeup and Tattooing.', 'CIP2020', 'CIP 2020')
		,('12.0412', 'Salon/Beauty Salon Management/Manager.', 'CIP2020', 'CIP 2020')
		,('12.0413', 'Cosmetology, Barber/Styling, and Nail Instructor.', 'CIP2020', 'CIP 2020')
		,('12.0414', 'Master Aesthetician/Esthetician.', 'CIP2020', 'CIP 2020')
		,('12.0499', 'Cosmetology and Related Personal Grooming Arts, Other.', 'CIP2020', 'CIP 2020')
		,('12.05', 'Culinary Arts and Related Services.', 'CIP2020', 'CIP 2020')
		,('12.0500', 'Cooking and Related Culinary Arts, General.', 'CIP2020', 'CIP 2020')
		,('12.0501', 'Baking and Pastry Arts/Baker/Pastry Chef.', 'CIP2020', 'CIP 2020')
		,('12.0502', 'Bartending/Bartender.', 'CIP2020', 'CIP 2020')
		,('12.0503', 'Culinary Arts/Chef Training.', 'CIP2020', 'CIP 2020')
		,('12.0504', 'Restaurant, Culinary, and Catering Management/Manager.', 'CIP2020', 'CIP 2020')
		,('12.0505', 'Food Preparation/Professional Cooking/Kitchen Assistant.', 'CIP2020', 'CIP 2020')
		,('12.0506', 'Meat Cutting/Meat Cutter.', 'CIP2020', 'CIP 2020')
		,('12.0507', 'Food Service, Waiter/Waitress, and Dining Room Management/Manager.', 'CIP2020', 'CIP 2020')
		,('12.0508', 'Institutional Food Workers.', 'CIP2020', 'CIP 2020')
		,('12.0509', 'Culinary Science/Culinology.', 'CIP2020', 'CIP 2020')
		,('12.0510', 'Wine Steward/Sommelier.', 'CIP2020', 'CIP 2020')
		,('12.0580', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('12.0599', 'Culinary Arts and Related Services, Other.', 'CIP2020', 'CIP 2020')
		,('12.06', 'Casino Operations and Services.', 'CIP2020', 'CIP 2020')
		,('12.0601', 'Casino Operations and Services, General.', 'CIP2020', 'CIP 2020')
		,('12.0602', 'Casino Dealing.', 'CIP2020', 'CIP 2020')
		,('12.0699', 'Casino Operations and Services, Other.', 'CIP2020', 'CIP 2020')
		,('12.99', 'Culinary, Entertainment, and Personal Services, Other.', 'CIP2020', 'CIP 2020')
		,('12.9999', 'Culinary, Entertainment, and Personal Services, Other.', 'CIP2020', 'CIP 2020')
		,('13', 'EDUCATION.', 'CIP2020', 'CIP 2020')
		,('13.01', 'Education, General.', 'CIP2020', 'CIP 2020')
		,('13.0101', 'Education, General.', 'CIP2020', 'CIP 2020')
		,('13.02', 'Bilingual, Multilingual, and Multicultural Education.', 'CIP2020', 'CIP 2020')
		,('13.0201', 'Bilingual and Multilingual Education.', 'CIP2020', 'CIP 2020')
		,('13.0202', 'Multicultural Education.', 'CIP2020', 'CIP 2020')
		,('13.0203', 'Indian/Native American Education.', 'CIP2020', 'CIP 2020')
		,('13.0299', 'Bilingual, Multilingual, and Multicultural Education, Other.', 'CIP2020', 'CIP 2020')
		,('13.03', 'Curriculum and Instruction.', 'CIP2020', 'CIP 2020')
		,('13.0301', 'Curriculum and Instruction.', 'CIP2020', 'CIP 2020')
		,('13.04', 'Educational Administration and Supervision.', 'CIP2020', 'CIP 2020')
		,('13.0401', 'Educational Leadership and Administration, General.', 'CIP2020', 'CIP 2020')
		,('13.0402', 'Administration of Special Education.', 'CIP2020', 'CIP 2020')
		,('13.0403', 'Adult and Continuing Education Administration.', 'CIP2020', 'CIP 2020')
		,('13.0404', 'Educational, Instructional, and Curriculum Supervision.', 'CIP2020', 'CIP 2020')
		,('13.0406', 'Higher Education/Higher Education Administration.', 'CIP2020', 'CIP 2020')
		,('13.0407', 'Community College Administration.', 'CIP2020', 'CIP 2020')
		,('13.0408', 'Elementary and Middle School Administration/Principalship.', 'CIP2020', 'CIP 2020')
		,('13.0409', 'Secondary School Administration/Principalship.', 'CIP2020', 'CIP 2020')
		,('13.0410', 'Urban Education and Leadership.', 'CIP2020', 'CIP 2020')
		,('13.0411', 'Superintendency and Educational System Administration.', 'CIP2020', 'CIP 2020')
		,('13.0412', 'International School Administration/Leadership.', 'CIP2020', 'CIP 2020')
		,('13.0413', 'Education Entrepreneurship.', 'CIP2020', 'CIP 2020')
		,('13.0414', 'Early Childhood Program Administration.', 'CIP2020', 'CIP 2020')
		,('13.0499', 'Educational Administration and Supervision, Other.', 'CIP2020', 'CIP 2020')
		,('13.05', 'Educational/Instructional Media Design.', 'CIP2020', 'CIP 2020')
		,('13.0501', 'Educational/Instructional Technology.', 'CIP2020', 'CIP 2020')
		,('13.06', 'Educational Assessment, Evaluation, and Research.', 'CIP2020', 'CIP 2020')
		,('13.0601', 'Educational Evaluation and Research.', 'CIP2020', 'CIP 2020')
		,('13.0603', 'Educational Statistics and Research Methods.', 'CIP2020', 'CIP 2020')
		,('13.0604', 'Educational Assessment, Testing, and Measurement.', 'CIP2020', 'CIP 2020')
		,('13.0607', 'Learning Sciences.', 'CIP2020', 'CIP 2020')
		,('13.0608', 'Institutional Research.', 'CIP2020', 'CIP 2020')
		,('13.0699', 'Educational Assessment, Evaluation, and Research, Other.', 'CIP2020', 'CIP 2020')
		,('13.07', 'International and Comparative Education.', 'CIP2020', 'CIP 2020')
		,('13.0701', 'International and Comparative Education.', 'CIP2020', 'CIP 2020')
		,('13.09', 'Social and Philosophical Foundations of Education.', 'CIP2020', 'CIP 2020')
		,('13.0901', 'Social and Philosophical Foundations of Education.', 'CIP2020', 'CIP 2020')
		,('13.10', 'Special Education and Teaching.', 'CIP2020', 'CIP 2020')
		,('13.1001', 'Special Education and Teaching, General.', 'CIP2020', 'CIP 2020')
		,('13.1003', 'Education/Teaching of Individuals with Hearing Impairments Including Deafness.', 'CIP2020', 'CIP 2020')
		,('13.1004', 'Education/Teaching of the Gifted and Talented.', 'CIP2020', 'CIP 2020')
		,('13.1005', 'Education/Teaching of Individuals with Emotional Disturbances.', 'CIP2020', 'CIP 2020')
		,('13.1006', 'Education/Teaching of Individuals with Intellectual Disabilities.', 'CIP2020', 'CIP 2020')
		,('13.1007', 'Education/Teaching of Individuals with Multiple Disabilities.', 'CIP2020', 'CIP 2020')
		,('13.1008', 'Education/Teaching of Individuals with Orthopedic and Other Physical Health Impairments.', 'CIP2020', 'CIP 2020')
		,('13.1009', 'Education/Teaching of Individuals with Vision Impairments Including Blindness.', 'CIP2020', 'CIP 2020')
		,('13.1011', 'Education/Teaching of Individuals with Specific Learning Disabilities.', 'CIP2020', 'CIP 2020')
		,('13.1012', 'Education/Teaching of Individuals with Speech or Language Impairments.', 'CIP2020', 'CIP 2020')
		,('13.1013', 'Education/Teaching of Individuals with Autism.', 'CIP2020', 'CIP 2020')
		,('13.1014', 'Education/Teaching of Individuals Who are Developmentally Delayed.', 'CIP2020', 'CIP 2020')
		,('13.1015', 'Education/Teaching of Individuals in Early Childhood Special Education Programs.', 'CIP2020', 'CIP 2020')
		,('13.1016', 'Education/Teaching of Individuals with Traumatic Brain Injuries.', 'CIP2020', 'CIP 2020')
		,('13.1017', 'Education/Teaching of Individuals in Elementary Special Education Programs.', 'CIP2020', 'CIP 2020')
		,('13.1018', 'Education/Teaching of Individuals in Junior High/Middle School Special Education Programs.', 'CIP2020', 'CIP 2020')
		,('13.1019', 'Education/Teaching of Individuals in Secondary Special Education Programs.', 'CIP2020', 'CIP 2020')
		,('13.1099', 'Special Education and Teaching, Other.', 'CIP2020', 'CIP 2020')
		,('13.11', 'Student Counseling and Personnel Services.', 'CIP2020', 'CIP 2020')
		,('13.1101', 'Counselor Education/School Counseling and Guidance Services.', 'CIP2020', 'CIP 2020')
		,('13.1102', 'College Student Counseling and Personnel Services.', 'CIP2020', 'CIP 2020')
		,('13.1199', 'Student Counseling and Personnel Services, Other.', 'CIP2020', 'CIP 2020')
		,('13.12', 'Teacher Education and Professional Development, Specific Levels and Methods.', 'CIP2020', 'CIP 2020')
		,('13.1201', 'Adult and Continuing Education and Teaching.', 'CIP2020', 'CIP 2020')
		,('13.1202', 'Elementary Education and Teaching.', 'CIP2020', 'CIP 2020')
		,('13.1203', 'Junior High/Intermediate/Middle School Education and Teaching.', 'CIP2020', 'CIP 2020')
		,('13.1205', 'Secondary Education and Teaching.', 'CIP2020', 'CIP 2020')
		,('13.1206', 'Teacher Education, Multiple Levels.', 'CIP2020', 'CIP 2020')
		,('13.1207', 'Montessori Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1208', 'Waldorf/Steiner Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1209', 'Kindergarten/Preschool Education and Teaching.', 'CIP2020', 'CIP 2020')
		,('13.1210', 'Early Childhood Education and Teaching.', 'CIP2020', 'CIP 2020')
		,('13.1211', 'Online Educator/Online Teaching.', 'CIP2020', 'CIP 2020')
		,('13.1212', 'International Teaching and Learning.', 'CIP2020', 'CIP 2020')
		,('13.1213', 'Science, Technology, Engineering, and Mathematics (STEM) Educational Methods.', 'CIP2020', 'CIP 2020')
		,('13.1214', 'College/Postsecondary/University Teaching.', 'CIP2020', 'CIP 2020')
		,('13.1299', 'Teacher Education and Professional Development, Specific Levels and Methods, Other.', 'CIP2020', 'CIP 2020')
		,('13.13', 'Teacher Education and Professional Development, Specific Subject Areas.', 'CIP2020', 'CIP 2020')
		,('13.1301', 'Agricultural Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1302', 'Art Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1303', 'Business and Innovation/Entrepreneurship Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1304', 'Driver and Safety Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1305', 'English/Language Arts Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1306', 'Foreign Language Teacher  Education.', 'CIP2020', 'CIP 2020')
		,('13.1307', 'Health Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1308', 'Family and Consumer Sciences/Home Economics Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1309', 'Technology Teacher Education/Industrial Arts Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1310', 'Sales and Marketing Operations/Marketing and Distribution   Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1311', 'Mathematics Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1312', 'Music Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1314', 'Physical Education Teaching and Coaching.', 'CIP2020', 'CIP 2020')
		,('13.1315', 'Reading Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1316', 'Science Teacher Education/General Science Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1317', 'Social Science Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1318', 'Social Studies Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1319', 'Technical Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1320', 'Trade and Industrial Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1321', 'Computer Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1322', 'Biology Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1323', 'Chemistry Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1324', 'Drama and Dance Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1325', 'French Language Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1326', 'German Language Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1327', 'Health Occupations Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1328', 'History Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1329', 'Physics Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1330', 'Spanish Language Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1331', 'Speech Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1332', 'Geography Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1333', 'Latin Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1334', 'School Librarian/School Library Media Specialist.', 'CIP2020', 'CIP 2020')
		,('13.1335', 'Psychology Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1337', 'Earth Science Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1338', 'Environmental Education.', 'CIP2020', 'CIP 2020')
		,('13.1339', 'Communication Arts and Literature Teacher Education.', 'CIP2020', 'CIP 2020')
		,('13.1399', 'Teacher Education and Professional Development, Specific Subject Areas, Other.', 'CIP2020', 'CIP 2020')
		,('13.14', 'Teaching English or French as a Second or Foreign Language.', 'CIP2020', 'CIP 2020')
		,('13.1401', 'Teaching English as a Second or Foreign Language/ESL Language Instructor.', 'CIP2020', 'CIP 2020')
		,('13.1402', 'Teaching French as a Second or Foreign Language.', 'CIP2020', 'CIP 2020')
		,('13.1499', 'Teaching English or French as a Second or Foreign Language, Other.', 'CIP2020', 'CIP 2020')
		,('13.15', 'Teaching Assistants/Aides.', 'CIP2020', 'CIP 2020')
		,('13.1501', 'Teacher Assistant/Aide.', 'CIP2020', 'CIP 2020')
		,('13.1502', 'Adult Literacy Tutor/Instructor.', 'CIP2020', 'CIP 2020')
		,('13.1599', 'Teaching Assistants/Aides, Other.', 'CIP2020', 'CIP 2020')
		,('13.99', 'Education, Other.', 'CIP2020', 'CIP 2020')
		,('13.9999', 'Education, Other.', 'CIP2020', 'CIP 2020')
		,('14', 'ENGINEERING.', 'CIP2020', 'CIP 2020')
		,('14.01', 'Engineering, General.', 'CIP2020', 'CIP 2020')
		,('14.0101', 'Engineering, General.', 'CIP2020', 'CIP 2020')
		,('14.0102', 'Pre-Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0103', 'Applied Engineering.', 'CIP2020', 'CIP 2020')
		,('14.02', 'Aerospace, Aeronautical, and Astronautical/Space Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0201', 'Aerospace, Aeronautical, and Astronautical/Space Engineering, General.', 'CIP2020', 'CIP 2020')
		,('14.0202', 'Astronautical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0299', 'Aerospace, Aeronautical, and Astronautical/Space Engineering, Other.', 'CIP2020', 'CIP 2020')
		,('14.03', 'Agricultural Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0301', 'Agricultural Engineering.', 'CIP2020', 'CIP 2020')
		,('14.04', 'Architectural Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0401', 'Architectural Engineering.', 'CIP2020', 'CIP 2020')
		,('14.05', 'Biomedical/Medical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0501', 'Bioengineering and Biomedical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.06', 'Ceramic Sciences and Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0601', 'Ceramic Sciences and Engineering.', 'CIP2020', 'CIP 2020')
		,('14.07', 'Chemical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0701', 'Chemical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0702', 'Chemical and Biomolecular Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0799', 'Chemical Engineering, Other.', 'CIP2020', 'CIP 2020')
		,('14.08', 'Civil Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0801', 'Civil Engineering, General.', 'CIP2020', 'CIP 2020')
		,('14.0802', 'Geotechnical and Geoenvironmental Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0803', 'Structural Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0804', 'Transportation and Highway Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0805', 'Water Resources Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0899', 'Civil Engineering, Other.', 'CIP2020', 'CIP 2020')
		,('14.09', 'Computer Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0901', 'Computer Engineering, General.', 'CIP2020', 'CIP 2020')
		,('14.0902', 'Computer Hardware Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0903', 'Computer Software Engineering.', 'CIP2020', 'CIP 2020')
		,('14.0999', 'Computer Engineering, Other.', 'CIP2020', 'CIP 2020')
		,('14.10', 'Electrical, Electronics, and Communications Engineering.', 'CIP2020', 'CIP 2020')
		,('14.1001', 'Electrical and Electronics Engineering.', 'CIP2020', 'CIP 2020')
		,('14.1003', 'Laser and Optical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.1004', 'Telecommunications Engineering.', 'CIP2020', 'CIP 2020')
		,('14.1099', 'Electrical, Electronics, and Communications Engineering, Other.', 'CIP2020', 'CIP 2020')
		,('14.11', 'Engineering Mechanics.', 'CIP2020', 'CIP 2020')
		,('14.1101', 'Engineering Mechanics.', 'CIP2020', 'CIP 2020')
		,('14.12', 'Engineering Physics.', 'CIP2020', 'CIP 2020')
		,('14.1201', 'Engineering Physics/Applied Physics.', 'CIP2020', 'CIP 2020')
		,('14.13', 'Engineering Science.', 'CIP2020', 'CIP 2020')
		,('14.1301', 'Engineering Science.', 'CIP2020', 'CIP 2020')
		,('14.14', 'Environmental/Environmental Health Engineering.', 'CIP2020', 'CIP 2020')
		,('14.1401', 'Environmental/Environmental Health Engineering.', 'CIP2020', 'CIP 2020')
		,('14.18', 'Materials Engineering.', 'CIP2020', 'CIP 2020')
		,('14.1801', 'Materials Engineering.', 'CIP2020', 'CIP 2020')
		,('14.19', 'Mechanical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.1901', 'Mechanical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.20', 'Metallurgical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.2001', 'Metallurgical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.21', 'Mining and Mineral Engineering.', 'CIP2020', 'CIP 2020')
		,('14.2101', 'Mining and Mineral Engineering.', 'CIP2020', 'CIP 2020')
		,('14.22', 'Naval Architecture and Marine Engineering.', 'CIP2020', 'CIP 2020')
		,('14.2201', 'Naval Architecture and Marine Engineering.', 'CIP2020', 'CIP 2020')
		,('14.23', 'Nuclear Engineering.', 'CIP2020', 'CIP 2020')
		,('14.2301', 'Nuclear Engineering.', 'CIP2020', 'CIP 2020')
		,('14.24', 'Ocean Engineering.', 'CIP2020', 'CIP 2020')
		,('14.2401', 'Ocean Engineering.', 'CIP2020', 'CIP 2020')
		,('14.25', 'Petroleum Engineering.', 'CIP2020', 'CIP 2020')
		,('14.2501', 'Petroleum Engineering.', 'CIP2020', 'CIP 2020')
		,('14.27', 'Systems Engineering.', 'CIP2020', 'CIP 2020')
		,('14.2701', 'Systems Engineering.', 'CIP2020', 'CIP 2020')
		,('14.28', 'Textile Sciences and Engineering.', 'CIP2020', 'CIP 2020')
		,('14.2801', 'Textile Sciences and Engineering.', 'CIP2020', 'CIP 2020')
		,('14.32', 'Polymer/Plastics Engineering.', 'CIP2020', 'CIP 2020')
		,('14.3201', 'Polymer/Plastics Engineering.', 'CIP2020', 'CIP 2020')
		,('14.33', 'Construction Engineering.', 'CIP2020', 'CIP 2020')
		,('14.3301', 'Construction Engineering.', 'CIP2020', 'CIP 2020')
		,('14.34', 'Forest Engineering.', 'CIP2020', 'CIP 2020')
		,('14.3401', 'Forest Engineering.', 'CIP2020', 'CIP 2020')
		,('14.35', 'Industrial Engineering.', 'CIP2020', 'CIP 2020')
		,('14.3501', 'Industrial Engineering.', 'CIP2020', 'CIP 2020')
		,('14.36', 'Manufacturing Engineering.', 'CIP2020', 'CIP 2020')
		,('14.3601', 'Manufacturing Engineering.', 'CIP2020', 'CIP 2020')
		,('14.37', 'Operations Research.', 'CIP2020', 'CIP 2020')
		,('14.3701', 'Operations Research.', 'CIP2020', 'CIP 2020')
		,('14.38', 'Surveying Engineering.', 'CIP2020', 'CIP 2020')
		,('14.3801', 'Surveying Engineering.', 'CIP2020', 'CIP 2020')
		,('14.39', 'Geological/Geophysical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.3901', 'Geological/Geophysical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.40', 'Paper Science and Engineering.', 'CIP2020', 'CIP 2020')
		,('14.4001', 'Paper Science and Engineering.', 'CIP2020', 'CIP 2020')
		,('14.41', 'Electromechanical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.4101', 'Electromechanical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.42', 'Mechatronics, Robotics, and Automation Engineering.', 'CIP2020', 'CIP 2020')
		,('14.4201', 'Mechatronics, Robotics, and Automation Engineering.', 'CIP2020', 'CIP 2020')
		,('14.43', 'Biochemical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.4301', 'Biochemical Engineering.', 'CIP2020', 'CIP 2020')
		,('14.44', 'Engineering Chemistry.', 'CIP2020', 'CIP 2020')
		,('14.4401', 'Engineering Chemistry.', 'CIP2020', 'CIP 2020')
		,('14.45', 'Biological/Biosystems Engineering.', 'CIP2020', 'CIP 2020')
		,('14.4501', 'Biological/Biosystems Engineering.', 'CIP2020', 'CIP 2020')
		,('14.47', 'Electrical and Computer Engineering.', 'CIP2020', 'CIP 2020')
		,('14.4701', 'Electrical and Computer Engineering.', 'CIP2020', 'CIP 2020')
		,('14.48', 'Energy Systems Engineering.', 'CIP2020', 'CIP 2020')
		,('14.4801', 'Energy Systems Engineering, General.', 'CIP2020', 'CIP 2020')
		,('14.4802', 'Power Plant Engineering.', 'CIP2020', 'CIP 2020')
		,('14.4899', 'Energy Systems Engineering, Other.', 'CIP2020', 'CIP 2020')
		,('14.99', 'Engineering, Other.', 'CIP2020', 'CIP 2020')
		,('14.9999', 'Engineering, Other.', 'CIP2020', 'CIP 2020')
		,('15', 'ENGINEERING/ENGINEERING-RELATED TECHNOLOGIES/TECHNICIANS.', 'CIP2020', 'CIP 2020')
		,('15.00', 'Engineering Technologies/Technicians, General.', 'CIP2020', 'CIP 2020')
		,('15.0000', 'Engineering Technologies/Technicians, General.', 'CIP2020', 'CIP 2020')
		,('15.0001', 'Applied Engineering Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.01', 'Architectural Engineering Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.0101', 'Architectural Engineering Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.02', 'Civil Engineering Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.0201', 'Civil Engineering Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.03', 'Electrical/Electronic Engineering Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.0303', 'Electrical, Electronic, and Communications Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0304', 'Laser and Optical Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0305', 'Telecommunications Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0306', 'Integrated Circuit Design Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0307', 'Audio Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0399', 'Electrical/Electronic Engineering Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('15.04', 'Electromechanical Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.0401', 'Biomedical Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0403', 'Electromechanical/Electromechanical Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0404', 'Instrumentation Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0405', 'Robotics Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0406', 'Automation Engineer Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0407', 'Mechatronics, Robotics, and Automation Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0499', 'Electromechanical Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('15.05', 'Environmental Control Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.0501', 'Heating, Ventilation, Air Conditioning and Refrigeration Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.1701', 'Energy Systems Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.1703', 'Solar Energy Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0506', 'Water Quality and Wastewater Treatment Management and Recycling Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0507', 'Environmental/Environmental Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0508', 'Hazardous Materials Management and Waste Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0599', 'Environmental Control Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('15.06', 'Industrial Production Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.0607', 'Plastics and Polymer Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0611', 'Metallurgical Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0612', 'Industrial Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0613', 'Manufacturing Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0614', 'Welding Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0615', 'Chemical Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0616', 'Semiconductor Manufacturing Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0617', 'Composite Materials Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0699', 'Industrial Production Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('15.07', 'Quality Control and Safety Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.0701', 'Occupational Safety and Health Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0702', 'Quality Control Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0703', 'Industrial Safety Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0704', 'Hazardous Materials Information Systems Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0705', 'Process Safety Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0799', 'Quality Control and Safety Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('15.08', 'Mechanical Engineering Related Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.0801', 'Aeronautical/Aerospace Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0803', 'Automotive Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0805', 'Mechanical/Mechanical Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0806', 'Marine Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0807', 'Motorsports Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0899', 'Mechanical Engineering Related Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('15.09', 'Mining and Petroleum Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.0901', 'Mining Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0903', 'Petroleum Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.0999', 'Mining and Petroleum Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('15.10', 'Construction Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.1001', 'Construction Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.11', 'Engineering-Related Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.1102', 'Surveying Technology/Surveying.', 'CIP2020', 'CIP 2020')
		,('15.1103', 'Hydraulics and Fluid Power Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.1199', 'Engineering-Related Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('15.12', 'Computer Engineering Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.1201', 'Computer Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.1202', 'Computer/Computer Systems Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.1203', 'Computer Hardware Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.1204', 'Computer Software Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.1299', 'Computer Engineering Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('15.13', 'Drafting/Design Engineering Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.1301', 'Drafting and Design Technology/Technician, General.', 'CIP2020', 'CIP 2020')
		,('15.1302', 'CAD/CADD Drafting and/or Design Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.1303', 'Architectural Drafting and Architectural CAD/CADD.', 'CIP2020', 'CIP 2020')
		,('15.1304', 'Civil Drafting and Civil Engineering CAD/CADD.', 'CIP2020', 'CIP 2020')
		,('15.1305', 'Electrical/Electronics Drafting and Electrical/Electronics CAD/CADD.', 'CIP2020', 'CIP 2020')
		,('15.1306', 'Mechanical Drafting and Mechanical Drafting CAD/CADD.', 'CIP2020', 'CIP 2020')
		,('15.1307', '3-D Modeling and Design Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.1399', 'Drafting/Design Engineering Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('15.14', 'Nuclear Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.1401', 'Nuclear Engineering Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.15', 'Engineering-Related Fields.', 'CIP2020', 'CIP 2020')
		,('15.1501', 'Engineering/Industrial Management.', 'CIP2020', 'CIP 2020')
		,('15.1502', 'Engineering Design.', 'CIP2020', 'CIP 2020')
		,('15.1503', 'Packaging Science.', 'CIP2020', 'CIP 2020')
		,('15.1599', 'Engineering-Related Fields, Other.', 'CIP2020', 'CIP 2020')
		,('15.16', 'Nanotechnology.', 'CIP2020', 'CIP 2020')
		,('15.1601', 'Nanotechnology.', 'CIP2020', 'CIP 2020')
		,('15.17', 'Energy Systems Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('15.1702', 'Power Plant Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.1704', 'Wind Energy Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.1705', 'Hydroelectric Energy Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.1706', 'Geothermal Energy Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('15.1799', 'Energy Systems Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('15.99', 'Engineering/Engineering-Related Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('15.9999', 'Engineering/Engineering-Related Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('16', 'FOREIGN LANGUAGES, LITERATURES, AND LINGUISTICS.', 'CIP2020', 'CIP 2020')
		,('16.01', 'Linguistic, Comparative, and Related Language Studies and Services.', 'CIP2020', 'CIP 2020')
		,('16.0101', 'Foreign Languages and Literatures, General.', 'CIP2020', 'CIP 2020')
		,('16.0102', 'Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.0103', 'Language Interpretation and Translation.', 'CIP2020', 'CIP 2020')
		,('16.0104', 'Comparative Literature.', 'CIP2020', 'CIP 2020')
		,('16.0105', 'Applied Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.0199', 'Linguistic, Comparative, and Related Language Studies and Services, Other.', 'CIP2020', 'CIP 2020')
		,('16.02', 'African Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.0201', 'African Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.03', 'East Asian Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.0300', 'East Asian Languages, Literatures, and Linguistics, General.', 'CIP2020', 'CIP 2020')
		,('16.0301', 'Chinese Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0302', 'Japanese Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0303', 'Korean Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0304', 'Tibetan Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0399', 'East Asian Languages, Literatures, and Linguistics, Other.', 'CIP2020', 'CIP 2020')
		,('16.04', 'Slavic, Baltic and Albanian Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.0400', 'Slavic Languages, Literatures, and Linguistics, General.', 'CIP2020', 'CIP 2020')
		,('16.0401', 'Baltic Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.0402', 'Russian Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0404', 'Albanian Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0405', 'Bulgarian Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0406', 'Czech Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0407', 'Polish Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0408', 'Bosnian, Serbian, and Croatian Languages and Literatures.', 'CIP2020', 'CIP 2020')
		,('16.0409', 'Slovak Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0410', 'Ukrainian Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0499', 'Slavic, Baltic, and Albanian Languages, Literatures, and Linguistics, Other.', 'CIP2020', 'CIP 2020')
		,('16.05', 'Germanic Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.0500', 'Germanic Languages, Literatures, and Linguistics, General.', 'CIP2020', 'CIP 2020')
		,('16.0501', 'German Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0502', 'Scandinavian Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.0503', 'Danish Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0504', 'Dutch/Flemish Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0505', 'Norwegian Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0506', 'Swedish Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0599', 'Germanic Languages, Literatures, and Linguistics, Other.', 'CIP2020', 'CIP 2020')
		,('16.06', 'Modern Greek Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0601', 'Modern Greek Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.07', 'South Asian Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.0700', 'South Asian Languages, Literatures, and Linguistics, General.', 'CIP2020', 'CIP 2020')
		,('16.0701', 'Hindi Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0702', 'Sanskrit and Classical Indian Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.0704', 'Bengali Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0705', 'Punjabi Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0706', 'Tamil Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0707', 'Urdu Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0799', 'South Asian Languages, Literatures, and Linguistics, Other.', 'CIP2020', 'CIP 2020')
		,('16.08', 'Iranian/Persian Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.0801', 'Iranian Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.09', 'Romance Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.0900', 'Romance Languages, Literatures, and Linguistics, General.', 'CIP2020', 'CIP 2020')
		,('16.0901', 'French Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0902', 'Italian Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0904', 'Portuguese Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0905', 'Spanish Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0906', 'Romanian Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0907', 'Catalan Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.0908', 'Hispanic and Latin American Languages, Literatures, and Linguistics, General.', 'CIP2020', 'CIP 2020')
		,('16.0999', 'Romance Languages, Literatures, and Linguistics, Other.', 'CIP2020', 'CIP 2020')
		,('16.10', 'American Indian/Native American Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.1001', 'American Indian/Native American Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.11', 'Middle/Near Eastern and Semitic Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.1100', 'Middle/Near Eastern and Semitic Languages, Literatures, and Linguistics, General.', 'CIP2020', 'CIP 2020')
		,('16.1101', 'Arabic Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.1102', 'Hebrew Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.1103', 'Ancient Near Eastern and Biblical Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.1199', 'Middle/Near Eastern and Semitic Languages, Literatures, and Linguistics, Other.', 'CIP2020', 'CIP 2020')
		,('16.12', 'Classics and Classical Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.1200', 'Classics and Classical Languages, Literatures, and Linguistics, General.', 'CIP2020', 'CIP 2020')
		,('16.1202', 'Ancient/Classical Greek Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.1203', 'Latin Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.1299', 'Classics and Classical Languages, Literatures, and Linguistics, Other.', 'CIP2020', 'CIP 2020')
		,('16.13', 'Celtic Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.1301', 'Celtic Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.14', 'Southeast Asian and Australasian/Pacific Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.1400', 'Southeast Asian Languages, Literatures, and Linguistics, General.', 'CIP2020', 'CIP 2020')
		,('16.1401', 'Australian/Oceanic/Pacific Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.1402', 'Indonesian/Malay Languages and Literatures.', 'CIP2020', 'CIP 2020')
		,('16.1403', 'Burmese Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.1404', 'Filipino/Tagalog Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.1405', 'Khmer/Cambodian Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.1406', 'Lao Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.1407', 'Thai Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.1408', 'Vietnamese Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.1409', 'Hawaiian Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.1499', 'Southeast Asian and Australasian/Pacific Languages, Literatures, and Linguistics, Other.', 'CIP2020', 'CIP 2020')
		,('16.15', 'Turkic, Uralic-Altaic, Caucasian, and Central Asian Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.1501', 'Turkish Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.1502', 'Uralic Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.1503', 'Hungarian/Magyar Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.1504', 'Mongolian Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.1599', 'Turkic, Uralic-Altaic, Caucasian, and Central Asian Languages, Literatures, and Linguistics, Other.', 'CIP2020', 'CIP 2020')
		,('16.16', 'American Sign Language.', 'CIP2020', 'CIP 2020')
		,('16.1601', 'American Sign Language (ASL).', 'CIP2020', 'CIP 2020')
		,('16.1602', 'Linguistics of ASL and Other Sign Languages.', 'CIP2020', 'CIP 2020')
		,('16.1603', 'Sign Language Interpretation and Translation.', 'CIP2020', 'CIP 2020')
		,('16.1699', 'American Sign Language, Other.', 'CIP2020', 'CIP 2020')
		,('16.17', 'Second Language Learning.', 'CIP2020', 'CIP 2020')
		,('16.1701', 'English as a Second Language.', 'CIP2020', 'CIP 2020')
		,('16.1702', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('16.1799', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('16.18', 'Armenian Languages, Literatures, and Linguistics.', 'CIP2020', 'CIP 2020')
		,('16.1801', 'Armenian Language and Literature.', 'CIP2020', 'CIP 2020')
		,('16.99', 'Foreign Languages, Literatures, and Linguistics, Other.', 'CIP2020', 'CIP 2020')
		,('16.9999', 'Foreign Languages, Literatures, and Linguistics, Other.', 'CIP2020', 'CIP 2020')
		,('19', 'FAMILY AND CONSUMER SCIENCES/HUMAN SCIENCES.', 'CIP2020', 'CIP 2020')
		,('19.10', 'Work and Family Studies.', 'CIP2020', 'CIP 2020')
		,('19.1001', 'Work and Family Studies.', 'CIP2020', 'CIP 2020')
		,('19.01', 'Family and Consumer Sciences/Human Sciences, General.', 'CIP2020', 'CIP 2020')
		,('19.0101', 'Family and Consumer Sciences/Human Sciences, General.', 'CIP2020', 'CIP 2020')
		,('19.02', 'Family and Consumer Sciences/Human Sciences Business Services.', 'CIP2020', 'CIP 2020')
		,('19.0201', 'Business Family and Consumer Sciences/Human Sciences.', 'CIP2020', 'CIP 2020')
		,('19.0202', 'Family and Consumer Sciences/Human Sciences Communication.', 'CIP2020', 'CIP 2020')
		,('19.0203', 'Consumer Merchandising/Retailing Management.', 'CIP2020', 'CIP 2020')
		,('19.0299', 'Family and Consumer Sciences/Human Sciences Business Services, Other.', 'CIP2020', 'CIP 2020')
		,('19.04', 'Family and Consumer Economics and Related Studies.', 'CIP2020', 'CIP 2020')
		,('19.0401', 'Family Resource Management Studies, General.', 'CIP2020', 'CIP 2020')
		,('19.0402', 'Consumer Economics.', 'CIP2020', 'CIP 2020')
		,('19.0403', 'Consumer Services and Advocacy.', 'CIP2020', 'CIP 2020')
		,('19.0499', 'Family and Consumer Economics and Related Services, Other.', 'CIP2020', 'CIP 2020')
		,('19.05', 'Foods, Nutrition, and Related Services.', 'CIP2020', 'CIP 2020')
		,('19.0501', 'Foods, Nutrition, and Wellness Studies, General.', 'CIP2020', 'CIP 2020')
		,('19.0504', 'Human Nutrition.', 'CIP2020', 'CIP 2020')
		,('19.0505', 'Foodservice Systems Administration/Management.', 'CIP2020', 'CIP 2020')
		,('19.0599', 'Foods, Nutrition, and Related Services, Other.', 'CIP2020', 'CIP 2020')
		,('19.06', 'Housing and Human Environments.', 'CIP2020', 'CIP 2020')
		,('19.0601', 'Housing and Human Environments, General.', 'CIP2020', 'CIP 2020')
		,('19.0604', 'Facilities Planning and Management.', 'CIP2020', 'CIP 2020')
		,('19.0605', 'Home Furnishings and Equipment Installers.', 'CIP2020', 'CIP 2020')
		,('19.0699', 'Housing and Human Environments, Other.', 'CIP2020', 'CIP 2020')
		,('19.07', 'Human Development, Family Studies, and Related Services.', 'CIP2020', 'CIP 2020')
		,('19.0701', 'Human Development and Family Studies, General.', 'CIP2020', 'CIP 2020')
		,('19.0702', 'Adult Development and Aging.', 'CIP2020', 'CIP 2020')
		,('19.0704', 'Family Systems.', 'CIP2020', 'CIP 2020')
		,('19.0706', 'Child Development.', 'CIP2020', 'CIP 2020')
		,('19.0707', 'Family and Community Services.', 'CIP2020', 'CIP 2020')
		,('19.0708', 'Child Care and Support Services Management.', 'CIP2020', 'CIP 2020')
		,('19.0709', 'Child Care Provider/Assistant.', 'CIP2020', 'CIP 2020')
		,('19.0710', 'Developmental Services Worker.', 'CIP2020', 'CIP 2020')
		,('19.0711', 'Early Childhood and Family Studies.', 'CIP2020', 'CIP 2020')
		,('19.0712', 'Parent Education Services.', 'CIP2020', 'CIP 2020')
		,('19.0799', 'Human Development, Family Studies, and Related Services, Other.', 'CIP2020', 'CIP 2020')
		,('19.09', 'Apparel and Textiles.', 'CIP2020', 'CIP 2020')
		,('19.0901', 'Apparel and Textiles, General.', 'CIP2020', 'CIP 2020')
		,('19.0902', 'Apparel and Textile Manufacture.', 'CIP2020', 'CIP 2020')
		,('19.0904', 'Textile Science.', 'CIP2020', 'CIP 2020')
		,('19.0905', 'Apparel and Textile Marketing Management.', 'CIP2020', 'CIP 2020')
		,('19.0906', 'Fashion and Fabric Consultant.', 'CIP2020', 'CIP 2020')
		,('19.0999', 'Apparel and Textiles, Other.', 'CIP2020', 'CIP 2020')
		,('19.99', 'Family and Consumer Sciences/Human Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('19.9999', 'Family and Consumer Sciences/Human Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('21', 'RESERVED.', 'CIP2020', 'CIP 2020')
		,('21.01', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('21.0101', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('22', 'LEGAL PROFESSIONS AND STUDIES.', 'CIP2020', 'CIP 2020')
		,('22.00', 'Non-Professional Legal Studies.', 'CIP2020', 'CIP 2020')
		,('22.0000', 'Legal Studies.', 'CIP2020', 'CIP 2020')
		,('22.0001', 'Pre-Law Studies.', 'CIP2020', 'CIP 2020')
		,('22.0099', 'Non-Professional Legal Studies, Other.', 'CIP2020', 'CIP 2020')
		,('22.01', 'Law.', 'CIP2020', 'CIP 2020')
		,('22.0101', 'Law.', 'CIP2020', 'CIP 2020')
		,('22.02', 'Legal Research and Advanced Professional Studies.', 'CIP2020', 'CIP 2020')
		,('22.0201', 'Advanced Legal Research/Studies, General.', 'CIP2020', 'CIP 2020')
		,('22.0202', 'Programs for Foreign Lawyers.', 'CIP2020', 'CIP 2020')
		,('22.0203', 'American/U.S. Law/Legal Studies/Jurisprudence.', 'CIP2020', 'CIP 2020')
		,('22.0204', 'Canadian Law/Legal Studies/Jurisprudence.', 'CIP2020', 'CIP 2020')
		,('22.0205', 'Banking, Corporate, Finance, and Securities Law.', 'CIP2020', 'CIP 2020')
		,('22.0206', 'Comparative Law.', 'CIP2020', 'CIP 2020')
		,('22.0207', 'Energy, Environment, and Natural Resources Law.', 'CIP2020', 'CIP 2020')
		,('22.0208', 'Health Law.', 'CIP2020', 'CIP 2020')
		,('22.0209', 'International Law and Legal Studies.', 'CIP2020', 'CIP 2020')
		,('22.0210', 'International Business, Trade, and Tax Law.', 'CIP2020', 'CIP 2020')
		,('22.0211', 'Tax Law/Taxation.', 'CIP2020', 'CIP 2020')
		,('22.0212', 'Intellectual Property Law.', 'CIP2020', 'CIP 2020')
		,('22.0213', 'Patent Law.', 'CIP2020', 'CIP 2020')
		,('22.0214', 'Agriculture Law.', 'CIP2020', 'CIP 2020')
		,('22.0215', 'Arts and Entertainment Law.', 'CIP2020', 'CIP 2020')
		,('22.0216', 'Compliance Law.', 'CIP2020', 'CIP 2020')
		,('22.0217', 'Criminal Law and Procedure.', 'CIP2020', 'CIP 2020')
		,('22.0218', 'Entrepreneurship Law.', 'CIP2020', 'CIP 2020')
		,('22.0219', 'Family/Child/Elder Law.', 'CIP2020', 'CIP 2020')
		,('22.0220', 'Human Resources Law.', 'CIP2020', 'CIP 2020')
		,('22.0221', 'Insurance Law.', 'CIP2020', 'CIP 2020')
		,('22.0222', 'Real Estate and Land Development Law.', 'CIP2020', 'CIP 2020')
		,('22.0223', 'Transportation Law.', 'CIP2020', 'CIP 2020')
		,('22.0224', 'Tribal/Indigenous Law.', 'CIP2020', 'CIP 2020')
		,('22.0299', 'Legal Research and Advanced Professional Studies, Other.', 'CIP2020', 'CIP 2020')
		,('22.03', 'Legal Support Services.', 'CIP2020', 'CIP 2020')
		,('22.0301', 'Legal Administrative Assistant/Secretary.', 'CIP2020', 'CIP 2020')
		,('22.0302', 'Legal Assistant/Paralegal.', 'CIP2020', 'CIP 2020')
		,('22.0303', 'Court Reporting and Captioning/Court Reporter.', 'CIP2020', 'CIP 2020')
		,('22.0304', 'Court Interpreter.', 'CIP2020', 'CIP 2020')
		,('22.0305', 'Scopist.', 'CIP2020', 'CIP 2020')
		,('22.0399', 'Legal Support Services, Other.', 'CIP2020', 'CIP 2020')
		,('22.99', 'Legal Professions and Studies, Other.', 'CIP2020', 'CIP 2020')
		,('22.9999', 'Legal Professions and Studies, Other.', 'CIP2020', 'CIP 2020')
		,('23', 'ENGLISH LANGUAGE AND LITERATURE/LETTERS.', 'CIP2020', 'CIP 2020')
		,('23.01', 'English Language and Literature, General.', 'CIP2020', 'CIP 2020')
		,('23.0101', 'English Language and Literature, General.', 'CIP2020', 'CIP 2020')
		,('23.13', 'Rhetoric and Composition/Writing Studies.', 'CIP2020', 'CIP 2020')
		,('23.1301', 'Writing, General.', 'CIP2020', 'CIP 2020')
		,('23.1302', 'Creative Writing.', 'CIP2020', 'CIP 2020')
		,('23.1303', 'Professional, Technical, Business, and Scientific Writing.', 'CIP2020', 'CIP 2020')
		,('23.1304', 'Rhetoric and Composition.', 'CIP2020', 'CIP 2020')
		,('23.1399', 'Rhetoric and Composition/Writing Studies, Other.', 'CIP2020', 'CIP 2020')
		,('23.14', 'Literature.', 'CIP2020', 'CIP 2020')
		,('23.1401', 'General Literature.', 'CIP2020', 'CIP 2020')
		,('23.1402', 'American Literature (United States).', 'CIP2020', 'CIP 2020')
		,('23.1403', 'American Literature (Canadian).', 'CIP2020', 'CIP 2020')
		,('23.1404', 'English Literature (British and Commonwealth).', 'CIP2020', 'CIP 2020')
		,('23.1405', 'Children&#39;s and Adolescent Literature.', 'CIP2020', 'CIP 2020')
		,('23.1499', 'Literature, Other.', 'CIP2020', 'CIP 2020')
		,('23.99', 'English Language and Literature/Letters, Other.', 'CIP2020', 'CIP 2020')
		,('23.9999', 'English Language and Literature/Letters, Other.', 'CIP2020', 'CIP 2020')
		,('24', 'LIBERAL ARTS AND SCIENCES, GENERAL STUDIES AND HUMANITIES.', 'CIP2020', 'CIP 2020')
		,('24.01', 'Liberal Arts and Sciences, General Studies and Humanities.', 'CIP2020', 'CIP 2020')
		,('24.0101', 'Liberal Arts and Sciences/Liberal Studies.', 'CIP2020', 'CIP 2020')
		,('24.0102', 'General Studies.', 'CIP2020', 'CIP 2020')
		,('24.0103', 'Humanities/Humanistic Studies.', 'CIP2020', 'CIP 2020')
		,('24.0199', 'Liberal Arts and Sciences, General Studies and Humanities, Other.', 'CIP2020', 'CIP 2020')
		,('25', 'LIBRARY SCIENCE.', 'CIP2020', 'CIP 2020')
		,('25.01', 'Library Science and Administration.', 'CIP2020', 'CIP 2020')
		,('25.0101', 'Library and Information Science.', 'CIP2020', 'CIP 2020')
		,('25.0102', 'Children and Youth Library Services.', 'CIP2020', 'CIP 2020')
		,('25.0103', 'Archives/Archival Administration.', 'CIP2020', 'CIP 2020')
		,('25.0199', 'Library Science and Administration, Other.', 'CIP2020', 'CIP 2020')
		,('25.03', 'Library and Archives Assisting.', 'CIP2020', 'CIP 2020')
		,('25.0301', 'Library and Archives Assisting.', 'CIP2020', 'CIP 2020')
		,('25.99', 'Library Science, Other.', 'CIP2020', 'CIP 2020')
		,('25.9999', 'Library Science, Other.', 'CIP2020', 'CIP 2020')
		,('26', 'BIOLOGICAL AND BIOMEDICAL SCIENCES.', 'CIP2020', 'CIP 2020')
		,('26.01', 'Biology, General.', 'CIP2020', 'CIP 2020')
		,('26.0101', 'Biology/Biological Sciences, General.', 'CIP2020', 'CIP 2020')
		,('26.0102', 'Biomedical Sciences, General.', 'CIP2020', 'CIP 2020')
		,('26.02', 'Biochemistry, Biophysics and Molecular Biology.', 'CIP2020', 'CIP 2020')
		,('26.0202', 'Biochemistry.', 'CIP2020', 'CIP 2020')
		,('26.0203', 'Biophysics.', 'CIP2020', 'CIP 2020')
		,('26.0204', 'Molecular Biology.', 'CIP2020', 'CIP 2020')
		,('26.0205', 'Molecular Biochemistry.', 'CIP2020', 'CIP 2020')
		,('26.0206', 'Molecular Biophysics.', 'CIP2020', 'CIP 2020')
		,('26.0207', 'Structural Biology.', 'CIP2020', 'CIP 2020')
		,('26.0208', 'Photobiology.', 'CIP2020', 'CIP 2020')
		,('26.0209', 'Radiation Biology/Radiobiology.', 'CIP2020', 'CIP 2020')
		,('26.0210', 'Biochemistry and Molecular Biology.', 'CIP2020', 'CIP 2020')
		,('26.0299', 'Biochemistry, Biophysics and Molecular Biology, Other.', 'CIP2020', 'CIP 2020')
		,('26.03', 'Botany/Plant Biology.', 'CIP2020', 'CIP 2020')
		,('26.0301', 'Botany/Plant Biology.', 'CIP2020', 'CIP 2020')
		,('26.0305', 'Plant Pathology/Phytopathology.', 'CIP2020', 'CIP 2020')
		,('26.0307', 'Plant Physiology.', 'CIP2020', 'CIP 2020')
		,('26.0308', 'Plant Molecular Biology.', 'CIP2020', 'CIP 2020')
		,('26.0399', 'Botany/Plant Biology, Other.', 'CIP2020', 'CIP 2020')
		,('26.04', 'Cell/Cellular Biology and Anatomical Sciences.', 'CIP2020', 'CIP 2020')
		,('26.0401', 'Cell/Cellular Biology and Histology.', 'CIP2020', 'CIP 2020')
		,('26.0403', 'Anatomy.', 'CIP2020', 'CIP 2020')
		,('26.0404', 'Developmental Biology and Embryology.', 'CIP2020', 'CIP 2020')
		,('26.0406', 'Cell/Cellular and Molecular Biology.', 'CIP2020', 'CIP 2020')
		,('26.0407', 'Cell Biology and Anatomy.', 'CIP2020', 'CIP 2020')
		,('26.0499', 'Cell/Cellular Biology and Anatomical Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('26.05', 'Microbiological Sciences and Immunology.', 'CIP2020', 'CIP 2020')
		,('26.0502', 'Microbiology, General.', 'CIP2020', 'CIP 2020')
		,('26.0503', 'Medical Microbiology and Bacteriology.', 'CIP2020', 'CIP 2020')
		,('26.0504', 'Virology.', 'CIP2020', 'CIP 2020')
		,('26.0505', 'Parasitology.', 'CIP2020', 'CIP 2020')
		,('26.0506', 'Mycology.', 'CIP2020', 'CIP 2020')
		,('26.0507', 'Immunology.', 'CIP2020', 'CIP 2020')
		,('26.0508', 'Microbiology and Immunology.', 'CIP2020', 'CIP 2020')
		,('26.0509', 'Infectious Disease and Global Health.', 'CIP2020', 'CIP 2020')
		,('26.0599', 'Microbiological Sciences and Immunology, Other.', 'CIP2020', 'CIP 2020')
		,('26.07', 'Zoology/Animal Biology.', 'CIP2020', 'CIP 2020')
		,('26.0701', 'Zoology/Animal Biology.', 'CIP2020', 'CIP 2020')
		,('26.0702', 'Entomology.', 'CIP2020', 'CIP 2020')
		,('26.0707', 'Animal Physiology.', 'CIP2020', 'CIP 2020')
		,('26.0708', 'Animal Behavior and Ethology.', 'CIP2020', 'CIP 2020')
		,('26.0709', 'Wildlife Biology.', 'CIP2020', 'CIP 2020')
		,('26.0799', 'Zoology/Animal Biology, Other.', 'CIP2020', 'CIP 2020')
		,('26.08', 'Genetics.', 'CIP2020', 'CIP 2020')
		,('26.0801', 'Genetics, General.', 'CIP2020', 'CIP 2020')
		,('26.0802', 'Molecular Genetics.', 'CIP2020', 'CIP 2020')
		,('26.0803', 'Microbial and Eukaryotic Genetics.', 'CIP2020', 'CIP 2020')
		,('26.0804', 'Animal Genetics.', 'CIP2020', 'CIP 2020')
		,('26.0805', 'Plant Genetics.', 'CIP2020', 'CIP 2020')
		,('26.0806', 'Human/Medical Genetics.', 'CIP2020', 'CIP 2020')
		,('26.0807', 'Genome Sciences/Genomics.', 'CIP2020', 'CIP 2020')
		,('26.0899', 'Genetics, Other.', 'CIP2020', 'CIP 2020')
		,('26.09', 'Physiology, Pathology and Related Sciences.', 'CIP2020', 'CIP 2020')
		,('26.0901', 'Physiology, General.', 'CIP2020', 'CIP 2020')
		,('26.0902', 'Molecular Physiology.', 'CIP2020', 'CIP 2020')
		,('26.0903', 'Cell Physiology.', 'CIP2020', 'CIP 2020')
		,('26.0904', 'Endocrinology.', 'CIP2020', 'CIP 2020')
		,('26.0905', 'Reproductive Biology.', 'CIP2020', 'CIP 2020')
		,('26.0907', 'Cardiovascular Science.', 'CIP2020', 'CIP 2020')
		,('26.0908', 'Exercise Physiology and Kinesiology.', 'CIP2020', 'CIP 2020')
		,('26.0909', 'Vision Science/Physiological Optics.', 'CIP2020', 'CIP 2020')
		,('26.0910', 'Pathology/Experimental Pathology.', 'CIP2020', 'CIP 2020')
		,('26.0911', 'Oncology and Cancer Biology.', 'CIP2020', 'CIP 2020')
		,('26.0912', 'Aerospace Physiology and Medicine.', 'CIP2020', 'CIP 2020')
		,('26.0913', 'Biomechanics.', 'CIP2020', 'CIP 2020')
		,('26.0999', 'Physiology, Pathology, and Related Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('26.10', 'Pharmacology and Toxicology.', 'CIP2020', 'CIP 2020')
		,('26.1001', 'Pharmacology.', 'CIP2020', 'CIP 2020')
		,('26.1002', 'Molecular Pharmacology.', 'CIP2020', 'CIP 2020')
		,('26.1003', 'Neuropharmacology.', 'CIP2020', 'CIP 2020')
		,('26.1004', 'Toxicology.', 'CIP2020', 'CIP 2020')
		,('26.1005', 'Molecular Toxicology.', 'CIP2020', 'CIP 2020')
		,('26.1006', 'Environmental Toxicology.', 'CIP2020', 'CIP 2020')
		,('26.1007', 'Pharmacology and Toxicology.', 'CIP2020', 'CIP 2020')
		,('26.1099', 'Pharmacology and Toxicology, Other.', 'CIP2020', 'CIP 2020')
		,('26.11', 'Biomathematics, Bioinformatics, and Computational Biology.', 'CIP2020', 'CIP 2020')
		,('26.1101', 'Biometry/Biometrics.', 'CIP2020', 'CIP 2020')
		,('26.1102', 'Biostatistics.', 'CIP2020', 'CIP 2020')
		,('26.1103', 'Bioinformatics.', 'CIP2020', 'CIP 2020')
		,('26.1104', 'Computational Biology.', 'CIP2020', 'CIP 2020')
		,('26.1199', 'Biomathematics, Bioinformatics, and Computational Biology, Other.', 'CIP2020', 'CIP 2020')
		,('26.12', 'Biotechnology.', 'CIP2020', 'CIP 2020')
		,('26.1201', 'Biotechnology.', 'CIP2020', 'CIP 2020')
		,('26.13', 'Ecology, Evolution, Systematics, and Population Biology.', 'CIP2020', 'CIP 2020')
		,('26.1301', 'Ecology.', 'CIP2020', 'CIP 2020')
		,('26.1302', 'Marine Biology and Biological Oceanography.', 'CIP2020', 'CIP 2020')
		,('26.1303', 'Evolutionary Biology.', 'CIP2020', 'CIP 2020')
		,('26.1304', 'Aquatic Biology/Limnology.', 'CIP2020', 'CIP 2020')

	INSERT INTO #CipCodeAndVersion
	VALUES
		 ('26.1305', 'Environmental Biology.', 'CIP2020', 'CIP 2020')
		,('26.1306', 'Population Biology.', 'CIP2020', 'CIP 2020')
		,('26.1307', 'Conservation Biology.', 'CIP2020', 'CIP 2020')
		,('26.1308', 'Systematic Biology/Biological Systematics.', 'CIP2020', 'CIP 2020')
		,('26.1309', 'Epidemiology.', 'CIP2020', 'CIP 2020')
		,('26.1310', 'Ecology and Evolutionary Biology.', 'CIP2020', 'CIP 2020')
		,('26.1311', 'Epidemiology and Biostatistics.', 'CIP2020', 'CIP 2020')
		,('26.1399', 'Ecology, Evolution, Systematics and Population Biology, Other.', 'CIP2020', 'CIP 2020')
		,('26.14', 'Molecular Medicine.', 'CIP2020', 'CIP 2020')
		,('26.1401', 'Molecular Medicine.', 'CIP2020', 'CIP 2020')
		,('26.15', 'Neurobiology and Neurosciences.', 'CIP2020', 'CIP 2020')
		,('26.1501', 'Neuroscience.', 'CIP2020', 'CIP 2020')
		,('26.1502', 'Neuroanatomy.', 'CIP2020', 'CIP 2020')
		,('26.1503', 'Neurobiology and Anatomy.', 'CIP2020', 'CIP 2020')
		,('26.1504', 'Neurobiology and Behavior.', 'CIP2020', 'CIP 2020')
		,('26.1599', 'Neurobiology and Neurosciences, Other.', 'CIP2020', 'CIP 2020')
		,('26.99', 'Biological and Biomedical Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('26.9999', 'Biological and Biomedical Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('27', 'MATHEMATICS AND STATISTICS.', 'CIP2020', 'CIP 2020')
		,('27.01', 'Mathematics.', 'CIP2020', 'CIP 2020')
		,('27.0101', 'Mathematics, General.', 'CIP2020', 'CIP 2020')
		,('27.0102', 'Algebra and Number Theory.', 'CIP2020', 'CIP 2020')
		,('27.0103', 'Analysis and Functional Analysis.', 'CIP2020', 'CIP 2020')
		,('27.0104', 'Geometry/Geometric Analysis.', 'CIP2020', 'CIP 2020')
		,('27.0105', 'Topology and Foundations.', 'CIP2020', 'CIP 2020')
		,('27.0199', 'Mathematics, Other.', 'CIP2020', 'CIP 2020')
		,('27.03', 'Applied Mathematics.', 'CIP2020', 'CIP 2020')
		,('27.0301', 'Applied Mathematics, General.', 'CIP2020', 'CIP 2020')
		,('27.0303', 'Computational Mathematics.', 'CIP2020', 'CIP 2020')
		,('27.0304', 'Computational and Applied Mathematics.', 'CIP2020', 'CIP 2020')
		,('27.0305', 'Financial Mathematics.', 'CIP2020', 'CIP 2020')
		,('27.0306', 'Mathematical Biology.', 'CIP2020', 'CIP 2020')
		,('27.0399', 'Applied Mathematics, Other.', 'CIP2020', 'CIP 2020')
		,('27.05', 'Statistics.', 'CIP2020', 'CIP 2020')
		,('27.0501', 'Statistics, General.', 'CIP2020', 'CIP 2020')
		,('27.0502', 'Mathematical Statistics and Probability.', 'CIP2020', 'CIP 2020')
		,('27.0503', 'Mathematics and Statistics.', 'CIP2020', 'CIP 2020')
		,('27.0599', 'Statistics, Other.', 'CIP2020', 'CIP 2020')
		,('27.06', 'Applied Statistics.', 'CIP2020', 'CIP 2020')
		,('27.0601', 'Applied Statistics, General.', 'CIP2020', 'CIP 2020')
		,('27.99', 'Mathematics and Statistics, Other.', 'CIP2020', 'CIP 2020')
		,('27.9999', 'Mathematics and Statistics, Other.', 'CIP2020', 'CIP 2020')
		,('28', 'MILITARY SCIENCE, LEADERSHIP AND OPERATIONAL ART.', 'CIP2020', 'CIP 2020')
		,('28.01', 'Air Force ROTC, Air Science and Operations.', 'CIP2020', 'CIP 2020')
		,('28.0101', 'Air Force JROTC/ROTC.', 'CIP2020', 'CIP 2020')
		,('28.0199', 'Air Force ROTC, Air Science and Operations, Other.', 'CIP2020', 'CIP 2020')
		,('28.03', 'Army ROTC, Military Science and Operations.', 'CIP2020', 'CIP 2020')
		,('28.0301', 'Army JROTC/ROTC.', 'CIP2020', 'CIP 2020')
		,('28.0399', 'Army ROTC, Military Science and Operations, Other.', 'CIP2020', 'CIP 2020')
		,('28.04', 'Navy/Marine ROTC, Naval Science and Operations.', 'CIP2020', 'CIP 2020')
		,('28.0401', 'Navy/Marine Corps JROTC/ROTC.', 'CIP2020', 'CIP 2020')
		,('28.0499', 'Navy/Marine Corps ROTC, Naval Science and Operations, Other.', 'CIP2020', 'CIP 2020')
		,('28.05', 'Military Science and Operational Studies.', 'CIP2020', 'CIP 2020')
		,('28.0501', 'Air Science/Airpower Studies.', 'CIP2020', 'CIP 2020')
		,('28.0502', 'Air and Space Operational Art and Science.', 'CIP2020', 'CIP 2020')
		,('28.0503', 'Military Operational Art and Science/Studies.', 'CIP2020', 'CIP 2020')
		,('28.0504', 'Advanced Military and Operational Studies.', 'CIP2020', 'CIP 2020')
		,('28.0505', 'Naval Science and Operational Studies.', 'CIP2020', 'CIP 2020')
		,('28.0506', 'Special, Irregular and Counterterrorist Operations.', 'CIP2020', 'CIP 2020')
		,('28.0599', 'Military Science and Operational Studies, Other.', 'CIP2020', 'CIP 2020')
		,('28.06', 'Security Policy and Strategy.', 'CIP2020', 'CIP 2020')
		,('28.0601', 'Strategic Studies, General.', 'CIP2020', 'CIP 2020')
		,('28.0602', 'Military and Strategic Leadership.', 'CIP2020', 'CIP 2020')
		,('28.0603', 'Military and International Operational Law.', 'CIP2020', 'CIP 2020')
		,('28.0604', 'Joint Operations Planning and Strategy.', 'CIP2020', 'CIP 2020')
		,('28.0605', 'Weapons of Mass Destruction.', 'CIP2020', 'CIP 2020')
		,('28.0699', 'National Security Policy and Strategy, Other.', 'CIP2020', 'CIP 2020')
		,('28.07', 'Military Economics and Management.', 'CIP2020', 'CIP 2020')
		,('28.0701', 'National Resource Strategy and Policy.', 'CIP2020', 'CIP 2020')
		,('28.0702', 'Industry Studies.', 'CIP2020', 'CIP 2020')
		,('28.0703', 'Military Installation Management.', 'CIP2020', 'CIP 2020')
		,('28.0799', 'Military Economics and Management, Other.', 'CIP2020', 'CIP 2020')
		,('28.08', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('28.0801', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('28.99', 'Military Science, Leadership and Operational Art, Other.', 'CIP2020', 'CIP 2020')
		,('28.9999', 'Military Science, Leadership and Operational Art, Other.', 'CIP2020', 'CIP 2020')
		,('29', 'MILITARY TECHNOLOGIES AND APPLIED SCIENCES.', 'CIP2020', 'CIP 2020')
		,('29.02', 'Intelligence, Command Control and Information Operations.', 'CIP2020', 'CIP 2020')
		,('29.0201', 'Intelligence, General.', 'CIP2020', 'CIP 2020')
		,('29.0202', 'Strategic Intelligence.', 'CIP2020', 'CIP 2020')
		,('29.0203', 'Signal/Geospatial Intelligence.', 'CIP2020', 'CIP 2020')
		,('29.0204', 'Command &amp; Control (C3, C4I) Systems and Operations.', 'CIP2020', 'CIP 2020')
		,('29.0205', 'Information Operations/Joint Information Operations.', 'CIP2020', 'CIP 2020')
		,('29.0206', 'Information/Psychological Warfare and Military Media Relations.', 'CIP2020', 'CIP 2020')
		,('29.0207', 'Cyber/Electronic Operations and Warfare.', 'CIP2020', 'CIP 2020')
		,('29.0299', 'Intelligence, Command Control and Information Operations, Other.', 'CIP2020', 'CIP 2020')
		,('29.03', 'Military Applied Sciences.', 'CIP2020', 'CIP 2020')
		,('29.0301', 'Combat Systems Engineering.', 'CIP2020', 'CIP 2020')
		,('29.0302', 'Directed Energy Systems.', 'CIP2020', 'CIP 2020')
		,('29.0303', 'Engineering Acoustics.', 'CIP2020', 'CIP 2020')
		,('29.0304', 'Low-Observables and Stealth Technology.', 'CIP2020', 'CIP 2020')
		,('29.0305', 'Space Systems Operations.', 'CIP2020', 'CIP 2020')
		,('29.0306', 'Operational Oceanography.', 'CIP2020', 'CIP 2020')
		,('29.0307', 'Undersea Warfare.', 'CIP2020', 'CIP 2020')
		,('29.0399', 'Military Applied Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('29.04', 'Military Systems and Maintenance Technology.', 'CIP2020', 'CIP 2020')
		,('29.0401', 'Aerospace Ground Equipment Technology.', 'CIP2020', 'CIP 2020')
		,('29.0402', 'Air and Space Operations Technology.', 'CIP2020', 'CIP 2020')
		,('29.0403', 'Aircraft Armament Systems Technology.', 'CIP2020', 'CIP 2020')
		,('29.0404', 'Explosive Ordinance/Bomb Disposal.', 'CIP2020', 'CIP 2020')
		,('29.0405', 'Joint Command/Task Force (C3, C4I) Systems.', 'CIP2020', 'CIP 2020')
		,('29.0406', 'Military Information Systems Technology.', 'CIP2020', 'CIP 2020')
		,('29.0407', 'Missile and Space Systems Technology.', 'CIP2020', 'CIP 2020')
		,('29.0408', 'Munitions Systems/Ordinance Technology.', 'CIP2020', 'CIP 2020')
		,('29.0409', 'Radar Communications and Systems Technology.', 'CIP2020', 'CIP 2020')
		,('29.0499', 'Military Systems and Maintenance Technology, Other.', 'CIP2020', 'CIP 2020')
		,('29.05', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('29.0501', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('29.06', 'Military Technology and Applied Sciences Management.', 'CIP2020', 'CIP 2020')
		,('29.0601', 'Military Technology and Applied Sciences Management.', 'CIP2020', 'CIP 2020')
		,('29.99', 'Military Technologies and Applied Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('29.9999', 'Military Technologies and Applied Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('30', 'MULTI/INTERDISCIPLINARY STUDIES.', 'CIP2020', 'CIP 2020')
		,('30.00', 'Multi-/Interdisciplinary Studies, General.', 'CIP2020', 'CIP 2020')
		,('30.0000', 'Multi-/Interdisciplinary Studies, General.', 'CIP2020', 'CIP 2020')
		,('30.0001', 'Comprehensive Transition and Postsecondary (CTP) Program.', 'CIP2020', 'CIP 2020')
		,('30.01', 'Biological and Physical Sciences.', 'CIP2020', 'CIP 2020')
		,('30.0101', 'Biological and Physical Sciences.', 'CIP2020', 'CIP 2020')
		,('30.05', 'Peace Studies and Conflict Resolution.', 'CIP2020', 'CIP 2020')
		,('30.0501', 'Peace Studies and Conflict Resolution.', 'CIP2020', 'CIP 2020')
		,('30.06', 'Systems Science and Theory.', 'CIP2020', 'CIP 2020')
		,('30.0601', 'Systems Science and Theory.', 'CIP2020', 'CIP 2020')
		,('30.08', 'Mathematics and Computer Science.', 'CIP2020', 'CIP 2020')
		,('30.0801', 'Mathematics and Computer Science.', 'CIP2020', 'CIP 2020')
		,('30.10', 'Biopsychology.', 'CIP2020', 'CIP 2020')
		,('30.1001', 'Biopsychology.', 'CIP2020', 'CIP 2020')
		,('30.11', 'Gerontology.', 'CIP2020', 'CIP 2020')
		,('30.1101', 'Gerontology.', 'CIP2020', 'CIP 2020')
		,('30.12', 'Historic Preservation and Conservation.', 'CIP2020', 'CIP 2020')
		,('30.1201', 'Historic Preservation and Conservation, General.', 'CIP2020', 'CIP 2020')
		,('30.1202', 'Cultural Resource Management and Policy Analysis.', 'CIP2020', 'CIP 2020')
		,('30.1299', 'Historic Preservation and Conservation, Other.', 'CIP2020', 'CIP 2020')
		,('30.13', 'Medieval and Renaissance Studies.', 'CIP2020', 'CIP 2020')
		,('30.1301', 'Medieval and Renaissance Studies.', 'CIP2020', 'CIP 2020')
		,('30.14', 'Museology/Museum Studies.', 'CIP2020', 'CIP 2020')
		,('30.1401', 'Museology/Museum Studies.', 'CIP2020', 'CIP 2020')
		,('30.15', 'Science, Technology and Society.', 'CIP2020', 'CIP 2020')
		,('30.1501', 'Science, Technology and Society.', 'CIP2020', 'CIP 2020')
		,('30.16', 'Accounting and Computer Science.', 'CIP2020', 'CIP 2020')
		,('30.1601', 'Accounting and Computer Science.', 'CIP2020', 'CIP 2020')
		,('30.17', 'Behavioral Sciences.', 'CIP2020', 'CIP 2020')
		,('30.1701', 'Behavioral Sciences.', 'CIP2020', 'CIP 2020')
		,('30.18', 'Natural Sciences.', 'CIP2020', 'CIP 2020')
		,('30.1801', 'Natural Sciences.', 'CIP2020', 'CIP 2020')
		,('30.19', 'Nutrition Sciences.', 'CIP2020', 'CIP 2020')
		,('30.1901', 'Nutrition Sciences.', 'CIP2020', 'CIP 2020')
		,('30.20', 'International/Globalization Studies.', 'CIP2020', 'CIP 2020')
		,('30.2001', 'International/Globalization Studies.', 'CIP2020', 'CIP 2020')
		,('30.21', 'Holocaust and Related Studies.', 'CIP2020', 'CIP 2020')
		,('30.2101', 'Holocaust and Related Studies.', 'CIP2020', 'CIP 2020')
		,('30.22', 'Classical and Ancient Studies.', 'CIP2020', 'CIP 2020')
		,('30.2201', 'Ancient Studies/Civilization.', 'CIP2020', 'CIP 2020')
		,('30.2202', 'Classical, Ancient Mediterranean, and Near Eastern Studies and Archaeology.', 'CIP2020', 'CIP 2020')
		,('30.2299', 'Classical and Ancient Studies, Other.', 'CIP2020', 'CIP 2020')
		,('30.23', 'Intercultural/Multicultural and Diversity Studies.', 'CIP2020', 'CIP 2020')
		,('30.2301', 'Intercultural/Multicultural and Diversity Studies.', 'CIP2020', 'CIP 2020')
		,('30.25', 'Cognitive Science.', 'CIP2020', 'CIP 2020')
		,('30.2501', 'Cognitive Science, General.', 'CIP2020', 'CIP 2020')
		,('30.2502', 'Contemplative Studies/Inquiry.', 'CIP2020', 'CIP 2020')
		,('30.2599', 'Cognitive Science, Other.', 'CIP2020', 'CIP 2020')
		,('30.26', 'Cultural Studies/Critical Theory and Analysis.', 'CIP2020', 'CIP 2020')
		,('30.2601', 'Cultural Studies/Critical Theory and Analysis.', 'CIP2020', 'CIP 2020')
		,('30.27', 'Human Biology.', 'CIP2020', 'CIP 2020')
		,('30.2701', 'Human Biology.', 'CIP2020', 'CIP 2020')
		,('30.28', 'Dispute Resolution.', 'CIP2020', 'CIP 2020')
		,('30.2801', 'Dispute Resolution.', 'CIP2020', 'CIP 2020')
		,('30.29', 'Maritime Studies.', 'CIP2020', 'CIP 2020')
		,('30.2901', 'Maritime Studies.', 'CIP2020', 'CIP 2020')
		,('30.30', 'Computational Science.', 'CIP2020', 'CIP 2020')
		,('30.3001', 'Computational Science.', 'CIP2020', 'CIP 2020')
		,('30.31', 'Human Computer Interaction.', 'CIP2020', 'CIP 2020')
		,('30.3101', 'Human Computer Interaction.', 'CIP2020', 'CIP 2020')
		,('30.32', 'Marine Sciences.', 'CIP2020', 'CIP 2020')
		,('30.3201', 'Marine Sciences.', 'CIP2020', 'CIP 2020')
		,('30.33', 'Sustainability Studies.', 'CIP2020', 'CIP 2020')
		,('30.3301', 'Sustainability Studies.', 'CIP2020', 'CIP 2020')
		,('30.34', 'Anthrozoology.', 'CIP2020', 'CIP 2020')
		,('30.3401', 'Anthrozoology.', 'CIP2020', 'CIP 2020')
		,('30.35', 'Climate Science.', 'CIP2020', 'CIP 2020')
		,('30.3501', 'Climate Science.', 'CIP2020', 'CIP 2020')
		,('30.36', 'Cultural Studies and Comparative Literature.', 'CIP2020', 'CIP 2020')
		,('30.3601', 'Cultural Studies and Comparative Literature.', 'CIP2020', 'CIP 2020')
		,('30.37', 'Design for Human Health.', 'CIP2020', 'CIP 2020')
		,('30.3701', 'Design for Human Health.', 'CIP2020', 'CIP 2020')
		,('30.38', 'Earth Systems Science.', 'CIP2020', 'CIP 2020')
		,('30.3801', 'Earth Systems Science.', 'CIP2020', 'CIP 2020')
		,('30.39', 'Economics and Computer Science.', 'CIP2020', 'CIP 2020')
		,('30.3901', 'Economics and Computer Science.', 'CIP2020', 'CIP 2020')
		,('30.40', 'Economics and Foreign Language/Literature.', 'CIP2020', 'CIP 2020')
		,('30.4001', 'Economics and Foreign Language/Literature.', 'CIP2020', 'CIP 2020')
		,('30.41', 'Environmental Geosciences.', 'CIP2020', 'CIP 2020')
		,('30.4101', 'Environmental Geosciences.', 'CIP2020', 'CIP 2020')
		,('30.42', 'Geoarcheaology.', 'CIP2020', 'CIP 2020')
		,('30.4201', 'Geoarcheaology.', 'CIP2020', 'CIP 2020')
		,('30.43', 'Geobiology.', 'CIP2020', 'CIP 2020')
		,('30.4301', 'Geobiology.', 'CIP2020', 'CIP 2020')
		,('30.44', 'Geography and Environmental Studies.', 'CIP2020', 'CIP 2020')
		,('30.4401', 'Geography and Environmental Studies.', 'CIP2020', 'CIP 2020')
		,('30.45', 'History and Language/Literature.', 'CIP2020', 'CIP 2020')
		,('30.4501', 'History and Language/Literature.', 'CIP2020', 'CIP 2020')
		,('30.46', 'History and Political Science.', 'CIP2020', 'CIP 2020')
		,('30.4601', 'History and Political Science.', 'CIP2020', 'CIP 2020')
		,('30.47', 'Linguistics and Anthropology.', 'CIP2020', 'CIP 2020')
		,('30.4701', 'Linguistics and Anthropology.', 'CIP2020', 'CIP 2020')
		,('30.48', 'Linguistics and Computer Science.', 'CIP2020', 'CIP 2020')
		,('30.4801', 'Linguistics and Computer Science.', 'CIP2020', 'CIP 2020')
		,('30.49', 'Mathematical Economics.', 'CIP2020', 'CIP 2020')
		,('30.4901', 'Mathematical Economics.', 'CIP2020', 'CIP 2020')
		,('30.50', 'Mathematics and Atmospheric/Oceanic Science.', 'CIP2020', 'CIP 2020')
		,('30.5001', 'Mathematics and Atmospheric/Oceanic Science.', 'CIP2020', 'CIP 2020')
		,('30.51', 'Philosophy, Politics, and Economics.', 'CIP2020', 'CIP 2020')
		,('30.5101', 'Philosophy, Politics, and Economics.', 'CIP2020', 'CIP 2020')
		,('30.52', 'Digital Humanities and Textual Studies.', 'CIP2020', 'CIP 2020')
		,('30.5201', 'Digital Humanities and Textual Studies, General.', 'CIP2020', 'CIP 2020')
		,('30.5202', 'Digital Humanities.', 'CIP2020', 'CIP 2020')
		,('30.5203', 'Textual Studies.', 'CIP2020', 'CIP 2020')
		,('30.5299', 'Digital Humanities and Textual Studies, Other.', 'CIP2020', 'CIP 2020')
		,('30.53', 'Thanatology.', 'CIP2020', 'CIP 2020')
		,('30.5301', 'Thanatology.', 'CIP2020', 'CIP 2020')
		,('30.70', 'Data Science.', 'CIP2020', 'CIP 2020')
		,('30.7001', 'Data Science, General.', 'CIP2020', 'CIP 2020')
		,('30.7099', 'Data Science, Other.', 'CIP2020', 'CIP 2020')
		,('30.71', 'Data Analytics.', 'CIP2020', 'CIP 2020')
		,('30.7101', 'Data Analytics, General.', 'CIP2020', 'CIP 2020')
		,('30.7102', 'Business Analytics.', 'CIP2020', 'CIP 2020')
		,('30.7103', 'Data Visualization.', 'CIP2020', 'CIP 2020')
		,('30.7104', 'Financial Analytics.', 'CIP2020', 'CIP 2020')
		,('30.7199', 'Data Analytics, Other.', 'CIP2020', 'CIP 2020')
		,('30.99', 'Multi/Interdisciplinary Studies, Other.', 'CIP2020', 'CIP 2020')
		,('30.9999', 'Multi-/Interdisciplinary Studies, Other.', 'CIP2020', 'CIP 2020')
		,('31', 'PARKS, RECREATION, LEISURE, FITNESS, AND KINESIOLOGY.', 'CIP2020', 'CIP 2020')
		,('31.01', 'Parks, Recreation, and Leisure Studies.', 'CIP2020', 'CIP 2020')
		,('31.0101', 'Parks, Recreation, and Leisure Studies.', 'CIP2020', 'CIP 2020')
		,('31.03', 'Parks, Recreation, and Leisure Facilities Management.', 'CIP2020', 'CIP 2020')
		,('31.0301', 'Parks, Recreation, and Leisure Facilities Management, General.', 'CIP2020', 'CIP 2020')
		,('31.0302', 'Golf Course Operation and Grounds Management.', 'CIP2020', 'CIP 2020')
		,('31.0399', 'Parks, Recreation, and Leisure Facilities Management, Other.', 'CIP2020', 'CIP 2020')
		,('31.05', 'Sports, Kinesiology, and Physical Education/Fitness.', 'CIP2020', 'CIP 2020')
		,('31.0501', 'Sports, Kinesiology, and Physical Education/Fitness, General.', 'CIP2020', 'CIP 2020')
		,('31.0504', 'Sport and Fitness Administration/Management.', 'CIP2020', 'CIP 2020')
		,('31.0505', 'Exercise Science and Kinesiology.', 'CIP2020', 'CIP 2020')
		,('31.0507', 'Physical Fitness Technician.', 'CIP2020', 'CIP 2020')
		,('31.0508', 'Sports Studies.', 'CIP2020', 'CIP 2020')
		,('31.0599', 'Sports, Kinesiology, and Physical Education/Fitness, Other.', 'CIP2020', 'CIP 2020')
		,('31.06', 'Outdoor Education.', 'CIP2020', 'CIP 2020')
		,('31.0601', 'Outdoor Education.', 'CIP2020', 'CIP 2020')
		,('31.99', 'Parks, Recreation, Leisure, Fitness, and Kinesiology, Other.', 'CIP2020', 'CIP 2020')
		,('31.9999', 'Parks, Recreation, Leisure, Fitness, and Kinesiology, Other.', 'CIP2020', 'CIP 2020')
		,('32', 'BASIC SKILLS AND DEVELOPMENTAL/REMEDIAL EDUCATION.', 'CIP2020', 'CIP 2020')
		,('32.01', 'Basic Skills and Developmental/Remedial Education.', 'CIP2020', 'CIP 2020')
		,('32.0101', 'Basic Skills and Developmental/Remedial Education, General.', 'CIP2020', 'CIP 2020')
		,('32.0104', 'Developmental/Remedial Mathematics.', 'CIP2020', 'CIP 2020')
		,('32.0105', 'Job-Seeking/Changing Skills.', 'CIP2020', 'CIP 2020')
		,('32.0107', 'Career Exploration/Awareness Skills.', 'CIP2020', 'CIP 2020')
		,('32.0108', 'Developmental/Remedial English.', 'CIP2020', 'CIP 2020')
		,('32.0109', 'Second Language Learning.', 'CIP2020', 'CIP 2020')
		,('32.0110', 'Basic Computer Skills.', 'CIP2020', 'CIP 2020')
		,('32.0111', 'Workforce Development and Training.', 'CIP2020', 'CIP 2020')
		,('32.0112', 'Accent Reduction/Modification.', 'CIP2020', 'CIP 2020')
		,('32.0199', 'Basic Skills and Developmental/Remedial Education, Other.', 'CIP2020', 'CIP 2020')
		,('32.02', 'General Exam Preparation and Test-Taking Skills.', 'CIP2020', 'CIP 2020')
		,('32.0201', 'Exam Preparation and Test-Taking Skills, General.', 'CIP2020', 'CIP 2020')
		,('32.0202', 'High School Equivalent Exam Preparation.', 'CIP2020', 'CIP 2020')
		,('32.0203', 'Undergraduate Entrance/Placement Examination Preparation.', 'CIP2020', 'CIP 2020')
		,('32.0204', 'Graduate/Professional School Entrance Examination Preparation.', 'CIP2020', 'CIP 2020')
		,('32.0205', 'Professional Certification/Licensure Examination Preparation.', 'CIP2020', 'CIP 2020')
		,('32.0299', 'General Exam Preparation and Test-Taking Skills, Other.', 'CIP2020', 'CIP 2020')
		,('33', 'CITIZENSHIP ACTIVITIES.', 'CIP2020', 'CIP 2020')
		,('33.01', 'Citizenship Activities.', 'CIP2020', 'CIP 2020')
		,('33.0101', 'Citizenship Activities, General.', 'CIP2020', 'CIP 2020')
		,('33.0102', 'American Citizenship Education.', 'CIP2020', 'CIP 2020')
		,('33.0103', 'Community Awareness.', 'CIP2020', 'CIP 2020')
		,('33.0104', 'Community Involvement.', 'CIP2020', 'CIP 2020')
		,('33.0105', 'Canadian Citizenship Education.', 'CIP2020', 'CIP 2020')
		,('33.0106', 'Personal Emergency Preparedness.', 'CIP2020', 'CIP 2020')
		,('33.0199', 'Citizenship Activities, Other.', 'CIP2020', 'CIP 2020')
		,('34', 'HEALTH-RELATED KNOWLEDGE AND SKILLS.', 'CIP2020', 'CIP 2020')
		,('34.01', 'Health-Related Knowledge and Skills.', 'CIP2020', 'CIP 2020')
		,('34.0102', 'Birthing and Parenting Knowledge and Skills.', 'CIP2020', 'CIP 2020')
		,('34.0103', 'Personal Health Improvement and Maintenance.', 'CIP2020', 'CIP 2020')
		,('34.0104', 'Addiction Prevention and Treatment.', 'CIP2020', 'CIP 2020')
		,('34.0105', 'Meditation/Mind-Body Wellness.', 'CIP2020', 'CIP 2020')
		,('34.0199', 'Health-Related Knowledge and Skills, Other.', 'CIP2020', 'CIP 2020')
		,('35', 'INTERPERSONAL AND SOCIAL SKILLS.', 'CIP2020', 'CIP 2020')
		,('35.01', 'Interpersonal and Social Skills.', 'CIP2020', 'CIP 2020')
		,('35.0101', 'Interpersonal and Social Skills, General.', 'CIP2020', 'CIP 2020')
		,('35.0102', 'Interpersonal Relationships Skills.', 'CIP2020', 'CIP 2020')
		,('35.0103', 'Business and Social Skills.', 'CIP2020', 'CIP 2020')
		,('35.0105', 'Life Coaching.', 'CIP2020', 'CIP 2020')
		,('35.0199', 'Interpersonal Social Skills, Other.', 'CIP2020', 'CIP 2020')
		,('36', 'LEISURE AND RECREATIONAL ACTIVITIES.', 'CIP2020', 'CIP 2020')
		,('36.01', 'Leisure and Recreational Activities.', 'CIP2020', 'CIP 2020')
		,('36.0101', 'Leisure and Recreational Activities, General.', 'CIP2020', 'CIP 2020')
		,('36.0102', 'Handicrafts and Model-Making.', 'CIP2020', 'CIP 2020')
		,('36.0103', 'Board, Card and Role-Playing Games.', 'CIP2020', 'CIP 2020')
		,('36.0105', 'Home Maintenance and Improvement.', 'CIP2020', 'CIP 2020')
		,('36.0106', 'Nature Appreciation.', 'CIP2020', 'CIP 2020')
		,('36.0107', 'Pet Ownership and Care.', 'CIP2020', 'CIP 2020')
		,('36.0108', 'Sports and Exercise.', 'CIP2020', 'CIP 2020')
		,('36.0109', 'Travel and Exploration.', 'CIP2020', 'CIP 2020')
		,('36.0110', 'Art.', 'CIP2020', 'CIP 2020')
		,('36.0111', 'Collecting.', 'CIP2020', 'CIP 2020')
		,('36.0112', 'Cooking and Other Domestic Skills.', 'CIP2020', 'CIP 2020')
		,('36.0113', 'Computer Games and Programming Skills.', 'CIP2020', 'CIP 2020')
		,('36.0114', 'Dancing.', 'CIP2020', 'CIP 2020')
		,('36.0115', 'Music.', 'CIP2020', 'CIP 2020')
		,('36.0116', 'Reading.', 'CIP2020', 'CIP 2020')
		,('36.0117', 'Theatre/Theater.', 'CIP2020', 'CIP 2020')
		,('36.0118', 'Writing.', 'CIP2020', 'CIP 2020')
		,('36.0202', 'Aircraft Pilot (Private).', 'CIP2020', 'CIP 2020')
		,('36.0120', 'Beekeeping.', 'CIP2020', 'CIP 2020')
		,('36.0121', 'Firearms Training/Safety.', 'CIP2020', 'CIP 2020')
		,('36.0122', 'Floral Design/Arrangement.', 'CIP2020', 'CIP 2020')
		,('36.0123', 'Master Gardener/Gardening.', 'CIP2020', 'CIP 2020')
		,('36.0199', 'Leisure and Recreational Activities, Other.', 'CIP2020', 'CIP 2020')
		,('36.02', 'Noncommercial Vehicle Operation.', 'CIP2020', 'CIP 2020')
		,('36.0203', 'Automobile Driver Education.', 'CIP2020', 'CIP 2020')
		,('36.0204', 'Helicopter Pilot (Private).', 'CIP2020', 'CIP 2020')
		,('36.0205', 'Motorcycle Rider Education.', 'CIP2020', 'CIP 2020')
		,('36.0206', 'Personal Watercraft/Boating Education.', 'CIP2020', 'CIP 2020')
		,('36.0207', 'Remote Aircraft Pilot (Personal).', 'CIP2020', 'CIP 2020')
		,('36.0299', 'Noncommercial Vehicle Operation, Other.', 'CIP2020', 'CIP 2020')
		,('37', 'PERSONAL AWARENESS AND SELF-IMPROVEMENT.', 'CIP2020', 'CIP 2020')
		,('37.01', 'Personal Awareness and Self-Improvement.', 'CIP2020', 'CIP 2020')
		,('37.0101', 'Self-Awareness and Personal Assessment.', 'CIP2020', 'CIP 2020')
		,('37.0102', 'Stress Management and Coping Skills.', 'CIP2020', 'CIP 2020')
		,('37.0103', 'Personal Decision-Making Skills.', 'CIP2020', 'CIP 2020')
		,('37.0104', 'Self-Esteem and Values Clarification.', 'CIP2020', 'CIP 2020')
		,('37.0106', 'Investing/Wealth Management/Retirement Planning.', 'CIP2020', 'CIP 2020')
		,('37.0107', 'Self-Defense.', 'CIP2020', 'CIP 2020')
		,('37.0199', 'Personal Awareness and Self-Improvement, Other.', 'CIP2020', 'CIP 2020')
		,('38', 'PHILOSOPHY AND RELIGIOUS STUDIES.', 'CIP2020', 'CIP 2020')
		,('38.00', 'Philosophy and Religious Studies, General.', 'CIP2020', 'CIP 2020')
		,('38.0001', 'Philosophy and Religious Studies, General.', 'CIP2020', 'CIP 2020')
		,('38.01', 'Philosophy.', 'CIP2020', 'CIP 2020')
		,('38.0101', 'Philosophy.', 'CIP2020', 'CIP 2020')
		,('38.0102', 'Logic.', 'CIP2020', 'CIP 2020')
		,('38.0103', 'Ethics.', 'CIP2020', 'CIP 2020')
		,('38.0104', 'Applied and Professional Ethics.', 'CIP2020', 'CIP 2020')
		,('38.0199', 'Philosophy, Other.', 'CIP2020', 'CIP 2020')
		,('38.02', 'Religion/Religious Studies.', 'CIP2020', 'CIP 2020')
		,('38.0201', 'Religion/Religious Studies.', 'CIP2020', 'CIP 2020')
		,('38.0202', 'Buddhist Studies.', 'CIP2020', 'CIP 2020')
		,('38.0203', 'Christian Studies.', 'CIP2020', 'CIP 2020')
		,('38.0204', 'Hindu Studies.', 'CIP2020', 'CIP 2020')
		,('38.0205', 'Islamic Studies.', 'CIP2020', 'CIP 2020')
		,('38.0206', 'Jewish/Judaic Studies.', 'CIP2020', 'CIP 2020')
		,('38.0208', 'Catholic Studies.', 'CIP2020', 'CIP 2020')
		,('38.0209', 'Mormon Studies.', 'CIP2020', 'CIP 2020')
		,('38.0299', 'Religion/Religious Studies, Other.', 'CIP2020', 'CIP 2020')
		,('38.99', 'Philosophy and Religious Studies, Other.', 'CIP2020', 'CIP 2020')
		,('38.9999', 'Philosophy and Religious Studies, Other.', 'CIP2020', 'CIP 2020')
		,('39', 'THEOLOGY AND RELIGIOUS VOCATIONS.', 'CIP2020', 'CIP 2020')
		,('39.02', 'Bible/Biblical Studies.', 'CIP2020', 'CIP 2020')
		,('39.0201', 'Bible/Biblical Studies.', 'CIP2020', 'CIP 2020')
		,('39.03', 'Missions/Missionary Studies and Missiology.', 'CIP2020', 'CIP 2020')
		,('39.0301', 'Missions/Missionary Studies.', 'CIP2020', 'CIP 2020')
		,('39.0302', 'Church Planting.', 'CIP2020', 'CIP 2020')
		,('39.0399', 'Missions/Missionary Studies and Missiology, Other.', 'CIP2020', 'CIP 2020')
		,('39.04', 'Religious Education.', 'CIP2020', 'CIP 2020')
		,('39.0401', 'Religious Education.', 'CIP2020', 'CIP 2020')
		,('39.05', 'Religious Music and Worship.', 'CIP2020', 'CIP 2020')
		,('39.0501', 'Religious/Sacred Music.', 'CIP2020', 'CIP 2020')
		,('39.0502', 'Worship Ministry.', 'CIP2020', 'CIP 2020')
		,('39.0599', 'Religious Music and Worship, Other.', 'CIP2020', 'CIP 2020')
		,('39.06', 'Theological and Ministerial Studies.', 'CIP2020', 'CIP 2020')
		,('39.0601', 'Theology/Theological Studies.', 'CIP2020', 'CIP 2020')
		,('39.0602', 'Divinity/Ministry.', 'CIP2020', 'CIP 2020')
		,('39.0604', 'Pre-Theology/Pre-Ministerial Studies.', 'CIP2020', 'CIP 2020')
		,('39.0605', 'Rabbinical Studies.', 'CIP2020', 'CIP 2020')
		,('38.0207', 'Talmudic Studies.', 'CIP2020', 'CIP 2020')
		,('39.0699', 'Theological and Ministerial Studies, Other.', 'CIP2020', 'CIP 2020')
		,('39.07', 'Pastoral Counseling and Specialized Ministries.', 'CIP2020', 'CIP 2020')
		,('39.0701', 'Pastoral Studies/Counseling.', 'CIP2020', 'CIP 2020')
		,('39.0702', 'Youth Ministry.', 'CIP2020', 'CIP 2020')
		,('39.0703', 'Urban Ministry.', 'CIP2020', 'CIP 2020')
		,('39.0704', 'Women&#39;s Ministry.', 'CIP2020', 'CIP 2020')
		,('39.0705', 'Lay Ministry.', 'CIP2020', 'CIP 2020')
		,('39.0706', 'Chaplain/Chaplaincy Studies.', 'CIP2020', 'CIP 2020')
		,('39.0799', 'Pastoral Counseling and Specialized Ministries, Other.', 'CIP2020', 'CIP 2020')
		,('39.08', 'Religious Institution Administration and Law.', 'CIP2020', 'CIP 2020')
		,('39.0801', 'Religious Institution Administration and Management.', 'CIP2020', 'CIP 2020')
		,('39.0802', 'Religious/Canon Law.', 'CIP2020', 'CIP 2020')
		,('39.0899', 'Religious Institution Administration and Law, Other.', 'CIP2020', 'CIP 2020')
		,('39.99', 'Theology and Religious Vocations, Other.', 'CIP2020', 'CIP 2020')
		,('39.9999', 'Theology and Religious Vocations, Other.', 'CIP2020', 'CIP 2020')
		,('40', 'PHYSICAL SCIENCES.', 'CIP2020', 'CIP 2020')
		,('40.01', 'Physical Sciences, General.', 'CIP2020', 'CIP 2020')
		,('40.0101', 'Physical Sciences, General.', 'CIP2020', 'CIP 2020')
		,('40.02', 'Astronomy and Astrophysics.', 'CIP2020', 'CIP 2020')
		,('40.0201', 'Astronomy.', 'CIP2020', 'CIP 2020')
		,('40.0202', 'Astrophysics.', 'CIP2020', 'CIP 2020')
		,('40.0203', 'Planetary Astronomy and Science.', 'CIP2020', 'CIP 2020')
		,('40.0299', 'Astronomy and Astrophysics, Other.', 'CIP2020', 'CIP 2020')
		,('40.04', 'Atmospheric Sciences and Meteorology.', 'CIP2020', 'CIP 2020')
		,('40.0401', 'Atmospheric Sciences and Meteorology, General.', 'CIP2020', 'CIP 2020')
		,('40.0402', 'Atmospheric Chemistry and Climatology.', 'CIP2020', 'CIP 2020')
		,('40.0403', 'Atmospheric Physics and Dynamics.', 'CIP2020', 'CIP 2020')
		,('40.0404', 'Meteorology.', 'CIP2020', 'CIP 2020')
		,('40.0499', 'Atmospheric Sciences and Meteorology, Other.', 'CIP2020', 'CIP 2020')
		,('40.05', 'Chemistry.', 'CIP2020', 'CIP 2020')
		,('40.0501', 'Chemistry, General.', 'CIP2020', 'CIP 2020')
		,('40.0502', 'Analytical Chemistry.', 'CIP2020', 'CIP 2020')
		,('40.0503', 'Inorganic Chemistry.', 'CIP2020', 'CIP 2020')
		,('40.0504', 'Organic Chemistry.', 'CIP2020', 'CIP 2020')
		,('40.0506', 'Physical Chemistry.', 'CIP2020', 'CIP 2020')
		,('40.0507', 'Polymer Chemistry.', 'CIP2020', 'CIP 2020')
		,('40.0508', 'Chemical Physics.', 'CIP2020', 'CIP 2020')
		,('40.0509', 'Environmental Chemistry.', 'CIP2020', 'CIP 2020')
		,('40.0510', 'Forensic Chemistry.', 'CIP2020', 'CIP 2020')
		,('40.0511', 'Theoretical Chemistry.', 'CIP2020', 'CIP 2020')
		,('40.0512', 'Cheminformatics/Chemistry Informatics.', 'CIP2020', 'CIP 2020')
		,('40.0599', 'Chemistry, Other.', 'CIP2020', 'CIP 2020')
		,('40.06', 'Geological and Earth Sciences/Geosciences.', 'CIP2020', 'CIP 2020')
		,('40.0601', 'Geology/Earth Science, General.', 'CIP2020', 'CIP 2020')
		,('40.0602', 'Geochemistry.', 'CIP2020', 'CIP 2020')
		,('40.0603', 'Geophysics and Seismology.', 'CIP2020', 'CIP 2020')
		,('40.0604', 'Paleontology.', 'CIP2020', 'CIP 2020')
		,('40.0605', 'Hydrology and Water Resources Science.', 'CIP2020', 'CIP 2020')
		,('40.0606', 'Geochemistry and Petrology.', 'CIP2020', 'CIP 2020')
		,('40.0607', 'Oceanography, Chemical and Physical.', 'CIP2020', 'CIP 2020')
		,('40.0699', 'Geological and Earth Sciences/Geosciences, Other.', 'CIP2020', 'CIP 2020')
		,('40.08', 'Physics.', 'CIP2020', 'CIP 2020')
		,('40.0801', 'Physics, General.', 'CIP2020', 'CIP 2020')
		,('40.0802', 'Atomic/Molecular Physics.', 'CIP2020', 'CIP 2020')
		,('40.0804', 'Elementary Particle Physics.', 'CIP2020', 'CIP 2020')
		,('40.0805', 'Plasma and High-Temperature Physics.', 'CIP2020', 'CIP 2020')
		,('40.0806', 'Nuclear Physics.', 'CIP2020', 'CIP 2020')
		,('40.0807', 'Optics/Optical Sciences.', 'CIP2020', 'CIP 2020')
		,('40.0808', 'Condensed Matter and Materials Physics.', 'CIP2020', 'CIP 2020')
		,('40.0809', 'Acoustics.', 'CIP2020', 'CIP 2020')
		,('40.0810', 'Theoretical and Mathematical Physics.', 'CIP2020', 'CIP 2020')
		,('40.0899', 'Physics, Other.', 'CIP2020', 'CIP 2020')
		,('40.10', 'Materials Sciences.', 'CIP2020', 'CIP 2020')
		,('40.1001', 'Materials Science.', 'CIP2020', 'CIP 2020')
		,('40.1002', 'Materials Chemistry.', 'CIP2020', 'CIP 2020')
		,('40.1099', 'Materials Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('40.11', 'Physics and Astronomy.', 'CIP2020', 'CIP 2020')
		,('40.1101', 'Physics and Astronomy.', 'CIP2020', 'CIP 2020')
		,('40.99', 'Physical Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('40.9999', 'Physical Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('41', 'SCIENCE TECHNOLOGIES/TECHNICIANS.', 'CIP2020', 'CIP 2020')
		,('41.00', 'Science Technologies/Technicians, General.', 'CIP2020', 'CIP 2020')
		,('41.0000', 'Science Technologies/Technicians, General.', 'CIP2020', 'CIP 2020')
		,('41.01', 'Biology/Biotechnology Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('41.0101', 'Biology/Biotechnology Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('41.02', 'Nuclear and Industrial Radiologic Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('41.0204', 'Industrial Radiologic Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('41.0205', 'Nuclear/Nuclear Power Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('41.0299', 'Nuclear and Industrial Radiologic Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('41.03', 'Physical Science Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('41.0301', 'Chemical Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('41.0303', 'Chemical Process Technology.', 'CIP2020', 'CIP 2020')
		,('41.0399', 'Physical Science Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('41.99', 'Science Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('41.9999', 'Science Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('42', 'PSYCHOLOGY.', 'CIP2020', 'CIP 2020')
		,('42.01', 'Psychology, General.', 'CIP2020', 'CIP 2020')
		,('42.0101', 'Psychology, General.', 'CIP2020', 'CIP 2020')
		,('42.27', 'Research and Experimental Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2701', 'Cognitive Psychology and Psycholinguistics.', 'CIP2020', 'CIP 2020')
		,('42.2702', 'Comparative Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2703', 'Developmental and Child Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2704', 'Experimental Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2705', 'Personality Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2706', 'Behavioral Neuroscience.', 'CIP2020', 'CIP 2020')
		,('42.2707', 'Social Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2708', 'Psychometrics and Quantitative Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2709', 'Psychopharmacology.', 'CIP2020', 'CIP 2020')
		,('42.2710', 'Developmental and Adolescent Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2799', 'Research and Experimental Psychology, Other.', 'CIP2020', 'CIP 2020')
		,('42.28', 'Clinical, Counseling and Applied Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2801', 'Clinical Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2802', 'Community Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2803', 'Counseling Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2804', 'Industrial and Organizational Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2805', 'School Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2806', 'Educational Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2807', 'Clinical Child Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2808', 'Environmental Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2809', 'Geropsychology.', 'CIP2020', 'CIP 2020')
		,('42.2810', 'Health/Medical Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2811', 'Family Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2812', 'Forensic Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2813', 'Applied Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2814', 'Applied Behavior Analysis.', 'CIP2020', 'CIP 2020')
		,('42.2815', 'Performance and Sport Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2816', 'Somatic Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2817', 'Transpersonal/Spiritual Psychology.', 'CIP2020', 'CIP 2020')
		,('42.2899', 'Clinical, Counseling and Applied Psychology, Other.', 'CIP2020', 'CIP 2020')
		,('42.99', 'Psychology, Other.', 'CIP2020', 'CIP 2020')
		,('42.9999', 'Psychology, Other.', 'CIP2020', 'CIP 2020')
		,('43', 'HOMELAND SECURITY, LAW ENFORCEMENT, FIREFIGHTING AND RELATED PROTECTIVE SERVICES.', 'CIP2020', 'CIP 2020')
		,('43.01', 'Criminal Justice and Corrections.', 'CIP2020', 'CIP 2020')
		,('43.0100', 'Criminal Justice and Corrections, General.', 'CIP2020', 'CIP 2020')
		,('43.0102', 'Corrections.', 'CIP2020', 'CIP 2020')
		,('43.0103', 'Criminal Justice/Law Enforcement Administration.', 'CIP2020', 'CIP 2020')
		,('43.0104', 'Criminal Justice/Safety Studies.', 'CIP2020', 'CIP 2020')
		,('43.0406', 'Forensic Science and Technology.', 'CIP2020', 'CIP 2020')
		,('43.0107', 'Criminal Justice/Police Science.', 'CIP2020', 'CIP 2020')
		,('43.0109', 'Security and Loss Prevention Services.', 'CIP2020', 'CIP 2020')
		,('43.0110', 'Juvenile Corrections.', 'CIP2020', 'CIP 2020')
		,('43.0402', 'Criminalistics and Criminal Science.', 'CIP2020', 'CIP 2020')
		,('43.0112', 'Securities Services Administration/Management.', 'CIP2020', 'CIP 2020')
		,('43.0113', 'Corrections Administration.', 'CIP2020', 'CIP 2020')
		,('43.0114', 'Law Enforcement Investigation and Interviewing.', 'CIP2020', 'CIP 2020')
		,('43.0115', 'Law Enforcement Record-Keeping and Evidence Management.', 'CIP2020', 'CIP 2020')
		,('43.0403', 'Cyber/Computer Forensics and Counterterrorism.', 'CIP2020', 'CIP 2020')
		,('43.0405', 'Financial Forensics and Fraud Investigation.', 'CIP2020', 'CIP 2020')
		,('43.0408', 'Law Enforcement Intelligence Analysis.', 'CIP2020', 'CIP 2020')
		,('43.0119', 'Critical Incident Response/Special Police Operations.', 'CIP2020', 'CIP 2020')
		,('43.0120', 'Protective Services Operations.', 'CIP2020', 'CIP 2020')
		,('43.0121', 'Suspension and Debarment Investigation.', 'CIP2020', 'CIP 2020')
		,('43.0122', 'Maritime Law Enforcement.', 'CIP2020', 'CIP 2020')
		,('43.0123', 'Cultural/Archaelogical Resources Protection.', 'CIP2020', 'CIP 2020')
		,('43.0199', 'Corrections and Criminal Justice, Other.', 'CIP2020', 'CIP 2020')
		,('43.02', 'Fire Protection.', 'CIP2020', 'CIP 2020')
		,('43.0201', 'Fire Prevention and Safety Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('43.0202', 'Fire Services Administration.', 'CIP2020', 'CIP 2020')
		,('43.0203', 'Fire Science/Fire-fighting.', 'CIP2020', 'CIP 2020')
		,('43.0204', 'Fire Systems Technology.', 'CIP2020', 'CIP 2020')
		,('43.0205', 'Fire/Arson Investigation and Prevention.', 'CIP2020', 'CIP 2020')
		,('43.0206', 'Wildland/Forest Firefighting and Investigation.', 'CIP2020', 'CIP 2020')
		,('43.0299', 'Fire Protection, Other.', 'CIP2020', 'CIP 2020')
		,('43.03', 'Homeland Security.', 'CIP2020', 'CIP 2020')
		,('43.0301', 'Homeland Security.', 'CIP2020', 'CIP 2020')
		,('43.0302', 'Crisis/Emergency/Disaster Management.', 'CIP2020', 'CIP 2020')
		,('43.0303', 'Critical Infrastructure Protection.', 'CIP2020', 'CIP 2020')
		,('43.0304', 'Terrorism and Counterterrorism Operations.', 'CIP2020', 'CIP 2020')
		,('43.0399', 'Homeland Security, Other.', 'CIP2020', 'CIP 2020')
		,('43.04', 'Security Science and Technology.', 'CIP2020', 'CIP 2020')
		,('43.0401', 'Security Science and Technology, General.', 'CIP2020', 'CIP 2020')
		,('43.0404', 'Cybersecurity Defense Strategy/Policy.', 'CIP2020', 'CIP 2020')
		,('43.0407', 'Geospatial Intelligence.', 'CIP2020', 'CIP 2020')
		,('43.0499', 'Security Science and Technology, Other.', 'CIP2020', 'CIP 2020')
		,('43.99', 'Homeland Security, Law Enforcement, Firefighting and Related Protective Services, Other.', 'CIP2020', 'CIP 2020')
		,('43.9999', 'Homeland Security, Law Enforcement, Firefighting and Related Protective Services, Other.', 'CIP2020', 'CIP 2020')
		,('44', 'PUBLIC ADMINISTRATION AND SOCIAL SERVICE PROFESSIONS.', 'CIP2020', 'CIP 2020')
		,('44.00', 'Human Services, General.', 'CIP2020', 'CIP 2020')
		,('44.0000', 'Human Services, General.', 'CIP2020', 'CIP 2020')
		,('44.02', 'Community Organization and Advocacy.', 'CIP2020', 'CIP 2020')
		,('44.0201', 'Community Organization and Advocacy.', 'CIP2020', 'CIP 2020')
		,('44.04', 'Public Administration.', 'CIP2020', 'CIP 2020')
		,('44.0401', 'Public Administration.', 'CIP2020', 'CIP 2020')
		,('44.0402', 'Public Works Management.', 'CIP2020', 'CIP 2020')
		,('44.0403', 'Transportation and Infrastructure Planning/Studies.', 'CIP2020', 'CIP 2020')
		,('44.0499', 'Public Administration, Other.', 'CIP2020', 'CIP 2020')
		,('44.05', 'Public Policy Analysis.', 'CIP2020', 'CIP 2020')
		,('44.0501', 'Public Policy Analysis, General.', 'CIP2020', 'CIP 2020')
		,('44.0502', 'Education Policy Analysis.', 'CIP2020', 'CIP 2020')
		,('44.0503', 'Health Policy Analysis.', 'CIP2020', 'CIP 2020')
		,('44.0504', 'International Policy Analysis.', 'CIP2020', 'CIP 2020')
		,('44.0580', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('44.0599', 'Public Policy Analysis, Other.', 'CIP2020', 'CIP 2020')
		,('44.07', 'Social Work.', 'CIP2020', 'CIP 2020')
		,('44.0701', 'Social Work.', 'CIP2020', 'CIP 2020')
		,('44.0702', 'Youth Services/Administration.', 'CIP2020', 'CIP 2020')
		,('44.0703', 'Forensic Social Work.', 'CIP2020', 'CIP 2020')
		,('44.0799', 'Social Work, Other.', 'CIP2020', 'CIP 2020')
		,('44.99', 'Public Administration and Social Service Professions, Other.', 'CIP2020', 'CIP 2020')
		,('44.9999', 'Public Administration and Social Service Professions, Other.', 'CIP2020', 'CIP 2020')
		,('45', 'SOCIAL SCIENCES.', 'CIP2020', 'CIP 2020')
		,('45.01', 'Social Sciences, General.', 'CIP2020', 'CIP 2020')
		,('45.0101', 'Social Sciences, General.', 'CIP2020', 'CIP 2020')
		,('45.0102', 'Research Methodology and Quantitative Methods.', 'CIP2020', 'CIP 2020')
		,('45.0103', 'Survey Research/Methodology.', 'CIP2020', 'CIP 2020')
		,('45.0199', 'Social Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('45.02', 'Anthropology.', 'CIP2020', 'CIP 2020')
		,('45.0201', 'Anthropology, General.', 'CIP2020', 'CIP 2020')
		,('45.0202', 'Physical and Biological Anthropology.', 'CIP2020', 'CIP 2020')
		,('45.0203', 'Medical Anthropology.', 'CIP2020', 'CIP 2020')
		,('45.0204', 'Cultural Anthropology.', 'CIP2020', 'CIP 2020')
		,('45.0205', 'Forensic Anthropology.', 'CIP2020', 'CIP 2020')
		,('45.0299', 'Anthropology, Other.', 'CIP2020', 'CIP 2020')
		,('45.03', 'Archeology.', 'CIP2020', 'CIP 2020')
		,('45.0301', 'Archeology.', 'CIP2020', 'CIP 2020')
		,('45.04', 'Criminology.', 'CIP2020', 'CIP 2020')
		,('45.0401', 'Criminology.', 'CIP2020', 'CIP 2020')
		,('45.05', 'Demography.', 'CIP2020', 'CIP 2020')
		,('45.0501', 'Demography and Population Studies.', 'CIP2020', 'CIP 2020')
		,('45.0502', 'Applied Demography.', 'CIP2020', 'CIP 2020')
		,('45.0599', 'Demography, Other.', 'CIP2020', 'CIP 2020')
		,('45.06', 'Economics.', 'CIP2020', 'CIP 2020')
		,('45.0601', 'Economics, General.', 'CIP2020', 'CIP 2020')
		,('45.0602', 'Applied Economics.', 'CIP2020', 'CIP 2020')
		,('45.0603', 'Econometrics and Quantitative Economics.', 'CIP2020', 'CIP 2020')
		,('45.0604', 'Development Economics and International Development.', 'CIP2020', 'CIP 2020')
		,('45.0605', 'International Economics.', 'CIP2020', 'CIP 2020')
		,('45.0699', 'Economics, Other.', 'CIP2020', 'CIP 2020')
		,('45.07', 'Geography and Cartography.', 'CIP2020', 'CIP 2020')
		,('45.0701', 'Geography.', 'CIP2020', 'CIP 2020')
		,('45.0702', 'Geographic Information Science and Cartography.', 'CIP2020', 'CIP 2020')
		,('45.0799', 'Geography, Other.', 'CIP2020', 'CIP 2020')
		,('45.09', 'International Relations and National Security Studies.', 'CIP2020', 'CIP 2020')
		,('45.0901', 'International Relations and Affairs.', 'CIP2020', 'CIP 2020')
		,('45.0902', 'National Security Policy Studies.', 'CIP2020', 'CIP 2020')
		,('45.0999', 'International Relations and National Security Studies, Other.', 'CIP2020', 'CIP 2020')
		,('45.10', 'Political Science and Government.', 'CIP2020', 'CIP 2020')
		,('45.1001', 'Political Science and Government, General.', 'CIP2020', 'CIP 2020')
		,('45.1002', 'American Government and Politics (United States).', 'CIP2020', 'CIP 2020')
		,('45.1003', 'Canadian Government and Politics.', 'CIP2020', 'CIP 2020')
		,('45.1004', 'Political Economy.', 'CIP2020', 'CIP 2020')
		,('45.1099', 'Political Science and Government, Other.', 'CIP2020', 'CIP 2020')
		,('45.11', 'Sociology.', 'CIP2020', 'CIP 2020')
		,('45.1101', 'Sociology, General.', 'CIP2020', 'CIP 2020')
		,('45.1102', 'Applied/Public Sociology.', 'CIP2020', 'CIP 2020')
		,('45.1199', 'Sociology, Other.', 'CIP2020', 'CIP 2020')
		,('45.12', 'Urban Studies/Affairs.', 'CIP2020', 'CIP 2020')
		,('45.1201', 'Urban Studies/Affairs.', 'CIP2020', 'CIP 2020')
		,('45.13', 'Sociology and Anthropology.', 'CIP2020', 'CIP 2020')
		,('45.1301', 'Sociology and Anthropology.', 'CIP2020', 'CIP 2020')
		,('45.14', 'Deleted, report under 45.1103', 'CIP2020', 'CIP 2020')
		,('45.1103', 'Rural Sociology.', 'CIP2020', 'CIP 2020')
		,('45.15', 'Geography and Anthropology.', 'CIP2020', 'CIP 2020')
		,('45.1501', 'Geography and Anthropology.', 'CIP2020', 'CIP 2020')
		,('45.99', 'Social Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('45.9999', 'Social Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('46', 'CONSTRUCTION TRADES.', 'CIP2020', 'CIP 2020')
		,('46.00', 'Construction Trades, General.', 'CIP2020', 'CIP 2020')
		,('46.0000', 'Construction Trades, General.', 'CIP2020', 'CIP 2020')
		,('46.01', 'Mason/Masonry.', 'CIP2020', 'CIP 2020')
		,('46.0101', 'Mason/Masonry.', 'CIP2020', 'CIP 2020')
		,('46.02', 'Carpenters.', 'CIP2020', 'CIP 2020')
		,('46.0201', 'Carpentry/Carpenter.', 'CIP2020', 'CIP 2020')
		,('46.03', 'Electrical and Power Transmission Installers.', 'CIP2020', 'CIP 2020')
		,('46.0301', 'Electrical and Power Transmission Installation/Installer, General.', 'CIP2020', 'CIP 2020')
		,('46.0302', 'Electrician.', 'CIP2020', 'CIP 2020')
		,('46.0303', 'Lineworker.', 'CIP2020', 'CIP 2020')
		,('46.0399', 'Electrical and Power Transmission Installers, Other.', 'CIP2020', 'CIP 2020')
		,('46.04', 'Building/Construction Finishing, Management, and Inspection.', 'CIP2020', 'CIP 2020')
		,('46.0401', 'Building/Property Maintenance.', 'CIP2020', 'CIP 2020')
		,('46.0402', 'Concrete Finishing/Concrete Finisher.', 'CIP2020', 'CIP 2020')
		,('46.0403', 'Building/Home/Construction Inspection/Inspector.', 'CIP2020', 'CIP 2020')
		,('46.0404', 'Drywall Installation/Drywaller.', 'CIP2020', 'CIP 2020')
		,('46.0406', 'Glazier.', 'CIP2020', 'CIP 2020')
		,('46.0408', 'Painting/Painter and Wall Coverer.', 'CIP2020', 'CIP 2020')
		,('46.0410', 'Roofer.', 'CIP2020', 'CIP 2020')
		,('46.0411', 'Metal Building Assembly/Assembler.', 'CIP2020', 'CIP 2020')
		,('46.0412', 'Building/Construction Site Management/Manager.', 'CIP2020', 'CIP 2020')
		,('46.0413', 'Carpet, Floor, and Tile Worker.', 'CIP2020', 'CIP 2020')
		,('46.0414', 'Insulator.', 'CIP2020', 'CIP 2020')
		,('46.0415', 'Building Construction Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('46.0499', 'Building/Construction Finishing, Management, and Inspection, Other.', 'CIP2020', 'CIP 2020')
		,('46.05', 'Plumbing and Related Water Supply Services.', 'CIP2020', 'CIP 2020')
		,('46.0502', 'Pipefitting/Pipefitter and Sprinkler Fitter.', 'CIP2020', 'CIP 2020')
		,('46.0503', 'Plumbing Technology/Plumber.', 'CIP2020', 'CIP 2020')
		,('46.0504', 'Well Drilling/Driller.', 'CIP2020', 'CIP 2020')
		,('46.0505', 'Blasting/Blaster.', 'CIP2020', 'CIP 2020')
		,('46.0599', 'Plumbing and Related Water Supply Services, Other.', 'CIP2020', 'CIP 2020')
		,('46.99', 'Construction Trades, Other.', 'CIP2020', 'CIP 2020')
		,('46.9999', 'Construction Trades, Other.', 'CIP2020', 'CIP 2020')
		,('47', 'MECHANIC AND REPAIR TECHNOLOGIES/TECHNICIANS.', 'CIP2020', 'CIP 2020')
		,('47.00', 'Mechanics and Repairers, General.', 'CIP2020', 'CIP 2020')
		,('47.0000', 'Mechanics and Repairers, General.', 'CIP2020', 'CIP 2020')
		,('47.01', 'Electrical/Electronics Maintenance and Repair Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('47.0101', 'Electrical/Electronics Equipment Installation and Repair Technology/Technician, General.', 'CIP2020', 'CIP 2020')
		,('47.0102', 'Business Machine Repair.', 'CIP2020', 'CIP 2020')
		,('47.0103', 'Communications Systems Installation and Repair Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0104', 'Computer Installation and Repair Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0105', 'Industrial Electronics Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0106', 'Appliance Installation and Repair Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0110', 'Security System Installation, Repair, and Inspection Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0199', 'Electrical/Electronics Maintenance and Repair Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('47.02', 'Heating, Air Conditioning, Ventilation and Refrigeration Maintenance Technology/Technician (HAC, HACR, HVAC, HVACR).', 'CIP2020', 'CIP 2020')
		,('47.0201', 'Heating, Air Conditioning, Ventilation and Refrigeration Maintenance Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.03', 'Heavy/Industrial Equipment Maintenance Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('47.0302', 'Heavy Equipment Maintenance Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0303', 'Industrial Mechanics and Maintenance Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0399', 'Heavy/Industrial Equipment Maintenance Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('47.04', 'Precision Systems Maintenance and Repair Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('47.0402', 'Gunsmithing/Gunsmith.', 'CIP2020', 'CIP 2020')
		,('47.0403', 'Locksmithing and Safe Repair.', 'CIP2020', 'CIP 2020')
		,('47.0404', 'Musical Instrument Fabrication and Repair.', 'CIP2020', 'CIP 2020')
		,('47.0408', 'Watchmaking and Jewelrymaking.', 'CIP2020', 'CIP 2020')
		,('47.0409', 'Parts and Warehousing Operations and Maintenance Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0499', 'Precision Systems Maintenance and Repair Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('47.06', 'Vehicle Maintenance and Repair Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('47.0600', 'Vehicle Maintenance and Repair Technology/Technician, General.', 'CIP2020', 'CIP 2020')
		,('47.0603', 'Autobody/Collision and Repair Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0604', 'Automobile/Automotive Mechanics Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0605', 'Diesel Mechanics Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0606', 'Small Engine Mechanics and Repair Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0607', 'Airframe Mechanics and Aircraft Maintenance Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0608', 'Aircraft Powerplant Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0609', 'Avionics Maintenance Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0610', 'Bicycle Mechanics and Repair Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0611', 'Motorcycle Maintenance and Repair Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0612', 'Vehicle Emissions Inspection and Maintenance Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0613', 'Medium/Heavy Vehicle and Truck Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0614', 'Alternative Fuel Vehicle Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0615', 'Engine Machinist.', 'CIP2020', 'CIP 2020')
		,('47.0616', 'Marine Maintenance/Fitter and Ship Repair Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0617', 'High Performance and Custom Engine Technician/Mechanic.', 'CIP2020', 'CIP 2020')
		,('47.0618', 'Recreation Vehicle (RV) Service Technician.', 'CIP2020', 'CIP 2020')
		,('47.0699', 'Vehicle Maintenance and Repair Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('47.07', 'Energy Systems Maintenance and Repair Technologies/Technicians.', 'CIP2020', 'CIP 2020')
		,('47.0701', 'Energy Systems Installation and Repair Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0703', 'Solar Energy System Installation and Repair Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0704', 'Wind Energy System Installation and Repair Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0705', 'Hydroelectric Energy System Installation and Repair Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0706', 'Geothermal Energy System Installation and Repair Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('47.0799', 'Energy Systems Maintenance and Repair Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('47.99', 'Mechanic and Repair Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('47.9999', 'Mechanic and Repair Technologies/Technicians, Other.', 'CIP2020', 'CIP 2020')
		,('48', 'PRECISION PRODUCTION.', 'CIP2020', 'CIP 2020')
		,('48.00', 'Precision Production Trades, General.', 'CIP2020', 'CIP 2020')
		,('48.0000', 'Precision Production Trades, General.', 'CIP2020', 'CIP 2020')
		,('48.03', 'Leatherworking and Upholstery.', 'CIP2020', 'CIP 2020')
		,('48.0303', 'Upholstery/Upholsterer.', 'CIP2020', 'CIP 2020')
		,('48.0304', 'Shoe, Boot and Leather Repair.', 'CIP2020', 'CIP 2020')
		,('48.0399', 'Leatherworking and Upholstery, Other.', 'CIP2020', 'CIP 2020')
		,('48.05', 'Precision Metal Working.', 'CIP2020', 'CIP 2020')
		,('48.0501', 'Machine Tool Technology/Machinist.', 'CIP2020', 'CIP 2020')
		,('48.0503', 'Machine Shop Technology/Assistant.', 'CIP2020', 'CIP 2020')
		,('48.0506', 'Sheet Metal Technology/Sheetworking.', 'CIP2020', 'CIP 2020')
		,('48.0507', 'Tool and Die Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('48.0508', 'Welding Technology/Welder.', 'CIP2020', 'CIP 2020')
		,('48.0509', 'Ironworking/Ironworker.', 'CIP2020', 'CIP 2020')
		,('48.0510', 'Computer Numerically Controlled (CNC) Machinist Technology/CNC Machinist.', 'CIP2020', 'CIP 2020')
		,('48.0511', 'Metal Fabricator.', 'CIP2020', 'CIP 2020')
		,('48.0599', 'Precision Metal Working, Other.', 'CIP2020', 'CIP 2020')
		,('48.07', 'Woodworking.', 'CIP2020', 'CIP 2020')
		,('48.0701', 'Woodworking, General.', 'CIP2020', 'CIP 2020')
		,('48.0702', 'Furniture Design and Manufacturing.', 'CIP2020', 'CIP 2020')
		,('48.0703', 'Cabinetmaking and Millwork.', 'CIP2020', 'CIP 2020')
		,('48.0704', 'Wooden Boatbuilding Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('48.0799', 'Woodworking, Other.', 'CIP2020', 'CIP 2020')
		,('48.08', 'Boilermaking/Boilermaker.', 'CIP2020', 'CIP 2020')
		,('48.0801', 'Boilermaking/Boilermaker.', 'CIP2020', 'CIP 2020')
		,('48.99', 'Precision Production, Other.', 'CIP2020', 'CIP 2020')
		,('48.9999', 'Precision Production, Other.', 'CIP2020', 'CIP 2020')
		,('49', 'TRANSPORTATION AND MATERIALS MOVING.', 'CIP2020', 'CIP 2020')
		,('49.01', 'Air Transportation.', 'CIP2020', 'CIP 2020')
		,('49.0101', 'Aeronautics/Aviation/Aerospace Science and Technology, General.', 'CIP2020', 'CIP 2020')
		,('49.0102', 'Airline/Commercial/Professional Pilot and Flight Crew.', 'CIP2020', 'CIP 2020')
		,('49.0104', 'Aviation/Airway Management and Operations.', 'CIP2020', 'CIP 2020')
		,('49.0105', 'Air Traffic Controller.', 'CIP2020', 'CIP 2020')
		,('49.0106', 'Airline Flight Attendant.', 'CIP2020', 'CIP 2020')
		,('49.0108', 'Flight Instructor.', 'CIP2020', 'CIP 2020')
		,('49.0109', 'Remote Aircraft Pilot.', 'CIP2020', 'CIP 2020')
		,('49.0199', 'Air Transportation, Other.', 'CIP2020', 'CIP 2020')
		,('49.02', 'Ground Transportation.', 'CIP2020', 'CIP 2020')
		,('49.0202', 'Construction/Heavy Equipment/Earthmoving Equipment Operation.', 'CIP2020', 'CIP 2020')
		,('49.0205', 'Truck and Bus Driver/Commercial Vehicle Operator and Instructor.', 'CIP2020', 'CIP 2020')
		,('49.0206', 'Mobil Crane Operator/Operation.', 'CIP2020', 'CIP 2020')
		,('49.0207', 'Flagging and Traffic Control.', 'CIP2020', 'CIP 2020')
		,('49.0208', 'Railroad and Railway Transportation.', 'CIP2020', 'CIP 2020')
		,('49.0209', 'Forklift Operation/Operator.', 'CIP2020', 'CIP 2020')
		,('49.0299', 'Ground Transportation, Other.', 'CIP2020', 'CIP 2020')
		,('49.03', 'Marine Transportation.', 'CIP2020', 'CIP 2020')
		,('49.0303', 'Commercial Fishing.', 'CIP2020', 'CIP 2020')
		,('49.0304', 'Diver, Professional and Instructor.', 'CIP2020', 'CIP 2020')
		,('49.0309', 'Marine Science/Merchant Marine Officer.', 'CIP2020', 'CIP 2020')
		,('49.0399', 'Marine Transportation, Other.', 'CIP2020', 'CIP 2020')
		,('49.99', 'Transportation and Materials Moving, Other.', 'CIP2020', 'CIP 2020')
		,('49.9999', 'Transportation and Materials Moving, Other.', 'CIP2020', 'CIP 2020')
		,('50', 'VISUAL AND PERFORMING ARTS.', 'CIP2020', 'CIP 2020')
		,('50.01', 'Visual and Performing Arts, General.', 'CIP2020', 'CIP 2020')
		,('50.0101', 'Visual and Performing Arts, General.', 'CIP2020', 'CIP 2020')
		,('50.0102', 'Digital Arts.', 'CIP2020', 'CIP 2020')
		,('50.02', 'Crafts/Craft Design, Folk Art and Artisanry.', 'CIP2020', 'CIP 2020')
		,('50.0201', 'Crafts/Craft Design, Folk Art and Artisanry.', 'CIP2020', 'CIP 2020')
		,('50.03', 'Dance.', 'CIP2020', 'CIP 2020')
		,('50.0301', 'Dance, General.', 'CIP2020', 'CIP 2020')
		,('50.0302', 'Ballet.', 'CIP2020', 'CIP 2020')
		,('50.0399', 'Dance, Other.', 'CIP2020', 'CIP 2020')
		,('50.04', 'Design and Applied Arts.', 'CIP2020', 'CIP 2020')
		,('50.0401', 'Design and Visual Communications, General.', 'CIP2020', 'CIP 2020')
		,('50.0402', 'Commercial and Advertising Art.', 'CIP2020', 'CIP 2020')
		,('50.0404', 'Industrial and Product Design.', 'CIP2020', 'CIP 2020')
		,('50.0406', 'Commercial Photography.', 'CIP2020', 'CIP 2020')
		,('50.0407', 'Fashion/Apparel Design.', 'CIP2020', 'CIP 2020')
		,('50.0408', 'Interior Design.', 'CIP2020', 'CIP 2020')
		,('50.0409', 'Graphic Design.', 'CIP2020', 'CIP 2020')
		,('50.0410', 'Illustration.', 'CIP2020', 'CIP 2020')
		,('50.0411', 'Game and Interactive Media Design.', 'CIP2020', 'CIP 2020')
		,('50.0499', 'Design and Applied Arts, Other.', 'CIP2020', 'CIP 2020')
		,('50.05', 'Drama/Theatre Arts and Stagecraft.', 'CIP2020', 'CIP 2020')
		,('50.0501', 'Drama and Dramatics/Theatre Arts, General.', 'CIP2020', 'CIP 2020')
		,('50.0502', 'Technical Theatre/Theatre Design and Technology.', 'CIP2020', 'CIP 2020')
		,('50.0504', 'Playwriting and Screenwriting.', 'CIP2020', 'CIP 2020')
		,('50.0505', 'Theatre Literature, History and Criticism.', 'CIP2020', 'CIP 2020')
		,('50.0506', 'Acting.', 'CIP2020', 'CIP 2020')
		,('50.0507', 'Directing and Theatrical Production.', 'CIP2020', 'CIP 2020')
		,('50.0509', 'Musical Theatre.', 'CIP2020', 'CIP 2020')
		,('50.0510', 'Costume Design.', 'CIP2020', 'CIP 2020')
		,('50.0511', 'Comedy Writing and Performance.', 'CIP2020', 'CIP 2020')
		,('50.0512', 'Theatre and Dance.', 'CIP2020', 'CIP 2020')
		,('50.0599', 'Dramatic/Theatre Arts and Stagecraft, Other.', 'CIP2020', 'CIP 2020')
		,('50.06', 'Film/Video and Photographic Arts.', 'CIP2020', 'CIP 2020')
		,('50.0601', 'Film/Cinema/Media Studies.', 'CIP2020', 'CIP 2020')
		,('50.0602', 'Cinematography and Film/Video Production.', 'CIP2020', 'CIP 2020')
		,('50.0605', 'Photography.', 'CIP2020', 'CIP 2020')
		,('50.0607', 'Documentary Production.', 'CIP2020', 'CIP 2020')
		,('50.0699', 'Film/Video and Photographic Arts, Other.', 'CIP2020', 'CIP 2020')
		,('50.07', 'Fine and Studio Arts.', 'CIP2020', 'CIP 2020')
		,('50.0701', 'Art/Art Studies, General.', 'CIP2020', 'CIP 2020')
		,('50.0702', 'Fine/Studio Arts, General.', 'CIP2020', 'CIP 2020')
		,('50.0703', 'Art History, Criticism and Conservation.', 'CIP2020', 'CIP 2020')
		,('50.0705', 'Drawing.', 'CIP2020', 'CIP 2020')
		,('50.0706', 'Intermedia/Multimedia.', 'CIP2020', 'CIP 2020')
		,('50.0708', 'Painting.', 'CIP2020', 'CIP 2020')
		,('50.0709', 'Sculpture.', 'CIP2020', 'CIP 2020')
		,('50.0710', 'Printmaking.', 'CIP2020', 'CIP 2020')
		,('50.0711', 'Ceramic Arts and Ceramics.', 'CIP2020', 'CIP 2020')
		,('50.0712', 'Fiber, Textile and Weaving Arts.', 'CIP2020', 'CIP 2020')
		,('50.0713', 'Jewelry Arts.', 'CIP2020', 'CIP 2020')
		,('50.0714', 'Metal Arts.', 'CIP2020', 'CIP 2020')
		,('50.0799', 'Fine Arts and Art Studies, Other.', 'CIP2020', 'CIP 2020')
		,('50.09', 'Music.', 'CIP2020', 'CIP 2020')
		,('50.0901', 'Music, General.', 'CIP2020', 'CIP 2020')
		,('50.0902', 'Music History, Literature, and Theory.', 'CIP2020', 'CIP 2020')
		,('50.0903', 'Music Performance, General.', 'CIP2020', 'CIP 2020')
		,('50.0904', 'Music Theory and Composition.', 'CIP2020', 'CIP 2020')
		,('50.0905', 'Musicology and Ethnomusicology.', 'CIP2020', 'CIP 2020')
		,('50.0906', 'Conducting.', 'CIP2020', 'CIP 2020')
		,('50.0907', 'Keyboard Instruments.', 'CIP2020', 'CIP 2020')
		,('50.0908', 'Voice and Opera.', 'CIP2020', 'CIP 2020')
		,('50.0910', 'Jazz/Jazz Studies.', 'CIP2020', 'CIP 2020')
		,('50.0911', 'Stringed Instruments.', 'CIP2020', 'CIP 2020')
		,('50.0912', 'Music Pedagogy.', 'CIP2020', 'CIP 2020')
		,('50.0913', 'Music Technology.', 'CIP2020', 'CIP 2020')
		,('50.0914', 'Brass Instruments.', 'CIP2020', 'CIP 2020')
		,('50.0915', 'Woodwind Instruments.', 'CIP2020', 'CIP 2020')
		,('50.0916', 'Percussion Instruments.', 'CIP2020', 'CIP 2020')
		,('50.0917', 'Sound Arts.', 'CIP2020', 'CIP 2020')
		,('50.0999', 'Music, Other.', 'CIP2020', 'CIP 2020')
		,('50.10', 'Arts, Entertainment, and Media Management.', 'CIP2020', 'CIP 2020')
		,('50.1001', 'Arts, Entertainment, and Media Management, General.', 'CIP2020', 'CIP 2020')
		,('50.1002', 'Fine and Studio Arts Management.', 'CIP2020', 'CIP 2020')
		,('50.1003', 'Music Management.', 'CIP2020', 'CIP 2020')
		,('50.1004', 'Theatre/Theatre Arts Management.', 'CIP2020', 'CIP 2020')
		,('50.1099', 'Arts, Entertainment, and Media Management, Other.', 'CIP2020', 'CIP 2020')
		,('50.11', 'Community/Environmental/Socially-Engaged Art.', 'CIP2020', 'CIP 2020')
		,('50.1101', 'Community/Environmental/Socially-Engaged Art.', 'CIP2020', 'CIP 2020')
		,('50.99', 'Visual and Performing Arts, Other.', 'CIP2020', 'CIP 2020')
		,('50.9999', 'Visual and Performing Arts, Other.', 'CIP2020', 'CIP 2020')
		,('51', 'HEALTH PROFESSIONS AND RELATED PROGRAMS.', 'CIP2020', 'CIP 2020')
		,('51.00', 'Health Services/Allied Health/Health Sciences, General.', 'CIP2020', 'CIP 2020')
		,('51.0000', 'Health Services/Allied Health/Health Sciences, General.', 'CIP2020', 'CIP 2020')
		,('51.0001', 'Health and Wellness, General.', 'CIP2020', 'CIP 2020')
		,('51.01', 'Chiropractic.', 'CIP2020', 'CIP 2020')
		,('51.0101', 'Chiropractic.', 'CIP2020', 'CIP 2020')
		,('51.02', 'Communication Disorders Sciences and Services.', 'CIP2020', 'CIP 2020')
		,('51.0201', 'Communication Sciences and Disorders, General.', 'CIP2020', 'CIP 2020')
		,('51.0202', 'Audiology/Audiologist.', 'CIP2020', 'CIP 2020')
		,('51.0203', 'Speech-Language Pathology/Pathologist.', 'CIP2020', 'CIP 2020')
		,('51.0204', 'Audiology/Audiologist and Speech-Language Pathology/Pathologist.', 'CIP2020', 'CIP 2020')
		,('51.0299', 'Communication Disorders Sciences and Services, Other.', 'CIP2020', 'CIP 2020')
		,('51.04', 'Dentistry.', 'CIP2020', 'CIP 2020')
		,('51.0401', 'Dentistry.', 'CIP2020', 'CIP 2020')
		,('51.05', 'Advanced/Graduate Dentistry and Oral Sciences.', 'CIP2020', 'CIP 2020')
		,('51.0501', 'Dental Clinical Sciences, General.', 'CIP2020', 'CIP 2020')
		,('51.0502', 'Advanced General Dentistry.', 'CIP2020', 'CIP 2020')
		,('51.0503', 'Oral Biology and Oral and Maxillofacial Pathology.', 'CIP2020', 'CIP 2020')
		,('51.0504', 'Dental Public Health and Education.', 'CIP2020', 'CIP 2020')
		,('51.0505', 'Dental Materials.', 'CIP2020', 'CIP 2020')
		,('51.0506', 'Endodontics/Endodontology.', 'CIP2020', 'CIP 2020')
		,('51.0507', 'Oral/Maxillofacial Surgery.', 'CIP2020', 'CIP 2020')
		,('51.0508', 'Orthodontics/Orthodontology.', 'CIP2020', 'CIP 2020')
		,('51.0509', 'Pediatric Dentistry/Pedodontics.', 'CIP2020', 'CIP 2020')
		,('51.0510', 'Periodontics/Periodontology.', 'CIP2020', 'CIP 2020')
		,('51.0511', 'Prosthodontics/Prosthodontology.', 'CIP2020', 'CIP 2020')
		,('51.0512', 'Digital Dentistry.', 'CIP2020', 'CIP 2020')
		,('51.0513', 'Geriatric Dentistry.', 'CIP2020', 'CIP 2020')
		,('51.0514', 'Implantology/Implant Dentistry.', 'CIP2020', 'CIP 2020')
		,('51.0599', 'Advanced/Graduate Dentistry and Oral Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('51.06', 'Dental Support Services and Allied Professions.', 'CIP2020', 'CIP 2020')
		,('51.0601', 'Dental Assisting/Assistant.', 'CIP2020', 'CIP 2020')
		,('51.0602', 'Dental Hygiene/Hygienist.', 'CIP2020', 'CIP 2020')
		,('51.0603', 'Dental Laboratory Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('51.0699', 'Dental Services and Allied Professions, Other.', 'CIP2020', 'CIP 2020')
		,('51.07', 'Health and Medical Administrative Services.', 'CIP2020', 'CIP 2020')
		,('51.0701', 'Health/Health Care Administration/Management.', 'CIP2020', 'CIP 2020')
		,('51.0702', 'Hospital and Health Care Facilities Administration/Management.', 'CIP2020', 'CIP 2020')
		,('51.0703', 'Health Unit Coordinator/Ward Clerk.', 'CIP2020', 'CIP 2020')
		,('51.0704', 'Health Unit Manager/Ward Supervisor.', 'CIP2020', 'CIP 2020')
		,('51.0705', 'Medical Office Management/Administration.', 'CIP2020', 'CIP 2020')
		,('51.0706', 'Health Information/Medical Records Administration/Administrator.', 'CIP2020', 'CIP 2020')
		,('51.0707', 'Health Information/Medical Records Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('51.0708', 'Medical Transcription/Transcriptionist.', 'CIP2020', 'CIP 2020')
		,('51.0709', 'Medical Office Computer Specialist/Assistant.', 'CIP2020', 'CIP 2020')
		,('51.0710', 'Medical Office Assistant/Specialist.', 'CIP2020', 'CIP 2020')
		,('51.0711', 'Medical/Health Management and Clinical Assistant/Specialist.', 'CIP2020', 'CIP 2020')
		,('51.0712', 'Medical Reception/Receptionist.', 'CIP2020', 'CIP 2020')
		,('51.0713', 'Medical Insurance Coding Specialist/Coder.', 'CIP2020', 'CIP 2020')
		,('51.0714', 'Medical Insurance Specialist/Medical Biller.', 'CIP2020', 'CIP 2020')
		,('51.0715', 'Health/Medical Claims Examiner.', 'CIP2020', 'CIP 2020')
		,('51.0716', 'Medical Administrative/Executive Assistant and Medical Secretary.', 'CIP2020', 'CIP 2020')
		,('51.0717', 'Medical Staff Services Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('51.0718', 'Long Term Care Administration/Management.', 'CIP2020', 'CIP 2020')
		,('51.0719', 'Clinical Research Coordinator.', 'CIP2020', 'CIP 2020')
		,('51.0720', 'Regulatory Science/Affairs.', 'CIP2020', 'CIP 2020')
		,('51.0721', 'Disease Registry Data Management.', 'CIP2020', 'CIP 2020')
		,('51.0722', 'Healthcare Innovation.', 'CIP2020', 'CIP 2020')
		,('51.0723', 'Healthcare Information Privacy Assurance and Security.', 'CIP2020', 'CIP 2020')
		,('51.0799', 'Health and Medical Administrative Services, Other.', 'CIP2020', 'CIP 2020')
		,('51.08', 'Allied Health and Medical Assisting Services.', 'CIP2020', 'CIP 2020')
		,('51.0801', 'Medical/Clinical Assistant.', 'CIP2020', 'CIP 2020')
		,('51.0802', 'Clinical/Medical Laboratory Assistant.', 'CIP2020', 'CIP 2020')
		,('51.0803', 'Occupational Therapist Assistant.', 'CIP2020', 'CIP 2020')
		,('51.0805', 'Pharmacy Technician/Assistant.', 'CIP2020', 'CIP 2020')
		,('51.0806', 'Physical Therapy Assistant.', 'CIP2020', 'CIP 2020')
		,('01.8301', 'Veterinary/Animal Health Technology/Technician and Veterinary Assistant.', 'CIP2020', 'CIP 2020')
		,('51.0809', 'Anesthesiologist Assistant.', 'CIP2020', 'CIP 2020')
		,('51.0810', 'Emergency Care Attendant (EMT Ambulance).', 'CIP2020', 'CIP 2020')
		,('51.0811', 'Pathology/Pathologist Assistant.', 'CIP2020', 'CIP 2020')
		,('51.0812', 'Respiratory Therapy Technician/Assistant.', 'CIP2020', 'CIP 2020')
		,('51.0813', 'Chiropractic Technician/Assistant.', 'CIP2020', 'CIP 2020')
		,('51.0814', 'Radiologist Assistant.', 'CIP2020', 'CIP 2020')
		,('51.0815', 'Lactation Consultant.', 'CIP2020', 'CIP 2020')
		,('51.0816', 'Speech-Language Pathology Assistant.', 'CIP2020', 'CIP 2020')
		,('51.0817', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('51.0899', 'Allied Health and Medical Assisting Services, Other.', 'CIP2020', 'CIP 2020')
		,('51.09', 'Allied Health Diagnostic, Intervention, and Treatment Professions.', 'CIP2020', 'CIP 2020')
		,('51.0901', 'Cardiovascular Technology/Technologist.', 'CIP2020', 'CIP 2020')
		,('51.0902', 'Electrocardiograph Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('51.0903', 'Electroneurodiagnostic/Electroencephalographic Technology/Technologist.', 'CIP2020', 'CIP 2020')
		,('51.0904', 'Emergency Medical Technology/Technician (EMT Paramedic).', 'CIP2020', 'CIP 2020')
		,('51.0905', 'Nuclear Medical Technology/Technologist.', 'CIP2020', 'CIP 2020')
		,('51.0906', 'Perfusion Technology/Perfusionist.', 'CIP2020', 'CIP 2020')
		,('51.0907', 'Medical Radiologic Technology/Science - Radiation Therapist.', 'CIP2020', 'CIP 2020')
		,('51.0908', 'Respiratory Care Therapy/Therapist.', 'CIP2020', 'CIP 2020')
		,('51.0909', 'Surgical Technology/Technologist.', 'CIP2020', 'CIP 2020')
		,('51.0910', 'Diagnostic Medical Sonography/Sonographer and Ultrasound Technician.', 'CIP2020', 'CIP 2020')
		,('51.0911', 'Radiologic Technology/Science - Radiographer.', 'CIP2020', 'CIP 2020')
		,('51.0912', 'Physician Associate/Assistant.', 'CIP2020', 'CIP 2020')
		,('51.0913', 'Athletic Training/Trainer.', 'CIP2020', 'CIP 2020')
		,('51.0914', 'Gene/Genetic Therapy.', 'CIP2020', 'CIP 2020')
		,('51.0915', 'Cardiopulmonary Technology/Technologist.', 'CIP2020', 'CIP 2020')
		,('51.0916', 'Radiation Protection/Health Physics Technician.', 'CIP2020', 'CIP 2020')
		,('51.0917', 'Polysomnography.', 'CIP2020', 'CIP 2020')
		,('51.0918', 'Hearing Instrument Specialist.', 'CIP2020', 'CIP 2020')
		,('51.0919', 'Mammography Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('51.0920', 'Magnetic Resonance Imaging (MRI) Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('51.0921', 'Hyperbaric Medicine Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('51.0922', 'Intraoperative Neuromonitoring Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('51.0923', 'Orthopedic Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('51.0924', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('51.0999', 'Allied Health Diagnostic, Intervention, and Treatment Professions, Other.', 'CIP2020', 'CIP 2020')
		,('51.10', 'Clinical/Medical Laboratory Science/Research and Allied Professions.', 'CIP2020', 'CIP 2020')
		,('51.1001', 'Blood Bank Technology Specialist.', 'CIP2020', 'CIP 2020')
		,('51.1002', 'Cytotechnology/Cytotechnologist.', 'CIP2020', 'CIP 2020')
		,('51.1003', 'Hematology Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('51.1004', 'Clinical/Medical Laboratory Technician.', 'CIP2020', 'CIP 2020')
		,('51.1005', 'Clinical Laboratory Science/Medical Technology/Technologist.', 'CIP2020', 'CIP 2020')
		,('51.1006', 'Ophthalmic Laboratory Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('51.1007', 'Histologic Technology/Histotechnologist.', 'CIP2020', 'CIP 2020')
		,('51.1008', 'Histologic Technician.', 'CIP2020', 'CIP 2020')
		,('51.1009', 'Phlebotomy Technician/Phlebotomist.', 'CIP2020', 'CIP 2020')
		,('51.1010', 'Cytogenetics/Genetics/Clinical Genetics Technology/Technologist.', 'CIP2020', 'CIP 2020')
		,('51.1011', 'Renal/Dialysis Technologist/Technician.', 'CIP2020', 'CIP 2020')
		,('51.1012', 'Sterile Processing Technology/Technician.', 'CIP2020', 'CIP 2020')
		,('51.1099', 'Clinical/Medical Laboratory Science and Allied Professions, Other.', 'CIP2020', 'CIP 2020')
		,('51.11', 'Health/Medical Preparatory Programs.', 'CIP2020', 'CIP 2020')
		,('51.1101', 'Pre-Dentistry Studies.', 'CIP2020', 'CIP 2020')
		,('51.1102', 'Pre-Medicine/Pre-Medical Studies.', 'CIP2020', 'CIP 2020')
		,('51.1103', 'Pre-Pharmacy Studies.', 'CIP2020', 'CIP 2020')
		,('01.1302', 'Pre-Veterinary Studies.', 'CIP2020', 'CIP 2020')
		,('51.1105', 'Pre-Nursing Studies.', 'CIP2020', 'CIP 2020')
		,('51.1106', 'Pre-Chiropractic Studies.', 'CIP2020', 'CIP 2020')
		,('51.1107', 'Pre-Occupational Therapy Studies.', 'CIP2020', 'CIP 2020')
		,('51.1108', 'Pre-Optometry Studies.', 'CIP2020', 'CIP 2020')
		,('51.1109', 'Pre-Physical Therapy Studies.', 'CIP2020', 'CIP 2020')
		,('51.1110', 'Pre-Art Therapy.', 'CIP2020', 'CIP 2020')
		,('51.1111', 'Pre-Physician Assistant.', 'CIP2020', 'CIP 2020')
		,('51.1199', 'Health/Medical Preparatory Programs, Other.', 'CIP2020', 'CIP 2020')
		,('51.12', 'Medicine.', 'CIP2020', 'CIP 2020')
		,('51.1201', 'Medicine.', 'CIP2020', 'CIP 2020')
		,('51.1299', 'Medicine, Other.', 'CIP2020', 'CIP 2020')
		,('51.14', 'Medical Clinical Sciences/Graduate Medical Studies.', 'CIP2020', 'CIP 2020')
		,('51.1401', 'Medical Science/Scientist.', 'CIP2020', 'CIP 2020')
		,('51.1402', 'Clinical and Translational Science.', 'CIP2020', 'CIP 2020')
		,('51.1403', 'Pain Management.', 'CIP2020', 'CIP 2020')
		,('51.1404', 'Temporomandibular Disorders and Orofacial Pain.', 'CIP2020', 'CIP 2020')
		,('51.1405', 'Tropical Medicine.', 'CIP2020', 'CIP 2020')
		,('51.1499', 'Medical Clinical Sciences/Graduate Medical Studies, Other.', 'CIP2020', 'CIP 2020')
		,('51.15', 'Mental and Social Health Services and Allied Professions.', 'CIP2020', 'CIP 2020')
		,('51.1501', 'Substance Abuse/Addiction Counseling.', 'CIP2020', 'CIP 2020')
		,('51.1502', 'Psychiatric/Mental Health Services Technician.', 'CIP2020', 'CIP 2020')
		,('51.1503', 'Clinical/Medical Social Work.', 'CIP2020', 'CIP 2020')
		,('51.1504', 'Community Health Services/Liaison/Counseling.', 'CIP2020', 'CIP 2020')
		,('51.1505', 'Marriage and Family Therapy/Counseling.', 'CIP2020', 'CIP 2020')
		,('51.1506', 'Clinical Pastoral Counseling/Patient Counseling.', 'CIP2020', 'CIP 2020')
		,('51.1507', 'Psychoanalysis and Psychotherapy.', 'CIP2020', 'CIP 2020')
		,('51.1508', 'Mental Health Counseling/Counselor.', 'CIP2020', 'CIP 2020')
		,('51.1509', 'Genetic Counseling/Counselor.', 'CIP2020', 'CIP 2020')
		,('51.1510', 'Infant/Toddler Mental Health Services.', 'CIP2020', 'CIP 2020')
		,('51.1511', 'Medical Family Therapy/Therapist.', 'CIP2020', 'CIP 2020')
		,('51.1512', 'Hospice and Palliative Care.', 'CIP2020', 'CIP 2020')
		,('51.1513', 'Trauma Counseling.', 'CIP2020', 'CIP 2020')
		,('51.1580', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('51.1599', 'Mental and Social Health Services and Allied Professions, Other.', 'CIP2020', 'CIP 2020')
		,('51.17', 'Optometry.', 'CIP2020', 'CIP 2020')
		,('51.1701', 'Optometry.', 'CIP2020', 'CIP 2020')
		,('51.18', 'Ophthalmic and Optometric Support Services and Allied Professions.', 'CIP2020', 'CIP 2020')
		,('51.1801', 'Opticianry/Ophthalmic Dispensing Optician.', 'CIP2020', 'CIP 2020')
		,('51.1802', 'Optometric Technician/Assistant.', 'CIP2020', 'CIP 2020')
		,('51.1803', 'Ophthalmic Technician/Technologist.', 'CIP2020', 'CIP 2020')
	INSERT INTO #CipCodeAndVersion
	VALUES
		 ('51.1804', 'Orthoptics/Orthoptist.', 'CIP2020', 'CIP 2020')
		,('51.1899', 'Ophthalmic and Optometric Support Services and Allied Professions, Other.', 'CIP2020', 'CIP 2020')
		,('51.19', 'Deleted, report under 51.1202', 'CIP2020', 'CIP 2020')
		,('51.1202', 'Osteopathic Medicine/Osteopathy.', 'CIP2020', 'CIP 2020')
		,('51.20', 'Pharmacy, Pharmaceutical Sciences, and Administration.', 'CIP2020', 'CIP 2020')
		,('51.2001', 'Pharmacy.', 'CIP2020', 'CIP 2020')
		,('51.2002', 'Pharmacy Administration and Pharmacy Policy and Regulatory Affairs.', 'CIP2020', 'CIP 2020')
		,('51.2003', 'Pharmaceutics and Drug Design.', 'CIP2020', 'CIP 2020')
		,('51.2004', 'Medicinal and Pharmaceutical Chemistry.', 'CIP2020', 'CIP 2020')
		,('51.2005', 'Natural Products Chemistry and Pharmacognosy.', 'CIP2020', 'CIP 2020')
		,('51.2006', 'Clinical and Industrial Drug Development.', 'CIP2020', 'CIP 2020')
		,('51.2007', 'Pharmacoeconomics/Pharmaceutical Economics.', 'CIP2020', 'CIP 2020')
		,('51.2008', 'Clinical, Hospital, and Managed Care Pharmacy.', 'CIP2020', 'CIP 2020')
		,('51.2009', 'Industrial and Physical Pharmacy and Cosmetic Sciences.', 'CIP2020', 'CIP 2020')
		,('51.2010', 'Pharmaceutical Sciences.', 'CIP2020', 'CIP 2020')
		,('51.2011', 'Pharmaceutical Marketing and Management.', 'CIP2020', 'CIP 2020')
		,('51.2099', 'Pharmacy, Pharmaceutical Sciences, and Administration, Other.', 'CIP2020', 'CIP 2020')
		,('51.21', 'Deleted, report under 51.1203', 'CIP2020', 'CIP 2020')
		,('51.1203', 'Podiatric Medicine/Podiatry.', 'CIP2020', 'CIP 2020')
		,('51.22', 'Public Health.', 'CIP2020', 'CIP 2020')
		,('51.2201', 'Public Health, General.', 'CIP2020', 'CIP 2020')
		,('51.2202', 'Environmental Health.', 'CIP2020', 'CIP 2020')
		,('51.2205', 'Health/Medical  Physics.', 'CIP2020', 'CIP 2020')
		,('51.2206', 'Occupational Health and Industrial Hygiene.', 'CIP2020', 'CIP 2020')
		,('51.2207', 'Public Health Education and Promotion.', 'CIP2020', 'CIP 2020')
		,('51.2208', 'Community Health and Preventive Medicine.', 'CIP2020', 'CIP 2020')
		,('51.2209', 'Maternal and Child Health.', 'CIP2020', 'CIP 2020')
		,('51.2210', 'International Public Health/International Health.', 'CIP2020', 'CIP 2020')
		,('51.2211', 'Health Services Administration.', 'CIP2020', 'CIP 2020')
		,('51.2212', 'Behavioral Aspects of Health.', 'CIP2020', 'CIP 2020')
		,('51.2213', 'Patient Safety and Healthcare Quality.', 'CIP2020', 'CIP 2020')
		,('51.2214', 'Public Health Genetics.', 'CIP2020', 'CIP 2020')
		,('51.2280', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('51.2299', 'Public Health, Other.', 'CIP2020', 'CIP 2020')
		,('51.23', 'Rehabilitation and Therapeutic Professions.', 'CIP2020', 'CIP 2020')
		,('51.2300', 'Rehabilitation and Therapeutic Professions, General.', 'CIP2020', 'CIP 2020')
		,('51.2301', 'Art Therapy/Therapist.', 'CIP2020', 'CIP 2020')
		,('51.2302', 'Dance Therapy/Therapist.', 'CIP2020', 'CIP 2020')
		,('51.2305', 'Music Therapy/Therapist.', 'CIP2020', 'CIP 2020')
		,('51.2306', 'Occupational Therapy/Therapist.', 'CIP2020', 'CIP 2020')
		,('51.2307', 'Orthotist/Prosthetist.', 'CIP2020', 'CIP 2020')
		,('51.2308', 'Physical Therapy/Therapist.', 'CIP2020', 'CIP 2020')
		,('51.2309', 'Therapeutic Recreation/Recreational Therapy.', 'CIP2020', 'CIP 2020')
		,('51.2310', 'Vocational Rehabilitation Counseling/Counselor.', 'CIP2020', 'CIP 2020')
		,('51.2311', 'Kinesiotherapy/Kinesiotherapist.', 'CIP2020', 'CIP 2020')
		,('51.2312', 'Assistive/Augmentative Technology and Rehabilitation Engineering.', 'CIP2020', 'CIP 2020')
		,('51.2313', 'Animal-Assisted Therapy.', 'CIP2020', 'CIP 2020')
		,('51.2314', 'Rehabilitation Science.', 'CIP2020', 'CIP 2020')
		,('51.2315', 'Drama Therapy/Therapist.', 'CIP2020', 'CIP 2020')
		,('51.2316', 'Horticulture Therapy/Therapist.', 'CIP2020', 'CIP 2020')
		,('51.2317', 'Play Therapy/Therapist.', 'CIP2020', 'CIP 2020')
		,('51.2399', 'Rehabilitation and Therapeutic Professions, Other.', 'CIP2020', 'CIP 2020')
		,('01.80', 'Veterinary Medicine.', 'CIP2020', 'CIP 2020')
		,('01.8001', 'Veterinary Medicine.', 'CIP2020', 'CIP 2020')
		,('01.81', 'Veterinary Biomedical and Clinical Sciences.', 'CIP2020', 'CIP 2020')
		,('01.8101', 'Veterinary Sciences/Veterinary Clinical Sciences, General.', 'CIP2020', 'CIP 2020')
		,('01.8105', 'Veterinary Anatomy.', 'CIP2020', 'CIP 2020')
		,('01.8109', 'Veterinary Physiology.', 'CIP2020', 'CIP 2020')
		,('01.8107', 'Veterinary Microbiology and Immunobiology.', 'CIP2020', 'CIP 2020')
		,('01.8108', 'Veterinary Pathology and Pathobiology.', 'CIP2020', 'CIP 2020')
		,('01.8111', 'Veterinary Toxicology and Pharmacology.', 'CIP2020', 'CIP 2020')
		,('01.8103', 'Large Animal/Food Animal and Equine Surgery and Medicine.', 'CIP2020', 'CIP 2020')
		,('01.8104', 'Small/Companion Animal Surgery and Medicine.', 'CIP2020', 'CIP 2020')
		,('01.8102', 'Comparative and Laboratory Animal Medicine.', 'CIP2020', 'CIP 2020')
		,('01.8110', 'Veterinary Preventive Medicine, Epidemiology, and Public Health.', 'CIP2020', 'CIP 2020')
		,('01.8106', 'Veterinary Infectious Diseases.', 'CIP2020', 'CIP 2020')
		,('01.8199', 'Veterinary Biomedical and Clinical Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('51.26', 'Health Aides/Attendants/Orderlies.', 'CIP2020', 'CIP 2020')
		,('51.2601', 'Health Aide.', 'CIP2020', 'CIP 2020')
		,('51.2602', 'Home Health Aide/Home Attendant.', 'CIP2020', 'CIP 2020')
		,('51.2603', 'Medication Aide.', 'CIP2020', 'CIP 2020')
		,('51.2604', 'Rehabilitation Aide.', 'CIP2020', 'CIP 2020')
		,('51.2605', 'Physical Therapy Technician/Aide.', 'CIP2020', 'CIP 2020')
		,('51.2699', 'Health Aides/Attendants/Orderlies, Other.', 'CIP2020', 'CIP 2020')
		,('51.27', 'Medical Illustration and Informatics.', 'CIP2020', 'CIP 2020')
		,('51.2703', 'Medical Illustration/Medical Illustrator.', 'CIP2020', 'CIP 2020')
		,('51.2706', 'Medical Informatics.', 'CIP2020', 'CIP 2020')
		,('51.2799', 'Medical Illustration and Informatics, Other.', 'CIP2020', 'CIP 2020')
		,('51.31', 'Dietetics and Clinical Nutrition Services.', 'CIP2020', 'CIP 2020')
		,('51.3101', 'Dietetics/Dietitian.', 'CIP2020', 'CIP 2020')
		,('51.3102', 'Clinical Nutrition/Nutritionist.', 'CIP2020', 'CIP 2020')
		,('51.3103', 'Dietetic Technician.', 'CIP2020', 'CIP 2020')
		,('51.3104', 'Dietitian Assistant.', 'CIP2020', 'CIP 2020')
		,('51.3199', 'Dietetics and Clinical Nutrition Services, Other.', 'CIP2020', 'CIP 2020')
		,('51.32', 'Health Professions Education, Ethics, and Humanities.', 'CIP2020', 'CIP 2020')
		,('51.3201', 'Bioethics/Medical Ethics.', 'CIP2020', 'CIP 2020')
		,('51.3202', 'Health Professions Education.', 'CIP2020', 'CIP 2020')
		,('51.3204', 'Medical/Health Humanities.', 'CIP2020', 'CIP 2020')
		,('51.3205', 'History of Medicine.', 'CIP2020', 'CIP 2020')
		,('51.3206', 'Arts in Medicine/Health.', 'CIP2020', 'CIP 2020')
		,('51.3299', 'Health Professions Education, Ethics, and Humanities, Other.', 'CIP2020', 'CIP 2020')
		,('51.33', 'Alternative and Complementary Medicine and Medical Systems.', 'CIP2020', 'CIP 2020')
		,('51.3300', 'Alternative and Complementary Medicine and Medical Systems, General.', 'CIP2020', 'CIP 2020')
		,('51.3301', 'Acupuncture and Oriental Medicine.', 'CIP2020', 'CIP 2020')
		,('51.3302', 'Traditional Chinese Medicine and Chinese Herbology.', 'CIP2020', 'CIP 2020')
		,('51.3303', 'Naturopathic Medicine/Naturopathy.', 'CIP2020', 'CIP 2020')
		,('51.3304', 'Homeopathic Medicine/Homeopathy.', 'CIP2020', 'CIP 2020')
		,('51.3305', 'Ayurvedic Medicine/Ayurveda.', 'CIP2020', 'CIP 2020')
		,('51.3306', 'Holistic/Integrative Health.', 'CIP2020', 'CIP 2020')
		,('51.3399', 'Alternative and Complementary Medicine and Medical Systems, Other.', 'CIP2020', 'CIP 2020')
		,('51.34', 'Alternative and Complementary Medical Support Services.', 'CIP2020', 'CIP 2020')
		,('51.3401', 'Direct Entry Midwifery.', 'CIP2020', 'CIP 2020')
		,('51.3499', 'Alternative and Complementary Medical Support Services, Other.', 'CIP2020', 'CIP 2020')
		,('51.35', 'Somatic Bodywork and Related Therapeutic Services.', 'CIP2020', 'CIP 2020')
		,('51.3501', 'Massage Therapy/Therapeutic Massage.', 'CIP2020', 'CIP 2020')
		,('51.3502', 'Asian Bodywork Therapy.', 'CIP2020', 'CIP 2020')
		,('51.3503', 'Somatic Bodywork.', 'CIP2020', 'CIP 2020')
		,('51.3599', 'Somatic Bodywork and Related Therapeutic Services, Other.', 'CIP2020', 'CIP 2020')
		,('51.36', 'Movement and Mind-Body Therapies and Education.', 'CIP2020', 'CIP 2020')
		,('51.3601', 'Movement Therapy and Movement Education.', 'CIP2020', 'CIP 2020')
		,('51.3602', 'Yoga Teacher Training/Yoga Therapy.', 'CIP2020', 'CIP 2020')
		,('51.3603', 'Hypnotherapy/Hypnotherapist.', 'CIP2020', 'CIP 2020')
		,('51.3699', 'Movement and Mind-Body Therapies and Education, Other.', 'CIP2020', 'CIP 2020')
		,('51.37', 'Energy and Biologically Based Therapies.', 'CIP2020', 'CIP 2020')
		,('51.3701', 'Aromatherapy.', 'CIP2020', 'CIP 2020')
		,('51.3702', 'Herbalism/Herbalist.', 'CIP2020', 'CIP 2020')
		,('51.3703', 'Polarity Therapy.', 'CIP2020', 'CIP 2020')
		,('51.3704', 'Reiki.', 'CIP2020', 'CIP 2020')
		,('51.3799', 'Energy and Biologically Based Therapies, Other.', 'CIP2020', 'CIP 2020')
		,('51.38', 'Registered Nursing, Nursing Administration, Nursing Research and Clinical Nursing.', 'CIP2020', 'CIP 2020')
		,('51.3801', 'Registered Nursing/Registered Nurse.', 'CIP2020', 'CIP 2020')
		,('51.3802', 'Nursing Administration.', 'CIP2020', 'CIP 2020')
		,('51.3803', 'Adult Health Nurse/Nursing.', 'CIP2020', 'CIP 2020')
		,('51.3804', 'Nurse Anesthetist.', 'CIP2020', 'CIP 2020')
		,('51.3805', 'Family Practice Nurse/Nursing.', 'CIP2020', 'CIP 2020')
		,('51.3806', 'Maternal/Child Health and Neonatal Nurse/Nursing.', 'CIP2020', 'CIP 2020')
		,('51.3807', 'Nurse Midwife/Nursing Midwifery.', 'CIP2020', 'CIP 2020')
		,('51.3808', 'Nursing Science.', 'CIP2020', 'CIP 2020')
		,('51.3809', 'Pediatric Nurse/Nursing.', 'CIP2020', 'CIP 2020')
		,('51.3810', 'Psychiatric/Mental Health Nurse/Nursing.', 'CIP2020', 'CIP 2020')
		,('51.3811', 'Public Health/Community Nurse/Nursing.', 'CIP2020', 'CIP 2020')
		,('51.3812', 'Perioperative/Operating Room and Surgical Nurse/Nursing.', 'CIP2020', 'CIP 2020')
		,('51.3813', 'Clinical Nurse Specialist.', 'CIP2020', 'CIP 2020')
		,('51.3814', 'Critical Care Nursing.', 'CIP2020', 'CIP 2020')
		,('51.3815', 'Occupational and Environmental Health Nursing.', 'CIP2020', 'CIP 2020')
		,('51.3816', 'Emergency Room/Trauma Nursing.', 'CIP2020', 'CIP 2020')
		,('51.3203', 'Nursing Education.', 'CIP2020', 'CIP 2020')
		,('51.3818', 'Nursing Practice.', 'CIP2020', 'CIP 2020')
		,('51.3819', 'Palliative Care Nursing.', 'CIP2020', 'CIP 2020')
		,('51.3820', 'Clinical Nurse Leader.', 'CIP2020', 'CIP 2020')
		,('51.3821', 'Geriatric Nurse/Nursing.', 'CIP2020', 'CIP 2020')
		,('51.3822', 'Women&#39;s Health Nurse/Nursing.', 'CIP2020', 'CIP 2020')
		,('51.3823', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('51.3824', 'Forensic Nursing.', 'CIP2020', 'CIP 2020')
		,('51.3899', 'Registered Nursing, Nursing Administration, Nursing Research and Clinical Nursing, Other.', 'CIP2020', 'CIP 2020')
		,('51.39', 'Practical Nursing, Vocational Nursing and Nursing Assistants.', 'CIP2020', 'CIP 2020')
		,('51.3901', 'Licensed Practical/Vocational Nurse Training.', 'CIP2020', 'CIP 2020')
		,('51.3902', 'Nursing Assistant/Aide and Patient Care Assistant/Aide.', 'CIP2020', 'CIP 2020')
		,('51.3999', 'Practical Nursing, Vocational Nursing and Nursing Assistants, Other.', 'CIP2020', 'CIP 2020')
		,('51.99', 'Health Professions and Related Clinical Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('51.9980', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('51.9999', 'Health Professions and Related Clinical Sciences, Other.', 'CIP2020', 'CIP 2020')
		,('52', 'BUSINESS, MANAGEMENT, MARKETING, AND RELATED SUPPORT SERVICES.', 'CIP2020', 'CIP 2020')
		,('52.01', 'Business/Commerce, General.', 'CIP2020', 'CIP 2020')
		,('52.0101', 'Business/Commerce, General.', 'CIP2020', 'CIP 2020')
		,('52.02', 'Business Administration, Management and Operations.', 'CIP2020', 'CIP 2020')
		,('52.0201', 'Business Administration and Management, General.', 'CIP2020', 'CIP 2020')
		,('52.0202', 'Purchasing, Procurement/Acquisitions and Contracts Management.', 'CIP2020', 'CIP 2020')
		,('52.0203', 'Logistics, Materials, and Supply Chain Management.', 'CIP2020', 'CIP 2020')
		,('52.0204', 'Office Management and Supervision.', 'CIP2020', 'CIP 2020')
		,('52.0205', 'Operations Management and Supervision.', 'CIP2020', 'CIP 2020')
		,('52.0206', 'Non-Profit/Public/Organizational Management.', 'CIP2020', 'CIP 2020')
		,('52.0207', 'Customer Service Management.', 'CIP2020', 'CIP 2020')
		,('52.0208', 'E-Commerce/Electronic Commerce.', 'CIP2020', 'CIP 2020')
		,('52.0209', 'Transportation/Mobility Management.', 'CIP2020', 'CIP 2020')
		,('52.0210', 'Research and Development Management.', 'CIP2020', 'CIP 2020')
		,('52.0211', 'Project Management.', 'CIP2020', 'CIP 2020')
		,('52.0212', 'Retail Management.', 'CIP2020', 'CIP 2020')
		,('52.0213', 'Organizational Leadership.', 'CIP2020', 'CIP 2020')
		,('52.0214', 'Research Administration.', 'CIP2020', 'CIP 2020')
		,('52.0215', 'Risk Management.', 'CIP2020', 'CIP 2020')
		,('52.0216', 'Science/Technology Management.', 'CIP2020', 'CIP 2020')
		,('52.0299', 'Business Administration, Management and Operations, Other.', 'CIP2020', 'CIP 2020')
		,('52.03', 'Accounting and Related Services.', 'CIP2020', 'CIP 2020')
		,('52.0301', 'Accounting.', 'CIP2020', 'CIP 2020')
		,('52.0302', 'Accounting Technology/Technician and Bookkeeping.', 'CIP2020', 'CIP 2020')
		,('52.0303', 'Auditing.', 'CIP2020', 'CIP 2020')
		,('52.0304', 'Accounting and Finance.', 'CIP2020', 'CIP 2020')
		,('52.0305', 'Accounting and Business/Management.', 'CIP2020', 'CIP 2020')
		,('52.0399', 'Accounting and Related Services, Other.', 'CIP2020', 'CIP 2020')
		,('52.04', 'Business Operations Support and Assistant Services.', 'CIP2020', 'CIP 2020')
		,('52.0401', 'Administrative Assistant and Secretarial Science, General.', 'CIP2020', 'CIP 2020')
		,('52.0402', 'Executive Assistant/Executive Secretary.', 'CIP2020', 'CIP 2020')
		,('52.0406', 'Receptionist.', 'CIP2020', 'CIP 2020')
		,('52.0407', 'Business/Office Automation/Technology/Data Entry.', 'CIP2020', 'CIP 2020')
		,('52.0408', 'General Office Occupations and Clerical Services.', 'CIP2020', 'CIP 2020')
		,('52.0409', 'Parts, Warehousing, and Inventory Management Operations.', 'CIP2020', 'CIP 2020')
		,('52.0410', 'Traffic, Customs, and Transportation Clerk/Technician.', 'CIP2020', 'CIP 2020')
		,('52.0411', 'Customer Service Support/Call Center/Teleservice Operation.', 'CIP2020', 'CIP 2020')
		,('52.0499', 'Business Operations Support and Secretarial Services, Other.', 'CIP2020', 'CIP 2020')
		,('52.05', 'Business/Corporate Communications.', 'CIP2020', 'CIP 2020')
		,('52.0501', 'Business/Corporate Communications, General.', 'CIP2020', 'CIP 2020')
		,('52.0502', 'Grantsmanship.', 'CIP2020', 'CIP 2020')
		,('52.0599', 'Business/Corporate Communications, Other.', 'CIP2020', 'CIP 2020')
		,('52.06', 'Business/Managerial Economics.', 'CIP2020', 'CIP 2020')
		,('52.0601', 'Business/Managerial Economics.', 'CIP2020', 'CIP 2020')
		,('52.07', 'Entrepreneurial and Small Business Operations.', 'CIP2020', 'CIP 2020')
		,('52.0701', 'Entrepreneurship/Entrepreneurial Studies.', 'CIP2020', 'CIP 2020')
		,('52.0702', 'Franchising and Franchise Operations.', 'CIP2020', 'CIP 2020')
		,('52.0703', 'Small Business Administration/Management.', 'CIP2020', 'CIP 2020')
		,('52.0704', 'Social Entrepreneurship.', 'CIP2020', 'CIP 2020')
		,('52.0799', 'Entrepreneurial and Small Business Operations, Other.', 'CIP2020', 'CIP 2020')
		,('52.08', 'Finance and Financial Management Services.', 'CIP2020', 'CIP 2020')
		,('52.0801', 'Finance, General.', 'CIP2020', 'CIP 2020')
		,('52.0803', 'Banking and Financial Support Services.', 'CIP2020', 'CIP 2020')
		,('52.0804', 'Financial Planning and Services.', 'CIP2020', 'CIP 2020')
		,('52.0806', 'International Finance.', 'CIP2020', 'CIP 2020')
		,('52.0807', 'Investments and Securities.', 'CIP2020', 'CIP 2020')
		,('52.0808', 'Public Finance.', 'CIP2020', 'CIP 2020')
		,('52.0809', 'Credit Management.', 'CIP2020', 'CIP 2020')
		,('52.0810', 'Financial Risk Management.', 'CIP2020', 'CIP 2020')
		,('52.0899', 'Finance and Financial Management Services, Other.', 'CIP2020', 'CIP 2020')
		,('52.09', 'Hospitality Administration/Management.', 'CIP2020', 'CIP 2020')
		,('52.0901', 'Hospitality Administration/Management, General.', 'CIP2020', 'CIP 2020')
		,('52.0903', 'Tourism and Travel Services Management.', 'CIP2020', 'CIP 2020')
		,('52.0904', 'Hotel/Motel Administration/Management.', 'CIP2020', 'CIP 2020')
		,('52.0905', 'Restaurant/Food Services Management.', 'CIP2020', 'CIP 2020')
		,('52.0906', 'Resort Management.', 'CIP2020', 'CIP 2020')
		,('52.0907', 'Meeting and Event Planning.', 'CIP2020', 'CIP 2020')
		,('52.0908', 'Casino Management.', 'CIP2020', 'CIP 2020')
		,('52.0909', 'Hotel, Motel, and Restaurant Management.', 'CIP2020', 'CIP 2020')
		,('52.0910', 'Brewery/Brewpub Operations/Management.', 'CIP2020', 'CIP 2020')
		,('52.0999', 'Hospitality Administration/Management, Other.', 'CIP2020', 'CIP 2020')
		,('52.10', 'Human Resources Management and Services.', 'CIP2020', 'CIP 2020')
		,('52.1001', 'Human Resources Management/Personnel Administration, General.', 'CIP2020', 'CIP 2020')
		,('52.1002', 'Labor and Industrial Relations.', 'CIP2020', 'CIP 2020')
		,('52.1003', 'Organizational Behavior Studies.', 'CIP2020', 'CIP 2020')
		,('52.1004', 'Labor Studies.', 'CIP2020', 'CIP 2020')
		,('52.1005', 'Human Resources Development.', 'CIP2020', 'CIP 2020')
		,('52.1006', 'Executive/Career Coaching.', 'CIP2020', 'CIP 2020')
		,('52.1099', 'Human Resources Management and Services, Other.', 'CIP2020', 'CIP 2020')
		,('52.11', 'International Business.', 'CIP2020', 'CIP 2020')
		,('52.1101', 'International Business/Trade/Commerce.', 'CIP2020', 'CIP 2020')
		,('52.12', 'Management Information Systems and Services.', 'CIP2020', 'CIP 2020')
		,('52.1201', 'Management Information Systems, General.', 'CIP2020', 'CIP 2020')
		,('52.1206', 'Information Resources Management.', 'CIP2020', 'CIP 2020')
		,('52.1207', 'Knowledge Management.', 'CIP2020', 'CIP 2020')
		,('52.1299', 'Management Information Systems and Services, Other.', 'CIP2020', 'CIP 2020')
		,('52.13', 'Management Sciences and Quantitative Methods.', 'CIP2020', 'CIP 2020')
		,('52.1301', 'Management Science.', 'CIP2020', 'CIP 2020')
		,('52.1302', 'Business Statistics.', 'CIP2020', 'CIP 2020')
		,('52.1304', 'Actuarial Science.', 'CIP2020', 'CIP 2020')
		,('52.1399', 'Management Sciences and Quantitative Methods, Other.', 'CIP2020', 'CIP 2020')
		,('52.14', 'Marketing.', 'CIP2020', 'CIP 2020')
		,('52.1401', 'Marketing/Marketing Management, General.', 'CIP2020', 'CIP 2020')
		,('52.1402', 'Marketing Research.', 'CIP2020', 'CIP 2020')
		,('52.1403', 'International Marketing.', 'CIP2020', 'CIP 2020')
		,('52.1404', 'Digital Marketing.', 'CIP2020', 'CIP 2020')
		,('52.1499', 'Marketing, Other.', 'CIP2020', 'CIP 2020')
		,('52.15', 'Real Estate.', 'CIP2020', 'CIP 2020')
		,('52.1501', 'Real Estate.', 'CIP2020', 'CIP 2020')
		,('52.16', 'Taxation.', 'CIP2020', 'CIP 2020')
		,('52.1601', 'Taxation.', 'CIP2020', 'CIP 2020')
		,('52.17', 'Insurance.', 'CIP2020', 'CIP 2020')
		,('52.1701', 'Insurance.', 'CIP2020', 'CIP 2020')
		,('52.18', 'General Sales, Merchandising and Related Marketing Operations.', 'CIP2020', 'CIP 2020')
		,('52.1801', 'Sales, Distribution, and Marketing Operations, General.', 'CIP2020', 'CIP 2020')
		,('52.1802', 'Merchandising and Buying Operations.', 'CIP2020', 'CIP 2020')
		,('52.1803', 'Retailing and Retail Operations.', 'CIP2020', 'CIP 2020')
		,('52.1804', 'Selling Skills and Sales Operations.', 'CIP2020', 'CIP 2020')
		,('52.1880', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('52.1899', 'General Merchandising, Sales, and Related Marketing Operations, Other.', 'CIP2020', 'CIP 2020')
		,('52.19', 'Specialized Sales, Merchandising and  Marketing Operations.', 'CIP2020', 'CIP 2020')
		,('52.1901', 'Auctioneering.', 'CIP2020', 'CIP 2020')
		,('52.1902', 'Fashion Merchandising.', 'CIP2020', 'CIP 2020')
		,('52.1903', 'Fashion Modeling.', 'CIP2020', 'CIP 2020')
		,('52.1904', 'Apparel and Accessories Marketing Operations.', 'CIP2020', 'CIP 2020')
		,('52.1905', 'Tourism and Travel Services Marketing Operations.', 'CIP2020', 'CIP 2020')
		,('52.1906', 'Tourism Promotion Operations.', 'CIP2020', 'CIP 2020')
		,('52.1907', 'Vehicle and Vehicle Parts and Accessories Marketing Operations.', 'CIP2020', 'CIP 2020')
		,('52.1908', 'Business and Personal/Financial Services Marketing Operations.', 'CIP2020', 'CIP 2020')
		,('52.1909', 'Special Products Marketing Operations.', 'CIP2020', 'CIP 2020')
		,('52.1910', 'Hospitality and Recreation Marketing Operations.', 'CIP2020', 'CIP 2020')
		,('52.1980', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('52.1999', 'Specialized Merchandising, Sales, and Marketing Operations, Other.', 'CIP2020', 'CIP 2020')
		,('52.20', 'Construction Management.', 'CIP2020', 'CIP 2020')
		,('52.2001', 'Construction Management, General.', 'CIP2020', 'CIP 2020')
		,('52.2002', 'Construction Project Management.', 'CIP2020', 'CIP 2020')
		,('52.2099', 'Construction Management, Other.', 'CIP2020', 'CIP 2020')
		,('52.21', 'Telecommunications Management.', 'CIP2020', 'CIP 2020')
		,('52.2101', 'Telecommunications Management.', 'CIP2020', 'CIP 2020')
		,('52.99', 'Business, Management, Marketing, and Related Support Services, Other.', 'CIP2020', 'CIP 2020')
		,('52.9999', 'Business, Management, Marketing, and Related Support Services, Other.', 'CIP2020', 'CIP 2020')
		,('53', 'HIGH SCHOOL/SECONDARY DIPLOMAS AND CERTIFICATES.', 'CIP2020', 'CIP 2020')
		,('53.01', 'High School/Secondary Diploma Programs.', 'CIP2020', 'CIP 2020')
		,('53.0101', 'Regular/General High School/Secondary Diploma Program.', 'CIP2020', 'CIP 2020')
		,('53.0102', 'College/University Preparatory and Advanced High School/Secondary Diploma Program.', 'CIP2020', 'CIP 2020')
		,('53.0103', 'Vocational High School and Secondary Business/Vocational-Industrial/Occupational Diploma Program.', 'CIP2020', 'CIP 2020')
		,('53.0104', 'Honors/Regents High School/Secondary Diploma Program.', 'CIP2020', 'CIP 2020')
		,('53.0105', 'Adult High School/Secondary Diploma Program.', 'CIP2020', 'CIP 2020')
		,('53.0199', 'High School/Secondary Diploma Programs, Other.', 'CIP2020', 'CIP 2020')
		,('53.02', 'High School/Secondary Certificate Programs.', 'CIP2020', 'CIP 2020')
		,('53.0201', 'High School Equivalence Certificate Program.', 'CIP2020', 'CIP 2020')
		,('53.0202', 'High School Certificate of Competence Program.', 'CIP2020', 'CIP 2020')
		,('53.0203', 'Certificate of IEP Completion Program.', 'CIP2020', 'CIP 2020')
		,('53.0299', 'High School/Secondary Certificates, Other.', 'CIP2020', 'CIP 2020')
		,('54', 'HISTORY.', 'CIP2020', 'CIP 2020')
		,('54.01', 'History.', 'CIP2020', 'CIP 2020')
		,('54.0101', 'History, General.', 'CIP2020', 'CIP 2020')
		,('54.0102', 'American  History (United States).', 'CIP2020', 'CIP 2020')
		,('54.0103', 'European History.', 'CIP2020', 'CIP 2020')
		,('54.0104', 'History and Philosophy of Science and Technology.', 'CIP2020', 'CIP 2020')
		,('54.0105', 'Public/Applied History.', 'CIP2020', 'CIP 2020')
		,('54.0106', 'Asian History.', 'CIP2020', 'CIP 2020')
		,('54.0107', 'Canadian History.', 'CIP2020', 'CIP 2020')
		,('54.0108', 'Military History.', 'CIP2020', 'CIP 2020')
		,('54.0199', 'History, Other.', 'CIP2020', 'CIP 2020')
		,('55', 'RESERVED.', 'CIP2020', 'CIP 2020')
		,('55.01', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('55.0101', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('55.13', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('55.1301', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('55.1302', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('55.1303', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('55.1304', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('55.1399', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('55.14', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('55.1401', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('55.1403', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('55.1404', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('55.1405', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('55.1499', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('55.99', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('55.9999', 'Reserved.', 'CIP2020', 'CIP 2020')
		,('60', 'HEALTH PROFESSIONS RESIDENCY/FELLOWSHIP PROGRAMS.', 'CIP2020', 'CIP 2020')
		,('60.01', 'Dental Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('60.0101', 'Oral and Maxillofacial Surgery Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0102', 'Dental Public Health Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0103', 'Endodontics Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0104', 'Oral and Maxillofacial Pathology Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0105', 'Orthodontics Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0106', 'Pediatric Dentistry Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0107', 'Periodontology Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0108', 'Prosthodontics Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0109', 'Oral and Maxillofacial Radiology Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0110', 'Implantology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0199', 'Dental Residency/Fellowship Program, Other.', 'CIP2020', 'CIP 2020')
		,('60.03', 'Veterinary Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('60.0301', 'Veterinary Anesthesiology Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0302', 'Veterinary Dentistry Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0303', 'Veterinary Dermatology Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0304', 'Veterinary Emergency and Critical Care Medicine Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0305', 'Veterinary Internal Medicine Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0306', 'Laboratory Animal Medicine Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0307', 'Veterinary Microbiology Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0308', 'Veterinary Nutrition Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0309', 'Veterinary Ophthalmology Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0310', 'Veterinary Pathology Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0311', 'Veterinary Practice Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0312', 'Veterinary Preventive Medicine Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0313', 'Veterinary Radiology Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0314', 'Veterinary Surgery Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0315', 'Theriogenology Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0316', 'Veterinary Toxicology Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0317', 'Zoological Medicine Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0318', 'Poultry Veterinarian Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0319', 'Veterinary Behaviorist Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0320', 'Veterinary Clinical Pharmacology Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0399', 'Veterinary Residency/Fellowship Program, Other.', 'CIP2020', 'CIP 2020')
		,('60.04', 'Deleted, report under 61', 'CIP2020', 'CIP 2020')
		,('61.2302', 'Aerospace Medicine Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.0301', 'Allergy and Immunology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0401', 'Anesthesiology Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.1102', 'Child Neurology Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.0901', 'Clinical Biochemical Genetics Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0406', 'Deleted, report under 61.0903', 'CIP2020', 'CIP 2020')
		,('61.0902', 'Clinical Genetics and Genomics Residency Program.', 'CIP2020', 'CIP 2020')
		,('60.0408', 'Deleted, report under 61.0903', 'CIP2020', 'CIP 2020')
		,('61.2702', 'Colon and Rectal Surgery Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.0501', 'Dermatology Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.2601', 'Diagnostic Radiology Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.0601', 'Emergency Medicine Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.0701', 'Family Medicine Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.2701', 'General Surgery Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.0801', 'Internal Medicine Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.1001', 'Neurological Surgery Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.1101', 'Neurology Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.1201', 'Nuclear Medicine Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.1301', 'Obstetrics and Gynecology Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.2303', 'Occupational Medicine Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.1401', 'Ophthalmology Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.1501', 'Orthopedic Surgery Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.1701', 'Otolaryngology Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.1801', 'Combined Anatomic and Clinical Pathology Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.1901', 'Pediatrics Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.2001', 'Physical Medicine and Rehabilitation Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.2101', 'Plastic Surgery Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.2401', 'Psychiatry Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.2301', 'Public Health and General Preventive Medicine Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.2501', 'Radiation Oncology Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.2610', 'Radiologic Physics Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.2707', 'Thoracic Surgery Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2801', 'Urology Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.2708', 'Vascular Surgery Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0499', 'Deleted, report under 61', 'CIP2020', 'CIP 2020')
		,('60.05', 'Deleted, report under 61', 'CIP2020', 'CIP 2020')
		,('61.2402', 'Addiction Psychiatry Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1902', 'Adolescent Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1804', 'Blood Banking/Transfusion Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0804', 'Cardiovascular Disease Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1805', 'Chemical Pathology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1903', 'Child Abuse Pediatrics Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2403', 'Child and Adolescent Psychiatry Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0805', 'Clinical Cardiac Electrophysiology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1103', 'Clinical Neurophysiology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2704', 'Congenital Cardiac Surgery Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0202', 'Critical Care Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1806', 'Cytopathology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0502', 'Dermatopathology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1904', 'Developmental-Behavioral Pediatrics Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2604', 'Diagnostic Radiologic Physics Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.0806', 'Endocrinology, Diabetes, and Metabolism Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1807', 'Forensic Pathology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2405', 'Forensic Psychiatry Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0807', 'Gastroenterology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0203', 'Geriatric Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2406', 'Geriatric Psychiatry Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1302', 'Gynecologic Oncology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1808', 'Hematological Pathology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0808', 'Hematology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0205', 'Hospice and Palliative Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1809', 'Immunopathology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0810', 'Infectious Disease Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0811', 'Interventional Cardiology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1810', 'Laboratory Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1303', 'Maternal and Fetal Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0904', 'Medical Biochemical Genetics Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.1811', 'Medical Microbiology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2605', 'Medical Nuclear Physics Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.0813', 'Medical Oncology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0208', 'Medical Toxicology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1812', 'Molecular Genetic Pathology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1502', 'Musculoskeletal Oncology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1905', 'Neonatal-Perinatal Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0812', 'Nephrology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1106', 'Neurodevelopmental Disabilities Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0209', 'Neuromuscular Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1813', 'Neuropathology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2607', 'Neuroradiology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1702', 'Neurotology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2608', 'Nuclear Radiology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1503', 'Orthopedic Sports Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1504', 'Orthopedic Surgery of the Spine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0210', 'Pain Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1906', 'Pediatric Cardiology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1907', 'Pediatric Critical Care Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0503', 'Pediatric Dermatology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1908', 'Pediatric Emergency Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1909', 'Pediatric Endocrinology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1910', 'Pediatric Gastroenterology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1911', 'Pediatric Hematology-Oncology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1912', 'Pediatric Infectious Diseases Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1913', 'Pediatric Nephrology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1505', 'Pediatric Orthopedics Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1703', 'Pediatric Otolaryngology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1814', 'Pediatric Pathology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1914', 'Pediatric Pulmonology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2609', 'Pediatric Radiology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2003', 'Pediatric Rehabilitation Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1915', 'Pediatric Rheumatology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2705', 'Pediatric Surgery Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1917', 'Pediatric Transplant Hepatology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2802', 'Pediatric Urology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0568', 'Deleted, report under 61.0199', 'CIP2020', 'CIP 2020')
		,('61.2103', 'Plastic Surgery Within the Head and Neck Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2404', 'Consultation-Liaison Psychiatry Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0814', 'Pulmonary Disease Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1815', 'Radioisotopic Pathology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1304', 'Reproductive Endocrinology/Infertility Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0816', 'Rheumatology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0212', 'Sleep Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2002', 'Spinal Cord Injury Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0213', 'Sports Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0214', 'Surgery of the Hand Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2706', 'Surgical Critical Care Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2611', 'Therapeutic Radiologic Physics Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.0818', 'Transplant Hepatology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0216', 'Undersea and Hyperbaric Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2612', 'Vascular and Interventional Radiology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1107', 'Vascular Neurology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0599', 'Deleted, report under 61', 'CIP2020', 'CIP 2020')
		,('61.22', 'Podiatric Medicine Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('60.0601', 'Deleted, report under 61.2201', 'CIP2020', 'CIP 2020')
		,('60.0602', 'Deleted, report under 61.2201', 'CIP2020', 'CIP 2020')
		,('60.07', 'Nurse Practitioner Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('60.0701', 'Nurse Practitioner Residency/Fellowship Program, General.', 'CIP2020', 'CIP 2020')
		,('60.0702', 'Combined Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0703', 'Acute Care Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0704', 'Adult/Gerontology Acute Care Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0705', 'Adult/Gerontology Critical Care Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0706', 'Cardiology/Cardiovascular Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0707', 'Clinical Informatics Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0708', 'Dermatology Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0709', 'Developmental and Behavioral Pediatrics Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0710', 'Diabetes Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0711', 'Emergency Medicine Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0712', 'Endocrinology Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0713', 'Family Medicine Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0714', 'Gastroenterology and Hepatology Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0715', 'Gastroenterology Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0716', 'Genetics Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0717', 'Gerontology Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0718', 'Global Health Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0719', 'Hematology-Oncology Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0720', 'Hepatology Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0721', 'Home-Based Primary Care Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0722', 'Hospice and Palliative Medicine Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0723', 'Hospital Medicine Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0724', 'Infectious Diseases Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0725', 'Neonatal Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0726', 'Nephrology Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0727', 'Neurology Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0728', 'Neuroscience Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0729', 'Obstetrics and Gynecology Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0730', 'Occupational Health Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0731', 'Orthopedic Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0732', 'Orthopedic Surgery Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0733', 'Pain Management Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0734', 'Palliative Care Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0735', 'Pediatric Hematology-Oncology Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0736', 'Pediatric Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0737', 'Pediatric Rehabilitation Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0738', 'Psychiatric/Mental Health Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0739', 'Public/Community Health Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0740', 'Pulmonary Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0741', 'Rheumatology Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0742', 'Rural Health Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0743', 'Sleep Medicine Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0744', 'Surgical and Critical Care Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0745', 'Surgical Wound and Reconstruction Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0746', 'Transplantation Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0747', 'Trauma and Critical Care Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0748', 'Urgent Care Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0749', 'Urology Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0750', 'Women&#39;s Health Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0751', 'Wound Care Nurse Practitioner Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0799', 'Nurse Practitioner Residency/Fellowship Program, Other.', 'CIP2020', 'CIP 2020')
		,('60.08', 'Pharmacy Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('60.0801', 'Pharmacy Residency/Fellowship Program, General.', 'CIP2020', 'CIP 2020')
		,('60.0802', 'Combined Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0803', 'Ambulatory Care Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0804', 'Cardiology Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0805', 'Clinical Pharmacogenomics Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0806', 'Community/Community-Based Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0807', 'Corporate Pharmacy Leadership Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0808', 'Critical Care Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0809', 'Drug Information Pharmacy Residency/Fellowship Program', 'CIP2020', 'CIP 2020')
		,('60.0810', 'Emergency Medicine Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0811', 'Family Medicine Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0812', 'Geriatric Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0813', 'Health System Medication Management Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0814', 'Health System Pharmacy Administration and Leadership Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0815', 'Infectious Diseases Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0816', 'Internal Medicine Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0817', 'Investigational Drugs and Research Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0818', 'Managed Care Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0819', 'Medication Systems and Operations Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0820', 'Medication-Use Safety Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0821', 'Neonatal Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0822', 'Nephrology Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0823', 'Neurology Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0824', 'Nuclear Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0825', 'Nutrition Support Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0826', 'Oncology Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0827', 'Palliative Care/Pain Management Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0828', 'Pediatric Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0829', 'Pharmacotherapy Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0830', 'Pharmacy Informatics Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0831', 'Psychiatric Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0832', 'Transplantation Pharmacy Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0899', 'Pharmacy Residency Programs, Other.', 'CIP2020', 'CIP 2020')
		,('60.09', 'Physician Assistant Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('60.0901', 'Physician Assistant Residency/Fellowship Program, General.', 'CIP2020', 'CIP 2020')
		,('60.0902', 'Combined Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0903', 'Acute Care Medicine Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0904', 'Acute Care Surgery Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0905', 'Cardiology Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0906', 'Cardiothoracic Surgery Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0907', 'Critical Care Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0908', 'Critical Care and Trauma Surgery Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0909', 'Emergency Medicine Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0910', 'ENT Surgery Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0911', 'Family Medicine Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0912', 'Geriatrics Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0913', 'Hematology-Oncology Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0914', 'Hepatobiliary Surgery Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0915', 'Hospitalist Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0916', 'Neurosurgery Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0917', 'Orthopedic Surgery Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0918', 'Pediatric Surgery Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0919', 'Transplant Surgery Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0920', 'Urology Physician Assistant Residency/Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('60.0999', 'Physician Assistant Residency/Fellowship Program, Other.', 'CIP2020', 'CIP 2020')
		,('60.99', 'Health Professions Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('60.9999', 'Health Professions Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61', 'MEDICAL RESIDENCY/FELLOWSHIP PROGRAMS.', 'CIP2020', 'CIP 2020')
		,('61.01', 'Combined Medical Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.0101', 'Combined Medical Residency/Fellowship Program, General.', 'CIP2020', 'CIP 2020')
		,('61.0102', 'Diagnostic Radiology/Nuclear Medicine Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0103', 'Emergency Medicine/Anesthesiology Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0104', 'Family Medicine/Emergency Medicine Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0105', 'Family Medicine/Osteopathic Neuromusculoskeletal Medicine Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0106', 'Family Medicine/Preventive Medicine Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0107', 'Family Medicine/Psychiatry Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0108', 'Internal Medicine/Anesthesiology Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0109', 'Internal Medicine/Dermatology Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0110', 'Internal Medicine/Emergency Medicine Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0111', 'Internal Medicine/Emergency Medicine/Critical Care Medicine Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0112', 'Internal Medicine/Family Medicine Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0113', 'Internal Medicine/Medical Genetics and Genomics Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0114', 'Internal Medicine/Neurology Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0115', 'Internal Medicine/Pediatrics Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0116', 'Internal Medicine/Preventive Medicine Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0117', 'Internal Medicine/Psychiatry Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0118', 'Medical Genetics and Genomics/Maternal-Fetal Medicine Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0119', 'Pediatrics/Anesthesiology Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0120', 'Pediatrics/Emergency Medicine Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0121', 'Pediatrics/Medical Genetics and Genomics Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0122', 'Pediatrics/Physical Medicine &amp; Rehabilitation Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0123', 'Pediatrics/Psychology/Child-Adolescent Psychology Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0124', 'Psychiatry/Neurology Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0125', 'Reproductive Endocrinology and Infertility/Medical Genetics and Genomics Combined Specialty Program.', 'CIP2020', 'CIP 2020')
		,('61.0199', 'Combined Medical Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.02', 'Multiple-Pathway Medical Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.0204', 'Health Policy Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0206', 'Integrative Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0207', 'Medical Education Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0211', 'Simulation Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0215', 'Telemedicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0217', 'Wilderness Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0218', 'Women&#39;s Health Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0299', 'Multiple-Pathway Medical Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.03', 'Allergy and Immunology Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.0399', 'Allergy and Immunology Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.04', 'Anesthesiology Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.0499', 'Anesthesiology Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.05', 'Dermatology Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.0599', 'Dermatology Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.06', 'Emergency Medicine Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.0602', 'Disaster Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0603', 'Emergency Medical Services Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0699', 'Emergency Medicine Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.07', 'Family Medicine Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.0799', 'Family Medicine Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.08', 'Internal Medicine Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.0809', 'Hematology-Oncology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.0899', 'Internal Medicine Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.09', 'Medical Genetics and Genomics Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.0903', 'Laboratory Genetics and Genomics Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.0999', 'Medical Genetics and Genomics Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.10', 'Neurological Surgery Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.1099', 'Neurological Surgery Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.11', 'Neurology Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.1104', 'Epilepsy Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1105', 'Headache Medicine Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.1199', 'Neurology Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.12', 'Nuclear Medicine Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.1299', 'Nuclear Medicine Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.13', 'Obstetrics and Gynecology Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.1399', 'Obstetrics and Gynecology Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.14', 'Ophthalmology Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.1499', 'Ophthalmology Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.15', 'Orthopedic Surgery Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.1599', 'Orthopedic Surgery Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.16', 'Osteopathic Medicine Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.1601', 'Osteopathic Neuromusculoskeletal Medicine Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.1699', 'Osteopathic Medicine Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.17', 'Otolaryngology Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.1799', 'Otolaryngology Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.18', 'Pathology Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.1802', 'Anatomic Pathology Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.1803', 'Clinical Pathology Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.1899', 'Pathology Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.19', 'Pediatrics Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.1999', 'Pediatrics Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.20', 'Physical Medicine and Rehabilitation Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.2099', 'Physical Medicine and Rehabilitation Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.21', 'Plastic Surgery Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.2102', 'Integrated Plastic Surgery Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.2199', 'Plastic Surgery Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.2201', 'Podiatric Medicine and Surgery Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.2299', 'Podiatric Medicine Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.23', 'Preventive Medicine Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.2399', 'Preventive Medicine Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.24', 'Psychiatry Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.2499', 'Psychiatry Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.25', 'Radiation Oncology Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.2599', 'Radiation Oncology Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.26', 'Radiology Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.2602', 'Integrated Interventional Radiology Residency Program.', 'CIP2020', 'CIP 2020')
		,('61.2603', 'Abdominal Radiology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2606', 'Musculoskeletal Radiology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2699', 'Radiology Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.27', 'Surgery Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.2703', 'Complex General Surgical Oncology Fellowship Program.', 'CIP2020', 'CIP 2020')
		,('61.2799', 'Surgery Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.28', 'Urology Residency/Fellowship Programs.', 'CIP2020', 'CIP 2020')
		,('61.2899', 'Urology Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.99', 'Medical Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')
		,('61.9999', 'Medical Residency/Fellowship Programs, Other.', 'CIP2020', 'CIP 2020')

	IF OBJECT_ID('tempdb..#CipUse') IS NOT NULL
		DROP TABLE #CipUse

	CREATE TABLE #CipUse (CipUseCode VARCHAR(50), CipUseDescription VARCHAR(200))

	INSERT INTO #CipUse VALUES ('MISSING', 'MISSING')
	INSERT INTO #CipUse
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CipUse'



	INSERT INTO rds.DimCipCodes(
			 CipCode
			,CipDescription
			,CipUseCode
			,CipUseDescription
			,CipVersionCode
			,CipVersionDescription
			)
	SELECT 
			 a.CipCode
			,a.CipDescription
			,b.CipUseCode
			,b.CipUseDescription
			,a.CipVersionCode
			,a.CipVersionDescription
	FROM #CipCodeAndVersion a
	CROSS JOIN #CipUse b
	LEFT JOIN RDS.DimCipCodes main
		ON	a.CipCode = main.CipCode								
		AND b.CipUseCode = main.CipUseCode			
	WHERE main.DimCipCodeId IS NULL

	DROP TABLE #CipCodeAndVersion
	DROP TABLE #CipUse


	PRINT 'Populate DimCohortExclusions'
	------------------------------------------------
	-- Populate DimCohortExclusions		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimCohortExclusions d WHERE d.CohortExclusionCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimCohortExclusions ON

		INSERT INTO RDS.DimCohortExclusions (DimCohortExclusionId, CohortExclusionCode, CohortExclusionDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimCohortExclusions OFF
	END

	INSERT INTO RDS.DimCohortExclusions
		(
			  CohortExclusionCode
			, CohortExclusionDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimCohortExclusions main
		ON ceds.CedsOptionSetCode = main.CohortExclusionCode
	WHERE main.DimCohortExclusionId IS NULL
		AND ceds.CedsElementTechnicalName = 'CohortExclusion'



	PRINT 'Populate DimCohortStatuses'
	------------------------------------------------
	-- Populate DimCohortStatuses		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimCohortStatuses d WHERE d.EdFactsCohortGraduationStatusCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimCohortStatuses ON

		INSERT INTO RDS.DimCohortStatuses (DimCohortStatusId, EdFactsCohortGraduationStatusCode, EdFactsCohortGraduationStatusDescription, EdFactsCohortGraduationStatusEdFactsCode)
			VALUES (-1, 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimCohortStatuses OFF
	END

	INSERT INTO RDS.DimCohortStatuses
		(
			  EdFactsCohortGraduationStatusCode
			, EdFactsCohortGraduationStatusDescription
			, EdFactsCohortGraduationStatusEdFactsCode
		)

	--Remove when added to V14
	VALUES
		('COHYES', 'Graduated with a regular high school diploma within the allowable time', 'COHYES')
		,('COHALTDPL', 'Graduated with a State-defined alternate high school diploma within the allowable time', 'COHALTDPL')
		,('COHNO', 'Did not graduate with a regular or State-defined alternate high school diploma within the allowable time', 'COHNO')
		,('COHREM', 'Has not graduated with a state-defined alternate high school diploma and removed from the cohort as allowed', 'COHREM')
	
	--Uncomment when added to V14
	--SELECT 
	--	  ceds.CedsOptionSetCode
	--	, ceds.CedsOptionSetDescription
	--FROM [CEDS].CedsOptionSetMapping ceds
	--LEFT JOIN RDS.DimCohortStatuses main
	--	ON ceds.CedsOptionSetCode = main.EdFactsCohortGraduationStatusCode
	--WHERE main.DimCohortExclusionId IS NULL
	--	AND ceds.CedsElementTechnicalName = 'EdFactsCohortGraduationStatus'


	PRINT 'Populate DimCourseGradePointAverageIndicators'
	------------------------------------------------
	-- Populate DimCourseGradePointAverageIndicators		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimCourseGradePointAverageIndicators d WHERE d.CourseGradePointAverageApplicabilityCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimCourseGradePointAverageIndicators ON

		INSERT INTO RDS.DimCourseGradePointAverageIndicators (DimCourseGradePointAverageIndicatorId, CourseGradePointAverageApplicabilityCode, CourseGradePointAverageApplicabilityDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimCourseGradePointAverageIndicators OFF
	END

	INSERT INTO RDS.DimCourseGradePointAverageIndicators
		(
			  CourseGradePointAverageApplicabilityCode
			, CourseGradePointAverageApplicabilityDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimCourseGradePointAverageIndicators main
		ON ceds.CedsOptionSetCode = main.CourseGradePointAverageApplicabilityCode
	WHERE main.DimCourseGradePointAverageIndicatorId IS NULL
		AND ceds.CedsElementTechnicalName = 'CourseGPAApplicability'


	PRINT 'Populate DimDataMigrationTypes'
	------------------------------------------------
	-- Populate DimDataMigrationTypes		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimDataMigrationTypes d WHERE d.DataMigrationTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimDataMigrationTypes ON

		INSERT INTO RDS.DimDataMigrationTypes (DimDataMigrationTypeId, DataMigrationTypeCode, DataMigrationTypeName)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimDataMigrationTypes OFF
	END

	INSERT INTO RDS.DimDataMigrationTypes
		(
			  DataMigrationTypeCode
			, DataMigrationTypeName		
		)
	VALUES
		('ods', 'Operational Data Store')
		,('rds', 'Reporting Data Store')
		,('report', 'Report Warehouse')


	PRINT 'Populate DimDisciplineReasons'
	------------------------------------------------
	-- Populate DimDisciplineReasons		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimDisciplineReasons d WHERE d.DisciplineReasonCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimDisciplineReasons ON

		INSERT INTO RDS.DimDisciplineReasons (DimDisciplineReasonId, DisciplineReasonCode, DisciplineReasonDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimDisciplineReasons OFF
	END

	INSERT INTO RDS.DimDisciplineReasons
		(
			  DisciplineReasonCode
			, DisciplineReasonDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimDisciplineReasons main
		ON ceds.CedsOptionSetCode = main.DisciplineReasonCode
	WHERE main.DimDisciplineReasonId IS NULL
		AND ceds.CedsElementTechnicalName = 'DisciplineReason'

	PRINT 'Populate DimEarlyChildhoolOrganizationStatuses'
	---------------------------------------------------
	-- Populate DimEarlyChildhoolOrganizationStatuses ---
	---------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimEarlyChildhoolOrganizationStatuses d WHERE d.DimEarlyChildhoodOrganizationStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimEarlyChildhoolOrganizationStatuses ON

		INSERT INTO [RDS].DimEarlyChildhoolOrganizationStatuses
           (DimEarlyChildhoodOrganizationStatusId
		   ,EarlyChildhoodProgramEnrollmentTypeCode
		   ,EarlyChildhoodProgramEnrollmentTypeDescription
		   ,EarlyLearningOtherFederalFundingSourcesCode
		   ,EarlyLearningOtherFederalFundingSourcesDescription)
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimEarlyChildhoolOrganizationStatuses OFF
	END


	CREATE TABLE #EarlyChildhoodProgramEnrollmentType (EarlyChildhoodProgramEnrollmentTypeCode VARCHAR(50), EarlyChildhoodProgramEnrollmentTypeDescription VARCHAR(200))

	INSERT INTO #EarlyChildhoodProgramEnrollmentType VALUES ('MISSING', 'MISSING')

	INSERT INTO #EarlyChildhoodProgramEnrollmentType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EarlyChildhoodProgramEnrollmentType'


	CREATE TABLE #EarlyLearningOtherFederalFundingSources (EarlyLearningOtherFederalFundingSourcesCode VARCHAR(50), EarlyLearningOtherFederalFundingSourcesDescription VARCHAR(200))

	INSERT INTO #EarlyLearningOtherFederalFundingSources VALUES ('MISSING', 'MISSING')
	INSERT INTO #EarlyLearningOtherFederalFundingSources
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EarlyLearningOtherFederalFundingSources'


	INSERT INTO RDS.DimEarlyChildhoolOrganizationStatuses
		  (EarlyChildhoodProgramEnrollmentTypeCode
		   ,EarlyChildhoodProgramEnrollmentTypeDescription
		   ,EarlyLearningOtherFederalFundingSourcesCode
		   ,EarlyLearningOtherFederalFundingSourcesDescription)
	SELECT DISTINCT
		  a.EarlyChildhoodProgramEnrollmentTypeCode
		, a.EarlyChildhoodProgramEnrollmentTypeDescription
		, b.EarlyLearningOtherFederalFundingSourcesCode
		, b.EarlyLearningOtherFederalFundingSourcesDescription
	FROM #EarlyChildhoodProgramEnrollmentType a
	CROSS JOIN #EarlyLearningOtherFederalFundingSources b
	LEFT JOIN RDS.DimEarlyChildhoolOrganizationStatuses main
		ON a.EarlyChildhoodProgramEnrollmentTypeCode = main.EarlyChildhoodProgramEnrollmentTypeCode
		AND b.EarlyLearningOtherFederalFundingSourcesCode = main.EarlyLearningOtherFederalFundingSourcesCode
	WHERE main.DimEarlyChildhoodOrganizationStatusId IS NULL

	DROP TABLE #EarlyChildhoodProgramEnrollmentType
	DROP TABLE #EarlyLearningOtherFederalFundingSources


	PRINT 'Populate DimFacilitySpaceStatuses'
	------------------------------------------------
	-- Populate DimFacilitySpaceStatuses		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimFacilitySpaceStatuses d WHERE d.FacilitySpaceUseTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimFacilitySpaceStatuses ON

		INSERT INTO RDS.DimFacilitySpaceStatuses (DimFacilitySpaceStatusId, FacilitySpaceUseTypeCode, FacilitySpaceUseTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimFacilitySpaceStatuses OFF
	END

	INSERT INTO RDS.DimFacilitySpaceStatuses
		(
			  FacilitySpaceUseTypeCode
			, FacilitySpaceUseTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimFacilitySpaceStatuses main
		ON ceds.CedsOptionSetCode = main.FacilitySpaceUseTypeCode
	WHERE main.DimFacilitySpaceStatusId IS NULL
		AND ceds.CedsElementTechnicalName = 'FacilitySpaceUseType'


	PRINT 'Populate DimFacilityStatuses'
	---------------------------------------------------
	-- Populate DimFacilityStatuses ---
	---------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimFacilityStatuses d WHERE d.DimFacilityStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimFacilityStatuses ON

		INSERT INTO [RDS].DimFacilityStatuses
           (DimFacilityStatusId
		   ,FacilityLeaseAmountCategoryCode
		   ,FacilityLeaseAmountCategoryDescription
		   ,FacilityLeaseTypeCode
		   ,FacilityLeaseTypeDescription
		   ,FacilityMortgageInterestTypeCode
		   ,FacilityMortgageInterestTypeDescription
		   ,FacilityMortgageTypeCode
		   ,FacilityMortgageTypeDescription)
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

		SET IDENTITY_INSERT RDS.DimFacilityStatuses OFF
	END


	CREATE TABLE #FacilityLeaseAmountCategory (FacilityLeaseAmountCategoryCode VARCHAR(50), FacilityLeaseAmountCategoryDescription VARCHAR(200))

	INSERT INTO #FacilityLeaseAmountCategory VALUES ('MISSING', 'MISSING')

	INSERT INTO #FacilityLeaseAmountCategory 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'FacilityLeaseAmountCategory'


	CREATE TABLE #FacilityLeaseType (FacilityLeaseTypeCode VARCHAR(50), FacilityLeaseTypeDescription VARCHAR(200))

	INSERT INTO #FacilityLeaseType VALUES ('MISSING', 'MISSING')
	INSERT INTO #FacilityLeaseType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'FacilityLeaseType'


	CREATE TABLE #FacilityMortgageInterestType (FacilityMortgageInterestTypeCode VARCHAR(50), FacilityMortgageInterestTypeDescription VARCHAR(200))

	INSERT INTO #FacilityMortgageInterestType VALUES ('MISSING', 'MISSING')
	INSERT INTO #FacilityMortgageInterestType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'FacilityMortgageInterestType'


	CREATE TABLE #FacilityMortgageType (FacilityMortgageTypeCode VARCHAR(50), FacilityMortgageTypeDescription VARCHAR(200))

	INSERT INTO #FacilityMortgageType VALUES ('MISSING', 'MISSING')
	INSERT INTO #FacilityMortgageType
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'FacilityMortgageType'

	INSERT INTO RDS.DimFacilityStatuses
		  (FacilityLeaseAmountCategoryCode
		   ,FacilityLeaseAmountCategoryDescription
		   ,FacilityLeaseTypeCode
		   ,FacilityLeaseTypeDescription
		   ,FacilityMortgageInterestTypeCode
		   ,FacilityMortgageInterestTypeDescription
		   ,FacilityMortgageTypeCode
		   ,FacilityMortgageTypeDescription)
	SELECT DISTINCT
		  a.FacilityLeaseAmountCategoryCode
		, a.FacilityLeaseAmountCategoryDescription
		, b.FacilityLeaseTypeCode
		, b.FacilityLeaseTypeDescription
		, c.FacilityMortgageInterestTypeCode
		, c.FacilityMortgageInterestTypeDescription
		, d.FacilityMortgageTypeCode
		, d.FacilityMortgageTypeDescription
	FROM #FacilityLeaseAmountCategory a
	CROSS JOIN #FacilityLeaseType b
	CROSS JOIN #FacilityMortgageInterestType c
	CROSS JOIN #FacilityMortgageType d
	LEFT JOIN RDS.DimFacilityStatuses main
		ON a.FacilityLeaseAmountCategoryCode = main.FacilityLeaseAmountCategoryCode
		AND b.FacilityLeaseTypeCode = main.FacilityLeaseTypeCode
		AND c.FacilityMortgageInterestTypeCode = main.FacilityMortgageInterestTypeCode
		AND d.FacilityMortgageTypeCode = main.FacilityMortgageTypeCode
	WHERE main.DimFacilityStatusId IS NULL

	DROP TABLE #FacilityLeaseAmountCategory
	DROP TABLE #FacilityLeaseType
	DROP TABLE #FacilityMortgageInterestType
	DROP TABLE #FacilityMortgageType


	PRINT 'Populate DimFacilityUtilization'
	------------------------------------------------
	-- Populate DimFacilityUtilization		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimFacilityUtilization d WHERE d.BuildingUseTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimFacilityUtilization ON

		INSERT INTO RDS.DimFacilityUtilization (DimFacilityUtilizationStatusId, BuildingUseTypeCode, BuildingUseTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimFacilityUtilization OFF
	END

	INSERT INTO RDS.DimFacilityUtilization
		(
			  BuildingUseTypeCode
			, BuildingUseTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimFacilityUtilization main
		ON ceds.CedsOptionSetCode = main.BuildingUseTypeCode
	WHERE main.DimFacilityUtilizationStatusId IS NULL
		AND ceds.CedsElementTechnicalName = 'BuildingUseType'


	PRINT 'Populate DimOrganizationTitleIStatuses'
	---------------------------------------------------
	-- Populate DimOrganizationTitleIStatuses ---
	---------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimOrganizationTitleIStatuses d WHERE d.DimOrganizationTitleIStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimOrganizationTitleIStatuses ON

		INSERT INTO [RDS].DimOrganizationTitleIStatuses
           (DimOrganizationTitleIStatusId
		   ,TitleIInstructionalServicesCode
		   ,TitleIInstructionalServicesDescription
		   ,TitleIInstructionalServicesEdFactsCode
		   ,TitleIProgramTypeCode
		   ,TitleIProgramTypeDescription
		   ,TitleIProgramTypeEdFactsCode
		   ,TitleISchoolStatusCode
		   ,TitleISchoolStatusDescription
		   ,TitleISchoolStatusEdFactsCode
		   ,TitleISupportServicesCode
		   ,TitleISupportServicesDescription
		   ,TitleISupportServicesEdFactsCode)
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

		SET IDENTITY_INSERT RDS.DimOrganizationTitleIStatuses OFF
	END

	IF OBJECT_ID('tempdb..#TitleIInstructionalServices') IS NOT NULL
		DROP TABLE #TitleIInstructionalServices

	CREATE TABLE #TitleIInstructionalServices (TitleIInstructionalServicesCode VARCHAR(50), TitleIInstructionalServicesDescription VARCHAR(200), TitleIInstructionalServicesEdFactsCode VARCHAR(50))

	INSERT INTO #TitleIInstructionalServices VALUES ('MISSING', 'MISSING', 'MISSING')

	INSERT INTO #TitleIInstructionalServices 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TitleIInstructionalServices'

	IF OBJECT_ID('tempdb..#TitleIProgramType') IS NOT NULL
		DROP TABLE #TitleIProgramType

	CREATE TABLE #TitleIProgramType (TitleIProgramTypeCode VARCHAR(50), TitleIProgramTypeDescription VARCHAR(200), TitleIProgramTypeEdFactsCode VARCHAR(50))

	INSERT INTO #TitleIProgramType VALUES ('MISSING', 'MISSING', 'MISSING')

	INSERT INTO #TitleIProgramType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TitleIProgramType'

	IF OBJECT_ID('tempdb..#TitleISchoolStatus') IS NOT NULL
		DROP TABLE #TitleISchoolStatus

	CREATE TABLE #TitleISchoolStatus (TitleISchoolStatusCode VARCHAR(50), TitleISchoolStatusDescription VARCHAR(200), TitleISchoolStatusEdFactsCode VARCHAR(50))

	INSERT INTO #TitleISchoolStatus VALUES ('MISSING', 'MISSING', 'MISSING')

	INSERT INTO #TitleISchoolStatus 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TitleISchoolStatus'

	IF OBJECT_ID('tempdb..#TitleISupportServices') IS NOT NULL
		DROP TABLE #TitleISupportServices

	CREATE TABLE #TitleISupportServices (TitleISupportServicesCode VARCHAR(50), TitleISupportServicesDescription VARCHAR(200), TitleISupportServicesEdFactsCode VARCHAR(50))

	INSERT INTO #TitleISupportServices VALUES ('MISSING', 'MISSING', 'MISSING')
	
	INSERT INTO #TitleISchoolStatus 	
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TitleISupportServices'

	   	  
		INSERT INTO [RDS].DimOrganizationTitleIStatuses
           (TitleIInstructionalServicesCode
		   ,TitleIInstructionalServicesDescription
		   ,TitleIInstructionalServicesEdFactsCode
		   ,TitleIProgramTypeCode
		   ,TitleIProgramTypeDescription
		   ,TitleIProgramTypeEdFactsCode
		   ,TitleISchoolStatusCode
		   ,TitleISchoolStatusDescription
		   ,TitleISchoolStatusEdFactsCode
		   ,TitleISupportServicesCode
		   ,TitleISupportServicesDescription
		   ,TitleISupportServicesEdFactsCode)
	SELECT DISTINCT
		  a.TitleIInstructionalServicesCode
		, a.TitleIInstructionalServicesDescription
		, a.TitleIInstructionalServicesEdFactsCode
		, b.TitleIProgramTypeCode
		, b.TitleIProgramTypeDescription
		, b.TitleIProgramTypeEdFactsCode
		, c.TitleISchoolStatusCode
		, c.TitleISchoolStatusDescription
		, c.TitleISchoolStatusEdFactsCode
		, d.TitleISupportServicesCode
		, d.TitleISupportServicesDescription
		, d.TitleISupportServicesEdFactsCode
	FROM #TitleIInstructionalServices a
	CROSS JOIN #TitleIProgramType b
	CROSS JOIN #TitleISchoolStatus c
	CROSS JOIN #TitleISupportServices d
	LEFT JOIN RDS.DimOrganizationTitleIStatuses main
		ON a.TitleIInstructionalServicesCode = main.TitleIInstructionalServicesCode
		AND b.TitleIProgramTypeCode = main.TitleIProgramTypeCode
		AND c.TitleISchoolStatusCode = main.TitleISchoolStatusCode
		AND d.TitleISupportServicesCode = main.TitleISupportServicesCode
	WHERE main.DimOrganizationTitleIStatusId IS NULL

	DROP TABLE #TitleIInstructionalServices
	DROP TABLE #TitleIProgramType
	DROP TABLE #TitleISchoolStatus
	DROP TABLE #TitleISupportServices


	PRINT 'Populate DimPsCitizenshipStatuses'
	---------------------------------------------------
	-- Populate DimPsCitizenshipStatuses ---
	---------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimPsCitizenshipStatuses d WHERE d.DimPsCitizenshipStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimPsCitizenshipStatuses ON

		INSERT INTO [RDS].DimPsCitizenshipStatuses
           (DimPsCitizenshipStatusId
		   ,UnitedStatesCitizenshipStatusCode
		   ,UnitedStatesCitizenshipStatusDescription
		   ,VisaTypeCode
		   ,VisaTypeDescription)
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimPsCitizenshipStatuses OFF
	END


	IF OBJECT_ID('tempdb..#UnitedStatesCitizenshipStatus') IS NOT NULL
		DROP TABLE #UnitedStatesCitizenshipStatus

	CREATE TABLE #UnitedStatesCitizenshipStatus (UnitedStatesCitizenshipStatusCode VARCHAR(50), UnitedStatesCitizenshipStatusDescription VARCHAR(200))

	INSERT INTO #UnitedStatesCitizenshipStatus VALUES ('MISSING', 'MISSING')
	
	INSERT INTO #UnitedStatesCitizenshipStatus 	
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'UnitedStatesCitizenshipStatus'


	IF OBJECT_ID('tempdb..#VisaType') IS NOT NULL
		DROP TABLE #VisaType

	CREATE TABLE #VisaType (VisaTypeCode VARCHAR(50), VisaTypeDescription VARCHAR(200))

	INSERT INTO #VisaType VALUES ('MISSING', 'MISSING')
	
	INSERT INTO #VisaType 	
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'VisaType'

	   	  
		INSERT INTO [RDS].DimPsCitizenshipStatuses
           (UnitedStatesCitizenshipStatusCode
		   ,UnitedStatesCitizenshipStatusDescription
		   ,VisaTypeCode
		   ,VisaTypeDescription)
	SELECT DISTINCT
		  a.UnitedStatesCitizenshipStatusCode
		, a.UnitedStatesCitizenshipStatusDescription
		, b.VisaTypeCode
		, b.VisaTypeDescription
	FROM #UnitedStatesCitizenshipStatus a
	CROSS JOIN #VisaType b
	LEFT JOIN RDS.DimPsCitizenshipStatuses main
		ON a.UnitedStatesCitizenshipStatusCode = main.UnitedStatesCitizenshipStatusCode
		AND b.VisaTypeCode = main.VisaTypeCode
	WHERE main.DimPsCitizenshipStatusId IS NULL

	DROP TABLE #UnitedStatesCitizenshipStatus
	DROP TABLE #VisaType


	PRINT 'Populate DimPsCourseStatuses'
	---------------------------------------------------
	-- Populate DimPsCourseStatuses ---
	---------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimPsCourseStatuses d WHERE d.DimPsCourseStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimPsCourseStatuses ON

		INSERT INTO [RDS].DimPsCourseStatuses
           (DimPsCourseStatusId
		   ,CourseLevelTypeCode
		   ,CourseLevelTypeDescription
		   ,CourseHonorsTypeCode
		   ,CourseHonorsTypeDescription
		   ,CourseCreditBasisTypeCode
		   ,CourseCreditBasisTypeDescription
		   ,CourseCreditLevelTypeCode
		   ,CourseCreditLevelTypeDescription)
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

		SET IDENTITY_INSERT RDS.DimPsCourseStatuses OFF
	END


	IF OBJECT_ID('tempdb..#CourseLevelType') IS NOT NULL
		DROP TABLE #CourseLevelType

	CREATE TABLE #CourseLevelType (CourseLevelTypeCode VARCHAR(50), CourseLevelTypeDescription VARCHAR(200))

	INSERT INTO #CourseLevelType VALUES ('MISSING', 'MISSING')
	
	INSERT INTO #CourseLevelType 	
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CourseLevelType'

	IF OBJECT_ID('tempdb..#CourseHonorsType') IS NOT NULL
		DROP TABLE #CourseHonorsType

	CREATE TABLE #CourseHonorsType (CourseHonorsTypeCode VARCHAR(50), CourseHonorsTypeDescription VARCHAR(200))

	INSERT INTO #CourseHonorsType VALUES ('MISSING', 'MISSING')
	
	INSERT INTO #CourseHonorsType 	
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CourseHonorsType'

	IF OBJECT_ID('tempdb..#CourseCreditBasisType') IS NOT NULL
		DROP TABLE #CourseCreditBasisType

	CREATE TABLE #CourseCreditBasisType (CourseCreditBasisTypeCode VARCHAR(50), CourseCreditBasisTypeDescription VARCHAR(200))

	INSERT INTO #CourseCreditBasisType VALUES ('MISSING', 'MISSING')
	
	INSERT INTO #CourseCreditBasisType 	
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CourseCreditBasisType'

	IF OBJECT_ID('tempdb..#CourseCreditLevelType') IS NOT NULL
		DROP TABLE #CourseCreditLevelType

	CREATE TABLE #CourseCreditLevelType (CourseCreditLevelTypeCode VARCHAR(50), CourseCreditLevelTypeDescription VARCHAR(200))

	INSERT INTO #CourseCreditLevelType VALUES ('MISSING', 'MISSING')
	
	INSERT INTO #CourseCreditLevelType 	
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CourseCreditLevelType'
	   	  
		INSERT INTO [RDS].DimPsCourseStatuses(
		    CourseLevelTypeCode
		   ,CourseLevelTypeDescription
		   ,CourseHonorsTypeCode
		   ,CourseHonorsTypeDescription
		   ,CourseCreditBasisTypeCode
		   ,CourseCreditBasisTypeDescription
		   ,CourseCreditLevelTypeCode
		   ,CourseCreditLevelTypeDescription)
	SELECT DISTINCT
		  a.CourseLevelTypeCode
		, a.CourseLevelTypeDescription
		, b.CourseHonorsTypeCode
		, b.CourseHonorsTypeDescription
		, c.CourseCreditBasisTypeCode
		, c.CourseCreditBasisTypeDescription
		, d.CourseCreditLevelTypeCode
		, d.CourseCreditLevelTypeDescription
	FROM #CourseLevelType a
	CROSS JOIN #CourseHonorsType b
	CROSS JOIN #CourseCreditBasisType c
	CROSS JOIN #CourseCreditLevelType d
	LEFT JOIN RDS.DimPsCourseStatuses main
		ON a.CourseLevelTypeCode = main.CourseLevelTypeCode
		AND b.CourseHonorsTypeCode = main.CourseHonorsTypeCode
		AND c.CourseCreditBasisTypeCode = main.CourseCreditBasisTypeCode
		AND d.CourseCreditLevelTypeCode = main.CourseCreditLevelTypeCode
	WHERE main.DimPsCourseStatusId IS NULL

	DROP TABLE #CourseLevelType
	DROP TABLE #CourseHonorsType
	DROP TABLE #CourseCreditBasisType
	DROP TABLE #CourseCreditLevelType




	PRINT 'Populate DimPsFamilyStatuses'
	---------------------------------------------------
	-- Populate DimPsFamilyStatuses ---
	---------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimPsFamilyStatuses d WHERE d.DimPsFamilyStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimPsFamilyStatuses ON

		INSERT INTO [RDS].DimPsFamilyStatuses
           (DimPsFamilyStatusId
		   ,DependencyStatusCode
		   ,DependencyStatusDescription
		   ,NumberOfDependentsTypeCode
		   ,NumberOfDependentsTypeDescription
		   ,SingleParentOrSinglePregnantWomanStatusCode
		   ,SingleParentOrSinglePregnantWomanStatusDescription
		   ,MaternalGuardianEducationCode
		   ,MaternalGuardianEducationDescription
		   ,PaternalGuardianEducationCode
		   ,PaternalGuardianEducationDescription)
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
				)

		SET IDENTITY_INSERT RDS.DimPsFamilyStatuses OFF
	END


	IF OBJECT_ID('tempdb..#DependencyStatus') IS NOT NULL
		DROP TABLE #DependencyStatus

	CREATE TABLE #DependencyStatus (DependencyStatusCode VARCHAR(50), DependencyStatusDescription VARCHAR(200))

	INSERT INTO #DependencyStatus VALUES ('MISSING', 'MISSING')
	
	INSERT INTO #DependencyStatus 	
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'DependencyStatus'

	IF OBJECT_ID('tempdb..#NumberOfDependentsType') IS NOT NULL
		DROP TABLE #NumberOfDependentsType

	CREATE TABLE #NumberOfDependentsType (NumberOfDependentsTypeCode VARCHAR(50), NumberOfDependentsTypeDescription VARCHAR(200))

	INSERT INTO #NumberOfDependentsType VALUES ('MISSING', 'MISSING')
	
	INSERT INTO #NumberOfDependentsType 	
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'NumberOfDependentsType'

	IF OBJECT_ID('tempdb..#SingleParentOrSinglePregnantWomanStatus2') IS NOT NULL
		DROP TABLE #SingleParentOrSinglePregnantWomanStatus2

	CREATE TABLE #SingleParentOrSinglePregnantWomanStatus2 (SingleParentOrSinglePregnantWomanStatusCode VARCHAR(50), SingleParentOrSinglePregnantWomanStatusDescription VARCHAR(200))

	INSERT INTO #SingleParentOrSinglePregnantWomanStatus2 VALUES ('MISSING', 'MISSING')
	
	INSERT INTO #SingleParentOrSinglePregnantWomanStatus2 	
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SingleParentOrSinglePregnantWomanStatus'

	IF OBJECT_ID('tempdb..#MaternalGuardianEducation') IS NOT NULL
		DROP TABLE #MaternalGuardianEducation

	CREATE TABLE #MaternalGuardianEducation (MaternalGuardianEducationCode VARCHAR(50), MaternalGuardianEducationDescription VARCHAR(200))

	INSERT INTO #MaternalGuardianEducation VALUES ('MISSING', 'MISSING')
	
	INSERT INTO #MaternalGuardianEducation 	
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MaternalGuardianEducation'

	IF OBJECT_ID('tempdb..#PaternalGuardianEducation') IS NOT NULL
		DROP TABLE #PaternalGuardianEducation

	CREATE TABLE #PaternalGuardianEducation (PaternalGuardianEducationCode VARCHAR(50), PaternalGuardianEducationDescription VARCHAR(200))

	INSERT INTO #PaternalGuardianEducation VALUES ('MISSING', 'MISSING')
	
	INSERT INTO #PaternalGuardianEducation 	
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PaternalGuardianEducation'


		INSERT INTO [RDS].DimPsFamilyStatuses(
		    DependencyStatusCode
		   ,DependencyStatusDescription
		   ,NumberOfDependentsTypeCode
		   ,NumberOfDependentsTypeDescription
		   ,SingleParentOrSinglePregnantWomanStatusCode
		   ,SingleParentOrSinglePregnantWomanStatusDescription
		   ,MaternalGuardianEducationCode
		   ,MaternalGuardianEducationDescription
		   ,PaternalGuardianEducationCode
		   ,PaternalGuardianEducationDescription)
	SELECT DISTINCT
		  a.DependencyStatusCode
		, a.DependencyStatusDescription
		, b.NumberOfDependentsTypeCode
		, b.NumberOfDependentsTypeDescription
		, c.SingleParentOrSinglePregnantWomanStatusCode
		, c.SingleParentOrSinglePregnantWomanStatusDescription
		, d.MaternalGuardianEducationCode
		, d.MaternalGuardianEducationDescription
		, e.PaternalGuardianEducationCode
		, e.PaternalGuardianEducationDescription
	FROM #DependencyStatus a
	CROSS JOIN #NumberOfDependentsType b
	CROSS JOIN #SingleParentOrSinglePregnantWomanStatus2 c
	CROSS JOIN #MaternalGuardianEducation d
	CROSS JOIN #PaternalGuardianEducation e
	LEFT JOIN RDS.DimPsFamilyStatuses main
		ON a.DependencyStatusCode = main.DependencyStatusCode
		AND b.NumberOfDependentsTypeCode = main.NumberOfDependentsTypeCode
		AND c.SingleParentOrSinglePregnantWomanStatusCode = main.SingleParentOrSinglePregnantWomanStatusCode
		AND d.MaternalGuardianEducationCode = main.MaternalGuardianEducationCode
		AND e.PaternalGuardianEducationCode = main.PaternalGuardianEducationCode
	WHERE main.DimPsFamilyStatusId IS NULL

	DROP TABLE #DependencyStatus
	DROP TABLE #NumberOfDependentsType
	DROP TABLE #SingleParentOrSinglePregnantWomanStatus2
	DROP TABLE #MaternalGuardianEducation
	DROP TABLE #PaternalGuardianEducation



	PRINT 'Populate DimResponsibleOrganizationTypes'
	---------------------------------------------------
	-- Populate DimResponsibleOrganizationTypes ---
	---------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimResponsibleOrganizationTypes d WHERE d.DimResponsibleOrganizationTypeId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimResponsibleOrganizationTypes ON

		INSERT INTO [RDS].DimResponsibleOrganizationTypes
           (DimResponsibleOrganizationTypeId
		   ,ResponsibleDistrictTypeCode
		   ,ResponsibleDistrictTypeDescription
		   ,ResponsibleSchoolTypeCode
		   ,ResponsibleSchoolTypeDescription)
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'

				)

		SET IDENTITY_INSERT RDS.DimResponsibleOrganizationTypes OFF
	END

	IF OBJECT_ID('tempdb..#ResponsibleDistrictType') IS NOT NULL
		DROP TABLE #ResponsibleDistrictType

	CREATE TABLE #ResponsibleDistrictType (ResponsibleDistrictTypeCode VARCHAR(50), ResponsibleDistrictTypeDescription VARCHAR(200))

	INSERT INTO #ResponsibleDistrictType VALUES ('MISSING', 'MISSING')

	INSERT INTO #ResponsibleDistrictType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ResponsibleDistrictType'

	IF OBJECT_ID('tempdb..#ResponsibleSchoolType') IS NOT NULL
		DROP TABLE #ResponsibleSchoolType

	CREATE TABLE #ResponsibleSchoolType (ResponsibleSchoolTypeCode VARCHAR(50), ResponsibleSchoolTypeDescription VARCHAR(200))

	INSERT INTO #ResponsibleSchoolType VALUES ('MISSING', 'MISSING')

	INSERT INTO #ResponsibleSchoolType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ResponsibleSchoolType'


	INSERT INTO RDS.DimResponsibleOrganizationTypes
		  (ResponsibleDistrictTypeCode
		   ,ResponsibleDistrictTypeDescription
		   ,ResponsibleSchoolTypeCode
		   ,ResponsibleSchoolTypeDescription)
	SELECT DISTINCT
		  a.ResponsibleDistrictTypeCode
		, a.ResponsibleDistrictTypeDescription
		, b.ResponsibleSchoolTypeCode
		, b.ResponsibleSchoolTypeDescription
	FROM #ResponsibleDistrictType a
	CROSS JOIN #ResponsibleSchoolType b
	LEFT JOIN RDS.DimResponsibleOrganizationTypes main
		ON a.ResponsibleDistrictTypeCode = main.ResponsibleDistrictTypeCode
		AND b.ResponsibleSchoolTypeCode = main.ResponsibleSchoolTypeCode
	WHERE main.DimResponsibleOrganizationTypeId IS NULL

	DROP TABLE #ResponsibleDistrictType
	DROP TABLE #ResponsibleSchoolType


	PRINT 'Populate DimSchoolQualityOrStudentSuccessIndicators'
	---------------------------------
	-- Populate DimSchoolQualityOrStudentSuccessIndicators
	---------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimSchoolQualityOrStudentSuccessIndicators d WHERE d.DimSchoolQualityOrStudentSuccessIndicatorId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimSchoolQualityOrStudentSuccessIndicators ON

		INSERT INTO RDS.DimSchoolQualityOrStudentSuccessIndicators (
			DimSchoolQualityOrStudentSuccessIndicatorId
			, SchoolQualityOrStudentSuccessIndicatorTypeCode
			, SchoolQualityOrStudentSuccessIndicatorTypeDescription
			, SchoolQualityOrStudentSuccessIndicatorTypeEdFactsCode)
			VALUES (-1, 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimSchoolQualityOrStudentSuccessIndicators OFF
	END

	INSERT INTO RDS.DimSchoolQualityOrStudentSuccessIndicators
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
		, ceds.CedsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimK12ProgramTypes main
		ON ceds.CedsOptionSetCode = main.ProgramTypeCode
	WHERE main.ProgramTypeCode IS NULL
		AND ceds.CedsElementTechnicalName = 'SchoolQualityOrStudentSuccessIndicatorType'


	PRINT 'Populate DimStudentSupportServiceTypes'
	------------------------------------------------
	-- Populate DimStudentSupportServiceTypes		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimStudentSupportServiceTypes d WHERE d.DimStudentSupportServiceTypeId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimStudentSupportServiceTypes ON

		INSERT INTO RDS.DimStudentSupportServiceTypes (DimStudentSupportServiceTypeId, StudentSupportServiceTypeCode, StudentSupportServiceTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimStudentSupportServiceTypes OFF
	END

	INSERT INTO RDS.DimStudentSupportServiceTypes
		(
			  StudentSupportServiceTypeCode
			, StudentSupportServiceTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimStudentSupportServiceTypes main
		ON ceds.CedsOptionSetCode = main.StudentSupportServiceTypeCode
	WHERE main.DimStudentSupportServiceTypeId IS NULL
		AND ceds.CedsElementTechnicalName = 'StudentSupportServiceType'



	PRINT 'Populate DimTitleIStatuses'
	---------------------------------------------------
	-- Populate DimTitleIStatuses ---
	---------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimTitleIStatuses d WHERE d.DimTitleIStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimTitleIStatuses ON

		INSERT INTO [RDS].DimTitleIStatuses
           (DimTitleIStatusId
		   ,TitleIIndicatorCode
           ,TitleIIndicatorDescription
           ,TitleIIndicatorEdFactsCode
           ,SchoolChoiceAppliedforTransferStatusCode
           ,SchoolChoiceAppliedforTransferStatusDescription
           ,SchoolChoiceEligibleforTransferStatusCode
           ,SchoolChoiceEligibleforTransferStatusDescription
           ,SchoolChoiceTransferStatusCode
           ,SchoolChoiceTransferStatusDescription
           ,TitleISchoolSupplementalServicesAppliedStatusCode
           ,TitleISchoolSupplementalServicesAppliedStatusDescription
           ,TitleISchoolSupplementalServicesEligibleStatusCode
           ,TitleISchoolSupplementalServicesEligibleStatusDescription
           ,TitleISchoolSupplementalServicesReceivedStatusCode
           ,TitleISchoolSupplementalServicesReceivedStatusDescription
           ,TitleISchoolwideProgramParticipationCode
           ,TitleISchoolwideProgramParticipationDescription
           ,TitleITargetedAssistanceParticipationCode
           ,TitleITargetedAssistanceParticipationDescription)
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

		SET IDENTITY_INSERT RDS.DimTitleIStatuses OFF
	END

	IF OBJECT_ID('tempdb..#TitleIIndicator') IS NOT NULL
		DROP TABLE #TitleIIndicator

	CREATE TABLE #TitleIIndicator (TitleIIndicatorCode VARCHAR(50), TitleIIndicatorDescription VARCHAR(200), TitleIIndicatorEdFactsCode VARCHAR(50))

	INSERT INTO #TitleIIndicator VALUES ('MISSING', 'MISSING', 'MISSING')

	INSERT INTO #TitleIIndicator 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TitleIIndicator'

	IF OBJECT_ID('tempdb..#SchoolChoiceAppliedforTransferStatus') IS NOT NULL
		DROP TABLE #SchoolChoiceAppliedforTransferStatus

	CREATE TABLE #SchoolChoiceAppliedforTransferStatus (SchoolChoiceAppliedforTransferStatusCode VARCHAR(50), SchoolChoiceAppliedforTransferStatusDescription VARCHAR(200))

	INSERT INTO #SchoolChoiceAppliedforTransferStatus VALUES ('MISSING', 'MISSING')

	INSERT INTO #SchoolChoiceAppliedforTransferStatus 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SchoolChoiceAppliedforTransferStatus'

	IF OBJECT_ID('tempdb..#SchoolChoiceEligibleforTransferStatus') IS NOT NULL
		DROP TABLE #SchoolChoiceEligibleforTransferStatus

	CREATE TABLE #SchoolChoiceEligibleforTransferStatus (SchoolChoiceEligibleforTransferStatusCode VARCHAR(50), SchoolChoiceEligibleforTransferStatusDescription VARCHAR(200))

	INSERT INTO #SchoolChoiceEligibleforTransferStatus VALUES ('MISSING', 'MISSING')

	INSERT INTO #SchoolChoiceEligibleforTransferStatus 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SchoolChoiceEligibleforTransferStatus'

	IF OBJECT_ID('tempdb..#SchoolChoiceTransferStatus') IS NOT NULL
		DROP TABLE #SchoolChoiceTransferStatus

	CREATE TABLE #SchoolChoiceTransferStatus (SchoolChoiceTransferStatusCode VARCHAR(50), SchoolChoiceTransferStatusDescription VARCHAR(200))

	INSERT INTO #SchoolChoiceTransferStatus VALUES ('MISSING', 'MISSING')

	INSERT INTO #SchoolChoiceTransferStatus 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'SchoolChoiceTransferStatus'

	IF OBJECT_ID('tempdb..#TitleISchoolSupplementalServicesAppliedStatus') IS NOT NULL
		DROP TABLE #TitleISchoolSupplementalServicesAppliedStatus

	CREATE TABLE #TitleISchoolSupplementalServicesAppliedStatus (TitleISchoolSupplementalServicesAppliedStatusCode VARCHAR(50), TitleISchoolSupplementalServicesAppliedStatusDescription VARCHAR(200))

	INSERT INTO #TitleISchoolSupplementalServicesAppliedStatus VALUES ('MISSING', 'MISSING')

	INSERT INTO #TitleISchoolSupplementalServicesAppliedStatus 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TitleISchoolSupplementalServicesAppliedStatus'

	IF OBJECT_ID('tempdb..#TitleISchoolSupplementalServicesEligibleStatus') IS NOT NULL
		DROP TABLE #TitleISchoolSupplementalServicesEligibleStatus

	CREATE TABLE #TitleISchoolSupplementalServicesEligibleStatus (TitleISchoolSupplementalServicesEligibleStatusCode VARCHAR(50), TitleISchoolSupplementalServicesEligibleStatusDescription VARCHAR(200))

	INSERT INTO #TitleISchoolSupplementalServicesEligibleStatus VALUES ('MISSING', 'MISSING')

	INSERT INTO #TitleISchoolSupplementalServicesEligibleStatus 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TitleISchoolSupplementalServicesEligibleStatus'

	IF OBJECT_ID('tempdb..#TitleISchoolSupplementalServicesReceivedStatus') IS NOT NULL
		DROP TABLE #TitleISchoolSupplementalServicesReceivedStatus

	CREATE TABLE #TitleISchoolSupplementalServicesReceivedStatus (TitleISchoolSupplementalServicesReceivedStatusCode VARCHAR(50), TitleISchoolSupplementalServicesReceivedStatusDescription VARCHAR(200))

	INSERT INTO #TitleISchoolSupplementalServicesReceivedStatus VALUES ('MISSING', 'MISSING')

	INSERT INTO #TitleISchoolSupplementalServicesReceivedStatus 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TitleISchoolSupplementalServicesReceivedStatus'

	IF OBJECT_ID('tempdb..#TitleISchoolwideProgramParticipation') IS NOT NULL
		DROP TABLE #TitleISchoolwideProgramParticipation

	CREATE TABLE #TitleISchoolwideProgramParticipation (TitleISchoolwideProgramParticipationCode VARCHAR(50), TitleISchoolwideProgramParticipationDescription VARCHAR(200))

	INSERT INTO #TitleISchoolwideProgramParticipation VALUES ('MISSING', 'MISSING')

	INSERT INTO #TitleISchoolwideProgramParticipation 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TitleISchoolwideProgramParticipation'

	IF OBJECT_ID('tempdb..#TitleITargetedAssistanceParticipation') IS NOT NULL
		DROP TABLE #TitleITargetedAssistanceParticipation

	CREATE TABLE #TitleITargetedAssistanceParticipation (TitleITargetedAssistanceParticipationCode VARCHAR(50), TitleITargetedAssistanceParticipationDescription VARCHAR(200))

	INSERT INTO #TitleITargetedAssistanceParticipation VALUES ('MISSING', 'MISSING')

	INSERT INTO #TitleITargetedAssistanceParticipation 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM [CEDS].CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'TitleITargetedAssistanceParticipation'


	INSERT INTO RDS.DimTitleIStatuses
		   (TitleIIndicatorCode
           ,TitleIIndicatorDescription
           ,TitleIIndicatorEdFactsCode
           ,SchoolChoiceAppliedforTransferStatusCode
           ,SchoolChoiceAppliedforTransferStatusDescription
           ,SchoolChoiceEligibleforTransferStatusCode
           ,SchoolChoiceEligibleforTransferStatusDescription
           ,SchoolChoiceTransferStatusCode
           ,SchoolChoiceTransferStatusDescription
           ,TitleISchoolSupplementalServicesAppliedStatusCode
           ,TitleISchoolSupplementalServicesAppliedStatusDescription
           ,TitleISchoolSupplementalServicesEligibleStatusCode
           ,TitleISchoolSupplementalServicesEligibleStatusDescription
           ,TitleISchoolSupplementalServicesReceivedStatusCode
           ,TitleISchoolSupplementalServicesReceivedStatusDescription
           ,TitleISchoolwideProgramParticipationCode
           ,TitleISchoolwideProgramParticipationDescription
           ,TitleITargetedAssistanceParticipationCode
           ,TitleITargetedAssistanceParticipationDescription)
	SELECT DISTINCT
		  a.TitleIIndicatorCode
		, a.TitleIIndicatorDescription
		, a.TitleIIndicatorEdFactsCode
		, b.SchoolChoiceAppliedforTransferStatusCode
		, b.SchoolChoiceAppliedforTransferStatusDescription
		, c.SchoolChoiceEligibleforTransferStatusCode
		, c.SchoolChoiceEligibleforTransferStatusDescription
		, d.SchoolChoiceTransferStatusCode
		, d.SchoolChoiceTransferStatusDescription
		, e.TitleISchoolSupplementalServicesAppliedStatusCode
		, e.TitleISchoolSupplementalServicesAppliedStatusDescription
		, f.TitleISchoolSupplementalServicesEligibleStatusCode
		, f.TitleISchoolSupplementalServicesEligibleStatusDescription
		, g.TitleISchoolSupplementalServicesReceivedStatusCode
		, g.TitleISchoolSupplementalServicesReceivedStatusDescription
		, h.TitleISchoolwideProgramParticipationCode
		, h.TitleISchoolwideProgramParticipationDescription
		, i.TitleITargetedAssistanceParticipationCode
		, i.TitleITargetedAssistanceParticipationDescription
	FROM #TitleIIndicator a
	CROSS JOIN #SchoolChoiceAppliedforTransferStatus b
	CROSS JOIN #SchoolChoiceEligibleforTransferStatus c
	CROSS JOIN #SchoolChoiceTransferStatus d
	CROSS JOIN #TitleISchoolSupplementalServicesAppliedStatus e
	CROSS JOIN #TitleISchoolSupplementalServicesEligibleStatus f
	CROSS JOIN #TitleISchoolSupplementalServicesReceivedStatus g
	CROSS JOIN #TitleISchoolwideProgramParticipation h
	CROSS JOIN #TitleITargetedAssistanceParticipation i
	LEFT JOIN RDS.DimTitleIStatuses main
		ON a.TitleIIndicatorCode = main.TitleIIndicatorCode
		AND b.SchoolChoiceAppliedforTransferStatusCode = main.SchoolChoiceAppliedforTransferStatusCode
		AND c.SchoolChoiceEligibleforTransferStatusCode = main.SchoolChoiceEligibleforTransferStatusCode
		AND d.SchoolChoiceTransferStatusCode = main.SchoolChoiceTransferStatusCode
		AND e.TitleISchoolSupplementalServicesAppliedStatusCode = main.TitleISchoolSupplementalServicesAppliedStatusCode
		AND f.TitleISchoolSupplementalServicesEligibleStatusCode = main.TitleISchoolSupplementalServicesEligibleStatusCode
		AND g.TitleISchoolSupplementalServicesReceivedStatusCode = main.TitleISchoolSupplementalServicesReceivedStatusCode
		AND h.TitleISchoolwideProgramParticipationCode = main.TitleISchoolwideProgramParticipationCode
		AND i.TitleITargetedAssistanceParticipationCode = main.TitleITargetedAssistanceParticipationCode
	WHERE main.DimTitleIStatusId IS NULL

	DROP TABLE #TitleIIndicator
	DROP TABLE #SchoolChoiceAppliedforTransferStatus
	DROP TABLE #SchoolChoiceEligibleforTransferStatus
	DROP TABLE #SchoolChoiceTransferStatus
	DROP TABLE #TitleISchoolSupplementalServicesAppliedStatus
	DROP TABLE #TitleISchoolSupplementalServicesEligibleStatus
	DROP TABLE #TitleISchoolSupplementalServicesReceivedStatus
	DROP TABLE #TitleISchoolwideProgramParticipation
	DROP TABLE #TitleITargetedAssistanceParticipation

	PRINT 'Populate DimWeapons'
	------------------------------------------------
	-- Populate DimWeapons		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimWeapons d WHERE d.DimWeaponId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimWeapons ON

		INSERT INTO RDS.DimWeapons (DimWeaponId, WeaponTypeCode, WeaponTypeDescription, WeaponTypeEdFactsCode)
			VALUES (-1, 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimWeapons OFF
	END

	INSERT INTO RDS.DimWeapons
		(
			  WeaponTypeCode
			, WeaponTypeDescription
			, WeaponTypeEdFactsCode
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
		, ceds.EdFactsOptionSetCode
	FROM [CEDS].CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimWeapons main
		ON ceds.CedsOptionSetCode = main.WeaponTypeCode
	WHERE main.DimWeaponId IS NULL
		AND ceds.CedsElementTechnicalName = 'WeaponType'


