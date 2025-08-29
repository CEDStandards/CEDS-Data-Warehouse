CREATE VIEW RDS.vwDimChildOutcomeSummaries
AS
	SELECT  rdcos.DimChildOutcomeSummaryId
			, rsy.SchoolYear
			, rdcos.CosRatingACode
			, ISNULL(rdcos.CosRatingACode, 'MISSING') AS CosRatingAMap
			, rdcos.CosProgressAIndicatorCode
			, CASE rdcos.CosProgressAIndicatorCode 
				WHEN 'Yes' THEN 1 
				WHEN 'No' THEN 0
				ELSE 0
			END AS CosProgressAIndicatorMap
			, rdcos.CosRatingBCode
			, ISNULL(rdcos.CosRatingBCode, 'MISSING') AS CosRatingBMap
			, rdcos.CosProgressBIndicatorCode
			, CASE rdcos.CosProgressBIndicatorCode 
				WHEN 'Yes' THEN 1 
				WHEN 'No' THEN 0
				ELSE 0
			END AS CosProgressBIndicatorMap
			, rdcos.CosRatingCCode
			, ISNULL(rdcos.CosRatingCCode, 'MISSING') AS CosRatingCMap
			, rdcos.CosProgressCIndicatorCode
			, CASE rdcos.CosProgressCIndicatorCode 
				WHEN 'Yes' THEN 1 
				WHEN 'No' THEN 0
				ELSE 0
			END AS CosProgressCIndicatorMap
	FROM RDS.DimChildOutcomeSummaries rdcos
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd1
			ON rdcos.CosRatingACode = sssrd1.OutputCode
			AND rsy.SchoolYear = sssrd1.SchoolYear
			AND sssrd1.TableName = 'RefChildOutcomesSummaryRating'
	LEFT JOIN Staging.SourceSystemReferenceData sssrd2
			ON rdcos.CosRatingBCode = sssrd2.OutputCode
			AND rsy.SchoolYear = sssrd2.SchoolYear
			AND sssrd2.TableName = 'RefChildOutcomesSummaryRating'
	LEFT JOIN Staging.SourceSystemReferenceData sssrd3
			ON rdcos.CosRatingCCode = sssrd3.OutputCode
			AND rsy.SchoolYear = sssrd3.SchoolYear
			AND sssrd3.TableName = 'RefChildOutcomesSummaryRating'		