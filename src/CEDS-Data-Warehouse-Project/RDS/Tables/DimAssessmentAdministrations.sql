CREATE TABLE [RDS].[DimAssessmentAdministrations] (
    [DimAssessmentAdministrationId]             INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentIdentifier]                      NVARCHAR (40)  NULL,
    [AssessmentIdentificationSystem]            NVARCHAR (40)  NULL,
    [AssessmentAdministrationCode]              NVARCHAR (400) NULL,
    [AssessmentAdministrationName]              NVARCHAR (400) NULL,
    [AssessmentAdministrationStartDate]         DATETIME       NULL,
    [AssessmentAdministrationFinishDate]        DATETIME       NULL,
    [AssessmentAdministrationAssessmentFamily]  NVARCHAR (40)  NULL,
    [SchoolIdentifier]                          NVARCHAR (40)  NULL,
    [SchoolIdentificationSystem]                NVARCHAR (40)  NULL,
    [LocalEducationAgencyIdentifier]            NVARCHAR (40)  NULL,
    [LEAIdentificationSystem]                   NVARCHAR (40)  NULL,
    [AssessmentAdministrationOrganizationName]  NVARCHAR (40)  NULL,
    [AssessmentAdministrationPeriodDescription] NVARCHAR (40)  NULL,
    [AssessmentSecureIndicator]                 NVARCHAR (40)  NULL,
    CONSTRAINT [PK_DimAssessmentAdministrations] PRIMARY KEY CLUSTERED ([DimAssessmentAdministrationId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAssessmentAdministrations_AssessmentAdministrationIdentifier]
    ON [RDS].[DimAssessmentAdministrations]([AssessmentAdministrationCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimAssessmentAdministrations_AssessmentAdministrationSubjectEdFactsCode]
    ON [RDS].[DimAssessmentAdministrations]([AssessmentIdentifier] ASC);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationAssessmentFamily';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The title of the assessment family to be administered.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationAssessmentFamily';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Administration Assessment Family' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationAssessmentFamily';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000967' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationAssessmentFamily';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21968' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationAssessmentFamily';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The code given to the assessment event by a state or other authority directing overall administration.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Administration Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000961' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21962' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationFinishDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The finish date of the time period designated for the assessment administration.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationFinishDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Administration Finish Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationFinishDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000964' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationFinishDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21965' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationFinishDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name given to an assessment event.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Administration Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000977' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21978' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the organization with overall responsibility for the assessment event.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Administration Organization Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000966' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21967' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationPeriodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The period or window in which an assessment is supposed to be administered.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationPeriodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Administration Period Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationPeriodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001531' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationPeriodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22506' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationPeriodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date of the time period designated for the assessment administration.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Administration Start Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000962' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21963' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentIdentificationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A coding scheme that is used for identification and record-keeping purposes by schools, social services, or other agencies to refer to an assessment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentIdentificationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Identification System' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentIdentificationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000365' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentIdentificationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21158' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentIdentificationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an assessment by a school, school system, a state, or other agency or entity.  This may be the publisher identifier.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001067' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21152' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentSecureIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates whether or not the assessment is a secure assessment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentSecureIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Secure Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentSecureIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000384' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentSecureIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21375' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'AssessmentSecureIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'LEAIdentificationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A coding scheme that is used for identification and record-keeping purposes by schools, social services, or other agencies to refer to a local education agency.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'LEAIdentificationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identification System' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'LEAIdentificationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001072' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'LEAIdentificationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21159' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'LEAIdentificationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'LocalEducationAgencyIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'LocalEducationAgencyIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'LocalEducationAgencyIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'LocalEducationAgencyIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'LocalEducationAgencyIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'SchoolIdentificationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A coding scheme that is used for identification and record-keeping purposes by schools, social services, or other agencies to refer to an institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'SchoolIdentificationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Identification System' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'SchoolIdentificationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001073' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'SchoolIdentificationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21161' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'SchoolIdentificationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'SchoolIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an institution by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'SchoolIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'SchoolIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001069' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'SchoolIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21155' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentAdministrations', @level2type=N'COLUMN',@level2name=N'SchoolIdentifier';
GO