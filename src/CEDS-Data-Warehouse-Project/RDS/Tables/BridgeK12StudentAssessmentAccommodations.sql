CREATE TABLE [RDS].[BridgeK12StudentAssessmentAccommodations] (
    [FactK12StudentAssessmentAccommodationId] INT IDENTITY (1, 1) NOT NULL,
    [FactK12StudentAssessmentId]              INT CONSTRAINT [DF_BridgeK12StudentAssessmentAccommodations_FactK12StudentAssessmentId] DEFAULT ((-1)) NOT NULL,
    [AssessmentAccommodationId]               INT CONSTRAINT [DF_BridgeK12StudentAssessmentAccommodations_AssessmentAccommodationId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_BridgeK12StudentAssessmentAccommodations] PRIMARY KEY CLUSTERED ([FactK12StudentAssessmentAccommodationId] ASC),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccommodations_AssessmentAccommodationId] FOREIGN KEY ([AssessmentAccommodationId]) REFERENCES [RDS].[DimAssessmentAccommodations] ([DimAssessmentAccommodationId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentAccommodations_FactK12StudentAssessmentId] FOREIGN KEY ([FactK12StudentAssessmentId]) REFERENCES [RDS].[FactK12StudentAssessments] ([FactK12StudentAssessmentId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccommodations_FactK12StudentAssessmentId]
    ON [RDS].[BridgeK12StudentAssessmentAccommodations]([FactK12StudentAssessmentId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentAccommodations_AssessmentAccommodationId]
    ON [RDS].[BridgeK12StudentAssessmentAccommodations]([AssessmentAccommodationId] ASC);


GO

