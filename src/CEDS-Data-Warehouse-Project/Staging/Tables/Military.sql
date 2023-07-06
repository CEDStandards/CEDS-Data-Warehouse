CREATE TABLE [Staging].[Military] (
    [Id]                                             INT            IDENTITY (1, 1) NOT NULL,
    [SchoolYear]                                     SMALLINT       NULL,
    [LeaIdentifierSeaAccountability]                 NVARCHAR (50)  NULL,
    [LeaIdentifierSeaAttendance]                     NVARCHAR (50)  NULL,
    [LeaIdentifierSeaFunding]                        NVARCHAR (50)  NULL,
    [LeaIdentifierSeaGraduation]                     NVARCHAR (50)  NULL,
    [LeaIdentifierSeaIndividualizedEducationProgram] NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]                            NVARCHAR (50)  NULL,
    [StudentIdentifierState]                         NVARCHAR (40)  NULL,
    [MilitaryActiveStudentIndicator]                 NVARCHAR (100) NULL,
    [MilitaryBranch]                                 NVARCHAR (100) NULL,
    [MilitaryVeteranStudentIndicator]                NVARCHAR (100) NULL,
    [DataCollectionName]                             NVARCHAR (100) NULL,
    [RunDateTime]                                    DATETIME       NULL,
    CONSTRAINT [PK_Mlitary] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

