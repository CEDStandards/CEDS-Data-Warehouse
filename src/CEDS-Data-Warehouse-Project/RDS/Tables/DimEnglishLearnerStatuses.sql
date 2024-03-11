CREATE TABLE [RDS].[DimEnglishLearnerStatuses] (
    [DimEnglishLearnerStatusId]              INT            IDENTITY (1, 1) NOT NULL,
    [EnglishLearnerStatusCode]               NVARCHAR (100) CONSTRAINT [DF_DimEnglishLearnerStatuses_EnglishLearnerStatusCode] DEFAULT ('MISSING') NOT NULL,
    [EnglishLearnerStatusDescription]        NVARCHAR (300) CONSTRAINT [DF_DimEnglishLearnerStatuses_EnglishLearnerStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [EnglishLearnerStatusEdFactsCode]        NVARCHAR (50)  CONSTRAINT [DF_DimEnglishLearnerStatuses_EnglishLearnerStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [PerkinsEnglishLearnerStatusCode]        NVARCHAR (100) CONSTRAINT [DF_DimEnglishLearnerStatuses_PerkinsEnglishLearnerStatusCode] DEFAULT ('MISSING') NOT NULL,
    [PerkinsEnglishLearnerStatusDescription] NVARCHAR (300) CONSTRAINT [DF_DimEnglishLearnerStatuses_PerkinsEnglishLearnerStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [PerkinsEnglishLearnerStatusEdfactsCode] VARCHAR (50)   CONSTRAINT [DF_DimEnglishLearnerStatuses_PerkinsEnglishLearnerStatusEdfactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimEnglistLearnerStatuses] PRIMARY KEY CLUSTERED ([DimEnglishLearnerStatusId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'In coordination with the state''s definition based on Section 8101(20) of the ESEA, as amended by the ESSA, the term ''English learner'', when used with respect to an individual, means an individual:  (A) who is aged 3 through 21;  (B) who is enrolled or preparing to enroll in an elementary school or a secondary school;  (C)   (i) who was not born in the United States or whose native languages are languages other than English;  (ii)   (I) who is a Native American or Alaska Native, or a native resident of the outlying areas; and  (II) who comes from an environment where a language other than English has had a significant impact on the individual''s level of English language proficiency; or  (iii) who is migratory, whose native language is a language other than English, and who come from an environment where a language other than English is dominant; and  (D) whose difficulties in speaking, reading, writing, or understanding the English language may be sufficient to deny the individual   (i) the ability to meet the challenging State academic standards;  (ii) the ability to successfully achieve in classrooms where the language of instruction is English; or  (iii) the opportunity to participate fully in society.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'English Learner Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000180' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21180' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'In coordination with the state''s definition based on Section 8101(20) of the ESEA, as amended by the ESSA, the term ''English learner'', when used with respect to an individual, means an individual:  (A) who is aged 3 through 21;  (B) who is enrolled or preparing to enroll in an elementary school or a secondary school;  (C)   (i) who was not born in the United States or whose native languages are languages other than English;  (ii)   (I) who is a Native American or Alaska Native, or a native resident of the outlying areas; and  (II) who comes from an environment where a language other than English has had a significant impact on the individual''s level of English language proficiency; or  (iii) who is migratory, whose native language is a language other than English, and who come from an environment where a language other than English is dominant; and  (D) whose difficulties in speaking, reading, writing, or understanding the English language may be sufficient to deny the individual   (i) the ability to meet the challenging State academic standards;  (ii) the ability to successfully achieve in classrooms where the language of instruction is English; or  (iii) the opportunity to participate fully in society.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'English Learner Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000180' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21180' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'In coordination with the state''s definition based on Section 8101(20) of the ESEA, as amended by the ESSA, the term ''English learner'', when used with respect to an individual, means an individual:  (A) who is aged 3 through 21;  (B) who is enrolled or preparing to enroll in an elementary school or a secondary school;  (C)   (i) who was not born in the United States or whose native languages are languages other than English;  (ii)   (I) who is a Native American or Alaska Native, or a native resident of the outlying areas; and  (II) who comes from an environment where a language other than English has had a significant impact on the individual''s level of English language proficiency; or  (iii) who is migratory, whose native language is a language other than English, and who come from an environment where a language other than English is dominant; and  (D) whose difficulties in speaking, reading, writing, or understanding the English language may be sufficient to deny the individual   (i) the ability to meet the challenging State academic standards;  (ii) the ability to successfully achieve in classrooms where the language of instruction is English; or  (iii) the opportunity to participate fully in society.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'English Learner Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000180' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21180' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A secondary student, an adult, or an out-of-school youth, who has limited ability in speaking, reading, writing, or understanding English language, and (a) whose native language is a language other than English, or (b) who lives in a family or community environment in which a language other than English is the dominant language.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Perkins English Learner Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000581' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21574' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A secondary student, an adult, or an out-of-school youth, who has limited ability in speaking, reading, writing, or understanding English language, and (a) whose native language is a language other than English, or (b) who lives in a family or community environment in which a language other than English is the dominant language.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Perkins English Learner Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000581' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21574' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatusEdfactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A secondary student, an adult, or an out-of-school youth, who has limited ability in speaking, reading, writing, or understanding English language, and (a) whose native language is a language other than English, or (b) who lives in a family or community environment in which a language other than English is the dominant language.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatusEdfactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Perkins English Learner Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatusEdfactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000581' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatusEdfactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21574' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEnglishLearnerStatuses', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatusEdfactsCode';
GO