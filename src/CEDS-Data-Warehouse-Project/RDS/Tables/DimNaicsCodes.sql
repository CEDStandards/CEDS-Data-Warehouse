
CREATE TABLE [RDS].[DimNaicsCodes] (
    [DimNaicsCodeId]                    INT             IDENTITY (1, 1) NOT NULL,
    [NaicsSectorCode]                  NVARCHAR(2)     NOT NULL,
    [NaicsSectorDescription]           NVARCHAR(200)   NOT NULL,
    [NaicsSubsectorCode]               NVARCHAR(1)     NOT NULL,
    [NaicsSubsectorDescription]        NVARCHAR(200)   NOT NULL,
    [NaicsIndustryGroupCode]           NVARCHAR(1)     NOT NULL,
    [NaicsIndustryGroupDescription]    NVARCHAR(200)   NOT NULL,
    [NaicsIndustryCode]                NVARCHAR(1)     NOT NULL,
    [NaicsIndustryDescription]         NVARCHAR(200)   NOT NULL,
    [NaicsNationalIndustryCode]        NVARCHAR(1)     NOT NULL,
    [NaicsNationalIndustryDescription] NVARCHAR(200)   NOT NULL,
    [EmploymentNaicsCode]              NVARCHAR(6)     NOT NULL,
    [EmploymentNaicsDescription]       NVARCHAR(200)   NOT NULL,
    [NaicsVersion]                     NVARCHAR(10)    NOT NULL,

    CONSTRAINT [PK_DimNaicsCodes] PRIMARY KEY CLUSTERED ([DimNaicsCodeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimNaicsCodes_Codes]
    ON [RDS].[DimNaicsCodes]([EmploymentNaicsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNaicsCodes', @level2type=N'COLUMN',@level2name=N'EmploymentNaicsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The North American Industry Classification System (NAICS) code associated with an individual''s employment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNaicsCodes', @level2type=N'COLUMN',@level2name=N'EmploymentNaicsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment NAICS Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNaicsCodes', @level2type=N'COLUMN',@level2name=N'EmploymentNaicsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001064' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNaicsCodes', @level2type=N'COLUMN',@level2name=N'EmploymentNaicsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001064' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNaicsCodes', @level2type=N'COLUMN',@level2name=N'EmploymentNaicsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNaicsCodes', @level2type=N'COLUMN',@level2name=N'EmploymentNaicsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The North American Industry Classification System (NAICS) code associated with an individual''s employment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNaicsCodes', @level2type=N'COLUMN',@level2name=N'EmploymentNaicsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment NAICS Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNaicsCodes', @level2type=N'COLUMN',@level2name=N'EmploymentNaicsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001064' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNaicsCodes', @level2type=N'COLUMN',@level2name=N'EmploymentNaicsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001064' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNaicsCodes', @level2type=N'COLUMN',@level2name=N'EmploymentNaicsDescription';
GO


