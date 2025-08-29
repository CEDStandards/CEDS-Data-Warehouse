CREATE TABLE [RDS].[DimAcademicTermDesignators] (
    [DimAcademicTermDesignatorId]       INT            IDENTITY (1, 1) NOT NULL,
    [AcademicTermDesignatorCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAcademicTermDesignators_AcademicTermDesignatorCode] DEFAULT ('MISSING') NOT NULL,
    [AcademicTermDesignatorDescription] NVARCHAR (MAX) CONSTRAINT [DF_DimAcademicTermDesignators_AcademicTermDesignatorDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAcademicTermDesignators] PRIMARY KEY CLUSTERED ([DimAcademicTermDesignatorId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAcademicTermDesignators_AcademicTermDesignatorCode]
    ON [RDS].[DimAcademicTermDesignators]([AcademicTermDesignatorCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAcademicTermDesignators', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The academic term for which the data apply.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAcademicTermDesignators', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Academic Term Designator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAcademicTermDesignators', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000727' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAcademicTermDesignators', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000727' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAcademicTermDesignators', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAcademicTermDesignators', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The academic term for which the data apply.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAcademicTermDesignators', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Academic Term Designator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAcademicTermDesignators', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000727' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAcademicTermDesignators', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000727' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAcademicTermDesignators', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorDescription';
GO

