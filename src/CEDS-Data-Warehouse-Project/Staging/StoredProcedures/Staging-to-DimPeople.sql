CREATE PROCEDURE [Staging].[Staging-to-DimPeople]
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
			, K12StudentStudentIdentifierState		  NVARCHAR(40) NULL
			, PsStudentStudentIdentifierState		  NVARCHAR(40) NULL
			, K12StaffMemberIdentiferState	  NVARCHAR(40) NULL
			, IsActiveK12Student			  BIT
			, IsActivePsStudent				  BIT
			, IsActiveK12StaffMember		  BIT
			, RecordStartDateTime			  DATETIME
		)
		
		CREATE CLUSTERED INDEX IX_People_K12Identifiers ON #People (K12StudentStudentIdentifierState, BirthDate, FirstName, MiddleName, LastOrSurname)
		CREATE NONCLUSTERED INDEX IX_People_PsIdentifiers ON #People (PsStudentStudentIdentifierState, BirthDate, FirstName, MiddleName, LastOrSurname)

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
			, K12StudentStudentIdentifierState
			, PsStudentStudentIdentifierState
			, K12StaffMemberIdentiferState
			, IsActiveK12Student
			, IsActivePsStudent
			, IsActiveK12StaffMember
			, RecordStartDateTime
			)		
		SELECT DISTINCT
			  ke.BirthDate
			, ke.FirstName
			, ISNULL(ke.LastOrSurname, 'MISSING') as LastOrSurname
			, ke.MiddleName
			, NULL AS PersonalTitleOrPrefix
			, NULL AS PositionTitle
			, NULL AS ElectronicMailAddressWork
			, NULL AS TelephoneNumberWork
			, ke.StudentIdentifierState AS K12StudentStudentIdentifierState
			, pe.StudentIdentifierState AS PsStudentStudentIdentifierState
			, NULL AS K12StaffMemberIdentiferState
			, 1
			, CASE WHEN pe.StudentIdentifierState IS NOT NULL THEN 1 ELSE 0 END
			, 0
			, ke.RecordStartDateTime
		FROM Staging.K12Enrollment ke
		LEFT JOIN Staging.PsStudentEnrollment pe
			ON  ISNULL(ke.StudentIdentifierState, '') = ISNULL(pe.StudentIdentifierState, '')
			AND ISNULL(ke.BirthDate, '') = ISNULL(pe.BirthDate, '')
			AND ISNULL(ke.FirstName, '') = ISNULL(pe.FirstName, '')
			AND ISNULL(ke.MiddleName, '') = ISNULL(pe.MiddleName, '')
			AND ISNULL(ke.LastOrSurname, '') = ISNULL(pe.LastOrSurname, '')
			AND ke.RecordStartDateTime < ISNULL(pe.RecordEndDateTime, GETDATE())
			AND ISNULL(ke.RecordEndDateTime, GETDATE()) >= pe.RecordStartDateTime
		WHERE ke.DataCollectionName NOT LIKE '%DSCP%'


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
			, K12StudentStudentIdentifierState
			, PsStudentStudentIdentifierState
			, K12StaffMemberIdentiferState
			, IsActiveK12Student
			, IsActivePsStudent
			, IsActiveK12StaffMember
			, RecordStartDateTime
			)	
		SELECT DISTINCT
			  spe.BirthDate
			, spe.FirstName
			, ISNULL(spe.LastOrSurname, 'MISSING') as LastOrSurname
			, spe.MiddleName
			, NULL AS PersonalTitleOrPrefix
			, NULL AS PositionTitle
			, NULL AS ElectronicMailAddressWork
			, NULL AS TelephoneNumberWork
			, NULL AS K12StudentStudentIdentifierState
			, spe.StudentIdentifierState AS PsStudentStudentIdentifierState
			, NULL AS K12StaffMemberIdentiferState
			, 0
			, 1
			, 0
			, spe.RecordStartDateTime
		FROM Staging.PsStudentEnrollment spe
		LEFT JOIN #People p
			ON  ISNULL(spe.StudentIdentifierState, '') = ISNULL(p.PsStudentStudentIdentifierState, '')
			AND ISNULL(spe.BirthDate, '') = ISNULL(p.BirthDate, '')
			AND ISNULL(spe.FirstName, '') = ISNULL(p.FirstName, '')
			AND ISNULL(spe.MiddleName, '') = ISNULL(p.MiddleName, '')
			AND ISNULL(spe.LastOrSurname, '') = ISNULL(p.LastOrSurname, '')
			AND ISNULL(spe.RecordStartDateTime, '') = ISNULL(p.RecordStartDateTime, '')
		WHERE p.PsStudentStudentIdentifierState IS NULL

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
			, K12StudentStudentIdentifierState
			, PsStudentStudentIdentifierState
			, K12StaffMemberIdentiferState
			, IsActiveK12Student
			, IsActivePsStudent
			, IsActiveK12StaffMember
			, RecordStartDateTime
		)	
		-- State Chief School Officer/State Superintendent
		SELECT DISTINCT
			  NULL									AS BirthDate
			, SeaContact_FirstName					AS FirstName
			, SeaContact_LastOrSurname				AS LastOrSurname
			, NULL									AS MiddleName
			, SeaContact_PersonalTitleOrPrefix		AS PersonalTitleOrPrefix
			, SeaContact_PositionTitle				AS PositionTitle
			, SeaContact_ElectronicMailAddress		AS ElectronicMailAddressWork
			, SeaContact_PhoneNumber				AS TelephoneNumberWork
			, NULL									AS K12StudentStudentIdentifierState
			, NULL									AS PsStudentStudentIdentifierState
			, SeaContact_Identifier					AS K12StaffMemberIdentiferState
			, 0
			, 0
			, 1
			, RecordStartDateTime
		FROM Staging.StateDetail; 


		MERGE rds.DimPeople AS trgt
		USING #People AS src
				ON  ISNULL(trgt.K12StudentStudentIdentifierState, '') = ISNULL(src.K12StudentStudentIdentifierState, '')
				AND ISNULL(trgt.PsStudentStudentIdentifierState, '') = ISNULL(src.PsStudentStudentIdentifierState, '')
				AND ISNULL(trgt.K12StaffMemberIdentiferState, '') = ISNULL(src.K12StaffMemberIdentiferState, '')
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
			, K12StudentStudentIdentifierState
			, PsStudentStudentIdentifierState
			, K12StaffMemberIdentiferState
			, IsActiveK12Student
			, IsActivePsStudent	
			, IsActiveK12StaffMember	
			, RecordStartDateTime
			)
		VALUES (
			  src.Birthdate
			, src.FirstName
			, src.LastOrSurname
			, src.MiddleName
			, src.K12StudentStudentIdentifierState
			, src.PsStudentStudentIdentifierState
			, src.K12StaffMemberIdentiferState
			, src.IsActiveK12Student
			, src.IsActivePsStudent	
			, src.IsActiveK12StaffMember	
			, src.RecordStartDateTime
			);

		
		-- Delete records in DimPeople duplicate person records where one has a only a K12 ID and the other has a K12 ID and PS ID	
		DELETE FROM RDS.DimPeople 
		WHERE DimPersonId IN (
			SELECT DISTINCT K12.DimPersonId
			FROM RDS.DimPeople k12
			JOIN RDS.DimPeople ps
				ON k12.K12StudentStudentIdentifierState = ps.K12StudentStudentIdentifierState
				AND K12.K12StudentStudentIdentifierState = ps.PsStudentStudentIdentifierState
				AND k12.RecordStartDateTime = ps.RecordStartDateTime
				AND ISNULL(k12.BirthDate, '1900-01-01') = ISNULL(ps.BirthDate, '1900-01-01')
				AND K12.DimPersonId <> ps.DimPersonId
			WHERE k12.IsActiveK12Student = 1 
				AND K12.IsActivePsStudent = 0
				AND ps.IsActiveK12Student = 1 
				AND ps.IsActivePsStudent = 1
			)


		-- Update RecordEndDateTime for every record in DimPeople
		ALTER INDEX IX_DimPeople_K12Students ON RDS.DimPeople DISABLE
		ALTER INDEX IX_DimPeople_RecordStartDateTime_K12ID_PSID_RecordEndDateTime ON RDS.DimPeople DISABLE
		ALTER INDEX IX_DimPeople_All ON RDS.DimPeople DISABLE
		ALTER INDEX IX_DimPeople_IsActiveK12Student ON RDS.DimPeople DISABLE
		ALTER INDEX IX_DimPeople_IsActiveK12Student_IsActivePsStudent_WithIncludes ON RDS.DimPeople DISABLE
		ALTER INDEX IX_DimPeople_RecordEndDateTime_WithIncludes ON RDS.DimPeople DISABLE
		
		UPDATE person --25 minutes
		SET RecordEndDateTime = NULL
		FROM RDS.DimPeople person

		ALTER INDEX ALL ON RDS.DimPeople REBUILD
		
		Drop Table If Exists #upd

		CREATE TABLE #upd (
			  K12StudentStudentIdentifierState		NVARCHAR(60)
			, PsStudentStudentIdentifierState		NVARCHAR(60)
			, RecordStartDateTime			DATETIME
			, RecordEndDateTime				DATETIME
		)

		INSERT INTO #upd
		SELECT  --6.7 minutes
			  startd.[K12StudentStudentIdentifierState]
			, startd.[PsStudentStudentIdentifierState]
			, startd.RecordStartDateTime               		 
			, DATEADD(D, -1, MIN(endd.RecordStartDateTime)) as RecordEndDateTime
		FROM RDS.DimPeople startd 
		JOIN RDS.DimPeople endd
			ON ISNULL(startd.[K12StudentStudentIdentifierState],startd.[PsStudentStudentIdentifierState])
				=ISNULL(endd.[K12StudentStudentIdentifierState],endd.[PsStudentStudentIdentifierState]) 
		WHERE startd.RecordStartDateTime < isnull(endd.RecordStartDateTime,getdate())
			AND ISNULL(startd.K12StudentStudentIdentifierState, startd.PsStudentStudentIdentifierState) IS NOT NULL
		GROUP BY
			  startd.[K12StudentStudentIdentifierState]
			, startd.[PsStudentStudentIdentifierState]
			, startd.RecordStartDateTime 

		CREATE INDEX IX_upd ON #upd (K12StudentStudentIdentifierState, PsStudentStudentIdentifierState, RecordStartDateTime)		
		CREATE NONCLUSTERED INDEX [IX_upd2] ON #upd ([RecordEndDateTime]) INCLUDE ([K12StudentStudentIdentifierState],[PsStudentStudentIdentifierState],[RecordStartDateTime])
				
		
		DECLARE @index SMALLINT = 0

		ALTER INDEX IX_DimPeople_RecordStartDateTime_K12ID_PSID_RecordEndDateTime ON RDS.DimPeople DISABLE
		ALTER INDEX IX_DimPeople_RecordEndDateTime_WithIncludes ON RDS.DimPeople DISABLE
		ALTER INDEX IX_DimPeople_K12Students ON RDS.DimPeople DISABLE

		WHILE @index <= 9
		BEGIN
			print 'STARTING ' + CAST(@index AS VARCHAR) + '%'

			UPDATE rds.DimPeople --27 minutes
			SET RecordEndDateTime = upd.RecordEndDateTime
			FROM rds.DimPeople rdp
			INNER JOIN #upd	upd
				ON  ISNULL(rdp.[K12StudentStudentIdentifierState], -1)	= ISNULL(upd.[K12StudentStudentIdentifierState], -1)
				AND ISNULL(rdp.[PsStudentStudentIdentifierState], -1)	= ISNULL(upd.[PsStudentStudentIdentifierState], -1)
				AND rdp.RecordStartDateTime = upd.RecordStartDateTime
			WHERE upd.RecordEndDateTime <> '1900-01-01 00:00:00.000'
				AND rdp.RecordEndDateTime IS NULL
				AND ISNULL(rdp.[K12StudentStudentIdentifierState],rdp.[PsStudentStudentIdentifierState]) like CAST(@index AS VARCHAR) + '%'
	
			print 'ENDING ' + CAST(@index AS VARCHAR) + '%'

			DBCC SHRINKFILE ('CEDS-Data-Warehouse-V9-2-0-0_log', 1)

			SET @index = @index + 1
		END

		DROP TABLE IF EXISTS #People
		DROP TABLE IF EXISTS #upd
		
		ALTER INDEX ALL ON RDS.DimPeople REBUILD

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

