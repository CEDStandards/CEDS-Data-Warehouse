CREATE TABLE [RDS].[DimAssessmentAccommodations] (
    [DimAssessmentAccommodationId]               INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentAccommodationCategoryCode]        NVARCHAR (100) NOT NULL,
    [AssessmentAccommodationCategoryDescription] NVARCHAR (300) NOT NULL,
    [AccommodationTypeCode]                      NVARCHAR (100) NOT NULL,
    [AccommodationTypeDescription]               NVARCHAR (300) NOT NULL,
    CONSTRAINT [PK_DimAssessmentAccommodationId] PRIMARY KEY CLUSTERED ([DimAssessmentAccommodationId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AccommodationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The specific accommodation necessary for assessment or instruction.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AccommodationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accommodation Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AccommodationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000385' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AccommodationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21376' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AccommodationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AccommodationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The specific accommodation necessary for assessment or instruction.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AccommodationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accommodation Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AccommodationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000385' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AccommodationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21376' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AccommodationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AssessmentAccommodationCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A category of accommodations needed for a given assessment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AssessmentAccommodationCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Accommodation Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AssessmentAccommodationCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000383' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AssessmentAccommodationCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21374' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AssessmentAccommodationCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AssessmentAccommodationCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A category of accommodations needed for a given assessment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AssessmentAccommodationCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Accommodation Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AssessmentAccommodationCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000383' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AssessmentAccommodationCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21374' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAccommodations', @level2type=N'COLUMN',@level2name=N'AssessmentAccommodationCategoryDescription';
GO