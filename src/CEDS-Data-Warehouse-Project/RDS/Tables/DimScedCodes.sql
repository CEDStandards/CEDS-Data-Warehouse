CREATE TABLE [RDS].[DimScedCodes] (
    [DimScedCodeId]                    INT             IDENTITY (1, 1) NOT NULL,
    [ScedCourseCode]                   NCHAR (5)       NOT NULL,
    [ScedCourseTitle]                  NVARCHAR (50)   NOT NULL,
    [ScedCourseCodeDescription]        NVARCHAR (2000) NOT NULL,
    [ScedCourseLevelCode]              NVARCHAR (50)   NOT NULL,
    [ScedCourseLevelDescription]       NVARCHAR (200)  NOT NULL,
    [ScedCourseSubjectAreaCode]        NVARCHAR (50)   NOT NULL,
    [ScedCourseSubjectAreaDescription] NVARCHAR (200)  NOT NULL,
    [ScedGradeSpan]                    NCHAR (4)       NOT NULL,
    [ScedSequenceOfCourse]             NCHAR (10)      NOT NULL,
    CONSTRAINT [PK_DimScedCodes] PRIMARY KEY CLUSTERED ([DimScedCodeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimScedCodes_Codes]
    ON [RDS].[DimScedCodes]([ScedCourseCode] ASC, [ScedCourseLevelCode] ASC, [ScedCourseSubjectAreaCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40670', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimScedCodes', @level2type = N'COLUMN', @level2name = N'ScedCourseTitle';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40668', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimScedCodes', @level2type = N'COLUMN', @level2name = N'ScedCourseLevelDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40671', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimScedCodes', @level2type = N'COLUMN', @level2name = N'ScedCourseSubjectAreaCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40670', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimScedCodes', @level2type = N'COLUMN', @level2name = N'ScedCourseCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38935', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimScedCodes', @level2type = N'COLUMN', @level2name = N'ScedSequenceOfCourse';


GO

