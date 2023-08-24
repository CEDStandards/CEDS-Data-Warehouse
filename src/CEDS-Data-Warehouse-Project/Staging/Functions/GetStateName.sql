CREATE FUNCTION [Staging].[GetStateName] (@StateAbbreviation CHAR(2))
RETURNS VARCHAR(50)
AS BEGIN
	DECLARE @StateName VARCHAR(50)

	SELECT @StateName = [Definition] FROM dbo.RefState WHERE Code = @StateAbbreviation

	RETURN @StateName

END

GO

