CREATE FUNCTION Staging.GetRefIDEAEducationalEnvironmentSchoolAgeId (@EducationalEnvironmentCode VARCHAR(50))
RETURNS INT
AS BEGIN
	DECLARE @EducationalEnvironmentId INT

	SELECT @EducationalEnvironmentId = RefIDEAEducationalEnvironmentSchoolAgeId
    FROM dbo.[RefIDEAEducationalEnvironmentSchoolAge]
	WHERE Code = @EducationalEnvironmentCode

	RETURN (@EducationalEnvironmentId)
END

GO

