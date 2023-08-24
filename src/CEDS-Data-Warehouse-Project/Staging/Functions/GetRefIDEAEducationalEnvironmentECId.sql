CREATE FUNCTION Staging.GetRefIDEAEducationalEnvironmentECId (@EducationalEnvironmentCode VARCHAR(50))
RETURNS INT
AS BEGIN
	DECLARE @EducationalEnvironmentId INT

	SELECT @EducationalEnvironmentId = RefIDEAEducationalEnvironmentECId
    FROM dbo.[RefIDEAEducationalEnvironmentEC]
	WHERE Code = @EducationalEnvironmentCode

	RETURN (@EducationalEnvironmentId)
END

GO

