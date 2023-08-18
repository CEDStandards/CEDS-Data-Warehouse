CREATE TABLE [RDS].[DimTitleIIIStatuses] (
    [DimTitleIIIStatusId]                               INT            IDENTITY (1, 1) NOT NULL,
    [ProgramParticipationTitleIIILiepCode]              NVARCHAR (50)  NULL,
    [ProgramParticipationTitleIIILiepDescription]       NVARCHAR (200) NULL,
    [TitleIIIImmigrantParticipationStatusCode]          NVARCHAR (50)  NULL,
    [TitleIIIImmigrantParticipationStatusDescription]   NVARCHAR (200) NULL,
    [TitleIIIImmigrantParticipationStatusEdFactsCode]   NVARCHAR (50)  NULL,
    [ProficiencyStatusCode]                             NVARCHAR (50)  NULL,
    [ProficiencyStatusDescription]                      NVARCHAR (100) NULL,
    [ProficiencyStatusEdFactsCode]                      NVARCHAR (50)  NULL,
    [TitleIIIAccountabilityProgressStatusCode]          NVARCHAR (50)  NULL,
    [TitleIIIAccountabilityProgressStatusDescription]   NVARCHAR (100) NULL,
    [TitleIIIAccountabilityProgressStatusEdFactsCode]   NVARCHAR (50)  NULL,
    [TitleIIILanguageInstructionProgramTypeCode]        NVARCHAR (50)  NULL,
    [TitleIIILanguageInstructionProgramTypeDescription] NVARCHAR (100) NULL,
    [TitleIIILanguageInstructionProgramTypeEdFactsCode] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimTitleIIIStatuses] PRIMARY KEY CLUSTERED ([DimTitleIIIStatusId] ASC) WITH (FILLFACTOR = 80)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'ProficiencyStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student''s scores were proficient.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'ProficiencyStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Proficiency Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'ProficiencyStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000573' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'ProficiencyStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21565' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'ProficiencyStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'ProficiencyStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student''s scores were proficient.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'ProficiencyStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Proficiency Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'ProficiencyStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000573' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'ProficiencyStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21565' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'ProficiencyStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'ProficiencyStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student''s scores were proficient.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'ProficiencyStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Proficiency Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'ProficiencyStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000573' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'ProficiencyStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21565' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'ProficiencyStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIAccountabilityProgressStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the progress made by a student toward English proficiency.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIAccountabilityProgressStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Accountability Progress Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIAccountabilityProgressStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000536' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIAccountabilityProgressStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21527' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIAccountabilityProgressStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIAccountabilityProgressStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the progress made by a student toward English proficiency.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIAccountabilityProgressStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Accountability Progress Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIAccountabilityProgressStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000536' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIAccountabilityProgressStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21527' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIAccountabilityProgressStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIAccountabilityProgressStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the progress made by a student toward English proficiency.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIAccountabilityProgressStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Accountability Progress Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIAccountabilityProgressStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000536' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIAccountabilityProgressStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21527' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIAccountabilityProgressStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that an immigrant student participated in programs for immigrant children and youth funded under ESEA Title III Section 3114(d)(1) using funds reserved for immigrant education programs/activities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Immigrant Participation Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that an immigrant student participated in programs for immigrant children and youth funded under ESEA Title III Section 3114(d)(1) using funds reserved for immigrant education programs/activities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Immigrant Participation Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that an immigrant student participated in programs for immigrant children and youth funded under ESEA Title III Section 3114(d)(1) using funds reserved for immigrant education programs/activities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Immigrant Participation Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIILanguageInstructionProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of Title III language instructional education programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIILanguageInstructionProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Language Instruction Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIILanguageInstructionProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000447' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIILanguageInstructionProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21437' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIILanguageInstructionProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIILanguageInstructionProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of Title III language instructional education programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIILanguageInstructionProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Language Instruction Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIILanguageInstructionProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000447' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIILanguageInstructionProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21437' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIILanguageInstructionProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIILanguageInstructionProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of Title III language instructional education programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIILanguageInstructionProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Language Instruction Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIILanguageInstructionProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000447' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIILanguageInstructionProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21437' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIIIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIILanguageInstructionProgramTypeEdFactsCode';
GO