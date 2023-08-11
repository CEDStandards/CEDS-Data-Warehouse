CREATE PROCEDURE [Staging].[Staging-To-DimPeople_K12Staff]
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

		CREATE TABLE #k12Staff (
			FirstName										NVARCHAR(50) NULL
			, MiddleName									NVARCHAR(50) NULL
			, LastOrSurname									NVARCHAR(50) NULL
			, BirthDate										DATE NULL
			, K12StaffStaffMemberIdentifierState			NVARCHAR(40) NULL
			, IsActiveK12Staff 								BIT NULL
			, PositionTitle									NVARCHAR(200) NULL
			, RecordStartDateTime							DATE NULL
			, RecordEndDateTime								DATE NULL
		)
		
		INSERT INTO #k12Staff (
			FirstName
			, MiddleName
			, LastOrSurname
			, BirthDate
			, K12StaffStaffMemberIdentifierState
			, IsActiveK12Staff
			, PositionTitle
			, RecordStartDateTime
			, RecordEndDateTime
		)		
		SELECT DISTINCT
			FirstName
			, MiddleName
			, LastOrSurname
			, BirthDate
			, StaffMemberIdentifierState
			, 1
			, PositionTitle
			, RecordStartDateTime
			, RecordEndDateTime
		FROM Staging.K12StaffAssignment sa

		MERGE rds.DimPeople AS trgt
		USING #K12Staff AS src
				ON  trgt.K12StaffStaffMemberIdentifierState = src.K12StaffStaffMemberIdentifierState
				AND ISNULL(trgt.FirstName, '') = ISNULL(src.FirstName, '')
				AND ISNULL(trgt.LastOrSurname, '') = ISNULL(src.LastOrSurname, '')
				AND ISNULL(trgt.MiddleName, '') = ISNULL(src.MiddleName, '')
				AND ISNULL(trgt.BirthDate, '1900-01-01') = ISNULL(src.BirthDate, '1900-01-01')
				AND trgt.IsActiveK12Staff = 1
				AND trgt.RecordStartDateTime = src.RecordStartDateTime
		WHEN NOT MATCHED BY TARGET THEN     --- Records Exists in Source but NOT in Target
		INSERT (
			FirstName
			, MiddleName
			, LastOrSurname
			, BirthDate
			, K12StaffStaffMemberIdentifierState
			, IsActiveK12Staff
			, PositionTitle
			, RecordStartDateTime
			, RecordEndDateTime
		)
		VALUES (
			src.FirstName
			, src.MiddleName
			, src.LastOrSurname
			, src.Birthdate
			, src.K12StaffStaffMemberIdentifierState
			, src.IsActiveK12Staff
			, src.PositionTitle
			, src.RecordStartDateTime
			, src.RecordEndDateTime
		);

		--End date previous records
		;WITH upd AS (
			SELECT 
				  startd.K12StaffStaffMemberIdentifierState
				, startd.RecordStartDateTime
				, dateadd(day, -1, min(endd.RecordStartDateTime)) AS RecordEndDateTime
			FROM rds.DimPeople startd
			JOIN rds.DimPeople endd
				ON startd.K12StaffStaffMemberIdentifierState = endd.K12StaffStaffMemberIdentifierState
				AND startd.RecordStartDateTime < endd.RecordStartDateTime
			GROUP BY  startd.K12StaffStaffMemberIdentifierState, startd.RecordStartDateTime
		) 
		UPDATE staff 
		SET RecordEndDateTime = upd.RecordEndDateTime
		FROM rds.DimPeople staff
		INNER JOIN upd
			ON staff.K12StaffStaffMemberIdentifierState = upd.K12StaffStaffMemberIdentifierState
			AND staff.RecordStartDateTime = upd.RecordStartDateTime
		WHERE upd.RecordEndDateTime <> '1900-01-01 00:00:00.000'
			AND staff.RecordEndDateTime IS NULL
				
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