CREATE TABLE [RDS].[DimPsFamilyStatuses] (
    [DimPsFamilyStatusId]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [DependencyStatusCode]                    NVARCHAR (50)  NULL,
    [DependencyStatusDescription]             NVARCHAR (200) NULL,
    [NumberOfDependentsTypeCode]              NVARCHAR (50)  NULL,
    [NumberOfDependentsTypeDescription]       NVARCHAR (200) NULL,
    [SingleParentOrSinglePregnantWomanStatus] BIT            NULL,
    [MaternalGuardianEducationCode]           NVARCHAR (50)  NULL,
    [MaternalGuardianEducationDescription]    NVARCHAR (200) NULL,
    [PaternalGuardianEducationCode]           NVARCHAR (50)  NULL,
    [PaternalGuardianEducationDescription]    NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimPsFamilyStatuses] PRIMARY KEY CLUSTERED ([DimPsFamilyStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsFamilyStatuses_Codes]
    ON [RDS].[DimPsFamilyStatuses]([DependencyStatusCode] ASC, [NumberOfDependentsTypeCode] ASC, [MaternalGuardianEducationCode] ASC, [PaternalGuardianEducationCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38683 ', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimPsFamilyStatuses', @level2type = N'COLUMN', @level2name = N'PaternalGuardianEducationDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=37740', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimPsFamilyStatuses', @level2type = N'COLUMN', @level2name = N'DependencyStatusDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38682', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimPsFamilyStatuses', @level2type = N'COLUMN', @level2name = N'MaternalGuardianEducationCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38683 ', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimPsFamilyStatuses', @level2type = N'COLUMN', @level2name = N'PaternalGuardianEducationCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=37740', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimPsFamilyStatuses', @level2type = N'COLUMN', @level2name = N'DependencyStatusCode';


GO

