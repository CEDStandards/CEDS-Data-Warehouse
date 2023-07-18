CREATE PROCEDURE [Staging].[RUN_DMC]
	@submissionYear int = NULL
AS
BEGIN

    SET NOCOUNT ON;

		-- Completely clear the RDS
		TRUNCATE TABLE RDS.BridgeK12AssessmentRaces
		TRUNCATE TABLE RDS.BridgeK12ProgramParticipationRaces
		TRUNCATE TABLE RDS.BridgeK12SchoolGradeLevels
		TRUNCATE TABLE RDS.BridgeK12StudentCourseSectionK12Staff
		TRUNCATE TABLE RDS.BridgeK12StudentCourseSectionRace
		TRUNCATE TABLE RDS.BridgeK12StudentEnrollmentRaces
		TRUNCATE TABLE RDS.BridgeLeaGradeLevels
		TRUNCATE TABLE RDS.BridgePsStudentEnrollmentRaces
		TRUNCATE TABLE RDS.ReportEDFactsK12StaffCounts
		TRUNCATE TABLE RDS.ReportEDFactsK12StudentCounts
		TRUNCATE TABLE RDS.ReportEDFactsK12StudentDisciplines

		DELETE FROM RDS.FactCustomCounts
		DELETE FROM RDS.FactK12ProgramParticipations
		DELETE FROM RDS.FactK12StaffCounts
		DELETE FROM RDS.FactK12StudentAssessmentReports
		DELETE FROM RDS.FactK12StudentAssessments
		DELETE FROM RDS.FactK12StudentAttendance
		DELETE FROM RDS.FactK12StudentAttendanceReports
		DELETE FROM RDS.FactK12StudentCounts
		DELETE FROM RDS.FactK12StudentCourseSections
		DELETE FROM RDS.FactK12StudentDisciplines
		DELETE FROM RDS.FactK12StudentEnrollments
		DELETE FROM RDS.FactOrganizationCountReports
		DELETE FROM RDS.FactOrganizationCounts
		DELETE FROM RDS.FactOrganizationStatusCountReports
		DELETE FROM RDS.FactOrganizationStatusCounts
		DELETE FROM RDS.DimSeas
		DELETE FROM RDS.DimLeas
		DELETE FROM RDS.DimK12Schools
		DELETE FROM RDS.DimK12Students
		DELETE FROM RDS.DimK12Staff


		DBCC CHECKIDENT('RDS.FactCustomCounts', RESEED, 1);
		DBCC CHECKIDENT('RDS.FactK12ProgramParticipations', RESEED, 1);
		DBCC CHECKIDENT('RDS.FactK12StaffCounts', RESEED, 1);
		DBCC CHECKIDENT('RDS.FactK12StudentAssessmentReports', RESEED, 1);
		DBCC CHECKIDENT('RDS.FactK12StudentAssessments', RESEED, 1);
		DBCC CHECKIDENT('RDS.FactK12StudentAttendance', RESEED, 1);
		DBCC CHECKIDENT('RDS.FactK12StudentAttendanceReports', RESEED, 1);
		DBCC CHECKIDENT('RDS.FactK12StudentCounts', RESEED, 1);
		DBCC CHECKIDENT('RDS.FactK12StudentCourseSections', RESEED, 1);
		DBCC CHECKIDENT('RDS.FactK12StudentDisciplines', RESEED, 1);
		DBCC CHECKIDENT('RDS.FactK12StudentEnrollments', RESEED, 1);
		DBCC CHECKIDENT('RDS.FactOrganizationCountReports', RESEED, 1);
		DBCC CHECKIDENT('RDS.FactOrganizationCounts', RESEED, 1);
		DBCC CHECKIDENT('RDS.FactOrganizationStatusCountReports', RESEED, 1);
		DBCC CHECKIDENT('RDS.FactOrganizationStatusCounts', RESEED, 1);
		DBCC CHECKIDENT('RDS.DimSeas', RESEED, 1);
		DBCC CHECKIDENT('RDS.DimLeas', RESEED, 1);
		DBCC CHECKIDENT('RDS.DimK12Schools', RESEED, 1);
		DBCC CHECKIDENT('RDS.DimK12Students', RESEED, 1);
		DBCC CHECKIDENT('RDS.DimK12Staff', RESEED, 1);

		--set the Submission Year if it wasn't provided
		if ISNULL(@submissionYear, '') = ''
		begin
			select @submissionYear = SchoolYear
			from staging.K12Enrollment	
		end

	--	--create temp table to hold stored procedures/execution flag
	--	if OBJECT_ID('tempdb..#IDSMigrationStoredProcedures') IS NOT NULL
	--	drop table #IDSMigrationStoredProcedures

	--	create table #IDSMigrationStoredProcedures (
	--		SP_ID								int		
	--		, StoredProcedureName				nvarchar(100)
	--		, Executed 							bit
	--		, Error								nvarchar(max)
	--	)

	--	insert into #IDSMigrationStoredProcedures
	--	values 
	--	(1, 'Migrate_StagingToIDS_CompletelyClearDataFromODS', 0, NULL),
	--	(2, 'Migrate_StagingToIDS_Organization', 0, NULL),
	--	(3, 'Migrate_StagingToIDS_OrganizationProgramType', 0, NULL),
	--	(4, 'Migrate_StagingToIDS_OrganizationAddress', 0, NULL),
	--	(5, 'Migrate_StagingToIDS_OrganizationCalendarSession', 0, NULL),
	--	(6, 'Migrate_StagingToIDS_CharterSchoolManagementOrganization', 0, NULL),
	--	(7, 'Migrate_StagingToIDS_Assessment', 0, NULL),
	--	--(8, 'Migrate_StagingToIDS_ComprehensiveandTargetedSupport', 0, NULL),
	--	(9, 'Migrate_StagingToIDS_Discipline', 0, NULL),
	--	(10, 'Migrate_StagingToIDS_K12Enrollment', 0, NULL),
	--	(11, 'Migrate_StagingToIDS_K12ProgramParticipation', 0, NULL),
	--	(12, 'Migrate_StagingToIDS_K12StaffAssignment', 0, NULL),
	--	(13, 'Migrate_StagingToIDS_Migrant', 0, NULL),
	--	(14, 'Migrate_StagingToIDS_PersonRace', 0, NULL),
	--	(15, 'Migrate_StagingToIDS_PersonStatus', 0, NULL),
	--	(16, 'Migrate_StagingToIDS_ProgramParticipationCTE', 0, NULL),
	--	(17, 'Migrate_StagingToIDS_ProgramParticipationNorD', 0, NULL),
	--	(18, 'Migrate_StagingToIDS_ProgramParticipationSpecialEducation', 0, NULL),
	--	(19, 'Migrate_StagingToIDS_ProgramParticipationTitleI', 0, NULL),
	--	(20, 'Migrate_StagingToIDS_ProgramParticipationTitleIII', 0, NULL)
	--	--(21, 'Migrate_StagingToIDS_StateDefinedCustomIndicator', 0, NULL),
	--	--(22, 'Migrate_StagingToIDS_StudentCourseSection', 0, NULL),
	--	--(23, 'Migrate_StagingToIDS_PsInstitution', 0, NULL),
	--	--(24, 'Migrate_StagingToIDS_PsStudentAcademicAward', 0, NULL),
	--	--(25, 'Migrate_StagingToIDS_PsStudentAcademicRecord', 0, NULL),
	--	--(26, 'Migrate_StagingToIDS_PsStudentEnrollment', 0, NULL)


	----------------------------------------------
	----IDS
	----------------------------------------------

	--	--------------
	--	--Standard
	--	--------------
	--		--write out message to DataMigrationHistories
	--		insert into app.DataMigrationHistories
	--		(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper IDS Core SPs')

	--		if exists (select 1 from #IDSMigrationStoredProcedures where SP_ID = 1 and executed = 0)
	--		begin try 

	--			--execute the stored procedure
	--			exec [Staging].[Migrate_StagingToIDS_CompletelyClearDataFromODS] @submissionYear

	--			DBCC SHRINKFILE([generate-test], 1)
	--			DBCC SHRINKFILE([generate-test_log], 1)

	--			--update the temp table 
	--			update #IDSMigrationStoredProcedures set executed = 1 where SP_ID = 1

	--		end try 
	--		begin catch 
	--			update #IDSMigrationStoredProcedures set Error = ERROR_MESSAGE() where SP_ID = 1
	--		end catch
	--	--------

	--		if exists (select 1 from #IDSMigrationStoredProcedures where SP_ID = 2 and executed = 0)
	--		begin try 

	--			--execute the stored procedure
	--			exec [Staging].[Migrate_StagingToIDS_Organization] @submissionYear	
	--			DBCC SHRINKFILE([generate-test], 1)
	--			DBCC SHRINKFILE([generate-test_log], 1)
	--			--update the temp table 
	--			update #IDSMigrationStoredProcedures set executed = 1 where SP_ID = 2

	--		end try 
	--		begin catch 
	--			update #IDSMigrationStoredProcedures set Error = ERROR_MESSAGE() where SP_ID = 2
	--		end catch
	--	--------
	
	--		if exists (select 1 from #IDSMigrationStoredProcedures where SP_ID = 3 and executed = 0)
	--		begin try 

	--			--execute the stored procedure
	--			exec [Staging].[Migrate_StagingToIDS_OrganizationProgramType] @submissionYear
	--			DBCC SHRINKFILE([generate-test], 1)
	--			DBCC SHRINKFILE([generate-test_log], 1)
	--			--update the temp table 
	--			update #IDSMigrationStoredProcedures set executed = 1 where SP_ID = 3

	--		end try 
	--		begin catch 
	--			update #IDSMigrationStoredProcedures set Error = ERROR_MESSAGE() where SP_ID = 3
	--		end catch
	--	--------


	--	--------------
	--	--Directory
	--	--------------

	--		--write out message to DataMigrationHistories
	--		insert into app.DataMigrationHistories
	--		(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper IDS Directory')

	--		if exists (select 1 from #IDSMigrationStoredProcedures where SP_ID = 4 and executed = 0)
	--		begin try 

	--			--execute the stored procedure
	--			exec [Staging].[Migrate_StagingToIDS_OrganizationAddress] @submissionYear
	--			DBCC SHRINKFILE([generate-test], 1)
	--			DBCC SHRINKFILE([generate-test_log], 1)

	--			--update the temp table 
	--			update #IDSMigrationStoredProcedures set executed = 1 where SP_ID = 4

	--		end try 
	--		begin catch 
	--			update #IDSMigrationStoredProcedures set Error = ERROR_MESSAGE() where SP_ID = 4
	--		end catch

	--	--------

	--	--------------
	--	--All student data
	--	--------------
	--		--write out message to DataMigrationHistories
	--		insert into app.DataMigrationHistories
	--		(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper IDS All Student Data')

	--		if exists (select 1 from #IDSMigrationStoredProcedures where SP_ID = 10 and executed = 0)
	--		begin try 

	--			--execute the stored procedure
	--			exec [Staging].[Migrate_StagingToIDS_K12Enrollment]
	--			DBCC SHRINKFILE([generate-test], 1)
	--			DBCC SHRINKFILE([generate-test_log], 1)

	--			--update the temp table 
	--			update #IDSMigrationStoredProcedures set executed = 1 where SP_ID = 10

	--		end try 
	--		begin catch 
	--			update #IDSMigrationStoredProcedures set Error = ERROR_MESSAGE() where SP_ID = 10
	--		end catch
	--		--------

	--		if exists (select 1 from #IDSMigrationStoredProcedures where SP_ID = 14 and executed = 0)
	--		begin try 

	--			--execute the stored procedure
	--			exec [Staging].[Migrate_StagingToIDS_PersonRace]
	--			DBCC SHRINKFILE([generate-test], 1)
	--			DBCC SHRINKFILE([generate-test_log], 1)

	--			--update the temp table 
	--			update #IDSMigrationStoredProcedures set executed = 1 where SP_ID = 14

	--		end try 
	--		begin catch 
	--			update #IDSMigrationStoredProcedures set Error = ERROR_MESSAGE() where SP_ID = 14
	--		end catch
	--		--------

	--		if exists (select 1 from #IDSMigrationStoredProcedures where SP_ID = 15 and executed = 0)
	--		begin try 

	--			--execute the stored procedure
	--			exec [Staging].[Migrate_StagingToIDS_PersonStatus] @submissionYear
	--			DBCC SHRINKFILE([generate-test], 1)
	--			DBCC SHRINKFILE([generate-test_log], 1)

	--			--update the temp table 
	--			update #IDSMigrationStoredProcedures set executed = 1 where SP_ID = 15

	--		end try 
	--		begin catch 
	--			update #IDSMigrationStoredProcedures set Error = ERROR_MESSAGE() where SP_ID = 15
	--		end catch
	--		--------

	--		if exists (select 1 from #IDSMigrationStoredProcedures where SP_ID = 18 and executed = 0)
	--		begin try 

	--			--execute the stored procedure
	--			exec [Staging].[Migrate_StagingToIDS_ProgramParticipationSpecialEducation] @submissionYear
	--			DBCC SHRINKFILE([generate-test], 1)
	--			DBCC SHRINKFILE([generate-test_log], 1)

	--			--update the temp table 
	--			update #IDSMigrationStoredProcedures set executed = 1 where SP_ID = 18

	--		end try 
	--		begin catch 
	--			update #IDSMigrationStoredProcedures set Error = ERROR_MESSAGE() where SP_ID = 18
	--		end catch
	--		--------

	--	--------------
	--	--Discipline
	--	--------------

	--		if exists (select 1 from #IDSMigrationStoredProcedures where SP_ID = 9 and executed = 0)
	--		begin try 

	--			--execute the stored procedure
	--			exec [Staging].[Migrate_StagingToIDS_Discipline] @submissionYear
	--			DBCC SHRINKFILE([generate-test], 1)
	--			DBCC SHRINKFILE([generate-test_log], 1)

	--			--update the temp table 
	--			update #IDSMigrationStoredProcedures set executed = 1 where SP_ID = 9

	--		end try 
	--		begin catch 
	--			update #IDSMigrationStoredProcedures set Error = ERROR_MESSAGE() where SP_ID = 9
	--		end catch
	--		--------


	--	--------------
	--	--Assessments
	--	--------------
	--		--------

	--		if exists (select 1 from #IDSMigrationStoredProcedures where SP_ID = 7 and executed = 0)
	--		begin try 

	--			--execute the stored procedure
	--			exec [Staging].[Migrate_StagingToIDS_Assessment] @submissionYear
	--			DBCC SHRINKFILE([generate-test], 1)
	--			DBCC SHRINKFILE([generate-test_log], 1)

	--			--update the temp table 
	--			update #IDSMigrationStoredProcedures set executed = 1 where SP_ID = 7

	--		end try 
	--		begin catch 
	--			update #IDSMigrationStoredProcedures set Error = ERROR_MESSAGE() where SP_ID = 7
	--		end catch
	--		--------

	--	--------------
	--	--Membership
	--	--------------

	--	--------------
	--	--Personnel
	--	--------------
	--		----write out message to DataMigrationHistories
	--		--insert into app.DataMigrationHistories
	--		--(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper IDS Personnel')

	--		--if exists (select 1 from #IDSMigrationStoredProcedures where SP_ID = 12 and executed = 0)
	--		--begin try 

	--		--	--execute the stored procedure
	--		--	exec [Staging].[Migrate_StagingToIDS_K12StaffAssignment]

	--		--	--update the temp table 
	--		--	update #IDSMigrationStoredProcedures set executed = 1 where SP_ID = 12

	--		--end try 
	--		--begin catch 
	--		--	update #IDSMigrationStoredProcedures set Error = ERROR_MESSAGE() where SP_ID = 12
	--		--end catch
	--		----------


	--	--------------
	--	--Title III
	--	--------------
	--		if exists (select 1 from #IDSMigrationStoredProcedures where SP_ID = 20 and executed = 0)
	--		begin try 

	--			--execute the stored procedure
	--			exec [Staging].[Migrate_StagingToIDS_ProgramParticipationTitleIII]
	--			DBCC SHRINKFILE([generate-test], 1)
	--			DBCC SHRINKFILE([generate-test_log], 1)

	--			--update the temp table 
	--			update #IDSMigrationStoredProcedures set executed = 1 where SP_ID = 20

	--		end try 
	--		begin catch 
	--			update #IDSMigrationStoredProcedures set Error = ERROR_MESSAGE() where SP_ID = 20
	--		end catch
	--		--------



	--	--------------
	--	--Title I
	--	--------------
	--		--------

	--		if exists (select 1 from #IDSMigrationStoredProcedures where SP_ID = 19 and executed = 0)
	--		begin try 

	--			--execute the stored procedure
	--			exec [Staging].[Migrate_StagingToIDS_ProgramParticipationTitleI]
	--			DBCC SHRINKFILE([generate-test], 1)
	--			DBCC SHRINKFILE([generate-test_log], 1)

	--			--update the temp table 
	--			update #IDSMigrationStoredProcedures set executed = 1 where SP_ID = 19

	--		end try 
	--		begin catch 
	--			update #IDSMigrationStoredProcedures set Error = ERROR_MESSAGE() where SP_ID = 19
	--		end catch
	--		--------



	--	--------------
	--	--N or D
	--	--------------
	--		--------

	--		if exists (select 1 from #IDSMigrationStoredProcedures where SP_ID = 17 and executed = 0)
	--		begin try 

	--			--execute the stored procedure
	--			exec [Staging].[Migrate_StagingToIDS_ProgramParticipationNorD]
	--			DBCC SHRINKFILE([generate-test], 1)
	--			DBCC SHRINKFILE([generate-test_log], 1)

	--			--update the temp table 
	--			update #IDSMigrationStoredProcedures set executed = 1 where SP_ID = 17

	--		end try 
	--		begin catch 
	--			update #IDSMigrationStoredProcedures set Error = ERROR_MESSAGE() where SP_ID = 17
	--		end catch
	--		--------


	--	--------------
	--	--CTE
	--	--------------
	--		--------

	--		if exists (select 1 from #IDSMigrationStoredProcedures where SP_ID = 16 and executed = 0)
	--		begin try 

	--			--execute the stored procedure
	--			exec [Staging].[Migrate_StagingToIDS_ProgramParticipationCTE]
	--			DBCC SHRINKFILE([generate-test], 1)
	--			DBCC SHRINKFILE([generate-test_log], 1)

	--			--update the temp table 
	--			update #IDSMigrationStoredProcedures set executed = 1 where SP_ID = 16

	--		end try 
	--		begin catch 
	--			update #IDSMigrationStoredProcedures set Error = ERROR_MESSAGE() where SP_ID = 16
	--		end catch
			--------

--------------------------------------------
--------------------------------------------
--RDS
--------------------------------------------
--------------------------------------------

		-- Rebuild the indexes first to improve performance of the queries below
		Exec sp_msforeachtable 'SET QUOTED_IDENTIFIER ON; ALTER INDEX ALL ON ? REBUILD'


		--Standard
			--write out message to DataMigrationHistories
			insert into app.DataMigrationHistories
			(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Core SPs')

			exec [Staging].[Staging-to-DimK12Students] NULL
			DBCC SHRINKFILE([generate-test], 1)
			DBCC SHRINKFILE([generate-test_log], 1)
			exec [Staging].[Staging-to-DimSeas] 'directory', NULL, 0
			DBCC SHRINKFILE([generate-test], 1)
			DBCC SHRINKFILE([generate-test_log], 1)
			exec [Staging].[Staging-to-DimLeas] 'directory', NULL, 0
			DBCC SHRINKFILE([generate-test], 1)
			DBCC SHRINKFILE([generate-test_log], 1)
			exec [Staging].[Staging-to-DimK12Schools] NULL, 0
			DBCC SHRINKFILE([generate-test], 1)
			DBCC SHRINKFILE([generate-test_log], 1)


		--Directory
			--write out message to DataMigrationHistories
			insert into app.DataMigrationHistories
			(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Directory')

			--exec [rds].[Migrate_DimCharterSchoolAuthorizersAndManagementOrgs] 'directory', NULL, 0
			exec Staging.[Staging-to-FactOrganizationCounts] @submissionYear
			DBCC SHRINKFILE([generate-test], 1)
			DBCC SHRINKFILE([generate-test_log], 1)


		--Child Count
			--write out message to DataMigrationHistories
			insert into app.DataMigrationHistories
			(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Child Count')

			exec [rds].[Empty_RDS] 'childcount'
			exec Staging.[Staging-to-FactK12StudentCounts_ChildCount] @submissionYear
			DBCC SHRINKFILE([generate-test], 1)
			DBCC SHRINKFILE([generate-test_log], 1)


		--Exiting
			--write out message to DataMigrationHistories
			insert into app.DataMigrationHistories
			(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Exiting')

			exec [rds].[Empty_RDS] 'specedexit'
			exec Staging.[Staging-to-FactK12StudentCounts_SpecEdExit] @submissionYear
			DBCC SHRINKFILE([generate-test], 1)
			DBCC SHRINKFILE([generate-test_log], 1)


		--Discipline
			--write out message to DataMigrationHistories
			insert into app.DataMigrationHistories
			(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Discipline')

			exec [rds].[Empty_RDS] 'submission', 'disciplinecounts'
			exec [Staging].[Staging-to-FactK12StudentDisciplines] @submissionYear
			DBCC SHRINKFILE([generate-test], 1)
			DBCC SHRINKFILE([generate-test_log], 1)


		----Assessments
		--	--write out message to DataMigrationHistories
		--	insert into app.DataMigrationHistories
		--	(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Assessments')

		--	exec [rds].[Empty_RDS] 'submission', 'studentassessments'
		--	exec [rds].[Migrate_StudentAssessments] 'submission', 0
		--	DBCC SHRINKFILE([generate-test], 1)
		--	DBCC SHRINKFILE([generate-test_log], 1)


		----Membership
		--	--write out message to DataMigrationHistories
		--	insert into app.DataMigrationHistories
		--	(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Membership')

		--	exec [rds].[Empty_RDS] 'membership'
		--	exec [rds].[Migrate_StudentCounts] 'membership', 0
		--	DBCC SHRINKFILE([generate-test], 1)
		--	DBCC SHRINKFILE([generate-test_log], 1)


		--Personnel
			--write out message to DataMigrationHistories
			insert into app.DataMigrationHistories
			(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Personnel')

			exec [Staging].[Staging-To-DimK12Staff]
			exec [rds].[Empty_RDS] 'submission', 'personnelcounts'
			exec [Staging].[Staging-to-FactK12StaffCounts] @submissionYear
			DBCC SHRINKFILE([generate-test], 1)
			DBCC SHRINKFILE([generate-test_log], 1)


		--Title III
			--write out message to DataMigrationHistories
			--insert into app.DataMigrationHistories
			--(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Title III')

			--exec [rds].[Empty_RDS] 'titleIIIELSY'
			--exec [rds].[Migrate_StudentCounts] 'titleIIIELSY', 0

			--exec [rds].[Empty_RDS] 'titleIIIELOct'
			--exec [rds].[Migrate_StudentCounts] 'titleIIIELOct', 0


		--Title I
			--write out message to DataMigrationHistories
			--insert into app.DataMigrationHistories
			--(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Title I')

			--exec [rds].[Empty_RDS] 'titleI'
			--exec [rds].[Migrate_StudentCounts] 'titleI', 0


		--SPPAPR
			--write out message to DataMigrationHistories
			--insert into app.DataMigrationHistories
			--(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS SPPAPR')

			--exec [rds].[Empty_RDS] 'sppapr'
			--exec [rds].[Migrate_StudentCounts] 'sppapr', 0


		--Other
			--write out message to DataMigrationHistories
			--insert into app.DataMigrationHistories
			--(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Other')

			--exec [rds].[Empty_RDS] 'other'
			--exec [rds].[Migrate_StudentCounts] 'other', 0


		--N or D
			--write out message to DataMigrationHistories
			--insert into app.DataMigrationHistories
			--(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS N or D')

			--exec [rds].[Empty_RDS] 'nord'
			--exec [rds].[Migrate_StudentCounts] 'nord', 0


		--MEP
			--write out message to DataMigrationHistories
			--insert into app.DataMigrationHistories
			--(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS MEP')

			--exec [rds].[Empty_RDS] 'mep'
			--exec [rds].[Migrate_StudentCounts] 'mep', 0


		--Immigrant
			--write out message to DataMigrationHistories
			--insert into app.DataMigrationHistories
			--(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Immigrant')

			--exec [rds].[Empty_RDS] 'immigrant'
			--exec [rds].[Migrate_StudentCounts] 'immigrant', 0


		--HsGradEnroll
			--write out message to DataMigrationHistories
			--insert into app.DataMigrationHistories
			--(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS HS Grad Enroll')

			--exec [rds].[Empty_RDS] 'hsgradenroll'
			--exec [rds].[Migrate_StudentCounts] 'hsgradenroll', 0


		--Homeless
			--write out message to DataMigrationHistories
			--insert into app.DataMigrationHistories
			--(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Homeless')

			--exec [rds].[Empty_RDS] 'homeless'
			--exec [rds].[Migrate_StudentCounts] 'homeless', 0


		--GradRate
			--write out message to DataMigrationHistories
			--insert into app.DataMigrationHistories
			--(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Grad Rate')

			--exec [rds].[Empty_RDS] 'gradrate'	
			--exec [rds].[Migrate_StudentCounts] 'gradrate', 0


		--Grad	
			--write out message to DataMigrationHistories
			--insert into app.DataMigrationHistories
			--(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Grad')

			--exec [rds].[Empty_RDS] 'Grad'
			--exec [rds].[Migrate_StudentCounts] 'Grad', 0


		--Dropout
			--write out message to DataMigrationHistories
			--insert into app.DataMigrationHistories
			--(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Dropout')

			--exec [rds].[Empty_RDS] 'Dropout'
			--exec [rds].[Migrate_StudentCounts] 'Dropout', 0


		--CTE
			--write out message to DataMigrationHistories
			--insert into app.DataMigrationHistories
			--(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS CTE')

			--exec [rds].[Empty_RDS] 'cte'
			--exec [rds].[Migrate_StudentCounts] 'cte', 0


		--Chronic
			--write out message to DataMigrationHistories
			--insert into app.DataMigrationHistories
			--(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'RUN DMC wrapper RDS Chronic')

			--exec [rds].[Empty_RDS] 'chronic'
			--exec [rds].[Migrate_StudentCounts] 'chronic', 0


		-- Update App.ToggleAssessments with data from Staging
		TRUNCATE TABLE App.ToggleAssessments

		;WITH Assessments AS (
		SELECT DISTINCT 
			  AssessmentTitle
			, AssessmentTypeAdministered
			, AssessmentAcademicSubject
			, AssessmentPerformanceLevelLabel
		FROM Staging.Assessment sa
		)
		INSERT INTO App.ToggleAssessments
		SELECT
			  sa.AssessmentTitle
			, CASE sa.AssessmentTypeAdministered
				WHEN 'ALTASSALTACH'		THEN 'Alternate assessments based on alternate achievement standards'
				WHEN 'ALTASSGRADELVL'	THEN 'Alternate assessments based on grade-level achievement standards'
				WHEN 'ALTASSMODACH'		THEN 'Alternate assessments based on modified achievement standards'
				WHEN 'REGASSWACC'		THEN 'Regular assessments based on grade-level achievement standards with accommodations'
				WHEN 'REGASSWOACC'		THEN 'Regular assessments based on grade-level achievement standards without accommodations'
			  END
			, sa.AssessmentTypeAdministered
			, 'End of Grade'
			, sar.GradeLevelWhenAssessed
			, COUNT(DISTINCT sar.AssessmentPerformanceLevelLabel)
			, '3'
			, CASE sa.AssessmentAcademicSubject
				WHEN '01166' THEN 'MATH'
				WHEN '13373' THEN 'RLA'
				WHEN '73065' THEN 'CTE'
				WHEN '00562' THEN 'SCIENCE'
				WHEN '00562' THEN 'SCIENCE'
			  END
		FROM Assessments sa
		JOIN Staging.AssessmentResult sar
			ON sa.AssessmentTitle = sar.AssessmentTitle
			AND sa.AssessmentAcademicSubject = sar.AssessmentAcademicSubject
			AND sa.AssessmentPerformanceLevelLabel = sar.AssessmentPerformanceLevelLabel
		LEFT JOIN App.ToggleAssessments ata
			ON sa.AssessmentTitle = ata.AssessmentName
			AND sa.AssessmentTypeAdministered = ata.AssessmentTypeCode
			AND sar.GradeLevelWhenAssessed = ata.Grade
			AND CASE sa.AssessmentAcademicSubject
				WHEN '01166' THEN 'MATH'
				WHEN '13373' THEN 'RLA'
				WHEN '73065' THEN 'CTE'
				WHEN '00562' THEN 'SCIENCE'
				WHEN '00562' THEN 'SCIENCE'
			  END = ata.Subject
		WHERE sa.AssessmentAcademicSubject <> '00256' -- ESL
			AND ata.ToggleAssessmentId IS NULL
			AND GradeLevelWhenAssessed <> 'abe'
		GROUP BY 
			  sa.AssessmentTitle
			, sa.AssessmentTypeAdministered
			, sar.GradeLevelWhenAssessed
			, sa.AssessmentAcademicSubject

	SET NOCOUNT OFF;

END

GO

