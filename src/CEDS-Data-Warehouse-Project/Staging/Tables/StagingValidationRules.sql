CREATE TABLE [Staging].[StagingValidationRules](
	[StagingValidationRuleId] [int] IDENTITY(1,1) NOT NULL,
	[StagingTableId] [int] NOT NULL,
	[StagingColumnId] [int] NOT NULL,
	[RuleDscr] [varchar](max) NOT NULL,
	[Condition] [varchar](max) NOT NULL,
	[ValidationMessage] [varchar](2000) NULL,
	[Severity] [varchar](50) NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreateDateTime]  AS (getdate()),
 CONSTRAINT [PK_StagingValidationConfig] PRIMARY KEY CLUSTERED 
(
	[StagingValidationRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

