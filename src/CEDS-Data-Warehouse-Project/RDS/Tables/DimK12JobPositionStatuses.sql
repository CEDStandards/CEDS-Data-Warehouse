CREATE TABLE [RDS].[DimK12JobPositionStatuses] (
    [DimK12JobPositionStatusId] INT IDENTITY (1, 1) NOT NULL,
    [JobPositionStatusCode] NVARCHAR(50) NULL,
    [JobPositionStatusDescription] NVARCHAR(200) NULL,
    [JobPositionCancellationReasonCode] NVARCHAR(50) NULL,
    [JobPositionCancellationReasonDescription] NVARCHAR(200) NULL,
    
    CONSTRAINT [PK_DimK12JobPositionStatuses] PRIMARY KEY CLUSTERED ([DimK12JobPositionStatusId] ASC)
);

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositionStatuses', @level2type=N'COLUMN',@level2name=N'JobPositionStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A code indicating the employment status for the position.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositionStatuses', @level2type=N'COLUMN',@level2name=N'JobPositionStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Job Position Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositionStatuses', @level2type=N'COLUMN',@level2name=N'JobPositionStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002078' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositionStatuses', @level2type=N'COLUMN',@level2name=N'JobPositionStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21668' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositionStatuses', @level2type=N'COLUMN',@level2name=N'JobPositionStatusCode';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositionStatuses', @level2type=N'COLUMN',@level2name=N'JobPositionCancellationReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason the job position was eliminated or discontinued.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositionStatuses', @level2type=N'COLUMN',@level2name=N'JobPositionCancellationReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Job Position Cancellation Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositionStatuses', @level2type=N'COLUMN',@level2name=N'JobPositionCancellationReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002080' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositionStatuses', @level2type=N'COLUMN',@level2name=N'JobPositionCancellationReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21670' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositionStatuses', @level2type=N'COLUMN',@level2name=N'JobPositionCancellationReasonCode';
GO