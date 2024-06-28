CREATE TABLE [RDS].[BridgeK12IncidentsIncidentReporters]
(
    [BridgeK12IncidentsIncidentReporterId] int NOT NULL IDENTITY (1, 1),
    [FactK12IncidentId] INT NULL,
    [PersonId] BIGINT NULL,
    [IncidentReporterTypeCode] NVARCHAR(50) NULL,
    [IncidentReporterTypeDescription] NVARCHAR(200) NULL,
    [IncidentInjuryTypeCode] NVARCHAR(50) NULL,
    [IncidentInjuryTypeDescription] NVARCHAR(200) NULL,
    CONSTRAINT [PK_BridgeK12IncidentsIncidentReporters] PRIMARY KEY CLUSTERED ([BridgeK12IncidentsIncidentReporterId] ASC),
    CONSTRAINT [FK_BridgeK12IncidentsIncidentReporters_FactK12IncidentId] FOREIGN KEY ([FactK12IncidentId]) REFERENCES [RDS].[FactK12Incidents] ([FactK12IncidentId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_BridgeK12IncidentsIncidentReporters_PersonId] FOREIGN KEY ([PersonId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentsIncidentReporters_PersonId] 
 ON [RDS].[BridgeK12IncidentsIncidentReporters] ([PersonId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentsIncidentReporters_FactK12IncidentId] 
 ON [RDS].[BridgeK12IncidentsIncidentReporters] ([FactK12IncidentId] ASC)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the occurrence of physical injury to participants involved in the incident and, if so, the level of injury sustained.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Injury Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000510' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000510' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the occurrence of physical injury to participants involved in the incident and, if so, the level of injury sustained.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Injury Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000510' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000510' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentReporterTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Information on the type of person who reported the incident. When known and/or if useful, use a more specific option code (e.g., "Counselor" rather than "Professional Staff").' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentReporterTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Reporter Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentReporterTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000506' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentReporterTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000506' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentReporterTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentReporterTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Information on the type of person who reported the incident. When known and/or if useful, use a more specific option code (e.g., "Counselor" rather than "Professional Staff").' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentReporterTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Reporter Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentReporterTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000506' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentReporterTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000506' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentsIncidentReporters', @level2type=N'COLUMN',@level2name=N'IncidentReporterTypeDescription';
GO