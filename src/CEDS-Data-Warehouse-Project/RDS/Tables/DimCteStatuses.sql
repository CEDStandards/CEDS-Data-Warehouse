CREATE TABLE [RDS].[DimCteStatuses] (
    [DimCteStatusId]                                     INT            IDENTITY (1, 1) NOT NULL,
    [CteAeDisplacedHomemakerIndicatorCode]               NVARCHAR (50)  CONSTRAINT [DF_DimCteStatuses_CteAeDisplacedHomemakerIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [CteAeDisplacedHomemakerIndicatorDescription]        NVARCHAR (200) CONSTRAINT [DF_DimCteStatuses_CteAeDisplacedHomemakerIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    [CteAeDisplacedHomemakerIndicatorEdFactsCode]        NVARCHAR (50)  CONSTRAINT [DF_DimCteStatuses_CteAeDisplacedHomemakerIndicatorEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [CteNontraditionalGenderStatusCode]                  NVARCHAR (50)  CONSTRAINT [DF_DimCteStatuses_CteNontraditionalGenderStatusCode] DEFAULT ('MISSING') NOT NULL,
    [CteNontraditionalGenderStatusDescription]           NVARCHAR (200) CONSTRAINT [DF_DimCteStatuses_CteNontraditionalGenderStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [CteNontraditionalGenderStatusEdFactsCode]           NVARCHAR (50)  CONSTRAINT [DF_DimCteStatuses_CteNontraditionalGenderStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [CteNontraditionalCompletionCode]                    NVARCHAR (50)  CONSTRAINT [DF_DimCteStatuses_CteNontraditionalCompletionCode] DEFAULT ('MISSING') NOT NULL,
    [CteNontraditionalCompletionDescription]             NVARCHAR (200) CONSTRAINT [DF_DimCteStatuses_CteNontraditionalCompletionDescription] DEFAULT ('MISSING') NOT NULL,
    [CteNontraditionalCompletionEdFactsCode]             NVARCHAR (50)  CONSTRAINT [DF_DimCteStatuses_CteNontraditionalCompletionEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [SingleParentOrSinglePregnantWomanStatusCode]        NVARCHAR (50)  CONSTRAINT [DF_DimCteStatuses_SingleParentOrSinglePregnantWomanStatusCode] DEFAULT ('MISSING') NOT NULL,
    [SingleParentOrSinglePregnantWomanStatusDescription] NVARCHAR (200) CONSTRAINT [DF_DimCteStatuses_SingleParentOrSinglePregnantWomanStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [SingleParentOrSinglePregnantWomanStatusEdFactsCode] NVARCHAR (50)  CONSTRAINT [DF_DimCteStatuses_SingleParentOrSinglePregnantWomanStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [CteGraduationRateInclusionCode]                     NVARCHAR (450) CONSTRAINT [DF_DimCteStatuses_CteGraduationRateInclusionCode] DEFAULT ('MISSING') NOT NULL,
    [CteGraduationRateInclusionDescription]              NVARCHAR (200) CONSTRAINT [DF_DimCteStatuses_CteGraduationRateInclusionDescription] DEFAULT ('MISSING') NOT NULL,
    [CteGraduationRateInclusionEdFactsCode]              NVARCHAR (50)  CONSTRAINT [DF_DimCteStatuses_CteGraduationRateInclusionEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [CteParticipantCode]                                 NVARCHAR (50)  CONSTRAINT [DF_DimCteStatuses_CteParticipantCode] DEFAULT ('MISSING') NOT NULL,
    [CteParticipantDescription]                          NVARCHAR (200) CONSTRAINT [DF_DimCteStatuses_CteParticipantDescription] DEFAULT ('MISSING') NOT NULL,
    [CteParticipantEdFactsCode]                          NVARCHAR (50)  CONSTRAINT [DF_DimCteStatuses_CteParticipantEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [CteConcentratorCode]                                NVARCHAR (50)  CONSTRAINT [DF_DimCteStatuses_CteConcentratorCode] DEFAULT ('MISSING') NOT NULL,
    [CteConcentratorDescription]                         NVARCHAR (200) CONSTRAINT [DF_DimCteStatuses_CteConcentratorDescription] DEFAULT ('MISSING') NOT NULL,
    [CteConcentratorEdFactsCode]                         NVARCHAR (50)  CONSTRAINT [DF_DimCteStatuses_CteConcentratorEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimCteStatuses] PRIMARY KEY CLUSTERED ([DimCteStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteAeDisplacedHomemakerIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person who ; (A) (i) has worked primarily without remuneration to care for a home and family, and for that reason has diminished marketable skills;    (ii) has been dependent on the income of another family member but is no longer supported by that income; or    (iii) is a parent whose youngest dependent child will become ineligible to receive assistance under part A of title IV of the Social Security Act (42 U.S.C. 601 et seq.) not later than 2 years after the date on which the parent applies for assistance under such title; and (B)   is unemployed or underemployed and is experiencing difficulty in obtaining or upgrading employment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteAeDisplacedHomemakerIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career-Technical-Adult Education Displaced Homemaker Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteAeDisplacedHomemakerIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000084' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteAeDisplacedHomemakerIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21084' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteAeDisplacedHomemakerIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteAeDisplacedHomemakerIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person who ; (A) (i) has worked primarily without remuneration to care for a home and family, and for that reason has diminished marketable skills;    (ii) has been dependent on the income of another family member but is no longer supported by that income; or    (iii) is a parent whose youngest dependent child will become ineligible to receive assistance under part A of title IV of the Social Security Act (42 U.S.C. 601 et seq.) not later than 2 years after the date on which the parent applies for assistance under such title; and (B)   is unemployed or underemployed and is experiencing difficulty in obtaining or upgrading employment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteAeDisplacedHomemakerIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career-Technical-Adult Education Displaced Homemaker Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteAeDisplacedHomemakerIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000084' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteAeDisplacedHomemakerIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21084' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteAeDisplacedHomemakerIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteAeDisplacedHomemakerIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person who ; (A) (i) has worked primarily without remuneration to care for a home and family, and for that reason has diminished marketable skills;    (ii) has been dependent on the income of another family member but is no longer supported by that income; or    (iii) is a parent whose youngest dependent child will become ineligible to receive assistance under part A of title IV of the Social Security Act (42 U.S.C. 601 et seq.) not later than 2 years after the date on which the parent applies for assistance under such title; and (B)   is unemployed or underemployed and is experiencing difficulty in obtaining or upgrading employment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteAeDisplacedHomemakerIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career-Technical-Adult Education Displaced Homemaker Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteAeDisplacedHomemakerIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000084' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteAeDisplacedHomemakerIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21084' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteAeDisplacedHomemakerIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteConcentratorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of a student who has met the state-defined threshold of career and technical education concentrators, as defined in the State''s approved Perkins IV State Plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteConcentratorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Concentrator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteConcentratorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000037' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteConcentratorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21037' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteConcentratorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteConcentratorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of a student who has met the state-defined threshold of career and technical education concentrators, as defined in the State''s approved Perkins IV State Plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteConcentratorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Concentrator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteConcentratorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000037' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteConcentratorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21037' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteConcentratorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteConcentratorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of a student who has met the state-defined threshold of career and technical education concentrators, as defined in the State''s approved Perkins IV State Plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteConcentratorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Concentrator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteConcentratorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000037' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteConcentratorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21037' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteConcentratorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteGraduationRateInclusionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of how CTE concentrators are included in the state''s computation of its graduation rate.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteGraduationRateInclusionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Graduation Rate Inclusion' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteGraduationRateInclusionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteGraduationRateInclusionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteGraduationRateInclusionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteGraduationRateInclusionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of how CTE concentrators are included in the state''s computation of its graduation rate.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteGraduationRateInclusionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Graduation Rate Inclusion' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteGraduationRateInclusionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteGraduationRateInclusionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteGraduationRateInclusionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteGraduationRateInclusionEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of how CTE concentrators are included in the state''s computation of its graduation rate.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteGraduationRateInclusionEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Graduation Rate Inclusion' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteGraduationRateInclusionEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteGraduationRateInclusionEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteGraduationRateInclusionEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalCompletionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the CTE student has completed a CTE program in a nontraditional field (where one gender comprises less than 25 percent of the persons employed in those occupations or fields of work).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalCompletionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Nontraditional Completion' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalCompletionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000593' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalCompletionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21586' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalCompletionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalCompletionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the CTE student has completed a CTE program in a nontraditional field (where one gender comprises less than 25 percent of the persons employed in those occupations or fields of work).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalCompletionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Nontraditional Completion' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalCompletionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000593' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalCompletionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21586' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalCompletionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalCompletionEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the CTE student has completed a CTE program in a nontraditional field (where one gender comprises less than 25 percent of the persons employed in those occupations or fields of work).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalCompletionEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Nontraditional Completion' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalCompletionEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000593' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalCompletionEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21586' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalCompletionEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalGenderStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether CTE participants were members of an underrepresented gender group (where one gender comprises less than 25 percent of the persons employed in those occupations or field of work).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalGenderStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career Technical Education Nontraditional Gender Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalGenderStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalGenderStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21581' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalGenderStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalGenderStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether CTE participants were members of an underrepresented gender group (where one gender comprises less than 25 percent of the persons employed in those occupations or field of work).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalGenderStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career Technical Education Nontraditional Gender Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalGenderStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalGenderStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21581' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalGenderStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalGenderStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether CTE participants were members of an underrepresented gender group (where one gender comprises less than 25 percent of the persons employed in those occupations or field of work).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalGenderStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career Technical Education Nontraditional Gender Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalGenderStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalGenderStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21581' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteNontraditionalGenderStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteParticipantCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication a student has met the state-defined threshold of Career and Technical Education participation as defined in the State''s approved Perkins IV State Plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteParticipantCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Participant' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteParticipantCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000592' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteParticipantCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21585' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteParticipantCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteParticipantDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication a student has met the state-defined threshold of Career and Technical Education participation as defined in the State''s approved Perkins IV State Plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteParticipantDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Participant' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteParticipantDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000592' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteParticipantDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21585' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteParticipantDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteParticipantEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication a student has met the state-defined threshold of Career and Technical Education participation as defined in the State''s approved Perkins IV State Plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteParticipantEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Participant' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteParticipantEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000592' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteParticipantEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21585' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'CteParticipantEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A student who, at some time during the school year, is either a pregnant female student who is unmarried; or a male or female student who is unmarried or legally separated from a spouse and has a minor child or children.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Single Parent or Single Pregnant Woman Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000580' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21573' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A student who, at some time during the school year, is either a pregnant female student who is unmarried; or a male or female student who is unmarried or legally separated from a spouse and has a minor child or children.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Single Parent or Single Pregnant Woman Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000580' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21573' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A student who, at some time during the school year, is either a pregnant female student who is unmarried; or a male or female student who is unmarried or legally separated from a spouse and has a minor child or children.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Single Parent or Single Pregnant Woman Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000580' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21573' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCteStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatusEdFactsCode';
GO