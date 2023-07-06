CREATE TABLE [RDS].[DimMilitaryStatuses] (
    [DimMilitaryStatusId]                          INT            IDENTITY (1, 1) NOT NULL,
    [MilitaryConnectedStudentIndicatorCode]        NVARCHAR (50)  NULL,
    [MilitaryConnectedStudentIndicatorDescription] NVARCHAR (200) NULL,
    [MilitaryConnectedStudentIndicatorEdFactsCode] NVARCHAR (50)  NULL,
    [MilitaryActiveStudentIndicatorCode]           NVARCHAR (50)  NULL,
    [MilitaryActiveStudentIndicatorDescription]    NVARCHAR (200) NULL,
    [MilitaryBranchCode]                           NVARCHAR (50)  NULL,
    [MilitaryBranchDescription]                    NVARCHAR (200) NULL,
    [MilitaryVeteranStudentIndicatorCode]          NVARCHAR (50)  NULL,
    [MilitaryVeteranStudentIndicatorDescription]   NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimMilitaryStatuses] PRIMARY KEY CLUSTERED ([DimMilitaryStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimMilitaryStatuses_Codes]
    ON [RDS].[DimMilitaryStatuses]([MilitaryConnectedStudentIndicatorCode] ASC, [MilitaryActiveStudentIndicatorCode] ASC, [MilitaryBranchCode] ASC, [MilitaryVeteranStudentIndicatorCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

