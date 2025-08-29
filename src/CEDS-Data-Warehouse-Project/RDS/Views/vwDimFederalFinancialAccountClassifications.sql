CREATE VIEW RDS.vwDimFederalFinancialAccountClassifications
AS
SELECT
      [DimFederalFinancialAccountClassificationId]
    , [FinancialAccountCategoryCode]
    , sssrd1.InputCode AS [FinancialAccountCategoryCodeMap]
    , [FinancialAccountProgramCodeCode]
    , sssrd2.InputCode AS [FinancialAccountProgramCodeCodeMap]
    , [FinancialAccountFundClassificationCode]
    , sssrd3.InputCode AS [FinancialAccountFundClassificationCodeMap]
FROM RDS.DimFederalFinancialAccountClassifications rdsffc
CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
LEFT JOIN Staging.SourceSystemReferenceData sssrd1
    ON rdsffc.FinancialAccountCategoryCode = sssrd1.OutputCode
    AND sssrd1.TableName = 'RefFinancialAccountCategory'
    AND rsy.SchoolYear = sssrd1.SchoolYear
LEFT JOIN Staging.SourceSystemReferenceData sssrd2
    ON rdsffc.FinancialAccountProgramCodeCode = sssrd2.OutputCode
    AND sssrd2.TableName = 'RefFinancialAccountProgramCode'
    AND rsy.SchoolYear = sssrd2.SchoolYear
LEFT JOIN Staging.SourceSystemReferenceData sssrd3
    ON rdsffc.FinancialAccountFundClassificationCode = sssrd3.OutputCode
    AND sssrd3.TableName = 'RefFinancialAccountFundClassification'
    AND rsy.SchoolYear = sssrd3.SchoolYear
