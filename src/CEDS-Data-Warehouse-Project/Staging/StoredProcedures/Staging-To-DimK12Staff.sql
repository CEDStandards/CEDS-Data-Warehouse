create PROCEDURE [Staging].[Staging-To-DimK12Staff]
	@dataCollectionId AS INT = NULL
AS
BEGIN

	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRANSACTION

		IF NOT EXISTS (SELECT 1 FROM RDS.DimK12Staff WHERE DimK12StaffId = -1)
		BEGIN

			SET IDENTITY_INSERT RDS.DimK12Staff ON

			INSERT INTO RDS.DimK12Staff
			(DimK12StaffId)
			VALUES
			(-1)
	
			SET IDENTITY_INSERT RDS.DimK12Staff off
		END



		CREATE TABLE #K12Staff (
			  BirthDate						DATE
			, FirstName						VARCHAR(100) NULL
			, LastName						VARCHAR(100) NULL
			, MiddleName					VARCHAR(100) NULL
			, StaffMemberIdentifierState	VARCHAR(60) NULL
			, PositionTitle					VARCHAR(45) NULL
			, RecordStartDateTime			DATETIME	
			, RecordEndDateTime				DATETIME	NULL
		)
		
		declare @k12StaffRole varchar(50) = 'K12 Personnel'

		INSERT INTO #K12Staff
		(
			  BirthDate
			, FirstName
			, LastName
			, MiddleName
			, StaffMemberIdentifierState
			, PositionTitle
			, RecordStartDateTime
			, RecordEndDateTime
		)		
		SELECT DISTINCT
			  BirthDate
			, FirstName
			, ISNULL(LastName, 'MISSING') as LastName
			, MiddleName
			, Personnel_Identifier_State
			, PositionTitle
			, RecordStartDateTime
			, RecordEndDateTime
		FROM Staging.K12StaffAssignment

		MERGE rds.DimK12Staff AS trgt
		USING #K12Staff AS src
				ON  trgt.StaffMemberIdentifierState = src.StaffMemberIdentifierState
				AND ISNULL(trgt.FirstName, '') = ISNULL(src.FirstName, '')
				AND ISNULL(trgt.LastOrSurname, '') = ISNULL(src.LastName, '')
				AND ISNULL(trgt.MiddleName, '') = ISNULL(src.MiddleName, '')
				AND ISNULL(trgt.PositionTitle, '') = ISNULL(src.PositionTitle, '')
				AND ISNULL(trgt.BirthDate, '1900-01-01') = ISNULL(src.BirthDate, '1900-01-01')
				AND trgt.RecordStartDateTime = src.RecordStartDateTime
		WHEN NOT MATCHED BY TARGET THEN     --- Records Exists in Source but NOT in Target
		INSERT (
			  [BirthDate]
			, [FirstName]
			, LastOrSurname
			, [MiddleName]
			, [StaffMemberIdentifierState]
			, PositionTitle
			, RecordStartDateTime
			)
		VALUES (
			  src.Birthdate
			, src.FirstName
			, src.LastName
			, src.MiddleName
			, src.StaffMemberIdentifierState
			, src.PositionTitle
			, src.RecordStartDateTime
			);

		UPDATE staff 
		SET RecordEndDateTime = NULL
		FROM rds.DimK12Staff staff

		;WITH upd AS (
			SELECT 
				  startd.StaffMemberIdentifierState
				, startd.RecordStartDateTime
				, min(endd.RecordStartDateTime) - 1 AS RecordEndDateTime
			FROM rds.DimK12Staff startd
			JOIN rds.DimK12Staff endd
				ON startd.StaffMemberIdentifierState = endd.StaffMemberIdentifierState
				AND startd.RecordStartDateTime < endd.RecordStartDateTime
			GROUP BY startd.StaffMemberIdentifierState, startd.RecordStartDateTime
		) 
		UPDATE staff 
		SET RecordEndDateTime = upd.RecordEndDateTime
		FROM rds.DimK12Staff staff
		INNER JOIN upd
			ON staff.StaffMemberIdentifierState = upd.StaffMemberIdentifierState
			AND staff.RecordStartDateTime = upd.RecordStartDateTime
		WHERE upd.RecordEndDateTime <> '1900-01-01 00:00:00.000'
			AND staff.RecordEndDateTime IS NULL
				
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

