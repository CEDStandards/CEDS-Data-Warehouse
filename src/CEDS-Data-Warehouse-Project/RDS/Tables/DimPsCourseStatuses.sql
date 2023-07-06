CREATE TABLE [RDS].[DimPsCourseStatuses] (
    [DimPsCourseStatusId]              INT            NOT NULL,
    [CourseLevelTypeCode]              NVARCHAR (50)  NULL,
    [CourseLevelTypeDescription]       NVARCHAR (200) NULL,
    [CourseHonorsTypeCode]             NVARCHAR (50)  NULL,
    [CourseHonorsTypeDescription]      NVARCHAR (200) NULL,
    [CourseCreditBasisTypeCode]        NVARCHAR (50)  NULL,
    [CourseCreditBasisTypeDescription] NVARCHAR (200) NULL,
    [CourseCreditLevelTypeCode]        NVARCHAR (50)  NULL,
    [CourseCreditLevelTypeDescription] NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimPsCourse] PRIMARY KEY CLUSTERED ([DimPsCourseStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsCourseStatuses_Codes]
    ON [RDS].[DimPsCourseStatuses]([CourseLevelTypeCode] ASC, [CourseHonorsTypeCode] ASC, [CourseCreditBasisTypeCode] ASC, [CourseCreditLevelTypeCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

