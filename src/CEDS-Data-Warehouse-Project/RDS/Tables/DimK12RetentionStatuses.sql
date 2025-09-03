CREATE TABLE [RDS].[DimK12RetentionStatuses] (
    [DimK12RetentionStatusId]                 INT            IDENTITY (1, 1) NOT NULL,
    [RetentionExemptionReasonCode]                NVARCHAR (100) CONSTRAINT [DF_DimK12RetentionStatuses_RetentionExemptionReasonCode] DEFAULT ('MISSING') NOT NULL,
    [RetentionExemptionReasonDescription]         NVARCHAR (300) CONSTRAINT [DF_DimK12RetentionStatuses_RetentionExemptionReasonDescription] DEFAULT ('MISSING') NOT NULL,
    [EndOfTermStatusCode]        NVARCHAR (100) CONSTRAINT [DF_DimK12RetentionStatuses_EndOfTermStatusCode] DEFAULT ('MISSING') NOT NULL,
    [EndOfTermStatusDescription] NVARCHAR (300) CONSTRAINT [DF_DimK12RetentionStatuses_EndOfTermStatusDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimK12RetentionStatuses] PRIMARY KEY CLUSTERED ([DimK12RetentionStatusId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'EndOfTermStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The nature of the student''s progress at the end of a given school term.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'EndOfTermStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'End of Term Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'EndOfTermStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000093' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'EndOfTermStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000093' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'EndOfTermStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'EndOfTermStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The nature of the student''s progress at the end of a given school term.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'EndOfTermStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'End of Term Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'EndOfTermStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000093' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'EndOfTermStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000093' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'EndOfTermStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'RetentionExemptionReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason why a student was exempted from retention in a grade level.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'RetentionExemptionReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Retention Exemption Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'RetentionExemptionReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'TBD' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'RetentionExemptionReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/TBD' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'RetentionExemptionReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'RetentionExemptionReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason why a student was exempted from retention in a grade level.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'RetentionExemptionReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Retention Exemption Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'RetentionExemptionReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'TBD' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'RetentionExemptionReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/TBD' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12RetentionStatuses', @level2type=N'COLUMN',@level2name=N'RetentionExemptionReasonDescription';
GO


