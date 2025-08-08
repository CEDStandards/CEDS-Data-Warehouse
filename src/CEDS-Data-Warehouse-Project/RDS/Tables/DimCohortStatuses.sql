CREATE TABLE [RDS].[DimCohortStatuses] (
    [DimCohortStatusId]       INT           IDENTITY (1, 1) NOT NULL,
    [EdFactsCohortGraduationStatusCode]        VARCHAR (50)  CONSTRAINT [DF_DimCohortStatuses_EdFactsCohortGraduationStatusCode] DEFAULT ('MISSING') NOT NULL,
    [EdFactsCohortGraduationStatusDescription] VARCHAR (200) CONSTRAINT [DF_DimCohortStatuses_EdFactsCohortGraduationStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [EdFactsCohortGraduationStatusEdFactsCode] VARCHAR (50)  CONSTRAINT [DF_DimCohortStatuses_EdFactsCohortGraduationStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimCohortStatus] PRIMARY KEY CLUSTERED ([DimCohortStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimCohortStatuses_EdFactsCohortGraduationStatusCode]
    ON [RDS].[DimCohortStatuses]([EdFactsCohortGraduationStatusCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

