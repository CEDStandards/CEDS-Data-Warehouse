/**********************************************************************
Author: AEM Corp
Date:	5/5/2022
Description: Migrates Comprehensive and Targeted Support  from Staging to RDS.FactOrganizationCounts

************************************************************************/
CREATE PROCEDURE [Staging].[Staging-to-FactOrganizationCounts_ComprehensiveAndTargetedSupport]
	@SchoolYear SMALLINT
AS
BEGIN
	 --SET NOCOUNT ON added to prevent extra result sets from
	 --interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
	
		DECLARE 
		@FactTypeId INT,
		@SchoolYearId int

		SELECT @SchoolYearId = DimSchoolYearId 
		FROM RDS.DimSchoolYears
		WHERE SchoolYear = @SchoolYear

		CREATE TABLE #schoolOrganizationTypes (
			K12SchoolOrganizationType				VARCHAR(20)
		)

		INSERT INTO #schoolOrganizationTypes
		SELECT 
			InputCode
		FROM Staging.SourceSystemReferenceData 
		WHERE TableName = 'RefOrganizationType' 
			AND TableFilter = '001156' 
			AND OutputCode = 'K12School'
			AND SchoolYear = @SchoolYear

		SELECT *
		INTO #vwDimComprehensiveAndTargetedSupports
		FROM RDS.vwDimComprehensiveAndTargetedSupports
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwDimComprehensiveAndTargetedSupports ON #vwDimComprehensiveAndTargetedSupports (ComprehensiveSupportMap);

		SELECT *
		INTO #vwDimSubgroups
		FROM RDS.vwDimSubgroups
		WHERE SchoolYear = @SchoolYear

		SELECT @FactTypeId = DimFactTypeId 
		FROM rds.DimFactTypes
		WHERE FactTypeCode = 'compsupport'

		DELETE RDS.FactOrganizationCounts
		WHERE SchoolYearId = @SchoolYearId
			AND FactTypeId = @FactTypeId
		
		/*Comprehensive support reasons*/
		INSERT INTO RDS.FactOrganizationCounts (
			SchoolYearId
			,FactTypeId
			,LeaId
			,K12StaffId
			,K12SchoolId
			,K12SchoolStatusId
			,SeaId
			,TitleIStatusId
			,OrganizationCount
			,TitleIParentalInvolveRes
			,TitleIPartAAllocations
			,AuthorizingBodyCharterSchoolAuthorizerId
			,CharterSchoolManagementOrganizationId
			,SecondaryAuthorizingBodyCharterSchoolAuthorizerId
			,CharterSchoolUpdatedManagementOrganizationId
			,SchoolImprovementFunds
			,K12OrganizationStatusId
			,K12SchoolStateStatusId
			,FederalProgramsFundingAllocationType
			,FederalProgramCode
			,FederalProgramsFundingAllocation
			,ComprehensiveAndTargetedSupportId
			,CharterSchoolStatusId
			,SubgroupId
		)
		SELECT 
			[SchoolYearId] = rsy.DimSchoolYearId
			,[FactTypeId] = @FactTypeId
			,[LeaId] = -1
			,[K12StaffId] = -1
			,[K12SchoolId] = ISNULL(rdksch.DimK12SchoolId,-1)
			,[K12SchoolStatusId] = -1
			,[SeaId] = -1
			,[TitleIStatusId] = -1
			,[OrganizationCount] = 1
			,[TitleIParentalInvolveRes] = -1
			,[TitleIPartAAllocations] = -1
			,[AuthorizingBodyCharterSchoolAuthorizerId] = -1
			,[CharterSchoolManagementOrganizationId] = -1
			,[SecondaryAuthorizingBodyCharterSchoolAuthorizerId] = -1
			,[CharterSchoolUpdatedManagementOrganizationId] = -1
			,[SchoolImprovementFunds] = -1
			,[K12OrganizationStatusId] = -1
			,[K12SchoolStateStatusId] = -1
			,[FederalProgramsFundingAllocationType] = -1
			,[FederalProgramCode] = -1
			,[FederalProgramsFundingAllocation] = -1
			,[ComprehensiveAndTargetedSupportId] = ISNULL(vcts.DimComprehensiveAndTargetedSupportId,-1)
			,[CharterSchoolStatusId] = -1
			,[SubgroupId] = -1
		FROM Staging.K12Organization sko
		INNER JOIN RDS.DimSchoolYears rsy
			ON sko.SchoolYear = rsy.SchoolYear
		LEFT JOIN RDS.DimK12Schools rdksch
			ON sko.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
		INNER JOIN Staging.K12SchoolComprehensiveSupportIdentificationType scsupp
			ON sko.SchoolIdentifierSea = scsupp.SchoolIdentifierSea
		INNER JOIN #vwDimComprehensiveAndTargetedSupports vcts
			ON sko.SchoolYear = vcts.SchoolYear
				AND scsupp.ComprehensiveSupport = vcts.ComprehensiveSupportMap
				AND vcts.AdditionalTargetedSupportandImprovementCode = 'MISSING'
				AND vcts.ComprehensiveAndTargetedSupportCode = 'MISSING'
				AND vcts.ComprehensiveSupportImprovementCode = 'MISSING'
				AND vcts.TargetedSupportCode = 'MISSING'
				AND vcts.TargetedSupportImprovementCode = 'MISSING'

		/*Targeted support subgroups*/
		INSERT INTO RDS.FactOrganizationCounts (
			SchoolYearId
			,FactTypeId
			,LeaId
			,K12StaffId
			,K12SchoolId
			,K12SchoolStatusId
			,SeaId
			,TitleIStatusId
			,OrganizationCount
			,TitleIParentalInvolveRes
			,TitleIPartAAllocations
			,AuthorizingBodyCharterSchoolAuthorizerId
			,CharterSchoolManagementOrganizationId
			,SecondaryAuthorizingBodyCharterSchoolAuthorizerId
			,CharterSchoolUpdatedManagementOrganizationId
			,SchoolImprovementFunds
			,K12OrganizationStatusId
			,K12SchoolStateStatusId
			,FederalProgramsFundingAllocationType
			,FederalProgramCode
			,FederalProgramsFundingAllocation
			,ComprehensiveAndTargetedSupportId
			,CharterSchoolStatusId
			,SubgroupId
		)
		SELECT 
			[SchoolYearId] = rsy.DimSchoolYearId
			,[FactTypeId] = @FactTypeId
			,[LeaId] = -1
			,[K12StaffId] = -1
			,[K12SchoolId] = ISNULL(rdksch.DimK12SchoolId,-1)
			,[K12SchoolStatusId] = -1
			,[SeaId] = -1
			,[TitleIStatusId] = -1
			,[OrganizationCount] = 1
			,[TitleIParentalInvolveRes] = -1
			,[TitleIPartAAllocations] = -1
			,[AuthorizingBodyCharterSchoolAuthorizerId] = -1
			,[CharterSchoolManagementOrganizationId] = -1
			,[SecondaryAuthorizingBodyCharterSchoolAuthorizerId] = -1
			,[CharterSchoolUpdatedManagementOrganizationId] = -1
			,[SchoolImprovementFunds] = -1
			,[K12OrganizationStatusId] = -1
			,[K12SchoolStateStatusId] = -1
			,[FederalProgramsFundingAllocationType] = -1
			,[FederalProgramCode] = -1
			,[FederalProgramsFundingAllocation] = -1
			,[ComprehensiveAndTargetedSupportId] = -1
			,[CharterSchoolStatusId] = -1
			,[SubgroupId] = ISNULL(vs.DimSubgroupId,-1)
		FROM Staging.K12Organization sko
		INNER JOIN RDS.DimSchoolYears rsy
			ON sko.SchoolYear = rsy.SchoolYear
		LEFT JOIN RDS.DimK12Schools rdksch
			ON sko.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
		INNER JOIN Staging.K12SchoolTargetedSupportIdentificationType sktsup
			ON sko.SchoolIdentifierSea = sktsup.SchoolIdentifierSea
		INNER JOIN #vwDimSubgroups vs
			ON sko.SchoolYear = vs.SchoolYear
			AND sktsup.Subgroup = vs.SubgroupMap
			
	END TRY
	BEGIN CATCH
		INSERT INTO Staging.ValidationErrors VALUES ('Staging.Staging-to-FactOrganizationCounts_ComprehensiveAndTargetedSupport', 'RDS.FactOrganizationCounts', 'FactOrganziationCounts', 'FactOrganziationCounts', ERROR_MESSAGE(), 1, NULL, GETDATE())
	END CATCH

		
END

GO

