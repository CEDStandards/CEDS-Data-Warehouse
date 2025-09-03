CREATE TABLE [RDS].[DimOrganizationTitleIStatuses] (
    [DimOrganizationTitleIStatusId]                      INT            IDENTITY (1, 1) NOT NULL,
    [TitleIInstructionalServicesCode]        NVARCHAR (50)  CONSTRAINT [DF_DimOrganizationTitleIStatuses_TitleIInstructionalServicesCode] DEFAULT ('MISSING') NOT NULL,
    [TitleIInstructionalServicesDescription] NVARCHAR (100) CONSTRAINT [DF_DimOrganizationTitleIStatuses_TitleIInstructionalServicesDescription] DEFAULT ('MISSING') NOT NULL,
    [TitleIInstructionalServicesEdFactsCode] NVARCHAR (50)  CONSTRAINT [DF_DimOrganizationTitleIStatuses_TitleIInstructionalServicesEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [TitleIProgramTypeCode]                  NVARCHAR (50)  CONSTRAINT [DF_DimOrganizationTitleIStatuses_TitleIProgramTypeCode] DEFAULT ('MISSING') NOT NULL,
    [TitleIProgramTypeDescription]           NVARCHAR (100) CONSTRAINT [DF_DimOrganizationTitleIStatuses_TitleIProgramTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [TitleIProgramTypeEdFactsCode]           NVARCHAR (50)  CONSTRAINT [DF_DimOrganizationTitleIStatuses_TitleIProgramTypeEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [TitleISchoolStatusCode]                 NVARCHAR (50)  CONSTRAINT [DF_DimOrganizationTitleIStatuses_TitleISchoolStatusCode] DEFAULT ('MISSING') NOT NULL,
    [TitleISchoolStatusDescription]          NVARCHAR (100) CONSTRAINT [DF_DimOrganizationTitleIStatuses_TitleISchoolStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [TitleISchoolStatusEdFactsCode]          NVARCHAR (50)  CONSTRAINT [DF_DimOrganizationTitleIStatuses_TitleISchoolStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [TitleISupportServicesCode]              NVARCHAR (50)  CONSTRAINT [DF_DimOrganizationTitleIStatuses_TitleISupportServicesCode] DEFAULT ('MISSING') NOT NULL,
    [TitleISupportServicesDescription]       NVARCHAR (100) CONSTRAINT [DF_DimOrganizationTitleIStatuses_TitleISupportServicesDescription] DEFAULT ('MISSING') NOT NULL,
    [TitleISupportServicesEdFactsCode]       NVARCHAR (50)  CONSTRAINT [DF_DimOrganizationTitleIStatuses_TitleISupportServicesEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimOrganizationTitleIStatuses] PRIMARY KEY CLUSTERED ([DimOrganizationTitleIStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimOrganizationTitleIStatuses_TitleISchoolStatusEdFactsCode]
    ON [RDS].[DimOrganizationTitleIStatuses]([TitleISchoolStatusEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimOrganizationTitleIStatuses_TitleIProgramTypeEdFactsCode]
    ON [RDS].[DimOrganizationTitleIStatuses]([TitleIProgramTypeEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimOrganizationTitleIStatuses_TitleISupportServicesEdFactsCode]
    ON [RDS].[DimOrganizationTitleIStatuses]([TitleISupportServicesEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimOrganizationTitleIStatuses_Codes]
    ON [RDS].[DimOrganizationTitleIStatuses]([TitleISchoolStatusCode] ASC, [TitleIInstructionalServicesCode] ASC, [TitleISupportServicesCode] ASC, [TitleIProgramTypeCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimOrganizationTitleIStatuses_TitleIInstructionalServicesEdFactsCode]
    ON [RDS].[DimOrganizationTitleIStatuses]([TitleIInstructionalServicesEdFactsCode] ASC);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of instructional services provided to students in ESEA Title I programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Instructional Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000282' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21282' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of instructional services provided to students in ESEA Title I programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Instructional Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000282' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21282' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of instructional services provided to students in ESEA Title I programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Instructional Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000282' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21282' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIInstructionalServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of Title I program offered in the school or district.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000284' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21284' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of Title I program offered in the school or district.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000284' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21284' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of Title I program offered in the school or district.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000284' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21284' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a school is designated under state and federal regulations as being eligible for participation in programs authorized by Title I of ESEA as amended and whether it has a Title I program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I School Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000285' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21285' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a school is designated under state and federal regulations as being eligible for participation in programs authorized by Title I of ESEA as amended and whether it has a Title I program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I School Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000285' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21285' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a school is designated under state and federal regulations as being eligible for participation in programs authorized by Title I of ESEA as amended and whether it has a Title I program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I School Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000285' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21285' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of support services provided to students in Title I programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Support Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of support services provided to students in Title I programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Support Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of support services provided to students in Title I programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Support Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISupportServicesEdFactsCode';
GO