CREATE TABLE [RDS].[DimOnetSocOccupationTypes](
	[DimOnetSocOccupationTypeId] 					[int] IDENTITY(1,1) NOT NULL,
	[OnetSocOccupationTypeCode] 					[nvarchar](10) CONSTRAINT [DF_DimOnetSocOccupationTypes_OnetSocOccupationTypeCode] DEFAULT ('MISSING') NOT NULL,
	[OnetSocOccupationTypeDescription] 				[nvarchar](4000) CONSTRAINT [DF_DimOnetSocOccupationTypes_OnetSocOccupationTypeDescription] DEFAULT ('MISSING') NOT NULL,	
 CONSTRAINT [PK_DimOnetSocOccupationTypes] PRIMARY KEY NONCLUSTERED 
(
	[DimOnetSocOccupationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The O*NET-SOC taxonomy defines the set of occupations across the world of work based on the Standard Occupational Classification.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOnetSocOccupationTypes', @level2type=N'COLUMN',@level2name=N'OnetSocOccupationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'O*NET-SOC Occupation Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOnetSocOccupationTypes', @level2type=N'COLUMN',@level2name=N'OnetSocOccupationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001756' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOnetSocOccupationTypes', @level2type=N'COLUMN',@level2name=N'OnetSocOccupationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22737' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOnetSocOccupationTypes', @level2type=N'COLUMN',@level2name=N'OnetSocOccupationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOnetSocOccupationTypes', @level2type=N'COLUMN',@level2name=N'OnetSocOccupationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The O*NET-SOC taxonomy defines the set of occupations across the world of work based on the Standard Occupational Classification.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOnetSocOccupationTypes', @level2type=N'COLUMN',@level2name=N'OnetSocOccupationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'O*NET-SOC Occupation Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOnetSocOccupationTypes', @level2type=N'COLUMN',@level2name=N'OnetSocOccupationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001756' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOnetSocOccupationTypes', @level2type=N'COLUMN',@level2name=N'OnetSocOccupationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22737' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOnetSocOccupationTypes', @level2type=N'COLUMN',@level2name=N'OnetSocOccupationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOnetSocOccupationTypes', @level2type=N'COLUMN',@level2name=N'OnetSocOccupationTypeDescription'
GO

