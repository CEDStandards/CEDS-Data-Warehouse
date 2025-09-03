CREATE TABLE [RDS].[DimAeProgramParticipantIndicators] (
    [DimAeProgramParticipantIndicatorId]       INT            IDENTITY (1, 1) NOT NULL,
    [CorrectionalEducationReentryServicesParticipationIndicatorCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAeProgramParticipantIndicators_CorrectionalEducationReentryServicesParticipationIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [CorrectionalEducationReentryServicesParticipationIndicatorDescription] NVARCHAR (200) CONSTRAINT [DF_DimAeProgramParticipantIndicators_CorrectionalEducationReentryServicesParticipationIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAeProgramParticipantIndicators] PRIMARY KEY CLUSTERED ([DimAeProgramParticipantIndicatorId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAeProgramParticipantIndicators_CorrectionalEducationReentryServicesParticipationIndicatorCode]
    ON [RDS].[DimAeProgramParticipantIndicators]([CorrectionalEducationReentryServicesParticipationIndicatorCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantIndicators', @level2type=N'COLUMN',@level2name=N'CorrectionalEducationReentryServicesParticipationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether an adult correctional education student who receives instructional services (e.g., life skills, cognitive restructuring, etc.) to support reentry into society.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantIndicators', @level2type=N'COLUMN',@level2name=N'CorrectionalEducationReentryServicesParticipationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Correctional Education Reentry Services Participation Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantIndicators', @level2type=N'COLUMN',@level2name=N'CorrectionalEducationReentryServicesParticipationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001297' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantIndicators', @level2type=N'COLUMN',@level2name=N'CorrectionalEducationReentryServicesParticipationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001297' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantIndicators', @level2type=N'COLUMN',@level2name=N'CorrectionalEducationReentryServicesParticipationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantIndicators', @level2type=N'COLUMN',@level2name=N'CorrectionalEducationReentryServicesParticipationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether an adult correctional education student who receives instructional services (e.g., life skills, cognitive restructuring, etc.) to support reentry into society.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantIndicators', @level2type=N'COLUMN',@level2name=N'CorrectionalEducationReentryServicesParticipationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Correctional Education Reentry Services Participation Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantIndicators', @level2type=N'COLUMN',@level2name=N'CorrectionalEducationReentryServicesParticipationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001297' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantIndicators', @level2type=N'COLUMN',@level2name=N'CorrectionalEducationReentryServicesParticipationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001297' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantIndicators', @level2type=N'COLUMN',@level2name=N'CorrectionalEducationReentryServicesParticipationIndicatorDescription';
GO





