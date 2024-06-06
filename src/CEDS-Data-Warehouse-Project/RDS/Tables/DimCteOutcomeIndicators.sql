CREATE TABLE [RDS].[DimCteOutcomeIndicators] (
    [DimCteOutcomeIndicatorId]                 INT            IDENTITY (1, 1) NOT NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode]                NVARCHAR (100) CONSTRAINT [DF_DimCteOutcomeIndicators_EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode] DEFAULT ('MISSING') NOT NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription]         NVARCHAR (300) CONSTRAINT [DF_DimCteOutcomeIndicators_EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode]     VARCHAR (50)   CONSTRAINT [DF_DimCteOutcomeIndicators_EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode]        NVARCHAR (100) CONSTRAINT [DF_DimCteOutcomeIndicators_EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode] DEFAULT ('MISSING') NOT NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription] NVARCHAR (300) CONSTRAINT [DF_DimCteOutcomeIndicators_EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode] VARCHAR (50)   CONSTRAINT [DF_DimCteOutcomeIndicators_EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimCteOutcomeIndicators] PRIMARY KEY CLUSTERED ([DimCteOutcomeIndicatorId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of academic or career and technical outcome attained while enrolled in the program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Academic or Career and Technical Outcome Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001978' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001978' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of academic or career and technical outcome attained while enrolled in the program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Academic or Career and Technical Outcome Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001978' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001978' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of academic or career and technical outcome attained up to 90 days after exiting the facility or program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Academic or Career and Technical Outcome Exit Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001979' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001979' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of academic or career and technical outcome attained up to 90 days after exiting the facility or program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Academic or Career and Technical Outcome Exit Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001979' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001979' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteOutcomeIndicators', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription';
GO




