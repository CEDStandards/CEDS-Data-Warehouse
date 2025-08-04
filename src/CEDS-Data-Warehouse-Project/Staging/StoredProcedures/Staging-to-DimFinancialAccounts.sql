CREATE PROCEDURE [Staging].[Staging-to-DimFinancialAccounts]
	@dataCollectionName AS VARCHAR(50) = NULL
AS 
BEGIN

    INSERT INTO RDS.DimFinancialAccounts
    (              
          FinancialAccountNumber
        , FinancialAccountName
        , FinancialAccountDescription
    )
    SELECT DISTINCT 
          Federal_FinancialAccountNumber
        , Federal_FinancialAccountName
        , Federal_FinancialAccountDescription
    FROM Staging.K12FinancialAccountBalance skfab
    LEFT JOIN RDS.DimFinancialAccounts rdfa
        ON skfab.Federal_FinancialAccountNumber = rdfa.FinancialAccountNumber
        AND skfab.Federal_FinancialAccountName = rdfa.FinancialAccountName
        AND skfab.Federal_FinancialAccountDescription = rdfa.FinancialAccountDescription
    WHERE Federal_FinancialAccountNumber IS NOT NULL
        AND rdfa.FinancialAccountNumber IS NULL

    UNION 
    
    SELECT DISTINCT 
          Sea_FinancialAccountNumber
        , Sea_FinancialAccountName
        , Sea_FinancialAccountDescription
    FROM Staging.K12FinancialAccountBalance skfab
    LEFT JOIN RDS.DimFinancialAccounts rdfa
        ON skfab.Federal_FinancialAccountNumber = rdfa.FinancialAccountNumber
        AND skfab.Federal_FinancialAccountName = rdfa.FinancialAccountName
        AND skfab.Federal_FinancialAccountDescription = rdfa.FinancialAccountDescription
    WHERE Sea_FinancialAccountNumber IS NOT NULL
        AND rdfa.FinancialAccountNumber IS NULL

    UNION

    SELECT DISTINCT
          Lea_FinancialAccountNumber
        , Lea_FinancialAccountName
        , Lea_FinancialAccountDescription
    FROM Staging.K12FinancialAccountBalance skfab
    LEFT JOIN RDS.DimFinancialAccounts rdfa
        ON skfab.Federal_FinancialAccountNumber = rdfa.FinancialAccountNumber
        AND skfab.Federal_FinancialAccountName = rdfa.FinancialAccountName
        AND skfab.Federal_FinancialAccountDescription = rdfa.FinancialAccountDescription
    WHERE Lea_FinancialAccountNumber IS NOT NULL
        AND rdfa.FinancialAccountNumber IS NULL

    UNION

    SELECT DISTINCT 
          Federal_FinancialAccountNumber
        , Federal_FinancialAccountName
        , Federal_FinancialAccountDescription
    FROM Staging.K12FinancialAccountGeneralLedger skfagl
    LEFT JOIN RDS.DimFinancialAccounts rdfa
        ON skfagl.Federal_FinancialAccountNumber = rdfa.FinancialAccountNumber
        AND skfagl.Federal_FinancialAccountName = rdfa.FinancialAccountName
        AND skfagl.Federal_FinancialAccountDescription = rdfa.FinancialAccountDescription
    WHERE Federal_FinancialAccountNumber IS NOT NULL
        AND rdfa.FinancialAccountNumber IS NULL

    UNION 
    
    SELECT DISTINCT 
          Sea_FinancialAccountNumber
        , Sea_FinancialAccountName
        , Sea_FinancialAccountDescription
    FROM Staging.K12FinancialAccountGeneralLedger skfagl
    LEFT JOIN RDS.DimFinancialAccounts rdfa
        ON skfagl.Federal_FinancialAccountNumber = rdfa.FinancialAccountNumber
        AND skfagl.Federal_FinancialAccountName = rdfa.FinancialAccountName
        AND skfagl.Federal_FinancialAccountDescription = rdfa.FinancialAccountDescription
    WHERE Sea_FinancialAccountNumber IS NOT NULL
        AND rdfa.FinancialAccountNumber IS NULL

    UNION

    SELECT DISTINCT
          Lea_FinancialAccountNumber
        , Lea_FinancialAccountName
        , Lea_FinancialAccountDescription
    FROM Staging.K12FinancialAccountGeneralLedger skfagl
    LEFT JOIN RDS.DimFinancialAccounts rdfa
        ON skfagl.Federal_FinancialAccountNumber = rdfa.FinancialAccountNumber
        AND skfagl.Federal_FinancialAccountName = rdfa.FinancialAccountName
        AND skfagl.Federal_FinancialAccountDescription = rdfa.FinancialAccountDescription
    WHERE Lea_FinancialAccountNumber IS NOT NULL
        AND rdfa.FinancialAccountNumber IS NULL


END