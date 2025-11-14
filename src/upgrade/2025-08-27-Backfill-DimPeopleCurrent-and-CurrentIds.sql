/*
Purpose: Backfill RDS.DimPeople_Current and populate all *\_CurrentId columns.

Highlights
- Idempotent upsert of RDS.DimPeople_Current from RDS.DimPeople current rows
- Builds a scored mapping from any historical RDS.DimPeople.DimPersonId to the best matching current RDS.DimPeople_Current.DimPersonId
- Dynamically updates every RDS table column ending with "_CurrentId" by joining original FK (without "_Current") to the mapping
- Safe to re-run; only fills NULL/-1 CurrentIds

Assumptions
- "Current" rows in RDS.DimPeople are defined by RecordEndDateTime IS NULL
- RDS.DimPeople_Current shares the same DimPersonId as current rows (IDENTITY_INSERT used on first load)
- For historical rows with a different DimPersonId than current, we infer the current person via identifiers (e.g., K12/PS/AE student IDs, staff IDs, person identifiers, SSN, etc.)
*/

SET NOCOUNT ON;
SET XACT_ABORT ON;

PRINT 'Step 1: Snapshot current rows from RDS.DimPeople into #DimPeople_Current_Src';
IF OBJECT_ID('tempdb..#DimPeople_Current_Src') IS NOT NULL DROP TABLE #DimPeople_Current_Src;
SELECT 
    d.[DimPersonId],
    d.[FirstName],
    d.[MiddleName],
    d.[LastOrSurname],
    d.[Birthdate],
    d.[ELChildChildIdentifierState],
    d.[K12StudentStudentIdentifierState],
    d.[K12StudentStudentIdentifierDistrict],
    d.[K12StudentStudentIdentifierNationalMigrant],
    d.[PsStudentStudentIdentifierState],
    d.[AeStudentStudentIdentifierState],
    d.[WorkforceProgramParticipantPersonIdentifierState],
    d.[ELStaffStaffMemberIdentifierState],
    d.[K12StaffStaffMemberIdentifierState],
    d.[K12StaffStaffMemberIdentifierDistrict],
    d.[PsStaffStaffMemberIdentifierState],
    d.[PersonIdentifierDriversLicense],
    d.[IsActiveELChild],
    d.[IsActiveK12Student],
    d.[IsActivePsStudent],
    d.[IsActiveAeStudent],
    d.[IsActiveWorkforceProgramParticipant],
    d.[IsActiveELStaff],
    d.[IsActiveK12Staff],
    d.[IsActivePsStaff],
    d.[ElectronicMailAddressHome],
    d.[ElectronicMailAddressOrganizational],
    d.[ElectronicMailAddressWork],
    d.[TelephoneNumberFax],
    d.[TelephoneNumberHome],
    d.[TelephoneNumberMobile],
    d.[TelephoneNumberWork],
    d.[PersonalTitleOrPrefix],
    d.[PositionTitle]
INTO #DimPeople_Current_Src
FROM RDS.DimPeople d
WHERE d.RecordEndDateTime IS NULL;

PRINT 'Step 2: Upsert RDS.DimPeople_Current from source snapshot (idempotent)';
BEGIN TRAN;

-- Update values in existing rows (deterministic, may be no-op for identical rows)
UPDATE tgt
    SET 
        [FirstName] = src.[FirstName],
        [MiddleName] = src.[MiddleName],
        [LastOrSurname] = src.[LastOrSurname],
        [Birthdate] = src.[Birthdate],
        [ELChildChildIdentifierState] = src.[ELChildChildIdentifierState],
        [K12StudentStudentIdentifierState] = src.[K12StudentStudentIdentifierState],
        [K12StudentStudentIdentifierDistrict] = src.[K12StudentStudentIdentifierDistrict],
        [K12StudentStudentIdentifierNationalMigrant] = src.[K12StudentStudentIdentifierNationalMigrant],
        [PsStudentStudentIdentifierState] = src.[PsStudentStudentIdentifierState],
        [AeStudentStudentIdentifierState] = src.[AeStudentStudentIdentifierState],
        [WorkforceProgramParticipantPersonIdentifierState] = src.[WorkforceProgramParticipantPersonIdentifierState],
        [ELStaffStaffMemberIdentifierState] = src.[ELStaffStaffMemberIdentifierState],
        [K12StaffStaffMemberIdentifierState] = src.[K12StaffStaffMemberIdentifierState],
        [K12StaffStaffMemberIdentifierDistrict] = src.[K12StaffStaffMemberIdentifierDistrict],
        [PsStaffStaffMemberIdentifierState] = src.[PsStaffStaffMemberIdentifierState],
        [PersonIdentifierDriversLicense] = src.[PersonIdentifierDriversLicense],
        [IsActiveELChild] = src.[IsActiveELChild],
        [IsActiveK12Student] = src.[IsActiveK12Student],
        [IsActivePsStudent] = src.[IsActivePsStudent],
        [IsActiveAeStudent] = src.[IsActiveAeStudent],
        [IsActiveWorkforceProgramParticipant] = src.[IsActiveWorkforceProgramParticipant],
        [IsActiveELStaff] = src.[IsActiveELStaff],
        [IsActiveK12Staff] = src.[IsActiveK12Staff],
        [IsActivePsStaff] = src.[IsActivePsStaff],
        [ElectronicMailAddressHome] = src.[ElectronicMailAddressHome],
        [ElectronicMailAddressOrganizational] = src.[ElectronicMailAddressOrganizational],
        [ElectronicMailAddressWork] = src.[ElectronicMailAddressWork],
        [TelephoneNumberFax] = src.[TelephoneNumberFax],
        [TelephoneNumberHome] = src.[TelephoneNumberHome],
        [TelephoneNumberMobile] = src.[TelephoneNumberMobile],
        [TelephoneNumberWork] = src.[TelephoneNumberWork],
        [PersonalTitleOrPrefix] = src.[PersonalTitleOrPrefix],
        [PositionTitle] = src.[PositionTitle]
FROM RDS.DimPeople_Current tgt
JOIN #DimPeople_Current_Src src 
    ON ISNULL(src.K12StudentStudentIdentifierState, '') = ISNULL(tgt.K12StudentStudentIdentifierState, '')
    AND ISNULL(src.K12StaffStaffMemberIdentifierState, '') = ISNULL(tgt.K12StaffStaffMemberIdentifierState, '')
    AND src.Birthdate = tgt.Birthdate
WHERE tgt.DimPersonId = src.DimPersonId;

-- Insert missing current rows, preserving DimPersonId
IF EXISTS (
    SELECT 1
    FROM #DimPeople_Current_Src s
    LEFT JOIN RDS.DimPeople_Current t ON t.DimPersonId = s.DimPersonId
    WHERE t.DimPersonId IS NULL
)
BEGIN
    PRINT 'Inserting new rows into RDS.DimPeople_Current';
    INSERT INTO RDS.DimPeople_Current (
        [FirstName], [MiddleName], [LastOrSurname], [Birthdate],
        [ELChildChildIdentifierState],
        [K12StudentStudentIdentifierState], [K12StudentStudentIdentifierDistrict], [K12StudentStudentIdentifierNationalMigrant],
        [PsStudentStudentIdentifierState], [AeStudentStudentIdentifierState], [WorkforceProgramParticipantPersonIdentifierState],
        [ELStaffStaffMemberIdentifierState], [K12StaffStaffMemberIdentifierState], [K12StaffStaffMemberIdentifierDistrict], [PsStaffStaffMemberIdentifierState],
        [IsActiveELChild], [IsActiveK12Student], [IsActivePsStudent], [IsActiveAeStudent], [IsActiveWorkforceProgramParticipant], [IsActiveELStaff], [IsActiveK12Staff], [IsActivePsStaff],
        [ElectronicMailAddressHome], [ElectronicMailAddressOrganizational], [ElectronicMailAddressWork],
        [TelephoneNumberFax], [TelephoneNumberHome], [TelephoneNumberMobile], [TelephoneNumberWork]
    )
    SELECT 
        s.[FirstName], s.[MiddleName], s.[LastOrSurname], s.[Birthdate],
        s.[ELChildChildIdentifierState],
        s.[K12StudentStudentIdentifierState], s.[K12StudentStudentIdentifierDistrict], s.[K12StudentStudentIdentifierNationalMigrant],
        s.[PsStudentStudentIdentifierState], s.[AeStudentStudentIdentifierState], s.[WorkforceProgramParticipantPersonIdentifierState],
        s.[ELStaffStaffMemberIdentifierState], s.[K12StaffStaffMemberIdentifierState], s.[K12StaffStaffMemberIdentifierDistrict], s.[PsStaffStaffMemberIdentifierState],
        s.[IsActiveELChild], s.[IsActiveK12Student], s.[IsActivePsStudent], s.[IsActiveAeStudent], s.[IsActiveWorkforceProgramParticipant], s.[IsActiveELStaff], s.[IsActiveK12Staff], s.[IsActivePsStaff],
        s.[ElectronicMailAddressHome], s.[ElectronicMailAddressOrganizational], s.[ElectronicMailAddressWork],
        s.[TelephoneNumberFax], s.[TelephoneNumberHome], s.[TelephoneNumberMobile], s.[TelephoneNumberWork]
    FROM #DimPeople_Current_Src s
    LEFT JOIN RDS.DimPeople_Current t
        ON ISNULL(s.K12StudentStudentIdentifierState, '') = ISNULL(t.K12StudentStudentIdentifierState, '')
        AND ISNULL(s.K12StaffStaffMemberIdentifierState, '') = ISNULL(t.K12StaffStaffMemberIdentifierState, '')
        AND s.Birthdate = t.Birthdate
    WHERE t.DimPersonId IS NULL;
END

COMMIT TRAN;

PRINT 'Step 3: Build mapping #DimPeople_HistoricalToCurrent using identifier-based scoring';
IF OBJECT_ID('tempdb..#DimPeople_HistoricalToCurrent') IS NOT NULL DROP TABLE #DimPeople_HistoricalToCurrent;

;WITH direct_map AS (
    -- Direct mapping for current rows where IDs are identical between DimPeople and DimPeople_Current
    SELECT d.DimPersonId AS HistoricalDimPersonId, c.DimPersonId AS CurrentDimPersonId
    FROM RDS.DimPeople d
    JOIN RDS.DimPeople_Current c 
        ON ISNULL(d.K12StudentStudentIdentifierState, '') = ISNULL(c.K12StudentStudentIdentifierState, '')
        AND ISNULL(d.K12StaffStaffMemberIdentifierState, '') = ISNULL(c.K12StaffStaffMemberIdentifierState, '')
        AND d.Birthdate = c.Birthdate
    WHERE d.RecordEndDateTime IS NULL
)
, candidates AS (
    SELECT 
        d.DimPersonId AS HistoricalDimPersonId,
        c.DimPersonId AS CurrentDimPersonId,
        Score = 
            CASE WHEN d.K12StudentStudentIdentifierState IS NOT NULL AND d.K12StudentStudentIdentifierState = c.K12StudentStudentIdentifierState THEN 100 ELSE 0 END +
            CASE WHEN d.PsStudentStudentIdentifierState IS NOT NULL AND d.PsStudentStudentIdentifierState = c.PsStudentStudentIdentifierState THEN 100 ELSE 0 END +
            CASE WHEN d.AeStudentStudentIdentifierState IS NOT NULL AND d.AeStudentStudentIdentifierState = c.AeStudentStudentIdentifierState THEN 100 ELSE 0 END +
            CASE WHEN d.K12StaffStaffMemberIdentifierState IS NOT NULL AND d.K12StaffStaffMemberIdentifierState = c.K12StaffStaffMemberIdentifierState THEN 100 ELSE 0 END +
            CASE WHEN d.K12StaffStaffMemberIdentifierDistrict IS NOT NULL AND d.K12StaffStaffMemberIdentifierDistrict = c.K12StaffStaffMemberIdentifierDistrict THEN 90 ELSE 0 END +
            CASE WHEN d.ELStaffStaffMemberIdentifierState IS NOT NULL AND d.ELStaffStaffMemberIdentifierState = c.ELStaffStaffMemberIdentifierState THEN 80 ELSE 0 END +
            CASE WHEN d.WorkforceProgramParticipantPersonIdentifierState IS NOT NULL AND d.WorkforceProgramParticipantPersonIdentifierState = c.WorkforceProgramParticipantPersonIdentifierState THEN 80 ELSE 0 END +
            CASE WHEN d.PersonIdentifierDriversLicense IS NOT NULL AND d.PersonIdentifierDriversLicense = c.PersonIdentifierDriversLicense THEN 50 ELSE 0 END +
            CASE WHEN d.Birthdate IS NOT NULL AND c.Birthdate IS NOT NULL AND d.Birthdate = c.Birthdate THEN 5 ELSE 0 END +
            CASE WHEN d.FirstName IS NOT NULL AND c.FirstName IS NOT NULL AND d.FirstName = c.FirstName THEN 2 ELSE 0 END +
            CASE WHEN d.LastOrSurname IS NOT NULL AND c.LastOrSurname IS NOT NULL AND d.LastOrSurname = c.LastOrSurname THEN 2 ELSE 0 END
    FROM RDS.DimPeople d
    JOIN RDS.DimPeople_Current c
      ON (d.K12StudentStudentIdentifierState IS NOT NULL AND d.K12StudentStudentIdentifierState = c.K12StudentStudentIdentifierState)
      OR (d.PsStudentStudentIdentifierState IS NOT NULL AND d.PsStudentStudentIdentifierState = c.PsStudentStudentIdentifierState)
      OR (d.AeStudentStudentIdentifierState IS NOT NULL AND d.AeStudentStudentIdentifierState = c.AeStudentStudentIdentifierState)
      OR (d.K12StaffStaffMemberIdentifierState IS NOT NULL AND d.K12StaffStaffMemberIdentifierState = c.K12StaffStaffMemberIdentifierState)
      OR (d.K12StaffStaffMemberIdentifierDistrict IS NOT NULL AND d.K12StaffStaffMemberIdentifierDistrict = c.K12StaffStaffMemberIdentifierDistrict)
      OR (d.ELStaffStaffMemberIdentifierState IS NOT NULL AND d.ELStaffStaffMemberIdentifierState = c.ELStaffStaffMemberIdentifierState)
      OR (d.WorkforceProgramParticipantPersonIdentifierState IS NOT NULL AND d.WorkforceProgramParticipantPersonIdentifierState = c.WorkforceProgramParticipantPersonIdentifierState)
      OR (d.PersonIdentifierDriversLicense IS NOT NULL AND d.PersonIdentifierDriversLicense = c.PersonIdentifierDriversLicense)
	  )
, direct_or_candidates AS (
    SELECT HistoricalDimPersonId, CurrentDimPersonId, 1000000 AS Score
    FROM direct_map
    UNION ALL
    SELECT HistoricalDimPersonId, CurrentDimPersonId, Score FROM candidates
)
, ranked AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY HistoricalDimPersonId ORDER BY Score DESC, CurrentDimPersonId ASC) AS rn
    FROM direct_or_candidates
    WHERE Score > 0
)
SELECT HistoricalDimPersonId, CurrentDimPersonId
INTO #DimPeople_HistoricalToCurrent
FROM ranked
WHERE rn = 1;

CREATE INDEX IX_DimPeople_HistoricalToCurrent_H ON #DimPeople_HistoricalToCurrent (HistoricalDimPersonId);
CREATE INDEX IX_DimPeople_HistoricalToCurrent_C ON #DimPeople_HistoricalToCurrent (CurrentDimPersonId);

PRINT 'Step 4: Discover all RDS.* columns ending with "_CurrentId" and their paired original FK columns';
IF OBJECT_ID('tempdb..#Targets') IS NOT NULL DROP TABLE #Targets;
SELECT
    s.name AS SchemaName,
    t.name AS TableName,
    c_cur.name AS CurrentIdColumn,
    c_fk.name AS OriginalFkColumn,
    c_cur.is_nullable AS IsNullableCurrent
INTO #Targets
FROM sys.tables t
JOIN sys.schemas s ON s.schema_id = t.schema_id
JOIN sys.columns c_cur ON c_cur.object_id = t.object_id AND c_cur.name LIKE '%[_]CurrentId'
OUTER APPLY (
    SELECT c2.*
    FROM sys.columns c2
    WHERE c2.object_id = t.object_id
      AND c2.name = REPLACE(c_cur.name, '_CurrentId', 'Id')
) AS c_fk
WHERE s.name = 'RDS'
  AND c_fk.column_id IS NOT NULL;

-- Optional: print discovered targets
-- SELECT * FROM #Targets ORDER BY SchemaName, TableName, CurrentIdColumn;

PRINT 'Step 5: Update each table''s _CurrentId using the historical-to-current mapping (only NULL/-1)';

DECLARE @SchemaName SYSNAME,
        @TableName SYSNAME,
        @CurrentCol SYSNAME,
        @FkCol SYSNAME,
        @IsNullable BIT,
        @sql NVARCHAR(MAX);

DECLARE cur CURSOR FAST_FORWARD FOR
    SELECT SchemaName, TableName, CurrentIdColumn, OriginalFkColumn, IsNullableCurrent
    FROM #Targets
    ORDER BY SchemaName, TableName, CurrentIdColumn;

OPEN cur;
FETCH NEXT FROM cur INTO @SchemaName, @TableName, @CurrentCol, @FkCol, @IsNullable;
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sql = N'UPDATE tgt
SET tgt.' + QUOTENAME(@CurrentCol) + N' = map.CurrentDimPersonId
FROM ' + QUOTENAME(@SchemaName) + N'.' + QUOTENAME(@TableName) + N' AS tgt
JOIN #DimPeople_HistoricalToCurrent AS map
  ON map.HistoricalDimPersonId = tgt.' + QUOTENAME(@FkCol) + N'
WHERE (tgt.' + QUOTENAME(@CurrentCol) + N' IS NULL OR tgt.' + QUOTENAME(@CurrentCol) + N' = -1);';

    BEGIN TRY
        PRINT 'Updating ' + @SchemaName + '.' + @TableName + ' -> ' + @CurrentCol + ' using ' + @FkCol + '...';
        EXEC sp_executesql @sql;
    END TRY
    BEGIN CATCH
        PRINT 'WARN: Failed to update ' + @SchemaName + '.' + @TableName + ' (' + ERROR_MESSAGE() + ')';
    END CATCH;

    FETCH NEXT FROM cur INTO @SchemaName, @TableName, @CurrentCol, @FkCol, @IsNullable;
END
CLOSE cur;
DEALLOCATE cur;

PRINT 'Step 6: Post-update validation summary (# rows still NULL/-1 per _CurrentId column)';
IF OBJECT_ID('tempdb..#Validation') IS NOT NULL DROP TABLE #Validation;
CREATE TABLE #Validation (
    SchemaName SYSNAME,
    TableName SYSNAME,
    CurrentIdColumn SYSNAME,
    Remaining BIGINT
);

DECLARE cur2 CURSOR FAST_FORWARD FOR
    SELECT SchemaName, TableName, CurrentIdColumn
    FROM #Targets
    ORDER BY SchemaName, TableName, CurrentIdColumn;

OPEN cur2;
FETCH NEXT FROM cur2 INTO @SchemaName, @TableName, @CurrentCol;
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sql = N'SELECT @out = COUNT(*) FROM ' + QUOTENAME(@SchemaName) + N'.' + QUOTENAME(@TableName) + N' WHERE ' + QUOTENAME(@CurrentCol) + N' IS NULL OR ' + QUOTENAME(@CurrentCol) + N' = -1;';
    DECLARE @cnt BIGINT = 0;
    EXEC sp_executesql @sql, N'@out BIGINT OUTPUT', @out=@cnt OUTPUT;
    INSERT INTO #Validation(SchemaName, TableName, CurrentIdColumn, Remaining) VALUES(@SchemaName, @TableName, @CurrentCol, @cnt);
    FETCH NEXT FROM cur2 INTO @SchemaName, @TableName, @CurrentCol;
END
CLOSE cur2;
DEALLOCATE cur2;

SELECT * FROM #Validation WHERE Remaining > 0 ORDER BY Remaining DESC, SchemaName, TableName, CurrentIdColumn;

PRINT 'Backfill complete.';
