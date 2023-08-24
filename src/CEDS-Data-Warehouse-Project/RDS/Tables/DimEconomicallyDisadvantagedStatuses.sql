CREATE TABLE [RDS].[DimEconomicallyDisadvantagedStatuses] (
    [DimEconomicallyDisadvantagedStatusId]                              INT            IDENTITY (1, 1) NOT NULL,
    [EconomicDisadvantageStatusCode]                                    NVARCHAR (100) NOT NULL,
    [EconomicDisadvantageStatusDescription]                             NVARCHAR (300) NOT NULL,
    [EconomicDisadvantageStatusEdFactsCode]                             NVARCHAR (50)  NOT NULL,
    [EligibilityStatusForSchoolFoodServiceProgramsCode]                 NVARCHAR (100) NOT NULL,
    [EligibilityStatusForSchoolFoodServiceProgramsDescription]          NVARCHAR (300) NOT NULL,
    [EligibilityStatusForSchoolFoodServiceProgramsEdFactsCode]          NVARCHAR (50)  NOT NULL,
    [NationalSchoolLunchProgramDirectCertificationIndicatorCode]        NVARCHAR (100) NOT NULL,
    [NationalSchoolLunchProgramDirectCertificationIndicatorDescription] NVARCHAR (300) NOT NULL,
    CONSTRAINT [PK_DimEconomicallyDisadvantagedStatusId] PRIMARY KEY CLUSTERED ([DimEconomicallyDisadvantagedStatusId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student met the State criteria for classification as having an economic disadvantage.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Economic Disadvantage Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000086' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21086' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student met the State criteria for classification as having an economic disadvantage.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Economic Disadvantage Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000086' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21086' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student met the State criteria for classification as having an economic disadvantage.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Economic Disadvantage Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000086' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21086' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServiceProgramsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of a student''s level of eligibility to participate in the National School Lunch Program for breakfast, lunch, snack, supper, and milk programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServiceProgramsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Eligibility Status for School Food Service Programs' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServiceProgramsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000092' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServiceProgramsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21092' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServiceProgramsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServiceProgramsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of a student''s level of eligibility to participate in the National School Lunch Program for breakfast, lunch, snack, supper, and milk programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServiceProgramsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Eligibility Status for School Food Service Programs' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServiceProgramsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000092' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServiceProgramsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21092' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServiceProgramsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServiceProgramsEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of a student''s level of eligibility to participate in the National School Lunch Program for breakfast, lunch, snack, supper, and milk programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServiceProgramsEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Eligibility Status for School Food Service Programs' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServiceProgramsEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000092' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServiceProgramsEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21092' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServiceProgramsEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'NationalSchoolLunchProgramDirectCertificationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the student''s National School Lunch Program (NSLP) eligibility has been determined through direct certification.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'NationalSchoolLunchProgramDirectCertificationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'National School Lunch Program Direct Certification Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'NationalSchoolLunchProgramDirectCertificationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001654' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'NationalSchoolLunchProgramDirectCertificationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22635' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'NationalSchoolLunchProgramDirectCertificationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'NationalSchoolLunchProgramDirectCertificationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the student''s National School Lunch Program (NSLP) eligibility has been determined through direct certification.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'NationalSchoolLunchProgramDirectCertificationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'National School Lunch Program Direct Certification Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'NationalSchoolLunchProgramDirectCertificationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001654' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'NationalSchoolLunchProgramDirectCertificationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22635' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEconomicallyDisadvantagedStatuses', @level2type=N'COLUMN',@level2name=N'NationalSchoolLunchProgramDirectCertificationIndicatorDescription';
GO