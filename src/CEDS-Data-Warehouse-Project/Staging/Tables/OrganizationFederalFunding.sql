CREATE TABLE [Staging].[OrganizationFederalFunding] (
    [Id]                                  INT             IDENTITY (1, 1) NOT NULL,
    [OrganizationIdentifier]              NVARCHAR (50)   NULL,
    [OrganizationType]                    VARCHAR (100)   NULL,
    [FederalProgramCode]                  VARCHAR (10)    NULL,
    [FederalProgramsFundingAllocation]    NUMERIC (12, 2) NULL,
    [ParentalInvolvementReservationFunds] NUMERIC (12, 2) NULL,
    [REAPAlternativeFundingStatusCode]    VARCHAR (100)   NULL,
    [FederalProgramFundingAllocationType] VARCHAR (100)   NULL,
    [SchoolYear]                          SMALLINT        NULL,
    [DataCollectionName]                  NVARCHAR (100)  NULL,
    [DataCollectionId]                    INT             NULL,
    [RunDateTime]                         DATETIME        NULL,
    CONSTRAINT [PK_OrganizationFederalFunding] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

