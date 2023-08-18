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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'HOMELESSUNACCOMPANIEDYOUTHSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that homeless youths were unaccompanied by parents or legal guardians.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'HOMELESSUNACCOMPANIEDYOUTHSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Unaccompanied Youth Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'HOMELESSUNACCOMPANIEDYOUTHSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'HOMELESSUNACCOMPANIEDYOUTHSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'HOMELESSUNACCOMPANIEDYOUTHSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'MIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Persons who are, or whose parents or spouses are, migratory agricultural workers, including migratory dairy workers, or migratory fishers, and who, in the preceding 36 months, in order to obtain, or accompany such parents or spouses, in order to obtain, temporary or seasonal employment in agricultural or fishing work (A) have moved from one LEA to another; (B) in a state that comprises a single LEA, have moved from one administrative area to another within such LEA; or (C) reside in an LEA of more than 15,000 square miles, and migrate a distance of 20 miles or more to a temporary residence to engage in a fishing activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'MIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'MIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000189' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'MIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21189' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'MIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'MILITARYCONNECTEDSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student''s parent or guardian is on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'MILITARYCONNECTEDSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Connected Student Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'MILITARYCONNECTEDSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001576' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'MILITARYCONNECTEDSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'MILITARYCONNECTEDSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21825' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21825' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of a non-person entity such as an organization, institution, agency or business.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21825' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The concept describing the biological traits that distinguish the males and females of a species.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Sex' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000255' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21255' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The American National Standards Institute (ANSI) two-digit code for the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State ANSI Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000424' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21414' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StudentAttendanceRate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of school days during the regular school year (plus summer, if applicable, if part of implementing the restart, transformation, or turnaround model) the student attended school divided by the maximum number of days the student could have attended school during the regular school year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StudentAttendanceRate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Attendance Rate' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StudentAttendanceRate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000271' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StudentAttendanceRate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21271' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'StudentAttendanceRate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'RACE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The origins of a person.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'RACE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Race' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'RACE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001943' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'RACE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22955' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentAttendance', @level2type=N'COLUMN',@level2name=N'RACE';
GO