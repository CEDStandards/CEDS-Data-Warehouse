CREATE TABLE [RDS].[DimCredentialAwards](
	[DimCredentialAwardId] [int] IDENTITY(1,1) NOT NULL,
	[ProfessionalCertificateOrLicenseNumber] [nvarchar](30) NULL,
	[CredentialAdvancedStandingDescription] [nvarchar](max) NULL,
	[CredentialAdvancedStandingURL] [nvarchar](512) NULL,
	[CredentialEvidenceStatement] [nvarchar](300) NULL,
	[CredentialAwardStartDate] [date] NOT NULL,
	[CredentialAwardEndDate] [date] NULL,
	[CredentialCompletionDate] [date] NOT NULL,
	[CredentialRevokedDate] [date] NULL,
	[CredentialSuspensionStartDate] [date] NULL,
	[CredentialSuspensionEndDate] [date] NULL,
 CONSTRAINT [PK_DimCredentialAwrads] PRIMARY KEY CLUSTERED 
(
	[DimCredentialAwardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


