CREATE TABLE [RDS].[DimPsCitizenshipStatuses] (
    [DimPsCitizenshipStatusId]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [UnitedStatesCitizenshipStatusCode]        NVARCHAR (50)  CONSTRAINT [DF_DimPsCitizenshipStatuses_UnitedStatesCitizenshipStatusCode] DEFAULT ('MISSING') NOT NULL,
    [UnitedStatesCitizenshipStatusDescription] NVARCHAR (200) CONSTRAINT [DF_DimPsCitizenshipStatuses_UnitedStatesCitizenshipStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [VisaTypeCode]                             NVARCHAR (50)  CONSTRAINT [DF_DimPsCitizenshipStatuses_VisaTypeCode] DEFAULT ('MISSING') NOT NULL,
    [VisaTypeDescription]                      NVARCHAR (200) CONSTRAINT [DF_DimPsCitizenshipStatuses_VisaTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimPsCitizenshipStatuses] PRIMARY KEY CLUSTERED ([DimPsCitizenshipStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsCitizenshipStatuses_Codes]
    ON [RDS].[DimPsCitizenshipStatuses]([UnitedStatesCitizenshipStatusCode] ASC, [VisaTypeCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'UnitedStatesCitizenshipStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of whether or not the person is a US citizen.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'UnitedStatesCitizenshipStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'United States Citizenship Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'UnitedStatesCitizenshipStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000299' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'UnitedStatesCitizenshipStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21299' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'UnitedStatesCitizenshipStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'UnitedStatesCitizenshipStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of whether or not the person is a US citizen.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'UnitedStatesCitizenshipStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'United States Citizenship Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'UnitedStatesCitizenshipStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000299' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'UnitedStatesCitizenshipStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21299' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'UnitedStatesCitizenshipStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'VisaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of a non-US citizen''s Visa type.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'VisaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Visa Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'VisaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000196' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'VisaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21196' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'VisaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'VisaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of a non-US citizen''s Visa type.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'VisaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Visa Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'VisaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000196' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'VisaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21196' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'VisaTypeDescription';
GO

