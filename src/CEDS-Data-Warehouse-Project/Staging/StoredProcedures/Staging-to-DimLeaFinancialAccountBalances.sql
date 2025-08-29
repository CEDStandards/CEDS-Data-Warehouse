CREATE PROCEDURE Staging.[Staging-to-DimLeaFinancialAccountBalances]
AS
BEGIN
    -- Insert new records into DimLeaFinancialAccountBalances
    INSERT INTO RDS.DimLeaFinancialAccountBalances 
        (  
            FinancialAccountCodingSystemOrganizationTypeCode
          , FinancialAccountCodingSystemOrganizationTypeDescription
          , FinancialAccountLocalBalanceSheetCodeCode
          , FinancialAccountLocalBalanceSheetCodeDescription
        )
    SELECT DISTINCT 
            'LEA'
          , 'Local Education Agency'
          , Lea_FinancialAccountLocalBalanceSheetCodeCode
          , ISNULL(Lea_FinancialAccountLocalBalanceSheetCodeDescription, 'MISSING')
    FROM Staging.K12FinancialAccountBalance sfkfab
    LEFT JOIN RDS.DimLeaFinancialAccountBalances rdlfab
        ON sfkfab.Lea_FinancialAccountLocalBalanceSheetCodeCode = rdlfab.FinancialAccountLocalBalanceSheetCodeCode
    WHERE rdlfab.DimLeaFinancialAccountBalanceId IS NULL
END
