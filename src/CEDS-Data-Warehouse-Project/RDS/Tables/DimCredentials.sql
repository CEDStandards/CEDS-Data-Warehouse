CREATE TABLE [RDS].[DimCredentials] (
    [DimCredentialId]                                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [CredentialDefinitionTitle]                           NVARCHAR (300) NOT NULL,
    [CredentialDefinitionDescription]                     NVARCHAR (MAX) NOT NULL,
    [CredentialDefinitionAlternateName]                   NVARCHAR (300) NULL,
    [CredentialDefinitionCategorySystem]                  NVARCHAR (30)  NULL,
    [CredentialDefinitionCategoryType]                    NVARCHAR (60)  NULL,
    [CredentialDefinitionStatusTypeCode]                  NVARCHAR (50)  CONSTRAINT [DF_DimCredentials_CredentialDefinitionStatusTypeCode] DEFAULT ('MISSING') NOT NULL,
    [CredentialDefinitionStatusTypeDescription]           NVARCHAR (300) CONSTRAINT [DF_DimCredentials_CredentialDefinitionStatusTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [CredentialDefinitionIntendedPurposeTypeCode]         NVARCHAR (50)  CONSTRAINT [DF_DimCredentials_CredentialDefinitionIntendedPurposeTypeCode] DEFAULT ('MISSING') NOT NULL,
    [CredentialDefinitionIntendedPurposeTypeDescription]  NVARCHAR (300) CONSTRAINT [DF_DimCredentials_CredentialDefinitionIntendedPurposeTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [CredentialDefinitionAssessmentMethodTypeCode]        NVARCHAR (50)  CONSTRAINT [DF_DimCredentials_CredentialDefinitionAssessmentMethodTypeCode] DEFAULT ('MISSING') NOT NULL,
    [CredentialDefinitionAssessmentMethodTypeDescription] NVARCHAR (300) CONSTRAINT [DF_DimCredentials_CredentialDefinitionAssessmentMethodTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimCredentials] PRIMARY KEY CLUSTERED ([DimCredentialId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimCredentials_Codes]
    ON [RDS].[DimCredentials]([CredentialDefinitionCategorySystem] ASC, [CredentialDefinitionCategoryType] ASC, [CredentialDefinitionStatusTypeCode] ASC, [CredentialDefinitionIntendedPurposeTypeCode] ASC, [CredentialDefinitionAssessmentMethodTypeCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimCredentials_CredentialDefinitionTitle]
    ON [RDS].[DimCredentials]([CredentialDefinitionTitle] ASC);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAlternateName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An alias for the credential, which may include acronyms, alpha-numeric notations, and other forms of name abbreviations in common use such as PhD, MA, and BA.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAlternateName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Alternate Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAlternateName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001736' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAlternateName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22717' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAlternateName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method used to conduct the assessment being referenced.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Assessment Method Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001738' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22719' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method used to conduct the assessment being referenced.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Assessment Method Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001738' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22719' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionCategorySystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The system that defines the categories of the qualification, achievement, personal or organizational quality, or aspect of an identity used in Credential Category Type.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionCategorySystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Category System' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionCategorySystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001245' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionCategorySystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22211' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionCategorySystem';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionCategoryType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A category for defining the qualification, achievement, personal or organizational quality, or aspect of an identity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionCategoryType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Category Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionCategoryType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000892' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionCategoryType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21892' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionCategoryType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the qualification, achievement, personal or organizational quality, or aspect of an identity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000895' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21895' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The intended type of application of the credential by the holder.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Intended Purpose Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001749' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22730' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The intended type of application of the credential by the holder.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Intended Purpose Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001749' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22730' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The status of the credential offered by a credentialing organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Status Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001740' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22721' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The status of the credential offered by a credentialing organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Status Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001740' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22721' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The title assigned to a qualification, achievement, personal or organizational quality, or aspect of an identity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Title' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000893' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21893' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionTitle';
GO