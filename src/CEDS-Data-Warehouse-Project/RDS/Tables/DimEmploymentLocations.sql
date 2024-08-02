CREATE TABLE [RDS].[DimEmploymentLocations] (
    [DimEmploymentLocationId]           INT           IDENTITY (1, 1) NOT NULL,
    [EmploymentLocationCode]        VARCHAR (50)  CONSTRAINT [DF_DimEmploymentLocations_EmploymentLocationCode] DEFAULT ('MISSING') NOT NULL,
    [EmploymentLocationDescription] VARCHAR (200) CONSTRAINT [DF_DimEmploymentLocations_EmploymentLocationDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimEmploymentLocations] PRIMARY KEY CLUSTERED ([DimEmploymentLocationId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimEmploymentLocations_EmploymentLocationCode]
    ON [RDS].[DimEmploymentLocations]([EmploymentLocationCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentLocations', @level2type=N'COLUMN',@level2name=N'EmploymentLocationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The state or other location in which an individual is found employed.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentLocations', @level2type=N'COLUMN',@level2name=N'EmploymentLocationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment Location' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentLocations', @level2type=N'COLUMN',@level2name=N'EmploymentLocationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000990' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentLocations', @level2type=N'COLUMN',@level2name=N'EmploymentLocationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000990' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentLocations', @level2type=N'COLUMN',@level2name=N'EmploymentLocationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentLocations', @level2type=N'COLUMN',@level2name=N'EmploymentLocationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The state or other location in which an individual is found employed.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentLocations', @level2type=N'COLUMN',@level2name=N'EmploymentLocationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment Location' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentLocations', @level2type=N'COLUMN',@level2name=N'EmploymentLocationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000990' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentLocations', @level2type=N'COLUMN',@level2name=N'EmploymentLocationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000990' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentLocations', @level2type=N'COLUMN',@level2name=N'EmploymentLocationDescription';
GO