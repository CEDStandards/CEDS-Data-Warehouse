CREATE PROCEDURE [Staging].[Staging-to-FactCredentialAwards]
AS
BEGIN

  -- Insert data from Staging.CredentialAward into RDS.FactCredentialAwards
  INSERT INTO RDS.FactCredentialAwards (
      [CredentialIssuerId]
    , [CredentialDefinitionId]
    , [CredentialAwardRecipientPersonId]
    , [CredentialAwardStatusId]
    , [SchoolYearId]
    , [CredentialAwardId]
    , [AssessmentId]
    , [DataCollectionId]
    , [K12DemographicId]
    , [CredentialAwardCount]
  )
  SELECT
      ISNULL(rdci.[DimCredentialIssuerId], -1)
    , ISNULL(rdcd.[DimCredentialDefinitionId], -1)
    , ISNULL(rdp.[DimPersonId], -1)
    , ISNULL(rdcas.[DimCredentialAwardStatusId], -1)
    , ISNULL(rsy.[DimSchoolYearId], -1)
    , ISNULL(rdca.[DimCredentialAwardId], -1)
    , ISNULL(ra.[DimAssessmentId], -1)
    , ISNULL(rddc.[DimDataCollectionId], -1)
    , ISNULL(rdkd.[DimK12DemographicId], -1)
    , 1
  FROM Staging.CredentialAward sca
  JOIN RDS.DimSchoolYears rsy
    ON sca.SchoolYear = rsy.SchoolYear
  JOIN RDS.DimPeople rdp
    ON (sca.Role = 'K12Staff' 
        AND sca.PersonIdentifier = rdp.K12StaffStaffMemberIdentifierState)
      OR (sca.Role = 'K12Student'
        AND sca.PersonIdentifier = rdp.K12StudentStudentIdentifierState)
  JOIN RDS.DimCredentialDefinitions rdcd
    ON sca.CredentialDefinitionIdentifierCtid = rdcd.CredentialDefinitionIdentifierCtid
  JOIN RDS.DimCredentialAwards rdca
    ON sca.ProfessionalCertificateOrLicenseNumber = rdca.ProfessionalCertificateOrLicenseNumber
  LEFT JOIN RDS.DimCredentialIssuers rdci
    ON sca.CredentialIssuerOrganizationIdentifierSea = rdci.CredentialIssuerOrganizationIdentifierSea
  LEFT JOIN RDS.DimCredentialAwardStatuses rdcas
    ON sca.CredentialRevokedIndicatorCode = rdcas.CredentialRevokedIndicatorCode
    AND sca.CredentialRevokedReasonCode = rdcas.CredentialRevokedReasonCode
    AND sca.AdultEducationCertificationTypeCode = rdcas.AdultEducationCertificationTypeCode
    AND sca.CredentialSuspensionIndicatorCode = rdcas.CredentialSuspensionIndicatorCode
  LEFT JOIN RDS.DimAssessments ra
    ON sca.AssessmentIdentifierState = ra.AssessmentIdentifierState
  LEFT JOIN RDS.DimDataCollections rddc
    ON sca.DataCollectionName = rddc.DataCollectionName
  LEFT JOIN RDS.vwDimK12Demographics rdkd
    ON ISNULL(sca.SexCode, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)


  INSERT INTO RDS.BridgeCredentialAwardRelatedCredentialAwards
  (
      FactCredentialAwardId
    , RelatedFactCredentialAwardId
    , CredentialAwardRelationshipCode 
    , CredentialAwardRelationshipDescription
  )
  SELECT
      ISNULL(rfca.[FactCredentialAwardId], -1)
    , ISNULL(rfcarelated.[FactCredentialAwardId], -1)
    , scarca.[CredentialAwardRelationshipCode]
    , scarca.[CredentialAwardRelationshipDescription]
  FROM Staging.CredentialAwardRelatedCredentialAward scarca
  JOIN RDS.DimCredentialAwards rdca
    ON scarca.ProfessionalCertificateOrLicenseNumber = rdca.ProfessionalCertificateOrLicenseNumber
  JOIN RDS.FactCredentialAwards rfca
    ON rdca.DimCredentialAwardId = rfca.CredentialAwardId
  JOIN RDS.DimCredentialAwards rdcarelated
    ON scarca.RelatedProfessionalCertificateOrLicenseNumber = rdcarelated.ProfessionalCertificateOrLicenseNumber
  JOIN RDS.FactCredentialAwards rfcarelated
    ON rdcarelated.DimCredentialAwardId = rfcarelated.CredentialAwardId
END
