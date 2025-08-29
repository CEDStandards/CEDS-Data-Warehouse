CREATE TABLE [RDS].[DimCredentialAwards](
	[DimCredentialAwardId] [int] IDENTITY(1,1) NOT NULL,
	[ProfessionalCertificateOrLicenseNumber] [nvarchar](30) NULL,
	[CredentialAdvancedStandingDescription] [nvarchar](max) NULL,
	[CredentialAdvancedStandingURL] [nvarchar](512) NULL,
	[CredentialEvidenceStatement] [nvarchar](300) NULL,
	[CredentialRevokedReason] [nvarchar](max) NOT NULL,
	[CredentialAwardStartDate] [date] NOT NULL,
	[CredentialAwardEndDate] [date] NULL,
	[CredentialCompletionDate] [date] NOT NULL,
	[CredentialRevokedDate] [date] NULL,
	[CredentialSuspensionStartDate] [date] NULL,
	[CredentialSuspensionEndDate] [date] NULL,
 CONSTRAINT [PK_DimCredentialAwards] PRIMARY KEY CLUSTERED 
(
	[DimCredentialAwardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAdvancedStandingDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of a credential that reduced the time or cost of attaining this credential.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAdvancedStandingDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Advanced Standing Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAdvancedStandingDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001734' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAdvancedStandingDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001734' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAdvancedStandingDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAdvancedStandingURL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A URL that resolves to information about a credential that reduced the time or cost of attaining this credential.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAdvancedStandingURL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Advanced Standing URL' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAdvancedStandingURL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001735' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAdvancedStandingURL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001735' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAdvancedStandingURL';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAwardEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The date, if any, on which the qualification, achievement, personal or organizational quality, or aspect of an identity expires or requires renewal.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAwardEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Award End Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAwardEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001164' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAwardEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001164' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAwardEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAwardStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The date on which the qualification, achievement, personal or organizational quality, or aspect of an identity was conferred.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAwardStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Award Start Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAwardStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001163' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAwardStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001163' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialAwardStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialCompletionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The date on which the person''s requirements for earning a credential were met or completed.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialCompletionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Completion Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialCompletionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001664' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialCompletionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001664' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialCompletionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialEvidenceStatement';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A statement or reference describing the evidence that the learner met the criteria for attainment of the qualification, achievement, personal or organizational quality, or aspect of an identity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialEvidenceStatement';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Evidence Statement' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialEvidenceStatement';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000901' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialEvidenceStatement';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000901' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialEvidenceStatement';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialRevokedDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The date on which the qualification, achievement, personal or organizational quality, or aspect of an identity was revoked.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialRevokedDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Revoked Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialRevokedDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001660' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialRevokedDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001660' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialRevokedDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialRevokedReason';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Published reason for revocation of a credential award.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialRevokedReason';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Revoked Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialRevokedReason';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001661' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialRevokedReason';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001661' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'CredentialRevokedReason';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'ProfessionalCertificateOrLicenseNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number issued by the credentialing/licensing agency.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'ProfessionalCertificateOrLicenseNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Certificate or License Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'ProfessionalCertificateOrLicenseNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001429' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'ProfessionalCertificateOrLicenseNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001429' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialAwards', @level2type=N'COLUMN',@level2name=N'ProfessionalCertificateOrLicenseNumber';
GO