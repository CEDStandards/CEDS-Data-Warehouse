CREATE FUNCTION Staging.GetPersonIdentifierSystemId (@PersonIdentifierSystemCode VARCHAR(6), @PersonIdentifierTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @RefPersonIdentifierSystemId INT
	
          SELECT @RefPersonIdentifierSystemId = rpis.RefPersonIdentificationSystemId
          FROM dbo.RefPersonIdentificationSystem rpis
		  JOIN dbo.RefPersonIdentifierType rpit	
			ON rpis.RefPersonIdentifierTypeId = rpit.RefPersonIdentifierTypeId
          WHERE rpis.Code = @PersonIdentifierSystemCode
			AND rpit.Code = @PersonIdentifierTypeCode

	RETURN (@RefPersonIdentifierSystemId)
END

GO

