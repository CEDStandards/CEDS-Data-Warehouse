CREATE TABLE [RDS].[DimPsAcademicAwardStatuses] (
    [DimPsAcademicAwardStatusId]                            INT            IDENTITY (1, 1) NOT NULL,
    [PescAwardLevelTypeCode]                                NVARCHAR (50)  NULL,
    [PescAwardLevelTypeDescription]                         NVARCHAR (400) NULL,
    [ProfessionalOrTechnicalCredentialConferredCode]        NVARCHAR (50)  NULL,
    [ProfessionalOrTechnicalCredentialConferredDescription] NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimPsAcademicAwardStatuses] PRIMARY KEY CLUSTERED ([DimPsAcademicAwardStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsAcademicAwardStatuses_Codes]
    ON [RDS].[DimPsAcademicAwardStatuses]([PescAwardLevelTypeCode] ASC, [ProfessionalOrTechnicalCredentialConferredCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'PescAwardLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of the category of award conferred by a college, university, or other postsecondary education institution as official recognition for the successful completion of a program of study.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'PescAwardLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'PESC Award Level Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'PescAwardLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001668' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'PescAwardLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22649' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'PescAwardLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'PescAwardLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of the category of award conferred by a college, university, or other postsecondary education institution as official recognition for the successful completion of a program of study.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'PescAwardLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'PESC Award Level Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'PescAwardLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001668' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'PescAwardLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22649' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'PescAwardLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferredCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of the category of credential conferred by a state occupational licensing entity or industry organization for competency in a specific area measured by a set of pre-established standards.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferredCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional or Technical Credential Conferred' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferredCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000783' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferredCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21780' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferredCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferredDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of the category of credential conferred by a state occupational licensing entity or industry organization for competency in a specific area measured by a set of pre-established standards.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferredDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional or Technical Credential Conferred' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferredDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000783' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferredDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21780' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsAcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferredDescription';
GO