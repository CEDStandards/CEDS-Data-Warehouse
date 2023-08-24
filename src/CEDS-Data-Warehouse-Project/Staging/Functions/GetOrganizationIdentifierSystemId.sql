CREATE FUNCTION Staging.GetOrganizationIdentifierSystemId (@OrganizationIdentifierSystemCode VARCHAR(100), @OrganizationIdentifierTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @RefOrganizationIdentifierSystemId INT
	
          SELECT @RefOrganizationIdentifierSystemId = rois.RefOrganizationIdentificationSystemId
          FROM dbo.RefOrganizationIdentificationSystem rois
		  JOIN dbo.RefOrganizationIdentifierType roit
			ON rois.RefOrganizationIdentifierTypeId = roit.RefOrganizationIdentifierTypeId
          WHERE rois.Code = @OrganizationIdentifierSystemCode
			AND roit.Code = @OrganizationIdentifierTypeCode

	RETURN (@RefOrganizationIdentifierSystemId)
END

GO

