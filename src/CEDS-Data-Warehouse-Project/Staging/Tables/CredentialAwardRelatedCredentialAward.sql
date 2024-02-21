CREATE TABLE [Staging].[CredentialAwardRelatedCredentialAward]
(
  [Id] INT NOT NULL IDENTITY(1,1),
	[ProfessionalCertificateOrLicenseNumber]                  [nvarchar](30) NULL,
	[RelatedProfessionalCertificateOrLicenseNumber]           [nvarchar](30) NULL,
	[CredentialAwardRelationshipCode]                         [nvarchar](50) NULL,
	[CredentialAwardRelationshipDescription]                  [nvarchar](200) NULL
)
