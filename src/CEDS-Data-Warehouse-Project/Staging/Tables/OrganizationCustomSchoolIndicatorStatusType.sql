CREATE TABLE [Staging].[OrganizationCustomSchoolIndicatorStatusType] (
    [Id]                                     INT            IDENTITY (1, 1) NOT NULL,
    [SchoolIdentifierSea]                    NVARCHAR (50)  NOT NULL,
    [IndicatorStatusType]                    VARCHAR (100)  NULL,
    [IndicatorStatus]                        VARCHAR (100)  NULL,
    [IndicatorStatusSubgroupType]            VARCHAR (100)  NULL,
    [IndicatorStatusSubgroup]                VARCHAR (100)  NULL,
    [StatedDefinedIndicatorStatus]           VARCHAR (100)  NULL,
    [StatedDefinedCustomIndicatorStatusType] VARCHAR (100)  NULL,
    [SchoolYear]                             SMALLINT       NULL,
    [RecordStartDateTime]                    DATETIME       NULL,
    [RecordEndDateTime]                      DATETIME       NULL,
    [DataCollectionName]                     NVARCHAR (100) NULL,
    [DataCollectionId]                       INT            NULL,
    CONSTRAINT [PK_OrganizationCustomSchoolIndicatorStatusType] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

