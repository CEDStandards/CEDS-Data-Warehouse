CREATE PROCEDURE [Staging].[Rollover_SourceSystemReferenceData]
AS
BEGIN

	declare @StagingSchoolYear int, @MaxSchoolYearInSSRD int = 0

	-- Build a temp table of all School Years that exist in Staging.StateDetail (typically there will only be one year)
	-- This assures that SourceSystemReferenceData has records that correspond to the staging school year.
	IF OBJECT_ID(N'tempdb..#SchoolYearsInStaging') IS NOT NULL DROP TABLE #SchoolYearsInStaging
	select distinct SchoolYear into #SchoolYearsInStaging from Staging.StateDetail 
	while exists(select top 1 * from #SchoolYearsInStaging)
		begin
			select @MaxSchoolYearInSSRD = (select max(SchoolYear) from Staging.SourceSystemReferenceData)
			select @StagingSchoolYear = (select top 1 SchoolYear from #SchoolYearsInStaging)

				-- Roll the staging.SourceSystemReferenceData OptionSets into the next school year
				-- if there are no records in SourceSystemReferenceData for the Staging School Year
				IF (SELECT COUNT(*) FROM staging.SourceSystemReferenceData WHERE SchoolYear = @StagingSchoolYear) = 0
					BEGIN
		
						-- Verify there are records from the previous year to roll forward
						if (select count(*) from Staging.SourceSystemReferenceData where SchoolYear = @StagingSchoolYear-1) = 0
							begin
								if @MaxSchoolYearInSSRD = 0
									begin
										insert into app.DataMigrationHistories (DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) 
										values (getutcdate(), 4, 'ERROR: Rollover of SourceSystemReferenceData Failed for ' + convert(varchar, @StagingSchoolYear) + ' because no records exist for any previous years.') 
										return
									end
							end

						INSERT INTO staging.SourceSystemReferenceData (
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
						FROM staging.SourceSystemReferenceData
						WHERE SchoolYear = @MaxSchoolYearInSSRD
					END
				delete from #SchoolYearsInStaging where SchoolYear = @StagingSchoolYear

				if @MaxSchoolYearInSSRD = @StagingSchoolYear - 1
					begin
						insert into app.DataMigrationHistories (DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) 
						values (getutcdate(), 4, 'SourceSystemReferenceData rolled over for ' + convert(varchar, @StagingSchoolYear) + ' from ' + convert(varchar, @MaxSchoolYearInSSRD)) 
					end
				else
					begin
						insert into app.DataMigrationHistories (DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) 
						values (getutcdate(), 4, 'NOTE: SourceSystemReferenceData rolled over for ' + convert(varchar, @StagingSchoolYear) + ' from ' + convert(varchar, @MaxSchoolYearInSSRD) + ' because no data existed for ' + convert(varchar, @StagingSchoolYear-1) ) 
					end	
		end -- end of loop

END

GO

