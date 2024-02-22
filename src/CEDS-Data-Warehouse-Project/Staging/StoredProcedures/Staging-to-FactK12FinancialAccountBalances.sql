CREATE PROCEDURE [Staging].[Staging-to-FactK12FinancialAccountBalances]
AS
BEGIN

    -- Insert data from staging.K12FinancialAccountBalance into RDS.FactK12FinancialAccountBalances
    INSERT INTO RDS.FactK12FinancialAccountBalances (
          SeaId
        , IeuId
        , LeaId
        , K12SchoolId
        , FinancialAccountingDateId
        , FiscalYearId
        , FederalFinancialAccountBalanceId
        , SeaFinancialAccountBalanceId
        , LeaFinancialAccountBalanceId
        , FederalFinancialAccountClassificationId
        , SeaFinancialAccountClassificationId
        , LeaFinancialAccountClassificationId
        , FederalFinancialAccountId
        , SeaFinancialAccountId
        , LeaFinancialAccountId
        , FederalProgramCodeId
        , FinancialAccountingValue
    )
    SELECT
          ISNULL(rds.DimSeaId, -1)
		, ISNULL(rdi.DimIeuId, -1)
        , ISNULL(rdl.DimLeaId, -1)
        , ISNULL(rdksch.DimK12SchoolId, -1)
        , ISNULL(rdd.DimDateId, -1)
        , ISNULL(rdfy.DimFiscalYearId, -1)
        , ISNULL(dffab.DimFederalFinancialAccountBalanceId, -1)
        , ISNULL(dslb.DimSeaFinancialAccountBalanceId, -1)
        , ISNULL(dllb.DimLeaFinancialAccountBalanceId, -1)
        , ISNULL(dffac.DimFederalFinancialAccountClassificationId, -1)
        , ISNULL(dsfc.DimSeaFinancialAccountClassificationId, -1)
        , ISNULL(dlfc.DimLeaFinancialAccountClassificationId, -1)
        , ISNULL(dfa.DimFinancialAccountId, -1)
        , ISNULL(dsa.DimFinancialAccountId, -1)
        , ISNULL(dla.DimFinancialAccountId, -1)
        , ISNULL(dfpc.DimFederalProgramCodeId, -1)
        , skfab.FinancialAccountingValue
    FROM Staging.K12FinancialAccountBalance skfab
    LEFT JOIN RDS.DimLeas rdl
        ON  ISNULL(skfab.LeaIdentifierSea, 'MISSING') = rdl.LeaIdentifierSea
        AND ISNULL(skfab.FiscalAccountingDate, '1/1/1900') BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.DimIeus rdi
        ON  ISNULL(skfab.IeuOrganizationIdentifierSea, 'MISSING') = rdi.IeuOrganizationIdentifierSea
        AND ISNULL(skfab.FiscalAccountingDate, '1/1/1900') BETWEEN rdi.RecordStartDateTime AND ISNULL(rdi.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.DimK12Schools rdksch
        ON  ISNULL(skfab.SchoolIdentifierSea, 'MISSING') = rdksch.SchoolIdentifierSea
        AND ISNULL(skfab.FiscalAccountingDate, '1/1/1900') BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.DimSeas rds
        ON ISNULL(skfab.FiscalAccountingDate, '1/1/1900') BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.DimDates rdd
        ON ISNULL(skfab.FiscalAccountingDate, '1/1/1900') = rdd.DateValue
    LEFT JOIN RDS.DimFiscalYears rdfy
        ON ISNULL(skfab.FiscalYear, -1) = rdfy.FiscalYear
		AND ISNULL(skfab.FiscalPeriodBeginDate, '1/1/1900') = rdfy.FiscalPeriodBeginDate
		AND ISNULL(skfab.FiscalPeriodEndDate, '1/1/1900') = rdfy.FiscalPeriodEndDate
    LEFT JOIN RDS.DimLeaFinancialAccountBalances dllb 
        ON ISNULL(skfab.Lea_FinancialAccountLocalBalanceSheetCodeCode, 'MISSING') = dllb.FinancialAccountLocalBalanceSheetCodeCode
    LEFT JOIN RDS.DimSeaFinancialAccountBalances dslb 
        ON ISNULL(ISNULL(skfab.Sea_FinancialAccountLocalBalanceSheetCodeCode, dllb.FinancialAccountLocalBalanceSheetCodeSeaCode), 'MISSING') = dslb.FinancialAccountLocalBalanceSheetCodeCode
    LEFT JOIN RDS.vwDimFederalFinancialAccountBalances dffab 
        ON ISNULL(ISNULL(skfab.Federal_FinancialAccountBalanceSheetCodeCode, dslb.FinancialAccountLocalBalanceSheetCodeFederalCode), 'MISSING') = dffab.FinancialAccountBalanceSheetCodeMap
    LEFT JOIN RDS.DimLeaFinancialAccountClassifications dlfc 
        ON  ISNULL(skfab.Lea_FinancialAccountCategoryCode, 'MISSING') = dlfc.FinancialAccountCategoryCode
        AND ISNULL(skfab.Lea_FinancialAccountLocalProgramCodeCode, 'MISSING') = dlfc.FinancialAccountLocalProgramCodeCode
        AND ISNULL(skfab.Lea_FinancialAccountLocalFundClassificationCode, 'MISSING') = dlfc.FinancialAccountLocalFundClassificationCode
    LEFT JOIN RDS.DimSeaFinancialAccountClassifications dsfc 
        ON  ISNULL(ISNULL(skfab.Sea_FinancialAccountCategoryCode, dlfc.FinancialAccountCategorySeaCode),  'MISSING') = dsfc.FinancialAccountCategoryCode
        AND ISNULL(ISNULL(skfab.Sea_FinancialAccountLocalProgramCodeCode, dlfc.FinancialAccountLocalProgramCodeSeaCode),  'MISSING') = dsfc.FinancialAccountLocalProgramCodeCode
        AND ISNULL(ISNULL(skfab.Sea_FinancialAccountLocalFundClassificationCode, dlfc.FinancialAccountLocalFundClassificationSeaCode),  'MISSING') = dsfc.FinancialAccountLocalFundClassificationCode
    LEFT JOIN RDS.vwDimFederalFinancialAccountClassifications dffac
        ON  ISNULL(ISNULL(skfab.Federal_FinancialAccountCategoryCode, dsfc.FinancialAccountCategoryFederalCode), 'MISSING') = dffac.FinancialAccountCategoryCodeMap
        AND ISNULL(ISNULL(skfab.Federal_FinancialAccountProgramCodeCode, dsfc.FinancialAccountLocalProgramCodeFederalCode), 'MISSING') = dffac.FinancialAccountProgramCodeCodeMap
        AND ISNULL(ISNULL(skfab.Federal_FinancialAccountFundClassificationCode, dsfc.FinancialAccountLocalFundClassificationFederalCode), 'MISSING') = dffac.FinancialAccountFundClassificationCodeMap
    LEFT JOIN RDS.DimFinancialAccounts dfa 
        ON  ISNULL(skfab.Federal_FinancialAccountNumber, 'MISSING') = dfa.FinancialAccountNumber
        AND ISNULL(skfab.Federal_FinancialAccountName, 'MISSING') = dfa.FinancialAccountName
        AND ISNULL(skfab.Federal_FinancialAccountDescription, 'MISSING') = dfa.FinancialAccountDescription
    LEFT JOIN RDS.DimFinancialAccounts dsa 
        ON  ISNULL(skfab.Sea_FinancialAccountNumber, 'MISSING') = dsa.FinancialAccountNumber
        AND ISNULL(skfab.Sea_FinancialAccountName, 'MISSING') = dsa.FinancialAccountName
        AND ISNULL(skfab.Sea_FinancialAccountDescription, 'MISSING') = dsa.FinancialAccountDescription
    LEFT JOIN RDS.DimFinancialAccounts dla 
        ON  ISNULL(skfab.Lea_FinancialAccountNumber, 'MISSING') = dla.FinancialAccountNumber
        AND ISNULL(skfab.Lea_FinancialAccountName, 'MISSING') = dla.FinancialAccountName
        AND ISNULL(skfab.Lea_FinancialAccountDescription, 'MISSING') = dla.FinancialAccountDescription
    LEFT JOIN RDS.DimFederalProgramCodes dfpc 
        ON  ISNULL(skfab.FederalProgramCode, 'MISSING') = dfpc.FederalProgramCode
        AND ISNULL(skfab.FederalProgramSubgrantCode, 'MISSING') = dfpc.FederalProgramSubgrantCode;
END