/****** Object:  UserDefinedTableType [dbo].[VehicleSchemaV1]    Script Date: 11/20/2019 11:25:27 AM ******/
CREATE TYPE [dbo].[VehicleSchemaV1] AS TABLE(
	[Id] [bigint] NOT NULL,
	[VehicleCode] [nvarchar](100) NULL,
	[Make] [nvarchar](100) NULL,
	[Model] [nvarchar](100) NULL,
	[VehicleType] [nvarchar](100) NULL,
	[BodyType] [nvarchar](100) NULL,
	[IntroductionDate] [date] NULL,
	[ModelYear] [int] NULL,
	[TerminationDate] [date] NULL,
	[EngineCapacity] [int] NULL,
	[EnginePower] [nvarchar](100) NULL,
	[Cylinders] [int] NULL,
	[Doors] [nvarchar](100) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[SequenceNumber] [bigint] NOT NULL
)