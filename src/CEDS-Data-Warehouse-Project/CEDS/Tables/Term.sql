CREATE TABLE [CEDS].[Term] (
    [TermID]                  INT           IDENTITY (2000, 1) NOT NULL,
    [Name]                    VARCHAR (150) NOT NULL,
    [AltName]                 VARCHAR (150) NULL,
    [Definition]              VARCHAR (MAX) NOT NULL,
    [HasCodeSet]              BIT           CONSTRAINT [DF_Term_HasCodeSet] DEFAULT ((0)) NOT NULL,
    [GlobalID]                VARCHAR (20)  NULL,
    [Version]                 VARCHAR (20)  NULL,
    [Format]                  VARCHAR (150) NULL,
    [StatusFlag]              VARCHAR (50)  NULL,
    [ChangedInThisVersionInd] VARCHAR (20)  NULL,
    [VisibleInd]              BIT           CONSTRAINT [DF_Term_VisibleInd] DEFAULT ((1)) NULL,
    [xsdType]                 VARCHAR (50)  NULL,
    [xsdBaseType]             VARCHAR (50)  NULL,
    [RequiredInd]             BIT           CONSTRAINT [DF_Term_RequiredInd] DEFAULT ((0)) NULL,
    [minOccurs]               INT           NULL,
    [maxOccurs]               INT           NULL,
    [minLength]               INT           NULL,
    [maxLength]               INT           NULL,
    [minInclusive]            INT           NULL,
    [maxInclusive]            INT           NULL,
    [fractionDigits]          INT           NULL,
    [ParentTermID]            INT           NULL,
    [ChangeNotes]             VARCHAR (MAX) NULL,
    [UsageNotes]              VARCHAR (MAX) NULL,
    [XMLName]                 VARCHAR (100) NULL,
    [LastModifiedDate]        DATETIME      NULL,
    [xsd]                     VARCHAR (MAX) NULL,
    CONSTRAINT [PK_Term] PRIMARY KEY CLUSTERED ([TermID] ASC) WITH (FILLFACTOR = 90)
);


GO

