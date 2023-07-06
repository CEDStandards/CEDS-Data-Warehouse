CREATE FUNCTION Staging.GetRefPersonIdentificationSystemId (@PersonIdentificationSystemCode VARCHAR(20), @PersonIdentifierTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @PersonIdentificationSystemId INT
	
	SELECT @PersonIdentificationSystemId = r.RefPersonIdentificationSystemId 
	FROM dbo.RefPersonIdentificationSystem r 
	JOIN dbo.RefPersonIdentifierType rpt 
		ON r.RefPersonIdentifierTypeId = rpt.RefPersonIdentifierTypeId 
	WHERE r.Code = @PersonIdentificationSystemCode 
		AND rpt.Code = @PersonIdentifierTypeCode

	RETURN (@PersonIdentificationSystemId)
END

GO

