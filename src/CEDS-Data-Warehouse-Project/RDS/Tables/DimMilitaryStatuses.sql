CREATE TABLE [RDS].[DimMilitaryStatuses] (
    [DimMilitaryStatusId]                          INT            IDENTITY (1, 1) NOT NULL,
    [MilitaryConnectedStudentIndicatorCode]        NVARCHAR (50)  CONSTRAINT [DF_DimMilitaryStatuses_MilitaryConnectedStudentIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [MilitaryConnectedStudentIndicatorDescription] NVARCHAR (200) CONSTRAINT [DF_DimMilitaryStatuses_MilitaryConnectedStudentIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    [MilitaryConnectedStudentIndicatorEdFactsCode] NVARCHAR (50)  CONSTRAINT [DF_DimMilitaryStatuses_MilitaryConnectedStudentIndicatorEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [ActiveMilitaryStatusIndicatorCode]           NVARCHAR (50)  CONSTRAINT [DF_DimMilitaryStatuses_ActiveMilitaryStatusIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [ActiveMilitaryStatusIndicatorDescription]    NVARCHAR (200) CONSTRAINT [DF_DimMilitaryStatuses_ActiveMilitaryStatusIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    [MilitaryBranchCode]                           NVARCHAR (50)  CONSTRAINT [DF_DimMilitaryStatuses_MilitaryBranchCode] DEFAULT ('MISSING') NOT NULL,
    [MilitaryBranchDescription]                    NVARCHAR (200) CONSTRAINT [DF_DimMilitaryStatuses_MilitaryBranchDescription] DEFAULT ('MISSING') NOT NULL,
    [MilitaryVeteranStatusIndicatorCode]          NVARCHAR (50)  CONSTRAINT [DF_DimMilitaryStatuses_MilitaryVeteranStatusIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [MilitaryVeteranStatusIndicatorDescription]   NVARCHAR (200) CONSTRAINT [DF_DimMilitaryStatuses_MilitaryVeteranStatusIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimMilitaryStatuses] PRIMARY KEY CLUSTERED ([DimMilitaryStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimMilitaryStatuses_Codes]
    ON [RDS].[DimMilitaryStatuses]([MilitaryConnectedStudentIndicatorCode] ASC, [ActiveMilitaryStatusIndicatorCode] ASC, [MilitaryBranchCode] ASC, [MilitaryVeteranStatusIndicatorCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'ActiveMilitaryStatusIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates whether a person is an active member of the active duty forces, national guard, or reserve forces.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'ActiveMilitaryStatusIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Active Military Status Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'ActiveMilitaryStatusIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001577' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'ActiveMilitaryStatusIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001577' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'ActiveMilitaryStatusIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'ActiveMilitaryStatusIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates whether a person is an active member of the active duty forces, national guard, or reserve forces.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'ActiveMilitaryStatusIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Active Military Status Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'ActiveMilitaryStatusIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001577' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'ActiveMilitaryStatusIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001577' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'ActiveMilitaryStatusIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryBranchCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A branch of the U.S. Military applicable for specifying more details when using Military Connected Student Indicator, Military Active Student Indicator,  Military Veteran Student Indicator, and Military Enlistment After Exit elements.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryBranchCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Branch' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryBranchCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001640' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryBranchCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22621' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryBranchCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryBranchDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A branch of the U.S. Military applicable for specifying more details when using Military Connected Student Indicator, Military Active Student Indicator,  Military Veteran Student Indicator, and Military Enlistment After Exit elements.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryBranchDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Branch' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryBranchDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001640' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryBranchDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22621' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryBranchDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student''s parent or guardian is on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Connected Student Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001576' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student''s parent or guardian is on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Connected Student Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001576' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student''s parent or guardian is on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Connected Student Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001576' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStatusIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a person is a veteran who served on Active Duty, in the National Guard, or in the Reserve components of the United States military services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStatusIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Veteran Status Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStatusIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001578' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStatusIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001578' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStatusIndicatorDescription';
GO