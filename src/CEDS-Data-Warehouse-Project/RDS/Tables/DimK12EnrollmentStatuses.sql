CREATE TABLE [RDS].[DimK12EnrollmentStatuses] (
    [DimK12EnrollmentStatusId]                                      INT            IDENTITY (1, 1) NOT NULL,
    [EnrollmentStatusCode]                                          NVARCHAR (50)  CONSTRAINT [DF_DimK12EnrollmentStatuses_EnrollmentStatusCode] DEFAULT ('MISSING') NOT NULL,
    [EnrollmentStatusDescription]                                   NVARCHAR (50)  CONSTRAINT [DF_DimK12EnrollmentStatuses_EnrollmentStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [EntryTypeCode]                                                 NVARCHAR (50)  CONSTRAINT [DF_DimK12EnrollmentStatuses_EntryTypeCode] DEFAULT ('MISSING') NOT NULL,
    [EntryTypeDescription]                                          NVARCHAR (200) CONSTRAINT [DF_DimK12EnrollmentStatuses_EntryTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [ExitOrWithdrawalTypeCode]                                      NVARCHAR (50)  CONSTRAINT [DF_DimK12EnrollmentStatuses_ExitOrWithdrawalTypeCode] DEFAULT ('MISSING') NOT NULL,
    [ExitOrWithdrawalTypeDescription]                               NVARCHAR (300) CONSTRAINT [DF_DimK12EnrollmentStatuses_ExitOrWithdrawalTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [AdjustedExitOrWithdrawalTypeCode]                              NVARCHAR (50)  CONSTRAINT [DF_DimK12EnrollmentStatuses_AdjustedExitOrWithdrawalTypeCode] DEFAULT ('MISSING') NOT NULL,
    [AdjustedExitOrWithdrawalTypeDescription]                       NVARCHAR (300) CONSTRAINT [DF_DimK12EnrollmentStatuses_AdjustedExitOrWithdrawalTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [ExitOrWithdrawalStatusCode]                                    NVARCHAR (50)  CONSTRAINT [DF_DimK12EnrollmentStatuses_ExitOrWithdrawalStatusCode] DEFAULT ('MISSING') NOT NULL,
    [ExitOrWithdrawalStatusDescription]                             NVARCHAR (300) CONSTRAINT [DF_DimK12EnrollmentStatuses_ExitOrWithdrawalStatusDescription] DEFAULT ('MISSING') NOT NULL,
CONSTRAINT [PK_DimK12EnrollmentStatuses] PRIMARY KEY CLUSTERED ([DimK12EnrollmentStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12EnrollmentStatuses_Codes]
    ON [RDS].[DimK12EnrollmentStatuses]([EnrollmentStatusCode] ASC, [EntryTypeCode] ASC, [ExitOrWithdrawalTypeCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication as to whether a student''s name was, is, or will be officially registered on the roll of a school or schools.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication as to whether a student''s name was, is, or will be officially registered on the roll of a school or schools.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The process by which a student enters a school during a given academic session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Entry Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000099' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000099' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The process by which a student enters a school during a given academic session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Entry Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000099' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000099' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The circumstances under which the student exited from membership in an educational institution. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Exit or Withdrawal Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000110' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000110' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The circumstances under which the student exited from membership in an educational institution. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Exit or Withdrawal Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000110' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000110' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'AdjustedExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An adjustment of the last known circumstances under which the student exited from membership in an educational institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'AdjustedExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adjusted Exit or Withdrawal Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'AdjustedExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002017' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'AdjustedExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002017' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'AdjustedExitOrWithdrawalTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'AdjustedExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An adjustment of the last known circumstances under which the student exited from membership in an educational institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'AdjustedExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adjusted Exit or Withdrawal Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'AdjustedExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002017' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'AdjustedExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002017' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'AdjustedExitOrWithdrawalTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication as to whether an instance of student exit/withdrawal is considered to be of a permanent or temporary nature.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Exit or Withdrawal Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000108' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000108' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication as to whether an instance of student exit/withdrawal is considered to be of a permanent or temporary nature.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Exit or Withdrawal Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000108' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000108' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalStatusDescription';
GO


