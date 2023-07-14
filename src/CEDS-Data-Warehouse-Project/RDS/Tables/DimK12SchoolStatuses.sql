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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'MagnetOrSpecialProgramEmphasisSchoolCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A school that has been designed: 1) to attract students of different racial/ethnic backgrounds for the purpose of reducing, preventing, or eliminating racial isolation; and/or 2)to provide an academic or social focus on a particular theme (e.g., science/math, performing arts, gifted/talented, career academy or foreign language).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'MagnetOrSpecialProgramEmphasisSchoolCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Magnet or Special Program Emphasis School' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'MagnetOrSpecialProgramEmphasisSchoolCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000181' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'MagnetOrSpecialProgramEmphasisSchoolCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21181' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'MagnetOrSpecialProgramEmphasisSchoolCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'MagnetOrSpecialProgramEmphasisSchoolDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A school that has been designed: 1) to attract students of different racial/ethnic backgrounds for the purpose of reducing, preventing, or eliminating racial isolation; and/or 2)to provide an academic or social focus on a particular theme (e.g., science/math, performing arts, gifted/talented, career academy or foreign language).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'MagnetOrSpecialProgramEmphasisSchoolDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Magnet or Special Program Emphasis School' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'MagnetOrSpecialProgramEmphasisSchoolDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000181' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'MagnetOrSpecialProgramEmphasisSchoolDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21181' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'MagnetOrSpecialProgramEmphasisSchoolDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'MagnetOrSpecialProgramEmphasisSchoolEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A school that has been designed: 1) to attract students of different racial/ethnic backgrounds for the purpose of reducing, preventing, or eliminating racial isolation; and/or 2)to provide an academic or social focus on a particular theme (e.g., science/math, performing arts, gifted/talented, career academy or foreign language).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'MagnetOrSpecialProgramEmphasisSchoolEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Magnet or Special Program Emphasis School' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'MagnetOrSpecialProgramEmphasisSchoolEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000181' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'MagnetOrSpecialProgramEmphasisSchoolEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21181' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'MagnetOrSpecialProgramEmphasisSchoolEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'NslpStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The classification of participation by a school in the National School Lunch Program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'NslpStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'National School Lunch Program Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'NslpStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001767' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'NslpStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22748' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'NslpStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'NslpStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The classification of participation by a school in the National School Lunch Program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'NslpStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'National School Lunch Program Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'NslpStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001767' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'NslpStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22748' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'NslpStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'NslpStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The classification of participation by a school in the National School Lunch Program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'NslpStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'National School Lunch Program Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'NslpStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001767' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'NslpStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22748' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'NslpStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'PersistentlyDangerousStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school is identified as persistently dangerous in accordance with state definition.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'PersistentlyDangerousStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Persistently Dangerous Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'PersistentlyDangerousStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000210' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'PersistentlyDangerousStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21210' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'PersistentlyDangerousStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'PersistentlyDangerousStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school is identified as persistently dangerous in accordance with state definition.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'PersistentlyDangerousStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Persistently Dangerous Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'PersistentlyDangerousStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000210' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'PersistentlyDangerousStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21210' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'PersistentlyDangerousStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'PersistentlyDangerousStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school is identified as persistently dangerous in accordance with state definition.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'PersistentlyDangerousStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Persistently Dangerous Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'PersistentlyDangerousStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000210' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'PersistentlyDangerousStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21210' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'PersistentlyDangerousStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category used to report the school''s performance on the progress of achieving the English language proficiency indicator.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Progress Achieving English Language Proficiency Indicator Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001915' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22896' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category used to report the school''s performance on the progress of achieving the English language proficiency indicator.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Progress Achieving English Language Proficiency Indicator Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001915' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22896' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category used to report the school''s performance on the progress of achieving the English language proficiency indicator.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Progress Achieving English Language Proficiency Indicator Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001915' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22896' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SchoolImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the improvement stage of the school.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SchoolImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Improvement Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SchoolImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000240' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SchoolImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21240' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SchoolImprovementStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SchoolImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the improvement stage of the school.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SchoolImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Improvement Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SchoolImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000240' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SchoolImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21240' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SchoolImprovementStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SchoolImprovementStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the improvement stage of the school.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SchoolImprovementStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Improvement Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SchoolImprovementStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000240' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SchoolImprovementStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21240' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SchoolImprovementStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SharedTimeIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a school offers career and technical education or other educational services in which some or all students are enrolled at a separate school of record and attend the shared-time school on a part-time basis.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SharedTimeIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Shared Time Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SharedTimeIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000257' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SharedTimeIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21257' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SharedTimeIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SharedTimeIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a school offers career and technical education or other educational services in which some or all students are enrolled at a separate school of record and attend the shared-time school on a part-time basis.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SharedTimeIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Shared Time Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SharedTimeIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000257' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SharedTimeIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21257' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SharedTimeIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SharedTimeIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a school offers career and technical education or other educational services in which some or all students are enrolled at a separate school of record and attend the shared-time school on a part-time basis.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SharedTimeIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Shared Time Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SharedTimeIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000257' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SharedTimeIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21257' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'SharedTimeIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'StatePovertyDesignationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The designation of a school’s poverty quartile for purposes of determining classes taught by highly qualified teachers in high and low poverty schools, according to state’s indicator of poverty.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'StatePovertyDesignationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Poverty Designation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'StatePovertyDesignationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000585' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'StatePovertyDesignationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21578' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'StatePovertyDesignationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'StatePovertyDesignationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The designation of a school’s poverty quartile for purposes of determining classes taught by highly qualified teachers in high and low poverty schools, according to state’s indicator of poverty.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'StatePovertyDesignationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Poverty Designation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'StatePovertyDesignationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000585' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'StatePovertyDesignationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21578' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'StatePovertyDesignationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'StatePovertyDesignationEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The designation of a school’s poverty quartile for purposes of determining classes taught by highly qualified teachers in high and low poverty schools, according to state’s indicator of poverty.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'StatePovertyDesignationEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Poverty Designation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'StatePovertyDesignationEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000585' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'StatePovertyDesignationEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21578' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'StatePovertyDesignationEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'VirtualSchoolStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the extent to which a school offers instruction in which students and teachers are separated by time and/or location, and interaction occurs via computers and/or telecommunications technologies.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'VirtualSchoolStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Virtual School Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'VirtualSchoolStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001766' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'VirtualSchoolStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22747' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'VirtualSchoolStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'VirtualSchoolStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the extent to which a school offers instruction in which students and teachers are separated by time and/or location, and interaction occurs via computers and/or telecommunications technologies.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'VirtualSchoolStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Virtual School Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'VirtualSchoolStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001766' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'VirtualSchoolStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22747' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'VirtualSchoolStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'VirtualSchoolStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the extent to which a school offers instruction in which students and teachers are separated by time and/or location, and interaction occurs via computers and/or telecommunications technologies.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'VirtualSchoolStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Virtual School Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'VirtualSchoolStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001766' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'VirtualSchoolStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22747' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12SchoolStatuses', @level2type=N'COLUMN',@level2name=N'VirtualSchoolStatusEdFactsCode';
GO