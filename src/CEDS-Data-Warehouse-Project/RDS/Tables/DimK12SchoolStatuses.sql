CREATE TABLE [RDS].[DimK12SchoolStatuses] (
    [DimK12SchoolStatusId]                                                INT            IDENTITY (1, 1) NOT NULL,
    [MagnetOrSpecialProgramEmphasisSchoolCode]                            NVARCHAR (50)  NULL,
    [MagnetOrSpecialProgramEmphasisSchoolDescription]                     NVARCHAR (200) NULL,
    [MagnetOrSpecialProgramEmphasisSchoolEdFactsCode]                     NVARCHAR (50)  NULL,
    [NslpStatusCode]                                                      NVARCHAR (50)  NULL,
    [NslpStatusDescription]                                               NVARCHAR (200) NULL,
    [NslpStatusEdFactsCode]                                               NVARCHAR (50)  NULL,
    [SharedTimeIndicatorCode]                                             NVARCHAR (50)  NULL,
    [SharedTimeIndicatorDescription]                                      NVARCHAR (200) NULL,
    [SharedTimeIndicatorEdFactsCode]                                      NVARCHAR (50)  NULL,
    [VirtualSchoolStatusCode]                                             NVARCHAR (50)  NULL,
    [VirtualSchoolStatusDescription]                                      NVARCHAR (200) NULL,
    [VirtualSchoolStatusEdFactsCode]                                      NVARCHAR (50)  NULL,
    [SchoolImprovementStatusCode]                                         NVARCHAR (50)  NULL,
    [SchoolImprovementStatusDescription]                                  NVARCHAR (200) NULL,
    [SchoolImprovementStatusEdFactsCode]                                  NVARCHAR (50)  NULL,
    [PersistentlyDangerousStatusCode]                                     NVARCHAR (50)  NULL,
    [PersistentlyDangerousStatusDescription]                              NVARCHAR (200) NULL,
    [PersistentlyDangerousStatusEdFactsCode]                              NVARCHAR (50)  NULL,
    [StatePovertyDesignationCode]                                         NVARCHAR (50)  NULL,
    [StatePovertyDesignationDescription]                                  NVARCHAR (200) NULL,
    [StatePovertyDesignationEdFactsCode]                                  NVARCHAR (50)  NULL,
    [ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode]        NVARCHAR (50)  NULL,
    [ProgressAchievingEnglishLanguageProficiencyIndicatorTypeDescription] NVARCHAR (200) NULL,
    [ProgressAchievingEnglishLanguageProficiencyIndicatorTypeEdFactsCode] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimSchoolStatuses] PRIMARY KEY CLUSTERED ([DimK12SchoolStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStatuses_NslpStatusEdFactsCode]
    ON [RDS].[DimK12SchoolStatuses]([NslpStatusEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStatuses_MagnetOrSpecialProgramEmphasisSchoolEdFactsCode]
    ON [RDS].[DimK12SchoolStatuses]([MagnetOrSpecialProgramEmphasisSchoolEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStatuses_StatePovertyDesignationEdFactsCode]
    ON [RDS].[DimK12SchoolStatuses]([StatePovertyDesignationEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStatuses_VirtualSchoolStatusEdFactsCode]
    ON [RDS].[DimK12SchoolStatuses]([VirtualSchoolStatusEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStatuses_SharedTimeIndicatorEdFactsCode]
    ON [RDS].[DimK12SchoolStatuses]([SharedTimeIndicatorEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

