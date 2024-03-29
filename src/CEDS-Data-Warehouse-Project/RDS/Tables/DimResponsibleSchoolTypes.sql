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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountability';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountabilityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountabilityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountabilityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountabilityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountabilityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountabilityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountabilityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountabilityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountabilityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountabilityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendance';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendance';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendance';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendance';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendance';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendanceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendanceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendanceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendanceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendanceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendanceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendanceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendanceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendanceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendanceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFunding';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFunding';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFunding';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFunding';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFunding';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFundingCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFundingCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFundingCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFundingCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFundingCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFundingDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFundingDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFundingDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFundingDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFundingDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduation';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProvider';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProvider';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProvider';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProvider';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProvider';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProviderCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProviderCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProviderCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProviderCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProviderCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProviderDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProviderDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProviderDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProviderDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProviderDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgramDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgramDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgramDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgramDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgramDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportation';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleSchoolTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportationDescription';
GO