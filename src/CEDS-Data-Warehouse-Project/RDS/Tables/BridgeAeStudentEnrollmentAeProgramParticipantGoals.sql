CREATE TABLE [RDS].[BridgeAeStudentEnrollmentAeProgramParticipantGoals] (
    [BridgeAeStudentEnrollmentAeProgramParticipantGoalId] INT IDENTITY (1, 1) NOT NULL,
    [FactAeStudentEnrollmentId]           INT NOT NULL,
    [AeProgramParticipantGoalId]               INT NOT NULL,
    CONSTRAINT [PK_BridgeAeStudentEnrollmentAeProgramParticipantGoals] PRIMARY KEY CLUSTERED ([BridgeAeStudentEnrollmentAeProgramParticipantGoalId] ASC),
    CONSTRAINT [FK_BridgeAeStudentEnrollmentAeProgramParticipantGoals_FactAeStudentEnrollmentId] FOREIGN KEY ([FactAeStudentEnrollmentId]) REFERENCES [RDS].[FactAeStudentEnrollments] ([FactAeStudentEnrollmentId]),
    CONSTRAINT [FK_BridgeAeStudentEnrollmentAeProgramParticipantGoals_AeProgramParticipantGoalId] FOREIGN KEY ([AeProgramParticipantGoalId]) REFERENCES [RDS].[DimAeProgramParticipantGoals] ([DimAeProgramParticipantGoalId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeAeStudentEnrollmentAeProgramParticipantGoals_FactAeStudentEnrollmentId]
    ON [RDS].[BridgeAeStudentEnrollmentAeProgramParticipantGoals]([FactAeStudentEnrollmentId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeAeStudentEnrollmentAeProgramParticipantGoals_AeProgramParticipantGoalId]
    ON [RDS].[BridgeAeStudentEnrollmentAeProgramParticipantGoals]([AeProgramParticipantGoalId] ASC);


GO

