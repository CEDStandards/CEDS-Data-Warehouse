CREATE VIEW [RDS].[vwDimOnetSocOccupationTypes]
AS
  SELECT
    [DimOnetSocOccupationTypeId],
    [OnetSocOccupationTypeCode],
    sssrd.InputCode AS OnetSocOccupationTypeMap
  FROM [RDS].[DimOnetSocOccupationTypes] dot
  CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
  LEFT JOIN [Staging].[SourceSystemReferenceData] sssrd
    ON dot.[OnetSocOccupationTypeCode] = sssrd.[OutputCode]
    AND sssrd.[TableName] = 'RefOnetSocOccupationType'
