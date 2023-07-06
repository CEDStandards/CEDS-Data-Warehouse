CREATE TABLE [Staging].[K12StudentCourseSection] (
    [Id]                                             INT            IDENTITY (1, 1) NOT NULL,
    [StudentIdentifierState]                         NVARCHAR (40)  NULL,
    [LeaIdentifierSeaAccountability]                 NVARCHAR (50)  NULL,
    [LeaIdentifierSeaAttendance]                     NVARCHAR (50)  NULL,
    [LeaIdentifierSeaFunding]                        NVARCHAR (50)  NULL,
    [LeaIdentifierSeaGraduation]                     NVARCHAR (50)  NULL,
    [LeaIdentifierSeaIndividualizedEducationProgram] NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]                            NVARCHAR (50)  NULL,
    [CourseGradeLevel]                               VARCHAR (100)  NULL,
    [ScedCourseCode]                                 NVARCHAR (50)  NULL,
    [CourseRecordStartDateTime]                      DATETIME       NULL,
    [CourseLevelCharacteristic]                      NVARCHAR (50)  NULL,
    [EntryDate]                                      DATETIME       NULL,
    [ExitDate]                                       DATETIME       NULL,
    [SchoolYear]                                     SMALLINT       NULL,
    [RecordStartDateTime]                            DATETIME       NULL,
    [RecordEndDateTime]                              DATETIME       NULL,
    [DataCollectionName]                             NVARCHAR (100) NULL,
    [DataCollectionId]                               INT            NULL,
    [PersonId]                                       INT            NULL,
    [OrganizationID_LEA]                             INT            NULL,
    [OrganizationPersonRoleId_LEA]                   INT            NULL,
    [OrganizationID_School]                          INT            NULL,
    [OrganizationPersonRoleId_School]                INT            NULL,
    [OrganizationID_Course]                          INT            NULL,
    [OrganizationID_CourseSection]                   INT            NULL,
    [OrganizationPersonRoleId_CourseSection]         INT            NULL,
    [RunDateTime]                                    DATETIME       NULL,
    CONSTRAINT [PK_K12StudentCourseSection] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_K12StudentCourseSection_ScedCourseCode]
    ON [Staging].[K12StudentCourseSection]([ScedCourseCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_K12StudentCourseSection_DataCollectionName_WithIdentifiers]
    ON [Staging].[K12StudentCourseSection]([DataCollectionName] ASC)
    INCLUDE([StudentIdentifierState], [LeaIdentifierSeaAccountability], [LeaIdentifierSeaAttendance], [LeaIdentifierSeaFunding], [LeaIdentifierSeaGraduation], [LeaIdentifierSeaIndividualizedEducationProgram], [SchoolIdentifierSea]) WITH (FILLFACTOR = 80);


GO

