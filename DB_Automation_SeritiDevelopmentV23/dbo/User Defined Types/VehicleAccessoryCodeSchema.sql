/****** Object:  UserDefinedTableType [dbo].[VehicleAccessoryCodeSchema]    Script Date: 11/20/2019 11:25:27 AM ******/
CREATE TYPE [dbo].[VehicleAccessoryCodeSchema] AS TABLE(
	[ID] [int] NULL,
	[MMCode] [nvarchar](max) NULL,
	[OptionName_Code] [nvarchar](max) NULL
)