CREATE VIEW RDS.vwDimK12StaffStatuses AS
	SELECT
		DimK12StaffStatusId
		, rsy.SchoolYear
		, rdkss.SpecialEducationAgeGroupTaughtCode 
		, sssrd1.InputCode AS SpecialEducationAgeGroupTaughtMap
		, rdkss.EdFactsTeacherInexperiencedStatusCode 
		, sssrd2.InputCode AS EdFactsTeacherInexperiencedStatusMap
		, rdkss.EdFactsTeacherOutOfFieldStatusCode 
		, sssrd3.InputCode AS EdFactsTeacherOutOfFieldStatusMap
		, rdkss.TeachingCredentialTypeCode
		, sssrd4.InputCode AS TeachingCredentialTypeMap
		, rdkss.ParaprofessionalQualificationStatusCode
		, sssrd5.InputCode AS ParaprofessionalQualificationStatusMap
		, rdkss.HighlyQualifiedTeacherIndicatorCode
		, CASE HighlyQualifiedTeacherIndicatorCode
			WHEN 'HIGHLYQUALIFIED' THEN 1
			WHEN 'NOTHIGHLYQUALIFIED' THEN 0
		END AS HighlyQualifiedTeacherIndicatorMap
		, rdkss.SpecialEducationTeacherQualificationStatusCode
		, sssrd6.InputCode AS SpecialEducationTeacherQualificationStatusMap
		, rdkss.EdFactsCertificationStatusCode
		, sssrd7.InputCode AS EdFactsCertificationStatusMap
	FROM rds.DimK12StaffStatuses rdkss
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdkss.SpecialEducationAgeGroupTaughtCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefSpecialEducationAgeGroupTaught'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdkss.EdFactsTeacherInexperiencedStatusCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefEdFactsTeacherInexperiencedStatus'
		AND rsy.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
		ON rdkss.EdFactsTeacherOutOfFieldStatusCode = sssrd3.OutputCode
		AND sssrd3.TableName = 'RefOutOfFieldStatus'
		AND rsy.SchoolYear = sssrd3.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd4
		ON rdkss.TeachingCredentialTypeCode = sssrd4.OutputCode
		AND sssrd4.TableName = 'RefTeachingCredentialType'
		AND rsy.SchoolYear = sssrd4.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd5
		ON rdkss.ParaprofessionalQualificationStatusCode = sssrd5.OutputCode
		AND sssrd5.TableName = 'RefParaprofessionalQualification'
		AND rsy.SchoolYear = sssrd5.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd6
		ON rdkss.SpecialEducationTeacherQualificationStatusCode = sssrd6.OutputCode
		AND sssrd6.TableName = 'RefSpecialEducationTeacherQualificationStatus'
		AND rsy.SchoolYear = sssrd6.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd7
		ON rdkss.EdFactsCertificationStatusCode = sssrd7.OutputCode
		AND sssrd7.TableName = 'RefEdFactsCertificationStatus'
		AND rsy.SchoolYear = sssrd7.SchoolYear





