CREATE VIEW RDS.vwDimFederalFinancialRevenueClassifications
AS
	SELECT
		  [DimFederalFinancialRevenueClassificationId]
		, [FinancialAccountRevenueCodeCode]
		, sssrd1.InputCode AS [FinancialAccountRevenueCodeMap]
	FROM RDS.DimFederalFinancialRevenueClassifications rffrc
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd1
		ON rffrc.FinancialAccountRevenueCodeCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefFinancialAccountRevenueCode'
		AND rsy.SchoolYear = sssrd1.SchoolYear
