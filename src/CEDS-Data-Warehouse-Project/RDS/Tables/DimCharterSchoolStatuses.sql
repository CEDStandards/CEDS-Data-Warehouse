CREATE TABLE [RDS].[DimCharterSchoolStatuses] (
    [DimCharterSchoolStatusId]       INT            IDENTITY (1, 1) NOT NULL,
    [AppropriationMethodCode]        NVARCHAR (50)  NULL,
    [AppropriationMethodDescription] NVARCHAR (200) NULL,
    [AppropriationMethodEdFactsCode] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimCharterSchoolStatus] PRIMARY KEY CLUSTERED ([DimCharterSchoolStatusId] ASC)
);


GO

