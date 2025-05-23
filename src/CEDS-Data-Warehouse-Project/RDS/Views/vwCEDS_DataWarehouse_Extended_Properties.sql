CREATE VIEW [rds].[vwCEDS_DataWarehouse_Extended_Properties] 
AS

	--get the extended properties for the columns in the tables
	-- Column-level extended properties for RDS schema only
SELECT 
	t.name								AS [TableName],
	c.name								AS [ColumnName],
	ty.name								AS [DataType],
	c.max_length						AS [MaxLength],
	c.column_id							AS [ColumnPosition],
	CAST(gi.value as varchar(max))		AS [GlobalId],
	CAST(el.value as varchar(max))		AS [ElementTechnicalName],
	CAST(de.value as varchar(max))		AS [Description],
	CAST(ur.value as varchar(max))		AS [Url]
FROM sys.columns c
JOIN sys.tables t ON c.object_id = t.object_id
JOIN sys.schemas s ON t.schema_id = s.schema_id
LEFT JOIN sys.types ty ON c.user_type_id = ty.user_type_id
OUTER APPLY fn_listextendedproperty ('CEDS_Def_Desc', 'schema', s.name, 'table', t.name, 'column', c.name) de
OUTER APPLY fn_listextendedproperty ('CEDS_ElementTechnicalName', 'schema', s.name, 'table', t.name, 'column', c.name) el
OUTER APPLY fn_listextendedproperty ('CEDS_URL', 'schema', s.name, 'table', t.name, 'column', c.name) ur
OUTER APPLY fn_listextendedproperty ('CEDS_GlobalId', 'schema', s.name, 'table', t.name, 'column', c.name) gi
WHERE s.name = 'rds'
	AND t.type = 'U'
	AND (de.value IS NOT NULL OR gi.value IS NOT NULL)

UNION

-- Table-level extended properties for RDS schema only
SELECT 
	t.name								AS [TableName],
	NULL								AS [ColumnName],
	NULL								AS [DataType],
	NULL								AS [MaxLength],
	NULL								AS [ColumnPosition],
	CAST(gi.value as varchar(max))		AS [GlobalId],
	CAST(el.value as varchar(max))		AS [ElementTechnicalName],
	CAST(de.value as varchar(max))		AS [Description],
	CAST(ur.value as varchar(max))		AS [Url]
FROM sys.tables t
JOIN sys.schemas s ON t.schema_id = s.schema_id
OUTER APPLY fn_listextendedproperty ('CEDS_Def_Desc', 'schema', s.name, 'table', t.name, NULL, DEFAULT) de
OUTER APPLY fn_listextendedproperty ('CEDS_ElementTechnicalName', 'schema', s.name, 'table', t.name, NULL, DEFAULT) el
OUTER APPLY fn_listextendedproperty ('CEDS_URL', 'schema', s.name, 'table', t.name, NULL, DEFAULT) ur
OUTER APPLY fn_listextendedproperty ('CEDS_GlobalId', 'schema', s.name, 'table', t.name, NULL, DEFAULT) gi
WHERE s.name = 'rds'
	AND t.type = 'U'
	AND (de.value IS NOT NULL OR gi.value IS NOT NULL)


GO

