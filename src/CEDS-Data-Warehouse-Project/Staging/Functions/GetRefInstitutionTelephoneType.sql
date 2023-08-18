CREATE FUNCTION Staging.GetRefInstitutionTelephoneType (@TelephoneTypeCode CHAR(2))
RETURNS INT
AS BEGIN
	DECLARE @RefInstitutionTelephoneTypeId INT
	
	SELECT @RefInstitutionTelephoneTypeId = RefInstitutionTelephoneTypeId FROM dbo.RefInstitutionTelephoneType WHERE Code = @TelephoneTypeCode

	RETURN @RefInstitutionTelephoneTypeId
END

GO

