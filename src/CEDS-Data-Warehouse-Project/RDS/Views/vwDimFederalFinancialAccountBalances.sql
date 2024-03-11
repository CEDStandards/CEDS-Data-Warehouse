CREATE VIEW RDS.vwDimFederalFinancialAccountBalances
AS
	SELECT
		  [DimFederalFinancialAccountBalanceId]
		, [FinancialAccountBalanceSheetCodeCode]
		, sssrd1.InputCode AS [FinancialAccountBalanceSheetCodeMap]
	FROM RDS.DimFederalFinancialAccountBalances rdsffb
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd1
		ON rdsffb.FinancialAccountBalanceSheetCodeCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefFinancialAccountBalanceSheetCode'
        AND rsy.SchoolYear = sssrd1.SchoolYear
