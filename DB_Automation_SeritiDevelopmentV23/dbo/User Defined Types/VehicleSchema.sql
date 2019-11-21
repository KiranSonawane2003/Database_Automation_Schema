/****** Object:  UserDefinedTableType [dbo].[VehicleSchema]    Script Date: 11/20/2019 11:25:27 AM ******/
CREATE TYPE [dbo].[VehicleSchema] AS TABLE(
	[Id] [bigint] NOT NULL,
	[VehicleCode] [nvarchar](100) NULL,
	[ManufacturerId] [bigint] NULL,
	[Model] [nvarchar](100) NULL,
	[VehicleTypeId] [bigint] NULL,
	[BodyTypeId] [bigint] NULL,
	[IntroductionDate] [date] NULL,
	[ModelYear] [int] NULL,
	[TerminationDate] [date] NULL,
	[EngineCapacity] [int] NULL,
	[EnginePower] [nvarchar](100) NULL,
	[Cylinders] [int] NULL,
	[Doors] [int] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[SequenceNumber] [bigint] NOT NULL
)