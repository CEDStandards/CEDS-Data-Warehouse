CREATE TABLE [RDS].[DimCharterSchoolManagementOrganizations] (
    [DimCharterSchoolManagementOrganizationId]                     INT            IDENTITY (1, 1) NOT NULL,
    [CharterSchoolManagementOrganizationOrganizationName]          NVARCHAR (MAX) NULL,
    [CharterSchoolManagementOrganizationOrganizationIdentifierSea] NVARCHAR (MAX) NULL,
    [StateAbbreviationDescription]                                 NVARCHAR (MAX) NULL,
    [StateAbbreviationCode]                                        NVARCHAR (MAX) NULL,
    [StateANSICode]                                                NVARCHAR (MAX) NULL,
    [CharterSchoolManagementOrganizationTypeCode]                  NVARCHAR (50)  NULL,
    [CharterSchoolManagementOrganizationTypeDescription]           NVARCHAR (100) NULL,
    [CharterSchoolManagementOrganizationTypeEdfactsCode]           NVARCHAR (50)  NULL,
    [MailingAddressCity]                                           NVARCHAR (30)  NULL,
    [MailingAddressPostalCode]                                     NVARCHAR (17)  NULL,
    [MailingAddressStateAbbreviation]                              NVARCHAR (50)  NULL,
    [MailingAddressStreetNumberAndName]                            NVARCHAR (150) NULL,
    [PhysicalAddressCity]                                          NVARCHAR (30)  NULL,
    [PhysicalAddressPostalCode]                                    NVARCHAR (17)  NULL,
    [PhysicalAddressStateAbbreviation]                             NVARCHAR (50)  NULL,
    [PhysicalAddressStreetNumberAndName]                           NVARCHAR (150) NULL,
    [TelephoneNumber]                                              NVARCHAR (24)  NULL,
    [WebSiteAddress]                                               NVARCHAR (300) NULL,
    [OutOfStateIndicator]                                          BIT            NULL,
    [RecordStartDateTime]                                          DATETIME       NULL,
    [RecordEndDateTime]                                            DATETIME       NULL,
    [OrganizationIdentifierFein]                                   VARCHAR (50)   NULL,
    CONSTRAINT [PK_DimCharterSchoolManagementOrganizations] PRIMARY KEY CLUSTERED ([DimCharterSchoolManagementOrganizationId] ASC)
);


GO

