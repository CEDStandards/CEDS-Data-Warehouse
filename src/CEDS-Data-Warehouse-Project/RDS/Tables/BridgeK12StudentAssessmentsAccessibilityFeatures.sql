CREATE TABLE [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures] (
    [BridgeK12StudentAssessmentAccessibilityFeatureId] INT IDENTITY (1, 1) NOT NULL,
    [FactK12StudentAssessmentId]                    INT NOT NULL,
    [AccessibilityFeatureId]                        INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureId] DEFAULT ((-1)) NOT NULL,
    [AccessibilityFeatureLanguageTypeId]            INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureLanguageTypeId] DEFAULT ((-1)) NOT NULL,
    [AssessmentComponentId]                         INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AssessmentComponentId] DEFAULT ((-1)) NOT NULL,
    [AccessibilityFeatureBrailleId]                 INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureBrailleId] DEFAULT ((-1)) NOT NULL,
    [AccessibilityFeatureCalculatorId]              INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureCalculatorId] DEFAULT ((-1)) NOT NULL,
    [AccessibilityFeatureBreakId]                   INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureBreakId] DEFAULT ((-1)) NOT NULL,
    [AccessibilityFeatureSignedAdministrationId]    INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureSignedAdministrationId] DEFAULT ((-1)) NOT NULL,
    [AccessibilityFeatureAlternateResponseOptionId] INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureAlternateResponseOptionId] DEFAULT ((-1)) NOT NULL,
    [AccessibilityFeatureAssessmentExtendedTimeId]  INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureAssessmentExtendedTimeId] DEFAULT ((-1)) NOT NULL,
    [AccessibilityFeatureDisplayFormatAdjustmentId] INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureDisplayFormatAdjustmentId] DEFAULT ((-1)) NOT NULL,
    [AccessibilityFeatureGroupSizeId]               INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureGroupSizeId] DEFAULT ((-1)) NOT NULL,
    [AccessibilityFeatureMedicalSupportId]          INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureMedicalSupportId] DEFAULT ((-1)) NOT NULL,
    [AccessibilityFeatureReadAloudId]               INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureReadAloudId] DEFAULT ((-1)) NOT NULL,
    [AccessibilityFeatureReferenceSheetId]          INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureReferenceSheetId] DEFAULT ((-1)) NOT NULL,
    [AccessibilityFeatureSettingId]                 INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureSettingId] DEFAULT ((-1)) NOT NULL,
    [AccessibilityFeatureTactileMediumId]           INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureTactileMediumId] DEFAULT ((-1)) NOT NULL,
    [AccessibilityFeatureTranslationPresentationId] INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureTranslationPresentationId] DEFAULT ((-1)) NOT NULL,
    [AssessmentExtendedTimeDuration]                INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AssessmentExtendedTimeDuration] DEFAULT ((-1)) NOT NULL,
    [BreakDuration]                                 INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_BreakDuration] DEFAULT ((-1)) NOT NULL,
    [GroupSizeRangeMaximum]                         INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_GroupSizeRangeMaximum] DEFAULT ((-1)) NOT NULL,
    [GroupSizeRangeMinimum]                         INT             CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_GroupSizeRangeMinimum] DEFAULT ((-1)) NOT NULL,
    [AdaptiveAndSpecializedEquipmentOrFurnitureDescription] NVARCHAR(MAX) NOT NULL CONSTRAINT [DF_BridgeK12StudentAssessmentAccessibilityFeatures_AdaptiveAndSpecializedEquipmentOrFurnitureDescription] DEFAULT (N'MISSING'),




    CONSTRAINT [PK_BridgeK12StudentAssessmentAccessibilityFeatures] PRIMARY KEY CLUSTERED ([BridgeK12StudentAssessmentAccessibilityFeatureId] ASC),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_FactK12StudentAssessmentId] FOREIGN KEY ([FactK12StudentAssessmentId]) REFERENCES [RDS].[FactK12StudentAssessments] ([FactK12StudentAssessmentId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureId] FOREIGN KEY ([AccessibilityFeatureId]) REFERENCES [RDS].[DimAccessibilityFeatures] ([DimAccessibilityFeatureId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureLanguageTypeId] FOREIGN KEY ([AccessibilityFeatureLanguageTypeId]) REFERENCES [RDS].[DimLanguages] ([DimLanguageId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AssessmentComponentId] FOREIGN KEY ([AssessmentComponentId]) REFERENCES [RDS].[DimAssessmentComponents] ([DimAssessmentComponentId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureBrailleId] FOREIGN KEY ([AccessibilityFeatureBrailleId]) REFERENCES [RDS].[DimAccessibilityFeatureBrailles] ([DimAccessibilityFeatureBrailleId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureCalculatorId] FOREIGN KEY ([AccessibilityFeatureCalculatorId]) REFERENCES [RDS].[DimAccessibilityFeatureCalculators] ([DimAccessibilityFeatureCalculatorId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureBreakId] FOREIGN KEY ([AccessibilityFeatureBreakId]) REFERENCES [RDS].[DimAccessibilityFeatureBreaks] ([DimAccessibilityFeatureBreakId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureSignedAdministrationId] FOREIGN KEY ([AccessibilityFeatureSignedAdministrationId]) REFERENCES [RDS].[DimAccessibilityFeatureSignedAdministrations] ([DimAccessibilityFeatureSignedAdministrationId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureAlternateResponseOptionId] FOREIGN KEY ([AccessibilityFeatureAlternateResponseOptionId]) REFERENCES [RDS].[DimAccessibilityFeatureAlternateResponseOptions] ([DimAccessibilityFeatureAlternateResponseOptionId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureAssessmentExtendedTimeId] FOREIGN KEY ([AccessibilityFeatureAssessmentExtendedTimeId]) REFERENCES [RDS].[DimAccessibilityFeatureAssessmentExtendedTimes] ([DimAccessibilityFeatureAssessmentExtendedTimeId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureDisplayFormatAdjustmentId] FOREIGN KEY ([AccessibilityFeatureDisplayFormatAdjustmentId]) REFERENCES [RDS].[DimAccessibilityFeatureDisplayFormatAdjustments] ([DimAccessibilityFeatureDisplayFormatAdjustmentId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureGroupSizeId] FOREIGN KEY ([AccessibilityFeatureGroupSizeId]) REFERENCES [RDS].[DimAccessibilityFeatureGroupSizes] ([DimAccessibilityFeatureGroupSizeId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureMedicalSupportId] FOREIGN KEY ([AccessibilityFeatureMedicalSupportId]) REFERENCES [RDS].[DimAccessibilityFeatureMedicalSupports] ([DimAccessibilityFeatureMedicalSupportId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureReadAloudId] FOREIGN KEY ([AccessibilityFeatureReadAloudId]) REFERENCES [RDS].[DimAccessibilityFeatureReadAlouds] ([DimAccessibilityFeatureReadAloudId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureReferenceSheetId] FOREIGN KEY ([AccessibilityFeatureReferenceSheetId]) REFERENCES [RDS].[DimAccessibilityFeatureReferenceSheets] ([DimAccessibilityFeatureReferenceSheetId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureSettingId] FOREIGN KEY ([AccessibilityFeatureSettingId]) REFERENCES [RDS].[DimAccessibilityFeatureSettings] ([DimAccessibilityFeatureSettingId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureTactileMediumId] FOREIGN KEY ([AccessibilityFeatureTactileMediumId]) REFERENCES [RDS].[DimAccessibilityFeatureTactileMediums] ([DimAccessibilityFeatureTactileMediumId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureTranslationPresentationId] FOREIGN KEY ([AccessibilityFeatureTranslationPresentationId]) REFERENCES [RDS].[DimAccessibilityFeatureTranslationPresentations] ([DimAccessibilityFeatureTranslationPresentationId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_FactK12StudentAssessmentId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([FactK12StudentAssessmentId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureLanguageTypeId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureLanguageTypeId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AssessmentComponentId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AssessmentComponentId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureBrailleId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureBrailleId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureCalculatorId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureCalculatorId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureBreakId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureBreakId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureSignedAdministrationId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureSignedAdministrationId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureAlternateResponseOptionId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureAlternateResponseOptionId] ASC);
GO  
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureAssessmentExtendedTimeId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureAssessmentExtendedTimeId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureDisplayFormatAdjustmentId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureDisplayFormatAdjustmentId] ASC);    
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureGroupSizeId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureGroupSizeId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureMedicalSupportId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureMedicalSupportId] ASC); 
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureReadAloudId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureReadAloudId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureReferenceSheetId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureReferenceSheetId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureSettingId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureSettingId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureTactileMediumId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureTactileMediumId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccessibilityFeatures_AccessibilityFeatureTranslationPresentationId]
    ON [RDS].[BridgeK12StudentAssessmentAccessibilityFeatures]([AccessibilityFeatureTranslationPresentationId] ASC);
GO  

