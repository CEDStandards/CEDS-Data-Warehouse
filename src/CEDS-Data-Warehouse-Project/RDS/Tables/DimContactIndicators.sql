CREATE TABLE [RDS].[DimContactIndicators] (
    [DimContactIndicatorId]                      INT IDENTITY (1, 1) NOT NULL,
    [PrimaryContactIndicatorCode]                 NVARCHAR (50)  NOT NULL,
    [PrimaryContactIndicatorDescription]         NVARCHAR (200) NOT NULL,
    [EmergencyContactIndicatorCode]              NVARCHAR (50) NOT NULL,
    [EmergencyContactIndicatorDescription]       NVARCHAR (200)  NOT NULL,
    CONSTRAINT [PK_DimContactIndicators] PRIMARY KEY CLUSTERED ([DimContactIndicatorId] ASC)
);


GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContactIndicators', @level2type=N'COLUMN',@level2name=N'PrimaryContactIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that a person is a primary contact within the specified context, such as a primary parental contact specified in Person Relationship to Learner or a primary administrative contact for an organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContactIndicators', @level2type=N'COLUMN',@level2name=N'PrimaryContactIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Primary Contact Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContactIndicators', @level2type=N'COLUMN',@level2name=N'PrimaryContactIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001428' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContactIndicators', @level2type=N'COLUMN',@level2name=N'PrimaryContactIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001428' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContactIndicators', @level2type=N'COLUMN',@level2name=N'PrimaryContactIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContactIndicators', @level2type=N'COLUMN',@level2name=N'EmergencyContactIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates whether or not the person is a designated emergency contact for the learner.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContactIndicators', @level2type=N'COLUMN',@level2name=N'EmergencyContactIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Emergency Contact Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContactIndicators', @level2type=N'COLUMN',@level2name=N'EmergencyContactIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001341' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContactIndicators', @level2type=N'COLUMN',@level2name=N'EmergencyContactIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001341' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContactIndicators', @level2type=N'COLUMN',@level2name=N'EmergencyContactIndicatorCode';
GO
