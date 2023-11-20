CREATE PROCEDURE Staging.[Staging-to-DimSeaFinancialAccountClassifications]
AS
BEGIN

    -- Insert distinct record combinations into DimSeaFinancialAccountClassifications
    INSERT INTO RDS.DimSeaFinancialAccountClassifications (
          FinancialAccountCategoryCode
        , FinancialAccountCategoryDescription
        , FinancialAccountLocalProgramCodeCode
        , FinancialAccountLocalProgramCodeDescription
        , FinancialAccountLocalFundClassificationCode
        , FinancialAccountLocalFundClassificationDescription
    )
    SELECT DISTINCT
          Sea_FinancialAccountCategoryCode
        , Sea_FinancialAccountCategoryDescription
        , Sea_FinancialAccountLocalProgramCodeCode
        , Sea_FinancialAccountLocalProgramCodeDescription
        , Sea_FinancialAccountLocalFundClassificationCode
        , Sea_FinancialAccountLocalFundClassificationDescription
    FROM Staging.K12FinancialAccountBalance skfab
    LEFT JOIN RDS.DimSeaFinancialAccountClassifications rdlfac
        ON  skfab.Sea_FinancialAccountCategoryCode = rdlfac.FinancialAccountCategoryCode
        AND skfab.Sea_FinancialAccountCategoryDescription = rdlfac.FinancialAccountCategoryDescription
        AND skfab.Sea_FinancialAccountLocalProgramCodeCode = rdlfac.FinancialAccountLocalProgramCodeCode
        AND skfab.Sea_FinancialAccountLocalProgramCodeDescription = rdlfac.FinancialAccountLocalProgramCodeDescription
        AND skfab.Sea_FinancialAccountLocalFundClassificationCode = rdlfac.FinancialAccountLocalFundClassificationCode
        AND skfab.Sea_FinancialAccountLocalFundClassificationDescription = rdlfac.FinancialAccountLocalFundClassificationDescription
    WHERE rdlfac.DimSeaFinancialAccountClassificationId IS NULL

   
    UNION
   
    SELECT DISTINCT
          Sea_FinancialAccountCategoryCode
        , Sea_FinancialAccountCategoryDescription
        , Sea_FinancialAccountLocalProgramCodeCode
        , Sea_FinancialAccountLocalProgramCodeDescription
        , Sea_FinancialAccountLocalFundClassificationCode
        , Sea_FinancialAccountLocalFundClassificationDescription
    FROM Staging.K12FinancialAccountGeneralLedger skfagl
    LEFT JOIN RDS.DimSeaFinancialAccountClassifications rdlfac
        ON  skfagl.Sea_FinancialAccountCategoryCode = rdlfac.FinancialAccountCategoryCode
        AND skfagl.Sea_FinancialAccountCategoryDescription = rdlfac.FinancialAccountCategoryDescription
        AND skfagl.Sea_FinancialAccountLocalProgramCodeCode = rdlfac.FinancialAccountLocalProgramCodeCode
        AND skfagl.Sea_FinancialAccountLocalProgramCodeDescription = rdlfac.FinancialAccountLocalProgramCodeDescription
        AND skfagl.Sea_FinancialAccountLocalFundClassificationCode = rdlfac.FinancialAccountLocalFundClassificationCode
        AND skfagl.Sea_FinancialAccountLocalFundClassificationDescription = rdlfac.FinancialAccountLocalFundClassificationDescription
    WHERE rdlfac.DimSeaFinancialAccountClassificationId IS NULL

END
