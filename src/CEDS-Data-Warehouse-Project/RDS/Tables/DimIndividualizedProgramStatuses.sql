CREATE TABLE [RDS].[DimIndividualizedProgramStatuses] (
    [DimIndividualizedProgramStatusId]        INT            IDENTITY (1, 1) NOT NULL,
    [IndividualizedProgramTypeCode]           NVARCHAR (100) NOT NULL,
    [IndividualizedProgramTypeDescription]    NVARCHAR (300) NOT NULL,
    [StudentSupportServiceTypeCode]           NVARCHAR (100) NOT NULL,
    [StudentSupportServiceTypeDescription]    NVARCHAR (300) NOT NULL,
    [ConsentToEvaluationIndicatorCode]        NVARCHAR (100) NOT NULL,
    [ConsentToEvaluationIndicatorDescription] NVARCHAR (300) NOT NULL,
    CONSTRAINT [PK_DimIndividualizedProgramStatusId] PRIMARY KEY CLUSTERED ([DimIndividualizedProgramStatusId] ASC)
);


GO

