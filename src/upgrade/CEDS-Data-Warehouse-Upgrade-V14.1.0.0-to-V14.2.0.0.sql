/*
    CEDS Data Warehouse Upgrade Script
    -----------------------------------
    From: Version 14.1.0.0
    To:   Version 14.2.0.0

    Copyright 2026 Common Education Data Standards
    Licensed under the Apache License, Version 2.0

    PURPOSE
    -------
    This script upgrades an existing CEDS Data Warehouse V14.1.0.0 database to
    V14.2.0.0 in-place, preserving all existing data.  It is idempotent: every
    statement is guarded so the script can be re-run safely.

    This is the single, cumulative upgrade script for the V14.2.0.0 release.
    All schema changes made during this release cycle are added here as new
    sections rather than as one script per change.

    Run this script against your V14.1.0.0 database (not master).
    Example: USE [CEDS-Data-Warehouse-V14-1-0-0]; GO

    WHAT THIS SCRIPT DOES (in order)
    --------------------------------
    SECTION 1 - Staging table changes:
                  Staging.K12StaffAssignment (YearsOfTotalExperience)

    SECTION 2 - Fact table changes (new columns, nullability):
                  RDS.FactK12StaffAssignments (YearsOfTotalExperience)
                  RDS.FactK12StaffEmployments (YearsOfPriorTeachingExperience,
                    YearsOfPriorProfessionalExperience, YearsOfTotalExperience,
                    YearsofPriorAdultEducationTeachingExperience)

    SECTION 3 - Descriptive metadata (extended properties) for the new columns

    SECTION 4 - ETL stored procedure refresh:
                  Staging.[Staging-to-FactK12StaffAssignments]

    RELEASE CONTENTS
    ----------------
    * Issue #145 - Add Years of Total Experience (CEDS element 002060) to
      RDS.FactK12StaffAssignments at the K12 Staff Assignment grain, so that a
      staff member's total years of experience can be reported for a specific
      school at a specific point in time, discriminated by the assignment's role
      (e.g. teacher vs. instructional administrator via K12StaffCategoryId /
      K12PositionId).  Mirrors the existing
      RDS.FactK12StaffEmployments.YearsOfTotalExperience column.
      Sections 1, 2, 3 and 4.

    * Staff experience measures are now NULLable.  The five years-of-experience
      measures across RDS.FactK12StaffAssignments and RDS.FactK12StaffEmployments
      are relaxed from NOT NULL to NULL, and any zero default constraint on them is
      dropped.  These values are not reported by every source system, and 0 is a
      legitimate measured value (a first-year staff member), so a zero default made
      "not reported" and "no experience" permanently indistinguishable -- and
      understated metrics such as average years of experience and percent
      inexperienced.  Per Kimball, NULL is the correct representation of an
      unmeasured fact: SUM, AVG, MIN, MAX and COUNT all ignore NULL measures, and
      COUNT(<measure>) yields the reported-record count for free.  NULLs remain
      forbidden in the dimension foreign keys, which continue to use the -1
      "unknown member" convention.  Section 2.

    NOTES
    -----
    * Unlike the V14.0.0.0->V14.1.0.0 script, this script DOES apply column
      descriptive metadata (Section 3) and DOES refresh the affected ETL stored
      procedure (Section 4).  The extended properties are applied so that an
      upgraded database matches a fresh V14.2.0.0 install without a separate SSDT
      publish; the stored procedure is refreshed because the new fact column is
      inert until the staging-to-fact ETL carries it.  Both sections are
      idempotent and may be removed if the SSDT publish is preferred.
    * Section 2 converges the nullability and default constraints of the staff
      experience measures, so the script reaches the documented target state from a
      partially-applied database as well as from a clean V14.1.0.0 one.
    * Section 2 does NOT convert existing zeros back to NULL.  Once a zero has been
      written there is no way to tell a measured 0 (a first-year staff member) from
      a zero-filled "not reported", so the script leaves stored values untouched
      rather than guess.  If your source system can distinguish the two, reload the
      affected rows from staging after upgrading; otherwise treat zeros loaded
      before V14.2.0.0 as ambiguous.

    *** BACK UP YOUR DATABASE BEFORE RUNNING THIS SCRIPT ***
*/

USE [CEDS-Data-Warehouse-V14-1-0-0]

SET NOCOUNT ON;
SET XACT_ABORT ON;
GO

-- Safety precheck: refuse to run against a database that is not a CEDS Data Warehouse,
-- so that a failed USE above cannot silently apply changes to the wrong database.
IF OBJECT_ID('RDS.FactK12StaffAssignments', 'U') IS NULL
    THROW 50000, N'This does not appear to be a CEDS Data Warehouse database (RDS.FactK12StaffAssignments was not found). Change the USE statement at the top of this script to your CEDS Data Warehouse database and re-run.', 1;
GO

PRINT N'';
PRINT N'======================================================================';
PRINT N'  CEDS Data Warehouse Upgrade: V14.1.0.0 --> V14.2.0.0';
PRINT N'======================================================================';
PRINT N'';


/* ============================================================
   SECTION 1 - STAGING TABLE CHANGES
   ============================================================ */
PRINT N'Section 1: Staging table changes...';

-- 1a. Staging.K12StaffAssignment : Years of Total Experience (002060) - raw input, nullable
PRINT N'  Staging.K12StaffAssignment -> YearsOfTotalExperience...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('Staging.K12StaffAssignment') AND name = 'YearsOfTotalExperience')
    ALTER TABLE [Staging].[K12StaffAssignment] ADD [YearsOfTotalExperience] DECIMAL(4, 2) NULL;
GO

PRINT N'Section 1 complete.';
PRINT N'';


/* ============================================================
   SECTION 2 - FACT TABLE CHANGES
   ============================================================ */
PRINT N'Section 2: Fact table changes...';

-- 2a. RDS.FactK12StaffAssignments : Years of Total Experience (002060)
--     Added NULLable with no default.  Years of experience is not reported by every
--     source system, and 0 is a legitimate measured value (a first-year staff
--     member), so a zero default would make "not reported" and "no experience"
--     indistinguishable.  NULL is the correct representation of an unmeasured fact;
--     the SQL aggregates ignore it.
PRINT N'  RDS.FactK12StaffAssignments -> YearsOfTotalExperience...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffAssignments') AND name = 'YearsOfTotalExperience')
    ALTER TABLE [RDS].[FactK12StaffAssignments]
        ADD [YearsOfTotalExperience] DECIMAL(4, 2) NULL;
GO

-- 2b. Converge every staff experience measure to "NULLable, no default".
--     One block covers three starting points: a clean V14.1.0.0 database (where the
--     four RDS.FactK12StaffEmployments measures are NOT NULL), a database that ran an
--     earlier draft of this script (where FactK12StaffAssignments.YearsOfTotalExperience
--     is NOT NULL with a (0) default), and a database already at the V14.2.0.0 target
--     state (where this is a no-op).
--
--     The default constraint is dropped by its catalog name rather than by the expected
--     name, so a hand-added or auto-named constraint is removed too.  Existing stored
--     values are deliberately left alone -- see the NOTES header.
PRINT N'  Staff experience measures -> NULLable, no default...';

DECLARE @experienceMeasures TABLE (SchemaName SYSNAME, TableName SYSNAME, ColumnName SYSNAME);

INSERT INTO @experienceMeasures (SchemaName, TableName, ColumnName)
VALUES
      (N'RDS', N'FactK12StaffAssignments', N'YearsOfTotalExperience')
    , (N'RDS', N'FactK12StaffEmployments', N'YearsOfPriorTeachingExperience')
    , (N'RDS', N'FactK12StaffEmployments', N'YearsOfPriorProfessionalExperience')
    , (N'RDS', N'FactK12StaffEmployments', N'YearsOfTotalExperience')
    , (N'RDS', N'FactK12StaffEmployments', N'YearsofPriorAdultEducationTeachingExperience');

DECLARE @schemaName SYSNAME, @tableName SYSNAME, @columnName SYSNAME;
DECLARE @objectId INT, @constraintName SYSNAME, @precision TINYINT, @scale TINYINT, @sql NVARCHAR(MAX);

DECLARE experienceMeasures CURSOR LOCAL FAST_FORWARD FOR
    SELECT SchemaName, TableName, ColumnName FROM @experienceMeasures;

OPEN experienceMeasures;
FETCH NEXT FROM experienceMeasures INTO @schemaName, @tableName, @columnName;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @objectId = OBJECT_ID(QUOTENAME(@schemaName) + N'.' + QUOTENAME(@tableName), 'U');
    SET @constraintName = NULL;

    IF @objectId IS NOT NULL
       AND EXISTS (SELECT 1 FROM sys.columns WHERE object_id = @objectId AND name = @columnName)
    BEGIN
        -- Drop any default constraint on the column.  A DEFAULT ((0)) would keep
        -- zero-filling rows whose INSERT omits the column, defeating the NULL.
        SELECT @constraintName = dc.name
        FROM sys.default_constraints dc
        JOIN sys.columns c
          ON c.object_id = dc.parent_object_id
         AND c.column_id = dc.parent_column_id
        WHERE dc.parent_object_id = @objectId
          AND c.name = @columnName;

        IF @constraintName IS NOT NULL
        BEGIN
            SET @sql = N'ALTER TABLE ' + QUOTENAME(@schemaName) + N'.' + QUOTENAME(@tableName)
                     + N' DROP CONSTRAINT ' + QUOTENAME(@constraintName) + N';';
            PRINT N'    dropping default ' + QUOTENAME(@constraintName) + N' on ' + @tableName + N'.' + @columnName + N'...';
            EXEC sys.sp_executesql @sql;
        END

        -- Relax to NULL, preserving the column's existing precision and scale.
        IF EXISTS (SELECT 1 FROM sys.columns WHERE object_id = @objectId AND name = @columnName AND is_nullable = 0)
        BEGIN
            SELECT @precision = c.precision, @scale = c.scale
            FROM sys.columns c
            WHERE c.object_id = @objectId AND c.name = @columnName;

            SET @sql = N'ALTER TABLE ' + QUOTENAME(@schemaName) + N'.' + QUOTENAME(@tableName)
                     + N' ALTER COLUMN ' + QUOTENAME(@columnName)
                     + N' DECIMAL(' + CAST(@precision AS NVARCHAR(10)) + N', ' + CAST(@scale AS NVARCHAR(10)) + N') NULL;';
            PRINT N'    ' + @tableName + N'.' + @columnName + N' -> NULL';
            EXEC sys.sp_executesql @sql;
        END
    END

    FETCH NEXT FROM experienceMeasures INTO @schemaName, @tableName, @columnName;
END

CLOSE experienceMeasures;
DEALLOCATE experienceMeasures;
GO

PRINT N'Section 2 complete.';
PRINT N'';


/* ============================================================
   SECTION 3 - DESCRIPTIVE METADATA (EXTENDED PROPERTIES)
   ============================================================ */
PRINT N'Section 3: Descriptive metadata...';

-- 3a. RDS.FactK12StaffAssignments.YearsOfTotalExperience : CEDS element 002060
--     Each property is added or updated independently so that the script converges to
--     the documented state no matter which properties a previous run already wrote.
PRINT N'  RDS.FactK12StaffAssignments.YearsOfTotalExperience...';
DECLARE @properties TABLE (PropertyName SYSNAME, PropertyValue SQL_VARIANT);

INSERT INTO @properties (PropertyName, PropertyValue)
VALUES
      (N'MS_Description', N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.')
    , (N'CEDS_Def_Desc' , N'The total number of years that a person has held this position or a similar position in one or more organizations.')
    , (N'CEDS_Element'  , N'Years of Total Experience')
    , (N'CEDS_GlobalId' , N'002060')
    , (N'CEDS_URL'      , N'https://ceds.ed.gov/element/002060');

DECLARE @name SYSNAME, @value SQL_VARIANT;
DECLARE properties CURSOR LOCAL FAST_FORWARD FOR SELECT PropertyName, PropertyValue FROM @properties;

OPEN properties;
FETCH NEXT FROM properties INTO @name, @value;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF EXISTS (SELECT 1
               FROM sys.extended_properties
               WHERE class = 1
                 AND major_id = OBJECT_ID('RDS.FactK12StaffAssignments')
                 AND minor_id = COLUMNPROPERTY(OBJECT_ID('RDS.FactK12StaffAssignments'), 'YearsOfTotalExperience', 'ColumnId')
                 AND name = @name)
        EXEC sys.sp_updateextendedproperty
              @name = @name, @value = @value
            , @level0type = N'SCHEMA', @level0name = N'RDS'
            , @level1type = N'TABLE' , @level1name = N'FactK12StaffAssignments'
            , @level2type = N'COLUMN', @level2name = N'YearsOfTotalExperience';
    ELSE
        EXEC sys.sp_addextendedproperty
              @name = @name, @value = @value
            , @level0type = N'SCHEMA', @level0name = N'RDS'
            , @level1type = N'TABLE' , @level1name = N'FactK12StaffAssignments'
            , @level2type = N'COLUMN', @level2name = N'YearsOfTotalExperience';

    FETCH NEXT FROM properties INTO @name, @value;
END

CLOSE properties;
DEALLOCATE properties;
GO

PRINT N'Section 3 complete.';
PRINT N'';


/* ============================================================
   SECTION 4 - ETL STORED PROCEDURE REFRESH
   ============================================================ */
PRINT N'Section 4: Refreshing ETL stored procedures...';
PRINT N'  Staging.[Staging-to-FactK12StaffAssignments]...';
GO

CREATE OR ALTER PROCEDURE [Staging].[Staging-to-FactK12StaffAssignments]
AS
BEGIN

  -- Insert data FROM Staging.K12StaffAssignment into RDS.FactK12StaffAssignments
  INSERT INTO RDS.FactK12StaffAssignments (
      [LeaId]
    , [SchoolYearId]
    , [K12SchoolId]
    , [K12StaffStatusId]
    , [K12StaffCategoryId]
    , [TeachingCredentialStatusId]
    , [SeaId]
    , [K12StaffId]
    , [IeuId]
    , [ScedCodeId]
    , [OnetSocOccupationTypeId]
    , [K12EmploymentStatusId]
    , [K12PositionId]
    , [K12JobId]
    , [AssignmentStartDateId]
    , [AssignmentEndDateId]
    , [EmploymentStartDateId]
    , [EmploymentEndDateId]
    , [HireDateId]
    , [InstructionLanguageId]
    , [K12StaffAssignmentStatusId]
    , [K12DemographicId]
    , [EmployerId]
    , [DataCollectionId]
    , [LeaJobClassificationId]
    , [SeaJobClassificationId]
    , [FullTimeEquivalency]
    , [YearsOfTotalExperience]
    , [K12StaffAssignmentCount]
  )
  SELECT
      ISNULL(rdl.[DimLeaId], -1)
    , ISNULL(rsy.[DimSchoolYearId], -1)
    , ISNULL(rdksch.[DimK12SchoolId], -1)
    , ISNULL(rdkss.[DimK12StaffStatusId], -1)
    , ISNULL(rdksc.[DimK12StaffCategoryId], -1)
    , ISNULL(rdtcs.[DimTeachingCredentialStatusId], -1)
    , ISNULL(RDS.[DimSeaId], -1)
    , ISNULL(rdp.[DimPersonId], -1)
    , ISNULL(rdieu.[DimIeuId], -1)
    , ISNULL(rdsc.[DimScedCodeId], -1)
    , ISNULL(rdonet.[DimOnetSocOccupationTypeId], -1)
    , ISNULL(rdkes.[DimK12EmploymentStatusId], -1)
    , ISNULL(rdkp.[DimK12JobPositionId], -1)
    , ISNULL(rdkj.[DimK12JobId], -1)
    , ISNULL(rda.[DimDateId], -1)
    , ISNULL(rde.[DimDateId], -1)
    , ISNULL(rdes.[DimDateId], -1)
    , ISNULL(rdee.[DimDateId], -1)
    , ISNULL(rdh.[DimDateId], -1)
    , ISNULL(rdi.[DimLanguageId], -1)
    , ISNULL(rdkas.[DimK12StaffAssignmentStatusId], -1)
    , ISNULL(rdkd.[DimK12DemographicId], -1)
    , ISNULL(rdemp.[DimEmployerId], -1)
    , ISNULL(rddc.[DimDataCollectionId],-1)
    , ISNULL(rdljc.[DimLeaJobClassificationId], -1)
    , ISNULL(rdsljc.[DimSeaJobClassificationId], -1)
    , ISNULL(ska.[FullTimeEquivalency], 0)
    , ska.[YearsOfTotalExperience]
    , 1
  FROM Staging.K12StaffAssignment ska
  JOIN RDS.DimSchoolYears rsy
    ON ska.SchoolYear = rsy.SchoolYear
  JOIN RDS.DimSeas rds
    ON ISNULL(ska.AssignmentEndDate, ska.AssignmentStartDate) BETWEEN RDS.RecordStartDateTime AND ISNULL(RDS.RecordEndDateTime, GETDATE())		
  LEFT JOIN RDS.DimIeus rdieu
    ON ska.IeuOrganizationIdentifierSea = rdieu.IeuOrganizationIdentifierSea
    AND ISNULL(ska.AssignmentEndDate, ska.AssignmentStartDate) BETWEEN rdieu.RecordStartDateTime AND ISNULL(rdieu.RecordEndDateTime, GETDATE())		
  LEFT JOIN RDS.DimLeas rdl
    ON ska.LeaIdentifierSea = rdl.LeaIdentifierSea
    AND ISNULL(ska.AssignmentEndDate, ska.AssignmentStartDate) BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, GETDATE())		
  LEFT JOIN RDS.DimK12Schools rdksch
    ON ska.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
    AND ISNULL(ska.AssignmentEndDate, ska.AssignmentStartDate) BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, GETDATE())
  JOIN RDS.DimPeople rdp
    ON ska.StaffMemberIdentifierState = rdp.K12StaffStaffMemberIdentifierState
    AND IsActiveK12Staff = 1
    AND ISNULL(ska.FirstName, '') = ISNULL(rdp.FirstName, '')
    AND ISNULL(ska.MiddleName, '') = ISNULL(rdp.MiddleName, '')
    AND ISNULL(ska.LastOrSurname, 'MISSING') = rdp.LastOrSurname
    AND ISNULL(ska.Birthdate, '1/1/1900') = ISNULL(rdp.Birthdate, '1/1/1900')
	LEFT JOIN RDS.vwDimK12StaffCategories rdksc 
			ON rsy.SchoolYear = rdksc.SchoolYear
			AND ISNULL(ska.K12StaffClassification, 'MISSING') = ISNULL(rdksc.K12StaffClassificationMap, rdksc.K12StaffClassificationCode)
			AND ISNULL(ska.SpecialEducationStaffCategory, 'MISSING') = ISNULL(rdksc.SpecialEducationSupportServicesCategoryMap, rdksc.SpecialEducationSupportServicesCategoryCode)
			AND ISNULL(ska.TitleIProgramStaffCategory, 'MISSING') = ISNULL(rdksc.TitleIProgramStaffCategoryMap, rdksc.TitleIProgramStaffCategoryCode)
			AND ISNULL(ska.MigrantEducationProgramStaffCategory, 'MISSING') = ISNULL(rdksc.MigrantEducationProgramStaffCategoryMap, rdksc.MigrantEducationProgramStaffCategoryCode)
			AND ISNULL(ska.ProfessionalEducationalJobClassification, 'MISSING') = ISNULL(rdksc.ProfessionalEducationalJobClassificationMap, rdksc.ProfessionalEducationalJobClassificationCode)
  LEFT JOIN RDS.vwDimK12StaffStatuses rdkss
			ON rsy.SchoolYear = rdkss.SchoolYear
			AND ISNULL(ska.SpecialEducationAgeGroupTaught, 'MISSING') = ISNULL(rdkss.SpecialEducationAgeGroupTaughtMap, rdkss.SpecialEducationAgeGroupTaughtCode)
			AND ISNULL(ska.EdFactsTeacherOutOfFieldStatus, 'MISSING') = ISNULL(rdkss.EdFactsTeacherOutOfFieldStatusMap, rdkss.EdFactsTeacherOutOfFieldStatusCode)
			AND ISNULL(ska.EdFactsTeacherInexperiencedStatus, 'MISSING') = ISNULL(rdkss.EdFactsTeacherInexperiencedStatusMap, rdkss.EdFactsTeacherInexperiencedStatusCode)
			AND ISNULL(ska.ParaprofessionalQualificationStatus, 'MISSING') = ISNULL(rdkss.ParaprofessionalQualificationStatusMap, rdkss.ParaprofessionalQualificationStatusCode)
			AND ISNULL(CAST(ska.HighlyQualifiedTeacherIndicator AS SMALLINT), -1) = ISNULL(rdkss.HighlyQualifiedTeacherIndicatorMap, -1)
			AND ISNULL(ska.SpecialEducationTeacherQualificationStatus, 'MISSING') = ISNULL(rdkss.SpecialEducationTeacherQualificationStatusMap, rdkss.SpecialEducationTeacherQualificationStatusCode)
			AND ISNULL(ska.EdFactsCertificationStatus, 'MISSING') = ISNULL(rdkss.EdFactsCertificationStatusMap, rdkss.EdFactsCertificationStatusCode)  
			AND ISNULL(ska.SpecialEducationRelatedServicesPersonnel, 'MISSING') = ISNULL(rdkss.SpecialEducationRelatedServicesPersonnelMap, rdkss.SpecialEducationRelatedServicesPersonnelCode)
			AND ISNULL(ska.CTEInstructorIndustryCertification, 'MISSING') = ISNULL(rdkss.CTEInstructorIndustryCertificationMap, rdkss.CTEInstructorIndustryCertificationCode)
			AND ISNULL(ska.SpecialEducationParaprofessional, 'MISSING') = ISNULL(rdkss.SpecialEducationParaprofessionalMap, rdkss.SpecialEducationParaprofessionalCode)
			AND ISNULL(ska.SpecialEducationTeacher, 'MISSING') = ISNULL(rdkss.SpecialEducationTeacherMap, rdkss.SpecialEducationTeacherCode)
  LEFT JOIN RDS.vwDimTeachingCredentialStatuses rdtcs
            ON rsy.SchoolYear = rdtcs.SchoolYear
            AND ISNULL(ska.TeachingCredentialType, 'MISSING') = ISNULL(rdtcs.TeachingCredentialTypeMap, rdtcs.TeachingCredentialTypeCode)
            AND ISNULL(ska.TeachingCredentialBasis, 'MISSING') = ISNULL(rdtcs.TeachingCredentialBasisMap, rdtcs.TeachingCredentialBasisCode)
  LEFT JOIN RDS.DimScedCodes rdsc
    ON ska.ScedCourseCode = rdsc.ScedCourseCode
  LEFT JOIN RDS.DimOnetSocOccupationTypes rdonet
    ON ska.OnetSocOccupationType = rdonet.OnetSocOccupationTypeCode
  LEFT JOIN RDS.vwDimK12EmploymentStatuses rdkes
    ON rsy.SchoolYear = rdkes.SchoolYear
    AND ISNULL(ska.EmploymentStatusCode, 'MISSING') = ISNULL(rdkes.EmploymentStatusMap, rdkes.EmploymentStatusCode)
    AND ISNULL(ska.EmploymentSeparationReasonCode, 'MISSING') = ISNULL(rdkes.EmploymentSeparationReasonMap, rdkes.EmploymentSeparationReasonCode)
    AND ISNULL(ska.TitleITargetedAssistanceStaffFundedCode, 'MISSING') = ISNULL(rdkes.TitleITargetedAssistanceStaffFundedMap, rdkes.TitleITargetedAssistanceStaffFundedCode)
    AND ISNULL(ska.MEPPersonnelIndicatorCode, 'MISSING') = ISNULL(rdkes.MEPPersonnelIndicatorMap, rdkes.MEPPersonnelIndicatorCode)
  LEFT JOIN RDS.DimK12JobPositions rdkp
    ON ska.JobPositionIdentifierSea = rdkp.JobPositionIdentifierSea
  LEFT JOIN RDS.DimK12Jobs rdkj
    ON ska.JobTitle = rdkj.JobTitle
  LEFT JOIN RDS.DimDates rda
    ON ska.AssignmentStartDate = rda.DateValue
  LEFT JOIN RDS.DimDates rde
    ON ska.AssignmentEndDate = rde.DateValue
  LEFT JOIN RDS.DimDates rdes
    ON ska.EmploymentStartDate = rdes.DateValue
  LEFT JOIN RDS.DimDates rdee
    ON ska.EmploymentEndDate = rdee.DateValue
  LEFT JOIN RDS.DimDates rdh
    ON ska.HireDate = rdh.DateValue
  LEFT JOIN RDS.DimLanguages rdi
    ON ISNULL(ska.InstructionalLanguage, 'MISSING') = rdi.Iso6392LanguageCodeCode
  LEFT JOIN RDS.vwDimK12StaffAssignmentStatuses rdkas
    ON ska.SchoolYear = rdkas.SchoolYear
	AND ISNULL(ska.ItinerantTeacherCode, 'MISSING') = ISNULL(rdkas.ItinerantTeacherMap, rdkas.ItinerantTeacherCode)
    AND ISNULL(ska.ClassroomPositionTypeCode, 'MISSING') = ISNULL(rdkas.ClassroomPositionTypeMap, rdkas.ClassroomPositionTypeCode)
    AND ISNULL(ska.PrimaryAssignmentIndicatorCode, 'MISSING') = ISNULL(rdkas.PrimaryAssignmentIndicatorMap, rdkas.PrimaryAssignmentIndicatorCode)
  LEFT JOIN RDS.vwDimK12Demographics rdkd
    ON ska.SchoolYear = rdkd.SchoolYear
	AND ISNULL(ska.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)
  LEFT JOIN RDS.DimEmployers rdemp
    ON ska.EmployerOrganizationIdentifierSea = rdemp.EmployerOrganizationIdentifierSea
    AND ISNULL(ska.AssignmentEndDate, ska.AssignmentStartDate) BETWEEN rdemp.RecordStartDateTime AND ISNULL(rdemp.RecordEndDateTime, GETDATE())
  LEFT JOIN RDS.DimDataCollections rddc
		ON ska.DataCollectionName = rddc.DataCollectionName
  LEFT JOIN RDS.DimLeaJobClassifications rdljc
    ON ISNULL(ska.Lea_EducationJobTypeCode, 'MISSING') = ISNULL(rdljc.EducationJobTypeCode, 'MISSING')
    AND ISNULL(ska.Lea_LocalJobFunctionCode, 'MISSING') = ISNULL(rdljc.LocalJobFunctionCode, 'MISSING')
    AND ISNULL(ska.Lea_LocalJobCategoryCode, 'MISSING') = ISNULL(rdljc.LocalJobCategoryCode, 'MISSING')
  LEFT JOIN RDS.DimSeaJobClassifications rdsljc
    ON ISNULL(ska.SEA_EducationJobTypeCode, 'MISSING') = ISNULL(rdsljc.EducationJobTypeCode, 'MISSING')
    AND ISNULL(ska.SEA_LocalJobFunctionCode, 'MISSING') = ISNULL(rdsljc.LocalJobFunctionCode, 'MISSING')
    AND ISNULL(ska.SEA_LocalJobCategoryCode, 'MISSING') = ISNULL(rdsljc.LocalJobCategoryCode, 'MISSING')
END
GO

PRINT N'Section 4 complete.';
PRINT N'';


/* ============================================================
   FINAL STATUS
   ============================================================ */
PRINT N'======================================================================';
PRINT N'  CEDS Data Warehouse upgrade from V14.1.0.0 to V14.2.0.0 complete.';
PRINT N'';
PRINT N'  NEXT STEPS:';
PRINT N'  * Load Years of Total Experience into Staging.K12StaffAssignment as part';
PRINT N'    of your K12 staff assignment collection, then run';
PRINT N'    Staging.[Staging-to-FactK12StaffAssignments] to populate the new';
PRINT N'    RDS.FactK12StaffAssignments.YearsOfTotalExperience measure.';
PRINT N'  * Rows loaded before this upgrade retain the (0) default for the new';
PRINT N'    column; reload them if historical experience values are required.';
PRINT N'======================================================================';
GO
