CREATE VIEW [dbo].[vwDimCredentialAwardStatuses]
AS
  SELECT
    DimCredentialAwardStatusId,
    CredentialRevokedIndicatorCode,
    srd1.InputCode AS CredentialRevokedIndicatorMap,
    CredentialRevokedReasonCode,
    srd2.InputCode AS CredentialRevokedReasonMap,
    AdultEducationCertificationTypeCode,
    srd3.InputCode AS AdultEducationCertificationTypeMap,
    CredentialSuspensionIndicatorCode,
    srd4.InputCode AS CredentialSuspensionIndicatorMap
  FROM RDS.DimCredentialAwardStatuses dca
  CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
  LEFT JOIN Staging.SourceSystemReferenceData srd1
    ON dca.CredentialRevokedIndicatorCode = srd1.OutputCode
    AND srd1.TableName = 'RefCredentialRevokedIndicator'
  LEFT JOIN Staging.SourceSystemReferenceData srd2
    ON dca.CredentialRevokedReasonCode = srd2.OutputCode
    AND srd2.TableName = 'RefCredentialRevokedReason'
  LEFT JOIN Staging.SourceSystemReferenceData srd3
    ON dca.AdultEducationCertificationTypeCode = srd3.OutputCode
    AND srd3.TableName = 'RefAdultEducationCertificationType'
  LEFT JOIN Staging.SourceSystemReferenceData srd4
    ON dca.CredentialSuspensionIndicatorCode = srd4.OutputCode
    AND srd4.TableName = 'RefCredentialSuspensionIndicator'
