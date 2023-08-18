CREATE TABLE [RDS].[DimAeProgramTypes] (
    [DimAeProgramTypeId]                    INT            IDENTITY (1, 1) NOT NULL,
    [AeInstructionalProgramTypeCode]        NVARCHAR (50)  NULL,
    [AeInstructionalProgramTypeDescription] NVARCHAR (150) NULL,
    [AeSpecialProgramTypeCode]              NVARCHAR (50)  NULL,
    [AeSpecialProgramTypeDescription]       NVARCHAR (150) NULL,
    [WioaCareerServicesCode]                NVARCHAR (50)  NULL,
    [WioaCareerServicesDescription]         NVARCHAR (150) NULL,
    [WioaTrainingServicesCode]              NVARCHAR (50)  NULL,
    [WioaTrainingServicesDescription]       NVARCHAR (150) NULL,
    CONSTRAINT [PK_DimAeProgramTypes] PRIMARY KEY CLUSTERED ([DimAeProgramTypeId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeInstructionalProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of instructional program in which an adult is enrolled.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeInstructionalProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Instructional Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeInstructionalProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001077' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeInstructionalProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21765' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeInstructionalProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeInstructionalProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of instructional program in which an adult is enrolled.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeInstructionalProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Instructional Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeInstructionalProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001077' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeInstructionalProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21765' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeInstructionalProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeSpecialProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type, by location or delivery mode, of adult education instruction program in which an adult participates.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeSpecialProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Special Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeSpecialProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000782' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeSpecialProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21766' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeSpecialProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeSpecialProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type, by location or delivery mode, of adult education instruction program in which an adult participates.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeSpecialProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Special Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeSpecialProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000782' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeSpecialProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21766' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'AeSpecialProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaCareerServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether or not the individual has received services as identified in sec. 134(c)(2) of the Workforce Innovation and Opportunity Act (WIOA) consisting of (a) basic career services, (b) individualized career services, or (c) follow-up services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaCareerServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'WIOA Career Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaCareerServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001941' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaCareerServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22970' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaCareerServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaCareerServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether or not the individual has received services as identified in sec. 134(c)(2) of the Workforce Innovation and Opportunity Act (WIOA) consisting of (a) basic career services, (b) individualized career services, or (c) follow-up services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaCareerServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'WIOA Career Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaCareerServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001941' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaCareerServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22970' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaCareerServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaTrainingServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether or not the individual has received services as defined by the Workforce Innovation and Opportunity Act (WIOA), one or more courses or classes, or a structured regimen that provides the services in 20 CFR part 680.200 and leads to: (a) An industry-recognized certificate or certification, a certificate of completion of a registered apprenticeship, a license recognized by the State involved or the Federal Government, an associate or baccalaureate degree, or community college certificate of completion; (b) Consistent with § 680.350, a secondary school diploma or its equivalent; (c) Employment; or (d) Measurable skill gains toward a credential described in paragraph (a) or (b) of this section or employment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaTrainingServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'WIOA Training Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaTrainingServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001942' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaTrainingServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22971' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaTrainingServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaTrainingServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether or not the individual has received services as defined by the Workforce Innovation and Opportunity Act (WIOA), one or more courses or classes, or a structured regimen that provides the services in 20 CFR part 680.200 and leads to: (a) An industry-recognized certificate or certification, a certificate of completion of a registered apprenticeship, a license recognized by the State involved or the Federal Government, an associate or baccalaureate degree, or community college certificate of completion; (b) Consistent with § 680.350, a secondary school diploma or its equivalent; (c) Employment; or (d) Measurable skill gains toward a credential described in paragraph (a) or (b) of this section or employment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaTrainingServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'WIOA Training Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaTrainingServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001942' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaTrainingServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22971' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTypes', @level2type=N'COLUMN',@level2name=N'WioaTrainingServicesDescription';
GO