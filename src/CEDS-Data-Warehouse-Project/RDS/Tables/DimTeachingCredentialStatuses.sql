CREATE TABLE [RDS].[DimTeachingCredentialStatuses] (
    [DimTeachingCredentialStatusId]                         INT            IDENTITY (1, 1) NOT NULL,
    [TeachingCredentialTypeCode]                            NVARCHAR (50)  CONSTRAINT [DF_DimTeachingCredentialStatuses_TeachingCredentialTypeCode] DEFAULT ('MISSING') NOT NULL,
    [TeachingCredentialTypeDescription]                     NVARCHAR (200) CONSTRAINT [DF_DimTeachingCredentialStatuses_TeachingCredentialTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [TeachingCredentialTypeEdFactsCode]                     NVARCHAR (50)  CONSTRAINT [DF_DimTeachingCredentialStatuses_TeachingCredentialTypeEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [TeachingCredentialBasisCode]                           NVARCHAR (50)  CONSTRAINT [DF_DimTeachingCredentialStatuses_TeachingCredentialBasisCode] DEFAULT ('MISSING') NOT NULL,
    [TeachingCredentialBasisDescription]                    NVARCHAR (200) CONSTRAINT [DF_DimTeachingCredentialStatuses_TeachingCredentialBasisDescription] DEFAULT ('MISSING') NOT NULL,        
   CONSTRAINT [PK_DimTeachingCredentialStatuses] PRIMARY KEY CLUSTERED ([DimTeachingCredentialStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);

GO
CREATE NONCLUSTERED COLUMNSTORE INDEX CSI_DimTeachingCredentialStatuses ON RDS.DimTeachingCredentialStatuses (
  [TeachingCredentialTypeCode]
, [TeachingCredentialBasisCode]
)

GO

CREATE NONCLUSTERED INDEX [IX_DimTeachingCredentialStatuses_TeachingCredentialTypeEdFactsCode]
    ON [RDS].[DimTeachingCredentialStatuses]([TeachingCredentialTypeEdFactsCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTeachingCredentialStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the category of a legal document giving authorization to perform teaching assignment services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTeachingCredentialStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Teaching Credential Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTeachingCredentialStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000278' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTeachingCredentialStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21278' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTeachingCredentialStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTeachingCredentialStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the category of a legal document giving authorization to perform teaching assignment services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTeachingCredentialStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Teaching Credential Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTeachingCredentialStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000278' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTeachingCredentialStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21278' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTeachingCredentialStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTeachingCredentialStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the category of a legal document giving authorization to perform teaching assignment services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTeachingCredentialStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Teaching Credential Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTeachingCredentialStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000278' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTeachingCredentialStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21278' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTeachingCredentialStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeEdFactsCode';
GO