-- Upgrade script: Directory dimension gaps (GitHub issue #160)
-- Date: 2026-11-16
-- Base version: V14.1.0.0
--
-- Purpose:
--   Closes the gaps found when the FactDirectory and FactFacilities schema diagrams were compared
--   with the data warehouse. Each change was checked against the CEDS ontology and the CEDS IDS.
--
-- Changes:
--   1. RDS.DimOrganizations          -> add [OrganizationIdentifierSam] nvarchar(40) NULL, the
--                                        System for Award Management Unique Entity Identifier
--                                        (CEDS Organization Identification System option "SAM",
--                                        which supports the transition from DUNS to UEI)
--   2. RDS.DimActivities             -> new dimension for the CEDS Activity entity, with CEDS
--                                        extended properties and the -1 unknown member
--   3. RDS.BridgeDirectoryActivities -> rename the key column [BridgeDirectoryActivities] to
--                                        [BridgeDirectoryActivitiesId], and replace
--                                        [DimProfessionalDevelopmentActivityId] ->
--                                        RDS.DimProfessionalDevelopmentActivities with
--                                        [ActivityId] -> RDS.DimActivities
--
-- Breaking change:
--   Step 3 changes what BridgeDirectoryActivities references. Existing values point at
--   professional-development activities, which are not directory activities, so they cannot be
--   carried across. The script stops before changing anything if the bridge holds any
--   DimProfessionalDevelopmentActivityId values; clear or remap them first.
--
-- Safe to re-run: every step checks the current state first. No table or column is dropped.

SET NOCOUNT ON;
GO

-- 0. Stop if the bridge holds values that step 3 cannot carry across ----------------------------
IF COL_LENGTH('RDS.BridgeDirectoryActivities', 'DimProfessionalDevelopmentActivityId') IS NOT NULL
BEGIN
    DECLARE @rows int;
    EXEC sp_executesql
        N'SELECT @n = COUNT(*) FROM [RDS].[BridgeDirectoryActivities] WHERE [DimProfessionalDevelopmentActivityId] IS NOT NULL',
        N'@n int OUTPUT', @n = @rows OUTPUT;
    IF @rows > 0
    BEGIN
        RAISERROR('RDS.BridgeDirectoryActivities has %d row(s) with DimProfessionalDevelopmentActivityId set. These reference professional-development activities and cannot move to DimActivities. Clear or remap them, then run this script again. Nothing was changed.', 16, 1, @rows);
        SET NOEXEC ON;
    END
END
GO

-- 1. DimOrganizations: SAM Unique Entity Identifier ---------------------------------------------
IF COL_LENGTH('RDS.DimOrganizations', 'OrganizationIdentifierSam') IS NULL
BEGIN
    ALTER TABLE [RDS].[DimOrganizations]
        ADD [OrganizationIdentifierSam] NVARCHAR(40) NULL;
END
GO

-- 2. DimActivities ------------------------------------------------------------------------------
IF OBJECT_ID('RDS.DimActivities', 'U') IS NULL
BEGIN
    CREATE TABLE [RDS].[DimActivities]
    (
        [DimActivityId] int NOT NULL IDENTITY (1, 1),
        [ActivityIdentifier] nvarchar(40) NULL,
        [ActivityTitle] nvarchar(60) NULL,
        [ActivityDescription] nvarchar(300) NULL,
        [RecordStartDateTime] datetime NULL,
        [RecordEndDateTime] datetime NULL,
        CONSTRAINT [PK_DimActivities] PRIMARY KEY CLUSTERED ([DimActivityId] ASC)
    );
END
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.extended_properties
    WHERE major_id = OBJECT_ID('RDS.DimActivities') AND minor_id = 0 AND name = 'MS_Description')
BEGIN
    EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An organized activity, such as a co-curricular or extra-curricular activity that is offered at an education institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities';
    EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An identifier assigned to the activity by the organization that offers it.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityIdentifier';
END
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.extended_properties
    WHERE major_id = OBJECT_ID('RDS.DimActivities')
      AND minor_id = COLUMNPROPERTY(OBJECT_ID('RDS.DimActivities'), 'ActivityTitle', 'ColumnId')
      AND name = 'CEDS_Element')
BEGIN
    EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The title for a particular activity, such as a co-curricular or extra-curricular activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityTitle';
    EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Activity Title' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityTitle';
    EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000009' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityTitle';
    EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000009' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityTitle';
    EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityTitle';
END
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.extended_properties
    WHERE major_id = OBJECT_ID('RDS.DimActivities')
      AND minor_id = COLUMNPROPERTY(OBJECT_ID('RDS.DimActivities'), 'ActivityDescription', 'ColumnId')
      AND name = 'CEDS_Element')
BEGIN
    EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the events and procedures that take place under the purview of an organized activity, such as a co-curricular or extra-curricular activity that is offered at an education institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityDescription';
    EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Activity Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityDescription';
    EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001530' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityDescription';
    EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001530' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityDescription';
    EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityDescription';
END
GO

IF NOT EXISTS (SELECT 1 FROM [RDS].[DimActivities] WHERE [DimActivityId] = -1)
BEGIN
    SET IDENTITY_INSERT [RDS].[DimActivities] ON;
    INSERT INTO [RDS].[DimActivities] ([DimActivityId], [ActivityIdentifier], [ActivityTitle], [ActivityDescription])
        VALUES (-1, 'MISSING', 'MISSING', 'MISSING');
    SET IDENTITY_INSERT [RDS].[DimActivities] OFF;
END
GO

-- 3. BridgeDirectoryActivities: key column name and target ---------------------------------------
IF OBJECT_ID('RDS.FK_BridgeDirectoryActivities_DimProfessionalDevelopmentActivityId', 'F') IS NOT NULL
    ALTER TABLE [RDS].[BridgeDirectoryActivities]
        DROP CONSTRAINT [FK_BridgeDirectoryActivities_DimProfessionalDevelopmentActivityId];
GO

IF EXISTS (SELECT 1 FROM sys.indexes
           WHERE object_id = OBJECT_ID('RDS.BridgeDirectoryActivities')
             AND name = 'IXFK_BridgeDirectoryActivities_DimProfessionalDevelopmentActivities')
    DROP INDEX [IXFK_BridgeDirectoryActivities_DimProfessionalDevelopmentActivities] ON [RDS].[BridgeDirectoryActivities];
GO

IF COL_LENGTH('RDS.BridgeDirectoryActivities', 'BridgeDirectoryActivities') IS NOT NULL
   AND COL_LENGTH('RDS.BridgeDirectoryActivities', 'BridgeDirectoryActivitiesId') IS NULL
    EXEC sp_rename 'RDS.BridgeDirectoryActivities.BridgeDirectoryActivities', 'BridgeDirectoryActivitiesId', 'COLUMN';
GO

IF COL_LENGTH('RDS.BridgeDirectoryActivities', 'DimProfessionalDevelopmentActivityId') IS NOT NULL
   AND COL_LENGTH('RDS.BridgeDirectoryActivities', 'ActivityId') IS NULL
    EXEC sp_rename 'RDS.BridgeDirectoryActivities.DimProfessionalDevelopmentActivityId', 'ActivityId', 'COLUMN';
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes
               WHERE object_id = OBJECT_ID('RDS.BridgeDirectoryActivities')
                 AND name = 'IXFK_BridgeDirectoryActivities_DimActivities')
    CREATE NONCLUSTERED INDEX [IXFK_BridgeDirectoryActivities_DimActivities]
        ON [RDS].[BridgeDirectoryActivities] ([ActivityId] ASC);
GO

IF OBJECT_ID('RDS.FK_BridgeDirectoryActivities_ActivityId', 'F') IS NULL
    ALTER TABLE [RDS].[BridgeDirectoryActivities] ADD CONSTRAINT [FK_BridgeDirectoryActivities_ActivityId]
        FOREIGN KEY ([ActivityId]) REFERENCES [RDS].[DimActivities] ([DimActivityId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

SET NOEXEC OFF;
GO
