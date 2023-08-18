CREATE TABLE [RDS].[DimFederalProgramCodes](
	[DimFederalProgramCodeId] [int] IDENTITY(1,1) NOT NULL,
	[FederalProgramCode] [nvarchar](50) NULL,
	[FederalProgramCodeDescription] [nvarchar](150) NULL,	
	[FederalProgramSubgrantCode] [nvarchar](50) NULL,
	[FederalProgramSubgrantCodeDescription] [nvarchar](150) NULL,	
 CONSTRAINT [PK_DimFederalProgramCodes] PRIMARY KEY NONCLUSTERED 
(
	[DimFederalProgramCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The unique five-digit number assigned to each federal program as listed in the Assistance Listings. See https://sam.gov/content/assistance-listings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Federal Program Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000547' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21538' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The unique five-digit number assigned to each federal program as listed in the Assistance Listings. See https://sam.gov/content/assistance-listings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Federal Program Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000547' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21538' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An additional code appended to the Federal Program Code used to identify a subgrant of the grant identified by the Federal Program Code.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Federal Program Subgrant Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002010' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22980' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An additional code appended to the Federal Program Code used to identify a subgrant of the grant identified by the Federal Program Code.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Federal Program Subgrant Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002010' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22980' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalProgramCodes', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCodeDescription'
GO

