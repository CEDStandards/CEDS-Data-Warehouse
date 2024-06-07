CREATE TABLE [RDS].[BridgeAeStudentEnrollmentAeEmploymentBarriers] (
    [BridgeAeStudentEnrollmentAeEmploymentBarrierId] INT IDENTITY (1, 1) NOT NULL,
    [FactAeStudentEnrollmentId]           INT NOT NULL,
    [AeEmploymentBarrierId]               INT NOT NULL,
    CONSTRAINT [PK_BridgeAeStudentEnrollmentAeEmploymentBarriers] PRIMARY KEY CLUSTERED ([BridgeAeStudentEnrollmentAeEmploymentBarrierId] ASC),
    CONSTRAINT [FK_BridgeAeStudentEnrollmentAeEmploymentBarriers_FactAeStudentEnrollmentId] FOREIGN KEY ([FactAeStudentEnrollmentId]) REFERENCES [RDS].[FactAeStudentEnrollments] ([FactAeStudentEnrollmentId]),
    CONSTRAINT [FK_BridgeAeStudentEnrollmentAeEmploymentBarriers_AeEmploymentBarrierId] FOREIGN KEY ([AeEmploymentBarrierId]) REFERENCES [RDS].[DimAeEmploymentBarriers] ([DimAeEmploymentBarrierId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeAeStudentEnrollmentAeEmploymentBarriers_FactAeStudentEnrollmentId]
    ON [RDS].[BridgeAeStudentEnrollmentAeEmploymentBarriers]([FactAeStudentEnrollmentId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeAeStudentEnrollmentAeEmploymentBarriers_AeEmploymentBarrierId]
    ON [RDS].[BridgeAeStudentEnrollmentAeEmploymentBarriers]([AeEmploymentBarrierId] ASC);


GO

