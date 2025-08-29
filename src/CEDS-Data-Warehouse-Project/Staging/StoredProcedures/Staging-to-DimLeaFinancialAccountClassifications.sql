CREATE PROCEDURE Staging.[Staging-to-DimLeaFinancialAccountClassifications]
AS
BEGIN

    -- Insert distinct record combinations into DimLeaFinancialAccountClassifications
    INSERT INTO RDS.DimLeaFinancialAccountClassifications (
          FinancialAccountCategoryCode
        , FinancialAccountCategoryDescription
        , FinancialAccountLocalProgramCodeCode
        , FinancialAccountLocalProgramCodeDescription
        , FinancialAccountLocalFundClassificationCode
        , FinancialAccountLocalFundClassificationDescription
    )
    SELECT DISTINCT
          Lea_FinancialAccountCategoryCode
        , Lea_FinancialAccountCategoryDescription
        , Lea_FinancialAccountLocalProgramCodeCode
        , Lea_FinancialAccountLocalProgramCodeDescription
        , Lea_FinancialAccountLocalFundClassificationCode
        , Lea_FinancialAccountLocalFundClassificationDescription
    FROM Staging.K12FinancialAccountBalance skfab
    LEFT JOIN RDS.DimLeaFinancialAccountClassifications rdlfac
        ON  skfab.Lea_FinancialAccountCategoryCode = rdlfac.FinancialAccountCategoryCode
        AND skfab.Lea_FinancialAccountCategoryDescription = rdlfac.FinancialAccountCategoryDescription
        AND skfab.Lea_FinancialAccountLocalProgramCodeCode = rdlfac.FinancialAccountLocalProgramCodeCode
        AND skfab.Lea_FinancialAccountLocalProgramCodeDescription = rdlfac.FinancialAccountLocalProgramCodeDescription
        AND skfab.Lea_FinancialAccountLocalFundClassificationCode = rdlfac.FinancialAccountLocalFundClassificationCode
        AND skfab.Lea_FinancialAccountLocalFundClassificationDescription = rdlfac.FinancialAccountLocalFundClassificationDescription
    WHERE rdlfac.DimLeaFinancialAccountClassificationId IS NULL

   
    UNION
   
    SELECT DISTINCT
          Lea_FinancialAccountCategoryCode
        , Lea_FinancialAccountCategoryDescription
        , Lea_FinancialAccountLocalProgramCodeCode
        , Lea_FinancialAccountLocalProgramCodeDescription
        , Lea_FinancialAccountLocalFundClassificationCode
        , Lea_FinancialAccountLocalFundClassificationDescription
    FROM Staging.K12FinancialAccountGeneralLedger skfagl
    LEFT JOIN RDS.DimLeaFinancialAccountClassifications rdlfac
        ON  skfagl.Lea_FinancialAccountCategoryCode = rdlfac.FinancialAccountCategoryCode
        AND skfagl.Lea_FinancialAccountCategoryDescription = rdlfac.FinancialAccountCategoryDescription
        AND skfagl.Lea_FinancialAccountLocalProgramCodeCode = rdlfac.FinancialAccountLocalProgramCodeCode
        AND skfagl.Lea_FinancialAccountLocalProgramCodeDescription = rdlfac.FinancialAccountLocalProgramCodeDescription
        AND skfagl.Lea_FinancialAccountLocalFundClassificationCode = rdlfac.FinancialAccountLocalFundClassificationCode
        AND skfagl.Lea_FinancialAccountLocalFundClassificationDescription = rdlfac.FinancialAccountLocalFundClassificationDescription
    WHERE rdlfac.DimLeaFinancialAccountClassificationId IS NULL

END
