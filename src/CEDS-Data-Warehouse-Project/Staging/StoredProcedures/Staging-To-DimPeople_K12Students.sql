CREATE PROCEDURE [Staging].[Staging-To-DimPeople_K12Students]
	@dataCollectionId INT = NULL
AS
BEGIN

	SET NOCOUNT ON;

	BEGIN TRY

		IF NOT EXISTS (SELECT 1 FROM RDS.DimPeople WHERE DimPersonId = -1)
		BEGIN

			SET IDENTITY_INSERT RDS.DimPeople ON

			INSERT INTO RDS.DimPeople
			(DimPersonId)
			VALUES
			(-1)
	
			SET IDENTITY_INSERT RDS.DimPeople off
		END

		CREATE TABLE #k12Students (
			FirstName										NVARCHAR(50) NULL
			, MiddleName									NVARCHAR(50) NULL
			, LastOrSurname									NVARCHAR(50) NULL
			, BirthDate										DATE NULL
			, K12StudentStudentIdentifierState				NVARCHAR(40) NULL
			, IsActiveK12Student							BIT NULL
			, RecordStartDateTime							DATE NULL
			, RecordEndDateTime								DATE NULL
		)
		
		INSERT INTO #k12Students (
			FirstName
			, MiddleName
			, LastOrSurname
			, BirthDate
			, K12StudentStudentIdentifierState
			, IsActiveK12Student
			, RecordStartDateTime
			, RecordEndDateTime
		)		
		SELECT DISTINCT
			FirstName
			, MiddleName
			, LastOrSurname
			, BirthDate
			, StudentIdentifierState
			, 1
			, e.EnrollmentEntryDate
			, e.EnrollmentExitDate
		FROM Staging.K12Enrollment e

		MERGE rds.DimPeople AS trgt
		USING #k12Students AS src
				ON  trgt.K12StudentStudentIdentifierState = src.K12StudentStudentIdentifierState
				AND ISNULL(trgt.FirstName, '') = ISNULL(src.FirstName, '')
				AND ISNULL(trgt.LastOrSurname, '') = ISNULL(src.LastOrSurname, '')
				AND ISNULL(trgt.MiddleName, '') = ISNULL(src.MiddleName, '')
				AND ISNULL(trgt.BirthDate, '1900-01-01') = ISNULL(src.BirthDate, '1900-01-01')
				AND trgt.IsActiveK12Student = 1
				AND trgt.RecordStartDateTime = src.RecordStartDateTime
		WHEN NOT MATCHED BY TARGET THEN     --- Records Exists in Source but NOT in Target
		INSERT (
			FirstName
			, MiddleName
			, LastOrSurname
			, BirthDate
			, K12StudentStudentIdentifierState
			, IsActiveK12Student
			, RecordStartDateTime
			, RecordEndDateTime
		)
		VALUES (
			src.FirstName
			, src.MiddleName
			, src.LastOrSurname
			, src.Birthdate
			, src.K12StudentStudentIdentifierState
			, src.IsActiveK12Student
			, src.RecordStartDateTime
			, src.RecordEndDateTime
		);

		--End date previous records
		;WITH upd AS (
			SELECT 
				  startd.K12StudentStudentIdentifierState
				, startd.RecordStartDateTime
				, dateadd(day, -1, min(endd.RecordStartDateTime)) AS RecordEndDateTime
			FROM rds.DimPeople startd
			JOIN rds.DimPeople endd
				ON startd.K12StudentStudentIdentifierState = endd.K12StudentStudentIdentifierState
				AND startd.RecordStartDateTime < endd.RecordStartDateTime
			GROUP BY  startd.K12StudentStudentIdentifierState, startd.RecordStartDateTime
		) 
		UPDATE student 
		SET RecordEndDateTime = upd.RecordEndDateTime
		FROM rds.DimPeople student
		INNER JOIN upd
			ON student.K12StudentStudentIdentifierState = upd.K12StudentStudentIdentifierState
			AND student.RecordStartDateTime = upd.RecordStartDateTime
		WHERE upd.RecordEndDateTime <> '1900-01-01 00:00:00.000'
			AND student.RecordEndDateTime IS NULL

	END TRY
	BEGIN CATCH

		DECLARE @msg AS NVARCHAR(MAX)
		SET @msg = ERROR_MESSAGE()

		DECLARE @sev AS INT
		SET @sev = ERROR_SEVERITY()

		RAISERROR(@msg, @sev, 1)

	END CATCH

	SET NOCOUNT OFF;

END