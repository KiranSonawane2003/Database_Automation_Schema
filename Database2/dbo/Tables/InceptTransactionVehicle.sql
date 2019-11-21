CREATE TABLE [dbo].[InceptTransactionVehicle](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](100) NULL,
	[IntroductionDate] [date] NULL,
	[EngineCapacity] [int] NULL,
	[EnginePower] [nvarchar](100) NULL,
	[Cylinders] [int] NULL,
	[Doors] [nvarchar](50) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[TransactionId] [bigint] NOT NULL,
	[VehicleCode] [nvarchar](100) NULL,
	[ManufacturerId] [bigint] NULL,
	[ManufacturerValue] [nvarchar](50) NULL,
	[VehicleTypeId] [bigint] NULL,
	[VehicleTypeValue] [nvarchar](50) NULL,
	[BodyTypeId] [bigint] NULL,
	[BodyTypeValue] [nvarchar](50) NULL,
	[TerminationDate] [date] NULL,
	[Weight] [decimal](18, 2) NULL,
	[CountryValue] [nvarchar](50) NULL,
	[CreatedByValue] [nvarchar](50) NULL,
	[ModifiedByValue] [nvarchar](50) NULL,
	[InceptTransactionId] [bigint] NOT NULL,
	[GroupId] [bigint] NULL,
	[GroupValue] [nvarchar](100) NULL,
	[BranchId] [bigint] NULL,
	[BranchValue] [nvarchar](100) NULL,
	[ModelYear] [int] NULL,
	[TransmissionTypeId] [bigint] NULL,
	[TransmissionTypeValue] [nvarchar](100) NULL,
	[Trim] [nvarchar](50) NULL,
	[DownPaymentMadeTo] [bigint] NULL,
	[AgencyBranchId] [bigint] NULL,
	[AgencyLocation] [nvarchar](200) NULL,
	[TrafficFileNo] [nvarchar](100) NULL,
	[RegistrationTypeId] [bigint] NULL,
	[RegistrationName] [nvarchar](200) NULL,
	[ThirdPartyRelationId] [bigint] NULL,
	[ModeOfDownPayment] [bigint] NULL,
	[SUKUKAmount] [decimal](18, 2) NULL,
	[SUKUKTenure] [int] NULL,
	[FeesCollection] [bigint] NULL,
 CONSTRAINT [InceptTransactionVehicle_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InceptTransactionVehicle]  WITH NOCHECK ADD  CONSTRAINT [FK_InceptTransactionVehicle_InceptTransaction] FOREIGN KEY([InceptTransactionId])
REFERENCES [dbo].[InceptTransaction] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionVehicle] CHECK CONSTRAINT [FK_InceptTransactionVehicle_InceptTransaction]
GO
ALTER TABLE [dbo].[InceptTransactionVehicle]  WITH NOCHECK ADD  CONSTRAINT [InceptTransactionVehicle_FK_StaticValueAgencyBranchId] FOREIGN KEY([AgencyBranchId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionVehicle] CHECK CONSTRAINT [InceptTransactionVehicle_FK_StaticValueAgencyBranchId]
GO
ALTER TABLE [dbo].[InceptTransactionVehicle]  WITH CHECK ADD  CONSTRAINT [InceptTransactionVehicle_FK_StaticValueFeesCollection] FOREIGN KEY([FeesCollection])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionVehicle] CHECK CONSTRAINT [InceptTransactionVehicle_FK_StaticValueFeesCollection]
GO
ALTER TABLE [dbo].[InceptTransactionVehicle]  WITH NOCHECK ADD  CONSTRAINT [InceptTransactionVehicle_FK_StaticValueModeOfDownPayment] FOREIGN KEY([ModeOfDownPayment])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionVehicle] CHECK CONSTRAINT [InceptTransactionVehicle_FK_StaticValueModeOfDownPayment]
GO
ALTER TABLE [dbo].[InceptTransactionVehicle]  WITH NOCHECK ADD  CONSTRAINT [InceptTransactionVehicle_FK_StaticValueRegistrationTypeId] FOREIGN KEY([RegistrationTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionVehicle] CHECK CONSTRAINT [InceptTransactionVehicle_FK_StaticValueRegistrationTypeId]
GO
ALTER TABLE [dbo].[InceptTransactionVehicle]  WITH NOCHECK ADD  CONSTRAINT [InceptTransactionVehicle_FK_StaticValueThirdPartyRelationId] FOREIGN KEY([ThirdPartyRelationId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionVehicle] CHECK CONSTRAINT [InceptTransactionVehicle_FK_StaticValueThirdPartyRelationId]