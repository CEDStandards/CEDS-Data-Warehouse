CREATE FUNCTION Staging.GetRefStateAnsiCode (@StateName VARCHAR(30))
RETURNS CHAR(2)
AS BEGIN
	DECLARE @RefStateAnsiCode CHAR(2)
	
	SELECT @RefStateAnsiCode = Code FROM dbo.RefStateAnsiCode WHERE [Description] = @StateName

	RETURN @RefStateAnsiCode 
END

GO

