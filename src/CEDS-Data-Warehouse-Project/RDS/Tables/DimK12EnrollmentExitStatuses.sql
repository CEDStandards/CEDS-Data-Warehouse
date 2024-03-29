CREATE TABLE RDS.DimK12EnrollmentExitStatuses
(
    [DimK12StudentEnrollmentExitStatusId] int NOT NULL IDENTITY (1, 1),
    [EndOfTermStatusCode] nvarchar(50) NOT NULL,
    [EndOfTermStatusDescription] nvarchar(200) NOT NULL,
    [RetentionExemptionReasonCode] nvarchar(50) NOT NULL,
    [RetentionExemptionReasonDescription] nvarchar(200) NOT NULL,
    [AdjustedExitOrWithdrawalTypeCode] nvarchar(50) NOT NULL,
    [AdjustedExitOrWithdrawalTypeDescription] nvarchar(200) NOT NULL,
    [DropoutReasonTypeCode] nvarchar(50) NOT NULL,
    [DropoutReasonTypeDescription] nvarchar(200) NOT NULL,
    [StudentDropoutStatusCode] nvarchar(50) NOT NULL,
    [StudentDropoutStatusDescription] nvarchar(200) NOT NULL,
    CONSTRAINT [PK_DimK12StudentEnrollmentExitStatuses] PRIMARY KEY CLUSTERED ([DimK12StudentEnrollmentExitStatusId] ASC)
)