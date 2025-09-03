CREATE TABLE [RDS].[DimIdeaStatuses] (
    [DimIdeaStatusId]                                        INT            IDENTITY (1, 1) NOT NULL,
    [SpecialEducationExitReasonCode]                         NVARCHAR (50)  CONSTRAINT [DF_DimIdeaStatuses_SpecialEducationExitReasonCode] DEFAULT ('MISSING') NOT NULL,
    [SpecialEducationExitReasonDescription]                  NVARCHAR (200) CONSTRAINT [DF_DimIdeaStatuses_SpecialEducationExitReasonDescription] DEFAULT ('MISSING') NOT NULL,
    [SpecialEducationExitReasonEdFactsCode]                  NVARCHAR (50)  CONSTRAINT [DF_DimIdeaStatuses_SpecialEducationExitReasonEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [IdeaEducationalEnvironmentForSchoolAgeDescription]      NVARCHAR (200) CONSTRAINT [DF_DimIdeaStatuses_IdeaEducationalEnvironmentForSchoolAgeDescription] DEFAULT ('MISSING') NOT NULL,
    [IdeaEducationalEnvironmentForSchoolAgeCode]             NVARCHAR (50)  CONSTRAINT [DF_DimIdeaStatuses_IdeaEducationalEnvironmentForSchoolAgeCode] DEFAULT ('MISSING') NOT NULL,
    [IdeaEducationalEnvironmentForSchoolAgeEdFactsCode]      NVARCHAR (50)  CONSTRAINT [DF_DimIdeaStatuses_IdeaEducationalEnvironmentForSchoolAgeEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [IdeaIndicatorCode]                                      NVARCHAR (50)  CONSTRAINT [DF_DimIdeaStatuses_IdeaIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [IdeaIndicatorDescription]                               NVARCHAR (200) CONSTRAINT [DF_DimIdeaStatuses_IdeaIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    [IdeaIndicatorEdFactsCode]                               NVARCHAR (50)  CONSTRAINT [DF_DimIdeaStatuses_IdeaIndicatorEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [IdeaEducationalEnvironmentForEarlyChildhoodCode]        NVARCHAR (50)  CONSTRAINT [DF_DimIdeaStatuses_IdeaEducationalEnvironmentForEarlyChildhoodCode] DEFAULT ('MISSING') NOT NULL,
    [IdeaEducationalEnvironmentForEarlyChildhoodDescription] NVARCHAR (200) CONSTRAINT [DF_DimIdeaStatuses_IdeaEducationalEnvironmentForEarlyChildhoodDescription] DEFAULT ('MISSING') NOT NULL,
    [IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode] NVARCHAR (50)  CONSTRAINT [DF_DimIdeaStatuses_IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimIdeaStatuses] PRIMARY KEY CLUSTERED ([DimIdeaStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimIdeaStatuses_BasisOfExitEdFactsCode]
    ON [RDS].[DimIdeaStatuses]([SpecialEducationExitReasonEdFactsCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimIdeaStatuses_EducEnvSchoolAgeEdFactsCode]
    ON [RDS].[DimIdeaStatuses]([IdeaEducationalEnvironmentForSchoolAgeEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimIdeaStatuses_Codes]
    ON [RDS].[DimIdeaStatuses]([SpecialEducationExitReasonCode] ASC, [IdeaEducationalEnvironmentForSchoolAgeCode] ASC, [IdeaEducationalEnvironmentForEarlyChildhoodCode] ASC, [IdeaIndicatorCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimIdeaStatuses_EducEnvEarlyChildhoodEdFactsCode]
    ON [RDS].[DimIdeaStatuses]([IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode] ASC);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForEarlyChildhoodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The program in which children ages 3 through 5 attend and in which these children receive special education and related services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForEarlyChildhoodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Educational Environment for Early Childhood' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForEarlyChildhoodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000559' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForEarlyChildhoodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21550' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForEarlyChildhoodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForEarlyChildhoodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The program in which children ages 3 through 5 attend and in which these children receive special education and related services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForEarlyChildhoodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Educational Environment for Early Childhood' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForEarlyChildhoodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000559' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForEarlyChildhoodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21550' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForEarlyChildhoodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The program in which children ages 3 through 5 attend and in which these children receive special education and related services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Educational Environment for Early Childhood' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000559' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21550' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForSchoolAgeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The setting in which children ages 6 through 21, receive special education and related services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForSchoolAgeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Educational Environment for School Age' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForSchoolAgeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000535' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForSchoolAgeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21526' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForSchoolAgeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForSchoolAgeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The setting in which children ages 6 through 21, receive special education and related services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForSchoolAgeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Educational Environment for School Age' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForSchoolAgeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000535' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForSchoolAgeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21526' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForSchoolAgeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForSchoolAgeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The setting in which children ages 6 through 21, receive special education and related services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForSchoolAgeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Educational Environment for School Age' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForSchoolAgeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000535' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForSchoolAgeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21526' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaEducationalEnvironmentForSchoolAgeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person having intellectual disability; hearing impairment, including deafness; speech or language impairment; visual impairment, including blindness; serious emotional disturbance (hereafter referred to as emotional disturbance); orthopedic impairment; autism; traumatic brain injury; developmental delay; other health impairment; specific learning disability; deaf-blindness; or multiple disabilities and who, by reason thereof, receive special education and related services under the Individuals with Disabilities Education Act (IDEA) according to an Individualized Education Program (IEP), Individual Family Service Plan (IFSP), or service plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person having intellectual disability; hearing impairment, including deafness; speech or language impairment; visual impairment, including blindness; serious emotional disturbance (hereafter referred to as emotional disturbance); orthopedic impairment; autism; traumatic brain injury; developmental delay; other health impairment; specific learning disability; deaf-blindness; or multiple disabilities and who, by reason thereof, receive special education and related services under the Individuals with Disabilities Education Act (IDEA) according to an Individualized Education Program (IEP), Individual Family Service Plan (IFSP), or service plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person having intellectual disability; hearing impairment, including deafness; speech or language impairment; visual impairment, including blindness; serious emotional disturbance (hereafter referred to as emotional disturbance); orthopedic impairment; autism; traumatic brain injury; developmental delay; other health impairment; specific learning disability; deaf-blindness; or multiple disabilities and who, by reason thereof, receive special education and related services under the Individuals with Disabilities Education Act (IDEA) according to an Individualized Education Program (IEP), Individual Family Service Plan (IFSP), or service plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'IdeaIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationExitReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason children who were in special education at the start of the reporting period were not in special education at the end of the reporting period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationExitReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Exit Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationExitReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000260' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationExitReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21260' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationExitReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationExitReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason children who were in special education at the start of the reporting period were not in special education at the end of the reporting period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationExitReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Exit Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationExitReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000260' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationExitReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21260' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationExitReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationExitReasonEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason children who were in special education at the start of the reporting period were not in special education at the end of the reporting period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationExitReasonEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Exit Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationExitReasonEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000260' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationExitReasonEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21260' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIdeaStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationExitReasonEdFactsCode';
GO