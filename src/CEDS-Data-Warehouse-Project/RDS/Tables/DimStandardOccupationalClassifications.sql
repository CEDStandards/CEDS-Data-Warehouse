CREATE TABLE [RDS].[DimStandardOccupationalClassifications](
	[DimStandardOccupationalClassificationId] 					[int] IDENTITY(1,1) NOT NULL,
	[StandardOccupationalClassificationCode] 					[nvarchar](100) 	CONSTRAINT [DF_DimStandardOccupationalClassifications_StandardOccupationalClassificationCode] DEFAULT ('MISSING') NOT NULL,
	[StandardOccupationalClassificationDescription] 			[nvarchar](4000) 	CONSTRAINT [DF_DimStandardOccupationalClassifications_StandardOccupationalClassificationDescription] DEFAULT ('MISSING') NOT NULL,	
 CONSTRAINT [PK_DimStandardOccupationalClassifications] PRIMARY KEY NONCLUSTERED 
(
	[DimStandardOccupationalClassificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A Bureau of Labor Statistics coding system for classifying occupations by work performed and, in some cases, on the skills, education and training needed to perform the work at a competent level. See https://www.bls.gov/soc/2018/major_groups.htm.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStandardOccupationalClassifications', @level2type=N'COLUMN',@level2name=N'StandardOccupationalClassificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Standard Occupational Classification' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStandardOccupationalClassifications', @level2type=N'COLUMN',@level2name=N'StandardOccupationalClassificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000730' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStandardOccupationalClassifications', @level2type=N'COLUMN',@level2name=N'StandardOccupationalClassificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21707' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStandardOccupationalClassifications', @level2type=N'COLUMN',@level2name=N'StandardOccupationalClassificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStandardOccupationalClassifications', @level2type=N'COLUMN',@level2name=N'StandardOccupationalClassificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A Bureau of Labor Statistics coding system for classifying occupations by work performed and, in some cases, on the skills, education and training needed to perform the work at a competent level. See https://www.bls.gov/soc/2018/major_groups.htm.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStandardOccupationalClassifications', @level2type=N'COLUMN',@level2name=N'StandardOccupationalClassificationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Standard Occupational Classification' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStandardOccupationalClassifications', @level2type=N'COLUMN',@level2name=N'StandardOccupationalClassificationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000730' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStandardOccupationalClassifications', @level2type=N'COLUMN',@level2name=N'StandardOccupationalClassificationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21707' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStandardOccupationalClassifications', @level2type=N'COLUMN',@level2name=N'StandardOccupationalClassificationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStandardOccupationalClassifications', @level2type=N'COLUMN',@level2name=N'StandardOccupationalClassificationDescription'
GO

