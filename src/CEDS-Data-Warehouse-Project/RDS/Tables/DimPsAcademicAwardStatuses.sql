CREATE TABLE [RDS].[DimPsAcademicAwardStatuses] (
    [DimPsAcademicAwardStatusId]                            INT            IDENTITY (1, 1) NOT NULL,
    [PescAwardLevelTypeCode]                                NVARCHAR (50)  NULL,
    [PescAwardLevelTypeDescription]                         NVARCHAR (400) NULL,
    [ProfessionalOrTechnicalCredentialConferredCode]        NVARCHAR (50)  NULL,
    [ProfessionalOrTechnicalCredentialConferredDescription] NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimPsAcademicAwardStatuses] PRIMARY KEY CLUSTERED ([DimPsAcademicAwardStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsAcademicAwardStatuses_Codes]
    ON [RDS].[DimPsAcademicAwardStatuses]([PescAwardLevelTypeCode] ASC, [ProfessionalOrTechnicalCredentialConferredCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

