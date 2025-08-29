CREATE VIEW [RDS].[vwDimLanguages]
AS
	SELECT
		  DimLanguageId
		, rsy.SchoolYear
		, Iso6392LanguageCodeCode
		, sssrd.InputCode AS Iso6392LanguageMap
	FROM RDS.DimLanguages rdl
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd
		ON rdl.Iso6392LanguageCodeCode = sssrd.OutputCode
		AND sssrd.TableName = 'refLanguage'
		AND rsy.SchoolYear = sssrd.SchoolYear

GO

