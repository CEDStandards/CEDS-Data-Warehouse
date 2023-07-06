CREATE TABLE [RDS].[DimPsInstitutionStatuses] (
    [DimPsInstitutionStatusId]                   INT            IDENTITY (1, 1) NOT NULL,
    [LevelOfInstitutionCode]                     NVARCHAR (50)  NOT NULL,
    [LevelOfInstitutionDescription]              NVARCHAR (200) NOT NULL,
    [ControlOfInstitutionCode]                   NVARCHAR (50)  NOT NULL,
    [ControlOfInstitutionDescription]            NVARCHAR (200) NOT NULL,
    [VirtualIndicatorCode]                       NVARCHAR (50)  NOT NULL,
    [VirtualIndicatorDescription]                NVARCHAR (200) NOT NULL,
    [CarnegieBasicClassificationCode]            NVARCHAR (50)  NOT NULL,
    [CarnegieBasicClassificationDescription]     NVARCHAR (200) NOT NULL,
    [MostPrevalentLevelOfInstitutionCode]        NVARCHAR (50)  NOT NULL,
    [MostPrevalentLevelOfInstitutionDescription] NVARCHAR (200) NOT NULL,
    [PredominantCalendarSystemCode]              NVARCHAR (50)  NOT NULL,
    [PredominantCalendarSystemDescription]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DimPsInstitutionStatuses] PRIMARY KEY CLUSTERED ([DimPsInstitutionStatusId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsInstitutionStatuses_CarnegieBasicClassificationCode]
    ON [RDS].[DimPsInstitutionStatuses]([CarnegieBasicClassificationCode] ASC)
    INCLUDE([ControlOfInstitutionCode], [LevelOfInstitutionCode], [MostPrevalentLevelOfInstitutionCode], [PredominantCalendarSystemCode]);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsInstitutionStatuses_Codes]
    ON [RDS].[DimPsInstitutionStatuses]([LevelOfInstitutionCode] ASC, [ControlOfInstitutionCode] ASC, [CarnegieBasicClassificationCode] ASC, [MostPrevalentLevelOfInstitutionCode] ASC, [PredominantCalendarSystemCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsInstitutionStatuses_MostPrevalentLevelOfInsitutionCode]
    ON [RDS].[DimPsInstitutionStatuses]([MostPrevalentLevelOfInstitutionCode] ASC);


GO

