CREATE TABLE [RDS].[tmp_ms_xx_ReportPsAttainment] (
    [ReportLevel]                     NVARCHAR (20)  NOT NULL,
    [ReportCode]                      NVARCHAR (20)  NOT NULL,
    [SchoolYear]                      SMALLINT       NULL,
    [CategorySetCode]                 NVARCHAR (20)  NOT NULL,
    [IPEDSIdentifier]                 NVARCHAR (40)  NULL,
    [PsInstitutionName]               NVARCHAR (100) NULL,
    [ReportMeasureLabel]              NVARCHAR (100) NULL,
    [ReportMeasure]                   NVARCHAR (MAX) NOT NULL,
    [AcademicAwardYear]               SMALLINT       NULL,
    [AgeRange]                        NVARCHAR (20)  NULL,
    [CumulativeCreditsEarnedRange]    NVARCHAR (20)  NULL,
    [Earned24CreditsFirst12Months]    NVARCHAR (20)  NULL,
    [EconomicDisadvantageStatus]      NVARCHAR (20)  NULL,
    [EnglishLearnerStatus]            NVARCHAR (20)  NULL,
    [EnrolledFirstToSecondFall]       NVARCHAR (20)  NULL,
    [HomelessnessStatus]              NVARCHAR (20)  NULL,
    [IdeaIndicator]                   NVARCHAR (20)  NULL,
    [MigrantStatus]                   NVARCHAR (20)  NULL,
    [MostPrevalentLevelOfInstitution] NVARCHAR (20)  NULL,
    [PescAwardLevelTypeDescription]   NVARCHAR (100) NULL,
    [RaceEthnicity]                   NVARCHAR (60)  NULL,
    [RemedialSession]                 NVARCHAR (20)  NULL,
    [Sex]                             NVARCHAR (20)  NULL,
    [SchoolYearExitedFromHS]          SMALLINT       NULL
)
WITH (DATA_COMPRESSION = PAGE);


GO

