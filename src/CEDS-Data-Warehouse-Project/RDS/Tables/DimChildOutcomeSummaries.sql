CREATE TABLE [RDS].[DimChildOutcomeSummaries] (
    [DimChildOutcomeSummaryId]         INT            IDENTITY (1, 1) NOT NULL,
    [CosRatingACode]                   NVARCHAR (100) CONSTRAINT [DF_DimChildOutcomeSummaries_CosRatingACode] DEFAULT ('MISSING') NOT NULL,
    [CosRatingADescription]            NVARCHAR (300) CONSTRAINT [DF_DimChildOutcomeSummaries_CosRatingADescription] DEFAULT ('MISSING') NOT NULL,
    [CosRatingBCode]                   NVARCHAR (100) CONSTRAINT [DF_DimChildOutcomeSummaries_CosRatingBCode] DEFAULT ('MISSING') NOT NULL,
    [CosRatingBDescription]            NVARCHAR (300) CONSTRAINT [DF_DimChildOutcomeSummaries_CosRatingBDescription] DEFAULT ('MISSING') NOT NULL,
    [CosRatingCCode]                   NVARCHAR (100) CONSTRAINT [DF_DimChildOutcomeSummaries_CosRatingCCode] DEFAULT ('MISSING') NOT NULL,
    [CosRatingCDescription]            NVARCHAR (300) CONSTRAINT [DF_DimChildOutcomeSummaries_CosRatingCDescription] DEFAULT ('MISSING') NOT NULL,
    [CosProgressAIndicatorCode]        NVARCHAR (100) CONSTRAINT [DF_DimChildOutcomeSummaries_CosProgressAIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [CosProgressAIndicatorDescription] NVARCHAR (300) CONSTRAINT [DF_DimChildOutcomeSummaries_CosProgressAIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    [CosProgressBIndicatorCode]        NVARCHAR (100) CONSTRAINT [DF_DimChildOutcomeSummaries_CosProgressBIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [CosProgressBIndicatorDescription] NVARCHAR (300) CONSTRAINT [DF_DimChildOutcomeSummaries_CosProgressBIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    [CosProgressCIndicatorCode]        NVARCHAR (100) CONSTRAINT [DF_DimChildOutcomeSummaries_CosProgressCIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [CosProgressCIndicatorDescription] NVARCHAR (300) CONSTRAINT [DF_DimChildOutcomeSummaries_CosProgressCIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimChildOutcomeSummaryId] PRIMARY KEY CLUSTERED ([DimChildOutcomeSummaryId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressAIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the child demonstrates progress in positive social-emotional skills, including social relationships.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressAIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Progress A Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressAIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001504' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressAIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22476' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressAIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressAIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the child demonstrates progress in positive social-emotional skills, including social relationships.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressAIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Progress A Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressAIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001504' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressAIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22476' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressAIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressBIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the child demonstrates progress in acquisition and use of knowledge and skills, including early language/communication.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressBIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Progress B Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressBIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001505' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressBIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22477' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressBIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressBIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the child demonstrates progress in acquisition and use of knowledge and skills, including early language/communication.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressBIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Progress B Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressBIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001505' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressBIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22477' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressBIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressCIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the child demonstrates progress in use of appropriate behaviors to meet their needs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressCIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Progress C Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressCIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001506' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressCIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22478' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressCIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressCIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the child demonstrates progress in use of appropriate behaviors to meet their needs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressCIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Progress C Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressCIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001506' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressCIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22478' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosProgressCIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingACode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Child''s level of functioning in positive social-emotional skills (including social relationships).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingACode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Rating A' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingACode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001507' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingACode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22479' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingACode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingADescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Child''s level of functioning in positive social-emotional skills (including social relationships).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingADescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Rating A' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingADescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001507' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingADescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22479' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingADescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingBCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Child''s level of functioning in the acquisition and use of knowledge and skills (including early language/communication.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingBCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Rating B' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingBCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001508' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingBCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22480' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingBCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingBDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Child''s level of functioning in the acquisition and use of knowledge and skills (including early language/communication.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingBDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Rating B' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingBDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001508' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingBDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22480' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingBDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingCCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Child''s level of functioning in the use of appropriate behaviors to meet their needs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingCCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Rating C' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingCCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001509' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingCCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22481' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingCCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingCDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Child''s level of functioning in the use of appropriate behaviors to meet their needs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingCDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Rating C' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingCDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001509' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingCDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22481' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'CosRatingCDescription';
GO