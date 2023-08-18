CREATE FUNCTION Staging.GetProgramTypeId (@ProgramTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @ProgramTypeId INT
	
	SELECT @ProgramTypeId = rpt.RefProgramTypeId
	FROM dbo.RefProgramType rpt
	WHERE rpt.Code = @ProgramTypeCode

	RETURN (@ProgramTypeId)
END

GO

