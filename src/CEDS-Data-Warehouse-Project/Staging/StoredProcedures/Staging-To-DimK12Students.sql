CREATE PROCEDURE [Staging].[Staging-To-DimK12Students]
	@dataCollectionId AS INT = NULL
AS
BEGIN

	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRANSACTION

		IF NOT EXISTS (SELECT 1 FROM RDS.DimK12Students WHERE DimK12StudentId = -1)
		BEGIN

			SET IDENTITY_INSERT RDS.DimK12Students ON

			INSERT INTO RDS.DimK12Students
			(DimK12StudentId)
			VALUES
			(-1)
	
			SET IDENTITY_INSERT RDS.DimK12Students off
		END



		CREATE TABLE #k12Students (
			  BirthDate					DATE
			, FirstName					VARCHAR(100) NULL
			, LastName					VARCHAR(100) NULL
			, MiddleName				VARCHAR(100) NULL
			, StateStudentIdentifier	VARCHAR(60) NULL
			, RecordStartDateTime		DATETIME	
			, RecordEndDateTime			DATETIME	NULL
			, Cohort					VARCHAR(100) NULL
			, SexCode					VARCHAR(100) NULL
			, SexDescription			VARCHAR(400) NULL
			, SexEdFactsCode			VARCHAR(100) NULL
		)
		
		INSERT INTO #k12Students
		(BirthDate, FirstName, LastName, MiddleName, StateStudentIdentifier, RecordStartDateTime, Cohort, SexCode, SexDescription, SexEdFactsCode)		
		SELECT DISTINCT
			  BirthDate
			, FirstName
			, ISNULL(LastName, 'MISSING') as LastName
			, MiddleName
			, Student_Identifier_State
			, e.EnrollmentEntryDate
			, CohortGraduationYear
			, sssrd.OutputCode as SexCode
			, sssrd.OutputCode as SexDescription
			, CASE sssrd.OutputCode
				WHEN 'Male' THEN 'M'
				WHEN 'Female' THEN 'F'
			  END as SexEdFactsCode				
		FROM Staging.K12Enrollment e
		JOIN Staging.SourceSystemReferenceData sssrd
			ON e.Sex = sssrd.InputCode
			AND e.SchoolYear = sssrd.SchoolYear
			AND sssrd.TableName = 'RefSex'

		MERGE rds.DimK12Students AS trgt
		USING #k12Students AS src
				ON  trgt.StateStudentIdentifier = src.StateStudentIdentifier
				AND ISNULL(trgt.FirstName, '') = ISNULL(src.FirstName, '')
				AND ISNULL(trgt.LastName, '') = ISNULL(src.LastName, '')
				AND ISNULL(trgt.MiddleName, '') = ISNULL(src.MiddleName, '')
				AND ISNULL(trgt.Cohort, '') = ISNULL(src.Cohort, '')
				AND ISNULL(trgt.SexCode, '') = ISNULL(src.SexCode, '')
				AND ISNULL(trgt.BirthDate, '1900-01-01') = ISNULL(src.BirthDate, '1900-01-01')
				AND trgt.RecordStartDateTime = src.RecordStartDateTime
		WHEN NOT MATCHED BY TARGET THEN     --- Records Exists in Source but NOT in Target
		INSERT (
			  [BirthDate]
			, [FirstName]
			, [LastName]
			, [MiddleName]
			, [StateStudentIdentifier]
			, RecordStartDateTime
			, Cohort
			, SexCode
			, SexDescription
			, SexEdFactsCode
			)
		VALUES (
			  src.Birthdate
			, src.FirstName
			, src.LastName
			, src.MiddleName
			, src.StateStudentIdentifier
			, src.RecordStartDateTime
			, src.Cohort
			, src.SexCode
			, src.SexDescription
			, src.SexEdFactscode
			);

		UPDATE student 
		SET RecordEndDateTime = NULL
		FROM rds.DimK12Students student

		;WITH upd AS (
			SELECT 
				  startd.StateStudentIdentifier
				, startd.RecordStartDateTime
				, min(endd.RecordStartDateTime) - 1 AS RecordEndDateTime
			FROM rds.DimK12Students startd
			JOIN rds.DimK12Students endd
				ON startd.StateStudentIdentifier = endd.StateStudentIdentifier
				AND startd.RecordStartDateTime < endd.RecordStartDateTime
			GROUP BY  startd.StateStudentIdentifier, startd.RecordStartDateTime
		) 
		UPDATE student 
		SET RecordEndDateTime = upd.RecordEndDateTime
		FROM rds.DimK12Students student
		INNER JOIN upd
			ON student.StateStudentIdentifier = upd.StateStudentIdentifier
			AND student.RecordStartDateTime = upd.RecordStartDateTime
		WHERE upd.RecordEndDateTime <> '1900-01-01 00:00:00.000'
			AND student.RecordEndDateTime IS NULL
				
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH

		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END

		DECLARE @msg AS NVARCHAR(MAX)
		SET @msg = ERROR_MESSAGE()

		DECLARE @sev AS INT
		SET @sev = ERROR_SEVERITY()

		RAISERROR(@msg, @sev, 1)

	END CATCH


	SET NOCOUNT OFF;

END

GO

