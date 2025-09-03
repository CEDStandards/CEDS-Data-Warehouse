CREATE TABLE [RDS].[DimWeapons] (
    [DimWeaponId]           INT           IDENTITY (1, 1) NOT NULL,
    [WeaponTypeCode]        VARCHAR (50)  CONSTRAINT [DF_DimWeapons_WeaponTypeCode] DEFAULT ('MISSING') NOT NULL,
    [WeaponTypeDescription] VARCHAR (200) CONSTRAINT [DF_DimWeapons_WeaponTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [WeaponTypeEdFactsCode] VARCHAR (50)  CONSTRAINT [DF_DimWeapons_WeaponTypeEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimWeapons] PRIMARY KEY CLUSTERED ([DimWeaponId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimWeapons_WeaponTypeCode]
    ON [RDS].[DimWeapons]([WeaponTypeCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimWeapons_WeaponTypeEdFactsCode]
    ON [RDS].[DimWeapons]([WeaponTypeEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWeapons', @level2type=N'COLUMN',@level2name=N'WeaponTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Identifies the type of weapon used during an incident.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWeapons', @level2type=N'COLUMN',@level2name=N'WeaponTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Weapon Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWeapons', @level2type=N'COLUMN',@level2name=N'WeaponTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001211' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWeapons', @level2type=N'COLUMN',@level2name=N'WeaponTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001211' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWeapons', @level2type=N'COLUMN',@level2name=N'WeaponTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWeapons', @level2type=N'COLUMN',@level2name=N'WeaponTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Identifies the type of weapon used during an incident.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWeapons', @level2type=N'COLUMN',@level2name=N'WeaponTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Weapon Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWeapons', @level2type=N'COLUMN',@level2name=N'WeaponTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001211' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWeapons', @level2type=N'COLUMN',@level2name=N'WeaponTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001211' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWeapons', @level2type=N'COLUMN',@level2name=N'WeaponTypeDescription';
GO