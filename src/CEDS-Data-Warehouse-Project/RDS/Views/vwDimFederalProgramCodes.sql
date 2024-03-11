CREATE VIEW RDS.vwDimFederalProgramCodes
AS
	SELECT
		  [DimFederalProgramCodeId]
		, [FederalProgramCode]
		, sssrd1.InputCode AS FederalProgramCodeMap
		, [FederalProgramSubgrantCode]
		, sssrd2.InputCode AS FederalProgramSubgrantCodeMap
	FROM RDS.DimFederalProgramCodes dfpc
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd1
		ON dfpc.FederalProgramCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefFederalProgramCode'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData sssrd2
		ON dfpc.FederalProgramSubgrantCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefFederalProgramSubgrantCode'
		AND rsy.SchoolYear = sssrd2.SchoolYear
