CREATE TABLE [RDS].[DimCountries](
        [DimCountryId] [int] IDENTITY(1,1) NOT NULL,
        [CountryCode] [char](2) NULL,
        [CountryCodeDescription] [varchar](100) NULL,
  CONSTRAINT [PK_DimCountries] PRIMARY KEY CLUSTERED ([DimCountryId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);
GO
   
