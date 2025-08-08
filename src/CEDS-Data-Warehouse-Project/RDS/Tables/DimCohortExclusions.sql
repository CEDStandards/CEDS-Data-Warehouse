CREATE TABLE [RDS].[DimCohortExclusions] (
    [DimCohortExclusionId]       INT           IDENTITY (1, 1) NOT NULL,
    [CohortExclusionCode]        VARCHAR (50)  CONSTRAINT [DF_DimCohortExclusions_CohortExclusionCode] DEFAULT ('MISSING') NOT NULL,
    [CohortExclusionDescription] VARCHAR (200) CONSTRAINT [DF_DimCohortExclusions_CohortExclusionDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimCohortExclusions] PRIMARY KEY CLUSTERED ([DimCohortExclusionId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimCohortExclusions_CohortExclusionCode]
    ON [RDS].[DimCohortExclusions]([CohortExclusionCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCohortExclusions', @level2type=N'COLUMN',@level2name=N'CohortExclusionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Those persons who may be removed (deleted) from a cohort (or subcohort). For the Graduation Rates and Fall Enrollment retention rate reporting, persons may be removed from a cohort if they left the institution for one of the following reasons: death or total and permanent disability; service in the armed forces (including those called to active duty); service with a foreign aid service of the federal government, such as the Peace Corps; or service on official church missions.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCohortExclusions', @level2type=N'COLUMN',@level2name=N'CohortExclusionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Cohort Exclusion' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCohortExclusions', @level2type=N'COLUMN',@level2name=N'CohortExclusionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000106' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCohortExclusions', @level2type=N'COLUMN',@level2name=N'CohortExclusionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'ttps://ceds.ed.gov/element/000106' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCohortExclusions', @level2type=N'COLUMN',@level2name=N'CohortExclusionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCohortExclusions', @level2type=N'COLUMN',@level2name=N'CohortExclusionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Those persons who may be removed (deleted) from a cohort (or subcohort). For the Graduation Rates and Fall Enrollment retention rate reporting, persons may be removed from a cohort if they left the institution for one of the following reasons: death or total and permanent disability; service in the armed forces (including those called to active duty); service with a foreign aid service of the federal government, such as the Peace Corps; or service on official church missions.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCohortExclusions', @level2type=N'COLUMN',@level2name=N'CohortExclusionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Cohort Exclusion' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCohortExclusions', @level2type=N'COLUMN',@level2name=N'CohortExclusionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000106' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCohortExclusions', @level2type=N'COLUMN',@level2name=N'CohortExclusionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'ttps://ceds.ed.gov/element/000106' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCohortExclusions', @level2type=N'COLUMN',@level2name=N'CohortExclusionDescription';
GO