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

