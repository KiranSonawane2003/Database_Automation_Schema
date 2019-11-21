/****** Object:  UserDefinedTableType [dbo].[VehicleAccessoryCodeSchemaV1]    Script Date: 11/20/2019 11:25:27 AM ******/
CREATE TYPE [dbo].[VehicleAccessoryCodeSchemaV1] AS TABLE(
	[ID] [int] NULL,
	[MMCode] [nvarchar](max) NULL,
	[OptionPrice_Code] [nvarchar](max) NULL,
	[OptionName_Code] [nvarchar](max) NULL
)