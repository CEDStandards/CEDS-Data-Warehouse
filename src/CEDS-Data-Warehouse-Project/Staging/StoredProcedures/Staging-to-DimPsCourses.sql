CREATE PROCEDURE [Staging].[Staging-To-DimPsCourses]
AS
BEGIN

	-- Update the record to add the RecordEndDateTime if the record is being end dated

	UPDATE RDS.DimPsCourses
	SET RecordEndDateTime = spc.RecordEndDateTime
	FROM RDS.DimPsCourses rdpc
	JOIN Staging.PsCourses spc
        ON  spc.CourseIdentifier = rdpc.CourseIdentifier
        AND ISNULL(spc.CourseCodeSystemCode, 'MISSING') = ISNULL(rdpc.CourseCodeSystemCode, 'MISSING')
        AND ISNULL(spc.CourseCodeSystemDescription, 'MISSING') = ISNULL(rdpc.CourseCodeSystemDescription, 'MISSING')
        AND spc.CourseSubjectAbbreviation = rdpc.CourseSubjectAbbreviation
        AND spc.CourseNumber = rdpc.CourseNumber
        AND spc.CourseTitle = rdpc.CourseTitle
        AND spc.CourseDescription = rdpc.CourseDescription
        AND spc.CourseDepartmentName = rdpc.CourseDepartmentName
        AND ISNULL(spc.CourseCreditUnitsCode, 'MISSING') = ISNULL(rdpc.CourseCreditUnitsCode, 'MISSING')
        AND ISNULL(spc.CourseCreditUnitsDescription, 'MISSING') = ISNULL(rdpc.CourseCreditUnitsDescription, 'MISSING')
        AND spc.CreditValue = rdpc.CreditValue
		AND spc.RecordStartDateTime = rdpc.RecordStartDateTime
	WHERE spc.RecordEndDateTime IS NOT NULL


    -- Insert distinct record combinations into DimPsCourses where the record does not already exist.

INSERT INTO RDS.DimPsCourses(
    CourseIdentifier              
    ,CourseCodeSystemCode           
    ,CourseCodeSystemDescription 
    ,CourseSubjectAbbreviation     
    ,CourseNumber          
    ,CourseTitle             
    ,CourseDescription      
    ,CourseDepartmentName       
    ,CourseCreditUnitsCode       
    ,CourseCreditUnitsDescription
    ,CreditValue
    ,RecordStartDateTime
    ,RecordEndDateTime                
	)
    SELECT DISTINCT
     spc.CourseIdentifier              
    ,spc.CourseCodeSystemCode           
    ,spc.CourseCodeSystemDescription 
    ,spc.CourseSubjectAbbreviation     
    ,spc.CourseNumber          
    ,spc.CourseTitle             
    ,spc.CourseDescription      
    ,spc.CourseDepartmentName       
    ,spc.CourseCreditUnitsCode       
    ,spc.CourseCreditUnitsDescription
    ,spc.CreditValue
    ,spc. RecordStartDateTime
    ,NULL RecordEndDateTime   
    FROM Staging.PsCourses spc
    LEFT JOIN RDS.DimPsCourses rdpc
        ON  spc.CourseIdentifier = rdpc.CourseIdentifier
        AND ISNULL(spc.CourseCodeSystemCode, 'MISSING') = ISNULL(rdpc.CourseCodeSystemCode, 'MISSING')
        AND ISNULL(spc.CourseCodeSystemDescription, 'MISSING') = ISNULL(rdpc.CourseCodeSystemDescription, 'MISSING')
        AND spc.CourseSubjectAbbreviation = rdpc.CourseSubjectAbbreviation
        AND spc.CourseNumber = rdpc.CourseNumber
        AND spc.CourseTitle = rdpc.CourseTitle
        AND spc.CourseDescription = rdpc.CourseDescription
        AND spc.CourseDepartmentName = rdpc.CourseDepartmentName
        AND ISNULL(spc.CourseCreditUnitsCode, 'MISSING') = ISNULL(rdpc.CourseCreditUnitsCode, 'MISSING')
        AND ISNULL(spc.CourseCreditUnitsDescription, 'MISSING') = ISNULL(rdpc.CourseCreditUnitsDescription, 'MISSING')
        AND spc.CreditValue = rdpc.CreditValue
		AND ISNULL(spc.RecordStartDateTime, '1900-01-01') = ISNULL(rdpc.RecordStartDateTime, '1900-01-01')
		AND spc.RecordEndDateTime IS NULL
    WHERE rdpc.DimPsCourseId IS NULL


END
GO