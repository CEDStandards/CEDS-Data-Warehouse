CREATE TABLE [RDS].[DimTitleIStatuses] (
    [DimTitleIStatusId]                      INT            IDENTITY (1, 1) NOT NULL,
    [TitleIInstructionalServicesCode]        NVARCHAR (50)  NULL,
    [TitleIInstructionalServicesDescription] NVARCHAR (100) NULL,
    [TitleIInstructionalServicesEdFactsCode] NVARCHAR (50)  NULL,
    [TitleIProgramTypeCode]                  NVARCHAR (50)  NULL,
    [TitleIProgramTypeDescription]           NVARCHAR (100) NULL,
    [TitleIProgramTypeEdFactsCode]           NVARCHAR (50)  NULL,
    [TitleISchoolStatusCode]                 NVARCHAR (50)  NULL,
    [TitleISchoolStatusDescription]          NVARCHAR (100) NULL,
    [TitleISchoolStatusEdFactsCode]          NVARCHAR (50)  NULL,
    [TitleISupportServicesCode]              NVARCHAR (50)  NULL,
    [TitleISupportServicesDescription]       NVARCHAR (100) NULL,
    [TitleISupportServicesEdFactsCode]       NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimTitleIStatuses] PRIMARY KEY CLUSTERED ([DimTitleIStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitle1Statuses_Title1SchoolStatusEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleISchoolStatusEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitleIStatuses_TitleISchoolStatusEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleISchoolStatusEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitle1Statuses_Title1ProgramTypeEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleIProgramTypeEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitleIStatuses_TitleISupportServicesEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleISupportServicesEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitleIStatuses_Codes]
    ON [RDS].[DimTitleIStatuses]([TitleISchoolStatusCode] ASC, [TitleIInstructionalServicesCode] ASC, [TitleISupportServicesCode] ASC, [TitleIProgramTypeCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitle1Statuses_Title1InstructionalServicesEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleIInstructionalServicesEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitle1Statuses_Codes]
    ON [RDS].[DimTitleIStatuses]([TitleISchoolStatusCode] ASC, [TitleIInstructionalServicesCode] ASC, [TitleISupportServicesCode] ASC, [TitleIProgramTypeCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitleIStatuses_TitleIInstructionalServicesEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleIInstructionalServicesEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitle1Statuses_Title1SupportServicesEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleISupportServicesEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitleIStatuses_TitleIProgramTypeEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleIProgramTypeEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of instructional services provided to students in ESEA Title I programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Instructional Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000282' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21282' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of instructional services provided to students in ESEA Title I programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Instructional Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000282' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21282' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of instructional services provided to students in ESEA Title I programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Instructional Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000282' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21282' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of Title I program offered in the school or district.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000284' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21284' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of Title I program offered in the school or district.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000284' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21284' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of Title I program offered in the school or district.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000284' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21284' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a school is designated under state and federal regulations as being eligible for participation in programs authorized by Title I of ESEA as amended and whether it has a Title I program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I School Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000285' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21285' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a school is designated under state and federal regulations as being eligible for participation in programs authorized by Title I of ESEA as amended and whether it has a Title I program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I School Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000285' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21285' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a school is designated under state and federal regulations as being eligible for participation in programs authorized by Title I of ESEA as amended and whether it has a Title I program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I School Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000285' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21285' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of support services provided to students in Title I programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Support Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of support services provided to students in Title I programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Support Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of support services provided to students in Title I programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Support Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesEdFactsCode';
GO