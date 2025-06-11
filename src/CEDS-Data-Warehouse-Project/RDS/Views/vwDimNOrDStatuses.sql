CREATE VIEW RDS.vwDimNOrDStatuses 
AS
	SELECT
		  rdnods.DimNOrDStatusId
		, rsy.SchoolYear
		, rdnods.NeglectedOrDelinquentProgramTypeCode
		, sssrd.InputCode AS NeglectedOrDelinquentProgramTypeMap
		, rdnods.NeglectedProgramTypeCode
		, sssrd1.InputCode AS NeglectedProgramTypeMap
		, rdnods.DelinquentProgramTypeCode
		, sssrd2.InputCode AS DelinquentProgramTypeMap
	FROM RDS.DimNOrDStatuses rdnods
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd
		ON rdnods.NeglectedOrDelinquentProgramTypeCode = sssrd.OutputCode
		AND sssrd.TableName = 'RefNeglectedOrDelinquentProgramType'
		AND rsy.SchoolYear = sssrd.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData sssrd1
		ON rdnods.NeglectedProgramTypeCode = sssrd.OutputCode
		AND sssrd.TableName = 'RefNeglectedProgramType'
		AND rsy.SchoolYear = sssrd.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData sssrd2
		ON rdnods.DelinquentProgramTypeCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefDelinquentProgramType'
		AND rsy.SchoolYear = sssrd2.SchoolYear

GO

