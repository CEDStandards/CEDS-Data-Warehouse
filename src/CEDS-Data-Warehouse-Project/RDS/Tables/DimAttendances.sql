CREATE TABLE [RDS].[DimAttendances] (
    [DimAttendanceId]        INT            IDENTITY (1, 1) NOT NULL,
    [AbsenteeismCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAttendances_AbsenteeismCode] DEFAULT ('MISSING') NOT NULL,
    [AbsenteeismDescription] NVARCHAR (200) CONSTRAINT [DF_DimAttendances_AbsenteeismDescription] DEFAULT ('MISSING') NOT NULL,
    [AbsenteeismEdFactsCode] NVARCHAR (50)  CONSTRAINT [DF_DimAttendances_AbsenteeismEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAttendances] PRIMARY KEY CLUSTERED ([DimAttendanceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

