CREATE TABLE [RDS].[DimComprehensiveAndTargetedSupports] (
    [DimComprehensiveAndTargetedSupportId]                     INT           IDENTITY (1, 1) NOT NULL,
    [AdditionalTargetedSupportAndImprovementStatusCode]        VARCHAR (50)  CONSTRAINT [DF_DimComprehensiveAndTargetedSupports_AdditionalTargetedSupportAndImprovementStatusCode] DEFAULT ('MISSING') NOT NULL,
    [AdditionalTargetedSupportAndImprovementStatusDescription] VARCHAR (200) CONSTRAINT [DF_DimComprehensiveAndTargetedSupports_AdditionalTargetedSupportAndImprovementStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [AdditionalTargetedSupportAndImprovementStatusEDFactsCode] VARCHAR (50)  CONSTRAINT [DF_DimComprehensiveAndTargetedSupports_AdditionalTargetedSupportAndImprovementStatusEDFactsCode] DEFAULT ('MISSING') NOT NULL,
    [ComprehensiveSupportAndImprovementStatusCode]             VARCHAR (50)  CONSTRAINT [DF_DimComprehensiveAndTargetedSupports_ComprehensiveSupportAndImprovementStatusCode] DEFAULT ('MISSING') NOT NULL,
    [ComprehensiveSupportAndImprovementStatusDescription]      VARCHAR (200) CONSTRAINT [DF_DimComprehensiveAndTargetedSupports_ComprehensiveSupportAndImprovementStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [ComprehensiveSupportAndImprovementStatusEdFactsCode]      VARCHAR (50)  CONSTRAINT [DF_DimComprehensiveAndTargetedSupports_ComprehensiveSupportAndImprovementStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [TargetedSupportAndImprovementStatusCode]                  VARCHAR (50)  CONSTRAINT [DF_DimComprehensiveAndTargetedSupports_TargetedSupportAndImprovementStatusCode] DEFAULT ('MISSING') NOT NULL,
    [TargetedSupportAndImprovementStatusDescription]           VARCHAR (200) CONSTRAINT [DF_DimComprehensiveAndTargetedSupports_TargetedSupportAndImprovementStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [TargetedSupportAndImprovementStatusEdFactsCode]           VARCHAR (50)  CONSTRAINT [DF_DimComprehensiveAndTargetedSupports_TargetedSupportAndImprovementStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimComprehensiveAndTargetedSupport] PRIMARY KEY CLUSTERED ([DimComprehensiveAndTargetedSupportId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'AdditionalTargetedSupportAndImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The designation given to a school by the state for additional targeted support and improvement as part of its statewide system of annual meaningful differentiation.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'AdditionalTargetedSupportAndImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Additional Targeted Support and Improvement Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'AdditionalTargetedSupportAndImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001925' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'AdditionalTargetedSupportAndImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22902' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'AdditionalTargetedSupportAndImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'AdditionalTargetedSupportAndImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The designation given to a school by the state for additional targeted support and improvement as part of its statewide system of annual meaningful differentiation.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'AdditionalTargetedSupportAndImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Additional Targeted Support and Improvement Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'AdditionalTargetedSupportAndImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001925' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'AdditionalTargetedSupportAndImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22902' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'AdditionalTargetedSupportAndImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'AdditionalTargetedSupportAndImprovementStatusEDFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The designation given to a school by the state for additional targeted support and improvement as part of its statewide system of annual meaningful differentiation.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'AdditionalTargetedSupportAndImprovementStatusEDFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Additional Targeted Support and Improvement Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'AdditionalTargetedSupportAndImprovementStatusEDFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001925' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'AdditionalTargetedSupportAndImprovementStatusEDFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22902' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'AdditionalTargetedSupportAndImprovementStatusEDFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'ComprehensiveSupportAndImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The designation given to a school by the state for comprehensive support and improvement as part of its statewide system of annual meaningful differentiation.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'ComprehensiveSupportAndImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Comprehensive Support and Improvement Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'ComprehensiveSupportAndImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001923' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'ComprehensiveSupportAndImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22904' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'ComprehensiveSupportAndImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'ComprehensiveSupportAndImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The designation given to a school by the state for comprehensive support and improvement as part of its statewide system of annual meaningful differentiation.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'ComprehensiveSupportAndImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Comprehensive Support and Improvement Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'ComprehensiveSupportAndImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001923' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'ComprehensiveSupportAndImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22904' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'ComprehensiveSupportAndImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'ComprehensiveSupportAndImprovementStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The designation given to a school by the state for comprehensive support and improvement as part of its statewide system of annual meaningful differentiation.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'ComprehensiveSupportAndImprovementStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Comprehensive Support and Improvement Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'ComprehensiveSupportAndImprovementStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001923' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'ComprehensiveSupportAndImprovementStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22904' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'ComprehensiveSupportAndImprovementStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'TargetedSupportAndImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The designation given to a school by the state for targeted support and improvement as part of its statewide system of annual meaningful differentiation.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'TargetedSupportAndImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Targeted Support and Improvement Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'TargetedSupportAndImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001924' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'TargetedSupportAndImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22910' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'TargetedSupportAndImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'TargetedSupportAndImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The designation given to a school by the state for targeted support and improvement as part of its statewide system of annual meaningful differentiation.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'TargetedSupportAndImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Targeted Support and Improvement Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'TargetedSupportAndImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001924' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'TargetedSupportAndImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22910' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'TargetedSupportAndImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'TargetedSupportAndImprovementStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The designation given to a school by the state for targeted support and improvement as part of its statewide system of annual meaningful differentiation.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'TargetedSupportAndImprovementStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Targeted Support and Improvement Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'TargetedSupportAndImprovementStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001924' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'TargetedSupportAndImprovementStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22910' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimComprehensiveAndTargetedSupports', @level2type=N'COLUMN',@level2name=N'TargetedSupportAndImprovementStatusEdFactsCode';
GO