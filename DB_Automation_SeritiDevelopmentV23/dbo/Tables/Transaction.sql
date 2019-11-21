CREATE TABLE [dbo].[Transaction](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[TransactionTypeId] [bigint] NULL,
	[TransactionStatusId] [bigint] NULL,
	[TransactionStatusNotes] [nvarchar](4000) NULL,
	[FinanceStatusId] [bigint] NULL,
	[FinanceStatusNotes] [nvarchar](4000) NULL,
	[IsDealSighted] [bit] NOT NULL,
	[SalesCompanyId] [bigint] NULL,
	[SalesReferenceNumber] [nvarchar](100) NULL,
	[SalesPersonId] [bigint] NULL,
	[BusinessManagerId] [int] NULL,
	[CompanyType] [bigint] NULL,
	[IsCashTransaction] [bit] NOT NULL,
	[PreferredInterestRate] [decimal](18, 2) NULL,
	[FinanceCompanyId] [bigint] NULL,
	[IsPreArrangedFinance] [bit] NOT NULL,
	[FinanceAccountNumber] [nvarchar](100) NULL,
	[FinanceTermId] [bigint] NULL,
	[VehicleId] [bigint] NULL,
	[VehicleUse] [bigint] NULL,
	[VehicleCondition] [bigint] NULL,
	[VehicleRegistrationName] [nvarchar](100) NULL,
	[VehicleRegisteredAt] [nvarchar](100) NULL,
	[ValuationDate] [date] NULL,
	[Valuator] [nvarchar](100) NULL,
	[DisburseId] [bigint] NULL,
	[PrivateKey] [nvarchar](100) NULL,
	[IsAssetInsured] [bit] NULL,
	[RetailPrice] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[TotalDeposit] [decimal](18, 2) NULL,
	[BalloonValue] [decimal](18, 2) NULL,
	[BalloonPercentage] [decimal](18, 2) NULL,
	[IsTradeIn] [bit] NULL,
	[IsTradeInCashTransaction] [bit] NULL,
	[TradeInFinanceCompanyId] [bigint] NULL,
	[TradeInCarFinanceAccNumber] [nvarchar](100) NULL,
	[TradeInCurrentInstalment] [decimal](18, 2) NULL,
	[TradeInValue] [decimal](18, 2) NULL,
	[TradeInSettlementValue] [decimal](18, 2) NULL,
	[TradeInCashPayback] [decimal](18, 2) NULL,
	[NetTradeInDepositValue] [decimal](18, 2) NULL,
	[TransactionClientId] [bigint] NULL,
	[TransactionDriverId] [bigint] NULL,
	[ChassisNumber] [nvarchar](100) NULL,
	[EngineNumber] [nvarchar](100) NULL,
	[RegistrationNumber] [nvarchar](100) NULL,
	[FirstRegistrationDate] [datetime] NULL,
	[Color] [nvarchar](50) NULL,
	[VehicleEmirate] [bigint] NULL,
	[DownPayment] [decimal](18, 2) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[InterestRateTypeId] [bigint] NULL,
	[PaymentType] [bigint] NULL,
	[ReferenceNumber] [nvarchar](50) NULL,
	[OdometerReading] [int] NULL,
	[FinanceType] [bigint] NULL,
	[SellingPrice] [decimal](18, 2) NULL,
	[VehicleCostPrice] [decimal](18, 2) NULL,
	[Immoblizer] [bigint] NULL,
	[IsManufacturerWarranty] [bit] NULL,
	[ManWarrantyExpiryMonths] [bigint] NULL,
	[ManWarrantyExpiryKM] [int] NULL,
	[ExistingWarranty] [bit] NULL,
	[ExistingWarrantyExpiryDate] [date] NULL,
	[ExistingWarrantyExpiryKM] [int] NULL,
	[ManufacturePlanType] [bigint] NULL,
	[ManPlanExpiryMonths] [bigint] NULL,
	[ManPlanExpiryKM] [int] NULL,
	[ExistingPlanType] [bigint] NULL,
	[ExistingPlanExpiryDate] [date] NULL,
	[ExistingPlanExpiryKM] [int] NULL,
	[IsIncepted] [bit] NOT NULL,
	[VehicleDescription] [nvarchar](200) NULL,
	[ProfitRate] [decimal](18, 2) NULL,
	[PreferredCallTime] [bigint] NULL,
	[VehicleTradeInValue] [decimal](18, 2) NULL,
	[IsManufaturerApprovedUsedVehicle] [bit] NULL,
	[IsFullServiceHistory] [bit] NULL,
	[Kilometers] [int] NULL,
	[VINNumber] [nvarchar](50) NULL,
	[TransactionNo] [bigint] NULL,
	[InceptDate] [datetime] NULL,
	[BankDocumentationFees] [decimal](18, 2) NULL,
	[StampDutyFees] [decimal](18, 2) NULL,
	[CallBackCustomerDateTime] [datetime] NULL,
	[DeclineDateTime] [datetime] NULL,
	[TransactionAPIOwner] [int] NULL,
	[HFAId] [bigint] NULL,
	[DocInvoiceNo] [nvarchar](50) NULL,
	[StockNo] [nvarchar](50) NULL,
	[DocInvoiceDate] [datetime] NULL,
	[DocInvoicePaidDate] [datetime] NULL,
	[VehicleDeliveryDate] [datetime] NULL,
	[OtherFee] [decimal](18, 2) NULL,
	[OtherCost] [decimal](18, 2) NULL,
	[DICAmount] [decimal](18, 2) NULL,
	[DICPercentage] [decimal](18, 2) NULL,
	[PayOutRequestDate] [datetime] NULL,
	[TransactionSource] [nvarchar](100) NULL,
	[SeatingCapacity] [int] NULL,
	[PrimeInterestRate] [decimal](18, 2) NULL,
	[IsBlockAutomaticUpdate] [bit] NULL,
	[APICompanyId] [bigint] NULL,
	[IsApiUpdate] [bit] NULL,
	[FleetNumber] [nvarchar](max) NULL,
	[BusinessSegment] [bigint] NULL,
	[ParentTransactionId] [bigint] NULL,
	[TransactionFee] [decimal](18, 2) NULL,
	[LOIIssueDate] [datetime] NULL,
	[LOIExpiryDate] [datetime] NULL,
	[LocalPurchaseNumber] [nvarchar](200) NULL,
	[LOPIssueDate] [datetime] NULL,
	[LOPExpiryDate] [datetime] NULL,
	[CopiedFrom] [nvarchar](max) NULL,
	[Scheme] [nvarchar](max) NULL,
	[ReceivedByFAndIDate] [datetime] NULL,
	[DealNotTakenDate] [datetime] NULL,
	[CustomerCancelledDate] [datetime] NULL,
	[TakeABreakMonthId] [bigint] NULL,
 CONSTRAINT [Transaction_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_StaticValue_FinanceStatus] FOREIGN KEY([FinanceStatusId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_StaticValue_FinanceStatus]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_StaticValue_TransactionStatus] FOREIGN KEY([TransactionStatusId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_StaticValue_TransactionStatus]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_StaticValue_TransactionType] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_StaticValue_TransactionType]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_ExpiryMonth] FOREIGN KEY([ManPlanExpiryMonths])
REFERENCES [dbo].[ExpiryMonth] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_ExpiryMonth]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_ExpiryMonth1] FOREIGN KEY([ManWarrantyExpiryMonths])
REFERENCES [dbo].[ExpiryMonth] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_ExpiryMonth1]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_FinanceTerm] FOREIGN KEY([FinanceTermId])
REFERENCES [dbo].[FinanceTerm] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_FinanceTerm]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_PaymentType] FOREIGN KEY([PaymentType])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_PaymentType]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_StaticValueExistingPlanType] FOREIGN KEY([ExistingPlanType])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_StaticValueExistingPlanType]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_StaticValueFinanceType] FOREIGN KEY([FinanceType])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_StaticValueFinanceType]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_StaticValueImmoblizer] FOREIGN KEY([Immoblizer])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_StaticValueImmoblizer]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_StaticValueInterestRateTypeId] FOREIGN KEY([InterestRateTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_StaticValueInterestRateTypeId]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_StaticValueManufacturePlanType] FOREIGN KEY([ManufacturePlanType])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_StaticValueManufacturePlanType]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_StaticValueTradeInFinanceCompanyId] FOREIGN KEY([TradeInFinanceCompanyId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_StaticValueTradeInFinanceCompanyId]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Transaction_BusinessSegment] FOREIGN KEY([BusinessSegment])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Transaction_BusinessSegment]
GO
ALTER TABLE [dbo].[Transaction]  WITH NOCHECK ADD  CONSTRAINT [FK_Transaction_TransactionClient] FOREIGN KEY([TransactionClientId])
REFERENCES [dbo].[TransactionClient] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_TransactionClient]
GO
ALTER TABLE [dbo].[Transaction]  WITH NOCHECK ADD  CONSTRAINT [FK_Transaction_TransactionClient1] FOREIGN KEY([TransactionDriverId])
REFERENCES [dbo].[TransactionClient] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_TransactionClient1]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Users] FOREIGN KEY([TransactionAPIOwner])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Users]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_UsersBusinessManager] FOREIGN KEY([BusinessManagerId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_UsersBusinessManager]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_FK_Branch]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_CompanyAPICompanyId] FOREIGN KEY([APICompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_FK_CompanyAPICompanyId]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_CompanyCompanyTypeMappingFinanceCompanyId] FOREIGN KEY([FinanceCompanyId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_FK_CompanyCompanyTypeMappingFinanceCompanyId]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_FK_Country]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_FK_Group]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_SalesPerson] FOREIGN KEY([SalesPersonId])
REFERENCES [dbo].[SalesPerson] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_FK_SalesPerson]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_StaticValueDisbursedId] FOREIGN KEY([DisburseId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_FK_StaticValueDisbursedId]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_StaticValuePreferredCallTime] FOREIGN KEY([PreferredCallTime])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_FK_StaticValuePreferredCallTime]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_StaticValueTakeABreakMonth] FOREIGN KEY([TakeABreakMonthId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_FK_StaticValueTakeABreakMonth]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_StaticValueVehicleCondition] FOREIGN KEY([VehicleCondition])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_FK_StaticValueVehicleCondition]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_StaticValueVehicleEmirate] FOREIGN KEY([VehicleEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_FK_StaticValueVehicleEmirate]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_StaticValueVehicleUse] FOREIGN KEY([VehicleUse])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_FK_StaticValueVehicleUse]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_Vehicle] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicle] ([Id])
GO

ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_FK_Vehicle]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [Transaction_DF_IsDealSighted]  DEFAULT ((0)) FOR [IsDealSighted]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [Transaction_DF_CashTransaction]  DEFAULT ((0)) FOR [IsCashTransaction]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [Transaction_DF_PreArrangedFinance]  DEFAULT ((0)) FOR [IsPreArrangedFinance]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [Transaction_DF_TradeIn]  DEFAULT ((0)) FOR [IsTradeIn]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_IsTradeInCashTransaction]  DEFAULT ((0)) FOR [IsTradeInCashTransaction]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [Transaction_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [Transaction_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT ((0)) FOR [IsIncepted]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT ((0)) FOR [IsBlockAutomaticUpdate]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT ((0)) FOR [IsApiUpdate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table stores OTP information related with transaction. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Transaction'