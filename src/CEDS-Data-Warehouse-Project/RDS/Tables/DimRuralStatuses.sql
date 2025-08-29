CREATE TABLE [RDS].[DimRuralStatuses]
(
  [DimRuralStatusId]                            INT IDENTITY (1, 1) NOT NULL,
  [ERSRuralUrbanContinuumCodeCode]              NVARCHAR (50)  CONSTRAINT [DF_DimRuralStatuses_ERSRuralUrbanContinuumCodeCode] DEFAULT ('MISSING') NOT NULL,
  [ERSRuralUrbanContinuumCodeDescription]       NVARCHAR (200) CONSTRAINT [DF_DimRuralStatuses_ERSRuralUrbanContinuumCodeDescription] DEFAULT ('MISSING') NOT NULL,
  [RuralResidencyStatusCode]                    NVARCHAR (50)  CONSTRAINT [DF_DimRuralStatuses_RuralResidencyStatusCodeCode] DEFAULT ('MISSING') NOT NULL,
  [RuralResidencyStatusDescription]             NVARCHAR (200) CONSTRAINT [DF_DimRuralStatuses_RuralResidencyStatusCodeDescription] DEFAULT ('MISSING') NOT NULL,
  CONSTRAINT [PK_DimRuralStatuses] PRIMARY KEY CLUSTERED ([DimRuralStatusId] ASC)
)

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'ERSRuralUrbanContinuumCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Rural-Urban Continuum Codes form a classification scheme that distinguishes metropolitan (metro) counties by the population size of their metro area, and nonmetropolitan (nonmetro) counties by degree of urbanization and adjacency to a metro area or areas. The metro and nonmetro categories have been subdivided into three metro and six nonmetro groupings, resulting in a nine-part county codification. The codes allow researchers working with county data to break such data into finer residential groups beyond a simple metro-nonmetro dichotomy, particularly for the analysis of trends in nonmetro areas that may be related to degree of rurality and metro proximity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'ERSRuralUrbanContinuumCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Economic Research Service Rural-Urban Continuum Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'ERSRuralUrbanContinuumCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000862' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'ERSRuralUrbanContinuumCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000862' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'ERSRuralUrbanContinuumCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'ERSRuralUrbanContinuumCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Rural-Urban Continuum Codes form a classification scheme that distinguishes metropolitan (metro) counties by the population size of their metro area, and nonmetropolitan (nonmetro) counties by degree of urbanization and adjacency to a metro area or areas. The metro and nonmetro categories have been subdivided into three metro and six nonmetro groupings, resulting in a nine-part county codification. The codes allow researchers working with county data to break such data into finer residential groups beyond a simple metro-nonmetro dichotomy, particularly for the analysis of trends in nonmetro areas that may be related to degree of rurality and metro proximity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'ERSRuralUrbanContinuumCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Economic Research Service Rural-Urban Continuum Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'ERSRuralUrbanContinuumCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000862' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'ERSRuralUrbanContinuumCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000862' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'ERSRuralUrbanContinuumCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'RuralResidencyStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person who resides in a place with a population of less than 2,500 that is not near any metropolitan area with a population greater than 50,000, or in a city with adjacent areas of high density.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'RuralResidencyStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Rural Residency Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'RuralResidencyStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000778' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'RuralResidencyStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000778' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'RuralResidencyStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'RuralResidencyStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person who resides in a place with a population of less than 2,500 that is not near any metropolitan area with a population greater than 50,000, or in a city with adjacent areas of high density.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'RuralResidencyStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Rural Residency Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'RuralResidencyStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000778' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'RuralResidencyStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000778' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRuralStatuses', @level2type=N'COLUMN',@level2name=N'RuralResidencyStatusDescription';
GO