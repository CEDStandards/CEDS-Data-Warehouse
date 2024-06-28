CREATE TABLE [RDS].[BridgeK12IncidentIncidentWitnesses]
(
	[BridgeK12IncidentIncidentWitnessId] int NOT NULL IDENTITY (1, 1),
	[FactK12IncidentId] INT NULL,
	[PersonId] BIGINT NULL,
    [IncidentWitnessTypeCode] NVARCHAR(50) NULL,
    [IncidentWitnessTypeDescription] NVARCHAR(200) NULL,
    [IncidentInjuryTypeCode] NVARCHAR(50) NULL,
    [IncidentInjuryTypeDescription] NVARCHAR(200) NULL,
	CONSTRAINT [PK_BridgeK12IncidentIncidentWitnesses] PRIMARY KEY CLUSTERED ([BridgeK12IncidentIncidentWitnessId] ASC),
	CONSTRAINT [FK_BridgeK12IncidentIncidentWitnesses_FactK12IncidentId] FOREIGN KEY ([FactK12IncidentId]) REFERENCES [RDS].[FactK12Incidents] ([FactK12IncidentId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12IncidentIncidentWitnesses_PersonId] FOREIGN KEY ([PersonId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentIncidentWitnesses_PersonId] 
 ON [RDS].[BridgeK12IncidentIncidentWitnesses] ([PersonId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentIncidentWitnesses_FactK12IncidentId] 
 ON [RDS].[BridgeK12IncidentIncidentWitnesses] ([FactK12IncidentId] ASC)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the occurrence of physical injury to participants involved in the incident and, if so, the level of injury sustained.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Injury Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000510' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000510' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the occurrence of physical injury to participants involved in the incident and, if so, the level of injury sustained.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Injury Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000510' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000510' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentWitnessTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Information on the type of individual who witnessed the incident and can give a firsthand account of an incident that was seen‚ heard‚ or experienced.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentWitnessTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Witness Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentWitnessTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001380' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentWitnessTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001380' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentWitnessTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentWitnessTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Information on the type of individual who witnessed the incident and can give a firsthand account of an incident that was seen‚ heard‚ or experienced.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentWitnessTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Witness Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentWitnessTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001380' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentWitnessTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001380' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12IncidentIncidentWitnesses', @level2type=N'COLUMN',@level2name=N'IncidentWitnessTypeDescription';
GO