CREATE TABLE [RDS].[DimExtendedLearningObjectSubjectAreas](
        [DimExtendedLearningObjectSubjectAreasId] [int] IDENTITY(1,1) NOT NULL,
        [SCEDCourseSubjectAreaCode] int NULL,
        [SCEDCourseSubjectAreaDescription]  [nvarchar](255) NULL,
    CONSTRAINT [PK_DimExtendedLearningObjectSubjectAreas] PRIMARY KEY CLUSTERED ([DimExtendedLearningObjectSubjectAreasId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
    );
    GO