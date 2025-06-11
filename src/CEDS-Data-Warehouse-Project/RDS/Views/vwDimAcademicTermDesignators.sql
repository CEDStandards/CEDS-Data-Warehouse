CREATE VIEW RDS.vwDimAcademicTermDesignators
AS
	SELECT
		  DimAcademicTermDesignatorId
		, rsy.SchoolYear
		, AcademicTermDesignatorCode
		, sssrd1.InputCode				AS 'AcademicTermDesignatorMap'
	FROM RDS.DimAcademicTermDesignators rdatd
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd1
		ON rdatd.AcademicTermDesignatorCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefAcademicTermDesignator'
		AND rsy.SchoolYear = sssrd1.SchoolYear
