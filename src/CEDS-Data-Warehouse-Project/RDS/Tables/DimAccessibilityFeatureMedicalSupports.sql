CREATE TABLE [RDS].[DimAccessibilityFeatureMedicalSupports] (
    [DimAccessibilityFeatureMedicalSupportId] INT IDENTITY(1,1) NOT NULL,
    [MedicalSupportTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureMedicalSupports_MedicalSupportTypeCode] DEFAULT ('MISSING') NOT NULL,
    [MedicalSupportTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureMedicalSupports_MedicalSupportTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureMedicalSupports] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureMedicalSupportId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO