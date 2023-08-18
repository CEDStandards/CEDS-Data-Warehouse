CREATE TABLE [RDS].[DimDisciplineReasons] (
    [DimDisciplineReasonId]       INT            IDENTITY (1, 1) NOT NULL,
    [DisciplineReasonCode]        NVARCHAR (50)  NOT NULL,
    [DisciplineReasonDescription] NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DimDisciplineReasonId] PRIMARY KEY CLUSTERED ([DimDisciplineReasonId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineReasons', @level2type=N'COLUMN',@level2name=N'DisciplineReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason why the student was disciplined.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineReasons', @level2type=N'COLUMN',@level2name=N'DisciplineReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Discipline Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineReasons', @level2type=N'COLUMN',@level2name=N'DisciplineReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000545' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineReasons', @level2type=N'COLUMN',@level2name=N'DisciplineReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21536' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineReasons', @level2type=N'COLUMN',@level2name=N'DisciplineReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineReasons', @level2type=N'COLUMN',@level2name=N'DisciplineReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason why the student was disciplined.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineReasons', @level2type=N'COLUMN',@level2name=N'DisciplineReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Discipline Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineReasons', @level2type=N'COLUMN',@level2name=N'DisciplineReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000545' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineReasons', @level2type=N'COLUMN',@level2name=N'DisciplineReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21536' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineReasons', @level2type=N'COLUMN',@level2name=N'DisciplineReasonDescription';
GO