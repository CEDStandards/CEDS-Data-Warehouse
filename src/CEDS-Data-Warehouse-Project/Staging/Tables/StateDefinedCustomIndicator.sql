CREATE TABLE [Staging].[StateDefinedCustomIndicator] (
    [Id]                             INT            IDENTITY (1, 1) NOT NULL,
    [Code]                           NVARCHAR (50)  NULL,
    [Description]                    NVARCHAR (100) NULL,
    [Definition]                     NVARCHAR (MAX) NULL,
    [RefIndicatorStatusCustomTypeId] INT            NULL,
    [RunDateTime]                    DATETIME       NULL,
    CONSTRAINT [PK_StateDefinedCustomIndicator] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80)
);


GO

EXECUTE sp_addextendedproperty @name = N'TableType', @value = N'Migration', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StateDefinedCustomIndicator';


GO

