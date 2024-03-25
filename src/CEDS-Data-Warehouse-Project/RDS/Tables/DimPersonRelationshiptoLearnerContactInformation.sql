CREATE TABLE [RDS].[DimPersonRelationshipToLearnerContactInformation] (
    [DimPersonRelationshipToLearnerContactInformationId]  INT IDENTITY (1, 1) NOT NULL,
    [PersonRelationshipToLearnerContactPriorityNumber]          INT  NULL,
    [PersonRelationshipToLearnerContactRestrictionsDescription]   NVARCHAR (2000) NULL,
    [RecordStartDateTime]  DATETIME  NULL,
    [RecordEndDateTime]    DATETIME  NULL,
    CONSTRAINT [PK_DimPersonRelationshipToLearnerContactInformation] PRIMARY KEY CLUSTERED ([DimPersonRelationshipToLearnerContactInformationId] ASC)
);


GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipToLearnerContactPriorityNumber', @level2type=N'COLUMN',@level2name=N'DimPersonRelationshipToLearnerContactInformation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The numeric order in the preferred sequence and priority for contacting a person related to the learner.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipToLearnerContactPriorityNumber', @level2type=N'COLUMN',@level2name=N'DimPersonRelationshipToLearnerContactInformation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Person Relationship to Learner Contact Priority Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipToLearnerContactPriorityNumber', @level2type=N'COLUMN',@level2name=N'DimPersonRelationshipToLearnerContactInformation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001426' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipToLearnerContactPriorityNumber', @level2type=N'COLUMN',@level2name=N'DimPersonRelationshipToLearnerContactInformation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001423' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipToLearnerContactPriorityNumber', @level2type=N'COLUMN',@level2name=N'DimPersonRelationshipToLearnerContactInformation';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipToLearnerContactRestrictionsDescription', @level2type=N'COLUMN',@level2name=N'DimPersonRelationshipToLearnerContactInformation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Restrictions for student and/or teacher contact with the individual (e.g., the student may not be picked up by the individual)' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipToLearnerContactRestrictionsDescription', @level2type=N'COLUMN',@level2name=N'DimPersonRelationshipToLearnerContactInformation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Person Relationship to Learner Contact Restrictions Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipToLearnerContactRestrictionsDescription', @level2type=N'COLUMN',@level2name=N'DimPersonRelationshipToLearnerContactInformation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001424' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipToLearnerContactRestrictionsDescription', @level2type=N'COLUMN',@level2name=N'DimPersonRelationshipToLearnerContactInformation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001424' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'PersonRelationshipToLearnerContactRestrictionsDescription', @level2type=N'COLUMN',@level2name=N'DimPersonRelationshipToLearnerContactInformation';
GO