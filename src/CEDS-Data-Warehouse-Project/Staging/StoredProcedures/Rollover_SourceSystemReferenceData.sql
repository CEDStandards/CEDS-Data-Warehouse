CREATE PROCEDURE [Staging].[Rollover_SourceSystemReferenceData]
AS
BEGIN

	declare @StagingSchoolYear int, @MaxSchoolYearInSSRD int = 0

	-- Build a temp table of all School Years that exist in Staging.StateDetail (typically there will only be one year)
	-- This assures that SourceSystemReferenceData has records that correspond to the staging school year.
	IF OBJECT_ID(N'tempdb..#SchoolYearsInStaging') IS NOT NULL DROP TABLE #SchoolYearsInStaging
	SELECT DISTINCT SchoolYear into #SchoolYearsInStaging FROM Staging.StateDetail 
	while exists(SELECT TOP 1 * FROM #SchoolYearsInStaging)
		begin
			SELECT @MaxSchoolYearInSSRD = (SELECT MAX(SchoolYear) FROM Staging.SourceSystemReferenceData)
			SELECT @StagingSchoolYear = (SELECT TOP 1 SchoolYear FROM #SchoolYearsInStaging)

				-- Roll the Staging.SourceSystemReferenceData OptionSets into the next school year
				-- if there are no records in SourceSystemReferenceData for the Staging School Year
				IF (SELECT COUNT(*) FROM Staging.SourceSystemReferenceData WHERE SchoolYear = @StagingSchoolYear) = 0
					BEGIN
		
						-- Verify there are records from the previous year to roll forward
						if (SELECT COUNT(*) FROM Staging.SourceSystemReferenceData where SchoolYear = @StagingSchoolYear-1) = 0
							begin
								if @MaxSchoolYearInSSRD = 0
									begin
										INSERT INTO App.DataMigrationHistories (DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) 
										values (getutcdate(), 4, 'ERROR: Rollover of SourceSystemReferenceData Failed for ' + convert(varchar, @StagingSchoolYear) + ' because no records exist for any previous years.') 
										return
									end
							end

						INSERT INTO Staging.SourceSystemReferenceData (
							SchoolYear
							,TableName
							,TableFilter
							,InputCode
							,OutputCode
						)
						SELECT DISTINCT
							@StagingSchoolYear
							,TableName
							,TableFilter
							,InputCode
							,OutputCode
						FROM Staging.SourceSystemReferenceData
						WHERE SchoolYear = @MaxSchoolYearInSSRD
					END
				delete FROM #SchoolYearsInStaging where SchoolYear = @StagingSchoolYear

				if @MaxSchoolYearInSSRD = @StagingSchoolYear - 1
					begin
						INSERT INTO App.DataMigrationHistories (DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) 
						values (getutcdate(), 4, 'SourceSystemReferenceData rolled over for ' + convert(varchar, @StagingSchoolYear) + ' FROM ' + convert(varchar, @MaxSchoolYearInSSRD)) 
					end
				else
					begin
						INSERT INTO App.DataMigrationHistories (DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) 
						values (getutcdate(), 4, 'NOTE: SourceSystemReferenceData rolled over for ' + convert(varchar, @StagingSchoolYear) + ' FROM ' + convert(varchar, @MaxSchoolYearInSSRD) + ' because no data existed for ' + convert(varchar, @StagingSchoolYear-1) ) 
					end	
		end -- end of loop

END

GO

