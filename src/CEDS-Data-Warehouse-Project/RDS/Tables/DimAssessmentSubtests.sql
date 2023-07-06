CREATE TABLE [RDS].[DimAssessmentSubtests] (
    [DimAssessmentSubtestId]                     INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentFormNumber]                       NVARCHAR (30)  NULL,
    [AssessmentAcademicSubjectCode]              NVARCHAR (100) NOT NULL,
    [AssessmentAcademicSubjectDescription]       NVARCHAR (400) NOT NULL,
    [AssessmentSubtestIdentifierInternal]        NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestTitle]                     NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestAbbreviation]              NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestDescription]               NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestVersion]                   NVARCHAR (40)  NOT NULL,
    [AssessmentLevelForWhichDesigned]            NVARCHAR (40)  NOT NULL,
    [AssessmentEarlyLearningDevelopmentalDomain] NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestPublishedDate]             DATETIME       NULL,
    [AssessmentSubtestMinimumValue]              NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestMaximumValue]              NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestScaleOptimalValue]         NVARCHAR (40)  NOT NULL,
    [AssessmentContentStandardType]              NVARCHAR (40)  NOT NULL,
    [AssessmentPurpose]                          NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestRules]                     NVARCHAR (40)  NOT NULL,
    [AssessmentFormSubtestTier]                  NVARCHAR (40)  NOT NULL,
    [AssessmentFormSubtestContainerOnly]         NVARCHAR (40)  NOT NULL,
    CONSTRAINT [PK_DimAssessmentSubtests] PRIMARY KEY CLUSTERED ([DimAssessmentSubtestId] ASC)
);


GO

