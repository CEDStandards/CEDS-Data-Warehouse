/*
    CEDS Data Warehouse Upgrade Script
    -----------------------------------
    From: Version 13.0.0.0
    To:   Version 14.0.0.0

    Copyright 2026 Common Education Data Standards
    Licensed under the Apache License, Version 2.0

    PURPOSE
    -------
    This script upgrades an existing CEDS Data Warehouse V13 database to V14
    in-place, preserving all existing data.

    Run this script against your V13 database (not master).
    Example: USE [CEDS-Data-Warehouse-V13-0-0-0]; GO

    WHAT THIS SCRIPT DOES (in order)
    ----------------------------------
    SECTION 1 - Warnings about tables that will be permanently dropped:
                CEDS.CodeSetxCode, CEDS.TermxCodeSet, CEDS.Code,
                CEDS.CodeSet, CEDS.Term
                Foreign keys referencing these tables are dropped first.

    SECTION 2 - Rename misspelled table DimEarlyChildhoolOrganizationStatuses
                to the corrected DimEarlyChildhoodOrganizationStatuses.
                Updates the FK on FactDirectory that references it.

    SECTION 3 - Add new columns to existing tables:
                  RDS.DimK12Schools          -> SchoolIdentifierSat
                  RDS.FactK12StaffEvaluationParts -> RecordStartDateTime, RecordEndDateTime
                  Staging.K12Organization    -> SchoolIdentifierSat

    SECTION 4 - Rename columns (typo / naming correction):
                  RDS.FactDirectory:
                    ComprehensiveAndTargetedSupportI  ->  ComprehensiveAndTargetedSupportId
                  RDS.BridgeCredentialAwardRelatedCredentialAwards:
                    CredentialAwardRelationshipCode        -> CredentialAwardRelationshipTypeCode
                    CredentialAwardRelationshipDescription -> CredentialAwardRelationshipTypeDescription
                  Staging.CredentialAwardRelatedCredentialAward:
                    CredentialAwardRelationshipCode        -> CredentialAwardRelationshipTypeCode
                    CredentialAwardRelationshipDescription -> CredentialAwardRelationshipTypeDescription
                  (Column renames are done via sp_rename; data is preserved.)
                  Update associated index names that reference the renamed FactDirectory column.

    SECTION 5 - Add new FK constraint:
                  RDS.FactK12AcademicCalendarEvents ->
                    FK_FactK12AcademicCalendarEvents_CalendarEventDayId
                    referencing RDS.DimCalendarEventDays


    Run the CEDSOptionSetMappingUpdate script following this script.

    *** BACK UP YOUR DATABASE BEFORE RUNNING THIS SCRIPT ***
*/

USE [CEDS-Data-Warehouse-V13-0-0-0]

SET NOCOUNT ON;
SET XACT_ABORT ON;
GO

PRINT N'';
PRINT N'======================================================================';
PRINT N'  CEDS Data Warehouse Upgrade: V13 --> V14';
PRINT N'======================================================================';
PRINT N'';


/* ============================================================
   SECTION 1 - DROP CEDS SCHEMA TABLES (Code / Term / CodeSet)
   ============================================================
   WARNING: The following tables and ALL DATA within them will be
   permanently deleted as part of the V14 upgrade:

       CEDS.CodeSetxCode    (junction table: CodeSet <-> Code)
       CEDS.TermxCodeSet    (junction table: Term <-> CodeSet)
       CEDS.Code            (code values)
       CEDS.CodeSet         (option sets)
       CEDS.Term            (CEDS term definitions)

   These tables were part of the legacy CEDS glossary / code schema
   which has been removed in V14.  They are NOT used by any RDS or
   Staging tables, so no transactional fact or dimension data is
   at risk.  The FK relationships between these five tables are
   dropped first to satisfy referential-integrity ordering.
   ============================================================ */

PRINT N'';
PRINT N'*** WARNING ***********************************************************';
PRINT N'The following CEDS schema tables are being permanently DROPPED.';
PRINT N'All data in these tables will be lost:';
PRINT N'  - CEDS.CodeSetxCode';
PRINT N'  - CEDS.TermxCodeSet';
PRINT N'  - CEDS.Code';
PRINT N'  - CEDS.CodeSet';
PRINT N'  - CEDS.Term';
PRINT N'If you need to preserve this data please do so before continuing.';
PRINT N'***********************************************************************';
PRINT N'';

-- 1a. Drop FKs that live on the junction tables (must go before the tables)
PRINT N'Dropping FK: CEDS.FK_CodeSet_x_Code_Code (CodeSetxCode -> Code)...';
IF EXISTS (
    SELECT 1 FROM sys.foreign_keys
    WHERE name = 'FK_CodeSet_x_Code_Code'
      AND parent_object_id = OBJECT_ID('CEDS.CodeSetxCode')
)
    ALTER TABLE [CEDS].[CodeSetxCode]
        DROP CONSTRAINT [FK_CodeSet_x_Code_Code];
GO

PRINT N'Dropping FK: CEDS.FK_CodeSet_x_Code_CodeSet (CodeSetxCode -> CodeSet)...';
IF EXISTS (
    SELECT 1 FROM sys.foreign_keys
    WHERE name = 'FK_CodeSet_x_Code_CodeSet'
      AND parent_object_id = OBJECT_ID('CEDS.CodeSetxCode')
)
    ALTER TABLE [CEDS].[CodeSetxCode]
        DROP CONSTRAINT [FK_CodeSet_x_Code_CodeSet];
GO

PRINT N'Dropping FK: CEDS.FK_Term_x_CodeSet_CodeSet (TermxCodeSet -> CodeSet)...';
IF EXISTS (
    SELECT 1 FROM sys.foreign_keys
    WHERE name = 'FK_Term_x_CodeSet_CodeSet'
      AND parent_object_id = OBJECT_ID('CEDS.TermxCodeSet')
)
    ALTER TABLE [CEDS].[TermxCodeSet]
        DROP CONSTRAINT [FK_Term_x_CodeSet_CodeSet];
GO

PRINT N'Dropping FK: CEDS.FK_Term_x_CodeSet_Term (TermxCodeSet -> Term)...';
IF EXISTS (
    SELECT 1 FROM sys.foreign_keys
    WHERE name = 'FK_Term_x_CodeSet_Term'
      AND parent_object_id = OBJECT_ID('CEDS.TermxCodeSet')
)
    ALTER TABLE [CEDS].[TermxCodeSet]
        DROP CONSTRAINT [FK_Term_x_CodeSet_Term];
GO

-- 1b. Drop the junction tables first (they reference Code, CodeSet, Term)
PRINT N'Dropping table CEDS.CodeSetxCode...';
IF OBJECT_ID('CEDS.CodeSetxCode', 'U') IS NOT NULL
    DROP TABLE [CEDS].[CodeSetxCode];
GO

PRINT N'Dropping table CEDS.TermxCodeSet...';
IF OBJECT_ID('CEDS.TermxCodeSet', 'U') IS NOT NULL
    DROP TABLE [CEDS].[TermxCodeSet];
GO

-- 1c. Now drop the parent tables (no more FKs pointing at them)
PRINT N'Dropping table CEDS.Code...';
IF OBJECT_ID('CEDS.Code', 'U') IS NOT NULL
    DROP TABLE [CEDS].[Code];
GO

PRINT N'Dropping table CEDS.CodeSet...';
IF OBJECT_ID('CEDS.CodeSet', 'U') IS NOT NULL
    DROP TABLE [CEDS].[CodeSet];
GO

PRINT N'Dropping table CEDS.Term...';
IF OBJECT_ID('CEDS.Term', 'U') IS NOT NULL
    DROP TABLE [CEDS].[Term];
GO

PRINT N'Section 1 complete: Legacy CEDS code/term tables removed.';
PRINT N'';


/* ============================================================
   SECTION 2 - RENAME MISSPELLED TABLE DimEarlyChildhool...
   ============================================================
   V13 contained a typo in the table name:
       [RDS].[DimEarlyChildhool OrganizationStatuses]   (double 'o')
   V14 corrects this to:
       [RDS].[DimEarlyChildhood OrganizationStatuses]

   Steps:
     2a. Drop the FK on FactDirectory that references the old name.
     2b. Rename the table.
     2c. Rename the primary key constraint on the table.
     2d. Re-create the FK on FactDirectory pointing at the new name.
   ============================================================ */

PRINT N'';
PRINT N'Section 2: Renaming DimEarlyChildhoolOrganizationStatuses -> DimEarlyChildhoodOrganizationStatuses...';

-- 2a. Drop FK on FactDirectory first -- required before we can touch the PK it references.
--     This handles both the initial run (FK points at old table name) and any re-run
--     (FK already points at the new table name); the WHERE clause matches either way
--     because the constraint name is the same in both cases.
PRINT N'  Dropping FK: RDS.FK_FactDirectory_EarlyChildhoodOrganizationStatusId...';
IF EXISTS (
    SELECT 1 FROM sys.foreign_keys
    WHERE name = 'FK_FactDirectory_EarlyChildhoodOrganizationStatusId'
      AND parent_object_id = OBJECT_ID('RDS.FactDirectory')
)
    ALTER TABLE [RDS].[FactDirectory]
        DROP CONSTRAINT [FK_FactDirectory_EarlyChildhoodOrganizationStatusId];
GO

-- 2b. Rename table (sp_rename preserves data and indexes).
PRINT N'  Renaming table...';
IF OBJECT_ID('RDS.DimEarlyChildhoolOrganizationStatuses', 'U') IS NOT NULL
   AND OBJECT_ID('RDS.DimEarlyChildhoodOrganizationStatuses', 'U') IS NULL
    EXEC sp_rename
        'RDS.DimEarlyChildhoolOrganizationStatuses',
        'DimEarlyChildhoodOrganizationStatuses';
GO

-- 2c. Fix the PK constraint name by dropping and recreating it.
--     The FK was dropped in 2a, so there is no longer anything blocking the PK drop.
PRINT N'  Recreating PK constraint with corrected name...';
IF EXISTS (
    SELECT 1 FROM sys.key_constraints
    WHERE name = 'PK_DimEarlyChildhoolOrganizationStatuses'
      AND parent_object_id = OBJECT_ID('RDS.DimEarlyChildhoodOrganizationStatuses')
)
    ALTER TABLE [RDS].[DimEarlyChildhoodOrganizationStatuses]
        DROP CONSTRAINT [PK_DimEarlyChildhoolOrganizationStatuses];
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.key_constraints
    WHERE name = 'PK_DimEarlyChildhoodOrganizationStatuses'
      AND parent_object_id = OBJECT_ID('RDS.DimEarlyChildhoodOrganizationStatuses')
)
    ALTER TABLE [RDS].[DimEarlyChildhoodOrganizationStatuses]
        ADD CONSTRAINT [PK_DimEarlyChildhoodOrganizationStatuses]
        PRIMARY KEY CLUSTERED ([DimEarlyChildhoodOrganizationStatusId] ASC);
GO

-- 2d. Re-create FK on FactDirectory pointing at the correctly-named table.
PRINT N'  Re-creating FK: RDS.FK_FactDirectory_EarlyChildhoodOrganizationStatusId...';
IF NOT EXISTS (
    SELECT 1 FROM sys.foreign_keys
    WHERE name = 'FK_FactDirectory_EarlyChildhoodOrganizationStatusId'
      AND parent_object_id = OBJECT_ID('RDS.FactDirectory')
)
    ALTER TABLE [RDS].[FactDirectory]
        ADD CONSTRAINT [FK_FactDirectory_EarlyChildhoodOrganizationStatusId]
        FOREIGN KEY ([EarlyChildhoodOrganizationStatusId])
        REFERENCES [RDS].[DimEarlyChildhoodOrganizationStatuses] ([DimEarlyChildhoodOrganizationStatusId]);
GO

PRINT N'Section 2 complete.';
PRINT N'';


/* ============================================================
   SECTION 3 - ADD NEW COLUMNS TO EXISTING TABLES
   ============================================================ */

PRINT N'Section 3: Adding new columns to existing tables...';

-- 3a. RDS.DimK12Schools: add SchoolIdentifierSat (nullable NVARCHAR 50)
PRINT N'  RDS.DimK12Schools -> adding [SchoolIdentifierSat]...';
IF NOT EXISTS (
    SELECT 1 FROM sys.columns
    WHERE object_id = OBJECT_ID('RDS.DimK12Schools')
      AND name = 'SchoolIdentifierSat'
)
    ALTER TABLE [RDS].[DimK12Schools]
        ADD [SchoolIdentifierSat] NVARCHAR (50) NULL;
GO

-- 3b. RDS.FactK12StaffEvaluationParts: add RecordStartDateTime and RecordEndDateTime
PRINT N'  RDS.FactK12StaffEvaluationParts -> adding [RecordStartDateTime]...';
IF NOT EXISTS (
    SELECT 1 FROM sys.columns
    WHERE object_id = OBJECT_ID('RDS.FactK12StaffEvaluationParts')
      AND name = 'RecordStartDateTime'
)
    ALTER TABLE [RDS].[FactK12StaffEvaluationParts]
        ADD [RecordStartDateTime] DATETIME NULL;
GO

PRINT N'  RDS.FactK12StaffEvaluationParts -> adding [RecordEndDateTime]...';
IF NOT EXISTS (
    SELECT 1 FROM sys.columns
    WHERE object_id = OBJECT_ID('RDS.FactK12StaffEvaluationParts')
      AND name = 'RecordEndDateTime'
)
    ALTER TABLE [RDS].[FactK12StaffEvaluationParts]
        ADD [RecordEndDateTime] DATETIME NULL;
GO

-- 3c. Staging.K12Organization: add SchoolIdentifierSat (nullable NVARCHAR 50)
PRINT N'  Staging.K12Organization -> adding [SchoolIdentifierSat]...';
IF NOT EXISTS (
    SELECT 1 FROM sys.columns
    WHERE object_id = OBJECT_ID('Staging.K12Organization')
      AND name = 'SchoolIdentifierSat'
)
    ALTER TABLE [Staging].[K12Organization]
        ADD [SchoolIdentifierSat] NVARCHAR (50) NULL;
GO

PRINT N'Section 3 complete.';
PRINT N'';


/* ============================================================
   SECTION 4 - RENAME COLUMNS (typo / naming corrections)
   ============================================================
   sp_rename preserves all existing data in the column.
   Each rename is guarded so re-running is safe.
   ============================================================ */

PRINT N'Section 4: Renaming columns...';

-- 4a. RDS.FactDirectory:
--     ComprehensiveAndTargetedSupportI  ->  ComprehensiveAndTargetedSupportId  (missing 'd')
--
--     This column has:
--       - a nonclustered index  IXFK_FactDirectory_DimComprehensiveAndTargetedSupports
--       - a FK                  FK_FactDirectory_ComprehensiveAndTargetedSupportId
--     Both reference the column by name, so they must be dropped before the rename
--     and re-created afterwards.

PRINT N'  RDS.FactDirectory: renaming ComprehensiveAndTargetedSupportI -> ComprehensiveAndTargetedSupportId...';

-- Drop FK referencing the old column name
IF EXISTS (
    SELECT 1 FROM sys.foreign_keys
    WHERE name = 'FK_FactDirectory_ComprehensiveAndTargetedSupportId'
      AND parent_object_id = OBJECT_ID('RDS.FactDirectory')
)
    ALTER TABLE [RDS].[FactDirectory]
        DROP CONSTRAINT [FK_FactDirectory_ComprehensiveAndTargetedSupportId];
GO

-- Drop the nonclustered index on the old column name
IF EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE object_id = OBJECT_ID('RDS.FactDirectory')
      AND name = 'IXFK_FactDirectory_DimComprehensiveAndTargetedSupports'
)
    DROP INDEX [IXFK_FactDirectory_DimComprehensiveAndTargetedSupports]
        ON [RDS].[FactDirectory];
GO

-- Rename the column (only if the old name still exists)
IF EXISTS (
    SELECT 1 FROM sys.columns
    WHERE object_id = OBJECT_ID('RDS.FactDirectory')
      AND name = 'ComprehensiveAndTargetedSupportI'
)
    EXEC sp_rename
        'RDS.FactDirectory.ComprehensiveAndTargetedSupportI',
        'ComprehensiveAndTargetedSupportId',
        'COLUMN';
GO

-- Re-create the nonclustered index on the corrected column name
IF NOT EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE object_id = OBJECT_ID('RDS.FactDirectory')
      AND name = 'IXFK_FactDirectory_DimComprehensiveAndTargetedSupports'
)
    CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimComprehensiveAndTargetedSupports]
        ON [RDS].[FactDirectory] ([ComprehensiveAndTargetedSupportId] ASC);
GO

-- Re-create FK on corrected column name
IF NOT EXISTS (
    SELECT 1 FROM sys.foreign_keys
    WHERE name = 'FK_FactDirectory_ComprehensiveAndTargetedSupportId'
      AND parent_object_id = OBJECT_ID('RDS.FactDirectory')
)
    ALTER TABLE [RDS].[FactDirectory]
        ADD CONSTRAINT [FK_FactDirectory_ComprehensiveAndTargetedSupportId]
        FOREIGN KEY ([ComprehensiveAndTargetedSupportId])
        REFERENCES [RDS].[DimComprehensiveAndTargetedSupports] ([DimComprehensiveAndTargetedSupportId]);
GO

-- 4b. RDS.BridgeCredentialAwardRelatedCredentialAwards:
--     CredentialAwardRelationshipCode        -> CredentialAwardRelationshipTypeCode
--     CredentialAwardRelationshipDescription -> CredentialAwardRelationshipTypeDescription
--     (No FKs or indexes reference these columns in V13.)

PRINT N'  RDS.BridgeCredentialAwardRelatedCredentialAwards: renaming CredentialAwardRelationship columns...';

IF EXISTS (
    SELECT 1 FROM sys.columns
    WHERE object_id = OBJECT_ID('RDS.BridgeCredentialAwardRelatedCredentialAwards')
      AND name = 'CredentialAwardRelationshipCode'
)
    EXEC sp_rename
        'RDS.BridgeCredentialAwardRelatedCredentialAwards.CredentialAwardRelationshipCode',
        'CredentialAwardRelationshipTypeCode',
        'COLUMN';
GO

IF EXISTS (
    SELECT 1 FROM sys.columns
    WHERE object_id = OBJECT_ID('RDS.BridgeCredentialAwardRelatedCredentialAwards')
      AND name = 'CredentialAwardRelationshipDescription'
)
    EXEC sp_rename
        'RDS.BridgeCredentialAwardRelatedCredentialAwards.CredentialAwardRelationshipDescription',
        'CredentialAwardRelationshipTypeDescription',
        'COLUMN';
GO

-- 4c. Staging.CredentialAwardRelatedCredentialAward:
--     CredentialAwardRelationshipCode        -> CredentialAwardRelationshipTypeCode
--     CredentialAwardRelationshipDescription -> CredentialAwardRelationshipTypeDescription
--     (No FKs or indexes reference these columns in V13.)

PRINT N'  Staging.CredentialAwardRelatedCredentialAward: renaming CredentialAwardRelationship columns...';

IF EXISTS (
    SELECT 1 FROM sys.columns
    WHERE object_id = OBJECT_ID('Staging.CredentialAwardRelatedCredentialAward')
      AND name = 'CredentialAwardRelationshipCode'
)
    EXEC sp_rename
        'Staging.CredentialAwardRelatedCredentialAward.CredentialAwardRelationshipCode',
        'CredentialAwardRelationshipTypeCode',
        'COLUMN';
GO

IF EXISTS (
    SELECT 1 FROM sys.columns
    WHERE object_id = OBJECT_ID('Staging.CredentialAwardRelatedCredentialAward')
      AND name = 'CredentialAwardRelationshipDescription'
)
    EXEC sp_rename
        'Staging.CredentialAwardRelatedCredentialAward.CredentialAwardRelationshipDescription',
        'CredentialAwardRelationshipTypeDescription',
        'COLUMN';
GO

PRINT N'Section 4 complete.';
PRINT N'';


/* ============================================================
   SECTION 5 - ADD NEW FOREIGN KEY CONSTRAINT
   ============================================================
   RDS.FactK12AcademicCalendarEvents:
     New FK linking [CalendarEventDayId] -> RDS.DimCalendarEventDays
     (the column and the referenced dimension table both existed in V13;
      only the FK relationship is new in V14)
   ============================================================ */

PRINT N'Section 5: Adding new FK constraint on RDS.FactK12AcademicCalendarEvents...';

-- 5a. Add default constraint for CalendarEventDayId (matches V14 pattern for this table)
PRINT N'  Adding DEFAULT constraint DF_FactK12AcademicCalendarEvents_CalendarEventDayId...';
IF NOT EXISTS (
    SELECT 1 FROM sys.default_constraints
    WHERE name = 'DF_FactK12AcademicCalendarEvents_CalendarEventDayId'
      AND parent_object_id = OBJECT_ID('RDS.FactK12AcademicCalendarEvents')
)
    ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]
        ADD CONSTRAINT [DF_FactK12AcademicCalendarEvents_CalendarEventDayId]
        DEFAULT ((-1)) FOR [CalendarEventDayId];
GO

-- 5b. Add the new FK
PRINT N'  Adding FK: FK_FactK12AcademicCalendarEvents_CalendarEventDayId...';
IF NOT EXISTS (
    SELECT 1 FROM sys.foreign_keys
    WHERE name = 'FK_FactK12AcademicCalendarEvents_CalendarEventDayId'
      AND parent_object_id = OBJECT_ID('RDS.FactK12AcademicCalendarEvents')
)
    ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]
        ADD CONSTRAINT [FK_FactK12AcademicCalendarEvents_CalendarEventDayId]
        FOREIGN KEY ([CalendarEventDayId])
        REFERENCES [RDS].[DimCalendarEventDays] ([DimCalendarEventDayId]);
GO

PRINT N'Section 5 complete.';
PRINT N'';


/* ============================================================
   FINAL STATUS
   ============================================================ */

PRINT N'======================================================================';
PRINT N'  CEDS Data Warehouse upgrade from V13 to V14 complete.';
PRINT N'';
PRINT N'  Summary of changes applied:';
PRINT N'  1. Dropped CEDS.CodeSetxCode, CEDS.TermxCodeSet, CEDS.Code,';
PRINT N'     CEDS.CodeSet, CEDS.Term (and their internal FK constraints).';
PRINT N'  2. Renamed RDS.DimEarlyChildhoolOrganizationStatuses to';
PRINT N'     RDS.DimEarlyChildhoodOrganizationStatuses; updated PK name';
PRINT N'     and FactDirectory FK accordingly.';
PRINT N'  3. Added columns:';
PRINT N'       RDS.DimK12Schools.SchoolIdentifierSat';
PRINT N'       RDS.FactK12StaffEvaluationParts.RecordStartDateTime';
PRINT N'       RDS.FactK12StaffEvaluationParts.RecordEndDateTime';
PRINT N'       Staging.K12Organization.SchoolIdentifierSat';
PRINT N'  4. Renamed columns:';
PRINT N'       RDS.FactDirectory.ComprehensiveAndTargetedSupportI';
PRINT N'         -> ComprehensiveAndTargetedSupportId';
PRINT N'       RDS.BridgeCredentialAwardRelatedCredentialAwards';
PRINT N'         .CredentialAwardRelationshipCode';
PRINT N'           -> CredentialAwardRelationshipTypeCode';
PRINT N'         .CredentialAwardRelationshipDescription';
PRINT N'           -> CredentialAwardRelationshipTypeDescription';
PRINT N'       Staging.CredentialAwardRelatedCredentialAward';
PRINT N'         .CredentialAwardRelationshipCode';
PRINT N'           -> CredentialAwardRelationshipTypeCode';
PRINT N'         .CredentialAwardRelationshipDescription';
PRINT N'           -> CredentialAwardRelationshipTypeDescription';
PRINT N'  5. Added FK: RDS.FK_FactK12AcademicCalendarEvents_CalendarEventDayId';
PRINT N'     (FactK12AcademicCalendarEvents -> DimCalendarEventDays)';
PRINT N'     and companion DEFAULT constraint.';
PRINT N'';
PRINT N'  NEXT STEP: Append and run the V14 CEDSOptionSetMapping';
PRINT N'             insert/update script to refresh option set data.';
PRINT N'======================================================================';
GO
