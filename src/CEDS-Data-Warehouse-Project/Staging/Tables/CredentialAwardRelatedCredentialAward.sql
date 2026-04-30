CREATE TABLE [Staging].[CredentialAwardRelatedCredentialAward]
(
  [Id] INT NOT NULL IDENTITY(1,1),
	[ProfessionalCertificateOrLicenseNumber]                  [nvarchar](30) NULL,
	[RelatedProfessionalCertificateOrLicenseNumber]           [nvarchar](30) NULL,
	[CredentialAwardRelationshipTypeCode]                         [nvarchar](50) NULL,
	[CredentialAwardRelationshipTypeDescription]                  [nvarchar](200) NULL
)
