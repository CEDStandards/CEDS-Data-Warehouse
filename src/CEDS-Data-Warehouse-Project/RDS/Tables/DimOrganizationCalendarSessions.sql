CREATE TABLE [RDS].[DimOrganizationCalendarSessions] (
    [DimOrganizationCalendarSessionId]  INT            IDENTITY (1, 1) NOT NULL,
    [SessionBeginDate]                  DATETIME       NOT NULL,
    [SessionEndDate]                    DATETIME       NOT NULL,
    [SessionCode]                       NVARCHAR (30)  CONSTRAINT [DF_DimOrganizationCalendarSessions_SessionCode] DEFAULT ('MISSING') NOT NULL,
    [SessionDescription]                NVARCHAR (MAX) CONSTRAINT [DF_DimOrganizationCalendarSessions_SessionDescription] DEFAULT ('MISSING') NOT NULL,
    [AcademicTermDesignatorCode]        NVARCHAR (30)  CONSTRAINT [DF_DimOrganizationCalendarSessions_AcademicTermDesignatorCode] DEFAULT ('MISSING') NOT NULL,
    [AcademicTermDesignatorDescription] NVARCHAR (MAX) CONSTRAINT [DF_DimOrganizationCalendarSessions_AcademicTermDesignatorDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimOrganizationCalendarSessions] PRIMARY KEY CLUSTERED ([DimOrganizationCalendarSessionId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The academic term for which the data apply.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Academic Term Designator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000727' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21703' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The academic term for which the data apply.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Academic Term Designator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000727' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21703' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionBeginDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a session begins.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionBeginDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Begin Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionBeginDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000251' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionBeginDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21251' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionBeginDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A local code given to the session, usually for a session that represents a term within the school year such as a marking term.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001270' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22236' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A short description of the Session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001271' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22237' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a session ends.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session End Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000253' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21253' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationCalendarSessions', @level2type=N'COLUMN',@level2name=N'SessionEndDate';
GO