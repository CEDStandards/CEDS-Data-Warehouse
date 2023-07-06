CREATE TABLE [RDS].[DimDisciplineStatuses] (
    [DimDisciplineStatusId]                                 INT            IDENTITY (1, 1) NOT NULL,
    [DisciplinaryActionTakenCode]                           NVARCHAR (50)  NULL,
    [DisciplinaryActionTakenDescription]                    NVARCHAR (200) NULL,
    [DisciplinaryActionTakenEdFactsCode]                    NVARCHAR (50)  NULL,
    [DisciplineMethodOfChildrenWithDisabilitiesCode]        NVARCHAR (50)  NULL,
    [DisciplineMethodOfChildrenWithDisabilitiesDescription] NVARCHAR (200) NULL,
    [DisciplineMethodOfChildrenWithDisabilitiesEdFactsCode] NVARCHAR (50)  NULL,
    [EducationalServicesAfterRemovalCode]                   NVARCHAR (50)  NULL,
    [EducationalServicesAfterRemovalDescription]            NVARCHAR (200) NULL,
    [EducationalServicesAfterRemovalEdFactsCode]            NVARCHAR (50)  NULL,
    [IdeaInterimRemovalReasonCode]                          NVARCHAR (50)  NULL,
    [IdeaInterimRemovalReasonDescription]                   NVARCHAR (200) NULL,
    [IdeaInterimRemovalReasonEdFactsCode]                   NVARCHAR (50)  NULL,
    [IdeaInterimRemovalCode]                                NVARCHAR (50)  NULL,
    [IdeaInterimRemovalDescription]                         NVARCHAR (200) NULL,
    [IdeaInterimRemovalEdFactsCode]                         NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimDisciplineStatuses] PRIMARY KEY CLUSTERED ([DimDisciplineStatusId] ASC) WITH (FILLFACTOR = 80)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimDisciplineStatuses_RemovalTypeEdFactsCode]
    ON [RDS].[DimDisciplineStatuses]([IdeaInterimRemovalEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimDisciplineStatuses_DisciplineActionEdFactsCode]
    ON [RDS].[DimDisciplineStatuses]([DisciplinaryActionTakenEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimDisciplineStatuses_EducationalServicesEdFactsCode]
    ON [RDS].[DimDisciplineStatuses]([EducationalServicesAfterRemovalEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimDisciplineStatuses_Codes]
    ON [RDS].[DimDisciplineStatuses]([DisciplinaryActionTakenCode] ASC, [DisciplineMethodOfChildrenWithDisabilitiesCode] ASC, [EducationalServicesAfterRemovalCode] ASC, [IdeaInterimRemovalCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimDisciplineStatuses_DisciplineMethodEdFactsCode]
    ON [RDS].[DimDisciplineStatuses]([DisciplineMethodOfChildrenWithDisabilitiesEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

