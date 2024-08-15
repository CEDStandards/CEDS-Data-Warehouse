
CREATE TABLE [RDS].[DimNaicsCodes] (
    [DimNaicsCodeId]                    INT             IDENTITY (1, 1) NOT NULL,
    [NaicsSectorCode]                  NVARCHAR(50)     NOT NULL,
    [NaicsSectorDescription]           NVARCHAR(200)   NOT NULL,
    [NaicsSubsectorCode]               NVARCHAR(50)     NOT NULL,
    [NaicsSubsectorDescription]        NVARCHAR(200)   NOT NULL,
    [NaicsIndustryGroupCode]           NVARCHAR(50)     NOT NULL,
    [NaicsIndustryGroupDescription]    NVARCHAR(200)   NOT NULL,
    [NaicsIndustryCode]                NVARCHAR(50)     NOT NULL,
    [NaicsIndustryDescription]         NVARCHAR(200)   NOT NULL,
    [NaicsNationalIndustryCode]        NVARCHAR(50)     NOT NULL,
    [NaicsNationalIndustryDescription] NVARCHAR(200)   NOT NULL,
    [NaicsVersion]                     NVARCHAR(10)    NOT NULL,

    CONSTRAINT [PK_DimNaicsCodes] PRIMARY KEY CLUSTERED ([DimNaicsCodeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimNaicsCodes_Codes]
    ON [RDS].[DimNaicsCodes]([NaicsNationalIndustryCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO



