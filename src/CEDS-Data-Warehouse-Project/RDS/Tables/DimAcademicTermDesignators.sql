CREATE TABLE [RDS].[DimAcademicTermDesignators] (
    [DimAcademicTermDesignatorId]       INT            IDENTITY (1, 1) NOT NULL,
    [AcademicTermDesignatorCode]        NVARCHAR (50)  NULL,
    [AcademicTermDesignatorDescription] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_DimAcademicTermDesignators] PRIMARY KEY CLUSTERED ([DimAcademicTermDesignatorId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAcademicTermDesignators_AcademicTermDesignatorCode]
    ON [RDS].[DimAcademicTermDesignators]([AcademicTermDesignatorCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Def_Desc', @value = N'The academic term for which the data apply.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAcademicTermDesignators', @level2type = N'COLUMN', @level2name = N'AcademicTermDesignatorDescription';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Def_Desc', @value = N'The academic term for which the data apply.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAcademicTermDesignators', @level2type = N'COLUMN', @level2name = N'AcademicTermDesignatorCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Def_Desc', @value = N'The academic term for which the data apply.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAcademicTermDesignators', @level2type = N'COLUMN', @level2name = N'DimAcademicTermDesignatorId';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_URL', @value = N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=17703', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAcademicTermDesignators', @level2type = N'COLUMN', @level2name = N'AcademicTermDesignatorDescription';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_URL', @value = N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=17703', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAcademicTermDesignators', @level2type = N'COLUMN', @level2name = N'AcademicTermDesignatorCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_URL', @value = N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=17703', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAcademicTermDesignators', @level2type = N'COLUMN', @level2name = N'DimAcademicTermDesignatorId';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_ElementTechnicalName', @value = N'AcademicTermDesignator', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAcademicTermDesignators', @level2type = N'COLUMN', @level2name = N'AcademicTermDesignatorDescription';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_ElementTechnicalName', @value = N'AcademicTermDesignator', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAcademicTermDesignators', @level2type = N'COLUMN', @level2name = N'AcademicTermDesignatorCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_ElementTechnicalName', @value = N'AcademicTermDesignator', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAcademicTermDesignators', @level2type = N'COLUMN', @level2name = N'DimAcademicTermDesignatorId';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAcademicTermDesignators', @level2type = N'COLUMN', @level2name = N'AcademicTermDesignatorDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAcademicTermDesignators', @level2type = N'COLUMN', @level2name = N'AcademicTermDesignatorCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAcademicTermDesignators', @level2type = N'COLUMN', @level2name = N'DimAcademicTermDesignatorId';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_GlobalId', @value = N'000727', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAcademicTermDesignators', @level2type = N'COLUMN', @level2name = N'AcademicTermDesignatorDescription';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_GlobalId', @value = N'000727', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAcademicTermDesignators', @level2type = N'COLUMN', @level2name = N'AcademicTermDesignatorCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_GlobalId', @value = N'000727', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAcademicTermDesignators', @level2type = N'COLUMN', @level2name = N'DimAcademicTermDesignatorId';


GO

