CREATE TABLE [RDS].[DimHomelessnessStatuses] (
    [DimHomelessnessStatusId]                      INT            IDENTITY (1, 1) NOT NULL,
    [HomelessnessStatusCode]                       NVARCHAR (100) NOT NULL,
    [HomelessnessStatusDescription]                NVARCHAR (300) NOT NULL,
    [HomelessnessStatusEdFactsCode]                NVARCHAR (50)  NULL,
    [HomelessPrimaryNighttimeResidenceCode]        NVARCHAR (100) NOT NULL,
    [HomelessPrimaryNighttimeResidenceDescription] NVARCHAR (300) NOT NULL,
    [HomelessPrimaryNighttimeResidenceEdfactsCode] NVARCHAR (50)  NOT NULL,
    [HomelessServicedIndicatorCode]                NVARCHAR (100) NOT NULL,
    [HomelessServicedIndicatorDescription]         NVARCHAR (300) NOT NULL,
    [HomelessUnaccompaniedYouthStatusCode]         NVARCHAR (100) NOT NULL,
    [HomelessUnaccompaniedYouthStatusDescription]  NVARCHAR (300) NOT NULL,
    [HomelessUnaccompaniedYouthStatusEdfactsCode]  NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_DimHomelessnessStatusId] PRIMARY KEY CLUSTERED ([DimHomelessnessStatusId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessnessStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Children and youth who lack a fixed, regular, and adequate nighttime residence. Homeless children and youth include: 1) children and youth who are sharing the housing of other persons due to loss of housing, economic hardship, or a similar reason; are living in motels, hotels, trailer parks, or camping grounds due to the lack of alternative adequate accommodations; are living in emergency or transitional shelters; are abandoned in hospitals; or are awaiting foster care placement; 2) children and youth who have a primary nighttime residence that is a public or private place not designed for or originally used as a regular sleeping accommodation for human beings; or 3) children and youths who are living in cars, parks, public spaces, abandoned buildings, substandard housing, bus or train stations, or similar settings. 4) migratory children who qualify as homeless because the children are living in circumstances described in the above. (See Section 103 of the McKinney Act for a more detailed description of this data element).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessnessStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homelessness Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessnessStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000149' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessnessStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21149' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessnessStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessnessStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Children and youth who lack a fixed, regular, and adequate nighttime residence. Homeless children and youth include: 1) children and youth who are sharing the housing of other persons due to loss of housing, economic hardship, or a similar reason; are living in motels, hotels, trailer parks, or camping grounds due to the lack of alternative adequate accommodations; are living in emergency or transitional shelters; are abandoned in hospitals; or are awaiting foster care placement; 2) children and youth who have a primary nighttime residence that is a public or private place not designed for or originally used as a regular sleeping accommodation for human beings; or 3) children and youths who are living in cars, parks, public spaces, abandoned buildings, substandard housing, bus or train stations, or similar settings. 4) migratory children who qualify as homeless because the children are living in circumstances described in the above. (See Section 103 of the McKinney Act for a more detailed description of this data element).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessnessStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homelessness Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessnessStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000149' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessnessStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21149' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessnessStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessnessStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Children and youth who lack a fixed, regular, and adequate nighttime residence. Homeless children and youth include: 1) children and youth who are sharing the housing of other persons due to loss of housing, economic hardship, or a similar reason; are living in motels, hotels, trailer parks, or camping grounds due to the lack of alternative adequate accommodations; are living in emergency or transitional shelters; are abandoned in hospitals; or are awaiting foster care placement; 2) children and youth who have a primary nighttime residence that is a public or private place not designed for or originally used as a regular sleeping accommodation for human beings; or 3) children and youths who are living in cars, parks, public spaces, abandoned buildings, substandard housing, bus or train stations, or similar settings. 4) migratory children who qualify as homeless because the children are living in circumstances described in the above. (See Section 103 of the McKinney Act for a more detailed description of this data element).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessnessStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homelessness Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessnessStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000149' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessnessStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21149' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessnessStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidenceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary nighttime residence of the person at the time the person was identified as homeless.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidenceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Primary Nighttime Residence' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidenceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidenceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidenceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidenceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary nighttime residence of the person at the time the person was identified as homeless.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidenceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Primary Nighttime Residence' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidenceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidenceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidenceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidenceEdfactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary nighttime residence of the person at the time the person was identified as homeless.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidenceEdfactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Primary Nighttime Residence' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidenceEdfactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidenceEdfactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidenceEdfactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessServicedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether homeless children and youth were served by a McKinney-Vento program  in the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessServicedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Serviced Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessServicedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000147' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessServicedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21147' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessServicedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessServicedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether homeless children and youth were served by a McKinney-Vento program  in the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessServicedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Serviced Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessServicedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000147' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessServicedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21147' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessServicedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouthStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that homeless youths were unaccompanied by parents or legal guardians.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouthStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Unaccompanied Youth Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouthStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouthStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouthStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouthStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that homeless youths were unaccompanied by parents or legal guardians.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouthStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Unaccompanied Youth Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouthStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouthStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouthStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouthStatusEdfactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that homeless youths were unaccompanied by parents or legal guardians.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouthStatusEdfactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Unaccompanied Youth Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouthStatusEdfactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouthStatusEdfactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimHomelessnessStatuses', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouthStatusEdfactsCode';
GO