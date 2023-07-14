CREATE TABLE [RDS].[DimPsEnrollmentStatuses] (
    [DimPsEnrollmentStatusId]                      BIGINT         IDENTITY (1, 1) NOT NULL,
    [PostsecondaryExitOrWithdrawalTypeCode]        NVARCHAR (50)  NULL,
    [PostsecondaryExitOrWithdrawalTypeDescription] NVARCHAR (200) NULL,
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
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22596' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The circumstances under which the student exited from membership in an educational institution. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Exit or Withdrawal Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000110' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21110' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'PostsecondaryExitOrWithdrawalTypeDescription';
GO