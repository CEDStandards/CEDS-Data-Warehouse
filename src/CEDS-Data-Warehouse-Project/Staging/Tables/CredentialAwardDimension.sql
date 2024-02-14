CREATE TABLE [Staging].[CredentialAwardDimension]
(
  	[Id]                                          INT NOT NULL IDENTITY(1,1),
	[ProfessionalCertificateOrLicenseNumber]      [nvarchar](30) NULL,
	[CredentialAdvancedStandingDescription]       [nvarchar](max) NULL,
	[CredentialAdvancedStandingURL]               [nvarchar](512) NULL,
	[CredentialEvidenceStatement]                 [nvarchar](300) NULL,
	[CredentialAwardStartDate]                    [date] NOT NULL,
	[CredentialAwardEndDate]                      [date] NULL,
	[CredentialCompletionDate]                    [date] NOT NULL,
	[CredentialRevokedDate]                       [date] NULL,
	[CredentialSuspensionStartDate]               [date] NULL,
	[CredentialSuspensionEndDate]                 [date] NULL
)
