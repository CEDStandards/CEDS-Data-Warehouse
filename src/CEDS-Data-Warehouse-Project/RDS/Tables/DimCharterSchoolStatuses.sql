CREATE TABLE [RDS].[DimCharterSchoolStatuses] (
    [DimCharterSchoolStatusId]       INT            IDENTITY (1, 1) NOT NULL,
    [AppropriationMethodCode]        NVARCHAR (50)  CONSTRAINT [DF_DimCharterSchoolStatuses_AppropriationMethodCode] DEFAULT ('MISSING') NOT NULL,
    [AppropriationMethodDescription] NVARCHAR (200) CONSTRAINT [DF_DimCharterSchoolStatuses_AppropriationMethodDescription] DEFAULT ('MISSING') NOT NULL,
    [AppropriationMethodEdFactsCode] NVARCHAR (50)  CONSTRAINT [DF_DimCharterSchoolStatuses_AppropriationMethodEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimCharterSchoolStatus] PRIMARY KEY CLUSTERED ([DimCharterSchoolStatusId] ASC)
);


GO

