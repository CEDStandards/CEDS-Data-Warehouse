CREATE TABLE [Staging].[PsInstitution] (
    [Id]                                  INT            IDENTITY (1, 1) NOT NULL,
    [OrganizationName]                    VARCHAR (200)  NULL,
    [InstitutionIpedsUnitId]              NVARCHAR (50)  NULL,
    [Website]                             VARCHAR (300)  NULL,
    [OrganizationOperationalStatus]       VARCHAR (100)  NULL,
    [OperationalStatusEffectiveDate]      DATETIME       NULL,
    [MostPrevalentLevelOfInstitutionCode] NVARCHAR (50)  NULL,
    [PredominantCalendarSystem]           VARCHAR (100)  NULL,
    [SchoolYear]                          SMALLINT       NULL,
    [DataCollectionName]                  NVARCHAR (100) NULL,
    [RecordStartDateTime]                 DATETIME       NULL,
    [RecordEndDateTime]                   DATETIME       NULL,
    [OrganizationId]                      INT            NULL,
    [OrganizationOperationalStatusId]     INT            NULL,
    [OperationalStatusId]                 INT            NULL,
    [MostPrevalentLevelOfInstitutionId]   INT            NULL,
    [PredominantCalendarSystemId]         INT            NULL,
    CONSTRAINT [PK_PsInstitution] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_PsInstitution_DataCollectionName_SchoollYear_InstitutionIpedsUnitId]
    ON [Staging].[PsInstitution]([DataCollectionName] ASC, [SchoolYear] ASC, [InstitutionIpedsUnitId] ASC)
    INCLUDE([MostPrevalentLevelOfInstitutionCode]);


GO

