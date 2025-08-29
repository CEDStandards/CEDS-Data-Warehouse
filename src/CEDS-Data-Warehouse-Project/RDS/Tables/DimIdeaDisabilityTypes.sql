CREATE TABLE [RDS].[DimIdeaDisabilityTypes] (
    [DimIdeaDisabilityTypeId]       INT            IDENTITY (1, 1) NOT NULL,
    [IdeaDisabilityTypeCode]        NVARCHAR (100) CONSTRAINT [DF_DimIdeaDisabilityTypes_IdeaDisabilityTypeCode] DEFAULT ('MISSING') NOT NULL,
    [IdeaDisabilityTypeDescription] NVARCHAR (300) CONSTRAINT [DF_DimIdeaDisabilityTypes_IdeaDisabilityTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [IdeaDisabilityTypeEdFactsCode] NVARCHAR (50)  CONSTRAINT [DF_DimIdeaDisabilityTypes_IdeaDisabilityTypeEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimIdeaDisabilityTypes] PRIMARY KEY CLUSTERED ([DimIdeaDisabilityTypeId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaDisabilityTypes', @level2type=N'COLUMN',@level2name=N'IdeaDisabilityTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The major or overriding disability condition that best describes a person''s impairment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaDisabilityTypes', @level2type=N'COLUMN',@level2name=N'IdeaDisabilityTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Primary Disability Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaDisabilityTypes', @level2type=N'COLUMN',@level2name=N'IdeaDisabilityTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000218' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaDisabilityTypes', @level2type=N'COLUMN',@level2name=N'IdeaDisabilityTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21218' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaDisabilityTypes', @level2type=N'COLUMN',@level2name=N'IdeaDisabilityTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaDisabilityTypes', @level2type=N'COLUMN',@level2name=N'IdeaDisabilityTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The major or overriding disability condition that best describes a person''s impairment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaDisabilityTypes', @level2type=N'COLUMN',@level2name=N'IdeaDisabilityTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Primary Disability Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaDisabilityTypes', @level2type=N'COLUMN',@level2name=N'IdeaDisabilityTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000218' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaDisabilityTypes', @level2type=N'COLUMN',@level2name=N'IdeaDisabilityTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21218' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaDisabilityTypes', @level2type=N'COLUMN',@level2name=N'IdeaDisabilityTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaDisabilityTypes', @level2type=N'COLUMN',@level2name=N'IdeaDisabilityTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The major or overriding disability condition that best describes a person''s impairment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaDisabilityTypes', @level2type=N'COLUMN',@level2name=N'IdeaDisabilityTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Primary Disability Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaDisabilityTypes', @level2type=N'COLUMN',@level2name=N'IdeaDisabilityTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000218' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaDisabilityTypes', @level2type=N'COLUMN',@level2name=N'IdeaDisabilityTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21218' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaDisabilityTypes', @level2type=N'COLUMN',@level2name=N'IdeaDisabilityTypeEdFactsCode';
GO