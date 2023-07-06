CREATE TABLE [RDS].[DimPsCitizenshipStatuses] (
    [DimPsCitizenshipStatusId]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [UnitedStatesCitizenshipStatusCode]        NVARCHAR (50)  NULL,
    [UnitedStatesCitizenshipStatusDescription] NVARCHAR (200) NULL,
    [VisaTypeCode]                             NVARCHAR (50)  NULL,
    [VisaTypeDescription]                      NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimPsCitizenshipStatuses] PRIMARY KEY CLUSTERED ([DimPsCitizenshipStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsCitizenshipStatuses_Codes]
    ON [RDS].[DimPsCitizenshipStatuses]([UnitedStatesCitizenshipStatusCode] ASC, [VisaTypeCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=37794 ', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimPsCitizenshipStatuses', @level2type = N'COLUMN', @level2name = N'UnitedStatesCitizenshipStatusDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=37772', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimPsCitizenshipStatuses', @level2type = N'COLUMN', @level2name = N'VisaTypeDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=37794 ', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimPsCitizenshipStatuses', @level2type = N'COLUMN', @level2name = N'UnitedStatesCitizenshipStatusCode';


GO

