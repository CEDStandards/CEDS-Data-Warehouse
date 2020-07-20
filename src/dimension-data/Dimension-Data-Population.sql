/*    

	Copyright 2020 Common Education Data Standards
	
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
    Version 8.0.0.0
    CEDS Data Warehouse (DW)
    
	Model database dimension table population script
	
    This script populates the dimension tables in a DW version 8 model database.  
    
    WARNING!!!!
    This script is intended for use on a model database and should not 
    be used on a database that contains data.
    
    The script was generated from a model database 
    hosted on a Microsoft SQL Server 2012 platform.  
    
    Questions on this script can be sent to ceds@ed.gov
    
    More information on the data model is available at the CEDS website:  
    http://ceds.ed.gov
      	  
*/ 

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
	FROM [ceds-IDS-V8_0_0_0].dbo.RefProgramType p
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
	FROM [ceds-IDS-V8_0_0_0].dbo.OrganizationDetail od
	JOIN [ceds-IDS-V8_0_0_0].dbo.OrganizationCalendar oc
		ON od.OrganizationId = oc.OrganizationId
	JOIN [ceds-IDS-V8_0_0_0].dbo.OrganizationCalendarSession ocs
		ON oc.OrganizationCalendarId = ocs.OrganizationCalendarId
	JOIN [ceds-IDS-V8_0_0_0].dbo.RefSessionType st
		ON ocs.RefSessionTypeId = st.RefSessionTypeId
		AND st.Code = 'FullSchoolYear'
	JOIN [ceds-IDS-V8_0_0_0].dbo.RefOrganizationType ot
		ON od.RefOrganizationTypeId = ot.RefOrganizationTypeId
		AND ot.Code = 'SEA'
	LEFT JOIN rds.DimSchoolYears sy
		ON oc.CalendarYear = sy.SchoolYear
	WHERE sy.SchoolYear IS NULL

	---------------------------------
	-- Populate DimDataCollections
	---------------------------------
	--IF NOT EXISTS (SELECT 1 FROM RDS.DimDataCollections d WHERE d.DataCollectionName = 'MISSING') BEGIN
	--	SET IDENTITY_INSERT RDS.DimDataCollections ON

	--	INSERT INTO RDS.DimDataCollections (DimDataCollectionId, SourceSystemDataCollectionIdentifier, SourceSystemName, DataCollectionName, DataCollectionDescription, DataCollectionOpenDate, DataCollectionCloseDate, DataCollectionAcademicSchoolYear, DataCollectionSchoolYear)
	--		VALUES (-1, -1, 'MISSING', 'MISSING', 'MISSING', '1/1/1900', '1/1/1900', 'MISSING', 'MISSING')

	--	SET IDENTITY_INSERT RDS.DimDataCollections OFF
	--END

	--INSERT INTO RDS.DimDataCollections
	--SELECT DISTINCT
	--	  dc.SourceSystemDataCollectionIdentifier
	--	, dc.SourceSystemName
	--	, dc.DataCollectionName
	--	, dc.DataCollectionDescription
	--	, dc.DataCollectionOpenDate
	--	, dc.DataCollectionCloseDate
	--	, dc.DataCollectionAcademicSchoolYear
	--	, dc.DataCollectionSchoolYear
	--FROM [ceds-IDS-V8_0_0_0].dbo.DataCollection dc
	--LEFT JOIN RDS.DimDataCollections ddc
	--	ON dc.DataCollectionName = ddc.DataCollectionName
	--WHERE ddc.DataCollectionName IS NULL


	------------------------------------------------
	-- Populate DimK12Courses					  --
	------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12Courses d WHERE d.CourseIdentifier = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimK12Courses ON

		INSERT INTO RDS.DimK12Courses ([DimK12CourseId],[CourseIdentifier],[CourseCodeSystemCode],[CourseCodeSystemDesciption],[CourseTitle],[CourseDescription],[CourseDepartmentName],[CourseCreditUnitsCode],[CourseCreditUnitsDescription],[CreditValue],[AdvancedPlacementCourseCode],[CareerClusterCode],[CareerClusterDescription],[CourseCertificationDescription],[TuitionFunded],[CourseFundingProgram])
		VALUES (-1, 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', 'MISSING', -1, 'MISSING', 'MISSING', 'MISSING', 'MISSING', 0, 'MISSING')

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
		  ,NULL as CourseDepartmentName
		  ,NULL as CourseCreditUnitsCode
		  ,NULL as CourseCreditUnitsDescription
		  ,NULL as CreditValue
		  ,NULL as AdvancedPlacementCourseCode
		  ,NULL as CareerClusterCode
		  ,NULL as CareerClusterDescription
		  ,NULL as CourseCertificationDescription
		  ,NULL as TuitionFunded
		  ,NULL as CourseFundingProgram  
	FROM [ceds-IDS-V8_0_0_0].dbo.Course c
	JOIN [ceds-IDS-V8_0_0_0].dbo.OrganizationIdentifier oi
		on c.OrganizationId = oi.OrganizationId
	JOIN [ceds-IDS-V8_0_0_0].dbo.OrganizationDetail od
		on c.OrganizationId = od.OrganizationId
	JOIN [ceds-IDS-V8_0_0_0].dbo.RefOrganizationIdentificationSystem  rois
		on rois.RefOrganizationIdentificationSystemId=oi.RefOrganizationIdentificationSystemId
	LEFT JOIN rds.DimK12Courses cs
		ON oi.Identifier = cs.CourseIdentifier
			and od.Name = cs.CourseTitle
	WHERE cs.DimK12CourseId IS NULL

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
	-- Populate DimK12CourseStatuses			 ---
	------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12CourseStatuses d WHERE d.CourseLevelCharacteristicCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimK12CourseStatuses ON

		INSERT INTO RDS.DimK12CourseStatuses (DimK12CourseStatusId, CourseLevelCharacteristicCode, CourseLevelCharacteristicDescription) VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimK12CourseStatuses OFF
	END

	INSERT INTO RDS.DimK12CourseStatuses 
		(
		  CourseLevelCharacteristicCode        
		, CourseLevelCharacteristicDescription
		)
	SELECT 
		  clc.Code
		, clc.Description
	FROM [ceds-IDS-V8_0_0_0].dbo.RefCourseLevelCharacteristic clc
	LEFT JOIN rds.DimK12CourseStatuses cs
		ON clc.Code = cs.CourseLevelCharacteristicCode
	WHERE cs.DimK12CourseStatusId IS NULL

	  	  	  
	------------------------------------------------
	-- Populate DimPsAcademicAwardStatuses		 ---
	------------------------------------------------

	CREATE TABLE #PescAwardLevelType (PescAwardLevelTypeCode VARCHAR(50), PescAwardLevelTypeDescription VARCHAR(200))

	INSERT INTO #PescAwardLevelType VALUES ('MISSING', 'MISSING')
	INSERT INTO #PescAwardLevelType 
	SELECT 
		  Code
		, Description
	FROM [ceds-IDS-V8_0_0_0].dbo.RefPescAwardLevelType

	CREATE TABLE #ProfessionalTechnicalCredentialType (ProfessionalTechnicalCredentialTypeCode VARCHAR(50), ProfessionalTechnicalCredentialTypeDescription VARCHAR(200))

	INSERT INTO #ProfessionalTechnicalCredentialType VALUES ('MISSING', 'MISSING')
	INSERT INTO #ProfessionalTechnicalCredentialType
	SELECT
		  Code
		, Description
	FROM [ceds-IDS-V8_0_0_0].dbo.RefProfessionalTechnicalCredentialType

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
		  pes.PostsecondaryExitOrWithdrawalTypeCode
		, pes.PostsecondaryExitOrWithdrawalTypeDescription
	FROM [ceds-IDS-V8_0_0_0].dbo.RefPSExitOrWithdrawalType ewt
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
	FROM [ceds-IDS-V8_0_0_0].dbo.RefEnrollmentStatus

	CREATE TABLE #EntryType (EntryTypeCode VARCHAR(50), EntryTypeDescription VARCHAR(200))

	INSERT INTO #EntryType VALUES ('MISSING', 'MISSING')
	INSERT INTO #EntryType 
	SELECT 
		  Code
		, Description
	FROM [ceds-IDS-V8_0_0_0].dbo.RefEntryType

	CREATE TABLE #ExitOrWithdrawalType (ExitOrWithdrawalTypeCode VARCHAR(50), ExitOrWithdrawalTypeDescription VARCHAR(200))

	INSERT INTO #ExitOrWithdrawalType VALUES ('MISSING', 'MISSING')
	INSERT INTO #ExitOrWithdrawalType 
	SELECT 
		  Code
		, Description
	FROM [ceds-IDS-V8_0_0_0].dbo.RefExitOrWithdrawalType

	CREATE TABLE #PostSecondaryEnrollmentStatus (PostSecondaryEnrollmentStatusCode VARCHAR(50), PostSecondaryEnrollmentStatusDescription VARCHAR(200), PostSecondaryEnrollmentStatusEdFactsCode VARCHAR(50))

	INSERT INTO #PostSecondaryEnrollmentStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #PostSecondaryEnrollmentStatus 
	SELECT 
		  Code
		, Description
		, Code
	FROM [ceds-IDS-V8_0_0_0].dbo.RefPsEnrollmentStatus


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
