CREATE TABLE [RDS].[DimChildOutcomeSummaries] (
    [DimChildOutcomeSummaryId]         INT            IDENTITY (1, 1) NOT NULL,
    [COSRatingACode]                   NVARCHAR (100) NOT NULL,
    [COSRatingADescription]            NVARCHAR (300) NOT NULL,
    [COSRatingBCode]                   NVARCHAR (100) NOT NULL,
    [COSRatingBDescription]            NVARCHAR (300) NOT NULL,
    [COSRatingCCode]                   NVARCHAR (100) NOT NULL,
    [COSRatingCDescription]            NVARCHAR (300) NOT NULL,
    [COSProgressAIndicatorCode]        NVARCHAR (100) NOT NULL,
    [COSProgressAIndicatorDescription] NVARCHAR (300) NOT NULL,
    [COSProgressBIndicatorCode]        NVARCHAR (100) NOT NULL,
    [COSProgressBIndicatorDescription] NVARCHAR (300) NOT NULL,
    [COSProgressCIndicatorCode]        NVARCHAR (100) NOT NULL,
    [COSProgressCIndicatorDescription] NVARCHAR (300) NOT NULL,
    CONSTRAINT [PK_DimChildOutcomeSummaryId] PRIMARY KEY CLUSTERED ([DimChildOutcomeSummaryId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressAIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the child demonstrates progress in positive social-emotional skills, including social relationships.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressAIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Progress A Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressAIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001504' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressAIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22476' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressAIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressAIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the child demonstrates progress in positive social-emotional skills, including social relationships.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressAIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Progress A Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressAIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001504' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressAIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22476' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressAIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressBIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the child demonstrates progress in acquisition and use of knowledge and skills, including early language/communication.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressBIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Progress B Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressBIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001505' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressBIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22477' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressBIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressBIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the child demonstrates progress in acquisition and use of knowledge and skills, including early language/communication.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressBIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Progress B Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressBIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001505' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressBIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22477' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressBIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressCIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the child demonstrates progress in use of appropriate behaviors to meet their needs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressCIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Progress C Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressCIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001506' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressCIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22478' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressCIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressCIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the child demonstrates progress in use of appropriate behaviors to meet their needs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressCIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Progress C Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressCIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001506' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressCIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22478' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSProgressCIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingACode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Child''s level of functioning in positive social-emotional skills (including social relationships).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingACode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Rating A' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingACode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001507' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingACode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22479' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingACode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingADescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Child''s level of functioning in positive social-emotional skills (including social relationships).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingADescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Rating A' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingADescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001507' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingADescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22479' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingADescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingBCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Child''s level of functioning in the acquisition and use of knowledge and skills (including early language/communication.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingBCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Rating B' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingBCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001508' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingBCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22480' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingBCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingBDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Child''s level of functioning in the acquisition and use of knowledge and skills (including early language/communication.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingBDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Rating B' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingBDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001508' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingBDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22480' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingBDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingCCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Child''s level of functioning in the use of appropriate behaviors to meet their needs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingCCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Rating C' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingCCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001509' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingCCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22481' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingCCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingCDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Child''s level of functioning in the use of appropriate behaviors to meet their needs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingCDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Outcomes Summary Rating C' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingCDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001509' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingCDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22481' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimChildOutcomeSummaries', @level2type=N'COLUMN',@level2name=N'COSRatingCDescription';
GO