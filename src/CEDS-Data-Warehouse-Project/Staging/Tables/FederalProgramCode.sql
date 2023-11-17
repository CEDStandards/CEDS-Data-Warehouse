CREATE TABLE Staging.FederalProgramCode
	(Id INT IDENTITY (1, 1) NOT NULL,
	FederalProgramCode NVARCHAR(50),
	FederalProgramCodeDescription NVARCHAR(150),
	FederalProgramSubgrantCode NVARCHAR(50),
	FederalProgramSubgrantCodeDescription NVARCHAR(150),
    [DataCollectionName] NVARCHAR (100) NULL,
    [RunDateTime] DATETIME NULL,
    CONSTRAINT [PK_FederalProgramCode] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The unique five-digit number assigned to each federal program as listed in the Assistance Listings. See https://sam.gov/content/assistance-listings' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Federal Program Code' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000547' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21538' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The unique five-digit number assigned to each federal program as listed in the Assistance Listings. See https://sam.gov/content/assistance-listings' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Federal Program Code' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000547' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21538' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An additional code appended to the Federal Program Code used to identify a subgrant of the grant identified by the Federal Program Code.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Federal Program Subgrant Code' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002010' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22980' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An additional code appended to the Federal Program Code used to identify a subgrant of the grant identified by the Federal Program Code.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Federal Program Subgrant Code' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002010' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22980' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'FederalProgramSubgrantCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22923' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'FederalProgramCode', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
