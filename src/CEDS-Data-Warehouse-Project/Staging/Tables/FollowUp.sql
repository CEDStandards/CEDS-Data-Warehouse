CREATE TABLE [Staging].[FollowUp] (
    [Id]                                             INT            IDENTITY (1, 1) NOT NULL,
    [SchoolYear]                                     SMALLINT       NULL,
    [StudentIdentifierState]                         NVARCHAR (40)  NULL,
    [LeaIdentifierSeaAccountability]                 NVARCHAR (50)  NULL,
    [LeaIdentifierSeaAttendance]                     NVARCHAR (50)  NULL,
    [LeaIdentifierSeaFunding]                        NVARCHAR (50)  NULL,
    [LeaIdentifierSeaGraduation]                     NVARCHAR (50)  NULL,
    [LeaIdentifierSeaIndividualizedEducationProgram] NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]                            NVARCHAR (50)  NULL,
    [IncidentIdentifier]                             NVARCHAR (40)  NULL,
    [IncidentDate]                                   DATE           NULL,
    [IncidentTime]                                   TIME (7)       NULL,
    [FollowUp]                                       NVARCHAR (100) NULL,
    [DataCollectionName]                             NVARCHAR (100) NULL,
    [RunDateTime]                                    DATETIME       NULL,
    CONSTRAINT [PK_FollowUp] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

