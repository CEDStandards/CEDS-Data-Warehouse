CREATE PROCEDURE [Staging].[Staging-to-DimAccessibleEducationMaterialProviders]
AS 
    IF NOT EXISTS (SELECT 1 FROM RDS.DimAccessibleEducationMaterialProviders WHERE DimAccessibleEducationMaterialProviderId = -1) 
    BEGIN
        SET IDENTITY_INSERT RDS.DimAccessibleEducationMaterialProviders ON;

        INSERT INTO RDS.DimAccessibleEducationMaterialProviders (
			DimAccessibleEducationMaterialProviderId,
            AccessibleEducationMaterialProviderOrganizationIdentifierSea,
            AccessibleEducationMaterialProviderName,
            StateAbbreviationCode,
            StateAbbreviationDescription,
            StateANSICode,
            MailingAddressStreetNumberAndName,
            MailingAddressApartmentRoomOrSuiteNumber,
            MailingAddressCity,
            MailingAddressPostalCode,
            MailingAddressStateAbbreviation,
            MailingAddressCountyAnsiCodeCode,
            PhysicalAddressStreetNumberAndName,
            PhysicalAddressApartmentRoomOrSuiteNumber,
            PhysicalAddressCity,
            PhysicalAddressPostalCode,
            PhysicalAddressStateAbbreviation,
            PhysicalAddressCountyAnsiCodeCode,
            TelephoneNumber,
            WebSiteAddress,
            OutOfStateIndicator,
            RecordStartDateTime,
            RecordEndDateTime
        )
        VALUES (
			-1,
            'MISSING',
            'MISSING',
            'NA',
            'MISSING',
            'NA',
            'MISSING',
            'MISSING',
            'MISSING',
            'MISSING',
            'NA',
            'NA',
            'MISSING',
            'MISSING',
            'MISSING',
            'MISSING',
            'NA',
            'NA',
            'MISSING',
            'MISSING',
            0,
            '1/1/1900',
            NULL
        )

        SET IDENTITY_INSERT RDS.DimAccessibleEducationMaterialProviders OFF;
    END


    INSERT INTO RDS.DimAccessibleEducationMaterialProviders (
        AccessibleEducationMaterialProviderOrganizationIdentifierSea,
        AccessibleEducationMaterialProviderName,
        StateAbbreviationCode,
        StateAbbreviationDescription,
        StateANSICode,
        MailingAddressStreetNumberAndName,
        MailingAddressApartmentRoomOrSuiteNumber,
        MailingAddressCity,
        MailingAddressPostalCode,
        MailingAddressStateAbbreviation,
        MailingAddressCountyAnsiCodeCode,
        PhysicalAddressStreetNumberAndName,
        PhysicalAddressApartmentRoomOrSuiteNumber,
        PhysicalAddressCity,
        PhysicalAddressPostalCode,
        PhysicalAddressStateAbbreviation,
        PhysicalAddressCountyAnsiCodeCode,
        TelephoneNumber,
        WebSiteAddress,
        OutOfStateIndicator,
        RecordStartDateTime,
        RecordEndDateTime
    )
    SELECT
        saemp.AccessibleEducationMaterialProviderOrganizationIdentifierSea,
        saemp.AccessibleEducationMaterialProviderName,
        saemp.StateAbbreviationCode,
        saemp.StateAbbreviationDescription,
        saemp.StateANSICode,
        saemp.MailingAddressStreetNumberAndName,
        saemp.MailingAddressApartmentRoomOrSuiteNumber,
        saemp.MailingAddressCity,
        saemp.MailingAddressPostalCode,
        saemp.MailingAddressStateAbbreviation,
        saemp.MailingAddressCountyAnsiCodeCode,
        saemp.PhysicalAddressStreetNumberAndName,
        saemp.PhysicalAddressApartmentRoomOrSuiteNumber,
        saemp.PhysicalAddressCity,
        saemp.PhysicalAddressPostalCode,
        saemp.PhysicalAddressStateAbbreviation,
        saemp.PhysicalAddressCountyAnsiCodeCode,
        saemp.TelephoneNumber,
        saemp.WebSiteAddress,
        saemp.OutOfStateIndicator,
        saemp.RecordStartDateTime,
        saemp.RecordEndDateTime
    FROM Staging.AccessibleEducationMaterialProvider saemp
    LEFT JOIN RDS.DimAccessibleEducationMaterialProviders rdaemp
        ON saemp.AccessibleEducationMaterialProviderOrganizationIdentifierSea = rdaemp.AccessibleEducationMaterialProviderOrganizationIdentifierSea
        AND saemp.RecordStartDateTime = rdaemp.RecordStartDateTime
    WHERE rdaemp.DimAccessibleEducationMaterialProviderId IS NULL;
