CREATE VIEW rds.vwDimAcademicTermDesignators
AS
	SELECT
		  DimAcademicTermDesignatorId
		, rsy.SchoolYear
		, AcademicTermDesignatorCode
		, sssrd1.InputCode				AS 'AcademicTermDesignatorMap'
	FROM rds.DimAcademicTermDesignators rdatd
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdatd.AcademicTermDesignatorCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefAcademicTermDesignator'
		AND rsy.SchoolYear = sssrd1.SchoolYear
