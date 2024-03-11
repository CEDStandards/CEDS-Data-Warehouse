CREATE TABLE [RDS].[DimK12CourseStatuses] (
    [DimK12CourseStatusId]                 INT            IDENTITY (1, 1) NOT NULL,
    [CourseLevelCharacteristicCode]        NVARCHAR (50)  CONSTRAINT [DF_DimK12CourseStatuses_CourseLevelCharacteristicCode] DEFAULT ('MISSING') NOT NULL,
    [CourseLevelCharacteristicDescription] NVARCHAR (200) CONSTRAINT [DF_DimK12CourseStatuses_CourseLevelCharacteristicDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimK12CourseStatuses] PRIMARY KEY CLUSTERED ([DimK12CourseStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12CourseStatuses_CourseLevelCharacteristicCode]
    ON [RDS].[DimK12CourseStatuses]([CourseLevelCharacteristicCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelCharacteristicCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the general nature and difficulty of instruction provided throughout a course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelCharacteristicCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Level Characteristic' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelCharacteristicCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000061' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelCharacteristicCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21061' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelCharacteristicCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelCharacteristicDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the general nature and difficulty of instruction provided throughout a course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelCharacteristicDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Level Characteristic' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelCharacteristicDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000061' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelCharacteristicDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21061' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelCharacteristicDescription';
GO
