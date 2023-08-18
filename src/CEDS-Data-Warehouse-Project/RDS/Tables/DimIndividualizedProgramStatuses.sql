CREATE TABLE [RDS].[DimIndividualizedProgramStatuses] (
    [DimIndividualizedProgramStatusId]        INT            IDENTITY (1, 1) NOT NULL,
    [IndividualizedProgramTypeCode]           NVARCHAR (100) NOT NULL,
    [IndividualizedProgramTypeDescription]    NVARCHAR (300) NOT NULL,
    [StudentSupportServiceTypeCode]           NVARCHAR (100) NOT NULL,
    [StudentSupportServiceTypeDescription]    NVARCHAR (300) NOT NULL,
    [ConsentToEvaluationIndicatorCode]        NVARCHAR (100) NOT NULL,
    [ConsentToEvaluationIndicatorDescription] NVARCHAR (300) NOT NULL,
    CONSTRAINT [PK_DimIndividualizedProgramStatusId] PRIMARY KEY CLUSTERED ([DimIndividualizedProgramStatusId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'ConsentToEvaluationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indication parent agreed to evaluate student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'ConsentToEvaluationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Consent to Evaluation Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'ConsentToEvaluationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001726' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'ConsentToEvaluationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22707' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'ConsentToEvaluationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'ConsentToEvaluationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indication parent agreed to evaluate student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'ConsentToEvaluationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Consent to Evaluation Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'ConsentToEvaluationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001726' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'ConsentToEvaluationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22707' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'ConsentToEvaluationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'IndividualizedProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A designation of the type of program developed for a student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'IndividualizedProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Individualized Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'IndividualizedProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000320' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'IndividualizedProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21320' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'IndividualizedProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'IndividualizedProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A designation of the type of program developed for a student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'IndividualizedProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Individualized Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'IndividualizedProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000320' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'IndividualizedProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21320' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'IndividualizedProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Type of related or ancillary services offered or provided to a person or a group of persons within the formal educational system or by an outside agency which provides non-instructional services to support the general welfare of students. This includes physical and emotional health, the ability to select an appropriate course of study, admission to appropriate educational programs, and the ability to adjust to and remain in school through the completion of programs. In serving a student with an identified disability, related services include developmental, corrective, or supportive services required to ensure that the person benefits from special education.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Support Service Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000273' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21273' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Type of related or ancillary services offered or provided to a person or a group of persons within the formal educational system or by an outside agency which provides non-instructional services to support the general welfare of students. This includes physical and emotional health, the ability to select an appropriate course of study, admission to appropriate educational programs, and the ability to adjust to and remain in school through the completion of programs. In serving a student with an identified disability, related services include developmental, corrective, or supportive services required to ensure that the person benefits from special education.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Support Service Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000273' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21273' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIndividualizedProgramStatuses', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeDescription';
GO