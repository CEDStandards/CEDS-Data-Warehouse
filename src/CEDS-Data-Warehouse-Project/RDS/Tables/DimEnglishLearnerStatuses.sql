CREATE TABLE [RDS].[DimEnglishLearnerStatuses] (
    [DimEnglishLearnerStatusId]              INT            IDENTITY (1, 1) NOT NULL,
    [EnglishLearnerStatusCode]               NVARCHAR (100) NOT NULL,
    [EnglishLearnerStatusDescription]        NVARCHAR (300) NOT NULL,
    [EnglishLearnerStatusEdFactsCode]        NVARCHAR (50)  NOT NULL,
    [PerkinsEnglishLearnerStatusCode]        NVARCHAR (100) NOT NULL,
    [PerkinsEnglishLearnerStatusDescription] NVARCHAR (300) NOT NULL,
    [PerkinsEnglishLearnerStatusEdfactsCode] VARCHAR (50)   NOT NULL,
    CONSTRAINT [PK_DimEnglistLearnerStatuses] PRIMARY KEY CLUSTERED ([DimEnglishLearnerStatusId] ASC)
);


GO

