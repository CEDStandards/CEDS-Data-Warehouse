CREATE TABLE [RDS].[DimFosterCareStatuses] (
    [DimFosterCareStatusId]                     INT            IDENTITY (1, 1) NOT NULL,
    [ProgramParticipationFosterCareCode]        NVARCHAR (50)  CONSTRAINT [DF_DimFosterCareStatuses_ProgramParticipationFosterCareCode] DEFAULT ('MISSING') NOT NULL,
    [ProgramParticipationFosterCareDescription] NVARCHAR (200) CONSTRAINT [DF_DimFosterCareStatuses_ProgramParticipationFosterCareDescription] DEFAULT ('MISSING') NOT NULL,
    [ProgramParticipationFosterCareEdFactsCode] NVARCHAR (50)  CONSTRAINT [DF_DimFosterCareStatuses_ProgramParticipationFosterCareEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimFosterCareStatuses] PRIMARY KEY NONCLUSTERED ([DimFosterCareStatusId] ASC)
);


GO

