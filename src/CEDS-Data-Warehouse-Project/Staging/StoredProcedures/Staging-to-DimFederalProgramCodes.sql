CREATE PROCEDURE Staging.[Staging-To-DimFederalProgramCodes]
AS
BEGIN

    -- Insert distinct record combinations into DimFederalProgramCodes

INSERT INTO RDS.DimFederalProgramCodes (
            FederalProgramCode
           ,FederalProgramCodeDescription
           ,FederalProgramSubgrantCode
           ,FederalProgramSubgrantCodeDescription
	)
    SELECT DISTINCT
          skfab.FederalProgramCode
        , skfab.FederalProgramCodeDescription
        , skfab.FederalProgramSubgrantCode
        , skfab.FederalProgramSubgrantCodeDescription
    FROM Staging.K12FinancialAccountBalance skfab
    LEFT JOIN RDS.DimFederalProgramCodes rdfpc
        ON  skfab.FederalProgramCode = rdfpc.FederalProgramCode
        AND skfab.FederalProgramCodeDescription = rdfpc.FederalProgramCodeDescription
        AND skfab.FederalProgramSubgrantCode = rdfpc.FederalProgramSubgrantCode
        AND skfab.FederalProgramSubgrantCodeDescription = rdfpc.FederalProgramSubgrantCodeDescription
    WHERE rdfpc.DimFederalProgramCodeId IS NULL

   
    UNION
   
    SELECT DISTINCT
          skfagl.FederalProgramCode
        , skfagl.FederalProgramCodeDescription
        , skfagl.FederalProgramSubgrantCode
        , skfagl.FederalProgramSubgrantCodeDescription
    FROM Staging.K12FinancialAccountGeneralLedger skfagl
    LEFT JOIN RDS.DimFederalProgramCodes rdfpc
        ON  skfagl.FederalProgramCode = rdfpc.FederalProgramCode
        AND skfagl.FederalProgramCodeDescription = rdfpc.FederalProgramCodeDescription
        AND skfagl.FederalProgramSubgrantCode = rdfpc.FederalProgramSubgrantCode
        AND skfagl.FederalProgramSubgrantCodeDescription = rdfpc.FederalProgramSubgrantCodeDescription
    WHERE rdfpc.DimFederalProgramCodeId IS NULL

END