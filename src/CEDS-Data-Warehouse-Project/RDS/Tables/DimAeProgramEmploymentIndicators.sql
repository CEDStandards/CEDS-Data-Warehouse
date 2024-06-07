CREATE TABLE [RDS].[DimAeProgramEmploymentIndicators] (
    [DimAeProgramEmploymentIndicatorId]       INT            IDENTITY (1, 1) NOT NULL,
    [EmployedAfterExitCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAeProgramEmploymentIndicators_EmployedAfterExitCode] DEFAULT ('MISSING') NOT NULL,
    [EmployedAfterExitDescription] NVARCHAR (200) CONSTRAINT [DF_DimAeProgramEmploymentIndicators_EmployedAfterExitDescription] DEFAULT ('MISSING') NOT NULL,
    [EmployedWhileEnrolledCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAeProgramEmploymentIndicators_EmployedWhileEnrolledCode] DEFAULT ('MISSING') NOT NULL,
    [EmployedWhileEnrolledDescription] NVARCHAR (200) CONSTRAINT [DF_DimAeProgramEmploymentIndicators_EmployedWhileEnrolledDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAeProgramEmploymentIndicators] PRIMARY KEY CLUSTERED ([DimAeProgramEmploymentIndicatorId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAeProgramEmploymentIndicators_EmployedAfterExitCode]
    ON [RDS].[DimAeProgramEmploymentIndicators]([EmployedAfterExitCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual who is a paid employee or works in his or her own business, profession, or farm, as reported through the State Unemployment Insurance Wage Report, FEDES, or WRIS, after exiting secondary, postsecondary, or adult education or workforce programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employed After Exit' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000988' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000988' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual who is a paid employee or works in his or her own business, profession, or farm, as reported through the State Unemployment Insurance Wage Report, FEDES, or WRIS, after exiting secondary, postsecondary, or adult education or workforce programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employed After Exit' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000988' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000988' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual who is a paid employee or works in his or her own business, profession, or farm, as reported through the State Unemployment Insurance Wage Report, FEDES, or WRIS, and at the same time is enrolled in secondary, postsecondary, or adult education or workforce programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employed While Enrolled' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000987' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000987' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual who is a paid employee or works in his or her own business, profession, or farm, as reported through the State Unemployment Insurance Wage Report, FEDES, or WRIS, and at the same time is enrolled in secondary, postsecondary, or adult education or workforce programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employed While Enrolled' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000987' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000987' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramEmploymentIndicators', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledDescription';
GO



