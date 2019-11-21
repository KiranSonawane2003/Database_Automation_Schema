/****** Object:  UserDefinedTableType [dbo].[AccessoriesSchema]    Script Date: 11/20/2019 11:25:27 AM ******/
CREATE TYPE [dbo].[AccessoriesSchema] AS TABLE(
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
	[SequenceNumber] [bigint] NOT NULL
)