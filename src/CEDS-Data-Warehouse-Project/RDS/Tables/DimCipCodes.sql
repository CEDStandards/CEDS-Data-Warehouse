CREATE TABLE [RDS].[DimCipCodes] (
    [DimCipCodeId]          INT            NOT NULL,
    [CipCode]               NVARCHAR (7)   NULL,
    [CipUseCode]            NVARCHAR (50)  NULL,
    [CipUseDescription]     NVARCHAR (200) NULL,
    [CipVersionCode]        NVARCHAR (50)  NULL,
    [CipVersionDescription] NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimCipCodes] PRIMARY KEY CLUSTERED ([DimCipCodeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimCipCodes_CipCode]
    ON [RDS].[DimCipCodes]([CipCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A six-digit code in the form xx.xxxx that identifies instructional program specialties within educational institutions.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Classification of Instructional Program Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000043' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21043' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipUseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of whether the CIP Code is referencing an enrollment program or an award program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipUseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Classification of Instructional Program Use' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipUseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000044' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipUseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21044' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipUseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipUseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of whether the CIP Code is referencing an enrollment program or an award program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipUseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Classification of Instructional Program Use' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipUseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000044' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipUseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21044' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipUseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipVersionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The version of CIP being reported.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipVersionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Classification of Instructional Program Version' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipVersionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000045' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipVersionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21045' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipVersionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipVersionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The version of CIP being reported.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipVersionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Classification of Instructional Program Version' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipVersionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000045' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipVersionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21045' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipVersionDescription';
GO