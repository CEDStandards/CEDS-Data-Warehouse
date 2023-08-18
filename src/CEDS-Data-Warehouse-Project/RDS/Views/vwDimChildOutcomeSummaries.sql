CREATE VIEW rds.vwDimChildOutcomeSummaries
AS
	SELECT  rdcos.DimChildOutcomeSummaryId
			, rsy.SchoolYear
			, rdcos.COSRatingACode
			, ISNULL(rdcos.COSRatingACode, 'MISSING') AS COSRatingAMap
			, rdcos.COSProgressAIndicatorCode
			, CASE rdcos.COSProgressAIndicatorCode 
				WHEN 'Yes' THEN 1 
				WHEN 'No' THEN 0
				ELSE 0
			END AS COSProgressAIndicatorMap
			, rdcos.COSRatingBCode
			, ISNULL(rdcos.COSRatingBCode, 'MISSING') AS COSRatingBMap
			, rdcos.COSProgressBIndicatorCode
			, CASE rdcos.COSProgressBIndicatorCode 
				WHEN 'Yes' THEN 1 
				WHEN 'No' THEN 0
				ELSE 0
			END AS COSProgressBIndicatorMap
			, rdcos.COSRatingCCode
			, ISNULL(rdcos.COSRatingCCode, 'MISSING') AS COSRatingCMap
			, rdcos.COSProgressCIndicatorCode
			, CASE rdcos.COSProgressCIndicatorCode 
				WHEN 'Yes' THEN 1 
				WHEN 'No' THEN 0
				ELSE 0
			END AS COSProgressCIndicatorMap
	FROM rds.DimChildOutcomeSummaries rdcos
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
			ON rdcos.COSRatingACode = sssrd1.OutputCode
			AND rsy.SchoolYear = sssrd1.SchoolYear
			AND sssrd1.TableName = 'RefChildOutcomesSummaryRating'
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
			ON rdcos.COSRatingBCode = sssrd2.OutputCode
			AND rsy.SchoolYear = sssrd2.SchoolYear
			AND sssrd2.TableName = 'RefChildOutcomesSummaryRating'
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
			ON rdcos.COSRatingCCode = sssrd3.OutputCode
			AND rsy.SchoolYear = sssrd3.SchoolYear
			AND sssrd3.TableName = 'RefChildOutcomesSummaryRating'		