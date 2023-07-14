CREATE TABLE [RDS].[DimK12OrganizationStatuses] (
    [DimK12OrganizationStatusId]                         INT            IDENTITY (1, 1) NOT NULL,
    [ReapAlternativeFundingStatusCode]                   NVARCHAR (50)  NULL,
    [ReapAlternativeFundingStatusDescription]            NVARCHAR (MAX) NULL,
    [ReapAlternativeFundingStatusEdFactsCode]            NVARCHAR (50)  NULL,
    [GunFreeSchoolsActReportingStatusCode]               NVARCHAR (50)  NULL,
    [GunFreeSchoolsActReportingStatusDescription]        NVARCHAR (MAX) NULL,
    [GunFreeSchoolsActReportingStatusEdFactsCode]        NVARCHAR (50)  NULL,
    [HighSchoolGraduationRateIndicatorStatusCode]        NVARCHAR (50)  NULL,
    [HighSchoolGraduationRateIndicatorStatusDescription] NVARCHAR (MAX) NULL,
    [HighSchoolGraduationRateIndicatorStatusEdFactsCode] NVARCHAR (50)  NULL,
    [McKinneyVentoSubgrantRecipientCode]                 NVARCHAR (50)  NULL,
    [McKinneyVentoSubgrantRecipientDescription]          NVARCHAR (MAX) NULL,
    [McKinneyVentoSubgrantRecipientEdFactsCode]          NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimK12OrganizationStatus] PRIMARY KEY CLUSTERED ([DimK12OrganizationStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12OrganizationStatuses_Codes]
    ON [RDS].[DimK12OrganizationStatuses]([ReapAlternativeFundingStatusCode] ASC, [GunFreeSchoolsActReportingStatusCode] ASC, [HighSchoolGraduationRateIndicatorStatusCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12OrganizationStatuses_HighSchoolGraduationRateIndicatorStatusEdFactsCode]
    ON [RDS].[DimK12OrganizationStatuses]([HighSchoolGraduationRateIndicatorStatusEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12OrganizationStatuses_ReapAlternativeFundingStatusEdFactsCode]
    ON [RDS].[DimK12OrganizationStatuses]([ReapAlternativeFundingStatusEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12OrganizationStatuses_GunFreeSchoolsActReportingStatusEdFactsCode]
    ON [RDS].[DimK12OrganizationStatuses]([GunFreeSchoolsActReportingStatusEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'GunFreeSchoolsActReportingStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school or local education agency (LEA) submitted a Gun-Free Schools Act (GFSA) of 1994 report to the state, as defined by Title 18, Section 921.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'GunFreeSchoolsActReportingStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Gun Free Schools Act Reporting Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'GunFreeSchoolsActReportingStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000134' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'GunFreeSchoolsActReportingStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21134' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'GunFreeSchoolsActReportingStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'GunFreeSchoolsActReportingStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school or local education agency (LEA) submitted a Gun-Free Schools Act (GFSA) of 1994 report to the state, as defined by Title 18, Section 921.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'GunFreeSchoolsActReportingStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Gun Free Schools Act Reporting Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'GunFreeSchoolsActReportingStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000134' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'GunFreeSchoolsActReportingStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21134' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'GunFreeSchoolsActReportingStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'GunFreeSchoolsActReportingStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school or local education agency (LEA) submitted a Gun-Free Schools Act (GFSA) of 1994 report to the state, as defined by Title 18, Section 921.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'GunFreeSchoolsActReportingStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Gun Free Schools Act Reporting Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'GunFreeSchoolsActReportingStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000134' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'GunFreeSchoolsActReportingStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21134' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'GunFreeSchoolsActReportingStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolGraduationRateIndicatorStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school or district met the High School Graduation Rate requirement in accordance with state definition for the purposes of determining AYP.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolGraduationRateIndicatorStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'High School Graduation Rate Indicator Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolGraduationRateIndicatorStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000140' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolGraduationRateIndicatorStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21140' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolGraduationRateIndicatorStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolGraduationRateIndicatorStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school or district met the High School Graduation Rate requirement in accordance with state definition for the purposes of determining AYP.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolGraduationRateIndicatorStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'High School Graduation Rate Indicator Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolGraduationRateIndicatorStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000140' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolGraduationRateIndicatorStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21140' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolGraduationRateIndicatorStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolGraduationRateIndicatorStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school or district met the High School Graduation Rate requirement in accordance with state definition for the purposes of determining AYP.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolGraduationRateIndicatorStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'High School Graduation Rate Indicator Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolGraduationRateIndicatorStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000140' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolGraduationRateIndicatorStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21140' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolGraduationRateIndicatorStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'ReapAlternativeFundingStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the local education agency (LEA) notified the state of the LEA''s intention to use REAP-Flex Alternative Uses of Funding Authority during the school year as specified in the Title VI, Section 6211 of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'ReapAlternativeFundingStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Rural Education Achievement Program Alternative Funding Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'ReapAlternativeFundingStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000560' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'ReapAlternativeFundingStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21552' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'ReapAlternativeFundingStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'ReapAlternativeFundingStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the local education agency (LEA) notified the state of the LEA''s intention to use REAP-Flex Alternative Uses of Funding Authority during the school year as specified in the Title VI, Section 6211 of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'ReapAlternativeFundingStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Rural Education Achievement Program Alternative Funding Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'ReapAlternativeFundingStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000560' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'ReapAlternativeFundingStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21552' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'ReapAlternativeFundingStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'ReapAlternativeFundingStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the local education agency (LEA) notified the state of the LEA''s intention to use REAP-Flex Alternative Uses of Funding Authority during the school year as specified in the Title VI, Section 6211 of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'ReapAlternativeFundingStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Rural Education Achievement Program Alternative Funding Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'ReapAlternativeFundingStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000560' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'ReapAlternativeFundingStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21552' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12OrganizationStatuses', @level2type=N'COLUMN',@level2name=N'ReapAlternativeFundingStatusEdFactsCode';
GO