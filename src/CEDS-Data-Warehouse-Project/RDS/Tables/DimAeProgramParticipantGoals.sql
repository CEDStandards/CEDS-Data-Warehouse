CREATE TABLE [RDS].[DimAeProgramParticipantGoals] (
    [DimAeProgramParticipantGoalId]       INT            IDENTITY (1, 1) NOT NULL,
    [GoalsForAttendingAdultEducationCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAeProgramParticipantGoals_GoalsForAttendingAdultEducationCode] DEFAULT ('MISSING') NOT NULL,
    [GoalsForAttendingAdultEducationDescription] NVARCHAR (200) CONSTRAINT [DF_DimAeProgramParticipantGoals_GoalsForAttendingAdultEducationDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAeProgramParticipantGoals] PRIMARY KEY CLUSTERED ([DimAeProgramParticipantGoalId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAeProgramParticipantGoals_GoalsForAttendingAdultEducationCode]
    ON [RDS].[DimAeProgramParticipantGoals]([GoalsForAttendingAdultEducationCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantGoals', @level2type=N'COLUMN',@level2name=N'GoalsForAttendingAdultEducationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person''s reasons for attending an adult education class or program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantGoals', @level2type=N'COLUMN',@level2name=N'GoalsForAttendingAdultEducationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Goals for Attending Adult Education' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantGoals', @level2type=N'COLUMN',@level2name=N'GoalsForAttendingAdultEducationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001079' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantGoals', @level2type=N'COLUMN',@level2name=N'GoalsForAttendingAdultEducationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001079' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantGoals', @level2type=N'COLUMN',@level2name=N'GoalsForAttendingAdultEducationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantGoals', @level2type=N'COLUMN',@level2name=N'GoalsForAttendingAdultEducationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person''s reasons for attending an adult education class or program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantGoals', @level2type=N'COLUMN',@level2name=N'GoalsForAttendingAdultEducationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Goals for Attending Adult Education' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantGoals', @level2type=N'COLUMN',@level2name=N'GoalsForAttendingAdultEducationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001079' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantGoals', @level2type=N'COLUMN',@level2name=N'GoalsForAttendingAdultEducationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001079' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramParticipantGoals', @level2type=N'COLUMN',@level2name=N'GoalsForAttendingAdultEducationDescription';
GO




