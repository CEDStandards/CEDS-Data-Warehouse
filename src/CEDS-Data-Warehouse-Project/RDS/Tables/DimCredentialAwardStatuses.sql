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

ALTER TABLE [RDS].[DimCredentialAwardStatuses] ADD  DEFAULT ('MISSING') FOR [CredentialRevokedReasonCode]
GO

ALTER TABLE [RDS].[DimCredentialAwardStatuses] ADD  DEFAULT ('MISSING') FOR [CredentialRevokedReasonDescription]
GO

ALTER TABLE [RDS].[DimCredentialAwardStatuses] ADD  DEFAULT ('MISSING') FOR [AdultEducationCertificationTypeCode]
GO

ALTER TABLE [RDS].[DimCredentialAwardStatuses] ADD  DEFAULT ('MISSING') FOR [AdultEducationCertificationTypeDescription]
GO

ALTER TABLE [RDS].[DimCredentialAwardStatuses] ADD  DEFAULT ('MISSING') FOR [CredentialSuspensionIndicatorCode]
GO

ALTER TABLE [RDS].[DimCredentialAwardStatuses] ADD  DEFAULT ('MISSING') FOR [CredentialSuspensionIndicatorDescription]
GO


