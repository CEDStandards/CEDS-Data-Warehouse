CREATE TABLE [RDS].[DimAeProgramTypes] (
    [DimAeProgramTypeId]                    INT            IDENTITY (1, 1) NOT NULL,
    [AeInstructionalProgramTypeCode]        NVARCHAR (50)  NULL,
    [AeInstructionalProgramTypeDescription] NVARCHAR (150) NULL,
    [AeSpecialProgramTypeCode]              NVARCHAR (50)  NULL,
    [AeSpecialProgramTypeDescription]       NVARCHAR (150) NULL,
    [WioaCareerServicesCode]                NVARCHAR (50)  NULL,
    [WioaCareerServicesDescription]         NVARCHAR (150) NULL,
    [WioaTrainingServicesCode]              NVARCHAR (50)  NULL,
    [WioaTrainingServicesDescription]       NVARCHAR (150) NULL,
    CONSTRAINT [PK_DimAeProgramTypes] PRIMARY KEY CLUSTERED ([DimAeProgramTypeId] ASC)
);


GO

