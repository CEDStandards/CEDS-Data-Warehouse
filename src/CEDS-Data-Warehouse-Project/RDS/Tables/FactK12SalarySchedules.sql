CREATE TABLE [RDS].[FactK12SalarySchedules](
	[FactK12SalaryScheduleId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolYearId] [int] NOT NULL,
	[CountDateId] [int] NOT NULL,
	[DataCollectionId] [int] NOT NULL,
	[SeaId] [int] NOT NULL,
	[IeuId] [int] NOT NULL,
	[LeaId] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[SalaryScheduleCriteriaId] [int] NOT NULL,
	[StandardOccupationalClassificationId] [int] NOT NULL,
	[OnetSocOccupationTypeId] [int] NOT NULL,
	[SalaryScheduleSalaryValue] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_FactK12SalarySchedules] PRIMARY KEY NONCLUSTERED 
(
	[FactK12SalaryScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] ADD  CONSTRAINT [DF_FactK12SalarySchedules_SchoolYearId]  DEFAULT ((-1)) FOR [SchoolYearId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] ADD  CONSTRAINT [DF_FactK12SalarySchedules_CountDateId]  DEFAULT ((-1)) FOR [CountDateId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] ADD  CONSTRAINT [DF_FactK12SalarySchedules_DataCollectionId]  DEFAULT ((-1)) FOR [DataCollectionId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] ADD  CONSTRAINT [DF_FactK12SalarySchedules_SeaId]  DEFAULT ((-1)) FOR [SeaId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] ADD  CONSTRAINT [DF_FactK12SalarySchedules_IeuId]  DEFAULT ((-1)) FOR [IeuId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] ADD  CONSTRAINT [DF_FactK12SalarySchedules_LeaId]  DEFAULT ((-1)) FOR [LeaId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] ADD  CONSTRAINT [DF_FactK12SalarySchedules_K12SchoolId]  DEFAULT ((-1)) FOR [K12SchoolId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] ADD  CONSTRAINT [DF_FactK12SalarySchedules_SalaryScheduleCriteriaId]  DEFAULT ((-1)) FOR [SalaryScheduleCriteriaId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] ADD  CONSTRAINT [DF_FactK12SalarySchedules_StandardOccupationalClassificationId]  DEFAULT ((-1)) FOR [StandardOccupationalClassificationId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] ADD  CONSTRAINT [DF_FactK12SalarySchedules_OnetSocOccupationTypeId]  DEFAULT ((-1)) FOR [OnetSocOccupationTypeId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules]  WITH CHECK ADD  CONSTRAINT [FK_FactK12SalarySchedules_SchoolYearId] FOREIGN KEY([SchoolYearId])
REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] CHECK CONSTRAINT [FK_FactK12SalarySchedules_SchoolYearId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules]  WITH CHECK ADD  CONSTRAINT [FK_FactK12SalarySchedules_CountDateId] FOREIGN KEY([CountDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] CHECK CONSTRAINT [FK_FactK12SalarySchedules_CountDateId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules]  WITH CHECK ADD  CONSTRAINT [FK_FactK12SalarySchedules_DataCollectionId] FOREIGN KEY([DataCollectionId])
REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId])
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] CHECK CONSTRAINT [FK_FactK12SalarySchedules_DataCollectionId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules]  WITH CHECK ADD  CONSTRAINT [FK_FactK12SalarySchedules_SeaId] FOREIGN KEY([SeaId])
REFERENCES [RDS].[DimSeas] ([DimSeaId])
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] CHECK CONSTRAINT [FK_FactK12SalarySchedules_SeaId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules]  WITH CHECK ADD  CONSTRAINT [FK_FactK12SalarySchedules_IeuId] FOREIGN KEY([IeuId])
REFERENCES [RDS].[DimIeus] ([DimIeuId])
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] CHECK CONSTRAINT [FK_FactK12SalarySchedules_IeuId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules]  WITH CHECK ADD  CONSTRAINT [FK_FactK12SalarySchedules_LeaId] FOREIGN KEY([LeaId])
REFERENCES [RDS].[DimLeas] ([DimLeaId])
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] CHECK CONSTRAINT [FK_FactK12SalarySchedules_LeaId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules]  WITH CHECK ADD  CONSTRAINT [FK_FactK12SalarySchedules_K12SchoolId] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] CHECK CONSTRAINT [FK_FactK12SalarySchedules_K12SchoolId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules]  WITH CHECK ADD  CONSTRAINT [FK_FactK12SalarySchedules_SalaryScheduleCriteriaId] FOREIGN KEY([SalaryScheduleCriteriaId])
REFERENCES [RDS].[DimSalaryScheduleCriteria] ([DimSalaryScheduleCriteriaId])
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] CHECK CONSTRAINT [FK_FactK12SalarySchedules_SalaryScheduleCriteriaId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules]  WITH CHECK ADD  CONSTRAINT [FK_FactK12SalarySchedules_StandardOccupationalClassificationId] FOREIGN KEY([StandardOccupationalClassificationId])
REFERENCES [RDS].[DimStandardOccupationalClassifications] ([DimStandardOccupationalClassificationId])
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] CHECK CONSTRAINT [FK_FactK12SalarySchedules_StandardOccupationalClassificationId]
GO

ALTER TABLE [RDS].[FactK12SalarySchedules]  WITH CHECK ADD  CONSTRAINT [FK_FactK12SalarySchedules_OnetSocOccupationTypeId] FOREIGN KEY([OnetSocOccupationTypeId])
REFERENCES [RDS].[DimOnetSocOccupationTypes] ([DimOnetSocOccupationTypeId])
GO

ALTER TABLE [RDS].[FactK12SalarySchedules] CHECK CONSTRAINT [FK_FactK12SalarySchedules_OnetSocOccupationTypeId]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique value or code assigned to a salary schedule criterion used to differentiate between the achievable levels of the criterion.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12SalarySchedules', @level2type=N'COLUMN',@level2name=N'SalaryScheduleSalaryValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Salary Schedule Criterion Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12SalarySchedules', @level2type=N'COLUMN',@level2name=N'SalaryScheduleSalaryValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'TBD V12' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12SalarySchedules', @level2type=N'COLUMN',@level2name=N'SalaryScheduleSalaryValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://github.com/CEDStandards/CEDS-Elements/issues/428' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12SalarySchedules', @level2type=N'COLUMN',@level2name=N'SalaryScheduleSalaryValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12SalarySchedules', @level2type=N'COLUMN',@level2name=N'SalaryScheduleSalaryValue'
GO









