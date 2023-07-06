CREATE TABLE [RDS].[DimImmigrantStatuses] (
    [DimImmigrantStatusId]                            INT            IDENTITY (1, 1) NOT NULL,
    [TitleIIIImmigrantStatusCode]                     NVARCHAR (100) NOT NULL,
    [TitleIIIImmigrantStatusDescription]              NVARCHAR (300) NOT NULL,
    [TitleIIIImmigrantStatusEdFactsCode]              NVARCHAR (50)  NOT NULL,
    [TitleIIIImmigrantParticipationStatusCode]        NVARCHAR (100) NOT NULL,
    [TitleIIIImmigrantParticipationStatusDescription] NVARCHAR (300) NOT NULL,
    [TitleIIIImmigrantParticipationStatusEdFactsCode] NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_DimImmigrantStatuses] PRIMARY KEY CLUSTERED ([DimImmigrantStatusId] ASC)
);


GO

