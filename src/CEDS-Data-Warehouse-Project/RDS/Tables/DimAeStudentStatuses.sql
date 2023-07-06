CREATE TABLE [RDS].[DimAeStudentStatuses] (
    [DimAeStudentStatusId]                                                          INT            IDENTITY (1, 1) NOT NULL,
    [AeFunctioningLevelAtIntakeCode]                                                NVARCHAR (50)  NULL,
    [AeFunctioningLevelAtIntakeDescription]                                         NVARCHAR (150) NULL,
    [AeFunctioningLevelAtPosttestCode]                                              NVARCHAR (50)  NULL,
    [AeFunctioningLevelAtPosttestDescription]                                       NVARCHAR (150) NULL,
    [AePostsecondaryTransitionActionCode]                                           NVARCHAR (50)  NULL,
    [AePostsecondaryTransitionActionDescription]                                    NVARCHAR (150) NULL,
    [EmployedWhileEnrolledCode]                                                     NVARCHAR (50)  NULL,
    [EmployedWhileEnrolledDescription]                                              NVARCHAR (150) NULL,
    [EmployedAfterExitCode]                                                         NVARCHAR (50)  NULL,
    [EmployedAfterExitDescription]                                                  NVARCHAR (150) NULL,
    [AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode]        NVARCHAR (50)  NULL,
    [AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription] NVARCHAR (150) NULL,
    [AdultEducationCredentialAttainmentEmployedIndicatorCode]                       NVARCHAR (50)  NULL,
    [AdultEducationCredentialAttainmentEmployedIndicatorDescription]                NVARCHAR (150) NULL,
    [AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode]        NVARCHAR (50)  NULL,
    [AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription] NVARCHAR (150) NULL,
    CONSTRAINT [PK_DimAeStudentStatuses] PRIMARY KEY CLUSTERED ([DimAeStudentStatusId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAeStudentStatuses_Codes]
    ON [RDS].[DimAeStudentStatuses]([AeFunctioningLevelAtIntakeCode] ASC, [AeFunctioningLevelAtPosttestCode] ASC, [AePostsecondaryTransitionActionCode] ASC, [EmployedWhileEnrolledCode] ASC, [EmployedAfterExitCode] ASC, [AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode] ASC, [AdultEducationCredentialAttainmentEmployedIndicatorCode] ASC, [AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode] ASC);


GO

