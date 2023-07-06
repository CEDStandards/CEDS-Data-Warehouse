CREATE FUNCTION Staging.GetOrganizationIdentifierTypeId (@OrganizationIdentifierTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @RefOrganizationIdentifierTypeId INT
	
	SELECT @RefOrganizationIdentifierTypeId = roit.RefOrganizationIdentifierTypeId
    FROM dbo.RefOrganizationIdentifierType roit
    WHERE roit.Code = @OrganizationIdentifierTypeCode -- 'State Agency Identification System'

	RETURN (@RefOrganizationIdentifierTypeId)
END

GO

