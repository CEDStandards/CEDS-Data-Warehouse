CREATE TABLE [RDS].[DimAeEmploymentBarriers] (
    [DimAeEmploymentBarrierId]       INT            IDENTITY (1, 1) NOT NULL,
    [WioaBarriersToEmploymentCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAeEmploymentBarriers_WioaBarriersToEmploymentCode] DEFAULT ('MISSING') NOT NULL,
    [WioaBarriersToEmploymentDescription] NVARCHAR (200) CONSTRAINT [DF_DimAeEmploymentBarriers_WioaBarriersToEmploymentDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAeEmploymentBarriers] PRIMARY KEY CLUSTERED ([DimAeEmploymentBarrierId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAeEmploymentBarriers_WioaBarriersToEmploymentCode]
    ON [RDS].[DimAeEmploymentBarriers]([WioaBarriersToEmploymentCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WioaBarriersToEmploymentCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A self-identified barrier as defined by the Workforce Innovation and Opportunity Act (WIOA) that is presumed to affect placement of a participant in unsubsidized employment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WioaBarriersToEmploymentCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'WIOA Barriers to Employment' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WioaBarriersToEmploymentCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001940' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WioaBarriersToEmploymentCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001940' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WioaBarriersToEmploymentCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WioaBarriersToEmploymentDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A self-identified barrier as defined by the Workforce Innovation and Opportunity Act (WIOA) that is presumed to affect placement of a participant in unsubsidized employment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WioaBarriersToEmploymentDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'WIOA Barriers to Employment' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WioaBarriersToEmploymentDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001940' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WioaBarriersToEmploymentDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001940' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeEmploymentBarriers', @level2type=N'COLUMN',@level2name=N'WioaBarriersToEmploymentDescription';
GO



