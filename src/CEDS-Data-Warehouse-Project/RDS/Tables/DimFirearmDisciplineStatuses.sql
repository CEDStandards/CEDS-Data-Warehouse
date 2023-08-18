CREATE TABLE [RDS].[DimFirearmDisciplineStatuses] (
    [DimFirearmDisciplineStatusId]                        INT            IDENTITY (1, 1) NOT NULL,
    [DisciplineMethodForFirearmsIncidentsCode]            NVARCHAR (50)  NULL,
    [DisciplineMethodForFirearmsIncidentsDescription]     NVARCHAR (MAX) NULL,
    [DisciplineMethodForFirearmsIncidentsEdFactsCode]     NVARCHAR (50)  NULL,
    [IdeaDisciplineMethodForFirearmsIncidentsCode]        NVARCHAR (50)  NULL,
    [IdeaDisciplineMethodForFirearmsIncidentsDescription] NVARCHAR (MAX) NULL,
    [IdeaDisciplineMethodForFirearmsIncidentsEdFactsCode] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimFirearmDisciplineStatuses] PRIMARY KEY CLUSTERED ([DimFirearmDisciplineStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodForFirearmsIncidentsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method used to discipline students who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodForFirearmsIncidentsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Discipline Method for Firearms Incidents' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodForFirearmsIncidentsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodForFirearmsIncidentsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21546' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodForFirearmsIncidentsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodForFirearmsIncidentsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method used to discipline students who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodForFirearmsIncidentsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Discipline Method for Firearms Incidents' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodForFirearmsIncidentsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodForFirearmsIncidentsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21546' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodForFirearmsIncidentsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodForFirearmsIncidentsEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method used to discipline students who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodForFirearmsIncidentsEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Discipline Method for Firearms Incidents' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodForFirearmsIncidentsEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodForFirearmsIncidentsEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21546' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodForFirearmsIncidentsEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaDisciplineMethodForFirearmsIncidentsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The methods used to discipline students who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaDisciplineMethodForFirearmsIncidentsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Discipline Method for Firearms Incidents' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaDisciplineMethodForFirearmsIncidentsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000556' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaDisciplineMethodForFirearmsIncidentsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21547' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaDisciplineMethodForFirearmsIncidentsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaDisciplineMethodForFirearmsIncidentsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The methods used to discipline students who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaDisciplineMethodForFirearmsIncidentsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Discipline Method for Firearms Incidents' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaDisciplineMethodForFirearmsIncidentsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000556' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaDisciplineMethodForFirearmsIncidentsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21547' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaDisciplineMethodForFirearmsIncidentsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaDisciplineMethodForFirearmsIncidentsEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The methods used to discipline students who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaDisciplineMethodForFirearmsIncidentsEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Discipline Method for Firearms Incidents' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaDisciplineMethodForFirearmsIncidentsEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000556' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaDisciplineMethodForFirearmsIncidentsEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21547' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFirearmDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaDisciplineMethodForFirearmsIncidentsEdFactsCode';
GO