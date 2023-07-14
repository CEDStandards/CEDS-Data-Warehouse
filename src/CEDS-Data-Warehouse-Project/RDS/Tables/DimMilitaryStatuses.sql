CREATE TABLE [RDS].[DimMilitaryStatuses] (
    [DimMilitaryStatusId]                          INT            IDENTITY (1, 1) NOT NULL,
    [MilitaryConnectedStudentIndicatorCode]        NVARCHAR (50)  NULL,
    [MilitaryConnectedStudentIndicatorDescription] NVARCHAR (200) NULL,
    [MilitaryConnectedStudentIndicatorEdFactsCode] NVARCHAR (50)  NULL,
    [MilitaryActiveStudentIndicatorCode]           NVARCHAR (50)  NULL,
    [MilitaryActiveStudentIndicatorDescription]    NVARCHAR (200) NULL,
    [MilitaryBranchCode]                           NVARCHAR (50)  NULL,
    [MilitaryBranchDescription]                    NVARCHAR (200) NULL,
    [MilitaryVeteranStudentIndicatorCode]          NVARCHAR (50)  NULL,
    [MilitaryVeteranStudentIndicatorDescription]   NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimMilitaryStatuses] PRIMARY KEY CLUSTERED ([DimMilitaryStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimMilitaryStatuses_Codes]
    ON [RDS].[DimMilitaryStatuses]([MilitaryConnectedStudentIndicatorCode] ASC, [MilitaryActiveStudentIndicatorCode] ASC, [MilitaryBranchCode] ASC, [MilitaryVeteranStudentIndicatorCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student is currently serving on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Active Student Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001577' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22556' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student is currently serving on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Active Student Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001577' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22556' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicatorDescription';
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
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student’s parent or guardian is on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Connected Student Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001576' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student’s parent or guardian is on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Connected Student Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001576' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student’s parent or guardian is on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Connected Student Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001576' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student is a veteran who served on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Veteran Student Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001578' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22557' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student is a veteran who served on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Veteran Student Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001578' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22557' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMilitaryStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicatorDescription';
GO