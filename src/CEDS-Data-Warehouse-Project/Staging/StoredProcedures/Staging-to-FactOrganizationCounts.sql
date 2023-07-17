/**********************************************************************
Author: AEM Corp
Date:	5/1/2022
Description: Migrates Organization Data from Staging to RDS.FactOrganizationCounts

NOTE: This Stored Procedure processes files: 029, 035, 039, 103, 129, 130, 131, 163, 170, 190, 193, 196, 197, 198, 205, 206
************************************************************************/
CREATE PROCEDURE Staging.[Staging-to-FactOrganizationCounts]
	@SchoolYear smallint 

AS   
BEGIN

	BEGIN TRY

		--Get the school year being migrated
		DECLARE @SchoolYearId int
		SELECT @SchoolYearId = DimSchoolYearId 
		FROM RDS.DimSchoolYears
		WHERE SchoolYear = @SchoolYear

		IF OBJECT_ID(N'tempdb..#seaOrganizationTypes') IS NOT NULL DROP TABLE #seaOrganizationTypes
		IF OBJECT_ID(N'tempdb..#leaOrganizationTypes') IS NOT NULL DROP TABLE #leaOrganizationTypes
		IF OBJECT_ID(N'tempdb..#schoolOrganizationTypes') IS NOT NULL DROP TABLE #schoolOrganizationTypes

		--Get the organization types via SourceSystemReferenceData
		CREATE TABLE #seaOrganizationTypes (
			SeaOrganizationType					VARCHAR(20)
		)
		
		CREATE TABLE #leaOrganizationTypes (
			LeaOrganizationType					VARCHAR(20)
		)

		CREATE TABLE #schoolOrganizationTypes (
			K12SchoolOrganizationType			VARCHAR(20)
		)


		INSERT INTO #seaOrganizationTypes
		SELECT 
			InputCode
		FROM Staging.SourceSystemReferenceData 
		WHERE TableName = 'RefOrganizationType' 
			AND TableFilter = '001156' 
			AND OutputCode = 'SEA'
			AND SchoolYear = @SchoolYear
		
		INSERT INTO #leaOrganizationTypes
		SELECT 
			InputCode
		FROM Staging.SourceSystemReferenceData 
		WHERE TableName = 'RefOrganizationType' 
			AND TableFilter = '001156' 
			AND OutputCode = 'LEA'
			AND SchoolYear = @SchoolYear

		INSERT INTO #schoolOrganizationTypes
		SELECT 
			InputCode
		FROM Staging.SourceSystemReferenceData 
		WHERE TableName = 'RefOrganizationType' 
			AND TableFilter = '001156' 
			AND OutputCode = 'K12School'
			AND SchoolYear = @SchoolYear

		DECLARE @factTypeId AS INT
		SELECT @factTypeId = DimFactTypeId FROM rds.DimFactTypes WHERE FactTypeCode = 'directory'

		DECLARE @dimSeaId AS INT, @DimK12StaffId INT, @DimIeuId INT, @dimLeaId INT, @DimK12SchoolId INT, @IsCharterSchool AS BIT, 
			@leaOrganizationId AS INT, 
			@schoolOrganizationId AS INT
		
		DECLARE @count AS INT
		DECLARE @dimCharterSchoolManagerId AS INT
		DECLARE @dimCharterSchoolSecondaryManagerId AS INT
		DECLARE @dimCharterSchoolAuthorizerId AS INT
		DECLARE @dimCharterSchoolSecondaryAuthorizerId AS INT

		DECLARE @leaOperationalStatustypeId AS INT, @schOperationalStatustypeId AS INT, @charterLeaCount AS INT
		SELECT @leaOperationalStatustypeId = RefOperationalStatusTypeId FROM dbo.RefOperationalStatusType WHERE Code = '000174'
		SELECT @schOperationalStatustypeId = RefOperationalStatusTypeId FROM dbo.RefOperationalStatusType WHERE Code = '000533'
		
		SELECT @charterLeaCount = count(OrganizationId) FROM dbo.K12Lea WHERE CharterSchoolIndicator = 1
	

		-- DELETE RECORDS FOR SCHOOL YEAR FROM FACT TABLE
		DELETE FROM rds.FactOrganizationCounts 
		WHERE SchoolYearId = @SchoolYearId

		--Get the ID for the State School Officer
		SELECT @DimK12StaffId = MAX(rdp.DimPersonId)
		FROM RDS.DimPeople rdp
		JOIN Staging.StateDetail ssd
			ON rdp.K12StaffStaffMemberIdentifierState = ssd.SeaContact_Identifier
			AND rdp.IsActiveK12Staff = 1
			AND (ssd.RecordStartDateTime >= Staging.GetFiscalYearStartDate(@SchoolYear)
				AND ISNULL(ssd.RecordEndDateTime, Staging.GetFiscalYearEndDate(@SchoolYear)) <= Staging.GetFiscalYearEndDate(@SchoolYear))


		-------------------------------
		--SEA
		-------------------------------
		INSERT INTO [RDS].[FactOrganizationCounts] (
			[SchoolYearId]
			, [FactTypeId]
			, [SeaId]
			, [LeaId]
			, [K12StaffId]
			, [K12SchoolId]
			, [TitleIStatusId]
			, [TitleIParentalInvolveRes]
			, [TitleIPartAAllocations]
			, [AuthorizingBodyCharterSchoolAuthorizerId]
			, [SecondaryAuthorizingBodyCharterSchoolAuthorizerId]
			, [CharterSchoolManagementOrganizationId]
			, [CharterSchoolUpdatedManagementOrganizationId]
			, [ReasonApplicabilityId]
			, [SchoolImprovementFunds]
			, [K12OrganizationStatusId]
			, [K12SchoolStatusId]
			, [K12SchoolStateStatusId]
			, [FederalProgramsFundingAllocationType]
			, [FederalProgramCode]
			, [FederalProgramsFundingAllocation]
			, [ComprehensiveAndTargetedSupportId]
			, [CharterSchoolStatusId]
			, [SubgroupId]
			, [OrganizationCount]
		)
		SELECT 
			@SchoolYearId 													AS SchoolYearId
			, @factTypeId 													AS FactTypeId
			, Sea.DimSeaId 													AS SeaId
			, -1 	 														AS LeaId
			, ISNULL( @DimK12StaffId, -1)	 								AS K12StaffId
			, -1 	 														AS K12SchoolId
			, -1  															AS TitleIStatusId
			, -1  															AS TitleIParentalInvolveRes
			, -1  															AS TitleIPartAAllocations
			, -1  															AS AuthorizingBodyCharterSchoolAuthorizerId
			, -1 															AS SecondaryAuthorizingBodyCharterSchoolAuthorizerId
			, -1 															AS CharterSchoolManagementOrganizationId
			, -1 															AS CharterSchoolUpdatedManagementOrganizationId
			, -1 															AS ReasonApplicabilityId
			, -1 															AS SchoolImprovementFunds
			, -1	  														AS K12OrganizationStatusId
			, -1															AS K12SchoolStatusId
			, -1  															AS K12SchoolstateStatusId
			, ISNULL(soff.FederalProgramFundingAllocationType, 'MISSING') 	AS FederalProgramsFundingAllocationType
			, ISNULL(soff.FederalProgramCode, 'MISSING') 					AS FederalProgramCode
			, CONVERT(int, ISNULL(soff.FederalProgramsFundingAllocation,0))	AS FederalProgramsFundingAllocation
			, -1 															AS ComprehensiveAndTargetedSupportId
			, -1 															AS CharterSchoolStatusId
			, -1 															AS SubgroupId
			, 1 															AS OrganizationCount

		FROM Staging.StateDetail ssd
		INNER JOIN RDS.DimSeas Sea
			ON ssd.SeaOrganizationIdentifierSea = Sea.SeaOrganizationIdentifierSea
			AND isnull(Sea.RecordEndDateTime, '6/30/' + convert(varchar, @SchoolYear)) >= '6/30/' + convert(varchar, @SchoolYear)
		LEFT JOIN Staging.OrganizationFederalFunding soff 
			ON ssd.SeaOrganizationIdentifierSea = soff.OrganizationIdentifier
			AND ssd.SchoolYear = soff.SchoolYear
			AND soff.OrganizationType in (select SeaOrganizationType from #seaOrganizationTypes)
			--AND soff.REAPAlternativeFundingStatusCode IS NOT NULL -- Not sure if we need this


		-------------------------------
		--LEA
		-------------------------------
		-- Get distinct list of LEAs from Staging along with latest start date (in cases where more than one status/startdate exists for an LEA
		IF OBJECT_ID(N'tempdb..#SortLEAs') IS NOT NULL DROP TABLE #SortLEAs
		IF OBJECT_ID(N'tempdb..#DistinctLEAs') IS NOT NULL DROP TABLE #DistinctLEAs

		SELECT DISTINCT
			DimLeaId, LeaIdentifierSea, RecordStartDateTime, 
			ROW_NUMBER() OVER (
				PARTITION BY LeaIdentifierSea
				ORDER BY RecordStartDateTime desc) row_num
		INTO #SortLEAs
		FROM 
			RDS.DimLeas

		SELECT * 
		INTO #DistinctLEAs
		FROM #SortLEAs
		WHERE LeaIdentifierSea IS NOT NULL
		AND row_num = 1
	

		INSERT INTO
		[RDS].[FactOrganizationCounts] (
			[SchoolYearId]
			, [FactTypeId]
			, [SeaId]
			, [LeaId]
			, [K12StaffId]
			, [K12SchoolId]
			, [TitleIStatusId]
			, [TitleIParentalInvolveRes]
			, [TitleIPartAAllocations]
			, [AuthorizingBodyCharterSchoolAuthorizerId]
			, [SecondaryAuthorizingBodyCharterSchoolAuthorizerId]
			, [CharterSchoolManagementOrganizationId]
			, [CharterSchoolUpdatedManagementOrganizationId]
			, [ReasonApplicabilityId]
			, [SchoolImprovementFunds]
			, [K12OrganizationStatusId]
			, [K12SchoolStatusId]
			, [K12SchoolStateStatusId]
			, [FederalProgramsFundingAllocationType]
			, [FederalProgramCode]
			, [FederalProgramsFundingAllocation]
			, [ComprehensiveAndTargetedSupportId]
			, [CharterSchoolStatusId]
			, [SubgroupId]
			, [OrganizationCount]
		)
		SELECT DISTINCT
			@SchoolYearId													AS SchoolYearId
			, @factTypeId													AS FactTypeId
			, -1															AS SeaId
			, rdl.DimLeaID													AS LeaId
			, -1															AS K12StaffId
			, -1															AS K12SchoolId
			, -1															AS TitleIStatusId
			, isnull(round(soff.ParentalInvolvementReservationFunds,0),0)	AS TitleIParentalInvolveRes
			, CASE WHEN soff.FederalProgramCode ='84.010' 
				THEN round(soff.FederalProgramsFundingAllocation,0) 
				ELSE 0 
			END 															AS TitleIPartAAllocations
			, -1															AS AuthorizingBodyCharterSchoolAuthorizerId
			, -1															AS SecondaryAuthorizingBodyCharterSchoolAuthorizerId
			, -1															AS CharterSchoolManagementOrganizationId
			, -1															AS CharterSchoolUpdatedManagementOrganizationId
			, -1															AS ReasonApplicabilityId
			, NULL															AS SchoolImprovementFunds
			, ISNULL(organizationStatus.DimK12OrganizationStatusId,-1)		AS K12OrganizationStatusId
			, -1															AS K12SchoolStatusId
			, -1															AS K12SchoolstateStatusId
			, ISNULL(soff.FederalProgramFundingAllocationType, 'MISSING')	AS FederalProgramsFundingAllocationType
			, ISNULL(soff.FederalProgramCode, 'MISSING')					AS FederalProgramCode
			, CONVERT(int, ISNULL(soff.FederalProgramsFundingAllocation,0))	AS FederalProgramsFundingAllocation
			, -1															AS ComprehensiveAndTargetedSupportId
			, -1															AS CharterSchoolStatusId
			, -1															AS SubgroupId
			, 1																AS OrganizationCount

		FROM Staging.K12Organization sko
		JOIN #DistinctLEAs dleas
			ON sko.LeaIdentifierSea = dleas.LeaIdentifierSea
			AND sko.LEA_RecordStartDateTime = dleas.RecordStartDateTime
		JOIN RDS.DimLeas rdl
			ON sko.LeaIdentifierSea = rdl.LeaIdentifierSea
			AND dleas.DimLeaID = rdl.DimLeaID
			AND rdl.DimLeaId <> -1 and ReportedFederally = 1
			AND (
				(rdl.RecordStartDateTime < staging.GetFiscalYearStartDate(@SchoolYear) 
					AND rdl.RecordEndDateTime IS NULL)
				OR 
				(rdl.RecordStartDateTime >= staging.GetFiscalYearStartDate(@SchoolYear) 
					AND rdl.RecordStartDateTime <= staging.GetFiscalYearEndDate(@SchoolYear))
			)
		LEFT JOIN Staging.OrganizationFederalFunding soff
			ON sko.LeaIdentifierSea = soff.OrganizationIdentifier
			AND sko.SchoolYear = soff.SchoolYear
			AND soff.OrganizationType in (select LEAOrganizationType from #leaOrganizationTypes)
			--AND soff.REAPAlternativeFundingStatusCode IS NOT NULL

		LEFT JOIN RDS.vwDimK12OrganizationStatuses organizationStatus
			ON organizationStatus.SchoolYear = sko.SchoolYear
			AND organizationStatus.GunFreeSchoolsActReportingStatusCode = 'Missing'
			AND organizationStatus.HighSchoolGraduationRateIndicatorStatusCode = 'Missing'
			AND organizationStatus.REAPAlternativeFundingStatusCode = 'Missing'
			AND ISNULL(CAST(sko.LEA_McKinneyVentoSubgrantRecipient AS SMALLINT), -1) = isnull(organizationStatus.McKinneyVentoSubgrantRecipientMap, -1)
			

		-------------------------------
		--School
		-------------------------------
		DECLARE @SchoolIdentifierSea VARCHAR(60)

		-- Get distinct list of Schools from Staging along with latest start date (in cases where more than one status/startdate exists for a school
		IF OBJECT_ID(N'tempdb..#SortSchools') IS NOT NULL DROP TABLE #SortSchools
		IF OBJECT_ID(N'tempdb..#DistinctSchools') IS NOT NULL DROP TABLE #DistinctSchools
		IF OBJECT_ID(N'tempdb..#DimCharterSchoolAuthorizers_Primary') IS NOT NULL DROP TABLE #DimCharterSchoolAuthorizers_Primary
		IF OBJECT_ID(N'tempdb..#DimCharterSchoolAuthorizers_Secondary') IS NOT NULL DROP TABLE #DimCharterSchoolAuthorizers_Secondary

		SELECT DISTINCT
			DimK12SchoolId, SchoolIdentifierSea, RecordStartDateTime, 
			ROW_NUMBER() OVER (
				PARTITION BY SchoolIdentifierSea
				ORDER BY RecordStartDateTime desc) row_num
		INTO #SortSchools
		FROM RDS.DimK12Schools


		SELECT * 
		INTO #DistinctSchools
		FROM #SortSchools
		WHERE SchoolIdentifierSea IS NOT NULL
		AND row_num = 1

		-- Get Charter School Authorizer data
		-- Primary
		SELECT CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea
			, CharterSchoolAuthorizerTypeCode
			, sko.SchoolIdentifierSea
			, min(dimCharterSchoolAuthorizerId) 'MinId'
			, max(dimCharterSchoolAuthorizerId) 'MaxId'
		INTO #DimCharterSchoolAuthorizers_Primary
		FROM rds.DimCharterSchoolAuthorizers rcsa
		INNER JOIN Staging.K12Organization sko
			ON sko.School_CharterSchoolIndicator = 1
			AND rcsa.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea = sko.School_CharterPrimaryAuthorizer
		WHERE rcsa.RecordStartDateTime >= '7/1/' + convert(varchar, @SchoolYear-1) 
		AND isnull(rcsa.RecordEndDateTime, '6/30/' + convert(varchar, @SchoolYear)) <= '6/30/' + convert(varchar, @SchoolYear)
		GROUP BY rcsa.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea
			, CharterSchoolAuthorizerTypeCode
			, sko.SchoolIdentifierSea
		ORDER BY sko.SchoolIdentifierSea

		-- Secondary
		SELECT CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea
			, CharterSchoolAuthorizerTypeCode
			, sko.SchoolIdentifierSea
			, min(dimCharterSchoolAuthorizerId) 'MinId'
			, max(dimCharterSchoolAuthorizerId) 'MaxId'
		INTO #DimCharterSchoolAuthorizers_Secondary
		FROM rds.DimCharterSchoolAuthorizers rcsa
		INNER JOIN Staging.K12Organization sko
			ON sko.School_CharterSchoolIndicator = 1
			AND rcsa.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea = sko.School_CharterSecondaryAuthorizer
		WHERE rcsa.RecordStartDateTime >= '7/1/' + convert(varchar, @SchoolYear-1) 
		AND isnull(rcsa.RecordEndDateTime, '6/30/' + convert(varchar, @SchoolYear)) <= '6/30/' + convert(varchar, @SchoolYear)
		GROUP BY rcsa.CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea
			, CharterSchoolAuthorizerTypeCode
			, sko.SchoolIdentifierSea
		ORDER BY sko.SchoolIdentifierSea


		----INSERT INTO FactOrganizationCounts

		INSERT INTO 
		[RDS].[FactOrganizationCounts] (
			[SchoolYearId]
			, [FactTypeId]
			, [SeaId]
			, [LeaId]
			, [K12StaffId]
			, [K12SchoolId]
			, [TitleIStatusId]
			, [TitleIParentalInvolveRes]
			, [TitleIPartAAllocations]
			, [AuthorizingBodyCharterSchoolAuthorizerId]
			, [SecondaryAuthorizingBodyCharterSchoolAuthorizerId]
			, [CharterSchoolManagementOrganizationId]
			, [CharterSchoolUpdatedManagementOrganizationId]
			, [ReasonApplicabilityId]
			, [SchoolImprovementFunds]
			, [K12OrganizationStatusId]
			, [K12SchoolStatusId]
			, [K12SchoolStateStatusId]
			, [FederalProgramsFundingAllocationType]
			, [FederalProgramCode]
			, [FederalProgramsFundingAllocation]
			, [ComprehensiveAndTargetedSupportId]
			, [CharterSchoolStatusId]
			, [SubgroupId]
			, [OrganizationCount]
		)
		SELECT DISTINCT 
			@SchoolYearId												AS SchoolYearId
			, @factTypeId												AS FactTypeId
			, -1														AS SeaId
			, -1														AS LeaId
			, -1														AS K12StaffId
			, rk12s.DimK12SchoolId										AS K12SchoolId
			, ISNULL(t.DimTitleIStatusId,-1)							AS TitleIStatusId
			, -1														AS TitleIParentalInvolveRes
			, -1														AS TitleIPartAAllocations
			, isnull(CSAP.MinId,-1)										AS AuthorizingBodyCharterSchoolAuthorizerId
			, isnull(CSAS.MinId,-1)										AS SecondaryAuthorizingBodyCharterSchoolAuthorizerId
			, -1														AS CharterSchoolManagementOrganizationId
			, -1														AS CharterSchoolUpdatedManagementOrganizationId
			, -1														AS ReasonApplicabilityId
			, NULL														AS SchoolImprovementFunds
			, ISNULL(organizationStatus.DimK12OrganizationStatusId,-1)	AS K12OrganizationStatusId
			, ISNULL(s.DimK12SchoolstatusId,-1)							AS K12SchoolStatusId
			, -1														AS K12SchoolstateStatusId
			, -1														AS FederalProgramsFundingAllocationType
			, -1														AS FederalProgramCode
			, -1 														AS FederalProgramsFundingAllocation
			, -1														AS ComprehensiveAndTargetedSupportId
			, -1														AS CharterSchoolStatusId
			, -1														AS SubgroupId
			, 1															AS OrganizationCount

		FROM Staging.K12Organization sk12o
		JOIN #DistinctSchools dschools
			on sk12o.SchoolIdentifierSea = dschools.SchoolIdentifierSea
			and sk12o.School_RecordStartDateTime = dschools.RecordStartDateTime

		JOIN RDS.DimK12Schools rk12s 
			ON sk12o.SchoolIdentifierSea = rk12s.SchoolIdentifierSea
			and dschools.DimK12SchoolID = rk12s.DimK12SchoolId
			and rk12s.DimK12SchoolId <> -1 and ReportedFederally = 1
			AND (
				(rk12s.RecordStartDateTime < staging.GetFiscalYearStartDate(@SchoolYear) and rk12s.RecordEndDateTime IS NULL)
				OR 
				(rk12s.RecordStartDateTime >= staging.GetFiscalYearStartDate(@SchoolYear) and rk12s.RecordStartDateTime <= staging.GetFiscalYearEndDate(@SchoolYear))
			)

		LEFT JOIN rds.vwDimK12Schoolstatuses s
			ON isnull(s.MagnetOrSpecialProgramEmphasisSchoolMap, s.MagnetOrSpecialProgramEmphasisSchoolCode) = isnull(sk12o.School_MagnetOrSpecialProgramEmphasisSchool, 'MISSING')
			AND isnull(s.NslpStatusMap, s.NslpStatusCode) = isnull(sk12o.School_NationalSchoolLunchProgramStatus, 'MISSING')
			AND isnull(s.SharedTimeIndicatorMap, s.SharedTimeIndicatorCode) = isnull(sk12o.School_SharedTimeIndicator, 'MISSING')
			AND isnull(s.VirtualSchoolStatusMap, s.VirtualSchoolStatusCode) = isnull(sk12o.School_VirtualSchoolStatus, 'MISSING')
			AND s.SchoolImprovementStatusCode = 'MISSING' 
			AND isnull(s.PersistentlyDangerousStatusMap, s.PersistentlyDangerousStatusCode) = isnull(sk12o.School_SchoolDangerousStatus, 'MISSING')
			AND isnull(s.StatePovertyDesignationMap, s.StatePovertyDesignationCode) = isnull(sk12o.School_StatePovertyDesignation, 'MISSING')
			AND isnull(s.ProgressAchievingEnglishLanguageProficiencyIndicatorTypeMap, s.ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode) = isnull(sk12o.School_ProgressAchievingEnglishLanguageProficiencyIndicatorType, 'MISSING')
		LEFT JOIN rds.DimTitleIStatuses t 
			ON t.TitleIInstructionalServicesCode = NULL
			AND t.TitleIProgramTypeCode = NULL 
			AND t.TitleISchoolStatusCode = NULL 
			AND t.TitleISupportServicesCode = NULL 
		LEFT JOIN rds.vwDimK12OrganizationStatuses organizationStatus 
			ON organizationStatus.SchoolYear = sk12o.SchoolYear
			AND isnull(sk12o.School_GunFreeSchoolsActReportingStatus, 'MISSING') = isnull(organizationStatus.GunFreeSchoolsActReportingStatusMap, organizationStatus.GunFreeSchoolsActReportingStatusCode)
			AND organizationStatus.HighSchoolGraduationRateIndicatorStatusCode = 'MISSING' 
			AND organizationStatus.REAPAlternativeFundingStatusCode = 'MISSING' 
			AND organizationStatus.McKinneyVentoSubgrantRecipientCode = 'MISSING' 
		LEFT JOIN #DimCharterSchoolAuthorizers_Primary CSAP
			ON CSAP.SchoolIdentifierSea = sk12o.SchoolIdentifierSea
		LEFT JOIN #DimCharterSchoolAuthorizers_Secondary CSAS
			ON CSAS.SchoolIdentifierSea = sk12o.SchoolIdentifierSea

	END TRY
	BEGIN CATCH
		INSERT INTO app.DataMigrationHistories(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) 
		VALUES	(getutcdate(), 2, 'RDS.FactOrganizationCounts - Error Occurred - ' + CAST(ERROR_MESSAGE() AS VARCHAR(900)))
	END CATCH

END

GO

