/*
    CEDS Data Warehouse Upgrade Script
    -----------------------------------
    From: Version 14.0.0.0
    To:   Version 14.1.0.0

    Copyright 2026 Common Education Data Standards
    Licensed under the Apache License, Version 2.0

    PURPOSE
    -------
    This script upgrades an existing CEDS Data Warehouse V14.0.0.0 database to
    V14.1.0.0 in-place, preserving all existing data.  It is idempotent: every
    statement is guarded so the script can be re-run safely.

    Run this script against your V14.0.0.0 database (not master).
    Example: USE [CEDS-Data-Warehouse-V14-0-0-0]; GO

    WHAT THIS SCRIPT DOES (in order)
    --------------------------------
    SECTION 1 - Create new dimension tables (must exist before the FKs that
                reference them are added):
                  RDS.DimK12JobPositionStatuses
                  RDS.DimStaffEvaluationScales

    SECTION 2 - Create new bridge table:
                  RDS.BridgeCredentialAwardRaces

    SECTION 3 - Dimension table changes (new columns, nullability, defaults):
                  RDS.DimCipCodes, RDS.DimCredentialAwards,
                  RDS.DimCredentialDefinitions, RDS.DimFacilities,
                  RDS.DimFacilityStatuses, RDS.DimFacilityUtilization,
                  RDS.DimK12StaffAssignmentStatuses,
                  RDS.DimProfessionalDevelopmentActivities,
                  RDS.DimSeaJobClassifications

    SECTION 4 - Staging table changes:
                  Staging.OrganizationAddress (AddressCountyName)

    SECTION 5 - Fact column renames (K12StaffPerson / K12StaffMember id columns -> K12Staff):
                  RDS.FactK12StaffAssessments, RDS.FactK12StaffCourseSections

    SECTION 6 - Fact table changes (new columns, type widenings, FKs, indexes):
                  RDS.FactK12StaffAssessments, RDS.FactK12StaffAssignments,
                  RDS.FactK12StaffCourseSections, RDS.FactK12StaffEmployments,
                  RDS.FactK12StaffEvaluationParts,
                  RDS.FactK12StaffProfessionalDevelopmentSessions

    SECTION 7 - RDS.FactDirectory (new status FKs + nullability/default normalization)

    NOTES
    -----
    * Column / table descriptive metadata (sp_addextendedproperty) is applied by
      the SSDT project publish, consistent with the V13->V14 upgrade script; this
      script makes structural changes only.
    * The V14.0.0.0 file BridgeK12SeaJobCataloguesSeaFinancialAccountClassifications.sql
      was renamed to ...Catalogue... (singular) in V14.1.0.0.  The table inside was
      already named [RDS].[BridgeK12SeaJobCatalogueSeaFinancialAccountClassifications],
      so this is a project-file rename only -- no database change is required.

    *** BACK UP YOUR DATABASE BEFORE RUNNING THIS SCRIPT ***
*/

USE [CEDS-Data-Warehouse-V14-0-0-0]

SET NOCOUNT ON;
SET XACT_ABORT ON;
GO

PRINT N'';
PRINT N'======================================================================';
PRINT N'  CEDS Data Warehouse Upgrade: V14.0.0.0 --> V14.1.0.0';
PRINT N'======================================================================';
PRINT N'';


/* ============================================================
   SECTION 1 - CREATE NEW DIMENSION TABLES
   ============================================================ */
PRINT N'Section 1: Creating new dimension tables...';

PRINT N'  RDS.DimK12JobPositionStatuses...';
IF OBJECT_ID('RDS.DimK12JobPositionStatuses', 'U') IS NULL
    CREATE TABLE [RDS].[DimK12JobPositionStatuses] (
        [DimK12JobPositionStatusId] INT IDENTITY (1, 1) NOT NULL,
        [JobPositionStatusCode] NVARCHAR(50) NULL,
        [JobPositionStatusDescription] NVARCHAR(200) NULL,
        [JobPositionStatusCancelledReasonCode] NVARCHAR(50) NULL,
        [JobPositionStatusCancelledReasonDescription] NVARCHAR(200) NULL,
        CONSTRAINT [PK_DimK12JobPositionStatuses] PRIMARY KEY CLUSTERED ([DimK12JobPositionStatusId] ASC)
    );
GO

PRINT N'  RDS.DimStaffEvaluationScales...';
IF OBJECT_ID('RDS.DimStaffEvaluationScales', 'U') IS NULL
    CREATE TABLE [RDS].[DimStaffEvaluationScales] (
        [DimStaffEvaluationScaleId] INT IDENTITY (1, 1) NOT NULL,
        [StaffEvaluationScaleCode] NVARCHAR(50) NOT NULL,
        [StaffEvaluationScaleDescription] NVARCHAR(200) NOT NULL,
        CONSTRAINT [PK_DimStaffEvaluationScales] PRIMARY KEY CLUSTERED ([DimStaffEvaluationScaleId] ASC)
    );
GO

PRINT N'Section 1 complete.';
PRINT N'';


/* ============================================================
   SECTION 2 - CREATE NEW BRIDGE TABLE
   ============================================================ */
PRINT N'Section 2: Creating RDS.BridgeCredentialAwardRaces...';

IF OBJECT_ID('RDS.BridgeCredentialAwardRaces', 'U') IS NULL
    CREATE TABLE [RDS].[BridgeCredentialAwardRaces]
    (
        [BridgeCredentialAwardRaceId] int IDENTITY (1, 1) NOT NULL,
        [FactCredentialAwardId] int NULL,
        [RaceId] int NULL,
        CONSTRAINT [PK_BridgeCredentialAwardRaces] PRIMARY KEY CLUSTERED ([BridgeCredentialAwardRaceId] ASC),
        CONSTRAINT [FK_BridgeCredentialAwardRaces_FactCredentialAwardId] FOREIGN KEY ([FactCredentialAwardId]) REFERENCES [RDS].[FactCredentialAwards] ([FactCredentialAwardId]) ON DELETE No Action ON UPDATE No Action,
        CONSTRAINT [FK_BridgeCredentialAwardRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId]) ON DELETE No Action ON UPDATE No Action
    );
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('RDS.BridgeCredentialAwardRaces'))
   AND NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IXFK_BridgeCredentialAwardRaces_FactCredentialAwardId' AND object_id = OBJECT_ID('RDS.BridgeCredentialAwardRaces'))
    CREATE NONCLUSTERED INDEX [IXFK_BridgeCredentialAwardRaces_FactCredentialAwardId]
        ON [RDS].[BridgeCredentialAwardRaces] ([FactCredentialAwardId] ASC);
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('RDS.BridgeCredentialAwardRaces'))
   AND NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IXFK_BridgeCredentialAwardRaces_RaceId' AND object_id = OBJECT_ID('RDS.BridgeCredentialAwardRaces'))
    CREATE NONCLUSTERED INDEX [IXFK_BridgeCredentialAwardRaces_RaceId]
        ON [RDS].[BridgeCredentialAwardRaces] ([RaceId] ASC);
GO

PRINT N'Section 2 complete.';
PRINT N'';


/* ============================================================
   SECTION 3 - DIMENSION TABLE CHANGES
   ============================================================ */
PRINT N'Section 3: Dimension table changes...';

-- 3a. RDS.DimCipCodes : Career Cluster (001288) + Perkins Nontraditional Type (002115)
PRINT N'  RDS.DimCipCodes -> CareerCluster / PerkinsNontraditionalType columns...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimCipCodes') AND name = 'CareerClusterCode')
    ALTER TABLE [RDS].[DimCipCodes] ADD [CareerClusterCode] NVARCHAR(50) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimCipCodes') AND name = 'CareerClusterDescription')
    ALTER TABLE [RDS].[DimCipCodes] ADD [CareerClusterDescription] NVARCHAR(200) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimCipCodes') AND name = 'PerkinsNontraditionalTypeCode')
    ALTER TABLE [RDS].[DimCipCodes] ADD [PerkinsNontraditionalTypeCode] NVARCHAR(50) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimCipCodes') AND name = 'PerkinsNontraditionalTypeDescription')
    ALTER TABLE [RDS].[DimCipCodes] ADD [PerkinsNontraditionalTypeDescription] NVARCHAR(200) NULL;
GO

-- 3b. RDS.DimCredentialAwards : CredentialAwardIdentifierState
PRINT N'  RDS.DimCredentialAwards -> CredentialAwardIdentifierState...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimCredentialAwards') AND name = 'CredentialAwardIdentifierState')
    ALTER TABLE [RDS].[DimCredentialAwards] ADD [CredentialAwardIdentifierState] VARCHAR(512) NULL;
GO

-- 3c. RDS.DimCredentialDefinitions : relax NOT NULL -> NULL, add Teaching Credential Type columns
PRINT N'  RDS.DimCredentialDefinitions -> relaxing NOT NULL columns to NULL...';
ALTER TABLE [RDS].[DimCredentialDefinitions] ALTER COLUMN [CredentialTypeCode] NVARCHAR(50) NULL;
ALTER TABLE [RDS].[DimCredentialDefinitions] ALTER COLUMN [CredentialTypeDescription] NVARCHAR(200) NULL;
ALTER TABLE [RDS].[DimCredentialDefinitions] ALTER COLUMN [CredentialDefinitionStatusTypeCode] NVARCHAR(50) NULL;
ALTER TABLE [RDS].[DimCredentialDefinitions] ALTER COLUMN [CredentialDefinitionStatusTypeDescription] NVARCHAR(200) NULL;
ALTER TABLE [RDS].[DimCredentialDefinitions] ALTER COLUMN [CredentialDefinitionIntendedPurposeTypeCode] NVARCHAR(50) NULL;
ALTER TABLE [RDS].[DimCredentialDefinitions] ALTER COLUMN [CredentialDefinitionIntendedPurposeTypeDescription] NVARCHAR(200) NULL;
ALTER TABLE [RDS].[DimCredentialDefinitions] ALTER COLUMN [CredentialDefinitionAssessmentMethodTypeCode] NVARCHAR(50) NULL;
ALTER TABLE [RDS].[DimCredentialDefinitions] ALTER COLUMN [CredentialDefinitionAssessmentMethodTypeDescription] NVARCHAR(200) NULL;
ALTER TABLE [RDS].[DimCredentialDefinitions] ALTER COLUMN [CTDLAudienceLevelTypeCode] NVARCHAR(50) NULL;
ALTER TABLE [RDS].[DimCredentialDefinitions] ALTER COLUMN [CTDLAudienceLevelTypeDescription] NVARCHAR(200) NULL;
ALTER TABLE [RDS].[DimCredentialDefinitions] ALTER COLUMN [CredentialDefinitionTerminalDegreeIndicatorCode] NVARCHAR(50) NULL;
ALTER TABLE [RDS].[DimCredentialDefinitions] ALTER COLUMN [CredentialDefinitionTerminalDegreeIndicatorDescription] NVARCHAR(200) NULL;
ALTER TABLE [RDS].[DimCredentialDefinitions] ALTER COLUMN [CredentialDefinitionScedCode] NVARCHAR(50) NULL;
ALTER TABLE [RDS].[DimCredentialDefinitions] ALTER COLUMN [CredentialDefinitionLowGradeLevelCode] NVARCHAR(50) NULL;
ALTER TABLE [RDS].[DimCredentialDefinitions] ALTER COLUMN [CredentialDefinitionHighGradeLevelCode] NVARCHAR(50) NULL;
GO

PRINT N'  RDS.DimCredentialDefinitions -> TeachingCredentialType columns...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimCredentialDefinitions') AND name = 'TeachingCredentialTypeCode')
    ALTER TABLE [RDS].[DimCredentialDefinitions] ADD [TeachingCredentialTypeCode] NVARCHAR(50) NULL CONSTRAINT [DF_DimCredentialDefinitions_TeachingCredentialTypeCode] DEFAULT ('MISSING');
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimCredentialDefinitions') AND name = 'TeachingCredentialTypeDescription')
    ALTER TABLE [RDS].[DimCredentialDefinitions] ADD [TeachingCredentialTypeDescription] NVARCHAR(200) NULL CONSTRAINT [DF_DimCredentialDefinitions_TeachingCredentialTypeDescription] DEFAULT ('MISSING');
GO

-- 3d. RDS.DimFacilities : StateLicensedFacilityCapacity (000865)
PRINT N'  RDS.DimFacilities -> StateLicensedFacilityCapacity...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimFacilities') AND name = 'StateLicensedFacilityCapacity')
    ALTER TABLE [RDS].[DimFacilities] ADD [StateLicensedFacilityCapacity] INT NULL;
GO

-- 3e. RDS.DimFacilityStatuses : add DEFAULT('MISSING') to existing columns + Facility Ownership Indicator (001906)
PRINT N'  RDS.DimFacilityStatuses -> default constraints + FacilityOwnershipIndicator...';
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE name = 'DF_DimFacilityStatuses_FacilityLeaseAmountCategoryCode')
    ALTER TABLE [RDS].[DimFacilityStatuses] ADD CONSTRAINT [DF_DimFacilityStatuses_FacilityLeaseAmountCategoryCode] DEFAULT ('MISSING') FOR [FacilityLeaseAmountCategoryCode];
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE name = 'DF_DimFacilityStatuses_FacilityLeaseAmountCategoryDescription')
    ALTER TABLE [RDS].[DimFacilityStatuses] ADD CONSTRAINT [DF_DimFacilityStatuses_FacilityLeaseAmountCategoryDescription] DEFAULT ('MISSING') FOR [FacilityLeaseAmountCategoryDescription];
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE name = 'DF_DimFacilityStatuses_FacilityLeaseTypeCode')
    ALTER TABLE [RDS].[DimFacilityStatuses] ADD CONSTRAINT [DF_DimFacilityStatuses_FacilityLeaseTypeCode] DEFAULT ('MISSING') FOR [FacilityLeaseTypeCode];
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE name = 'DF_DimFacilityStatuses_FacilityLeaseTypeDescription')
    ALTER TABLE [RDS].[DimFacilityStatuses] ADD CONSTRAINT [DF_DimFacilityStatuses_FacilityLeaseTypeDescription] DEFAULT ('MISSING') FOR [FacilityLeaseTypeDescription];
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE name = 'DF_DimFacilityStatuses_FacilityMortgageInterestTypeCode')
    ALTER TABLE [RDS].[DimFacilityStatuses] ADD CONSTRAINT [DF_DimFacilityStatuses_FacilityMortgageInterestTypeCode] DEFAULT ('MISSING') FOR [FacilityMortgageInterestTypeCode];
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE name = 'DF_DimFacilityStatuses_FacilityMortgageInterestTypeDescription')
    ALTER TABLE [RDS].[DimFacilityStatuses] ADD CONSTRAINT [DF_DimFacilityStatuses_FacilityMortgageInterestTypeDescription] DEFAULT ('MISSING') FOR [FacilityMortgageInterestTypeDescription];
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE name = 'DF_DimFacilityStatuses_FacilityMortgageTypeCode')
    ALTER TABLE [RDS].[DimFacilityStatuses] ADD CONSTRAINT [DF_DimFacilityStatuses_FacilityMortgageTypeCode] DEFAULT ('MISSING') FOR [FacilityMortgageTypeCode];
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE name = 'DF_DimFacilityStatuses_FacilityMortgageTypeDescription')
    ALTER TABLE [RDS].[DimFacilityStatuses] ADD CONSTRAINT [DF_DimFacilityStatuses_FacilityMortgageTypeDescription] DEFAULT ('MISSING') FOR [FacilityMortgageTypeDescription];
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimFacilityStatuses') AND name = 'FacilityOwnershipIndicatorCode')
    ALTER TABLE [RDS].[DimFacilityStatuses] ADD [FacilityOwnershipIndicatorCode] NVARCHAR(50) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimFacilityStatuses') AND name = 'FacilityOwnershipIndicatorDescription')
    ALTER TABLE [RDS].[DimFacilityStatuses] ADD [FacilityOwnershipIndicatorDescription] NVARCHAR(200) NULL;
GO

-- 3f. RDS.DimFacilityUtilization : add DEFAULT('MISSING') + Building Community Use Space Type (001855)
PRINT N'  RDS.DimFacilityUtilization -> default constraints + BuildingCommunityUseSpaceType...';
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE name = 'DF_DimFacilityUtilization_BuildingUseTypeCode')
    ALTER TABLE [RDS].[DimFacilityUtilization] ADD CONSTRAINT [DF_DimFacilityUtilization_BuildingUseTypeCode] DEFAULT ('MISSING') FOR [BuildingUseTypeCode];
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE name = 'DF_DimFacilityUtilization_BuildingUseTypeDescription')
    ALTER TABLE [RDS].[DimFacilityUtilization] ADD CONSTRAINT [DF_DimFacilityUtilization_BuildingUseTypeDescription] DEFAULT ('MISSING') FOR [BuildingUseTypeDescription];
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimFacilityUtilization') AND name = 'BuildingCommunityUseSpaceTypeCode')
    ALTER TABLE [RDS].[DimFacilityUtilization] ADD [BuildingCommunityUseSpaceTypeCode] NVARCHAR(50) NOT NULL CONSTRAINT [DF_DimFacilityUtilization_BuildingCommunityUseSpaceTypeCode] DEFAULT ('MISSING');
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimFacilityUtilization') AND name = 'BuildingCommunityUseSpaceTypeDescription')
    ALTER TABLE [RDS].[DimFacilityUtilization] ADD [BuildingCommunityUseSpaceTypeDescription] NVARCHAR(300) NOT NULL CONSTRAINT [DF_DimFacilityUtilization_BuildingCommunityUseSpaceTypeDescription] DEFAULT ('MISSING');
GO

-- 3g. RDS.DimK12StaffAssignmentStatuses : Migrant Education Program Session Type (NOT NULL; backfill MISSING)
PRINT N'  RDS.DimK12StaffAssignmentStatuses -> MigrantEducationProgramSessionType columns...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimK12StaffAssignmentStatuses') AND name = 'MigrantEducationProgramSessionTypeCode')
    ALTER TABLE [RDS].[DimK12StaffAssignmentStatuses] ADD [MigrantEducationProgramSessionTypeCode] VARCHAR(50) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimK12StaffAssignmentStatuses') AND name = 'MigrantEducationProgramSessionTypeDescription')
    ALTER TABLE [RDS].[DimK12StaffAssignmentStatuses] ADD [MigrantEducationProgramSessionTypeDescription] VARCHAR(200) NULL;
GO
UPDATE [RDS].[DimK12StaffAssignmentStatuses] SET [MigrantEducationProgramSessionTypeCode] = 'MISSING' WHERE [MigrantEducationProgramSessionTypeCode] IS NULL;
UPDATE [RDS].[DimK12StaffAssignmentStatuses] SET [MigrantEducationProgramSessionTypeDescription] = 'MISSING' WHERE [MigrantEducationProgramSessionTypeDescription] IS NULL;
GO
ALTER TABLE [RDS].[DimK12StaffAssignmentStatuses] ALTER COLUMN [MigrantEducationProgramSessionTypeCode] VARCHAR(50) NOT NULL;
ALTER TABLE [RDS].[DimK12StaffAssignmentStatuses] ALTER COLUMN [MigrantEducationProgramSessionTypeDescription] VARCHAR(200) NOT NULL;
GO

-- 3h. RDS.DimProfessionalDevelopmentActivities : approval start / end dates
PRINT N'  RDS.DimProfessionalDevelopmentActivities -> ProfessionalDevelopmentActivityApproval dates...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimProfessionalDevelopmentActivities') AND name = 'ProfessionalDevelopmentActivityApprovalStartDate')
    ALTER TABLE [RDS].[DimProfessionalDevelopmentActivities] ADD [ProfessionalDevelopmentActivityApprovalStartDate] DATE NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimProfessionalDevelopmentActivities') AND name = 'ProfessionalDevelopmentActivityApprovalEndDate')
    ALTER TABLE [RDS].[DimProfessionalDevelopmentActivities] ADD [ProfessionalDevelopmentActivityApprovalEndDate] DATE NULL;
GO

-- 3i. RDS.DimSeaJobClassifications : Evaluation Required Indicator
PRINT N'  RDS.DimSeaJobClassifications -> EvaluationRequiredIndicator columns...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimSeaJobClassifications') AND name = 'EvaluationRequiredIndicatorCode')
    ALTER TABLE [RDS].[DimSeaJobClassifications] ADD [EvaluationRequiredIndicatorCode] VARCHAR(50) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.DimSeaJobClassifications') AND name = 'EvaluationRequiredIndicatorDescription')
    ALTER TABLE [RDS].[DimSeaJobClassifications] ADD [EvaluationRequiredIndicatorDescription] VARCHAR(200) NULL;
GO

PRINT N'Section 3 complete.';
PRINT N'';


/* ============================================================
   SECTION 4 - STAGING TABLE CHANGES
   ============================================================ */
PRINT N'Section 4: Staging.OrganizationAddress -> AddressCountyName...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('Staging.OrganizationAddress') AND name = 'AddressCountyName')
    ALTER TABLE [Staging].[OrganizationAddress] ADD [AddressCountyName] NVARCHAR(30) NULL;
GO
PRINT N'Section 4 complete.';
PRINT N'';


/* ============================================================
   SECTION 5 - FACT COLUMN RENAMES (data-preserving via sp_rename)
   ============================================================
   The columns, their DEFAULT constraints, FKs and indexes are renamed
   in place; data is preserved.  Each rename is guarded so re-running is safe.
   ============================================================ */
PRINT N'Section 5: Renaming staff person/member columns to K12Staff*...';

-- 5a. RDS.FactK12StaffAssessments : K12StaffPersonId -> K12StaffId, K12StaffPerson_CurrentId -> K12Staff_CurrentId
PRINT N'  RDS.FactK12StaffAssessments...';
IF EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffAssessments') AND name = 'K12StaffPersonId')
   AND NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffAssessments') AND name = 'K12StaffId')
    EXEC sp_rename 'RDS.FactK12StaffAssessments.K12StaffPersonId', 'K12StaffId', 'COLUMN';
GO
IF EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffAssessments') AND name = 'K12StaffPerson_CurrentId')
   AND NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffAssessments') AND name = 'K12Staff_CurrentId')
    EXEC sp_rename 'RDS.FactK12StaffAssessments.K12StaffPerson_CurrentId', 'K12Staff_CurrentId', 'COLUMN';
GO
IF EXISTS (SELECT 1 FROM sys.default_constraints WHERE name = 'DF_FactK12StaffAssessments_K12StaffPersonId')
    EXEC sp_rename 'RDS.DF_FactK12StaffAssessments_K12StaffPersonId', 'DF_FactK12StaffAssessments_K12StaffId', 'OBJECT';
IF EXISTS (SELECT 1 FROM sys.default_constraints WHERE name = 'DF_FactK12StaffAssessments_K12StaffPerson_CurrentId')
    EXEC sp_rename 'RDS.DF_FactK12StaffAssessments_K12StaffPerson_CurrentId', 'DF_FactK12StaffAssessments_K12Staff_CurrentId', 'OBJECT';
GO
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffAssessments_K12StaffPersonId')
    EXEC sp_rename 'RDS.FK_FactK12StaffAssessments_K12StaffPersonId', 'FK_FactK12StaffAssessments_K12StaffId', 'OBJECT';
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffAssessments_K12StaffPerson_CurrentId')
    EXEC sp_rename 'RDS.FK_FactK12StaffAssessments_K12StaffPerson_CurrentId', 'FK_FactK12StaffAssessments_K12Staff_CurrentId', 'OBJECT';
GO
-- IXFK_FactK12StaffAssessments_DimPeople keeps its name (column reference follows the rename automatically).
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IXFK_FactK12StaffAssessments_K12StaffPerson_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffAssessments'))
    EXEC sp_rename 'RDS.FactK12StaffAssessments.IXFK_FactK12StaffAssessments_K12StaffPerson_CurrentId', 'IXFK_FactK12StaffAssessments_K12Staff_CurrentId', 'INDEX';
GO

-- 5b. RDS.FactK12StaffCourseSections : K12StaffMemberId -> K12StaffId, K12StaffMember_CurrentId -> K12Staff_CurrentId
PRINT N'  RDS.FactK12StaffCourseSections...';
IF EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffCourseSections') AND name = 'K12StaffMemberId')
   AND NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffCourseSections') AND name = 'K12StaffId')
    EXEC sp_rename 'RDS.FactK12StaffCourseSections.K12StaffMemberId', 'K12StaffId', 'COLUMN';
GO
IF EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffCourseSections') AND name = 'K12StaffMember_CurrentId')
   AND NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffCourseSections') AND name = 'K12Staff_CurrentId')
    EXEC sp_rename 'RDS.FactK12StaffCourseSections.K12StaffMember_CurrentId', 'K12Staff_CurrentId', 'COLUMN';
GO
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffCourseSections_K12StaffMemberId')
    EXEC sp_rename 'RDS.FK_FactK12StaffCourseSections_K12StaffMemberId', 'FK_FactK12StaffCourseSections_K12StaffId', 'OBJECT';
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffCourseSections_K12StaffMember_CurrentId')
    EXEC sp_rename 'RDS.FK_FactK12StaffCourseSections_K12StaffMember_CurrentId', 'FK_FactK12StaffCourseSections_K12Staff_CurrentId', 'OBJECT';
GO
-- IXFK_FactK12StaffCourseSections_DimPeople keeps its name (column reference follows the rename automatically).
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IXFK_FactK12StaffCourseSections_K12StaffMember_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffCourseSections'))
    EXEC sp_rename 'RDS.FactK12StaffCourseSections.IXFK_FactK12StaffCourseSections_K12StaffMember_CurrentId', 'IXFK_FactK12StaffCourseSections_K12Staff_CurrentId', 'INDEX';
GO
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_FactK12StaffCourseSections_K12StaffMemberId' AND object_id = OBJECT_ID('RDS.FactK12StaffCourseSections'))
    EXEC sp_rename 'RDS.FactK12StaffCourseSections.IX_FactK12StaffCourseSections_K12StaffMemberId', 'IX_FactK12StaffCourseSections_K12StaffId', 'INDEX';
GO

PRINT N'Section 5 complete.';
PRINT N'';


/* ============================================================
   SECTION 6 - FACT TABLE CHANGES (new columns, types, FKs, indexes)
   ============================================================ */
PRINT N'Section 6: Fact table column / FK / index additions...';

-- 6a. RDS.FactK12StaffAssessments : K12JobPositionStatusId + FK + index
PRINT N'  RDS.FactK12StaffAssessments -> K12JobPositionStatusId...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffAssessments') AND name = 'K12JobPositionStatusId')
    ALTER TABLE [RDS].[FactK12StaffAssessments] ADD [K12JobPositionStatusId] INT NOT NULL CONSTRAINT [DF_FactK12StaffAssessments_K12JobPositionStatusId] DEFAULT ((-1));
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffAssessments_K12JobPositionStatusId')
    ALTER TABLE [RDS].[FactK12StaffAssessments] ADD CONSTRAINT [FK_FactK12StaffAssessments_K12JobPositionStatusId] FOREIGN KEY ([K12JobPositionStatusId]) REFERENCES [RDS].[DimK12JobPositionStatuses] ([DimK12JobPositionStatusId]) ON DELETE No Action ON UPDATE No Action;
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IXFK_FactK12StaffAssessments_DimK12JobPositionStatuses' AND object_id = OBJECT_ID('RDS.FactK12StaffAssessments'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimK12JobPositionStatuses] ON [RDS].[FactK12StaffAssessments] ([K12JobPositionStatusId] ASC);
GO

-- 6b. RDS.FactK12StaffAssignments : 5 new columns + FKs
PRINT N'  RDS.FactK12StaffAssignments -> charter / program / financial columns...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffAssignments') AND name = 'CharterSchoolAuthorizerId')
    ALTER TABLE [RDS].[FactK12StaffAssignments] ADD [CharterSchoolAuthorizerId] INT NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffAssignments') AND name = 'CharterSchoolManagementOrganizationId')
    ALTER TABLE [RDS].[FactK12StaffAssignments] ADD [CharterSchoolManagementOrganizationId] INT NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffAssignments') AND name = 'JobPositionStatusDateId')
    ALTER TABLE [RDS].[FactK12StaffAssignments] ADD [JobPositionStatusDateId] INT NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffAssignments') AND name = 'AssignmentProgramTypeId')
    ALTER TABLE [RDS].[FactK12StaffAssignments] ADD [AssignmentProgramTypeId] INT NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffAssignments') AND name = 'SeaFinancialExpenditureClassificationId')
    ALTER TABLE [RDS].[FactK12StaffAssignments] ADD [SeaFinancialExpenditureClassificationId] INT NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffAssignments_JobPositionStatusDateId')
    ALTER TABLE [RDS].[FactK12StaffAssignments] ADD CONSTRAINT [FK_FactK12StaffAssignments_JobPositionStatusDateId] FOREIGN KEY ([JobPositionStatusDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffAssignments_AssignmentProgramTypeId')
    ALTER TABLE [RDS].[FactK12StaffAssignments] ADD CONSTRAINT [FK_FactK12StaffAssignments_AssignmentProgramTypeId] FOREIGN KEY ([AssignmentProgramTypeId]) REFERENCES [RDS].[DimProgramTypes] ([DimProgramTypeId]) ON DELETE No Action ON UPDATE No Action;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffAssignments_SeaFinancialExpenditureClassificationId')
    ALTER TABLE [RDS].[FactK12StaffAssignments] ADD CONSTRAINT [FK_FactK12StaffAssignments_SeaFinancialExpenditureClassificationId] FOREIGN KEY ([SeaFinancialExpenditureClassificationId]) REFERENCES [RDS].[DimSeaFinancialExpenditureClassifications] ([DimSeaFinancialExpenditureClassificationId]) ON DELETE No Action ON UPDATE No Action;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffAssignments_CharterSchoolAuthorizerId')
    ALTER TABLE [RDS].[FactK12StaffAssignments] ADD CONSTRAINT [FK_FactK12StaffAssignments_CharterSchoolAuthorizerId] FOREIGN KEY ([CharterSchoolAuthorizerId]) REFERENCES [RDS].[DimCharterSchoolAuthorizers] ([DimCharterSchoolAuthorizerId]) ON DELETE No Action ON UPDATE No Action;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffAssignments_CharterSchoolManagementOrganizationId')
    ALTER TABLE [RDS].[FactK12StaffAssignments] ADD CONSTRAINT [FK_FactK12StaffAssignments_CharterSchoolManagementOrganizationId] FOREIGN KEY ([CharterSchoolManagementOrganizationId]) REFERENCES [RDS].[DimCharterSchoolManagementOrganizations] ([DimCharterSchoolManagementOrganizationId]) ON DELETE No Action ON UPDATE No Action;
GO

-- 6c. RDS.FactK12StaffCourseSections : K12JobPositionStatusId + FK + index
PRINT N'  RDS.FactK12StaffCourseSections -> K12JobPositionStatusId...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffCourseSections') AND name = 'K12JobPositionStatusId')
    ALTER TABLE [RDS].[FactK12StaffCourseSections] ADD [K12JobPositionStatusId] INT NOT NULL CONSTRAINT [DF_FactK12StaffCourseSections_K12JobPositionStatusId] DEFAULT ((-1));
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffCourseSections_K12JobPositionStatusId')
    ALTER TABLE [RDS].[FactK12StaffCourseSections] ADD CONSTRAINT [FK_FactK12StaffCourseSections_K12JobPositionStatusId] FOREIGN KEY ([K12JobPositionStatusId]) REFERENCES [RDS].[DimK12JobPositionStatuses] ([DimK12JobPositionStatusId]) ON DELETE No Action ON UPDATE No Action;
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IXFK_FactK12StaffCourseSections_DimK12JobPositionStatuses' AND object_id = OBJECT_ID('RDS.FactK12StaffCourseSections'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimK12JobPositionStatuses] ON [RDS].[FactK12StaffCourseSections] ([K12JobPositionStatusId] ASC);
GO

-- 6d. RDS.FactK12StaffEmployments : widen decimals (3,2)->(4,2); K12JobPositionStatusId + FK + index
PRINT N'  RDS.FactK12StaffEmployments -> widen experience decimals + K12JobPositionStatusId...';
ALTER TABLE [RDS].[FactK12StaffEmployments] ALTER COLUMN [YearsOfPriorTeachingExperience] DECIMAL(4,2) NOT NULL;
ALTER TABLE [RDS].[FactK12StaffEmployments] ALTER COLUMN [YearsOfPriorProfessionalExperience] DECIMAL(4,2) NOT NULL;
ALTER TABLE [RDS].[FactK12StaffEmployments] ALTER COLUMN [YearsOfTotalExperience] DECIMAL(4,2) NOT NULL;
ALTER TABLE [RDS].[FactK12StaffEmployments] ALTER COLUMN [YearsofPriorAdultEducationTeachingExperience] DECIMAL(4,2) NOT NULL;
ALTER TABLE [RDS].[FactK12StaffEmployments] ALTER COLUMN [ContractDaysOfServicePerYear] DECIMAL(4,2) NOT NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffEmployments') AND name = 'K12JobPositionStatusId')
    ALTER TABLE [RDS].[FactK12StaffEmployments] ADD [K12JobPositionStatusId] INT NOT NULL CONSTRAINT [DF_FactK12StaffEmployments_K12JobPositionStatusId] DEFAULT ((-1));
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffEmployments_K12JobPositionStatusId')
    ALTER TABLE [RDS].[FactK12StaffEmployments] ADD CONSTRAINT [FK_FactK12StaffEmployments_K12JobPositionStatusId] FOREIGN KEY ([K12JobPositionStatusId]) REFERENCES [RDS].[DimK12JobPositionStatuses] ([DimK12JobPositionStatusId]) ON DELETE No Action ON UPDATE No Action;
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IXFK_FactK12StaffEmployments_K12JobPositionStatusId' AND object_id = OBJECT_ID('RDS.FactK12StaffEmployments'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_K12JobPositionStatusId] ON [RDS].[FactK12StaffEmployments] ([K12JobPositionStatusId] ASC);
GO

-- 6e. RDS.FactK12StaffEvaluationParts : StaffEvaluationScaleId + FK + index
PRINT N'  RDS.FactK12StaffEvaluationParts -> StaffEvaluationScaleId...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffEvaluationParts') AND name = 'StaffEvaluationScaleId')
    ALTER TABLE [RDS].[FactK12StaffEvaluationParts] ADD [StaffEvaluationScaleId] INT NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffEvaluationParts_StaffEvaluationScaleId')
    ALTER TABLE [RDS].[FactK12StaffEvaluationParts] ADD CONSTRAINT [FK_FactK12StaffEvaluationParts_StaffEvaluationScaleId] FOREIGN KEY ([StaffEvaluationScaleId]) REFERENCES [RDS].[DimStaffEvaluationScales] ([DimStaffEvaluationScaleId]) ON DELETE No Action ON UPDATE No Action;
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IXFK_FactK12StaffEvaluationParts_DimStaffEvaluationScales' AND object_id = OBJECT_ID('RDS.FactK12StaffEvaluationParts'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimStaffEvaluationScales] ON [RDS].[FactK12StaffEvaluationParts] ([StaffEvaluationScaleId] ASC);
GO

-- 6f. RDS.FactK12StaffProfessionalDevelopmentSessions : K12JobPositionStatusId + credit columns
PRINT N'  RDS.FactK12StaffProfessionalDevelopmentSessions -> K12JobPositionStatusId + credit columns...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffProfessionalDevelopmentSessions') AND name = 'K12JobPositionStatusId')
    ALTER TABLE [RDS].[FactK12StaffProfessionalDevelopmentSessions] ADD [K12JobPositionStatusId] INT NOT NULL CONSTRAINT [DF_FactK12StaffProfessionalDevelopmentSessions_K12JobPositionStatusId] DEFAULT ((-1));
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffProfessionalDevelopmentSessions_K12JobPositionStatusId')
    ALTER TABLE [RDS].[FactK12StaffProfessionalDevelopmentSessions] ADD CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_K12JobPositionStatusId] FOREIGN KEY ([K12JobPositionStatusId]) REFERENCES [RDS].[DimK12JobPositionStatuses] ([DimK12JobPositionStatusId]) ON DELETE No Action ON UPDATE No Action;
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IXFK_FactK12StaffProfessionalDevelopmentSessions_K12JobPositionStatusId' AND object_id = OBJECT_ID('RDS.FactK12StaffProfessionalDevelopmentSessions'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_K12JobPositionStatusId] ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([K12JobPositionStatusId] ASC);
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffProfessionalDevelopmentSessions') AND name = 'NumberOfCreditsEarnedProfessionalDevelopmentHours')
    ALTER TABLE [RDS].[FactK12StaffProfessionalDevelopmentSessions] ADD [NumberOfCreditsEarnedProfessionalDevelopmentHours] DECIMAL(5,2) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffProfessionalDevelopmentSessions') AND name = 'NumberOfCreditsEarnedDegreeCredit')
    ALTER TABLE [RDS].[FactK12StaffProfessionalDevelopmentSessions] ADD [NumberOfCreditsEarnedDegreeCredit] DECIMAL(5,2) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffProfessionalDevelopmentSessions') AND name = 'NumberOfCreditsEarnedContinuingEducationUnits')
    ALTER TABLE [RDS].[FactK12StaffProfessionalDevelopmentSessions] ADD [NumberOfCreditsEarnedContinuingEducationUnits] DECIMAL(5,2) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactK12StaffProfessionalDevelopmentSessions') AND name = 'NumberOfCreditsEarnedClockHours')
    ALTER TABLE [RDS].[FactK12StaffProfessionalDevelopmentSessions] ADD [NumberOfCreditsEarnedClockHours] DECIMAL(5,2) NULL;
GO

PRINT N'Section 6 complete.';
PRINT N'';


/* ============================================================
   SECTION 7 - RDS.FactDirectory
   ============================================================
   7a. Normalize the existing nullable FK columns to NOT NULL with a -1
       default (matching the V14.1.0.0 model).  Existing NULLs are first
       backfilled to -1 so the NOT NULL alter succeeds.
   7b. Add the two new organization-status FK columns, their default
       constraints, indexes and FK constraints.
   ============================================================ */
PRINT N'Section 7: RDS.FactDirectory...';

-- 7a. NOTE on existing-column normalization (intentionally not applied here):
--     In the V14.1.0.0 model the 18 pre-existing FactDirectory FK columns are
--     marked NOT NULL with a (-1) default.  That nullability change is NOT performed
--     in this in-place upgrade: 17 of those columns back an FK index
--     (IXFK_FactDirectory_Dim*), so ALTER COLUMN ... NOT NULL is blocked unless every
--     dependent index is first dropped and recreated.  Because this is a non-functional
--     normalization (the functional V14.1.0.0 change is the two new organization-status
--     FKs added in 7b) and the canonical full-build DDL carries the NOT NULL definitions
--     for fresh installs, the existing columns are left as-is.  No data is modified.

-- 7b. New organization-status FK columns
PRINT N'  Adding OrganizationTitleIStatusId / PsInstitutionStatusId...';
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactDirectory') AND name = 'OrganizationTitleIStatusId')
    ALTER TABLE [RDS].[FactDirectory] ADD [OrganizationTitleIStatusId] INT NOT NULL CONSTRAINT [DF_FactDirectory_OrganizationTitleIStatusId] DEFAULT ((-1));
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('RDS.FactDirectory') AND name = 'PsInstitutionStatusId')
    ALTER TABLE [RDS].[FactDirectory] ADD [PsInstitutionStatusId] INT NOT NULL CONSTRAINT [DF_FactDirectory_PsInstitutionStatusId] DEFAULT ((-1));
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IXFK_FactDirectory_DimOrganizationTitleIStatuses' AND object_id = OBJECT_ID('RDS.FactDirectory'))
    CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimOrganizationTitleIStatuses] ON [RDS].[FactDirectory] ([OrganizationTitleIStatusId] ASC);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IXFK_FactDirectory_DimPsInstitutionStatuses' AND object_id = OBJECT_ID('RDS.FactDirectory'))
    CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimPsInstitutionStatuses] ON [RDS].[FactDirectory] ([PsInstitutionStatusId] ASC);
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactDirectory_OrganizationTitleIStatusId')
    ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_OrganizationTitleIStatusId] FOREIGN KEY ([OrganizationTitleIStatusId]) REFERENCES [RDS].[DimOrganizationTitleIStatuses] ([DimOrganizationTitleIStatusId]) ON DELETE No Action ON UPDATE No Action;
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactDirectory_PsInstitutionStatusId')
    ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_PsInstitutionStatusId] FOREIGN KEY ([PsInstitutionStatusId]) REFERENCES [RDS].[DimPsInstitutionStatuses] ([DimPsInstitutionStatusId]) ON DELETE No Action ON UPDATE No Action;
GO

PRINT N'Section 7 complete.';
PRINT N'';


/* ============================================================
   FINAL STATUS
   ============================================================ */
PRINT N'======================================================================';
PRINT N'  CEDS Data Warehouse upgrade from V14.0.0.0 to V14.1.0.0 complete.';
PRINT N'';
PRINT N'  NEXT STEPS:';
PRINT N'  * Re-run the V14.1.0.0 Junk-Table-Dimension-Population script to load';
PRINT N'    the new junk-dimension members (DimK12JobPositionStatuses,';
PRINT N'    DimStaffEvaluationScales, DimFacilityStatuses, DimFacilityUtilization,';
PRINT N'    DimK12StaffAssignmentStatuses).';
PRINT N'  * Publish the SSDT project (or run the option-set mapping update) to';
PRINT N'    refresh column descriptive metadata (extended properties).';
PRINT N'======================================================================';
GO
