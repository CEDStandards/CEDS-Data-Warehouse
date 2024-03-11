CREATE VIEW [RDS].[vwDimK12CourseSectionStatuses] AS
  SELECT
    [DimK12CourseSectionStatusId],
    [BlendedLearningModelTypeCode],
    sssrd1.InputCode AS BlendedLearningModelTypeMap,
    [CourseInteractionModeCode],
    sssrd2.InputCode AS CourseInteractionModeMap,
    [CourseSectionAssessmentReportingMethodCode],
    sssrd3.InputCode AS CourseSectionAssessmentReportingMethodMap,
    [CourseSectionInstructionalDeliveryModeCode],
    sssrd4.InputCode AS CourseSectionInstructionalDeliveryModeMap,
    [ReceivingLocationOfInstructionCode],
    sssrd5.InputCode AS ReceivingLocationOfInstructionMap
  FROM [RDS].[DimK12CourseSectionStatuses] rdkcs
  CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
  LEFT JOIN staging.SourceSystemReferenceData sssrd1
    ON rdkcs.BlendedLearningModelTypeCode = sssrd1.OutputCode
    AND sssrd1.TableName = 'RefBlendedLearningModelType'
    AND rsy.SchoolYear = sssrd1.SchoolYear
  LEFT JOIN staging.SourceSystemReferenceData sssrd2
    ON rdkcs.CourseInteractionModeCode = sssrd2.OutputCode
    AND sssrd2.TableName = 'RefCourseInteractionMode'
    AND rsy.SchoolYear = sssrd2.SchoolYear
  LEFT JOIN staging.SourceSystemReferenceData sssrd3
    ON rdkcs.CourseSectionAssessmentReportingMethodCode = sssrd3.OutputCode
    AND sssrd3.TableName = 'RefCourseSectionAssessmentReportingMethod'
    AND rsy.SchoolYear = sssrd3.SchoolYear
  LEFT JOIN staging.SourceSystemReferenceData sssrd4
    ON rdkcs.CourseSectionInstructionalDeliveryModeCode = sssrd4.OutputCode
    AND sssrd4.TableName = 'RefCourseSectionInstructionalDeliveryMode'
    AND rsy.SchoolYear = sssrd4.SchoolYear
  LEFT JOIN staging.SourceSystemReferenceData sssrd5
    ON rdkcs.ReceivingLocationOfInstructionCode = sssrd5.OutputCode
    AND sssrd5.TableName = 'RefReceivingLocationOfInstruction'
    AND rsy.SchoolYear = sssrd5.SchoolYear
