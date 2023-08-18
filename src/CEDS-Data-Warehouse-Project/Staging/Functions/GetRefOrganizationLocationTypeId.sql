CREATE FUNCTION Staging.GetRefOrganizationLocationTypeId (@OrganizationLocationTypeCode VARCHAR(50))
RETURNS INT
AS BEGIN
	DECLARE @OrganizationLocationTypeId INT

	SELECT @OrganizationLocationTypeId = RefOrganizationLocationTypeId
    FROM dbo.[RefOrganizationLocationType]
	WHERE Code = @OrganizationLocationTypeCode

	RETURN (@OrganizationLocationTypeId)
END

GO

