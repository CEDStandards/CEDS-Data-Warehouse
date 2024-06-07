CREATE TABLE [RDS].[DimAeProgramParticipantAssessmentIndicators] (
    [DimAeProgramParticipantAssessmentIndicatorId]       INT            IDENTITY (1, 1) NOT NULL,
    [AeFunctioningLevelAtIntakeCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAeProgramParticipantAssessmentIndicators_AeFunctioningLevelAtIntakeCode] DEFAULT ('MISSING') NOT NULL,
    [AeFunctioningLevelAtIntakeDescription] NVARCHAR (200) CONSTRAINT [DF_DimAeProgramParticipantAssessmentIndicators_AeFunctioningLevelAtIntakeDescription] DEFAULT ('MISSING') NOT NULL,
    [AeFunctioningLevelAtPosttestCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAeProgramParticipantAssessmentIndicators_AeFunctioningLevelAtPosttestCode] DEFAULT ('MISSING') NOT NULL,
    [AeFunctioningLevelAtPosttestDescription] NVARCHAR (200) CONSTRAINT [DF_DimAeProgramParticipantAssessmentIndicators_AeFunctioningLevelAtPosttestDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAeProgramParticipantAssessmentIndicators] PRIMARY KEY CLUSTERED ([DimAeProgramParticipantAssessmentIndicatorId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAeProgramParticipantAssessmentIndicators_AeFunctioningLevelAtIntakeCode]
    ON [RDS].[DimAeProgramParticipantAssessmentIndicators]([AeFunctioningLevelAtIntakeCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual''s entering skill level, as defined by the National Reporting System for Adult Education and determined by an approved standardized assessment at program intake.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Educational Functioning Level at Intake' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000779' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000779' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual''s entering skill level, as defined by the National Reporting System for Adult Education and determined by an approved standardized assessment at program intake.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Educational Functioning Level at Intake' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000779' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000779' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual''s skill level, as defined by the National Reporting System for Adult Education and determined by an approved standardized assessment after a set time period or number of instructional hours.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Educational Functioning Level at Posttest' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000780' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000780' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual''s skill level, as defined by the National Reporting System for Adult Education and determined by an approved standardized assessment after a set time period or number of instructional hours.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Educational Functioning Level at Posttest' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000780' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000780' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantAssessmentIndicators', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestDescription';
GO


