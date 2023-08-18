CREATE TABLE [RDS].[DimAttendances] (
    [DimAttendanceId]        INT            IDENTITY (1, 1) NOT NULL,
    [AbsenteeismCode]        NVARCHAR (50)  NULL,
    [AbsenteeismDescription] NVARCHAR (200) NULL,
    [AbsenteeismEdFactsCode] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimAttendances] PRIMARY KEY CLUSTERED ([DimAttendanceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

