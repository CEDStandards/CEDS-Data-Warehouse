CREATE TABLE [RDS].[DimAssessmentAccommodations] (
    [DimAssessmentAccommodationId]               INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentAccommodationCategoryCode]        NVARCHAR (100) NOT NULL,
    [AssessmentAccommodationCategoryDescription] NVARCHAR (300) NOT NULL,
    [AccommodationTypeCode]                      NVARCHAR (100) NOT NULL,
    [AccommodationTypeDescription]               NVARCHAR (300) NOT NULL,
    CONSTRAINT [PK_DimAssessmentAccommodationId] PRIMARY KEY CLUSTERED ([DimAssessmentAccommodationId] ASC)
);


GO

