CREATE VIEW [rds].[vwCEDS_DataWarehouse_Extended_Properties] 
AS

	--get the extended properties for the columns in the tables
	SELECT 
		c.TABLE_NAME							[TableName]
		, c.COLUMN_NAME							[ColumnName]
		, c.data_type							[DataType]
		, c.character_maximum_length			[MaxLength]
		, c.ORDINAL_POSITION					[ColumnPostion]
		, CAST(gi.value as varchar(max))		[GlobalId]
		, CAST(el.value as varchar(max))		[ElementTechnicalName]
		, CAST(de.value as varchar(max))		[Description]
		, CAST(ur.value as varchar(max))		[Url]
	FROM		INFORMATION_SCHEMA.COLUMNS	c 
	INNER JOIN	INFORMATION_SCHEMA.TABLES	t ON t.TABLE_NAME = c.TABLE_NAME 
	OUTER APPLY fn_listextendedproperty ('CEDS_Def_Desc', 'schema', 'rds', N'table', c.TABLE_NAME, N'column', c.COLUMN_NAME) de
	OUTER APPLY fn_listextendedproperty ('CEDS_ElementTechnicalName', 'schema', 'rds', N'table', c.TABLE_NAME, N'column', c.COLUMN_NAME) el
	OUTER APPLY fn_listextendedproperty ('CEDS_URL', 'schema', 'rds', N'table', c.TABLE_NAME, N'column', c.COLUMN_NAME) ur
	OUTER APPLY fn_listextendedproperty ('CEDS_GlobalId', 'schema', 'rds', N'table', c.TABLE_NAME, N'column', c.COLUMN_NAME) gi
	WHERE t.table_type = 'BASE TABLE'
		AND (de.value IS NOT NULL OR gi.value IS NOT NULL)

	UNION

	--get the extended properties for the tables
	SELECT 
		  t.TABLE_NAME							[TableName]
		, NULL									[ColumnName]
		, NULL									[DataType]
		, NULL									[MaxLength]
		, NULL									[ColumnPostion]
		, CAST(gi.value as varchar(max))		[GlobalId]
		, CAST(el.value as varchar(max))		[ElementTechnicalName]
		, CAST(de.value as varchar(max))		[Description]
		, CAST(ur.value as varchar(max))		[Url]
	FROM		INFORMATION_SCHEMA.TABLES	t 
	OUTER APPLY fn_listextendedproperty ('CEDS_Def_Desc', 'schema', 'rds', N'table', t.TABLE_NAME, NULL, DEFAULT) de
	OUTER APPLY fn_listextendedproperty ('CEDS_ElementTechnicalName', 'schema', 'rds', N'table', t.TABLE_NAME, NULL, DEFAULT) el
	OUTER APPLY fn_listextendedproperty ('CEDS_URL', 'schema', 'rds', N'table', t.TABLE_NAME, NULL, DEFAULT) ur
	OUTER APPLY fn_listextendedproperty ('CEDS_GlobalId', 'schema', 'rds', N'table', t.TABLE_NAME, NULL, DEFAULT) gi
	WHERE t.table_type = 'BASE TABLE'
		AND (de.value IS NOT NULL OR gi.value IS NOT NULL)

GO

