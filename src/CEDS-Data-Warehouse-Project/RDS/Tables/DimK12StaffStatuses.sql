CREATE TABLE [RDS].[DimK12StaffStatuses] (
    [DimK12StaffStatusId]                                   INT            IDENTITY (1, 1) NOT NULL,
    [SpecialEducationAgeGroupTaughtCode]                    NVARCHAR (50)  NULL,
    [SpecialEducationAgeGroupTaughtDescription]             NVARCHAR (200) NULL,
    [SpecialEducationAgeGroupTaughtEdFactsCode]             NVARCHAR (50)  NULL,
    [EdFactsCertificationStatusCode]                        NVARCHAR (50)  NULL,
    [EdFactsCertificationStatusDescription]                 NVARCHAR (200) NULL,
    [EdFactsCertificationStatusEdFactsCode]                 NVARCHAR (50)  NULL,
    [HighlyQualifiedTeacherIndicatorCode]                   NVARCHAR (50)  NULL,
    [HighlyQualifiedTeacherIndicatorDescription]            NVARCHAR (200) NULL,
    [HighlyQualifiedTeacherIndicatorEdFactsCode]            NVARCHAR (50)  NULL,
    [EdFactsTeacherInexperiencedStatusCode]                 NVARCHAR (50)  NULL,
    [EdFactsTeacherInexperiencedStatusDescription]          NVARCHAR (200) NULL,
    [EdFactsTeacherInexperiencedStatusEdFactsCode]          NVARCHAR (50)  NULL,
    [EmergencyOrProvisionalCredentialStatusCode]            NVARCHAR (100) NULL,
    [EmergencyOrProvisionalCredentialStatusDescription]     NVARCHAR (400) NULL,
    [EmergencyOrProvisionalCredentialStatusEdFactsCode]     NVARCHAR (100) NULL,
    [TeachingCredentialTypeCode]                            NVARCHAR (50)  NULL,
    [TeachingCredentialTypeDescription]                     NVARCHAR (200) NULL,
    [TeachingCredentialTypeEdFactsCode]                     NVARCHAR (50)  NULL,
    [EdFactsTeacherOutOfFieldStatusCode]                    NVARCHAR (50)  NULL,
    [EdFactsTeacherOutOfFieldStatusDescription]             NVARCHAR (200) NULL,
    [EdFactsTeacherOutOfFieldStatusEdFactsCode]             NVARCHAR (50)  NULL,
    [SpecialEducationTeacherQualificationStatusCode]        NVARCHAR (50)  NULL,
    [SpecialEducationTeacherQualificationStatusDescription] NVARCHAR (50)  NULL,
    [SpecialEducationTeacherQualificationStatusEdFactsCode] NVARCHAR (50)  NULL,
    [ParaprofessionalQualificationStatusCode]               NVARCHAR (50)  NULL,
    [ParaprofessionalQualificationStatusDescription]        NVARCHAR (50)  NULL,
    [ParaprofessionalQualificationStatusEdFactsCode]        NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimK12StaffStatuses] PRIMARY KEY CLUSTERED ([DimK12StaffStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_HighlyQualifiedTeacherIndicatorCode]
    ON [RDS].[DimK12StaffStatuses]([HighlyQualifiedTeacherIndicatorCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_Codes]
    ON [RDS].[DimK12StaffStatuses]([SpecialEducationAgeGroupTaughtCode] ASC, [EdFactsCertificationStatusCode] ASC, [HighlyQualifiedTeacherIndicatorCode] ASC, [EdFactsTeacherInexperiencedStatusCode] ASC, [TeachingCredentialTypeCode] ASC, [EdFactsTeacherOutOfFieldStatusCode] ASC, [SpecialEducationTeacherQualificationStatusCode] ASC, [ParaprofessionalQualificationStatusCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_SpecialEducationTeacherQualificationStatusEdFactsCode]
    ON [RDS].[DimK12StaffStatuses]([SpecialEducationTeacherQualificationStatusEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_ParaprofessionalQualificationStatusEdFactsCode]
    ON [RDS].[DimK12StaffStatuses]([ParaprofessionalQualificationStatusEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_EdFactsTeacherInexperiencedStatusCode]
    ON [RDS].[DimK12StaffStatuses]([EdFactsTeacherInexperiencedStatusCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_SpecialEducationAgeGroupTaughtEdFactsCode]
    ON [RDS].[DimK12StaffStatuses]([SpecialEducationAgeGroupTaughtEdFactsCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_EdFactsCertificationStatusCode]
    ON [RDS].[DimK12StaffStatuses]([EdFactsCertificationStatusCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_EdFactsTeacherOutOfFieldStatusEdFactsCode]
    ON [RDS].[DimK12StaffStatuses]([EdFactsTeacherOutOfFieldStatusEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_TeachingCredentialTypeEdFactsCode]
    ON [RDS].[DimK12StaffStatuses]([TeachingCredentialTypeEdFactsCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

