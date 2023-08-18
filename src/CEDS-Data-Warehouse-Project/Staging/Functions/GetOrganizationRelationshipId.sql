CREATE FUNCTION [Staging].[GetOrganizationRelationshipId] (@OrganizationTypeCode VARCHAR(100))
RETURNS INT
AS BEGIN
	DECLARE @RefOrganizationRelationshipId INT

	SELECT @RefOrganizationRelationshipId = rot.RefOrganizationRelationshipId
    FROM dbo.RefOrganizationRelationship rot
    WHERE rot.Code = @OrganizationTypeCode
    
	RETURN (@RefOrganizationRelationshipId)
END

GO

