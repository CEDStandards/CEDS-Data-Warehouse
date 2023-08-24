CREATE FUNCTION Staging.GetOrganizationTypeId (@OrganizationTypeCode VARCHAR(100), @OrganizationElementTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @RefOrganizationTypeId INT

	SELECT @RefOrganizationTypeId = rot.RefOrganizationTypeId
    FROM dbo.RefOrganizationType rot
    JOIN dbo.RefOrganizationElementType roet 
		ON rot.RefOrganizationElementTypeId = roet.RefOrganizationElementTypeId
	WHERE rot.Code = @OrganizationTypeCode
      AND roet.Code = @OrganizationElementTypeCode

	RETURN (@RefOrganizationTypeId)
END

GO

