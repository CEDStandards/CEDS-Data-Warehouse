CREATE TABLE [Staging].[IndividualizedProgram] (
    [Id]                                               INT            IDENTITY (1, 1) NOT NULL,
    [SchoolYear]                                       SMALLINT       NULL,
    [StudentIdentifierState]                           NVARCHAR (40)  NULL,
    [LeaIdentifierSeaAccountability]                   NVARCHAR (50)  NULL,
    [LeaIdentifierSeaAttendance]                       NVARCHAR (50)  NULL,
    [LeaIdentifierSeaFunding]                          NVARCHAR (50)  NULL,
    [LeaIdentifierSeaGraduation]                       NVARCHAR (50)  NULL,
    [LeaIdentifierSeaIndividualizedEducationProgram]   NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]                              NVARCHAR (50)  NULL,
    [IndividualizedProgramServicePlanDate]             DATE           NULL,
    [IndividualizedProgramServicePlanReevaluationDate] DATE           NULL,
    [IndividualizedProgramServicePlanEndDate]          DATE           NULL,
    [IndividualizedProgramDate]                        DATE           NULL,
    [EligibilityEvaluationDateInitial]                 DATE           NULL,
    [StudentSupportServiceType]                        NVARCHAR (100) NULL,
    [ConsentToEvaluationDate]                          DATE           NULL,
    [ConsentToEvaluationIndicator]                     BIT            NULL,
    [IndividualizedProgramType]                        NVARCHAR (100) NULL,
    [DataCollectionName]                               NVARCHAR (100) NULL,
    CONSTRAINT [PK_IndividualizedProgram] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_IndividualizedProgram_DataCollectionName_SchoolYear]
    ON [Staging].[IndividualizedProgram]([DataCollectionName] ASC, [SchoolYear] ASC)
    INCLUDE([ConsentToEvaluationDate], [EligibilityEvaluationDateInitial], [IndividualizedProgramDate], [IndividualizedProgramServicePlanDate], [IndividualizedProgramServicePlanEndDate], [IndividualizedProgramServicePlanReevaluationDate], [SchoolIdentifierSea], [StudentIdentifierState]);


GO

