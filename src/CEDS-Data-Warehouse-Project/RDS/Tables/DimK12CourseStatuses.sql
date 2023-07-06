CREATE TABLE [RDS].[DimK12CourseStatuses] (
    [DimK12CourseStatusId]                 INT            IDENTITY (1, 1) NOT NULL,
    [CourseLevelCharacteristicCode]        NVARCHAR (50)  NOT NULL,
    [CourseLevelCharacteristicDescription] NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DimK12CourseStatuses] PRIMARY KEY CLUSTERED ([DimK12CourseStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12CourseStatuses_CourseLevelCharacteristicCode]
    ON [RDS].[DimK12CourseStatuses]([CourseLevelCharacteristicCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38928', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12CourseStatuses', @level2type = N'COLUMN', @level2name = N'CourseLevelCharacteristicCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38928', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12CourseStatuses', @level2type = N'COLUMN', @level2name = N'CourseLevelCharacteristicDescription';


GO

