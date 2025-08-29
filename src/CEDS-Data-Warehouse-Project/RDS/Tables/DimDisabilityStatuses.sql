CREATE TABLE [RDS].[DimDisabilityStatuses] (
    [DimDisabilityStatusId]                        INT            IDENTITY (1, 1) NOT NULL,
    [DisabilityStatusCode]                         NVARCHAR (100) CONSTRAINT [DF_DimDisabilityStatuses_DisabilityStatusCode] DEFAULT ('MISSING') NOT NULL,
    [DisabilityStatusDescription]                  NVARCHAR (300) CONSTRAINT [DF_DimDisabilityStatuses_DisabilityStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [Section504StatusCode]                         NVARCHAR (100) CONSTRAINT [DF_DimDisabilityStatuses_Section504StatusCode] DEFAULT ('MISSING') NOT NULL,
    [Section504StatusDescription]                  NVARCHAR (300) CONSTRAINT [DF_DimDisabilityStatuses_Section504StatusDescription] DEFAULT ('MISSING') NOT NULL,
    [Section504StatusEdFactsCode]                  NVARCHAR (50)  CONSTRAINT [DF_DimDisabilityStatuses_Section504StatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [DisabilityConditionTypeCode]                  NVARCHAR (100) CONSTRAINT [DF_DimDisabilityStatuses_DisabilityConditionTypeCode] DEFAULT ('MISSING') NOT NULL,
    [DisabilityConditionTypeDescription]           NVARCHAR (300) CONSTRAINT [DF_DimDisabilityStatuses_DisabilityConditionTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [DisabilityDeterminationSourceTypeCode]        NVARCHAR (100) CONSTRAINT [DF_DimDisabilityStatuses_DisabilityDeterminationSourceTypeCode] DEFAULT ('MISSING') NOT NULL,
    [DisabilityDeterminationSourceTypeDescription] NVARCHAR (300) CONSTRAINT [DF_DimDisabilityStatuses_DisabilityDeterminationSourceTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimDisabilityStatuses] PRIMARY KEY CLUSTERED ([DimDisabilityStatusId] ASC) WITH (FILLFACTOR = 80)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimDisabilityStatuses_Codes]
    ON [RDS].[DimDisabilityStatuses]([DisabilityStatusCode] ASC, [Section504StatusCode] ASC, [DisabilityConditionTypeCode] ASC, [DisabilityDeterminationSourceTypeCode] ASC);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityConditionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Codes identifying the set of disability conditions.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityConditionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Disability Condition Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityConditionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001320' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityConditionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22286' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityConditionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityConditionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Codes identifying the set of disability conditions.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityConditionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Disability Condition Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityConditionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001320' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityConditionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22286' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityConditionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityDeterminationSourceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Codes identifying the set of disability determination sources.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityDeterminationSourceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Disability Determination Source Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityDeterminationSourceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001321' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityDeterminationSourceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22287' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityDeterminationSourceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityDeterminationSourceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Codes identifying the set of disability determination sources.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityDeterminationSourceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Disability Determination Source Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityDeterminationSourceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001321' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityDeterminationSourceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22287' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityDeterminationSourceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a person is classified as disabled under the American''s with Disability Act (ADA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Disability Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000577' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21569' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a person is classified as disabled under the American''s with Disability Act (ADA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Disability Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000577' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21569' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'DisabilityStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'Section504StatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Individuals with disabilities who are being provided with related aids and services under Section 504 of the Rehabilitation Act of 1973, as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'Section504StatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Section 504 Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'Section504StatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000249' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'Section504StatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21249' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'Section504StatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'Section504StatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Individuals with disabilities who are being provided with related aids and services under Section 504 of the Rehabilitation Act of 1973, as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'Section504StatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Section 504 Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'Section504StatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000249' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'Section504StatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21249' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'Section504StatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'Section504StatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Individuals with disabilities who are being provided with related aids and services under Section 504 of the Rehabilitation Act of 1973, as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'Section504StatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Section 504 Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'Section504StatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000249' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'Section504StatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21249' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisabilityStatuses', @level2type=N'COLUMN',@level2name=N'Section504StatusEdFactsCode';
GO