CREATE TABLE [RDS].[DimParentOrGuardianIndicators] (
    [DimParentOrGuardianIndicatorId]                      INT IDENTITY (1, 1) NOT NULL,
    [CustodialParentOrGuardianIndicatorCode]                 NVARCHAR (50)  NOT NULL,
    [CustodialParentOrGuardianIndicatorDescription]         NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DimParentOrGuardianIndicators] PRIMARY KEY CLUSTERED ([DimParentOrGuardianIndicatorId] ASC)
);


GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'CustodialParentOrGuardianIndicatorCode', @level2type=N'COLUMN',@level2name=N'DimParentOrGuardianIndicators';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a person has legal custody of a child.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'CustodialParentOrGuardianIndicatorCode', @level2type=N'COLUMN',@level2name=N'DimParentOrGuardianIndicators';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Custodial Parent or Guardian Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'CustodialParentOrGuardianIndicatorCode', @level2type=N'COLUMN',@level2name=N'DimParentOrGuardianIndicators';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000329' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'CustodialParentOrGuardianIndicatorCode', @level2type=N'COLUMN',@level2name=N'DimParentOrGuardianIndicators';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000329' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'CustodialParentOrGuardianIndicatorCode', @level2type=N'COLUMN',@level2name=N'DimParentOrGuardianIndicators';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'CustodialParentOrGuardianIndicatorDescription', @level2type=N'COLUMN',@level2name=N'DimParentOrGuardianIndicators';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a person has legal custody of a child.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'CustodialParentOrGuardianIndicatorDescription', @level2type=N'COLUMN',@level2name=N'DimParentOrGuardianIndicators';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Custodial Parent or Guardian Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'CustodialParentOrGuardianIndicatorDescription', @level2type=N'COLUMN',@level2name=N'DimParentOrGuardianIndicators';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000329' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'CustodialParentOrGuardianIndicatorDescription', @level2type=N'COLUMN',@level2name=N'DimParentOrGuardianIndicators';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000329' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'CustodialParentOrGuardianIndicatorDescription', @level2type=N'COLUMN',@level2name=N'DimParentOrGuardianIndicators';
GO
