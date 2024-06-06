CREATE TABLE [RDS].[DimPsEnrollmentStatuses] (
    [DimPsEnrollmentStatusId]                      BIGINT         IDENTITY (1, 1) NOT NULL,
    [PostsecondaryExitOrWithdrawalTypeCode]        NVARCHAR (50)  CONSTRAINT [DF_DimPsEnrollmentStatuses_PostsecondaryExitOrWithdrawalTypeCode] DEFAULT ('MISSING') NOT NULL,
    [PostsecondaryExitOrWithdrawalTypeDescription] NVARCHAR (200) CONSTRAINT [DF_DimPsEnrollmentStatuses_PostsecondaryExitOrWithdrawalTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [PostsecondaryEnrollmentStatusCode]           NVARCHAR (50)  CONSTRAINT [DF_DimPsEnrollmentStatuses_PostsecondaryEnrollmentStatusCode] DEFAULT ('MISSING') NOT NULL,
    [PostsecondaryEnrollmentStatusDescription]    NVARCHAR (200) CONSTRAINT [DF_DimPsEnrollmentStatuses_PostsecondaryEnrollmentStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [PostSecondaryEnrollmentStatusEdFactsCode]    VARCHAR (50)   CONSTRAINT [DF_DimPsEnrollmentStatuses_PostSecondaryEnrollmentStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimPsEnrollmentStatuses] PRIMARY KEY CLUSTERED ([DimPsEnrollmentStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsEnrollmentStatuses_Codes]
    ON [RDS].[DimPsEnrollmentStatuses]([PostsecondaryExitOrWithdrawalTypeCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N' The circumstances under which the student exited from enrollment in a postsecondary institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Postsecondary Exit or Withdrawal Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001617' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001617' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The circumstances under which the student exited from membership in an educational institution. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Exit or Withdrawal Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000110' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001617' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryEnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the student''s enrollment status for a particular term as defined by the institution' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryEnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Postsecondary Enrollment Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryEnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000096' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryEnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000096' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryEnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryEnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the student''s enrollment status for a particular term as defined by the institution' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryEnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Postsecondary Enrollment Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryEnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000096' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryEnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000096' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryEnrollmentStatusDescription';
GO