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
		, rdkss.SpecialEducationRelatedServicesPersonnelCode
		, sssrd8.InputCode AS SpecialEducationRelatedServicesPersonnelMap
		, rdkss.TeachingCredentialBasisCode
		, sssrd9.InputCode AS TeachingCredentialBasisMap
		, rdkss.CTEInstructorIndustryCertificationCode
		, sssrd10.InputCode AS CTEInstructorIndustryCertificationMap
		, rdkss.SpecialEducationParaprofessionalCode
		, sssrd11.InputCode AS SpecialEducationParaprofessionalMap
		, rdkss.SpecialEducationTeacherCode
		, sssrd12.InputCode AS SpecialEducationTeacherMap
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
	LEFT JOIN staging.SourceSystemReferenceData sssrd8
		ON rdkss.SpecialEducationRelatedServicesPersonnelCode = sssrd8.OutputCode
		AND sssrd8.TableName = 'RefSpecialEducationRelatedServicesPersonnel'
		AND rsy.SchoolYear = sssrd8.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd9
		ON rdkss.TeachingCredentialBasisCode = sssrd9.OutputCode
		AND sssrd9.TableName = 'RefTeachingCredentialBasis'
		AND rsy.SchoolYear = sssrd9.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd10
		ON rdkss.CTEInstructorIndustryCertificationCode = sssrd10.OutputCode
		AND sssrd10.TableName = 'RefCTEInstructorIndustryCertification'
		AND rsy.SchoolYear = sssrd10.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd11
		ON rdkss.SpecialEducationParaprofessionalCode = sssrd11.OutputCode
		AND sssrd11.TableName = 'RefSpecialEducationParaprofessional'
		AND rsy.SchoolYear = sssrd11.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd12
		ON rdkss.SpecialEducationTeacherCode = sssrd12.OutputCode
		AND sssrd12.TableName = 'RefSpecialEducationTeacher'
		AND rsy.SchoolYear = sssrd12.SchoolYear





