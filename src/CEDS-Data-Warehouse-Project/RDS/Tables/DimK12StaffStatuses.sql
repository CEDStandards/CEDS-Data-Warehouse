CREATE TABLE [RDS].[DimK12StaffStatuses] (
    [DimK12StaffStatusId]                                   INT            IDENTITY (1, 1) NOT NULL,
    [SpecialEducationAgeGroupTaughtCode]                    NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_SpecialEducationAgeGroupTaughtCode] DEFAULT ('MISSING') NOT NULL,
    [SpecialEducationAgeGroupTaughtDescription]             NVARCHAR (200) CONSTRAINT [DF_DimK12StaffStatuses_SpecialEducationAgeGroupTaughtDescription] DEFAULT ('MISSING') NOT NULL,
    [SpecialEducationAgeGroupTaughtEdFactsCode]             NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_SpecialEducationAgeGroupTaughtEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [EdFactsCertificationStatusCode]                        NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_EdFactsCertificationStatusCode] DEFAULT ('MISSING') NOT NULL,
    [EdFactsCertificationStatusDescription]                 NVARCHAR (200) CONSTRAINT [DF_DimK12StaffStatuses_EdFactsCertificationStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [EdFactsCertificationStatusEdFactsCode]                 NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_EdFactsCertificationStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [HighlyQualifiedTeacherIndicatorCode]                   NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_HighlyQualifiedTeacherIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [HighlyQualifiedTeacherIndicatorDescription]            NVARCHAR (200) CONSTRAINT [DF_DimK12StaffStatuses_HighlyQualifiedTeacherIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    [HighlyQualifiedTeacherIndicatorEdFactsCode]            NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_HighlyQualifiedTeacherIndicatorEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [EdFactsTeacherInexperiencedStatusCode]                 NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_EdFactsTeacherInexperiencedStatusCode] DEFAULT ('MISSING') NOT NULL,
    [EdFactsTeacherInexperiencedStatusDescription]          NVARCHAR (200) CONSTRAINT [DF_DimK12StaffStatuses_EdFactsTeacherInexperiencedStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [EdFactsTeacherInexperiencedStatusEdFactsCode]          NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_EdFactsTeacherInexperiencedStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [TeachingCredentialTypeCode]                            NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_TeachingCredentialTypeCode] DEFAULT ('MISSING') NOT NULL,
    [TeachingCredentialTypeDescription]                     NVARCHAR (200) CONSTRAINT [DF_DimK12StaffStatuses_TeachingCredentialTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [TeachingCredentialTypeEdFactsCode]                     NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_TeachingCredentialTypeEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [EdFactsTeacherOutOfFieldStatusCode]                    NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_EdFactsTeacherOutOfFieldStatusCode] DEFAULT ('MISSING') NOT NULL,
    [EdFactsTeacherOutOfFieldStatusDescription]             NVARCHAR (200) CONSTRAINT [DF_DimK12StaffStatuses_EdFactsTeacherOutOfFieldStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [EdFactsTeacherOutOfFieldStatusEdFactsCode]             NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_EdFactsTeacherOutOfFieldStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [SpecialEducationTeacherQualificationStatusCode]        NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_SpecialEducationTeacherQualificationStatusCode] DEFAULT ('MISSING') NOT NULL,
    [SpecialEducationTeacherQualificationStatusDescription] NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_SpecialEducationTeacherQualificationStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [SpecialEducationTeacherQualificationStatusEdFactsCode] NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_SpecialEducationTeacherQualificationStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [ParaprofessionalQualificationStatusCode]               NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_ParaprofessionalQualificationStatusCode] DEFAULT ('MISSING') NOT NULL,
    [ParaprofessionalQualificationStatusDescription]        NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_ParaprofessionalQualificationStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [ParaprofessionalQualificationStatusEdFactsCode]        NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_ParaprofessionalQualificationStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [SpecialEducationRelatedServicesPersonnelCode]          NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_SpecialEducationRelatedServicesPersonnelCode] DEFAULT ('MISSING') NOT NULL,                
    [SpecialEducationRelatedServicesPersonnelDescription]   NVARCHAR (200) CONSTRAINT [DF_DimK12StaffStatuses_SpecialEducationRelatedServicesPersonnelDescription] DEFAULT ('MISSING') NOT NULL,                        
    [TeachingCredentialBasisCode]                           NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_TeachingCredentialBasisCode] DEFAULT ('MISSING') NOT NULL,
    [TeachingCredentialBasisDescription]                    NVARCHAR (200) CONSTRAINT [DF_DimK12StaffStatuses_TeachingCredentialBasisDescription] DEFAULT ('MISSING') NOT NULL,        
    [CTEInstructorIndustryCertificationCode]                NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_CTEInstructorIndustryCertificationCode] DEFAULT ('MISSING') NOT NULL,            
    [CTEInstructorIndustryCertificationDescription]         NVARCHAR (200) CONSTRAINT [DF_DimK12StaffStatuses_CTEInstructorIndustryCertificationDescription] DEFAULT ('MISSING') NOT NULL,                
    [SpecialEducationParaprofessionalCode]                  NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_SpecialEducationParaprofessionalCode] DEFAULT ('MISSING') NOT NULL,        
    [SpecialEducationParaprofessionalDescription]           NVARCHAR (200) CONSTRAINT [DF_DimK12StaffStatuses_SpecialEducationParaprofessionalDescription] DEFAULT ('MISSING') NOT NULL,                
    [SpecialEducationTeacherCode]                           NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffStatuses_SpecialEducationTeacherCode] DEFAULT ('MISSING') NOT NULL,
    [SpecialEducationTeacherDescription]                    NVARCHAR (200) CONSTRAINT [DF_DimK12StaffStatuses_SpecialEducationTeacherDescription] DEFAULT ('MISSING') NOT NULL,        
    CONSTRAINT [PK_DimK12StaffStatuses] PRIMARY KEY CLUSTERED ([DimK12StaffStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);

GO
CREATE NONCLUSTERED COLUMNSTORE INDEX CSI_DimK12StaffStatuses ON RDS.DimK12StaffStatuses (
  [SpecialEducationAgeGroupTaughtCode]
, [EdFactsCertificationStatusCode]
, [HighlyQualifiedTeacherIndicatorCode]
, [EdFactsTeacherInexperiencedStatusCode]
, [TeachingCredentialTypeCode]
, [EdFactsTeacherOutOfFieldStatusCode]
, [SpecialEducationTeacherQualificationStatusCode]
, [ParaprofessionalQualificationStatusCode]
, [SpecialEducationRelatedServicesPersonnelCode]
, [TeachingCredentialBasisCode]
, [CTEInstructorIndustryCertificationCode]
, [SpecialEducationParaprofessionalCode]
, [SpecialEducationTeacherCode]
)


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_HighlyQualifiedTeacherIndicatorCode]
    ON [RDS].[DimK12StaffStatuses]([HighlyQualifiedTeacherIndicatorCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_Codes]
    ON [RDS].[DimK12StaffStatuses]([SpecialEducationAgeGroupTaughtCode] ASC, [EdFactsCertificationStatusCode] ASC, [HighlyQualifiedTeacherIndicatorCode] ASC, [EdFactsTeacherInexperiencedStatusCode] ASC, [TeachingCredentialTypeCode] ASC, [EdFactsTeacherOutOfFieldStatusCode] ASC, [SpecialEducationTeacherQualificationStatusCode] ASC, [ParaprofessionalQualificationStatusCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_SpecialEducationTeacherQualificationStatusEdFactsCode]
    ON [RDS].[DimK12StaffStatuses]([SpecialEducationTeacherQualificationStatusEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_ParaprofessionalQualificationStatusEdFactsCode]
    ON [RDS].[DimK12StaffStatuses]([ParaprofessionalQualificationStatusEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_EdFactsTeacherInexperiencedStatusCode]
    ON [RDS].[DimK12StaffStatuses]([EdFactsTeacherInexperiencedStatusCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_SpecialEducationAgeGroupTaughtEdFactsCode]
    ON [RDS].[DimK12StaffStatuses]([SpecialEducationAgeGroupTaughtEdFactsCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_EdFactsCertificationStatusCode]
    ON [RDS].[DimK12StaffStatuses]([EdFactsCertificationStatusCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_EdFactsTeacherOutOfFieldStatusEdFactsCode]
    ON [RDS].[DimK12StaffStatuses]([EdFactsTeacherOutOfFieldStatusEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_TeachingCredentialTypeEdFactsCode]
    ON [RDS].[DimK12StaffStatuses]([TeachingCredentialTypeEdFactsCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether teachers have been identified as inexperienced as defined by the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Teacher Inexperienced Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001961' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22929' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether teachers have been identified as inexperienced as defined by the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Teacher Inexperienced Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001961' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22929' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether teachers have been identified as inexperienced as defined by the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Teacher Inexperienced Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001961' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22929' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherOutOfFieldStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether teachers have been identified as teaching a subject or field for which they are not certified or licensed as defined by the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherOutOfFieldStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Teacher Out of Field Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherOutOfFieldStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001962' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherOutOfFieldStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22930' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherOutOfFieldStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherOutOfFieldStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether teachers have been identified as teaching a subject or field for which they are not certified or licensed as defined by the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherOutOfFieldStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Teacher Out of Field Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherOutOfFieldStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001962' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherOutOfFieldStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22930' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherOutOfFieldStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherOutOfFieldStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether teachers have been identified as teaching a subject or field for which they are not certified or licensed as defined by the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherOutOfFieldStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Teacher Out of Field Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherOutOfFieldStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001962' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherOutOfFieldStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22930' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherOutOfFieldStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaughtCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The age range of special education students taught.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaughtCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Age Group Taught' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaughtCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000564' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaughtCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21556' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaughtCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaughtDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The age range of special education students taught.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaughtDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Age Group Taught' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaughtDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000564' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaughtDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21556' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaughtDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaughtEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The age range of special education students taught.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaughtEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Age Group Taught' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaughtEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000564' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaughtEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21556' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaughtEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsCertificationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether an educator holds the certification or licensure required by their assignment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsCertificationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Certification Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsCertificationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001997' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsCertificationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22978' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsCertificationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsCertificationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether an educator holds the certification or licensure required by their assignment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsCertificationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Certification Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsCertificationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001997' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsCertificationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22978' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsCertificationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsCertificationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether an educator holds the certification or licensure required by their assignment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsCertificationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Certification Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsCertificationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001997' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsCertificationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22978' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsCertificationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the teacher has been classified as highly qualified based on assignment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Highly Qualified Teacher Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000142' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21142' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the teacher has been classified as highly qualified based on assignment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Highly Qualified Teacher Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000142' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21142' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the teacher has been classified as highly qualified based on assignment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Highly Qualified Teacher Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000142' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21142' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'ParaprofessionalQualificationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether paraprofessionals are classified as qualified for their assignment according to state definition.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'ParaprofessionalQualificationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Paraprofessional Qualification Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'ParaprofessionalQualificationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000207' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'ParaprofessionalQualificationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21207' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'ParaprofessionalQualificationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'ParaprofessionalQualificationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether paraprofessionals are classified as qualified for their assignment according to state definition.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'ParaprofessionalQualificationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Paraprofessional Qualification Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'ParaprofessionalQualificationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000207' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'ParaprofessionalQualificationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21207' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'ParaprofessionalQualificationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'ParaprofessionalQualificationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether paraprofessionals are classified as qualified for their assignment according to state definition.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'ParaprofessionalQualificationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Paraprofessional Qualification Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'ParaprofessionalQualificationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000207' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'ParaprofessionalQualificationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21207' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'ParaprofessionalQualificationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationTeacherQualificationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether special education teachers are fully certified in the State..' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationTeacherQualificationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Teacher Qualification Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationTeacherQualificationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001996' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationTeacherQualificationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22993' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationTeacherQualificationStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationTeacherQualificationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether special education teachers are fully certified in the State..' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationTeacherQualificationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Teacher Qualification Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationTeacherQualificationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001996' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationTeacherQualificationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22993' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationTeacherQualificationStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationTeacherQualificationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether special education teachers are fully certified in the State..' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationTeacherQualificationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Teacher Qualification Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationTeacherQualificationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001996' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationTeacherQualificationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22993' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'SpecialEducationTeacherQualificationStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the category of a legal document giving authorization to perform teaching assignment services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Teaching Credential Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000278' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21278' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the category of a legal document giving authorization to perform teaching assignment services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Teaching Credential Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000278' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21278' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the category of a legal document giving authorization to perform teaching assignment services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Teaching Credential Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000278' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21278' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffStatuses', @level2type=N'COLUMN',@level2name=N'TeachingCredentialTypeEdFactsCode';
GO