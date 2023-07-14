CREATE TABLE [RDS].[DimRaces] (
    [DimRaceId]       INT            IDENTITY (1, 1) NOT NULL,
    [RaceCode]        NVARCHAR (50)  NULL,
    [RaceDescription] NVARCHAR (200) NULL,
    [RaceEdFactsCode] NVARCHAR (100) NULL,
    CONSTRAINT [PK_DimRaces] PRIMARY KEY CLUSTERED ([DimRaceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimRaces_RaceCode]
    ON [RDS].[DimRaces]([RaceCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRaces', @level2type=N'COLUMN',@level2name=N'RaceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The origins of a person.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRaces', @level2type=N'COLUMN',@level2name=N'RaceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Race' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRaces', @level2type=N'COLUMN',@level2name=N'RaceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001943' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRaces', @level2type=N'COLUMN',@level2name=N'RaceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22955' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRaces', @level2type=N'COLUMN',@level2name=N'RaceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRaces', @level2type=N'COLUMN',@level2name=N'RaceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The origins of a person.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRaces', @level2type=N'COLUMN',@level2name=N'RaceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Race' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRaces', @level2type=N'COLUMN',@level2name=N'RaceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001943' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRaces', @level2type=N'COLUMN',@level2name=N'RaceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22955' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRaces', @level2type=N'COLUMN',@level2name=N'RaceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRaces', @level2type=N'COLUMN',@level2name=N'RaceEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The origins of a person.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRaces', @level2type=N'COLUMN',@level2name=N'RaceEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Race' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRaces', @level2type=N'COLUMN',@level2name=N'RaceEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001943' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRaces', @level2type=N'COLUMN',@level2name=N'RaceEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22955' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRaces', @level2type=N'COLUMN',@level2name=N'RaceEdFactsCode';
GO