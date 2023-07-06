CREATE TABLE [RDS].[ReportEDFactsK12StudentAttendance] (
    [ReportEDFactsK12StudentAttendanceId] INT             IDENTITY (1, 1) NOT NULL,
    [Categories]                          NVARCHAR (300)  NULL,
    [CategorySetCode]                     NVARCHAR (40)   NOT NULL,
    [ECODISSTATUS]                        NVARCHAR (50)   NULL,
    [HOMELESSSTATUS]                      NVARCHAR (50)   NULL,
    [LEPSTATUS]                           NVARCHAR (50)   NULL,
    [MIGRANTSTATUS]                       NVARCHAR (50)   NULL,
    [OrganizationName]                    NVARCHAR (1000) NOT NULL,
    [OrganizationIdentifierNces]          NVARCHAR (100)  NOT NULL,
    [OrganizationIdentifierSea]           NVARCHAR (100)  NOT NULL,
    [ParentOrganizationIdentifierSea]     NVARCHAR (100)  NULL,
    [RACE]                                NVARCHAR (50)   NULL,
    [ReportCode]                          NVARCHAR (40)   NOT NULL,
    [ReportLevel]                         NVARCHAR (40)   NOT NULL,
    [ReportYear]                          NVARCHAR (40)   NOT NULL,
    [SEX]                                 NVARCHAR (50)   NULL,
    [StateANSICode]                       NVARCHAR (100)  NOT NULL,
    [StateAbbreviationCode]               NVARCHAR (100)  NOT NULL,
    [StateAbbreviationDescription]        NVARCHAR (500)  NOT NULL,
    [StudentAttendanceRate]               DECIMAL (18, 3) NOT NULL,
    [TableTypeAbbrv]                      NVARCHAR (100)  NULL,
    [TotalIndicator]                      NVARCHAR (5)    NULL,
    [MILITARYCONNECTEDSTATUS]             NVARCHAR (50)   NULL,
    [HOMELESSNIGHTTIMERESIDENCE]          NVARCHAR (50)   NULL,
    [HOMELESSUNACCOMPANIEDYOUTHSTATUS]    NVARCHAR (50)   NULL,
    [ATTENDANCE]                          VARCHAR (50)    NULL
);


GO

