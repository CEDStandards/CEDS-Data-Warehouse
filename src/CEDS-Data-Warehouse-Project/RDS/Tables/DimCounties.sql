CREATE TABLE [RDS].[DimCounties](
        [DimCountyId] [int] IDENTITY(1,1) NOT NULL,
        [CountyANSICode] [int] NOT NULL,
        [AddressCountyName] [varchar](50) NULL,
      CONSTRAINT [PK_DimCountries] PRIMARY KEY CLUSTERED ([DimCountryId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
      );

GO