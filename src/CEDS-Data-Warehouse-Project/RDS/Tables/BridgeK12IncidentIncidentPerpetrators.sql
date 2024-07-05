CREATE TABLE [RDS].[BridgeK12IncidentIncidentPerpetrators]
(
    [BridgeK12IncidentIncidentPerpetratorId] int NOT NULL IDENTITY (1, 1),
    [FactK12IncidentId] INT NULL,
    [PersonId] BIGINT NULL,
    [IncidentPerpetratorTypeCode] NVARCHAR(50) NULL,
    [IncidentPerpetratorTypeDescription] NVARCHAR(200) NULL,
    [IncidentInjuryTypeCode] NVARCHAR(50) NULL,
    [IncidentInjuryTypeDescription] NVARCHAR(200) NULL,
    CONSTRAINT [PK_BridgeK12IncidentIncidentPerpetrators] PRIMARY KEY CLUSTERED ([BridgeK12IncidentIncidentPerpetratorId] ASC),
    CONSTRAINT [FK_BridgeK12IncidentIncidentPerpetrators_FactK12IncidentId] FOREIGN KEY ([FactK12IncidentId]) REFERENCES [RDS].[FactK12Incidents] ([FactK12IncidentId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_BridgeK12IncidentIncidentPerpetrators_PersonId] FOREIGN KEY ([PersonId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentIncidentPerpetrators_PersonId] 
 ON [RDS].[BridgeK12IncidentIncidentPerpetrators] ([PersonId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentIncidentPerpetrators_FactK12IncidentId] 
 ON [RDS].[BridgeK12IncidentIncidentPerpetrators] ([FactK12IncidentId] ASC)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the occurrence of physical injury to participants involved in the incident and, if so, the level of injury sustained.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Injury Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000510' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000510' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the occurrence of physical injury to participants involved in the incident and, if so, the level of injury sustained.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Injury Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000510' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000510' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentPerpetratorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Information on the type of individual who committed an incident. A “perpetrator” is an individual involved in an incident as an offender (the person who committed the infraction constituting the incident).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentPerpetratorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Perpetrator Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentPerpetratorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001372' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentPerpetratorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001372' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentPerpetratorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentPerpetratorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Information on the type of individual who committed an incident. A “perpetrator” is an individual involved in an incident as an offender (the person who committed the infraction constituting the incident).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentPerpetratorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Perpetrator Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentPerpetratorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001372' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentPerpetratorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001372' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentPerpetrators', @level2type=N'COLUMN',@level2name=N'IncidentPerpetratorTypeDescription';
GO