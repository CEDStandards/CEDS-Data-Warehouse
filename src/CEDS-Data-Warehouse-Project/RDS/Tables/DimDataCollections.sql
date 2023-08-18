CREATE TABLE [RDS].[DimDataCollections] (
    [DimDataCollectionId]                  INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemDataCollectionIdentifier] INT            NULL,
    [SourceSystemName]                     NVARCHAR (100) NULL,
    [DataCollectionName]                   NVARCHAR (100) NOT NULL,
    [DataCollectionDescription]            NVARCHAR (MAX) NULL,
    [DataCollectionOpenDate]               DATETIME       NULL,
    [DataCollectionCloseDate]              DATETIME       NULL,
    [DataCollectionAcademicSchoolYear]     NVARCHAR (7)   NULL,
    [DataCollectionSchoolYear]             NVARCHAR (7)   NULL,
    CONSTRAINT [PK_DimCollections] PRIMARY KEY CLUSTERED ([DimDataCollectionId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimDataCollections_DataCollectionName]
    ON [RDS].[DimDataCollections]([DataCollectionName] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimDataCollections_DataCollectionSchoolYear]
    ON [RDS].[DimDataCollections]([DataCollectionSchoolYear] ASC) WITH (FILLFACTOR = 100, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionAcademicSchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session for which the data is applicable.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionAcademicSchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Academic School Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionAcademicSchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001970' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionAcademicSchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22920' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionAcademicSchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionCloseDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The date the data collection closes or ends.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionCloseDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Close Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionCloseDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001969' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionCloseDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22921' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionCloseDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The description of what is included in the data within the context of the data collection based on the source system and collection period as defined by the Data Collection Open Date and Data Collection Close Date.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001967' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22922' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22923' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionOpenDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The date the data collection opens or commences.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionOpenDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Open Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionOpenDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001968' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionOpenDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22924' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionOpenDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionSchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session in which the data collection occurs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionSchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection School Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionSchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001971' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionSchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22925' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'DataCollectionSchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'SourceSystemDataCollectionIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The identifier specified by the source system that uniquely identifies the data collection.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'SourceSystemDataCollectionIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Source System Data Collection Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'SourceSystemDataCollectionIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001964' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'SourceSystemDataCollectionIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22960' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'SourceSystemDataCollectionIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'SourceSystemName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the source system that provided the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'SourceSystemName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Source System Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'SourceSystemName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001965' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'SourceSystemName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22961' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDataCollections', @level2type=N'COLUMN',@level2name=N'SourceSystemName';
GO