CREATE TABLE [dbo].[TransactionVehicle](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NULL,
	[VehicleId] [bigint] NULL,
	[FinanceInitiationFee] [decimal](18, 4) NULL,
	[TotalDeposit] [decimal](18, 4) NULL,
	[IsVehicleTrackingInstalled] [bit] NULL,
	[IsActive] [bit] NULL,
	[CountryId] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[IsVehicleUsedBySecurity] [bit] NULL,
	[OffRoadUsages] [decimal](18, 2) NULL,
	[Valuator] [nvarchar](200) NULL,
	[ValuationDate] [datetime] NULL,
	[DownPaymentMadeTo] [bigint] NULL,
	[RateMargin] [decimal](18, 2) NULL,
	[BookAssetValue] [decimal](18, 2) NULL,
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
 CONSTRAINT [PK_TransactionVehicle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionVehicle]  WITH CHECK ADD  CONSTRAINT [TransactionVehicle_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionVehicle] CHECK CONSTRAINT [TransactionVehicle_FK_Country]
GO
ALTER TABLE [dbo].[TransactionVehicle]  WITH CHECK ADD  CONSTRAINT [TransactionVehicle_FK_DownPaymentMadeTo] FOREIGN KEY([DownPaymentMadeTo])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionVehicle] CHECK CONSTRAINT [TransactionVehicle_FK_DownPaymentMadeTo]
GO
ALTER TABLE [dbo].[TransactionVehicle]  WITH NOCHECK ADD  CONSTRAINT [TransactionVehicle_FK_StaticValueAgencyBranchId] FOREIGN KEY([AgencyBranchId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionVehicle] CHECK CONSTRAINT [TransactionVehicle_FK_StaticValueAgencyBranchId]
GO
ALTER TABLE [dbo].[TransactionVehicle]  WITH CHECK ADD  CONSTRAINT [TransactionVehicle_FK_StaticValueFeesCollection] FOREIGN KEY([FeesCollection])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionVehicle] CHECK CONSTRAINT [TransactionVehicle_FK_StaticValueFeesCollection]
GO
ALTER TABLE [dbo].[TransactionVehicle]  WITH NOCHECK ADD  CONSTRAINT [TransactionVehicle_FK_StaticValueModeOfDownPayment] FOREIGN KEY([ModeOfDownPayment])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionVehicle] CHECK CONSTRAINT [TransactionVehicle_FK_StaticValueModeOfDownPayment]
GO
ALTER TABLE [dbo].[TransactionVehicle]  WITH NOCHECK ADD  CONSTRAINT [TransactionVehicle_FK_StaticValueRegistrationTypeId] FOREIGN KEY([RegistrationTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionVehicle] CHECK CONSTRAINT [TransactionVehicle_FK_StaticValueRegistrationTypeId]
GO
ALTER TABLE [dbo].[TransactionVehicle]  WITH NOCHECK ADD  CONSTRAINT [TransactionVehicle_FK_StaticValueThirdPartyRelationId] FOREIGN KEY([ThirdPartyRelationId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionVehicle] CHECK CONSTRAINT [TransactionVehicle_FK_StaticValueThirdPartyRelationId]
GO
ALTER TABLE [dbo].[TransactionVehicle]  WITH CHECK ADD  CONSTRAINT [TransactionVehicle_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionVehicle] CHECK CONSTRAINT [TransactionVehicle_FK_Transaction]
GO
ALTER TABLE [dbo].[TransactionVehicle]  WITH CHECK ADD  CONSTRAINT [TransactionVehicle_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionVehicle] CHECK CONSTRAINT [TransactionVehicle_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[TransactionVehicle]  WITH CHECK ADD  CONSTRAINT [TransactionVehicle_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionVehicle] CHECK CONSTRAINT [TransactionVehicle_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[TransactionVehicle]  WITH CHECK ADD  CONSTRAINT [TransactionVehicle_FK_Vehicle] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicle] ([Id])
GO

ALTER TABLE [dbo].[TransactionVehicle] CHECK CONSTRAINT [TransactionVehicle_FK_Vehicle]