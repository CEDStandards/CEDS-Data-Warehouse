CREATE FUNCTION Staging.GetRefPersonalInformationVerificationId (@PersonalInformationVerificationCode VARCHAR(20))
RETURNS INT
AS BEGIN
	DECLARE @PersonalInformationVerificationId INT
	
	SELECT @PersonalInformationVerificationId = r.RefPersonalInformationVerificationId 
	FROM dbo.RefPersonalInformationVerification r 
	WHERE Code = @PersonalInformationVerificationCode

	RETURN (@PersonalInformationVerificationId)
END

GO

