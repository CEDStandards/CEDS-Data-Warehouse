CREATE TABLE [RDS].[DimOrganizationCalendarSessions] (
    [DimOrganizationCalendarSessionId]  INT            IDENTITY (1, 1) NOT NULL,
    [SessionBeginDate]                  DATETIME       NULL,
    [SessionEndDate]                    DATETIME       NULL,
    [SessionCode]                       NVARCHAR (30)  NULL,
    [SessionDescription]                NVARCHAR (MAX) NULL,
    [AcademicTermDesignatorCode]        NVARCHAR (30)  NULL,
    [AcademicTermDesignatorDescription] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_DimOrganizationCalendarSessions] PRIMARY KEY CLUSTERED ([DimOrganizationCalendarSessionId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

