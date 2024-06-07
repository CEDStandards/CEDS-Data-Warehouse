CREATE TABLE [RDS].[DimAeEmploymentBarriers] (
    [DimAeEmploymentBarrierId]       INT            IDENTITY (1, 1) NOT NULL,
    [WIOABarrierstoEmploymentCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAeEmploymentBarriers_WIOABarrierstoEmploymentCode] DEFAULT ('MISSING') NOT NULL,
    [WIOABarrierstoEmploymentDescription] NVARCHAR (200) CONSTRAINT [DF_DimAeEmploymentBarriers_WIOABarrierstoEmploymentDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAeEmploymentBarriers] PRIMARY KEY CLUSTERED ([DimAeEmploymentBarrierId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAeEmploymentBarriers_WIOABarrierstoEmploymentCode]
    ON [RDS].[DimAeEmploymentBarriers]([WIOABarrierstoEmploymentCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WIOABarrierstoEmploymentCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A self-identified barrier as defined by the Workforce Innovation and Opportunity Act (WIOA) that is presumed to affect placement of a participant in unsubsidized employment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WIOABarrierstoEmploymentCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'WIOA Barriers to Employment' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WIOABarrierstoEmploymentCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001940' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WIOABarrierstoEmploymentCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001940' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WIOABarrierstoEmploymentCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WIOABarrierstoEmploymentDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A self-identified barrier as defined by the Workforce Innovation and Opportunity Act (WIOA) that is presumed to affect placement of a participant in unsubsidized employment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WIOABarrierstoEmploymentDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'WIOA Barriers to Employment' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WIOABarrierstoEmploymentDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001940' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WIOABarrierstoEmploymentDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001940' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WIOABarrierstoEmploymentDescription';
GO



