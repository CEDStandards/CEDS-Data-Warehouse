CREATE PROCEDURE Staging.[Staging-To-DimFiscalYears]
AS
BEGIN

    -- Insert distinct record combinations into DimFiscalYears

INSERT INTO RDS.DimFiscalYears(
            FiscalPeriodBeginDate
           ,FiscalPeriodEndDate
           ,FiscalYear
	)
    SELECT DISTINCT
          skfab.FiscalPeriodBeginDate
        , skfab.FiscalPeriodEndDate
        , skfab.FiscalYear
    FROM Staging.K12FinancialAccountBalance skfab
    LEFT JOIN RDS.DimFiscalYears rdfy
        ON  skfab.FiscalPeriodBeginDate = rdfy.FiscalPeriodBeginDate
        AND skfab.FiscalPeriodEndDate = rdfy.FiscalPeriodEndDate
        AND skfab.FiscalYear = rdfy.FiscalYear
    WHERE rdfy.DimFiscalYearId IS NULL

   
    UNION
   
    SELECT DISTINCT
          skfagl.FiscalPeriodBeginDate
        , skfagl.FiscalPeriodEndDate
        , skfagl.FiscalYear
    FROM Staging.K12FinancialAccountGeneralLedger skfagl
    LEFT JOIN RDS.DimFiscalYears rdfy
        ON  skfagl.FiscalPeriodBeginDate = rdfy.FiscalPeriodBeginDate
        AND skfagl.FiscalPeriodEndDate = rdfy.FiscalPeriodEndDate
        AND skfagl.FiscalYear = rdfy.FiscalYear
    WHERE rdfy.DimFiscalYearId IS NULL

END