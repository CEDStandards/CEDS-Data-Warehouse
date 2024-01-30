CREATE TABLE [Staging].[AccessibleEducationMaterialAssignment]
(
  [Id]                                                                  INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [SchoolYear]                                                          SMALLINT NULL,
  [CountDate]                                                           DATE NULL,
  [IeuOrganizationIdentifierSea]                                        NVARCHAR(60) NULL,
  [LeaIdentifierSea]                                                    NVARCHAR(60) NULL,
  [SchoolIdentifierSea]                                                 NVARCHAR(60) NULL,
  [K12StudentStudentIdentifierState]                                    NVARCHAR(60) NULL,
  [ScedCourseCode]                                                      NCHAR(5) NULL,
  [CourseIdentifier]                                                    NVARCHAR (40)  NOT NULL,
  [CourseCodeSystemCode]                                                NVARCHAR (50)  NOT NULL,
  [AccessibleEducationMaterialProviderOrganizationIdentifierSea]        NVARCHAR(60) NULL,
	[AccessibleFormatIndicatorCode]                                       NVARCHAR(50) NULL,
	[AccessibleFormatRequiredIndicatorCode]                               NVARCHAR(50) NULL,
	[AccessibleFormatTypeCode]                                            NVARCHAR(50) NULL,
  [LearningResourceIssuedDate]                                          DATE NULL,
  [LearningResourceOrderedDate]                                         DATE NULL,
  [LearningResourceReceivedDate]                                        DATE NULL,
  [CourseSectionStartDate]                                              DATE NULL,
  [CourseSectionEndDate]                                                DATE NULL,
  [DataCollectionName]                                                  NVARCHAR(100) NULL
)
