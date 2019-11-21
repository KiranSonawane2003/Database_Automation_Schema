/****** Object:  UserDefinedTableType [dbo].[NewVehicleAccessoriesSchema]    Script Date: 11/20/2019 11:25:27 AM ******/
CREATE TYPE [dbo].[NewVehicleAccessoriesSchema] AS TABLE(
	[Id] [bigint] NOT NULL,
	[MMCode] [nvarchar](max) NOT NULL,
	[AccessoryCode] [nvarchar](max) NOT NULL,
	[AccessoryName] [nvarchar](max) NOT NULL,
	[SellingPrice] [decimal](18, 2) NULL,
	[IsEditable] [bit] NULL,
	[IsGeneric] [bit] NOT NULL,
	[IsNewVehicleAccessory] [bit] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[SequenceNumber] [bigint] NOT NULL
)