CREATE TABLE [RDS].[DimIncidentBehaviors] (
    [DimIncidentBehaviorId]       INT            IDENTITY (1, 1) NOT NULL,
    [IncidentBehaviorCode]        NVARCHAR (100) CONSTRAINT [DF_DimIncidentBehaviorss_IncidentBehaviorCode] DEFAULT ('MISSING') NOT NULL,
    [IncidentBehaviorDescription] NVARCHAR (200) CONSTRAINT [DF_DimIncidentBehaviorss_IncidentBehaviorDescription] DEFAULT ('MISSING') NOT NULL,
    [SecondaryIncidentBehaviorCode]        NVARCHAR (100) CONSTRAINT [DF_DimIncidentBehaviorss_SecondaryIncidentBehaviorCode] DEFAULT ('MISSING') NOT NULL,
    [SecondaryIncidentBehaviorDescription] NVARCHAR (200) CONSTRAINT [DF_DimIncidentBehaviorss_SecondaryIncidentBehaviorDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimIncidentBehaviorId] PRIMARY KEY CLUSTERED ([DimIncidentBehaviorId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Categories of behavior coded for use in describing an incident.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Behavior' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000509' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000509' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Categories of behavior coded for use in describing an incident.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Behavior' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000509' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000509' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'SecondaryIncidentBehaviorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Supplemental information about an incident when the primary offense is more serious in nature than alcohol or drug, etc. offenses.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'SecondaryIncidentBehaviorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Secondary Incident Behavior' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'SecondaryIncidentBehaviorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000627' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'SecondaryIncidentBehaviorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000627' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'SecondaryIncidentBehaviorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'SecondaryIncidentBehaviorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Supplemental information about an incident when the primary offense is more serious in nature than alcohol or drug, etc. offenses.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'SecondaryIncidentBehaviorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Secondary Incident Behavior' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'SecondaryIncidentBehaviorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000627' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'SecondaryIncidentBehaviorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000627' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentBehaviors', @level2type=N'COLUMN',@level2name=N'SecondaryIncidentBehaviorDescription';
GO