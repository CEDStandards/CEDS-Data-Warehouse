CREATE TABLE [RDS].[DimCredentialAwardStatuses](
	[DimCredentialAwardStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CredentialRevokedIndicatorCode] [nvarchar](50) NOT NULL,
	[CredentialRevokedIndicatorDescription] [nvarchar](200) NOT NULL,
	[CredentialRevokedReasonCode] [nvarchar](50) NOT NULL,
	[CredentialRevokedReasonDescription] [nvarchar](200) NOT NULL,
	[AdultEducationCertificationTypeCode] [nvarchar](50) NOT NULL,
	[AdultEducationCertificationTypeDescription] [nvarchar](200) NOT NULL,
	[CredentialSuspensionIndicatorCode] [nvarchar](50) NOT NULL,
	[CredentialSuspensionIndicatorDescription] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_DimCredentialStatuses] PRIMARY KEY CLUSTERED 
(
	[DimCredentialAwardStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [RDS].[DimCredentialAwardStatuses] ADD  DEFAULT ('MISSING') FOR [CredentialRevokedIndicatorCode]
GO

ALTER TABLE [RDS].[DimCredentialAwardStatuses] ADD  DEFAULT ('MISSING') FOR [CredentialRevokedIndicatorDescription]
GO

ALTER TABLE [RDS].[DimCredentialAwardStatuses] ADD  DEFAULT ('MISSING') FOR [AdultEducationCertificationTypeCode]
GO

ALTER TABLE [RDS].[DimCredentialAwardStatuses] ADD  DEFAULT ('MISSING') FOR [AdultEducationCertificationTypeDescription]
GO

ALTER TABLE [RDS].[DimCredentialAwardStatuses] ADD  DEFAULT ('MISSING') FOR [CredentialSuspensionIndicatorCode]
GO

ALTER TABLE [RDS].[DimCredentialAwardStatuses] ADD  DEFAULT ('MISSING') FOR [CredentialSuspensionIndicatorDescription]
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCertificationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the category of the adult education certification a person holds.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCertificationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Certification Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCertificationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001085' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCertificationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001085' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCertificationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCertificationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the category of the adult education certification a person holds.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCertificationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Certification Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCertificationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001085' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCertificationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001085' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCertificationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates whether the credential has been revoked by the credential provider.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Revoked Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001751' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001751' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates whether the credential has been revoked by the credential provider.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Revoked Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001751' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001751' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Published reason for revocation of a credential award.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Revoked Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001661' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001661' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Published reason for revocation of a credential award.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Revoked Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001661' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001661' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwardStatuses', @level2type=N'COLUMN',@level2name=N'CredentialRevokedReasonDescription';
GO