CREATE TABLE [RDS].[DimK12EnrollmentStatuses] (
    [DimK12EnrollmentStatusId]                                      INT            IDENTITY (1, 1) NOT NULL,
    [EnrollmentStatusCode]                                          NVARCHAR (50)  CONSTRAINT [DF_DimK12EnrollmentStatuses_EnrollmentStatusCode] DEFAULT ('MISSING') NOT NULL,
    [EnrollmentStatusDescription]                                   NVARCHAR (50)  CONSTRAINT [DF_DimK12EnrollmentStatuses_EnrollmentStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [EntryTypeCode]                                                 NVARCHAR (50)  CONSTRAINT [DF_DimK12EnrollmentStatuses_EntryTypeCode] DEFAULT ('MISSING') NOT NULL,
    [EntryTypeDescription]                                          NVARCHAR (200) CONSTRAINT [DF_DimK12EnrollmentStatuses_EntryTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [ExitOrWithdrawalTypeCode]                                      NVARCHAR (50)  CONSTRAINT [DF_DimK12EnrollmentStatuses_ExitOrWithdrawalTypeCode] DEFAULT ('MISSING') NOT NULL,
    [ExitOrWithdrawalTypeDescription]                               NVARCHAR (300) CONSTRAINT [DF_DimK12EnrollmentStatuses_ExitOrWithdrawalTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [PostSecondaryEnrollmentStatusCode]                             VARCHAR (50)   CONSTRAINT [DF_DimK12EnrollmentStatuses_PostSecondaryEnrollmentStatusCode] DEFAULT ('MISSING') NOT NULL,
    [PostSecondaryEnrollmentStatusDescription]                      VARCHAR (200)  CONSTRAINT [DF_DimK12EnrollmentStatuses_PostSecondaryEnrollmentStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [PostSecondaryEnrollmentStatusEdFactsCode]                      VARCHAR (50)   CONSTRAINT [DF_DimK12EnrollmentStatuses_PostSecondaryEnrollmentStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode]            VARCHAR (50)   CONSTRAINT [DF_DimK12EnrollmentStatuses_EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode] DEFAULT ('MISSING') NOT NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription]     VARCHAR (100)  CONSTRAINT [DF_DimK12EnrollmentStatuses_EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode]     VARCHAR (50)   CONSTRAINT [DF_DimK12EnrollmentStatuses_EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode]        VARCHAR (50)   CONSTRAINT [DF_DimK12EnrollmentStatuses_EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode] DEFAULT ('MISSING') NOT NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription] VARCHAR (100)  CONSTRAINT [DF_DimK12EnrollmentStatuses_EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode] VARCHAR (50)   CONSTRAINT [DF_DimK12EnrollmentStatuses_EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimK12EnrollmentStatuses] PRIMARY KEY CLUSTERED ([DimK12EnrollmentStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12EnrollmentStatuses_Codes]
    ON [RDS].[DimK12EnrollmentStatuses]([EnrollmentStatusCode] ASC, [EntryTypeCode] ASC, [ExitOrWithdrawalTypeCode] ASC, [PostSecondaryEnrollmentStatusCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12EnrollmentStatuses_PostSecondaryEnrollmentStatusEdFactsCode]
    ON [RDS].[DimK12EnrollmentStatuses]([PostSecondaryEnrollmentStatusEdFactsCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of academic or career and technical outcome attained up to 90 days after exiting the facility or program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Academic or Career and Technical Outcome Exit Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001979' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22927' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of academic or career and technical outcome attained up to 90 days after exiting the facility or program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Academic or Career and Technical Outcome Exit Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001979' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22927' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of academic or career and technical outcome attained up to 90 days after exiting the facility or program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Academic or Career and Technical Outcome Exit Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001979' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22927' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of academic or career and technical outcome attained while enrolled in the program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Academic or Career and Technical Outcome Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001978' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22928' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of academic or career and technical outcome attained while enrolled in the program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Academic or Career and Technical Outcome Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001978' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22928' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of academic or career and technical outcome attained while enrolled in the program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Academic or Career and Technical Outcome Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001978' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22928' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication as to whether a student''s name was, is, or will be officially registered on the roll of a school or schools.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication as to whether a student''s name was, is, or will be officially registered on the roll of a school or schools.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The process by which a student enters a school during a given academic session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Entry Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000099' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21099' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The process by which a student enters a school during a given academic session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Entry Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000099' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21099' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The circumstances under which the student exited from membership in an educational institution. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Exit or Withdrawal Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000110' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21110' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The circumstances under which the student exited from membership in an educational institution. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Exit or Withdrawal Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000110' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21110' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication as to whether a student''s name was, is, or will be officially registered on the roll of a school or schools.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication as to whether a student''s name was, is, or will be officially registered on the roll of a school or schools.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication as to whether a student''s name was, is, or will be officially registered on the roll of a school or schools.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatusEdFactsCode';
GO

