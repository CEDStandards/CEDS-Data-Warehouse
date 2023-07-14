CREATE TABLE [RDS].[DimPsInstitutionStatuses] (
    [DimPsInstitutionStatusId]                   INT            IDENTITY (1, 1) NOT NULL,
    [LevelOfInstitutionCode]                     NVARCHAR (50)  NOT NULL,
    [LevelOfInstitutionDescription]              NVARCHAR (200) NOT NULL,
    [ControlOfInstitutionCode]                   NVARCHAR (50)  NOT NULL,
    [ControlOfInstitutionDescription]            NVARCHAR (200) NOT NULL,
    [VirtualIndicatorCode]                       NVARCHAR (50)  NOT NULL,
    [VirtualIndicatorDescription]                NVARCHAR (200) NOT NULL,
    [CarnegieBasicClassificationCode]            NVARCHAR (50)  NOT NULL,
    [CarnegieBasicClassificationDescription]     NVARCHAR (200) NOT NULL,
    [MostPrevalentLevelOfInstitutionCode]        NVARCHAR (50)  NOT NULL,
    [MostPrevalentLevelOfInstitutionDescription] NVARCHAR (200) NOT NULL,
    [PredominantCalendarSystemCode]              NVARCHAR (50)  NOT NULL,
    [PredominantCalendarSystemDescription]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DimPsInstitutionStatuses] PRIMARY KEY CLUSTERED ([DimPsInstitutionStatusId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsInstitutionStatuses_CarnegieBasicClassificationCode]
    ON [RDS].[DimPsInstitutionStatuses]([CarnegieBasicClassificationCode] ASC)
    INCLUDE([ControlOfInstitutionCode], [LevelOfInstitutionCode], [MostPrevalentLevelOfInstitutionCode], [PredominantCalendarSystemCode]);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsInstitutionStatuses_Codes]
    ON [RDS].[DimPsInstitutionStatuses]([LevelOfInstitutionCode] ASC, [ControlOfInstitutionCode] ASC, [CarnegieBasicClassificationCode] ASC, [MostPrevalentLevelOfInstitutionCode] ASC, [PredominantCalendarSystemCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsInstitutionStatuses_MostPrevalentLevelOfInsitutionCode]
    ON [RDS].[DimPsInstitutionStatuses]([MostPrevalentLevelOfInstitutionCode] ASC);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'CarnegieBasicClassificationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The Basic Classification is an update of the traditional classification framework developed by the Carnegie Commission on Higher Education in 1970 to support its research program, and later published in 1973 for use by other researchers.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'CarnegieBasicClassificationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Carnegie Basic Classification' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'CarnegieBasicClassificationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000038' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'CarnegieBasicClassificationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21038' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'CarnegieBasicClassificationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'CarnegieBasicClassificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The Basic Classification is an update of the traditional classification framework developed by the Carnegie Commission on Higher Education in 1970 to support its research program, and later published in 1973 for use by other researchers.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'CarnegieBasicClassificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Carnegie Basic Classification' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'CarnegieBasicClassificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000038' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'CarnegieBasicClassificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21038' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'CarnegieBasicClassificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'ControlOfInstitutionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A classification of whether a postsecondary institution is operated by publicly elected or appointed officials (public control) or by privately elected or appointed officials and derives its major source of funds from private sources (private control). ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'ControlOfInstitutionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Control of Institution' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'ControlOfInstitutionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000048' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'ControlOfInstitutionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21048' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'ControlOfInstitutionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'ControlOfInstitutionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A classification of whether a postsecondary institution is operated by publicly elected or appointed officials (public control) or by privately elected or appointed officials and derives its major source of funds from private sources (private control). ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'ControlOfInstitutionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Control of Institution' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'ControlOfInstitutionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000048' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'ControlOfInstitutionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21048' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'ControlOfInstitutionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'LevelOfInstitutionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A classification of whether a postsecondary institution''s highest level of offering is a program of 4-years or higher (4 year), 2-but-less-than 4-years (2 year), or less than 2-years.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'LevelOfInstitutionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Level of Institution' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'LevelOfInstitutionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000178' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'LevelOfInstitutionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21178' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'LevelOfInstitutionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'LevelOfInstitutionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A classification of whether a postsecondary institution''s highest level of offering is a program of 4-years or higher (4 year), 2-but-less-than 4-years (2 year), or less than 2-years.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'LevelOfInstitutionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Level of Institution' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'LevelOfInstitutionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000178' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'LevelOfInstitutionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21178' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'LevelOfInstitutionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'PredominantCalendarSystemCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method by which an institution structures most of its courses for the academic year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'PredominantCalendarSystemCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Predominant Calendar System' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'PredominantCalendarSystemCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000729' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'PredominantCalendarSystemCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21705' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'PredominantCalendarSystemCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'PredominantCalendarSystemDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method by which an institution structures most of its courses for the academic year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'PredominantCalendarSystemDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Predominant Calendar System' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'PredominantCalendarSystemDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000729' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'PredominantCalendarSystemDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21705' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'PredominantCalendarSystemDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a childcare, early education, or early learning program, school, institution, program, or course section focuses primarily on instruction in which children and teachers are separated by time and/or location and interact through the use of computers and/or telecommunications technology.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Virtual Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001160' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22167' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a childcare, early education, or early learning program, school, institution, program, or course section focuses primarily on instruction in which children and teachers are separated by time and/or location and interact through the use of computers and/or telecommunications technology.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Virtual Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001160' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22167' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorDescription';
GO