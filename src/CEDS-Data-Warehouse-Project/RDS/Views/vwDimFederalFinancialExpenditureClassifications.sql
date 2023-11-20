CREATE VIEW rds.vwDimFederalFinancialExpenditureClassifications
AS
	SELECT
		  [DimFederalFinancialExpenditureClassificationId]
		, rsy.SchoolYear
		, FinancialExpenditureFunctionCodeCode
		, sssrd1.InputCode AS FinancialExpenditureFunctionCodeMap
		, FinancialExpenditureObjectCodeCode
		, sssrd2.InputCode AS FinancialExpenditureObjectCodeMap
		, FinancialExpenditureLevelOfInstructionCodeCode
		, sssrd3.InputCode AS FinancialExpenditureLevelOfInstructionCodeMap
	FROM rds.DimFederalFinancialExpenditureClassifications rdfec
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdfec.FinancialExpenditureFunctionCodeCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefFinancialExpenditureFunctionCode'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdfec.FinancialExpenditureObjectCodeCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefFinancialExpenditureObjectCode'
		AND rsy.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
		ON rdfec.FinancialExpenditureLevelOfInstructionCodeCode = sssrd3.OutputCode
		AND sssrd3.TableName = 'RefFinancialExpenditureLevelOfInstructionCode'
		AND rsy.SchoolYear = sssrd3.SchoolYear
