CREATE TABLE [Staging].[CredentialAward]
(
  [Id]                                                            INT NOT NULL IDENTITY(1,1),
  [SchoolYear]                                                    [smallint] NULL,
  [CredentialIssuerOrganizationIdentifierSea]                     [nvarchar](50) NULL,
  [CredentialDefinitionIdentifierCtid]                            [nvarchar](512) NULL,
  [PersonIdentifier]                                              [nvarchar](40) NULL, 
  [Role]                                                          [nvarchar](50) NULL,
  [PersonIdentificatonSystemCode]                                 [nvarchar](50) NULL,
	[ProfessionalCertificateOrLicenseNumber]                        [nvarchar](30) NULL,
  [CredentialRevokedIndicatorCode]                                [nvarchar](50) NULL,
  [CredentialRevokedReasonCode]                                   [nvarchar](50) NULL,
  [AdultEducationCertificationTypeCode]                           [nvarchar](50) NULL,
  [CredentialSuspensionIndicatorCode]                             [nvarchar](50) NULL,
  [AssessmentIdentifierState]                                     [nvarchar](40) NULL, 
  [SexCode]                                                       [nvarchar](50) NULL,
  [DataCollectionName]                                            [nvarchar](100) NULL
)
