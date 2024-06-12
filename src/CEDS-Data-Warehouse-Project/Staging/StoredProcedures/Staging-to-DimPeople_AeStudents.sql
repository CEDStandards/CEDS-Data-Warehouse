CREATE PROCEDURE [Staging].[Staging-to-DimPeople_AeStudents]
AS
BEGIN

	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRANSACTION



		IF NOT EXISTS (SELECT 1 FROM RDS.DimPeople WHERE DimPersonId = -1)
		BEGIN

			SET IDENTITY_INSERT RDS.DimPeople ON

			INSERT INTO RDS.DimPeople
			(DimPersonId)
			VALUES
			(-1)
	
			SET IDENTITY_INSERT RDS.DimPeople off
		END

		DROP TABLE IF EXISTS #People
		CREATE TABLE #People (
			  BirthDate						  DATE
			, FirstName						  NVARCHAR(50) NULL
			, LastOrSurname					  NVARCHAR(50) NULL
			, MiddleName					  NVARCHAR(50) NULL
			, PersonalTitleOrPrefix			  NVARCHAR(100) NULL
			, PositionTitle					  NVARCHAR(100) NULL
			, ElectronicEmailAddressWork	  NVARCHAR(126) NULL
			, TelephoneNumberWork			  NVARCHAR(24) NULL
			, AeStudentIdentifierState		  NVARCHAR(40) NULL
			, IsActiveAeStudent			  BIT
			, RecordStartDateTime			  DATETIME
		)
		
		CREATE CLUSTERED INDEX IX_People_K12Identifiers ON #People (AeStudentIdentifierState, BirthDate, FirstName, MiddleName, LastOrSurname)

		INSERT INTO #People
		(
			  BirthDate
			, FirstName
			, LastOrSurname
			, MiddleName
			, PersonalTitleOrPrefix
			, PositionTitle
			, ElectronicEmailAddressWork
			, TelephoneNumberWork
			, AeStudentIdentifierState
			, IsActiveAeStudent
			, RecordStartDateTime
			)		
		SELECT DISTINCT
			  sae.BirthDate
			, sae.FirstName
			, ISNULL(sae.LastOrSurname, 'MISSING') as LastOrSurname
			, sae.MiddleName
			, NULL AS PersonalTitleOrPrefix
			, NULL AS PositionTitle
			, NULL AS ElectronicMailAddressWork
			, NULL AS TelephoneNumberWork
			, sae.StudentIdentifierState AS AeStudentIdentifierState
			, 1 AS IsActiveAeStudent
			, sae.RecordStartDateTime
		FROM Staging.AeEnrollment sae;

		MERGE rds.DimPeople AS trgt
		USING #People AS src
				ON  ISNULL(trgt.AeStudentStudentIdentifierState, '') = ISNULL(src.AeStudentIdentifierState, '')
				AND ISNULL(trgt.FirstName, '') = ISNULL(src.FirstName, '')
				AND ISNULL(trgt.LastOrSurname, '') = ISNULL(src.LastOrSurname, '')
				AND ISNULL(trgt.MiddleName, '') = ISNULL(src.MiddleName, '')
				AND ISNULL(trgt.BirthDate, '') = ISNULL(src.BirthDate, '1900-01-01')
				AND trgt.RecordStartDateTime = src.RecordStartDateTime
		WHEN NOT MATCHED BY TARGET THEN     --- Records Exists in Source but NOT in Target
		INSERT (
			  BirthDate
			, FirstName
			, LastOrSurname
			, MiddleName
			, AeStudentStudentIdentifierState
			, IsActiveAeStudent
			, RecordStartDateTime
			)
		VALUES (
			  src.Birthdate
			, src.FirstName
			, src.LastOrSurname
			, src.MiddleName
			, src.AeStudentIdentifierState
			, src.IsActiveAeStudent	
			, src.RecordStartDateTime
			);

		--End date previous records
		;WITH upd AS (
			SELECT 
				  startd.AeStudentStudentIdentifierState
				, startd.RecordStartDateTime
				, dateadd(day, -1, min(endd.RecordStartDateTime)) AS RecordEndDateTime
			FROM rds.DimPeople startd
			JOIN rds.DimPeople endd
				ON startd.AeStudentStudentIdentifierState = endd.AeStudentStudentIdentifierState
				AND startd.RecordStartDateTime < endd.RecordStartDateTime
			GROUP BY  startd.AeStudentStudentIdentifierState, startd.RecordStartDateTime
		) 
		UPDATE student 
		SET RecordEndDateTime = upd.RecordEndDateTime
		FROM rds.DimPeople student
		INNER JOIN upd
			ON student.AeStudentStudentIdentifierState = upd.AeStudentStudentIdentifierState
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