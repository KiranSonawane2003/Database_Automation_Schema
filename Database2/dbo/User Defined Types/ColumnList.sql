/****** Object:  UserDefinedTableType [dbo].[ColumnList]    Script Date: 11/20/2019 11:25:27 AM ******/
CREATE TYPE [dbo].[ColumnList] AS TABLE(
	[ParentTable] [nvarchar](200) NULL,
	[FieldList] [nvarchar](max) NULL
)