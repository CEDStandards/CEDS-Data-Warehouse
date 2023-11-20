CREATE PROCEDURE [dbo].[CopyDataFromStagingToFactTable]
AS
BEGIN

    -- Insert data from staging.K12FinancialAccountBalance into RDS.FactK12FinancialAccountBalances
    INSERT INTO RDS.FactK12FinancialAccountBalances (
        SeaId,
        IeuId,
        LeaId,
        K12SchoolId,
        FinancialAccountingDateId,
        FiscalYearId,
        FederalFinancialAccountBalanceId,
        SeaFinancialAccountBalanceId,
        LeaFinancialAccountBalanceId,
        FederalFinancialAccountClassificationId,
        SeaFinancialAccountClassificationId,
        LeaFinancialAccountClassificationId,
        FederalFinancialAccountId,
        SeaFinancialAccountId,
        LeaFinancialAccountId,
        FederalProgramCodeId,
        FinancialAccountingValue
    )
    SELECT
        rds.DimSeaId,
        rdl.DimLeaId,
        rdksch.DimK12SchoolId,
        rdd.DimDateId,
        rdfy.DimFiscalYearId,
        dffb.DimFederalFinancialAccountBalanceId,
        dslb.DimSeaFinancialAccountBalanceId,
        dllb.DimLeaFinancialAccountBalanceId,
        dffc.DimFederalFinancialAccountClassificationId,
        dsfc.DimSeaFinancialAccountClassificationId,
        dlfc.DimLeaFinancialAccountClassificationId,
        dfa.DimFederalAccountId,
        dsa.DimSeaAccountId,
        dla.DimLeaAccountId,
        dfpc.DimFederalProgramCodeId,
        skfab.FinancialAccountingValue
    FROM Staging.K12FinancialAccountBalance skfab
    LEFT JOIN RDS.DimLeas rdl
        ON ssa.LeaIdentifierSea = rdl.LeaIdentifierSea
        AND skfab.FiscalAccountingDate BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.DimK12Schools rdksch
        ON ssa.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
        AND skfab.FiscalAccountingDate BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.DimSeas rds
        ON skfab.FiscalAccountingDate BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.DimDates rdd
        ON skfab.FiscalAccountingDate = rdd.DateValue
    LEFT JOIN RDS.DimFiscalYears rdfy
        ON skfab.FiscalYear = rdfy.FiscalYear
    LEFT JOIN RDS.vwDimFederalFinancialAccountBalances dffb 
        ON skfab.Federal_FinancialAccountBalanceSheetCodeCode = dffb.FinancialAccountBalanceSheetCodeMap
    LEFT JOIN RDS.DimSeaFinancialAccountBalances dslb 
        ON skfab.Sea_FinancialAccountLocalBalanceSheetCodeCode = dslb.FinancialAccountLocalBalanceSheetCodeCode
    LEFT JOIN RDS.DimLeaFinancialAccountBalances dllb 
        ON skfab.Lea_FinancialAccountLocalBalanceSheetCodeCode = dllb.FinancialAccountLocalBalanceSheetCodeCode
    LEFT JOIN RDS.vwDimFederalFinancialAccountClassifications dffc
        ON  skfab.Federal_FinancialAccountCategoryCode = dffc.FinancialAccountCategoryCodeMap
        AND skfab.Federal_FinancialAccountProgramCode = dffc.FinancialAccountProgramCodeCodeMap
        AND skfab.Federal_FinancialAccountFundClassificationCode = dffc.FinancialAccountFundClassificationCodeMap
    LEFT JOIN RDS.DimSeaFinancialAccountClassifications dsfc 
        ON skfab.Sea_FinancialAccountCategoryCode = dsfc.FinancialAccountCategoryCode
    LEFT JOIN RDS.DimLeaFinancialAccountClassifications dlfc 
        ON skfab.Lea_FinancialAccountCategoryCode = dlfc.FinancialAccountCategoryCode
    LEFT JOIN RDS.DimFederalAccounts dfa 
        ON skfab.Federal_FinancialAccountNumber = dfa.FinancialAccountNumber
    LEFT JOIN RDS.DimSeaAccounts dsa 
        ON skfab.Sea_FinancialAccountNumber = dsa.FinancialAccountNumber
    LEFT JOIN RDS.DimLeaAccounts dla 
        ON skfab.Lea_FinancialAccountNumber = dla.FinancialAccountNumber
    LEFT JOIN RDS.DimFederalProgramCodes dfpc 
        ON skfab.FederalProgramCode = dfpc.FederalProgramCode;
END
