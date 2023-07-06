CREATE TABLE [Staging].[EarlyLearningChildOutcomeSummary] (
    [Id]                                             INT            IDENTITY (1, 1) NOT NULL,
    [SchoolYear]                                     SMALLINT       NULL,
    [StudentIdentifierState]                         NVARCHAR (40)  NULL,
    [LeaIdentifierSeaAccountability]                 NVARCHAR (50)  NULL,
    [LeaIdentifierSeaAttendance]                     NVARCHAR (50)  NULL,
    [LeaIdentifierSeaFunding]                        NVARCHAR (50)  NULL,
    [LeaIdentifierSeaGraduation]                     NVARCHAR (50)  NULL,
    [LeaIdentifierSeaIndividualizedEducationProgram] NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]                            NVARCHAR (50)  NULL,
    [COSRatingA]                                     NVARCHAR (100) NULL,
    [COSProgressAIndicator]                          BIT            NULL,
    [COSRatingB]                                     NVARCHAR (100) NULL,
    [COSProgressBIndicator]                          BIT            NULL,
    [COSRatingC]                                     NVARCHAR (100) NULL,
    [COSProgresscIndicator]                          BIT            NULL,
    [EarlyLearningOutcomeTimePoint]                  NVARCHAR (100) NULL,
    [EarlyLearningOutcomeDate]                       DATE           NULL,
    [DataCollectionName]                             NVARCHAR (100) NULL,
    CONSTRAINT [PK_EarlyLearningChildOutcomeSummary] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_EarlyLearningChildOutcomeSummary_DataCollectionName_ShoolYear_OutcomeDatePoint]
    ON [Staging].[EarlyLearningChildOutcomeSummary]([DataCollectionName] ASC, [SchoolYear] ASC, [EarlyLearningOutcomeDate] ASC, [EarlyLearningOutcomeTimePoint] ASC)
    INCLUDE([LeaIdentifierSeaAccountability], [LeaIdentifierSeaAttendance], [LeaIdentifierSeaFunding], [LeaIdentifierSeaGraduation], [SchoolIdentifierSea], [StudentIdentifierState]);


GO

