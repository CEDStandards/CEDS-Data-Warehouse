CREATE TABLE [CEDS].[Term](
	[TermID] [int] IDENTITY(2000,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[AltName] [varchar](150) NULL,
	[Definition] [varchar](max) NOT NULL,
	[HasCodeSet] [bit] NOT NULL,
	[GlobalID] [varchar](20) NULL,
	[Version] [varchar](20) NULL,
	[Format] [varchar](150) NULL,
	[StatusFlag] [varchar](50) NULL,
	[ChangedInThisVersionInd] [varchar](20) NULL,
	[VisibleInd] [bit] NULL,
	[xsdType] [varchar](50) NULL,
	[xsdBaseType] [varchar](50) NULL,
	[RequiredInd] [bit] NULL,
	[minOccurs] [int] NULL,
	[maxOccurs] [int] NULL,
	[minLength] [int] NULL,
	[maxLength] [int] NULL,
	[minInclusive] [int] NULL,
	[maxInclusive] [int] NULL,
	[fractionDigits] [int] NULL,
	[ParentTermID] [int] NULL,
	[ChangeNotes] [varchar](max) NULL,
	[UsageNotes] [varchar](max) NULL,
	[XMLName] [varchar](100) NULL,
	[LastModifiedDate] [datetime] NULL,
	[xsd] [varchar](max) NULL,
 CONSTRAINT [PK_Term] PRIMARY KEY CLUSTERED 
(
	[TermID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [CEDS].[Term] ADD  CONSTRAINT [DF_Term_HasCodeSet]  DEFAULT ((0)) FOR [HasCodeSet]
GO

ALTER TABLE [CEDS].[Term] ADD  CONSTRAINT [DF_Term_VisibleInd]  DEFAULT ((1)) FOR [VisibleInd]
GO

ALTER TABLE [CEDS].[Term] ADD  CONSTRAINT [DF_Term_RequiredInd]  DEFAULT ((0)) FOR [RequiredInd]
GO


