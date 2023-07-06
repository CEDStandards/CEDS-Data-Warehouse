CREATE TABLE [RDS].[DimIncidentStatuses] (
    [DimIncidentStatusId]                 INT            IDENTITY (1, 1) NOT NULL,
    [IncidentBehaviorCode]                NVARCHAR (100) NOT NULL,
    [IncidentBehaviorDescription]         NVARCHAR (300) NOT NULL,
    [IdeaInterimRemovalReasonCode]        NVARCHAR (100) NOT NULL,
    [IdeaInterimRemovalReasonDescription] NVARCHAR (300) NOT NULL,
    [IdeaInterimRemovalReasonEdFactsCode] NVARCHAR (50)  NOT NULL,
    [DisciplineReasonCode]                NVARCHAR (100) NOT NULL,
    [DisciplineReasonDescription]         NVARCHAR (300) NOT NULL,
    [IncidentInjuryTypeCode]              NVARCHAR (100) NOT NULL,
    [IncidentInjuryTypeDescription]       NVARCHAR (300) NOT NULL,
    CONSTRAINT [PK_DimIncidentStatuses] PRIMARY KEY CLUSTERED ([DimIncidentStatusId] ASC)
);


GO

