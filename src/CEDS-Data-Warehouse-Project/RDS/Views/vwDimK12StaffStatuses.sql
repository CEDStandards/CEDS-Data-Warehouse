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
		, sssrd4.InputCode AS ParaprofessionalQualificationStatusMap
		, rdkss.HighlyQualifiedTeacherIndicatorCode
		, CASE HighlyQualifiedTeacherIndicatorCode
			WHEN 'HIGHLYQUALIFIED' THEN 1
			WHEN 'NOTHIGHLYQUALIFIED' THEN 0
		END AS HighlyQualifiedTeacherIndicatorMap
--this is the data that will uncomment with the join below
		-- , rdkss.SpecialEducationTeacherQualificationStatusCode
		-- , sssrd6.InputCode AS SpecialEducationTeacherQualificationStatusCodeMap
--

	FROM rds.DimK12StaffStatuses rdkss
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdkss.SpecialEducationAgeGroupTaughtCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefSpecialEducationAgeGroupTaught'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdkss.EdFactsTeacherInexperiencedStatusCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefUnexperiencedStatus'
		AND rsy.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
		ON rdkss.EdFactsTeacherOutOfFieldStatusCode = sssrd3.OutputCode
		AND sssrd3.TableName = 'RefOutOfFieldStatus'
		AND rsy.SchoolYear = sssrd3.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd4
		ON rdkss.SpecialEducationTeacherQualificationStatusCode = sssrd4.OutputCode
		AND sssrd4.TableName = 'RefParaprofessionalQualification'
		AND rsy.SchoolYear = sssrd4.SchoolYear
--NEW ELEMENT ADDED BY OSC, TICKET #346, DON'T KNOW THE NAME OF THE REF TABLE
	-- LEFT JOIN staging.SourceSystemReferenceData sssrd6
	-- 	ON rdkss.SpecialEducationAgeGroupTaughtCode = sssrd6.OutputCode
	-- 	AND sssrd6.TableName = 'RefSpecialEducationTeacherQualificationStatus'
	-- 	AND rsy.SchoolYear = sssrd6.SchoolYear


--gotta think this one through
	-- LEFT JOIN staging.SourceSystemReferenceData sssrd4
	-- 	ON rdkss.EmergencyOrProvisionalCredentialStatusCode = sssrd4.OutputCode
	-- 	AND sssrd4.TableName = 'RefEmergencyOrProvisionalCredentialStatus'
	-- 	AND rsy.SchoolYear = sssrd4.SchoolYear

GO

