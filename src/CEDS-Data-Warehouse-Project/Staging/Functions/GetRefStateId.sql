CREATE FUNCTION Staging.GetRefStateId (@StateAbbreviation CHAR(2))
RETURNS INT
AS BEGIN
	DECLARE @RefStateId INT
	
	SELECT @RefStateId = RefStateId FROM dbo.RefState WHERE Code = @StateAbbreviation

	RETURN @RefStateId
END

GO

