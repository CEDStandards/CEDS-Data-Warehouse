CREATE VIEW [RDS].[vwDimK12StaffAssignmentStatuses]
AS
  SELECT
    DimK12StaffAssignmentStatusId,
    rsy.SchoolYear,
    ItinerantTeacherCode,
    sssrd1.InputCode AS ItinerantTeacherMap,
    ClassroomPositionTypeCode,
    sssrd2.InputCode AS ClassroomPositionTypeMap,
    PrimaryAssignmentIndicatorCode,
    sssrd3.InputCode AS PrimaryAssignmentIndicatorMap
  FROM RDS.DimK12StaffAssignmentStatuses dka
  CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
  LEFT JOIN Staging.SourceSystemReferenceData sssrd1
    ON dka.ItinerantTeacherCode = sssrd1.OutputCode
    AND sssrd1.TableName = 'RefItinerantTeacher'
  LEFT JOIN Staging.SourceSystemReferenceData sssrd2
    ON dka.ClassroomPositionTypeCode = sssrd2.OutputCode
    AND sssrd2.TableName = 'RefClassroomPositionType'
  LEFT JOIN Staging.SourceSystemReferenceData sssrd3
    ON dka.PrimaryAssignmentIndicatorCode = sssrd3.OutputCode
    AND sssrd3.TableName = 'RefPrimaryAssignmentIndicator'