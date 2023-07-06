CREATE TABLE [RDS].[DimResponsibleSchoolTypes] (
    [DimResponsibleSchoolTypeId]                                     INT             IDENTITY (1, 1) NOT NULL,
    [ResponsibleSchoolTypeAccountability]                            NVARCHAR (100)  NOT NULL,
    [ResponsibleSchoolTypeAccountabilityCode]                        NVARCHAR (300)  NOT NULL,
    [ResponsibleSchoolTypeAccountabilityDescription]                 NVARCHAR (1000) NOT NULL,
    [ResponsibleSchoolTypeAttendance]                                NVARCHAR (10)   NOT NULL,
    [ResponsibleSchoolTypeAttendanceCode]                            NVARCHAR (100)  NOT NULL,
    [ResponsibleSchoolTypeAttendanceDescription]                     NVARCHAR (1000) NOT NULL,
    [ResponsibleSchoolTypeFunding]                                   NVARCHAR (10)   NOT NULL,
    [ResponsibleSchoolTypeFundingCode]                               NVARCHAR (100)  NOT NULL,
    [ResponsibleSchoolTypeFundingDescription]                        NVARCHAR (1000) NOT NULL,
    [ResponsibleSchoolTypeGraduation]                                NVARCHAR (10)   NOT NULL,
    [ResponsibleSchoolTypeGraduationCode]                            NVARCHAR (100)  NOT NULL,
    [ResponsibleSchoolTypeGraduationDescription]                     NVARCHAR (1000) NOT NULL,
    [ResponsibleSchoolTypeIndividualizedEducationProgram]            NVARCHAR (10)   NOT NULL,
    [ResponsibleSchoolTypeIndividualizedEducationProgramCode]        NVARCHAR (100)  NOT NULL,
    [ResponsibleSchoolTypeIndividualizedEducationProgramDescription] NVARCHAR (1000) NOT NULL,
    [ResponsibleSchoolTypeTransportation]                            NVARCHAR (10)   NOT NULL,
    [ResponsibleSchoolTypeTransportationCode]                        NVARCHAR (100)  NOT NULL,
    [ResponsibleSchoolTypeTransportationDescription]                 NVARCHAR (1000) NOT NULL,
    [ResponsibleSchoolTypeIepServiceProvider]                        NVARCHAR (10)   NOT NULL,
    [ResponsibleSchoolTypeIepServiceProviderCode]                    NVARCHAR (100)  NOT NULL,
    [ResponsibleSchoolTypeIepServiceProviderDescription]             NVARCHAR (1000) NOT NULL,
    CONSTRAINT [PK_DimResponsibleSchoolTypes] PRIMARY KEY CLUSTERED ([DimResponsibleSchoolTypeId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimResponsibleSchoolTypes_YesNoCodes]
    ON [RDS].[DimResponsibleSchoolTypes]([ResponsibleSchoolTypeAccountability] ASC, [ResponsibleSchoolTypeAttendance] ASC, [ResponsibleSchoolTypeFunding] ASC, [ResponsibleSchoolTypeGraduation] ASC, [ResponsibleSchoolTypeIndividualizedEducationProgram] ASC, [ResponsibleSchoolTypeTransportation] ASC, [ResponsibleSchoolTypeIepServiceProvider] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

