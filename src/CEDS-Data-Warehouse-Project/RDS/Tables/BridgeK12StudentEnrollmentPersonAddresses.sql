CREATE TABLE [RDS].[BridgeK12StudentEnrollmentPersonAddresses] (
    [BridgeK12StudentEnrollmentPersonAddressId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [FactK12StudentEnrollmentId]                BIGINT         CONSTRAINT [DF_BridgeK12StudentEnrollmentPersonAddresses_FactK12StudentEnrollmentId] DEFAULT ((-1)) NOT NULL,
    [PersonAddressId]                           INT            CONSTRAINT [DF_BridgeK12StudentEnrollmentPersonAddresses_PersonAddressId] DEFAULT ((-1)) NOT NULL,
    [AddressTypeForLearnerOrFamilyCode]         NVARCHAR (50)  NULL,
    [AddressTypeForLearnerOrFamilyDescription]  NVARCHAR (150) NULL,
    CONSTRAINT [PK_BridgeK12StudentEnrollmentPersonAddresses] PRIMARY KEY CLUSTERED ([BridgeK12StudentEnrollmentPersonAddressId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_BridgeK12StudentEnrollmentPersonAddresses_FactK12StudentEnrollments] FOREIGN KEY ([FactK12StudentEnrollmentId]) REFERENCES [RDS].[FactK12StudentEnrollments] ([FactK12StudentEnrollmentId]),
    CONSTRAINT [FK_BridgeK12StudentEnrollmentPersonAddresses_PersonAddressId] FOREIGN KEY ([PersonAddressId]) REFERENCES [RDS].[DimPersonAddresses] ([DimPersonAddressId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentEnrollmentPersonAddresses_PersonAddressId]
    ON [RDS].[BridgeK12StudentEnrollmentPersonAddresses]([PersonAddressId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentEnrollmentPersonAddresses_FactK12StudentEnrollments]
    ON [RDS].[BridgeK12StudentEnrollmentPersonAddresses]([FactK12StudentEnrollmentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

