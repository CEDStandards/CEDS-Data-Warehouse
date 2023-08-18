CREATE FUNCTION Staging.GetRoleId (@RoleName VARCHAR(30))
RETURNS INT
AS BEGIN
	DECLARE @RoleId INT
	
          SELECT @RoleId = RoleID
          FROM dbo.[Role]
          WHERE [Name] = @RoleName
		  
	RETURN (@RoleId)
END

GO

