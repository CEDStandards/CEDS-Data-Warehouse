CREATE TABLE [RDS].[FactK12StudentAcademicAwards] (
    [FactK12StudentAcademicAwardId]                    BIGINT  IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]                                      INT     CONSTRAINT [DF_FactK12StudentAcademicAwards_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [CountDateId]                                       INT     CONSTRAINT [DF_FactK12StudentAcademicAwards_CountDateId] DEFAULT ((-1)) NOT NULL,
    [RecordStartDateTime]                               DATETIME NULL,
    [RecordEndDateTime]                                 DATETIME NULL,
    [SeaId]                                             INT     CONSTRAINT [DF_FactK12StudentAcademicAwards_SeaId] DEFAULT ((-1)) NOT NULL,
    [LeaAccountabilityId]                               INT     CONSTRAINT [DF_FactK12StudentAcademicAwards_LeaAccountabilityId] DEFAULT ((-1)) NOT NULL,
    [LeaInstructionId]                                  INT     CONSTRAINT [DF_FactK12StudentAcademicAwards_LeaInstructionId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolId]                                       INT     CONSTRAINT [DF_FactK12StudentAcademicAwards_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [K12StudentId]                                      BIGINT  CONSTRAINT [DF_FactK12StudentAcademicAwards_K12StudentId] DEFAULT ((-1)) NOT NULL,
    [DimK12AcademicAwardId]                             INT     CONSTRAINT [DF_FactK12StudentAcademicAwards_DimK12AcademicAwardId] DEFAULT ((-1)) NOT NULL,
    [AcademicAwardDateId]                               INT     CONSTRAINT [DF_FactK12StudentAcademicAwards_AcademicAwardDateId] DEFAULT ((-1)) NOT NULL,
    [K12AcademicAwardStatusId]                          INT     CONSTRAINT [DF_FactK12StudentAcademicAwards_K12AcademicAwardStatusId] DEFAULT ((-1)) NOT NULL,
    [DiplomaOrCredentialAwardDateId]                    INT     CONSTRAINT [DF_FactK12StudentAcademicAwards_DiplomaOrCredentialAwardDateId] DEFAULT ((-1)) NOT NULL,
    [DataCollectionId]                                  INT     CONSTRAINT [DF_FactK12StudentAcademicAwards_DataCollectionId] DEFAULT ((-1)) NOT NULL,
    [RecordStatusId]                                    INT     CONSTRAINT [DF_FactK12StudentAcademicAwards_RecordStatusId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_FactK12StudentAcademicAwards] PRIMARY KEY CLUSTERED ([FactK12StudentAcademicAwardId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactK12StudentAcademicAwards_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]),
    CONSTRAINT [FK_FactK12StudentAcademicAwards_K12StudentId] FOREIGN KEY ([K12StudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactK12StudentAcademicAwards_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12StudentAcademicAwards_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentAcademicAwards_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]),
    CONSTRAINT [FK_FactK12StudentAcademicAwards_LeaAccountabilityId] FOREIGN KEY ([LeaAccountabilityId]) REFERENCES [RDS].[DimLeas] ([DimLeaId]),
    CONSTRAINT [FK_FactK12StudentAcademicAwards_LeaInstructionId] FOREIGN KEY ([LeaInstructionId]) REFERENCES [RDS].[DimLeas] ([DimLeaId]),
    CONSTRAINT [FK_FactK12StudentAcademicAwards_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]),
    CONSTRAINT [FK_FactK12StudentAcademicAwards_RecordStatusId] FOREIGN KEY ([RecordStatusId]) REFERENCES [RDS].[DimRecordStatuses] ([DimRecordStatusId]),
    CONSTRAINT [FK_FactK12StudentAcademicAwards_K12AcademicAwardStatusId] FOREIGN KEY ([K12AcademicAwardStatusId]) REFERENCES [RDS].[DimK12AcademicAwardStatuses] ([Dimk12AcademicAwardStatusId]),
    CONSTRAINT [FK_FactK12StudentAcademicAwards_AcademicAwardDateId] FOREIGN KEY ([AcademicAwardDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentAcademicAwards_DiplomaOrCredentialAwardDateId] FOREIGN KEY ([DiplomaOrCredentialAwardDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentAcademicAwards_DimK12AcademicAwardId] FOREIGN KEY ([DimK12AcademicAwardId]) REFERENCES [RDS].[DimK12AcademicAwards] ([DimK12AcademicAwardId])
);

GO


CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicAwards_SeaId]
    ON [RDS].[FactK12StudentAcademicAwards]([SeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicAwards_SchoolYearId]
    ON [RDS].[FactK12StudentAcademicAwards]([SchoolYearId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicAwards_CountDateId]
    ON [RDS].[FactK12StudentAcademicAwards]([CountDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicAwards_DataCollectionId]
    ON [RDS].[FactK12StudentAcademicAwards]([DataCollectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicAwards_K12StudentId]
    ON [RDS].[FactK12StudentAcademicAwards]([K12StudentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicAwards_LeaAccountabilityId]
    ON [RDS].[FactK12StudentAcademicAwards]([LeaAccountabilityId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicAwards_LeaInstructionId]
    ON [RDS].[FactK12StudentAcademicAwards]([LeaInstructionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicAwards_K12SchoolId]
    ON [RDS].[FactK12StudentAcademicAwards]([K12SchoolId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicAwards_RecordStatusId]
    ON [RDS].[FactK12StudentAcademicAwards]([RecordStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicAwards_K12AcademicAwardStatusId]
    ON [RDS].[FactK12StudentAcademicAwards]([K12AcademicAwardStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicAwards_AcademicAwardDateId]
    ON [RDS].[FactK12StudentAcademicAwards]([AcademicAwardDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO  

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicAwards_DiplomaOrCredentialAwardDateId]
    ON [RDS].[FactK12StudentAcademicAwards]([DiplomaOrCredentialAwardDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicAwards_DimK12AcademicAwardId]
    ON [RDS].[FactK12StudentAcademicAwards]([DimK12AcademicAwardId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
                      

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'AcademicAwardDateId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day or year and month on which the academic award was conferred.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'AcademicAwardDateId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Academic Award Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'AcademicAwardDateId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000001' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'AcademicAwardDateId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000001' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'AcademicAwardDateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'DiplomaOrCredentialAwardDateId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The month and year on which the diploma/credential is awarded to a student in recognition of his/her completion of the curricular requirements.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'DiplomaOrCredentialAwardDateId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Diploma or Credential Award Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'DiplomaOrCredentialAwardDateId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000081' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'DiplomaOrCredentialAwardDateId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000081' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'DiplomaOrCredentialAwardDateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'LeaAccountabilityId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_QualifierOptionElement', @value=N'Responsible District Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'LeaAccountabilityId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_QualifierOptionGlobalId', @value=N'000594' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'LeaAccountabilityId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_QualifierOptionCode', @value=N'Accountability' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'LeaAccountabilityId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_QualifierOptionURL', @value=N'https://ceds.ed.gov/element/000594/#Accountability' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'LeaAccountabilityId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'LeaInstructionId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_QualifierOptionElement', @value=N'Responsible District Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'LeaInstructionId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_QualifierOptionGlobalId', @value=N'000594' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'LeaInstructionId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_QualifierOptionCode', @value=N'Instruction' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'LeaInstructionId'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_QualifierOptionURL', @value=N'https://ceds.ed.gov/element/000594#Instruction' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'LeaInstructionId'
GO