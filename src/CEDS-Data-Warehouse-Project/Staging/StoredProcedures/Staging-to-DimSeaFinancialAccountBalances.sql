CREATE PROCEDURE Staging.[Staging-to-DimSeaFinancialAccountBalances]
AS
BEGIN
    -- Insert new records into DimSeaFinancialAccountBalances
    INSERT INTO RDS.DimSeaFinancialAccountBalances 
        (  
            FinancialAccountCodingSystemOrganizationTypeCode
          , FinancialAccountCodingSystemOrganizationTypeDescription
          , FinancialAccountLocalBalanceSheetCodeCode
          , FinancialAccountLocalBalanceSheetCodeDescription
        )
    SELECT DISTINCT 
            'SEA'
          , 'State Education Agency'
          , Sea_FinancialAccountLocalBalanceSheetCodeCode
          , ISNULL(Sea_FinancialAccountLocalBalanceSheetCodeDescription, 'MISSING')
    FROM Staging.K12FinancialAccountBalance sfkfab
    LEFT JOIN RDS.DimSeaFinancialAccountBalances rdlfab
        ON sfkfab.Sea_FinancialAccountLocalBalanceSheetCodeCode = rdlfab.FinancialAccountLocalBalanceSheetCodeCode
    WHERE rdlfab.DimSeaFinancialAccountBalanceId IS NULL
END
