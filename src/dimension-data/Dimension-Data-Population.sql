/*    

	Copyright 2021 Common Education Data Standards
	
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
    Version 9.0.0.0
    CEDS Data Warehouse (DW)
    
	Model database dimension table population script
	
    This script populates some of the dimension tables in a DW version 9.0.0.0 model database.
	It does not populate all of them. There are opportunities to add to this code through the
	Open Source Community.
    
    WARNING!!!!
    This script is intended for use on a model database and should not 
    be used on a database that contains data.
    
    The script was generated from a model database 
    hosted on a Microsoft SQL Server 2012 platform.  
    
    Questions on this script can be sent to https://ceds.ed.gov/ContactUs.aspx
    
    More information on the data model is available at the CEDS website:  
    http://ceds.ed.gov
   
	Instructions for Use:
	This script pulls reference data from the CEDS Integrated Data Store. You will
	need the CEDS IDS installed. It presently references the [CEDS-IDS-V9_0_0_0] database.
	If your IDS is named differently, use a find/replace for [CEDS-IDS-V9_0_0_0]


*/ 

USE [CEDS-Data-Warehouse-V9-0-0-0] -- replace this if the name of your data warehouse is different
GO

	-------------------
	-- Populate DimAges
	-------------------
	-- Create MISSING record 
	IF NOT EXISTS (SELECT 1 FROM RDS.DimAges WHERE DimAgeId = -1) BEGIN 
		SET IDENTITY_INSERT RDS.DimAges ON;
		INSERT INTO RDS.DimAges (DimAgeId, AgeCode, AgeDescription, AgeEdFactsCode, AgeValue) VALUES (-1, 'MISSING', 'MISSING', 'MISSING', -1)
		SET IDENTITY_INSERT RDS.DimAges OFF;  
	END

	-- Create MISSING record  (DimCipCodes doesnt have identity property set)
	IF NOT EXISTS (SELECT 1 FROM RDS.DimCipCodes WHERE DimCipCodeId = -1) BEGIN 
		--SET IDENTITY_INSERT RDS.DimCipCodes ON;
		INSERT INTO RDS.DimCipCodes (DimCipCodeId) VALUES (-1)
		--SET IDENTITY_INSERT RDS.DimCipCodes OFF;  
	END
	
	-- Create MISSING record 
	IF NOT EXISTS (SELECT 1 FROM RDS.DimLanguages WHERE DimLanguageId = -1) BEGIN 
		SET IDENTITY_INSERT RDS.DimLanguages ON;
		INSERT INTO RDS.DimLanguages (DimLanguageId) VALUES (-1)
		SET IDENTITY_INSERT RDS.DimLanguages OFF;  
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
		  p.Code
		, p.Description
		, p.Definition
	FROM [CEDS-IDS-V9_0_0_0].dbo.RefProgramType p
	LEFT JOIN RDS.DimK12ProgramTypes dp
		ON p.Code = dp.ProgramTypeCode
	WHERE dp.ProgramTypeCode IS NULL

	---------------------------------
	-- Populate DimSchoolYears
	---------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimSchoolYears s WHERE s.SchoolYear = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimSchoolYears ON

		INSERT INTO RDS.DimSchoolYears (DimSchoolYearId, SchoolYear, SessionBeginDate, SessionEndDate)
			VALUES (-1, -1, '1/1/1900', '1/1/1900')

		SET IDENTITY_INSERT RDS.DimSchoolYears OFF
	END

	INSERT INTO RDS.DimSchoolYears
	SELECT DISTINCT
		  oc.CalendarYear
		, ocs.BeginDate
		, ocs.EndDate
	FROM [CEDS-IDS-V9_0_0_0].dbo.OrganizationDetail od
	JOIN [CEDS-IDS-V9_0_0_0].dbo.OrganizationCalendar oc
		ON od.OrganizationId = oc.OrganizationId
	JOIN [CEDS-IDS-V9_0_0_0].dbo.OrganizationCalendarSession ocs
		ON oc.OrganizationCalendarId = ocs.OrganizationCalendarId
	JOIN [CEDS-IDS-V9_0_0_0].dbo.RefSessionType st
		ON ocs.RefSessionTypeId = st.RefSessionTypeId
		AND st.Code = 'FullSchoolYear'
	JOIN [CEDS-IDS-V9_0_0_0].dbo.RefOrganizationType ot
		ON od.RefOrganizationTypeId = ot.RefOrganizationTypeId
		AND ot.Code = 'SEA'
	LEFT JOIN rds.DimSchoolYears sy
		ON oc.CalendarYear = sy.SchoolYear
	WHERE sy.SchoolYear IS NULL


	------------------------------------------------
	-- Populate DimK12Courses					  --
	------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12Courses d WHERE d.CourseIdentifier = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimK12Courses ON

		INSERT INTO RDS.DimK12Courses 
		(DimK12CourseId,CourseIdentifier,CourseCodeSystemCode,CourseCodeSystemDesciption,CourseTitle,CourseDescription,CourseDepartmentName,CourseCreditUnitsCode,CourseCreditUnitsDescription
		,CreditValue,AdvancedPlacementCourseCode,CareerClusterCode,CareerClusterDescription,CourseCertificationDescription,TuitionFunded,CourseFundingProgram )
		VALUES (-1,'MISSING','MISSING','MISSING','MISSING','MISSING','MISSING','MISSING','MISSING',-0.00,'MISSING','MISSING','MISSING','MISSING',0,'MISSING')

		SET IDENTITY_INSERT RDS.DimK12Courses OFF
	END

	INSERT INTO RDS.DimK12Courses 
		(
		CourseIdentifier 
		,CourseCodeSystemCode
		,CourseCodeSystemDesciption
		,CourseTitle
		,CourseDescription
		,CourseDepartmentName
		,CourseCreditUnitsCode
		,CourseCreditUnitsDescription
		,CreditValue
		,AdvancedPlacementCourseCode
		,CareerClusterCode
		,CareerClusterDescription
		,CourseCertificationDescription
		,TuitionFunded
		,CourseFundingProgram      
		)
	SELECT distinct
		  oi.Identifier as CourseIdentifier
		  ,rois.Code as CourseCodeSystemCode
		  ,rois.Description as CourseCodeSystemDesciption
		  ,od.Name as CourseTitle
		  ,c.Description as CourseDescription
		  ,'MISSING' as CourseDepartmentName
		  ,'MISSING' as CourseCreditUnitsCode
		  ,'MISSING' as CourseCreditUnitsDescription
		  , 0.00 as CreditValue
		  ,'MISSING' as AdvancedPlacementCourseCode
		  ,'MISSING' as CareerClusterCode
		  ,'MISSING' as CareerClusterDescription
		  ,'MISSING' as CourseCertificationDescription
		  , 0 as TuitionFunded
		  ,'MISSING' as CourseFundingProgram  
	FROM [CEDS-IDS-V9_0_0_0].dbo.Course c
	JOIN [CEDS-IDS-V9_0_0_0].dbo.OrganizationIdentifier oi
		on c.OrganizationId = oi.OrganizationId
	JOIN [CEDS-IDS-V9_0_0_0].dbo.OrganizationDetail od
		on c.OrganizationId = od.OrganizationId
	JOIN [CEDS-IDS-V9_0_0_0].dbo.RefOrganizationIdentificationSystem  rois
		on rois.RefOrganizationIdentificationSystemId=oi.RefOrganizationIdentificationSystemId
	LEFT JOIN rds.DimK12Courses cs
		ON oi.Identifier = cs.CourseIdentifier
			and od.Name = cs.CourseTitle
	WHERE cs.DimK12CourseId IS NULL

	------------------------------------------------
	-- Populate DimScedCodes					  --
	------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimScedCodes d WHERE d.ScedCourseCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimScedCodes ON

		INSERT INTO RDS.DimScedCodes 
		(DimScedCodeId,ScedCourseCode,ScedCourseTitle,ScedCourseDescription,ScedCourseLevelCode,ScedCourseLevelDescription,
	ScedCourseSubjectAreaCode,ScedCourseSubjectAreaDescription,ScedGradeSpan,ScedSequenceOfCourse)
		VALUES (-1,'-1','MISSING','MISSING','MISSING','MISSING','MISSING','MISSING','-1','MISSING')

		SET IDENTITY_INSERT RDS.DimScedCodes OFF
	END

	INSERT INTO RDS.DimScedCodes 
		(
		ScedCourseCode
		,ScedCourseTitle
		,ScedCourseDescription
		,ScedCourseLevelCode
		,ScedCourseLevelDescription
		,ScedCourseSubjectAreaCode
		,ScedCourseSubjectAreaDescription
		,ScedGradeSpan
		,ScedSequenceOfCourse    
		)
	Select DISTINCT
		c.[SCEDCourseCode], 
		'MISSING' as [ScedCourseTitle], 
		'MISSING' as [ScedCourseDescription], 
		'MISSING' as [ScedCourseLevelCode], 
		'MISSING' as [ScedCourseLevelDescription], 
		'MISSING' as [ScedCourseSubjectAreaCode], 
		'MISSING' as [ScedCourseSubjectAreaDescription], 
		'-1'	  as [ScedGradeSpan], 
		'MISSING' as [ScedSequenceOfCourse]
	From [CEDS-IDS-V9_0_0_0].dbo.K12Course c
		LEFT JOIN rds.DimScedCodes cs
			ON c.[SCEDCourseCode] = cs.ScedCourseCode
	WHERE cs.DimScedCodeId IS NULL 

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

	CREATE TABLE #PescAwardLevelType (PescAwardLevelTypeCode VARCHAR(50), PescAwardLevelTypeDescription VARCHAR(200))

	INSERT INTO #PescAwardLevelType VALUES ('MISSING', 'MISSING')
	INSERT INTO #PescAwardLevelType 
	SELECT 
		  Code
		, Description
	FROM [CEDS-IDS-V9_0_0_0].dbo.RefPescAwardLevelType

	CREATE TABLE #ProfessionalTechnicalCredentialType (ProfessionalTechnicalCredentialTypeCode VARCHAR(50), ProfessionalTechnicalCredentialTypeDescription VARCHAR(200))

	INSERT INTO #ProfessionalTechnicalCredentialType VALUES ('MISSING', 'MISSING')
	INSERT INTO #ProfessionalTechnicalCredentialType
	SELECT
		  Code
		, Description
	FROM [CEDS-IDS-V9_0_0_0].dbo.RefProfessionalTechnicalCredentialType

	-- Populate RDS.DimPsAcademicAwardStatuses
	INSERT INTO RDS.DimPsAcademicAwardStatuses
	SELECT
		  palt.PescAwardLevelTypeCode
		, palt.PescAwardLevelTypeDescription
		, ptct.ProfessionalTechnicalCredentialTypeCode
		, ptct.ProfessionalTechnicalCredentialTypeDescription
	FROM #PescAwardLevelType palt
	CROSS JOIN #ProfessionalTechnicalCredentialType ptct
	LEFT JOIN RDS.DimPsAcademicAwardStatuses paas
		ON palt.PescAwardLevelTypeCode = paas.PescAwardLevelTypeCode
		AND ptct.ProfessionalTechnicalCredentialTypeCode = paas.ProfessionalOrTechnicalCredentialConferredCode
	WHERE paas.DimPsAcademicAwardStatusId IS NULL

	DROP TABLE #PescAwardLevelType
	DROP TABLE #ProfessionalTechnicalCredentialType
	  	  	  
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
		  ewt.Code as PostsecondaryExitOrWithdrawalTypeCode
		, ewt.Description as PostsecondaryExitOrWithdrawalTypeDescription
	FROM [CEDS-IDS-V9_0_0_0].dbo.RefPSExitOrWithdrawalType ewt
	LEFT JOIN rds.DimPsEnrollmentStatuses pes
		ON ewt.Code = pes.PostsecondaryExitOrWithdrawalTypeCode
	WHERE pes.DimPsEnrollmentStatusId IS NULL

	------------------------------------------------
	-- Populate DimK12EnrollmentStatuses			 ---
	------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12EnrollmentStatuses d WHERE d.DimK12EnrollmentStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimK12EnrollmentStatuses ON

		INSERT INTO RDS.DimK12EnrollmentStatuses (
			  [DimK12EnrollmentStatusId]
			, [EnrollmentStatusCode]
			, [EnrollmentStatusDescription]
			, [EntryTypeCode]
			, [EntryTypeDescription]
			, [ExitOrWithdrawalTypeCode]
			, [ExitOrWithdrawalTypeDescription]
			, [PostSecondaryEnrollmentStatusCode]
			, [PostSecondaryEnrollmentStatusDescription]
			, [PostSecondaryEnrollmentStatusEdFactsCode]
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

		SET IDENTITY_INSERT RDS.DimK12EnrollmentStatuses OFF
	END

	CREATE TABLE #EnrollmentStatus (EnrollmentStatusCode VARCHAR(50), EnrollmentStatusDescription VARCHAR(200))

	INSERT INTO #EnrollmentStatus VALUES ('MISSING', 'MISSING')
	INSERT INTO #EnrollmentStatus 
	SELECT 
		  Code
		, Description
	FROM [CEDS-IDS-V9_0_0_0].dbo.RefEnrollmentStatus

	CREATE TABLE #EntryType (EntryTypeCode VARCHAR(50), EntryTypeDescription VARCHAR(200))

	INSERT INTO #EntryType VALUES ('MISSING', 'MISSING')
	INSERT INTO #EntryType 
	SELECT 
		  Code
		, Description
	FROM [CEDS-IDS-V9_0_0_0].dbo.RefEntryType

	CREATE TABLE #ExitOrWithdrawalType (ExitOrWithdrawalTypeCode VARCHAR(50), ExitOrWithdrawalTypeDescription VARCHAR(200))

	INSERT INTO #ExitOrWithdrawalType VALUES ('MISSING', 'MISSING')
	INSERT INTO #ExitOrWithdrawalType 
	SELECT 
		  Code
		, Description
	FROM [CEDS-IDS-V9_0_0_0].dbo.RefExitOrWithdrawalType

	CREATE TABLE #PostSecondaryEnrollmentStatus (PostSecondaryEnrollmentStatusCode VARCHAR(50), PostSecondaryEnrollmentStatusDescription VARCHAR(200), PostSecondaryEnrollmentStatusEdFactsCode VARCHAR(50))

	INSERT INTO #PostSecondaryEnrollmentStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #PostSecondaryEnrollmentStatus 
	SELECT 
		  Code
		, Description
		, Code
	FROM [CEDS-IDS-V9_0_0_0].dbo.RefPsEnrollmentStatus


	INSERT INTO RDS.DimK12EnrollmentStatuses
		(
			  [EnrollmentStatusCode]
			, [EnrollmentStatusDescription]
			, [EntryTypeCode]
			, [EntryTypeDescription]
			, [ExitOrWithdrawalTypeCode]
			, [ExitOrWithdrawalTypeDescription]
			, [PostSecondaryEnrollmentStatusCode]
			, [PostSecondaryEnrollmentStatusDescription]
			, [PostSecondaryEnrollmentStatusEdFactsCode]
		)
	SELECT DISTINCT
		  es.EnrollmentStatusCode
		, es.EnrollmentStatusDescription
		, et.EntryTypeCode
		, et.EntryTypeDescription
		, ewt.ExitOrWithdrawalTypeCode
		, ewt.ExitOrWithdrawalTypeDescription
		, pes.PostSecondaryEnrollmentStatusCode
		, pes.PostSecondaryEnrollmentStatusDescription
		, pes.PostSecondaryEnrollmentStatusEdFactsCode
	FROM #EnrollmentStatus es
	CROSS JOIN #EntryType et
	CROSS JOIN #ExitOrWithdrawalType ewt
	CROSS JOIN #PostSecondaryEnrollmentStatus pes
	LEFT JOIN rds.DimK12EnrollmentStatuses kes
		ON es.EnrollmentStatusCode = kes.EnrollmentStatusCode
		AND et.EntryTypeCode = kes.EntryTypeCode
		AND ewt.ExitOrWithdrawalTypeCode = kes.ExitOrWithdrawalTypeCode
		AND pes.PostSecondaryEnrollmentStatusCode = kes.PostSecondaryEnrollmentStatusCode
	WHERE kes.DimK12EnrollmentStatusId IS NULL

	DROP TABLE #EnrollmentStatus
	DROP TABLE #EntryType
	DROP TABLE #ExitOrWithdrawalType
	DROP TABLE #PostSecondaryEnrollmentStatus


	
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
		  pt.Code as ProgramTypeCode
		, pt.Description as ProgramTypeDescription
	FROM [CEDS-IDS-V9_0_0_0].dbo.RefProgramType pt
	LEFT JOIN rds.DimProgramTypes dpt
		ON pt.Code = dpt.ProgramTypeCode
	WHERE dpt.DimProgramTypeId IS NULL


	-----------------------------------------------------
	-- Populate DimK12Demographics                     --
	-----------------------------------------------------
	
	CREATE TABLE #MilitaryConnectedStudentIndicator (MilitaryConnectedStudentIndicatorCode VARCHAR(50), MilitaryConnectedStudentIndicatorDescription VARCHAR(200), MilitaryConnectedStudentIndicatorEdFactsCode VARCHAR(50))

	INSERT INTO #MilitaryConnectedStudentIndicator VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #MilitaryConnectedStudentIndicator 
	SELECT 
		  Code
		, Description
		, CASE Code
			WHEN 'ActiveDuty' THEN 'MILCNCTD'
			WHEN 'NationalGuardOrReserve' THEN 'MILCNCTD'
			ELSE 'Missing'
		  END
	FROM [CEDS-IDS-V9_0_0_0].dbo.RefMilitaryConnectedStudentIndicator

	CREATE TABLE #HomelessPrimaryNighttimeResidence (HomelessPrimaryNighttimeResidenceCode VARCHAR(50), HomelessPrimaryNighttimeResidenceDescription VARCHAR(200), HomelessPrimaryNighttimeResidenceEdFactsCode VARCHAR(50))

	INSERT INTO #HomelessPrimaryNighttimeResidence VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #HomelessPrimaryNighttimeResidence 
	SELECT 
		  Code
		, Description
		, CASE Code
			WHEN 'Shelters' THEN 'STH'
			WHEN 'DoubledUp' THEN 'D'
			WHEN 'Unsheltered' THEN 'U'
			WHEN 'HotelMotel' THEN 'HM'
		  END
	FROM [CEDS-IDS-V9_0_0_0].dbo.RefHomelessNighttimeResidence


	INSERT INTO RDS.DimK12Demographics
		(
			  EconomicDisadvantageStatusCode
			, EconomicDisadvantageStatusDescription
			, EconomicDisadvantageStatusEdFactsCode
			, HomelessnessStatusCode
			, HomelessnessStatusDescription
			, HomelessnessStatusEdFactsCode
			, EnglishLearnerStatusCode
			, EnglishLearnerStatusDescription
			, EnglishLearnerStatusEdFactsCode
			, MigrantStatusCode
			, MigrantStatusDescription
			, MigrantStatusEdFactsCode
			, MilitaryConnectedStudentIndicatorCode
			, MilitaryConnectedStudentIndicatorDescription
			, MilitaryConnectedStudentIndicatorEdFactsCode
			, HomelessPrimaryNighttimeResidenceCode
			, HomelessPrimaryNighttimeResidenceDescription
			, HomelessPrimaryNighttimeResidenceEdFactsCode
			, HomelessUnaccompaniedYouthStatusCode
			, HomelessUnaccompaniedYouthStatusDescription
			, HomelessUnaccompaniedYouthStatusEdFactsCode
		)
	SELECT DISTINCT
		  EcoDis.Code
		, EcoDis.Description
		, EcoDis.EdFactsCode
		, Homeless.Code
		, Homeless.Description
		, Homeless.EdFactsCode
		, EL.Code
		, EL.Description
		, EL.EdFactsCode
		, Migrant.Code
		, Migrant.Description
		, Migrant.EdFactsCode
		, military.MilitaryConnectedStudentIndicatorCode
		, military.MilitaryConnectedStudentIndicatorDescription
		, military.MilitaryConnectedStudentIndicatorEdFactsCode
		, homelessres.HomelessPrimaryNighttimeResidenceCode
		, homelessres.HomelessPrimaryNighttimeResidenceDescription
		, homelessres.HomelessPrimaryNighttimeResidenceEdFactsCode
		, UnaccYouth.Code
		, UnaccYouth.Description
		, UnaccYouth.EdFactsCode
	FROM (VALUES('Yes', 'Economically Disadvantaged', 'ECODIS'),('No', 'Not Economoically Disadvantaged', 'MISSING'),('MISSING', 'MISSING', 'MISSING')) EcoDis(Code, Description, EdFactsCode)
	CROSS JOIN (VALUES('Yes', 'Homeless enrolled', 'HOMELSENRL'),('No', 'Not Homeless enrolled', 'MISSING'),('MISSING', 'MISSING', 'MISSING')) Homeless(Code, Description, EdFactsCode)
	CROSS JOIN (VALUES('LEP', 'Limited English proficient (LEP) Student', 'LEP'),('NLEP', 'Non-limited English proficient (non-LEP) Student', 'NLEP'),('LEPP', 'Perkins LEP Student', 'LEPP'),('MISSING', 'MISSING', 'MISSING')) EL(Code, Description, EdFactsCode)
	CROSS JOIN (VALUES('Yes', 'Migrant students', 'MS'),('No', 'Not a Migrant students', 'MISSING'),('MISSING', 'MISSING', 'MISSING')) Migrant(Code, Description, EdFactsCode)
	CROSS JOIN (VALUES('Yes', 'Unaccompanied Youth', 'UY'),('No', 'Not Unaccompanied Youth', 'MISSING'),('MISSING', 'MISSING', 'MISSING')) UnaccYouth(Code, Description, EdFactsCode)
	CROSS JOIN #MilitaryConnectedStudentIndicator military
	CROSS JOIN #HomelessPrimaryNighttimeResidence homelessres
	LEFT JOIN RDS.DimK12Demographics rdkd
		ON EcoDis.Code = rdkd.EconomicDisadvantageStatusCode
		AND Homeless.Code = rdkd.HomelessnessStatusCode
		AND EL.Code = rdkd.EnglishLearnerStatusCode
		AND Migrant.Code = rdkd.MigrantStatusCode
		AND military.MilitaryConnectedStudentIndicatorCode = rdkd.MilitaryConnectedStudentIndicatorCode
		AND homelessres.HomelessPrimaryNighttimeResidenceCode = rdkd.HomelessPrimaryNighttimeResidenceCode
		AND UnaccYouth.Code = rdkd.HomelessUnaccompaniedYouthStatusCode
	WHERE rdkd.DimK12DemographicId IS NULL

	DROP TABLE #MilitaryConnectedStudentIndicator
	DROP TABLE #HomelessPrimaryNighttimeResidence

