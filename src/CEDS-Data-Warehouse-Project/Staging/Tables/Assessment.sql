CREATE TABLE [Staging].[Assessment] (
    [Id]                                                   INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentIdentifier]                                 VARCHAR (50)   NULL,
    [AssessmentTitle]                                      VARCHAR (100)  NULL,
    [AssessmentShortName]                                  VARCHAR (100)  NULL,
    [AssessmentAcademicSubject]                            VARCHAR (100)  NULL,
    [AssessmentPurpose]                                    VARCHAR (100)  NULL,
    [AssessmentType]                                       VARCHAR (100)  NULL,
    [AssessmentTypeAdministeredToChildrenWithDisabilities] VARCHAR (100)  NULL,
    [AssessmentFamilyTitle]                                VARCHAR (100)  NULL,
    [AssessmentFamilyShortName]                            VARCHAR (100)  NULL,
    [AssessmentAdministrationStartDate]                    DATE           NULL,
    [AssessmentAdministrationFinishDate]                   DATE           NULL,
    [AssessmentPerformanceLevelIdentifier]                 VARCHAR (100)  NULL,
    [AssessmentPerformanceLevelLabel]                      VARCHAR (100)  NULL,
    [AssessmentTypeAdministeredToEnglishLearners]          VARCHAR (100)  NULL,
    [DataCollectionName]                                   NVARCHAR (100) NULL,
    [DataCollectionId]                                     INT            NULL,
    [AssessmentId]                                         INT            NULL,
    [AssessmentAdministrationId]                           INT            NULL,
    [AssessmentSubtestId]                                  INT            NULL,
    [AssessmentFormId]                                     INT            NULL,
    [AssessmentPerformanceLevelId]                         INT            NULL,
    [RunDateTime]                                          DATETIME       NULL,
    CONSTRAINT [PK_Assessment] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

