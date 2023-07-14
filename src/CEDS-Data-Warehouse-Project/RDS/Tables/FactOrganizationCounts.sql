CREATE TABLE [RDS].[FactOrganizationCounts] (
    [FactOrganizationCountId]                           INT           IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]                                      INT           CONSTRAINT [DF_FactOrganizationCounts_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [FactTypeId]                                        INT           CONSTRAINT [DF_FactOrganizationCounts_FactTypeId] DEFAULT ((-1)) NOT NULL,
    [SeaId]                                             INT           CONSTRAINT [DF_FactOrganizationCounts_SeaId] DEFAULT ((-1)) NOT NULL,
    [LeaId]                                             INT           CONSTRAINT [DF_FactOrganizationCounts_LeaId] DEFAULT ((-1)) NOT NULL,
    [K12StaffId]                                        BIGINT        CONSTRAINT [DF_FactOrganizationCounts_K12StaffId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolId]                                       INT           CONSTRAINT [DF_FactOrganizationCounts_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [AuthorizingBodyCharterSchoolAuthorizerId]          INT           CONSTRAINT [DF_FactOrganizationCounts_AuthorizingBodyCharterSchoolAuthorizerId] DEFAULT ((-1)) NOT NULL,
    [CharterSchoolManagementOrganizationId]             INT           CONSTRAINT [DF_FactOrganizationCounts_CharterSchoolManagementOrganizationId] DEFAULT ((-1)) NOT NULL,
    [SecondaryAuthorizingBodyCharterSchoolAuthorizerId] INT           CONSTRAINT [DF_FactOrganizationCounts_SecondaryAuthorizingBodyCharterSchoolAuthorizerId] DEFAULT ((-1)) NOT NULL,
    [CharterSchoolStatusId]                             INT           CONSTRAINT [DF_FactOrganizationCounts_CharterSchoolStatusId] DEFAULT ((-1)) NOT NULL,
    [CharterSchoolUpdatedManagementOrganizationId]      INT           CONSTRAINT [DF_FactOrganizationCounts_CharterSchoolUpdatedManagementOrganizationId] DEFAULT ((-1)) NOT NULL,
    [ComprehensiveAndTargetedSupportId]                 INT           CONSTRAINT [DF_FactOrganizationCounts_ComprehensiveAndTargetedSupportId] DEFAULT ((-1)) NOT NULL,
    [ReasonApplicabilityId]                             INT           CONSTRAINT [DF_FactOrganizationCounts_ReasonApplicabilityId] DEFAULT ((-1)) NOT NULL,
    [K12OrganizationStatusId]                           INT           CONSTRAINT [DF_FactOrganizationCounts_K12OrganizationStatusId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolStatusId]                                 INT           CONSTRAINT [DF_FactOrganizationCounts_K12SchoolStatusId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolStateStatusId]                            INT           CONSTRAINT [DF_FactOrganizationCounts_K12SchoolStateStatusId] DEFAULT ((-1)) NOT NULL,
    [SubgroupId]                                        INT           CONSTRAINT [DF_FactOrganizationCounts_SubgroupId] DEFAULT ((-1)) NOT NULL,
    [TitleIStatusId]                                    INT           CONSTRAINT [DF_FactOrganizationCounts_TitleIStatusId] DEFAULT ((-1)) NOT NULL,
    [FederalProgramCode]                                NVARCHAR (20) NULL,
    [FederalProgramsFundingAllocationType]              NVARCHAR (20) NULL,
    [FederalProgramsFundingAllocation]                  INT           NULL,
    [SchoolImprovementFunds]                            INT           NULL,
    [TitleIParentalInvolveRes]                          INT           NULL,
    [TitleIPartAAllocations]                            INT           NULL,
    [OrganizationCount]                                 INT           CONSTRAINT [DF_FactOrganizationCounts_OrganizationCount] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_FactOrganizationCounts] PRIMARY KEY CLUSTERED ([FactOrganizationCountId] ASC),
    CONSTRAINT [FK_FactOrganizationCounts_AuthorizingBodyCharterSchoolAuthorizerId] FOREIGN KEY ([AuthorizingBodyCharterSchoolAuthorizerId]) REFERENCES [RDS].[DimCharterSchoolAuthorizers] ([DimCharterSchoolAuthorizerId]),
    CONSTRAINT [FK_FactOrganizationCounts_CharterSchoolManagementOrganizationId] FOREIGN KEY ([CharterSchoolManagementOrganizationId]) REFERENCES [RDS].[DimCharterSchoolManagementOrganizations] ([DimCharterSchoolManagementOrganizationId]),
    CONSTRAINT [FK_FactOrganizationCounts_FactTypeId] FOREIGN KEY ([FactTypeId]) REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId]),
    CONSTRAINT [FK_FactOrganizationCounts_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]),
    CONSTRAINT [FK_FactOrganizationCounts_K12SchoolStatusId] FOREIGN KEY ([K12SchoolStatusId]) REFERENCES [RDS].[DimK12SchoolStatuses] ([DimK12SchoolStatusId]),
    CONSTRAINT [FK_FactOrganizationCounts_LeaId] FOREIGN KEY ([LeaId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactOrganizationCounts_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactOrganizationCounts_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]),
    CONSTRAINT [FK_FactOrganizationCounts_SecondaryAuthorizingBodyCharterSchoolAuthorizerId] FOREIGN KEY ([SecondaryAuthorizingBodyCharterSchoolAuthorizerId]) REFERENCES [RDS].[DimCharterSchoolAuthorizers] ([DimCharterSchoolAuthorizerId])
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The unique five-digit number assigned to each federal program as listed in the Assistance Listings. See https://sam.gov/content/assistance-listings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Federal Program Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000547' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21538' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramsFundingAllocation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The amount of federal dollars distributed to local education agencies (LEAs), retained by the state education agency (SEA) for program administration or other approved state-level activities (including unallocated, transferred to another state agency, or distributed to entities other than LEAs).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramsFundingAllocation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Federal Programs Funding Allocation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramsFundingAllocation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000549' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramsFundingAllocation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21540' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramsFundingAllocation';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramsFundingAllocationType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of federal program funding allocation or distribution made.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramsFundingAllocationType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Federal Programs Funding Allocation Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramsFundingAllocationType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000548' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramsFundingAllocationType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21539' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramsFundingAllocationType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO