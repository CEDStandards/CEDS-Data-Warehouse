CREATE TABLE [RDS].[DimImmigrantStatuses] (
    [DimImmigrantStatusId]                            INT            IDENTITY (1, 1) NOT NULL,
    [TitleIIIImmigrantStatusCode]                     NVARCHAR (100) NOT NULL,
    [TitleIIIImmigrantStatusDescription]              NVARCHAR (300) NOT NULL,
    [TitleIIIImmigrantStatusEdFactsCode]              NVARCHAR (50)  NOT NULL,
    [TitleIIIImmigrantParticipationStatusCode]        NVARCHAR (100) NOT NULL,
    [TitleIIIImmigrantParticipationStatusDescription] NVARCHAR (300) NOT NULL,
    [TitleIIIImmigrantParticipationStatusEdFactsCode] NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_DimImmigrantStatuses] PRIMARY KEY CLUSTERED ([DimImmigrantStatusId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that an immigrant student participated in programs for immigrant children and youth funded under ESEA Title III Section 3114(d)(1) using funds reserved for immigrant education programs/activities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Immigrant Participation Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that an immigrant student participated in programs for immigrant children and youth funded under ESEA Title III Section 3114(d)(1) using funds reserved for immigrant education programs/activities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Immigrant Participation Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that an immigrant student participated in programs for immigrant children and youth funded under ESEA Title III Section 3114(d)(1) using funds reserved for immigrant education programs/activities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Immigrant Participation Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantParticipationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the child is an immigrant according to the Title III of ESEA definition, meaning children who are aged 3 through 21; were not born in any state; and have not been attending one or more schools in any one or more States for more than 3 full academic years.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Immigrant Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000291' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21291' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the child is an immigrant according to the Title III of ESEA definition, meaning children who are aged 3 through 21; were not born in any state; and have not been attending one or more schools in any one or more States for more than 3 full academic years.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Immigrant Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000291' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21291' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the child is an immigrant according to the Title III of ESEA definition, meaning children who are aged 3 through 21; were not born in any state; and have not been attending one or more schools in any one or more States for more than 3 full academic years.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Immigrant Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000291' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21291' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimImmigrantStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatusEdFactsCode';
GO