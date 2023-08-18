CREATE TABLE [RDS].[DimFosterCareStatuses] (
    [DimFosterCareStatusId]                     INT            IDENTITY (1, 1) NOT NULL,
    [ProgramParticipationFosterCareCode]        NVARCHAR (50)  NULL,
    [ProgramParticipationFosterCareDescription] NVARCHAR (200) NULL,
    [ProgramParticipationFosterCareEdFactsCode] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimFosterCareStatuses] PRIMARY KEY NONCLUSTERED ([DimFosterCareStatusId] ASC)
);


GO

