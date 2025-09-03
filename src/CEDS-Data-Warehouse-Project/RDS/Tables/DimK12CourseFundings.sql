CREATE TABLE [RDS].[DimK12CourseFundings] (
    [DimK12CourseFundingId]          INT IDENTITY (1, 1) NOT NULL,
    [CourseFundingProgram]           NVARCHAR (40)  NOT NULL,
    [CourseFundingProgramAllowed]    NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_DimK12CourseFundings] PRIMARY KEY CLUSTERED ([DimK12CourseFundingId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

GO

CREATE NONCLUSTERED INDEX [IX_DimK12Courses_CourseFundingProgram]
    ON [RDS].[DimK12CourseFundings]([CourseFundingProgram] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseFundings', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A program through which the course is funded.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseFundings', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Funding Program' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseFundings', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001306' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseFundings', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001306' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseFundings', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseFundings', @level2type=N'COLUMN',@level2name=N'CourseFundingProgramAllowed';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of permission for allocation of a course funding program''s funds for the support of a course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseFundings', @level2type=N'COLUMN',@level2name=N'CourseFundingProgramAllowed';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Funding Program Allowed' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseFundings', @level2type=N'COLUMN',@level2name=N'CourseFundingProgramAllowed';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002065' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseFundings', @level2type=N'COLUMN',@level2name=N'CourseFundingProgramAllowed';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002065' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseFundings', @level2type=N'COLUMN',@level2name=N'CourseFundingProgramAllowed';
GO