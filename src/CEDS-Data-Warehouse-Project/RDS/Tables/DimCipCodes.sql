CREATE TABLE [RDS].[DimCipCodes] (
    [DimCipCodeId]          INT            NOT NULL,
    [CipCode]               NVARCHAR (7)   NULL,
    [CipUseCode]            NVARCHAR (50)  NULL,
    [CipUseDescription]     NVARCHAR (200) NULL,
    [CipVersionCode]        NVARCHAR (50)  NULL,
    [CipVersionDescription] NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimCipCodes] PRIMARY KEY CLUSTERED ([DimCipCodeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimCipCodes_CipCode]
    ON [RDS].[DimCipCodes]([CipCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40958', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimCipCodes', @level2type = N'COLUMN', @level2name = N'CipUseDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40959', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimCipCodes', @level2type = N'COLUMN', @level2name = N'CipVersionCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40951', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimCipCodes', @level2type = N'COLUMN', @level2name = N'CipCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40958', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimCipCodes', @level2type = N'COLUMN', @level2name = N'CipUseCode';


GO

