CREATE PROCEDURE  [Staging].[Staging-to-FactK12StaffCounts] 
	@SchoolYear SMALLINT
AS
BEGIN
	 --SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Drop temp tables.  This allows for running the procedure as a script while debugging
		IF OBJECT_ID(N'tempdb..#vwK12StaffStatuses') IS NOT NULL DROP TABLE #vwK12StaffStatuses
		IF OBJECT_ID(N'tempdb..#vwK12StaffCategories') IS NOT NULL DROP TABLE #vwK12StaffCategories

	BEGIN TRY

	--SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
		SET NOCOUNT ON;

		DECLARE 
		@FactTypeId INT,
		@SchoolYearId int,
		@ChildCountDate date
		
	--Setting variables to be used in the select statements 
		SELECT @SchoolYearId = DimSchoolYearId 
		FROM RDS.DimSchoolYears
		WHERE SchoolYear = @SchoolYear

		SELECT @ChildCountDate = tr.ResponseValue
		FROM App.ToggleQuestions tq
		JOIN App.ToggleResponses tr
			ON tq.ToggleQuestionId = tr.ToggleQuestionId
		WHERE tq.EmapsQuestionAbbrv = 'CHDCTDTE'

		SELECT @ChildCountDate = CAST(CAST(@SchoolYear - 1 AS CHAR(4)) + '-' + CAST(MONTH(@ChildCountDate) AS VARCHAR(2)) + '-' + CAST(DAY(@ChildCountDate) AS VARCHAR(2)) AS DATE)

	--Create the temp tables (and any relevant indexes) needed for this domain

		SELECT *
		INTO #vwK12StaffStatuses
		FROM RDS.vwDimK12StaffStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwK12StaffStatuses ON #vwK12StaffStatuses (SpecialEducationAgeGroupTaughtMap, EdFactsTeacherInexperiencedStatusMap, EdFactsTeacherOutOfFieldStatusMap, TeachingCredentialTypeMap, ParaprofessionalQualificationStatusMap, HighlyQualifiedTeacherIndicatorMap, SpecialEducationTeacherQualificationStatusMap, EdFactsCertificationStatusMap);
		
		SELECT *
		INTO #vwK12StaffCategories
		FROM RDS.vwDimK12StaffCategories
		WHERE SchoolYear = @SchoolYear

    CREATE CLUSTERED INDEX ix_tempvwK12StaffCategories ON #vwK12StaffCategories (K12StaffClassificationMap, SpecialEducationSupportServicesCategoryMap, TitleIProgramStaffCategoryMap);

		
		SELECT @FactTypeId = DimFactTypeId 
		FROM rds.DimFactTypes
		WHERE FactTypeCode = 'Submission'

		DELETE RDS.FactK12StaffCounts
		WHERE SchoolYearId = @SchoolYearId 
			AND FactTypeId = @FactTypeId

		IF OBJECT_ID('tempdb..#Facts') IS NOT NULL 
			DROP TABLE #Facts

	--Create and load #Facts temp table
		CREATE TABLE #Facts (
			StagingId								int not null
			, SchoolYearId							int null
			, FactTypeId							int null
			, SeaId									int null
			, LeaId									int null
			, K12SchoolId							int null
			, K12StaffId							int null
			, K12StaffStatusId						int null
			, K12StaffCategoryId					int null
			, TitleIIIStatusId						int null
			, CredentialIssuanceDateId				int null
			, CredentialExpirationDateId			int null
			, StaffCount							int null
			, StaffFullTimeEquivalency				decimal(5,4) null
		)

		INSERT INTO #Facts
		SELECT DISTINCT 
			ssa.Id										StagingId
			, rsy.DimSchoolYearId						SchoolYearId
			, @FactTypeId								FactTypeId
			, ISNULL(rds.DimSeaId, -1)					SeaId
			, ISNULL(rdl.DimLeaID, -1)					LeaId
			, ISNULL(rdksch.DimK12SchoolId, -1)			K12SchoolId
			, ISNULL(rdp.DimPersonId, -1)				K12StaffId
			, ISNULL(rdkss.DimK12StaffStatusId, -1)		K12StaffStatusId
			, ISNULL(rdksc.DimK12StaffCategoryId, -1)	K12StaffCategoryId
			, -1										TitleIIIStatusId
			, ISNULL(credIss.DimDateId, -1)				CredentialIssuanceDateId
			, ISNULL(credExp.DimDateId, -1)				CredentialExpirationDateId
			, 1											StaffCounts
			, FullTimeEquivalency						StaffFullTimeEquivalency
		FROM Staging.K12StaffAssignment ssa
		JOIN RDS.DimSchoolYears rsy
			ON ssa.SchoolYear = rsy.SchoolYear
	--lea (rds)
		LEFT JOIN RDS.DimLeas rdl
			ON ssa.LeaIdentifierSea = rdl.LeaIdentifierSea
			AND @ChildCountDate BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, GETDATE())
	--k12 school (rds)
		LEFT JOIN RDS.DimK12Schools rdksch
			ON ssa.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
			AND @ChildCountDate BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, GETDATE())
	--sea (rds)
		LEFT JOIN RDS.DimSeas rds
			ON @ChildCountDate BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, GETDATE())
	--staff categories (rds)
		LEFT JOIN #vwK12StaffCategories rdksc 
			ON rsy.SchoolYear = rdksc.SchoolYear
			AND ISNULL(ssa.K12StaffClassification, 'MISSING') = ISNULL(rdksc.K12StaffClassificationMap, rdksc.K12StaffClassificationCode)
			AND ISNULL(ssa.SpecialEducationStaffCategory, 'MISSING') = ISNULL(rdksc.SpecialEducationSupportServicesCategoryMap, rdksc.SpecialEducationSupportServicesCategoryCode)
			AND ISNULL(ssa.TitleIProgramStaffCategory, 'MISSING') = ISNULL(rdksc.TitleIProgramStaffCategoryMap, rdksc.TitleIProgramStaffCategoryCode)
	--staff statuses (rds)
		LEFT JOIN #vwK12StaffStatuses rdkss
			ON rsy.SchoolYear = rdkss.SchoolYear
			AND ISNULL(ssa.SpecialEducationAgeGroupTaught, 'MISSING') = ISNULL(rdkss.SpecialEducationAgeGroupTaughtMap, rdkss.SpecialEducationAgeGroupTaughtCode)
			AND ISNULL(ssa.EDFactsTeacherOutOfFieldStatus, 'MISSING') = ISNULL(rdkss.EDFactsTeacherOutOfFieldStatusMap, rdkss.EDFactsTeacherOutOfFieldStatusCode)
			AND ISNULL(ssa.EdFactsTeacherInexperiencedStatus, 'MISSING') = ISNULL(rdkss.EdFactsTeacherInexperiencedStatusMap, rdkss.EdFactsTeacherInexperiencedStatusCode)
			AND ISNULL(ssa.TeachingCredentialType, 'MISSING') = ISNULL(rdkss.TeachingCredentialTypeMap, rdkss.TeachingCredentialTypeCode)
			AND ISNULL(ssa.ParaprofessionalQualificationStatus, 'MISSING') = ISNULL(rdkss.ParaprofessionalQualificationStatusMap, rdkss.ParaprofessionalQualificationStatusCode)
			AND ISNULL(CAST(ssa.HighlyQualifiedTeacherIndicator AS SMALLINT), -1) = ISNULL(rdkss.HighlyQualifiedTeacherIndicatorMap, -1)
			AND ISNULL(ssa.SpecialEducationTeacherQualificationStatus, 'MISSING') = ISNULL(rdkss.SpecialEducationTeacherQualificationStatusMap, rdkss.SpecialEducationTeacherQualificationStatusCode)
            AND	ISNULL(ssa.EdFactsCertificationStatus, 'MISSING') = ISNULL(rdkss.EdFactsCertificationStatusMap, rdkss.EdFactsCertificationStatusCode)
	--credential issuance date	
		LEFT JOIN RDS.DimDates CredIss
			ON ssa.CredentialIssuanceDate = CredIss.DateValue
	--credential expiration date	
		LEFT JOIN RDS.DimDates CredExp
			ON ssa.CredentialExpirationDate = CredExp.DateValue
	--person (rds)
		JOIN RDS.DimPeople rdp
			ON ssa.StaffMemberIdentifierState = rdp.K12StaffStaffMemberIdentifierState
			AND rdp.IsActiveK12Staff = 1
			AND ISNULL(ssa.FirstName, 'MISSING') = ISNULL(rdp.FirstName, 'MISSING')
			AND ISNULL(ssa.MiddleName, 'MISSING') = ISNULL(rdp.MiddleName, 'MISSING')
			AND ISNULL(ssa.LastOrSurname, 'MISSING') = ISNULL(rdp.LastOrSurname, 'MISSING')
			AND @ChildCountDate BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())
			AND @ChildCountDate BETWEEN ssa.AssignmentStartDate AND ISNULL(ssa.AssignmentEndDate, GETDATE())
		
	--Final insert into RDS.FactK12StaffCounts table
		INSERT INTO RDS.FactK12StaffCounts ( 
			SchoolYearId
			, FactTypeId
			, SeaId
			, LeaId
			, K12SchoolId
			, K12StaffId
			, K12StaffStatusId
			, K12StaffCategoryId
			, TitleIIIStatusId
			, CredentialIssuanceDateId
			, CredentialExpirationDateId
			, StaffCount
			, StaffFullTimeEquivalency
		)
		SELECT 
			SchoolYearId
			, FactTypeId
			, SeaId
			, LeaId
			, K12SchoolId
			, K12StaffId
			, K12StaffStatusId
			, K12StaffCategoryId
			, TitleIIIStatusId
			, CredentialIssuanceDateId
			, CredentialExpirationDateId
			, StaffCount
			, StaffFullTimeEquivalency
		FROM #Facts

		ALTER INDEX ALL ON RDS.FactK12StaffCounts REBUILD

	END TRY
	BEGIN CATCH
		INSERT INTO Staging.ValidationErrors VALUES ('Staging.Staging-to-FactK12StaffCounts', 'RDS.FactK12StaffCounts', 'FactK12StaffCounts', NULL, ERROR_MESSAGE(), 1, NULL, GETDATE())
	END CATCH
		
END