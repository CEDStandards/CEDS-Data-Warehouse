CREATE FUNCTION Staging.GetPersonIdentifierTypeId (@PersonIdentifierTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @RefPersonIdentifierTypeId INT
	
	SELECT @RefPersonIdentifierTypeId = rpit.RefPersonIdentifierTypeId
    FROM dbo.RefPersonIdentifierType rpit
    WHERE rpit.Code = @PersonIdentifierTypeCode -- 'State Agency Identification System'

	RETURN (@RefPersonIdentifierTypeId)
END

GO

