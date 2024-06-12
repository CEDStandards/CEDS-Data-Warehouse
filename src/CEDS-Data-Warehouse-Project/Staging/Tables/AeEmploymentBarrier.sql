CREATE TABLE [Staging].[AeEmploymentBarrier] (
    [Id]                          INT            IDENTITY (1, 1) NOT NULL,
    [StudentIdentifierState]      VARCHAR (100)  NULL,
    [AdultEducationServiceProviderIdentifierSea]      VARCHAR (100)  NULL,
    [WIOABarriersToEmployment]                    VARCHAR (100)  NULL,
    [ProgramYear]                 SMALLINT       NULL,
    [RecordStartDateTime]         DATETIME       NULL,
    [RecordEndDateTime]           DATETIME       NULL,
    [DataCollectionName]          NVARCHAR (100) NULL,
    [RunDateTime]                 DATETIME       NULL,
    CONSTRAINT [PK_AeEmploymentBarrier] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_AeEmploymentBarrier_WIOABarriersToEmployment]
    ON [Staging].[AeEmploymentBarrier]([WIOABarriersToEmployment] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO


CREATE NONCLUSTERED INDEX [IX_AeEmploymentBarrier_RecordStartDateTime]
    ON [Staging].[AeEmploymentBarrier]([RecordStartDateTime] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_AeEmploymentBarrier_AdultEducationServiceProviderIdentifierSea]
    ON [Staging].[AeEmploymentBarrier]([AdultEducationServiceProviderIdentifierSea] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_AeEmploymentBarrier_DataCollectionName]
    ON [Staging].[AeEmploymentBarrier]([DataCollectionName] ASC)
    INCLUDE([AdultEducationServiceProviderIdentifierSea], [WIOABarriersToEmployment], [RecordEndDateTime], [RecordStartDateTime], [ProgramYear], [StudentIdentifierState]);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'WIOABarrierstoEmployment';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A self-identified barrier as defined by the Workforce Innovation and Opportunity Act (WIOA) that is presumed to affect placement of a participant in unsubsidized employment.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'WIOABarrierstoEmployment';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'WIOA Barriers to Employment' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'WIOABarrierstoEmployment';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001940' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'WIOABarrierstoEmployment';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001940' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'WIOABarrierstoEmployment';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001918' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001917' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a student by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001071' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001071' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEmploymentBarrier', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO