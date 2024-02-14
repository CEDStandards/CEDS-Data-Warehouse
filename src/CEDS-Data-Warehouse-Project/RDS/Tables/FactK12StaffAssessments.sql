CREATE TABLE [RDS].[FactK12StaffAssessments]
(
	[FactK12StaffAssessmentId] int NOT NULL IDENTITY (1, 1),
	[CredentialAwardStatusId] int NULL,
	[EmployerId] int NULL,
	[DataCollectionId] int NULL,
	[K12EmploymentStatusId] int NULL,
	[K12DemographicId] int NULL,
	[K12StaffCategoryId] int NULL,
	[K12StaffStatusId] int NULL,
	[K12StaffPersonId] bigint NULL,
	[CredentialIssuerId] int NULL,
	[SchoolYearId] int NULL,
	[StandardOccupationalClassificationId] int NULL,
	[CredentialDefinitionId] int NULL,
	[AssessmentId] int NULL,
	[AssessmentSubtestId] int NULL,
	[SeaJobClassificationId] int NULL,
	[DimAssessmentParticipationSessionId] int NULL,
	[AssessmentAccommodationId] int NULL,
	[AssessmentFormId] int NULL,
	[AssessmentAdministrationId] int NULL,
	[AssessmentRegistrationId] int NULL,
	[AssessmentPerformanceLevelId] int NULL,
	[OnetSocOccupationTypeId] int NULL,
	[K12PositionId] int NULL,
	[K12StaffAssignmentStatusId] int NULL,
	[K12JobId] int NULL,
	[AssessmentResultScoreValueRawScore] nvarchar(70) NULL,
	[CredentialAwardId] int NULL,
	[AssessmentResultScoreValueScaleScore] nvarchar(70) NULL,
	[AssessmentResultScoreValuePercentile] nvarchar(70) NULL,
	[AssessmentResultScoreValueTScore] nvarchar(70) NULL,
	[AssessmentResultScoreValueZScore] nvarchar(70) NULL,
	[LeaJobClassificationId] int NULL,
	CONSTRAINT [PK_FactK12StaffAssessments]	PRIMARY KEY CLUSTERED ([FactK12StaffAssessmentId] ASC),
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentAccommodationId] FOREIGN KEY ([AssessmentAccommodationId]) REFERENCES [RDS].[DimAssessmentAccommodations] ([DimAssessmentAccommodationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentAdministrationId] FOREIGN KEY ([AssessmentAdministrationId]) REFERENCES [RDS].[DimAssessmentAdministrations] ([DimAssessmentAdministrationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentFormId] FOREIGN KEY ([AssessmentFormId]) REFERENCES [RDS].[DimAssessmentForms] ([DimAssessmentFormId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentId] FOREIGN KEY ([AssessmentId]) REFERENCES [RDS].[DimAssessments] ([DimAssessmentId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentPerformanceLevelId] FOREIGN KEY ([AssessmentPerformanceLevelId]) REFERENCES [RDS].[DimAssessmentPerformanceLevels] ([DimAssessmentPerformanceLevelId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentRegistrationId] FOREIGN KEY ([AssessmentRegistrationId]) REFERENCES [RDS].[DimAssessmentRegistrations] ([DimAssessmentRegistrationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentSubtestId]FOREIGN KEY ([AssessmentSubtestId]) REFERENCES [RDS].[DimAssessmentSubtests] ([DimAssessmentSubtestId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_CredentialAwardId]	FOREIGN KEY ([CredentialAwardId]) REFERENCES [RDS].[DimCredentialAwards] ([DimCredentialAwardId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_CredentialAwardStatusId] FOREIGN KEY ([CredentialAwardStatusId]) REFERENCES [RDS].[DimCredentialAwardStatuses] ([DimCredentialAwardStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_CredentialDefinitionId] FOREIGN KEY ([CredentialDefinitionId]) REFERENCES [RDS].[DimCredentialDefinitions] ([DimCredentialDefinitionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_CredentialIssuerId] FOREIGN KEY ([CredentialIssuerId]) REFERENCES [RDS].[DimCredentialIssuers] ([DimCredentialIssuerId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_DimAssessmentParticipationSessionId] FOREIGN KEY ([DimAssessmentParticipationSessionId]) REFERENCES [RDS].[DimAssessmentParticipationSessions] ([DimAssessmentParticipationSessionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_EmployerId] FOREIGN KEY ([EmployerId]) REFERENCES [RDS].[DimEmployers] ([DimEmployerId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_K12EmploymentStatusId] FOREIGN KEY ([K12EmploymentStatusId]) REFERENCES [RDS].[DimK12EmploymentStatuses] ([DimK12EmploymentStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_K12JobId]	FOREIGN KEY ([K12JobId]) REFERENCES [RDS].[DimK12Jobs] ([DimK12JobId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_K12PositionId] FOREIGN KEY ([K12PositionId]) REFERENCES [RDS].[DimK12Positions] ([DimK12PositionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_K12StaffAssignmentStatusId] FOREIGN KEY ([K12StaffAssignmentStatusId]) REFERENCES [RDS].[DimK12StaffAssignmentStatuses] ([DimK12StaffAssignmentStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_K12StaffCategoryId] FOREIGN KEY ([K12StaffCategoryId]) REFERENCES [RDS].[DimK12StaffCategories] ([DimK12StaffCategoryId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_K12StaffPersonId]	FOREIGN KEY ([K12StaffPersonId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_K12StaffStatusId]	FOREIGN KEY ([K12StaffStatusId]) REFERENCES [RDS].[DimK12StaffStatuses] ([DimK12StaffStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_LeaJobClassificationId] FOREIGN KEY ([LeaJobClassificationId]) REFERENCES [RDS].[DimLeaJobClassifications] ([DimLeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_OnetSocOccupationTypeId] FOREIGN KEY ([OnetSocOccupationTypeId]) REFERENCES [RDS].[DimOnetSocOccupationTypes] ([DimOnetSocOccupationTypeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_SeaJobClassificationId] FOREIGN KEY ([SeaJobClassificationId]) REFERENCES [RDS].[DimSeaJobClassifications] ([DimSeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_StandardOccupationalClassificationId] FOREIGN KEY ([StandardOccupationalClassificationId]) REFERENCES [RDS].[DimStandardOccupationalClassifications] ([DimStandardOccupationalClassificationId]) ON DELETE No Action ON UPDATE No Action)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimAssessmentAccommodations] 
 ON [RDS].[FactK12StaffAssessments] ([AssessmentAccommodationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimAssessmentAdministrations] 
 ON [RDS].[FactK12StaffAssessments] ([AssessmentAdministrationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimAssessmentForms] 
 ON [RDS].[FactK12StaffAssessments] ([AssessmentFormId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimAssessmentParticipationSessions] 
 ON [RDS].[FactK12StaffAssessments] ([DimAssessmentParticipationSessionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimAssessmentPerformanceLevels] 
 ON [RDS].[FactK12StaffAssessments] ([AssessmentPerformanceLevelId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimAssessmentRegistrations] 
 ON [RDS].[FactK12StaffAssessments] ([AssessmentRegistrationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimAssessments] 
 ON [RDS].[FactK12StaffAssessments] ([AssessmentId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimAssessmentSubtests] 
 ON [RDS].[FactK12StaffAssessments] ([AssessmentSubtestId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimCredentialAwards] 
 ON [RDS].[FactK12StaffAssessments] ([CredentialAwardId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimCredentialAwardStatuses] 
 ON [RDS].[FactK12StaffAssessments] ([CredentialAwardStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimCredentialDefinitions] 
 ON [RDS].[FactK12StaffAssessments] ([CredentialDefinitionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimCredentialIssuers] 
 ON [RDS].[FactK12StaffAssessments] ([CredentialIssuerId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimDataCollections] 
 ON [RDS].[FactK12StaffAssessments] ([DataCollectionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimEmployers] 
 ON [RDS].[FactK12StaffAssessments] ([EmployerId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimK12Demographics] 
 ON [RDS].[FactK12StaffAssessments] ([K12DemographicId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimK12EmploymentStatuses] 
 ON [RDS].[FactK12StaffAssessments] ([K12EmploymentStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimK12Jobs] 
 ON [RDS].[FactK12StaffAssessments] ([K12JobId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimK12Positions] 
 ON [RDS].[FactK12StaffAssessments] ([K12PositionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimK12StaffAssignmentStatuses] 
 ON [RDS].[FactK12StaffAssessments] ([K12StaffAssignmentStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimK12StaffCategories] 
 ON [RDS].[FactK12StaffAssessments] ([K12StaffCategoryId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimK12StaffStatuses] 
 ON [RDS].[FactK12StaffAssessments] ([K12StaffStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimLeaJobClassifications] 
 ON [RDS].[FactK12StaffAssessments] ([LeaJobClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimOnetSocOccupationTypes] 
 ON [RDS].[FactK12StaffAssessments] ([OnetSocOccupationTypeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimPeople] 
 ON [RDS].[FactK12StaffAssessments] ([K12StaffPersonId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimSchoolYears] 
 ON [RDS].[FactK12StaffAssessments] ([SchoolYearId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimSeaJobClassifications] 
 ON [RDS].[FactK12StaffAssessments] ([SeaJobClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimStandardOccupationalClassifications] 
 ON [RDS].[FactK12StaffAssessments] ([StandardOccupationalClassificationId] ASC)
GO

