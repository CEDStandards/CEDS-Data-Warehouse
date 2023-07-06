CREATE TABLE [Staging].[Disability] (
    [ID]                                                  INT            IDENTITY (1, 1) NOT NULL,
    [StudentIdentifierState]                              NVARCHAR (40)  NULL,
    [LeaIdentifierSeaAccountability]                      NVARCHAR (50)  NULL,
    [LeaIdentifierSeaAttendance]                          NVARCHAR (50)  NULL,
    [LeaIdentifierSeaFunding]                             NVARCHAR (50)  NULL,
    [LeaIdentifierSeaGraduation]                          NVARCHAR (50)  NULL,
    [LeaIdentifierSeaIndividualizedEducationProgram]      NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]                                 NVARCHAR (50)  NULL,
    [ResponsibleSchoolTypeAccountability]                 BIT            NULL,
    [ResponsibleSchoolTypeAttendance]                     BIT            NULL,
    [ResponsibleSchoolTypeFunding]                        BIT            NULL,
    [ResponsibleSchoolTypeGraduation]                     BIT            NULL,
    [ResponsibleSchoolTypeIndividualizedEducationProgram] BIT            NULL,
    [ResponsibleSchoolTypeTransportation]                 BIT            NULL,
    [ResponsibleSchoolTypeIepServiceProvider]             BIT            NULL,
    [DisabilityStatus]                                    BIT            NULL,
    [Disability_StatusStartDate]                          DATETIME       NULL,
    [Disability_StatusEndDate]                            DATETIME       NULL,
    [DisabilityConditionType]                             NVARCHAR (100) NULL,
    [DisabilityDeterminationSourceType]                   NVARCHAR (100) NULL,
    [Section504Status]                                    BIT            NULL,
    [SchoolYear]                                          SMALLINT       NULL,
    [DataCollectionName]                                  NVARCHAR (100) NULL,
    [RunDateTime]                                         DATETIME       NULL,
    CONSTRAINT [PK_Disability] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_Disability_WithIdentifiers]
    ON [Staging].[Disability]([DataCollectionName] ASC, [StudentIdentifierState] ASC, [LeaIdentifierSeaAccountability] ASC, [LeaIdentifierSeaAttendance] ASC, [LeaIdentifierSeaFunding] ASC, [LeaIdentifierSeaGraduation] ASC, [LeaIdentifierSeaIndividualizedEducationProgram] ASC, [SchoolIdentifierSea] ASC);


GO

