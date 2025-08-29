CREATE TABLE [RDS].[DimK12DropoutStatuses] (
    [DimK12DropoutStatusId]                 INT            IDENTITY (1, 1) NOT NULL,
    [StudentDropoutStatusCode]                NVARCHAR (100) CONSTRAINT [DF_DimK12DropoutStatuses_StudentDropoutStatusCode] DEFAULT ('MISSING') NOT NULL,
    [StudentDropoutStatusDescription]         NVARCHAR (300) CONSTRAINT [DF_DimK12DropoutStatuses_StudentDropoutStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [DropoutReasonTypeCode]        NVARCHAR (100) CONSTRAINT [DF_DimK12DropoutStatuses_DropoutReasonTypeCode] DEFAULT ('MISSING') NOT NULL,
    [DropoutReasonTypeDescription] NVARCHAR (300) CONSTRAINT [DF_DimK12DropoutStatuses_DropoutReasonTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimK12DropoutStatuses] PRIMARY KEY CLUSTERED ([DimK12DropoutStatusId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'StudentDropoutStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the status of this student as dropout.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'StudentDropoutStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Dropout Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'StudentDropoutStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002068' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'StudentDropoutStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002068' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'StudentDropoutStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'StudentDropoutStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the status of this student as dropout.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'StudentDropoutStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Dropout Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'StudentDropoutStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002068' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'StudentDropoutStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002068' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'StudentDropoutStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'DropoutReasonTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason or reasons the student dropped out of school.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'DropoutReasonTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Dropout Reason Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'DropoutReasonTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002113' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'DropoutReasonTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002113' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'DropoutReasonTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'DropoutReasonTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason or reasons the student dropped out of school.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'DropoutReasonTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Dropout Reason Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'DropoutReasonTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002113' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'DropoutReasonTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002113' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12DropoutStatuses', @level2type=N'COLUMN',@level2name=N'DropoutReasonTypeDescription';
GO



