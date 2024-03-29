CREATE TABLE [RDS].[FactK12StaffAssessments]
(
	[FactK12StaffAssessmentId] int NOT NULL IDENTITY (1, 1),
	[SchoolYearId] 											INT 			CONSTRAINT [DF_FactK12StaffAssessments_SchoolYearId] DEFAULT ((-1)) NOT NULL,
	[DataCollectionId] 										INT 			CONSTRAINT [DF_FactK12StaffAssessments_DataCollectionId] DEFAULT ((-1)) NOT NULL,
	[K12StaffPersonId] 										BIGINT 			CONSTRAINT [DF_FactK12StaffAssessments_K12StaffPersonId] DEFAULT ((-1)) NOT NULL,
	[PsInstitutionId] 										BIGINT 			CONSTRAINT [DF_FactK12StaffAssessments_PsInstitutionId] DEFAULT ((-1)) NOT NULL,
	[EmployerId] 											INT 			CONSTRAINT [DF_FactK12StaffAssessments_EmployerId] DEFAULT ((-1)) NOT NULL,
	[AssessmentId] 											INT 			CONSTRAINT [DF_FactK12StaffAssessments_AssessmentId] DEFAULT ((-1)) NOT NULL,
	[AssessmentAccommodationId] 							INT 			CONSTRAINT [DF_FactK12StaffAssessments_AssessmentAccommodationId] DEFAULT ((-1)) NOT NULL,
	[AssessmentAdministrationId] 							INT 			CONSTRAINT [DF_FactK12StaffAssessments_AssessmentAdministrationId] DEFAULT ((-1)) NOT NULL,
	[AssessmentFormId] 										INT 			CONSTRAINT [DF_FactK12StaffAssessments_AssessmentFormId] DEFAULT ((-1)) NOT NULL,
	[AssessmentParticipationSessionId] 						INT 			CONSTRAINT [DF_FactK12StaffAssessments_AssessmentParticipationSessionId] DEFAULT ((-1)) NOT NULL,
	[AssessmentPerformanceLevelId] 							INT 			CONSTRAINT [DF_FactK12StaffAssessments_AssessmentPerformanceLevelId] DEFAULT ((-1)) NOT NULL,
	[AssessmentRegistrationId] 								INT 			CONSTRAINT [DF_FactK12StaffAssessments_AssessmentRegistrationId] DEFAULT ((-1)) NOT NULL,
	[AssessmentRegistrationGradeLevelToBeAssessedId] 		INT 			CONSTRAINT [DF_FactK12StaffAssessments_AssessmentRegistrationGradeLevelToBeAssessedId] DEFAULT ((-1)) NOT NULL,
	[AssessmentSubtestId] 									INT 			CONSTRAINT [DF_FactK12StaffAssessments_AssessmentSubtestId] DEFAULT ((-1)) NOT NULL,
	[CredentialAwardId] 									INT 			CONSTRAINT [DF_FactK12StaffAssessments_CredentialAwardId] DEFAULT ((-1)) NOT NULL,
	[CredentialAwardStatusId] 								INT 			CONSTRAINT [DF_FactK12StaffAssessments_CredentialAwardStatusId] DEFAULT ((-1)) NOT NULL,
	[CredentialDefinitionId] 								INT 			CONSTRAINT [DF_FactK12StaffAssessments_CredentialDefinitionId] DEFAULT ((-1)) NOT NULL,
	[CredentialIssuerId] 									INT 			CONSTRAINT [DF_FactK12StaffAssessments_CredentialIssuerId] DEFAULT ((-1)) NOT NULL,
	[K12DemographicId] 										INT 			CONSTRAINT [DF_FactK12StaffAssessments_K12DemographicId] DEFAULT ((-1)) NOT NULL,
	[K12EmploymentStatusId] 								INT 			CONSTRAINT [DF_FactK12StaffAssessments_K12EmploymentStatusId] DEFAULT ((-1)) NOT NULL,
	[K12JobId] 												INT 			CONSTRAINT [DF_FactK12StaffAssessments_K12JobId] DEFAULT ((-1)) NOT NULL,
	[K12PositionId] 										INT 			CONSTRAINT [DF_FactK12StaffAssessments_K12PositionId] DEFAULT ((-1)) NOT NULL,
	[K12StaffAssignmentStatusId] 							INT 			CONSTRAINT [DF_FactK12StaffAssessments_K12StaffAssignmentStatusId] DEFAULT ((-1)) NOT NULL,
	[K12StaffCategoryId] 									INT 			CONSTRAINT [DF_FactK12StaffAssessments_K12StaffCategoryId] DEFAULT ((-1)) NOT NULL,
	[K12StaffStatusId] 										INT 			CONSTRAINT [DF_FactK12StaffAssessments_K12StaffStatusId] DEFAULT ((-1)) NOT NULL,
	[LeaJobClassificationId] 								INT 			CONSTRAINT [DF_FactK12StaffAssessments_LeaJobClassificationId] DEFAULT ((-1)) NOT NULL,
	[OnetSocOccupationTypeId] 								INT 			CONSTRAINT [DF_FactK12StaffAssessments_OnetSocOccupationTypeId] DEFAULT ((-1)) NOT NULL,
	[SeaJobClassificationId] 								INT 			CONSTRAINT [DF_FactK12StaffAssessments_SeaJobClassificationId] DEFAULT ((-1)) NOT NULL,
	[StandardOccupationalClassificationId] 					INT 			CONSTRAINT [DF_FactK12StaffAssessments_StandardOccupationalClassificationId] DEFAULT ((-1)) NOT NULL,
	[AssessmentResultScoreValueRawScore] 					NVARCHAR (70) 	CONSTRAINT [DF_FactK12StaffAssessments_AssessmentResultScoreValueRawScore] DEFAULT ((0)) NOT NULL,
	[AssessmentResultScoreValueScaleScore] 					NVARCHAR (70) 	CONSTRAINT [DF_FactK12StaffAssessments_AssessmentResultScoreValueScaleScore] DEFAULT ((0)) NOT NULL,
	[AssessmentResultScoreValuePassFail] 					NVARCHAR (70) 	CONSTRAINT [DF_FactK12StaffAssessments_AssessmentResultScoreValuePassFail] DEFAULT ((0)) NOT NULL,
	[AssessmentResultScoreValuePercentile] 					NVARCHAR (70) 	CONSTRAINT [DF_FactK12StaffAssessments_AssessmentResultScoreValuePercentile] DEFAULT ((0)) NOT NULL,
	[AssessmentResultScoreValueTScore] 						NVARCHAR (70) 	CONSTRAINT [DF_FactK12StaffAssessments_AssessmentResultScoreValueTScore] DEFAULT ((0)) NOT NULL,
	[AssessmentResultScoreValueZScore] 						NVARCHAR (70) 	CONSTRAINT [DF_FactK12StaffAssessments_AssessmentResultScoreValueZScore] DEFAULT ((0)) NOT NULL,
	CONSTRAINT [PK_FactK12StaffAssessments]	PRIMARY KEY CLUSTERED ([FactK12StaffAssessmentId] ASC),
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentAccommodationId] FOREIGN KEY ([AssessmentAccommodationId]) REFERENCES [RDS].[DimAssessmentAccommodations] ([DimAssessmentAccommodationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentAdministrationId] FOREIGN KEY ([AssessmentAdministrationId]) REFERENCES [RDS].[DimAssessmentAdministrations] ([DimAssessmentAdministrationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentFormId] FOREIGN KEY ([AssessmentFormId]) REFERENCES [RDS].[DimAssessmentForms] ([DimAssessmentFormId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentId] FOREIGN KEY ([AssessmentId]) REFERENCES [RDS].[DimAssessments] ([DimAssessmentId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentPerformanceLevelId] FOREIGN KEY ([AssessmentPerformanceLevelId]) REFERENCES [RDS].[DimAssessmentPerformanceLevels] ([DimAssessmentPerformanceLevelId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentRegistrationId] FOREIGN KEY ([AssessmentRegistrationId]) REFERENCES [RDS].[DimAssessmentRegistrations] ([DimAssessmentRegistrationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentRegistrationGradeLevelToBeAssessedId] FOREIGN KEY ([AssessmentRegistrationGradeLevelToBeAssessedId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentSubtestId]FOREIGN KEY ([AssessmentSubtestId]) REFERENCES [RDS].[DimAssessmentSubtests] ([DimAssessmentSubtestId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_CredentialAwardId]	FOREIGN KEY ([CredentialAwardId]) REFERENCES [RDS].[DimCredentialAwards] ([DimCredentialAwardId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_CredentialAwardStatusId] FOREIGN KEY ([CredentialAwardStatusId]) REFERENCES [RDS].[DimCredentialAwardStatuses] ([DimCredentialAwardStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_CredentialDefinitionId] FOREIGN KEY ([CredentialDefinitionId]) REFERENCES [RDS].[DimCredentialDefinitions] ([DimCredentialDefinitionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_CredentialIssuerId] FOREIGN KEY ([CredentialIssuerId]) REFERENCES [RDS].[DimCredentialIssuers] ([DimCredentialIssuerId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssessments_AssessmentParticipationSessionId] FOREIGN KEY ([AssessmentParticipationSessionId]) REFERENCES [RDS].[DimAssessmentParticipationSessions] ([DimAssessmentParticipationSessionId]) ON DELETE No Action ON UPDATE No Action,
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
 ON [RDS].[FactK12StaffAssessments] ([AssessmentParticipationSessionId] ASC)
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

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_DimPsInstitutions] 
 ON [RDS].[FactK12StaffAssessments] ([PsInstitutionId] ASC)
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

