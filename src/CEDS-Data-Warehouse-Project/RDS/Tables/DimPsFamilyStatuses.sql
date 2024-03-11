CREATE TABLE [RDS].[DimPsFamilyStatuses] (
    [DimPsFamilyStatusId]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [DependencyStatusCode]                    NVARCHAR (50)  CONSTRAINT [DF_DimPsFamilyStatuses_DependencyStatusCode] DEFAULT ('MISSING') NOT NULL,
    [DependencyStatusDescription]             NVARCHAR (200) CONSTRAINT [DF_DimPsFamilyStatuses_DependencyStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [NumberOfDependentsTypeCode]              NVARCHAR (50)  CONSTRAINT [DF_DimPsFamilyStatuses_NumberOfDependentsTypeCode] DEFAULT ('MISSING') NOT NULL,
    [NumberOfDependentsTypeDescription]       NVARCHAR (200) CONSTRAINT [DF_DimPsFamilyStatuses_NumberOfDependentsTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [SingleParentOrSinglePregnantWomanStatus] BIT            CONSTRAINT [DF_DimPsFamilyStatuses_SingleParentOrSinglePregnantWomanStatus] DEFAULT ((0)) NOT NULL,
    [MaternalGuardianEducationCode]           NVARCHAR (50)  CONSTRAINT [DF_DimPsFamilyStatuses_MaternalGuardianEducationCode] DEFAULT ('MISSING') NOT NULL,
    [MaternalGuardianEducationDescription]    NVARCHAR (200) CONSTRAINT [DF_DimPsFamilyStatuses_MaternalGuardianEducationDescription] DEFAULT ('MISSING') NOT NULL,
    [PaternalGuardianEducationCode]           NVARCHAR (50)  CONSTRAINT [DF_DimPsFamilyStatuses_PaternalGuardianEducationCode] DEFAULT ('MISSING') NOT NULL,
    [PaternalGuardianEducationDescription]    NVARCHAR (200) CONSTRAINT [DF_DimPsFamilyStatuses_PaternalGuardianEducationDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimPsFamilyStatuses] PRIMARY KEY CLUSTERED ([DimPsFamilyStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsFamilyStatuses_Codes]
    ON [RDS].[DimPsFamilyStatuses]([DependencyStatusCode] ASC, [NumberOfDependentsTypeCode] ASC, [MaternalGuardianEducationCode] ASC, [PaternalGuardianEducationCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'DependencyStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person''s classification as dependent or independent with regards to eligibility for Title IV Federal Student aid.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'DependencyStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Dependency Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'DependencyStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000079' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'DependencyStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21079' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'DependencyStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'DependencyStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person''s classification as dependent or independent with regards to eligibility for Title IV Federal Student aid.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'DependencyStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Dependency Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'DependencyStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000079' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'DependencyStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21079' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'DependencyStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'MaternalGuardianEducationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The highest level of education attained by a person''s mother or maternal guardian' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'MaternalGuardianEducationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Maternal Guardian Education' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'MaternalGuardianEducationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001229' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'MaternalGuardianEducationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'MaternalGuardianEducationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'MaternalGuardianEducationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The highest level of education attained by a person''s mother or maternal guardian' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'MaternalGuardianEducationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Maternal Guardian Education' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'MaternalGuardianEducationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001229' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'MaternalGuardianEducationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'MaternalGuardianEducationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'NumberOfDependentsTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of dependents who live with the student and receive more than half their support from them.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'NumberOfDependentsTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Number of Dependents' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'NumberOfDependentsTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001415' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'NumberOfDependentsTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22384' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'NumberOfDependentsTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'NumberOfDependentsTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of dependents who live with the student and receive more than half their support from them.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'NumberOfDependentsTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Number of Dependents' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'NumberOfDependentsTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001415' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'NumberOfDependentsTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22384' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'NumberOfDependentsTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'PaternalGuardianEducationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The highest level of education attained by a person''s father or paternal guardian' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'PaternalGuardianEducationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Paternal Guardian Education' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'PaternalGuardianEducationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001230' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'PaternalGuardianEducationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22195' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'PaternalGuardianEducationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'PaternalGuardianEducationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The highest level of education attained by a person''s father or paternal guardian' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'PaternalGuardianEducationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Paternal Guardian Education' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'PaternalGuardianEducationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001230' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'PaternalGuardianEducationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22195' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'PaternalGuardianEducationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A student who, at some time during the school year, is either a pregnant female student who is unmarried; or a male or female student who is unmarried or legally separated from a spouse and has a minor child or children.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Single Parent or Single Pregnant Woman Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000580' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21573' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'SingleParentOrSinglePregnantWomanStatus';
GO