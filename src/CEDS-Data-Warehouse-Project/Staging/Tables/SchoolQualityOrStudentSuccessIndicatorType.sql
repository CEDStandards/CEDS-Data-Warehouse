CREATE TABLE [Staging].[SchoolQualityOrStudentSuccessIndicatorType] (
    [Id]                                                    INT            IDENTITY (1, 1) NOT NULL,
    [SchoolQualityOrStudentSuccessIndicatorTypeCode]        NVARCHAR (50)  NULL,
    [SchoolQualityOrStudentSuccessIndicatorTypeDescription] NVARCHAR (100) NULL,
    [SchoolQualityOrStudentSuccessIndicatorTypeDefinition]  NVARCHAR (MAX) NULL,
    [RefSchoolQualityOrStudentSuccessIndicatorTypeId]       INT            NULL,
    [RunDateTime]                                           DATETIME       NULL,
    CONSTRAINT [PK_ScoolQualityOrStudentSuccessIndicatorType] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

