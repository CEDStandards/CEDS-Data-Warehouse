CREATE TABLE [RDS].[ToggleAssessments] (
    [ToggleAssessmentId]     INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentName]         NVARCHAR (100) NOT NULL,
    [AssessmentType]         NVARCHAR (200) NOT NULL,
    [AssessmentTypeCode]     NVARCHAR (100) NOT NULL,
    [EOG]                    NVARCHAR (50)  NOT NULL,
    [Grade]                  NVARCHAR (2)   NOT NULL,
    [PerformanceLevels]      NVARCHAR (2)   NOT NULL,
    [ProficientOrAboveLevel] NVARCHAR (2)   NOT NULL,
    [Subject]                NVARCHAR (50)  DEFAULT (N'') NOT NULL,
    CONSTRAINT [PK_ToggleAssessments] PRIMARY KEY CLUSTERED ([ToggleAssessmentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

