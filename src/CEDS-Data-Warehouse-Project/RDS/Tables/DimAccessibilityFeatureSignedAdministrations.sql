CREATE TABLE [RDS].[DimAccessibilityFeatureSignedAdministrations] (
    [DimAccessibilityFeatureSignedAdministrationId] INT IDENTITY(1,1) NOT NULL,
    [SignedAdministrationDeliveryMethodCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureSignedAdministrations_SignedAdministrationDeliveryMethodCode] DEFAULT ('MISSING') NOT NULL,
    [SignedAdministrationDeliveryMethodDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureSignedAdministrations_SignedAdministrationDeliveryMethodDescription] DEFAULT ('MISSING') NOT NULL,
    [SignedAdministrationTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureSignedAdministrations_SignedAdministrationTypeCode] DEFAULT ('MISSING') NOT NULL,
    [SignedAdministrationTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureSignedAdministrations_SignedAdministrationTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureSignedAdministrations] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureSignedAdministrationId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO