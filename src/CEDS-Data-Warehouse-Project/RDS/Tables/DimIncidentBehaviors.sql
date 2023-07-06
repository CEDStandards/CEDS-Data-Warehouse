CREATE TABLE [RDS].[DimIncidentBehaviors] (
    [DimIncidentBehaviorId]       INT            IDENTITY (1, 1) NOT NULL,
    [IncidentBehaviorCode]        NVARCHAR (100) NOT NULL,
    [IncidentBehaviorDescription] NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DimIncidentBehaviorId] PRIMARY KEY CLUSTERED ([DimIncidentBehaviorId] ASC)
);


GO

