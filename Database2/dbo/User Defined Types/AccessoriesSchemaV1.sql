/****** Object:  UserDefinedTableType [dbo].[AccessoriesSchemaV1]    Script Date: 11/20/2019 11:25:27 AM ******/
CREATE TYPE [dbo].[AccessoriesSchemaV1] AS TABLE(
	[Id] [bigint] NOT NULL,
	[AccessoryName] [nvarchar](100) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[IsGeneric] [bit] NOT NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[CostPrice] [decimal](18, 2) NULL,
	[SellingPrice] [decimal](18, 2) NULL,
	[Description] [nvarchar](200) NULL,
	[TemplateId] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[IsEditable] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[IsNewVehicleAccessory] [bit] NULL,
	[SequenceNumber] [bigint] NOT NULL
)