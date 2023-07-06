CREATE VIEW RDS.vwDimComprehensiveAndTargetedSupports
AS
	SELECT
		cts.DimComprehensiveAndTargetedSupportId,
		sy.SchoolYear,
		cts.ComprehensiveSupportIdentificationTypeCode,
		[ComprehensiveSupportIdentificationTypeMap] = ISNULL(ssrd1.InputCode,'MISSING'),
		cts.AdditionalTargetedSupportAndImprovementStatusCode,
		[AdditionalTargetedSupportAndImprovementStatusMap] = ISNULL(ssrd2.InputCode,'MISSING'),
		cts.ComprehensiveSupportAndImprovementStatusCode,
		[ComprehensiveSupportAndImprovementStatusMap] = ISNULL(ssrd3.InputCode,'MISSING'),
		cts.TargetedSupportAndImprovementStatusCode,
		[TargetedSupportAndImprovementStatusMap] = ISNULL(ssrd4.InputCode,'MISSING')
	FROM RDS.DimComprehensiveAndTargetedSupports cts
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) sy
	LEFT JOIN Staging.SourceSystemReferenceData ssrd1
		ON cts.ComprehensiveSupportCode = ssrd1.OutputCode
		AND ssrd1.TableName = 'RefComprehensiveSupport'
		AND sy.SchoolYear = ssrd1.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData ssrd2
		ON cts.AdditionalTargetedSupportandImprovementCode = ssrd2.OutputCode
		AND ssrd2.TableName = 'RefAdditionalTargetedSupportandImprovement'
		AND sy.SchoolYear = ssrd2.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData ssrd3
		ON cts.ComprehensiveAndTargetedSupportCode = ssrd3.OutputCode
		AND ssrd3.TableName = 'RefComprehensiveAndTargetedSupport'
		AND sy.SchoolYear = ssrd3.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData ssrd4
		ON cts.ComprehensiveSupportImprovementCode = ssrd4.OutputCode
		AND ssrd4.TableName = 'RefComprehensiveSupportImprovement'
		AND sy.SchoolYear = ssrd4.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData ssrd5
		ON cts.TargetedSupportCode = ssrd5.OutputCode
		AND ssrd5.TableName = 'RefTargetedSupport'
		AND sy.SchoolYear = ssrd5.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData ssrd6
		ON cts.TargetedSupportImprovementCode = ssrd6.OutputCode
		AND ssrd6.TableName = 'RefTargetedSupportImprovement'
		AND sy.SchoolYear = ssrd6.SchoolYear

GO

