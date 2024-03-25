CREATE TABLE [RDS].[DimPersonRelationships] (
    [DimPersonRelationshipId]             INT IDENTITY (1, 1) NOT NULL,
    [PersonRelationshipTypeCode]          NVARCHAR (50) NOT NULL,
    [PersonRelationshipTypeDescription]   NVARCHAR (200) NOT NULL,
    [LivesWithIndicatorCode]              NVARCHAR (50) NOT NULL,
    [LivesWithIndicatorCodeDescription]   NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DimPersonRelationships] PRIMARY KEY CLUSTERED ([DimPersonRelationshipId] ASC)
);


GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipTypeCode', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The nature of a person''s relationship to another person.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipTypeCode', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Person Relationship Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipTypeCode', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000425' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipTypeCode', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000425' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipTypeCode', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipTypeDescription', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The nature of a person''s relationship to another person.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipTypeDescription', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Person Relationship Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipTypeDescription', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000425' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipTypeDescription', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000425' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipTypeDescription', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'LivesWithIndicatorCode', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates whether or not the learner lives with the related person.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'LivesWithIndicatorCode', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Person Relationship to Learner Lives with Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'LivesWithIndicatorCode', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001425' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'LivesWithIndicatorCode', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001425' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'LivesWithIndicatorCode', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'LivesWithIndicatorCodeDescription', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates whether or not the learner lives with the related person.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'LivesWithIndicatorCodeDescription', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Person Relationship to Learner Lives with Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'LivesWithIndicatorCodeDescription', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001425' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'LivesWithIndicatorCodeDescription', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001425' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'LivesWithIndicatorCodeDescription', @level2type=N'COLUMN',@level2name=N'DimPersonRelationships';
GO