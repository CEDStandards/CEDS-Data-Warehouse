CREATE TABLE [RDS].[DimGiftedAndTalentedStatuses] (
    [DimGiftedAndTalentedStatusId]                      INT IDENTITY (1, 1) NOT NULL,
        [GiftedAndTalentedIndicatorCode]                    NVARCHAR (50)   CONSTRAINT [DF_DimGiftedAndTalentedStatuses_GiftedAndTalentedIndicatorCode] DEFAULT ('MISSING')NOT NULL,
        [GiftedAndTalentedIndicatorDescription]             NVARCHAR (200)  CONSTRAINT [DF_DimGiftedAndTalentedStatuses_GiftedAndTalentedIndicatorDescription] DEFAULT ('MISSING')NOT NULL,
        [ProgramGiftedEligibilityCriteriaCode]              NVARCHAR (50)   CONSTRAINT [DF_DimGiftedAndTalentedStatuses_ProgramGiftedEligibilityCriteriaCode] DEFAULT ('MISSING')NOT NULL,
        [ProgramGiftedEligibilityCriteriaDescription]       NVARCHAR (200)  CONSTRAINT [DF_DimGiftedAndTalentedStatuses_ProgramGiftedEligibilityCriteriaDescription] DEFAULT ('MISSING')NOT NULL
    );

GO
CREATE NONCLUSTERED INDEX IX_DimGiftedAndTalentedStatuses_GiftedAndTalentedIndicatorCode ON RDS.DimGiftedAndTalentedStatuses (GiftedAndTalentedIndicatorCode);
GO
CREATE NONCLUSTERED INDEX IX_DimGiftedAndTalentedStatuses_ProgramGiftedEligibilityCriteriaCode ON RDS.DimGiftedAndTalentedStatuses (ProgramGiftedEligibilityCriteriaCode);
GO
CREATE NONCLUSTERED INDEX IX_DimGiftedAndTalentedStatuses_Codes ON RDS.DimGiftedAndTalentedStatuses (GiftedAndTalentedIndicatorCode, ProgramGiftedEligibilityCriteriaCode);

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'GiftedAndTalentedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student is participating in and served by a Gifted/Talented program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'GiftedAndTalentedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Gifted and Talented Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'GiftedAndTalentedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000122' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'GiftedAndTalentedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000122' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'GiftedAndTalentedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'GiftedAndTalentedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student is participating in and served by a Gifted/Talented program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'GiftedAndTalentedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Gifted and Talented Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'GiftedAndTalentedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000122' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'GiftedAndTalentedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000122' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'GiftedAndTalentedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'ProgramGiftedEligibilityCriteriaCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'State/local code used to determine a student''s eligibility for Gifted/Talented program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'ProgramGiftedEligibilityCriteriaCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Program Gifted Eligibility Criteria' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'ProgramGiftedEligibilityCriteriaCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001244' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'ProgramGiftedEligibilityCriteriaCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001244' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'ProgramGiftedEligibilityCriteriaCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'ProgramGiftedEligibilityCriteriaDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'State/local code used to determine a student''s eligibility for Gifted/Talented program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'ProgramGiftedEligibilityCriteriaDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Program Gifted Eligibility Criteria' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'ProgramGiftedEligibilityCriteriaDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001244' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'ProgramGiftedEligibilityCriteriaDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001244' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimGiftedAndTalentedStatuses', @level2type=N'COLUMN',@level2name=N'ProgramGiftedEligibilityCriteriaDescription';
GO
