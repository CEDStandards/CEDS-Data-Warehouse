CREATE TABLE [RDS].[DimAeDemographics] (
    [DimAeDemographicId]                           INT            IDENTITY (1, 1) NOT NULL,
    [SexCode]                                      NVARCHAR (50)  CONSTRAINT [DF_DimAeDemographics_SexCode] DEFAULT ('MISSING') NOT NULL,
    [SexDescription]                               NVARCHAR (200) CONSTRAINT [DF_DimAeDemographics_SexDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAeDemographics] PRIMARY KEY CLUSTERED ([DimAeDemographicId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeDemographics', @level2type=N'COLUMN',@level2name=N'SexCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The concept describing the biological traits that distinguish the males and females of a species.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeDemographics', @level2type=N'COLUMN',@level2name=N'SexCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Sex' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeDemographics', @level2type=N'COLUMN',@level2name=N'SexCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000255' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeDemographics', @level2type=N'COLUMN',@level2name=N'SexCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000255' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeDemographics', @level2type=N'COLUMN',@level2name=N'SexCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeDemographics', @level2type=N'COLUMN',@level2name=N'SexDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The concept describing the biological traits that distinguish the males and females of a species.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeDemographics', @level2type=N'COLUMN',@level2name=N'SexDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Sex' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeDemographics', @level2type=N'COLUMN',@level2name=N'SexDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000255' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeDemographics', @level2type=N'COLUMN',@level2name=N'SexDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000255' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeDemographics', @level2type=N'COLUMN',@level2name=N'SexDescription';
GO