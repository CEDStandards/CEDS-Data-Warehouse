CREATE PROCEDURE [Staging].[Staging-to-FactK12FinancialAccountGeneralLedgers]
AS
BEGIN

    -- Insert data from staging.K12FinancialAccountGeneralLedger into RDS.FactK12FinancialAccountGeneralLedgers
    INSERT INTO RDS.FactK12FinancialAccountGeneralLedgers (
          SeaId
        , IeuId
        , LeaId
        , K12SchoolId
        , FinancialAccountingDateId
        , FiscalYearId
        , FederalFinancialAccountId
        , SeaFinancialAccountId
        , LeaFinancialAccountId
        , FederalFinancialAccountClassificationId
        , SeaFinancialAccountClassificationId
        , LeaFinancialAccountClassificationId
        , FederalFinancialExpenditureClassificationId
        , SeaFinancialExpenditureClassificationId
        , LeaFinancialExpenditureClassificationId
        , FederalFinancialRevenueClassificationId
        , SeaFinancialRevenueClassificationId
        , LeaFinancialRevenueClassificationId
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
        , ISNULL(dfa.DimFinancialAccountId, -1)
        , ISNULL(dsa.DimFinancialAccountId, -1)
        , ISNULL(dla.DimFinancialAccountId, -1)
        , ISNULL(dffac.DimFederalFinancialAccountClassificationId, -1)
        , ISNULL(dsfc.DimSeaFinancialAccountClassificationId, -1)
        , ISNULL(dlfc.DimLeaFinancialAccountClassificationId, -1)
        , ISNULL(rvdffec.DimFederalFinancialExpenditureClassificationId, -1)
        , ISNULL(rvdsfec.DimSeaFinancialExpenditureClassificationId, -1)
        , ISNULL(rvdlfec.DimLeaFinancialExpenditureClassificationId, -1)
        , ISNULL(rvdffrc.DimFederalFinancialRevenueClassificationId, -1)
        , ISNULL(rvdsfrc.DimSeaFinancialRevenueClassificationId, -1)
        , ISNULL(rvdlfrc.DimLeaFinancialRevenueClassificationId, -1)
        , ISNULL(dfpc.DimFederalProgramCodeId, -1)
        , skfagl.FinancialAccountingValue
    FROM Staging.K12FinancialAccountGeneralLedger skfagl
    LEFT JOIN RDS.DimLeas rdl
        ON  ISNULL(skfagl.LeaIdentifierSea, 'MISSING') = rdl.LeaIdentifierSea
        AND ISNULL(skfagl.FiscalAccountingDate, '1/1/1900') BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.DimIeus rdi
        ON  ISNULL(skfagl.IeuOrganizationIdentifierSea, 'MISSING') = rdi.IeuOrganizationIdentifierSea
        AND ISNULL(skfagl.FiscalAccountingDate, '1/1/1900') BETWEEN rdi.RecordStartDateTime AND ISNULL(rdi.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.DimK12Schools rdksch
        ON  ISNULL(skfagl.SchoolIdentifierSea, 'MISSING') = rdksch.SchoolIdentifierSea
        AND ISNULL(skfagl.FiscalAccountingDate, '1/1/1900') BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.DimSeas rds
        ON ISNULL(skfagl.FiscalAccountingDate, '1/1/1900') BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.DimDates rdd
        ON ISNULL(skfagl.FiscalAccountingDate, '1/1/1900') = rdd.DateValue
    LEFT JOIN RDS.DimFiscalYears rdfy
        ON ISNULL(skfagl.FiscalYear, -1) = rdfy.FiscalYear
		AND ISNULL(skfagl.FiscalPeriodBeginDate, '1/1/1900') = rdfy.FiscalPeriodBeginDate
		AND ISNULL(skfagl.FiscalPeriodEndDate, '1/1/1900') = rdfy.FiscalPeriodEndDate
    LEFT JOIN RDS.DimFinancialAccounts dfa 
        ON  ISNULL(skfagl.Federal_FinancialAccountNumber, 'MISSING') = dfa.FinancialAccountNumber
        AND ISNULL(skfagl.Federal_FinancialAccountName, 'MISSING') = dfa.FinancialAccountName
        AND ISNULL(skfagl.Federal_FinancialAccountDescription, 'MISSING') = dfa.FinancialAccountDescription
    LEFT JOIN RDS.DimFinancialAccounts dsa 
        ON  ISNULL(skfagl.Sea_FinancialAccountNumber, 'MISSING') = dsa.FinancialAccountNumber
        AND ISNULL(skfagl.Sea_FinancialAccountName, 'MISSING') = dsa.FinancialAccountName
        AND ISNULL(skfagl.Sea_FinancialAccountDescription, 'MISSING') = dsa.FinancialAccountDescription
    LEFT JOIN RDS.DimFinancialAccounts dla 
        ON  ISNULL(skfagl.Lea_FinancialAccountNumber, 'MISSING') = dla.FinancialAccountNumber
        AND ISNULL(skfagl.Lea_FinancialAccountName, 'MISSING') = dla.FinancialAccountName
        AND ISNULL(skfagl.Lea_FinancialAccountDescription, 'MISSING') = dla.FinancialAccountDescription
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
    LEFT JOIN RDS.DimLeaFinancialExpenditureClassifications rvdlfec
        ON  ISNULL(skfagl.Lea_FinancialExpenditureLocalFunctionCodeCode, 'MISSING') = rvdlfec.FinancialExpenditureLocalFunctionCodeCode
		AND ISNULL(skfagl.Lea_FinancialExpenditureLocalObjectCodeCode, 'MISSING') = rvdlfec.FinancialExpenditureLocalObjectCodeCode
		AND ISNULL(skfagl.Lea_FinancialExpenditureLocalLevelOfInstructionCodeCode, 'MISSING') = rvdlfec.FinancialExpenditureLocalLevelOfInstructionCodeCode
        AND ISNULL(skfagl.Lea_FinancialExpenditureProjectReportingCodeCode, 'MISSING') = rvdlfec.FinancialExpenditureProjectReportingCodeCode
    LEFT JOIN RDS.DimSeaFinancialExpenditureClassifications rvdsfec
        ON  ISNULL(ISNULL(skfagl.Sea_FinancialExpenditureLocalFunctionCodeCode, rvdlfec.FinancialExpenditureLocalFunctionCodeSeaCode), 'MISSING') = rvdsfec.FinancialExpenditureLocalFunctionCodeCode
		AND ISNULL(ISNULL(skfagl.Sea_FinancialExpenditureLocalObjectCodeCode, rvdlfec.FinancialExpenditureLocalObjectCodeSeaCode), 'MISSING') = rvdsfec.FinancialExpenditureLocalObjectCodeCode
		AND ISNULL(ISNULL(skfagl.Sea_FinancialExpenditureLocalLevelOfInstructionCodeCode, rvdlfec.FinancialExpenditureLocalLevelOfInstructionCodeSeaCode), 'MISSING') = rvdsfec.FinancialExpenditureLocalLevelOfInstructionCodeCode
        AND ISNULL(ISNULL(skfagl.Sea_FinancialExpenditureProjectReportingCodeCode, rvdlfec.FinancialExpenditureProjectReportingCodeSeaCode), 'MISSING') = rvdsfec.FinancialExpenditureProjectReportingCodeCode
    LEFT JOIN RDS.vwDimFederalFinancialExpenditureClassifications rvdffec
        ON  ISNULL(ISNULL(skfagl.Federal_FinancialExpenditureFunctionCodeCode, rvdsfec.FinancialExpenditureLocalFunctionCodeFederalCode), 'MISSING') = rvdffec.FinancialExpenditureFunctionCodeMap
		AND ISNULL(ISNULL(skfagl.Federal_FinancialExpenditureObjectCodeCode, rvdsfec.FinancialExpenditureLocalObjectCodeFederalCode), 'MISSING') = rvdffec.FinancialExpenditureObjectCodeMap
		AND ISNULL(ISNULL(skfagl.Federal_FinancialExpenditureLevelOfInstructionCodeCode, rvdsfec.FinancialExpenditureLocalLevelOfInstructionCodeFederalCode), 'MISSING') = rvdffec.FinancialExpenditureLevelOfInstructionCodeMap
    LEFT JOIN RDS.vwDimFederalFinancialRevenueClassifications rvdffrc
        ON  ISNULL(skfagl.Federal_FinancialAccountRevenueCodeCode, 'MISSING') = rvdffrc.FinancialAccountRevenueCodeMap
    LEFT JOIN RDS.DimSeaFinancialRevenueClassifications rvdsfrc
        ON  ISNULL(skfagl.Sea_FinancialAccountLocalRevenueCodeCode, 'MISSING') = rvdsfrc.FinancialAccountLocalRevenueCodeCode
    LEFT JOIN RDS.DimLeaFinancialRevenueClassifications rvdlfrc
        ON  ISNULL(skfagl.Lea_FinancialAccountLocalRevenueCodeCode, 'MISSING') = rvdlfrc.FinancialAccountLocalRevenueCodeCode
    LEFT JOIN RDS.DimFederalProgramCodes dfpc 
        ON  ISNULL(skfagl.FederalProgramCode, 'MISSING') = dfpc.FederalProgramCode
        AND ISNULL(skfagl.FederalProgramSubgrantCode, 'MISSING') = dfpc.FederalProgramSubgrantCode;
END
