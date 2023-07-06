CREATE TABLE [RDS].[DimK12Courses] (
    [DimK12CourseId]                 INT            IDENTITY (1, 1) NOT NULL,
    [CourseIdentifier]               NVARCHAR (40)  NOT NULL,
    [CourseCodeSystemCode]           NVARCHAR (50)  NOT NULL,
    [CourseCodeSystemDescription]    NVARCHAR (200) NOT NULL,
    [CourseTitle]                    NVARCHAR (60)  NOT NULL,
    [CourseDescription]              NVARCHAR (60)  NOT NULL,
    [CourseDepartmentName]           NVARCHAR (60)  NOT NULL,
    [CourseCreditUnitsCode]          NVARCHAR (50)  NOT NULL,
    [CourseCreditUnitsDescription]   NVARCHAR (200) NOT NULL,
    [CreditValue]                    DECIMAL (4, 2) NOT NULL,
    [AdvancedPlacementCourseCode]    NVARCHAR (60)  NOT NULL,
    [CareerClusterCode]              NVARCHAR (50)  NOT NULL,
    [CareerClusterDescription]       NVARCHAR (200) NOT NULL,
    [CourseCertificationDescription] NVARCHAR (300) NOT NULL,
    [TuitionFunded]                  BIT            NOT NULL,
    [CourseFundingProgram]           NVARCHAR (30)  NULL,
    CONSTRAINT [PK_DimK12Courses] PRIMARY KEY CLUSTERED ([DimK12CourseId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12Courses_CourseTitle]
    ON [RDS].[DimK12Courses]([CourseTitle] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40098', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12Courses', @level2type = N'COLUMN', @level2name = N'CourseCertificationDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40566', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12Courses', @level2type = N'COLUMN', @level2name = N'AdvancedPlacementCourseCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38718', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12Courses', @level2type = N'COLUMN', @level2name = N'CourseCreditUnitsCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38944', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12Courses', @level2type = N'COLUMN', @level2name = N'CourseCodeSystemCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40932', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12Courses', @level2type = N'COLUMN', @level2name = N'TuitionFunded';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40074', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12Courses', @level2type = N'COLUMN', @level2name = N'CareerClusterCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38718', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12Courses', @level2type = N'COLUMN', @level2name = N'CourseCreditUnitsDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40102', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12Courses', @level2type = N'COLUMN', @level2name = N'CourseDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40104', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12Courses', @level2type = N'COLUMN', @level2name = N'CourseFundingProgram';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40074', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12Courses', @level2type = N'COLUMN', @level2name = N'CareerClusterDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38719', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12Courses', @level2type = N'COLUMN', @level2name = N'CreditValue';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40102', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12Courses', @level2type = N'COLUMN', @level2name = N'CourseDepartmentName';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38943', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12Courses', @level2type = N'COLUMN', @level2name = N'CourseIdentifier';


GO

