CREATE TABLE [RDS].[ReportK12PsProgramEffectiveness] (
    [ReportLevel]                       NVARCHAR (20)  NOT NULL,
    [ReportCode]                        NVARCHAR (20)  NOT NULL,
    [SchoolYear]                        SMALLINT       NOT NULL,
    [CategorySetCode]                   NVARCHAR (20)  NOT NULL,
    [IPEDSIdentifier]                   NVARCHAR (40)  NULL,
    [PsNameOfInstitution]               NVARCHAR (100) NULL,
    [K12OrganizationIdentifierSea]      NVARCHAR (40)  NULL,
    [K12OrganizationName]               NVARCHAR (100) NULL,
    [ReportMeasureLabel]                NVARCHAR (100) NULL,
    [ReportMeasure]                     NVARCHAR (MAX) NOT NULL,
    [Sex]                               NVARCHAR (10)  NULL,
    [RaceEthnicity]                     NVARCHAR (60)  NULL,
    [EconomicDisadvantageStatus]        NVARCHAR (10)  NULL,
    [IdeaIndicator]                     NVARCHAR (10)  NULL,
    [HomelessPrimaryNighttimeResidence] NVARCHAR (20)  NULL,
    [MigrantStatus]                     NVARCHAR (10)  NULL,
    [EnglishLearnerStatus]              NVARCHAR (10)  NULL
);


GO

