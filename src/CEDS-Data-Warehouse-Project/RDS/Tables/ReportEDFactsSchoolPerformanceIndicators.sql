CREATE TABLE [RDS].[ReportEDFactsSchoolPerformanceIndicators] (
    [ReportEDFactsSchoolPerformanceIndicatorId] INT             NOT NULL,
    [Categories]                                NVARCHAR (300)  NULL,
    [CategorySetCode]                           NVARCHAR (40)   NULL,
    [ReportCode]                                NVARCHAR (40)   NOT NULL,
    [ReportLevel]                               NVARCHAR (40)   NOT NULL,
    [ReportYear]                                NVARCHAR (40)   NOT NULL,
    [StateANSICode]                             NVARCHAR (100)  NOT NULL,
    [StateCode]                                 NVARCHAR (100)  NOT NULL,
    [StateName]                                 NVARCHAR (500)  NOT NULL,
    [OrganizationId]                            INT             NOT NULL,
    [OrganizationName]                          NVARCHAR (1000) NOT NULL,
    [OrganizationNcesId]                        NVARCHAR (100)  NOT NULL,
    [OrganizationStateId]                       NVARCHAR (100)  NOT NULL,
    [ParentOrganizationStateId]                 NVARCHAR (100)  NULL,
    [RACE]                                      NVARCHAR (50)   NULL,
    [DISABILITY]                                NVARCHAR (50)   NULL,
    [LEPSTATUS]                                 NVARCHAR (50)   NULL,
    [ECODISSTATUS]                              NVARCHAR (50)   NULL,
    [SEX]                                       NVARCHAR (50)   NULL,
    [INDICATORSTATUS]                           NVARCHAR (50)   NULL,
    [STATEDDEFINEDSTATUSCODE]                   NVARCHAR (50)   NULL,
    CONSTRAINT [PK_ReportEDFactsSchoolPerformanceIndicators] PRIMARY KEY CLUSTERED ([ReportEDFactsSchoolPerformanceIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_ReportEDFactsSchoolPerformanceIndicators_ReportCode_ReportYear_ReportLevel_CategorySetCode]
    ON [RDS].[ReportEDFactsSchoolPerformanceIndicators]([ReportCode] ASC, [ReportYear] ASC, [ReportLevel] ASC, [CategorySetCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of a non-person entity such as an organization, institution, agency or business.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'RACE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The origins of a person.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'RACE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Race' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'RACE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001943' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'RACE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22955' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'RACE';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The concept describing the biological traits that distinguish the males and females of a species.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Sex' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000255' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21255' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The American National Standards Institute (ANSI) two-digit code for the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State ANSI Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000424' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21414' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsSchoolPerformanceIndicators', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO