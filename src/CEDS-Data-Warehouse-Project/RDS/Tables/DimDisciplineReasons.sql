CREATE TABLE [RDS].[DimDisciplineReasons] (
    [DimDisciplineReasonId]       INT            IDENTITY (1, 1) NOT NULL,
    [DisciplineReasonCode]        NVARCHAR (50)  NOT NULL,
    [DisciplineReasonDescription] NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DimDisciplineReasonId] PRIMARY KEY CLUSTERED ([DimDisciplineReasonId] ASC)
);


GO

