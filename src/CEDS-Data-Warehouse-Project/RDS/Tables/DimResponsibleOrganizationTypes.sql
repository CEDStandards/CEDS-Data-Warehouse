CREATE TABLE [RDS].[DimResponsibleOrganizationTypes] (
    [DimResponsibleOrganizationTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [ResponsibleDistrictTypeCode]        NVARCHAR (50)  NOT NULL,
    [ResponsibleDistrictTypeDescription] NVARCHAR (200) NOT NULL,
    [ResponsibleSchoolTypeCode]          NVARCHAR (50)  NOT NULL,
    [ResponsibleSchoolTypeDescription]   NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DimResponsibleOrganizationTypes] PRIMARY KEY CLUSTERED ([DimResponsibleOrganizationTypeId] ASC)
);


GO

