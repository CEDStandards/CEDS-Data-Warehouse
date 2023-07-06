CREATE TABLE [RDS].[DimAssessmentForms] (
    [DimAssessmentFormId]  INT           IDENTITY (1, 1) NOT NULL,
    [AssessmentFormNumber] NVARCHAR (30) NOT NULL,
    CONSTRAINT [PK_DimAssessmentFormId] PRIMARY KEY CLUSTERED ([DimAssessmentFormId] ASC) WITH (FILLFACTOR = 80)
);


GO

