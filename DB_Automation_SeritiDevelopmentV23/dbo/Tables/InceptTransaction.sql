﻿CREATE TABLE [dbo].[InceptTransaction](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[IsDealSighted] [bit] NOT NULL,
	[SalesReferenceNumber] [nvarchar](100) NULL,
	[CompanyType] [bigint] NULL,
	[IsCashTransaction] [bit] NOT NULL,
	[PreferredInterestRate] [decimal](18, 2) NULL,
	[FinanceDealScheme] [bit] NULL,
	[IsPreArrangedFinance] [bit] NOT NULL,
	[FinanceAccountNumber] [nvarchar](100) NULL,
	[RetailPrice] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[DocInvoiceNo] [nvarchar](50) NULL,
	[StockNo] [nvarchar](50) NULL,
	[IsShareDetailsWithinCompany] [bit] NULL,
	[IsShareDetailsAmongPartner] [bit] NULL,
	[IsReceiveMarketingInfo] [bit] NULL,
	[TransactionSchedulePath] [nvarchar](500) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[InceptedBy] [int] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[IsTransactionIncepted] [bit] NULL,
	[GroupId] [bigint] NULL,
	[GroupValue] [nvarchar](100) NULL,
	[BranchId] [bigint] NULL,
	[BranchValue] [nvarchar](100) NULL,
	[TransactionTypeId] [bigint] NULL,
	[TransactionTypeValue] [nvarchar](200) NULL,
	[TransactionStatusId] [bigint] NULL,
	[TransactionStatusValue] [nvarchar](200) NULL,
	[TransactionStatusNotes] [nvarchar](4000) NULL,
	[FinanceStatusId] [bigint] NULL,
	[FinanceStatusValue] [nvarchar](100) NULL,
	[FinanceStatusNotes] [nvarchar](4000) NULL,
	[SalesCompanyId] [bigint] NULL,
	[SalesCompanyValue] [nvarchar](max) NULL,
	[SalesPersonId] [bigint] NULL,
	[SalesPersonValue] [nvarchar](100) NULL,
	[BusinessManagerId] [bigint] NULL,
	[BusinessManagerValue] [nvarchar](100) NULL,
	[CompanyTypeValue] [nvarchar](100) NULL,
	[FinanceCompanyId] [bigint] NULL,
	[FinanceCompanyValue] [nvarchar](max) NULL,
	[PaymentType] [nvarchar](50) NULL,
	[FinanceTermId] [bigint] NULL,
	[FinanceTermValue] [int] NULL,
	[VehicleId] [bigint] NULL,
	[VehicleUse] [bigint] NULL,
	[VehicleUseValue] [nvarchar](200) NULL,
	[VehicleCondition] [bigint] NULL,
	[VehicleConditionValue] [nvarchar](100) NULL,
	[VehicleRegistrationName] [nvarchar](100) NULL,
	[VehicleRegisteredAt] [nvarchar](100) NULL,
	[ValuationDate] [date] NULL,
	[Valuator] [nvarchar](100) NULL,
	[DisburseId] [bigint] NULL,
	[DisburseValue] [nvarchar](200) NULL,
	[PrivateKey] [nvarchar](100) NULL,
	[IsAssetInsured] [bit] NULL,
	[TotalDeposit] [decimal](18, 2) NULL,
	[BalloonValue] [decimal](18, 2) NULL,
	[BalloonPercentage] [decimal](18, 2) NULL,
	[IsTradeIn] [bit] NULL,
	[IsTradeInCashTransaction] [bit] NULL,
	[TradeInFinanceCompanyValue] [nvarchar](max) NULL,
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
	[InterestRateTypeId] [bigint] NULL,
	[InterestRateTypeValue] [nvarchar](50) NULL,
	[CountryValue] [nvarchar](50) NULL,
	[InceptedByValue] [nvarchar](50) NULL,
	[CreatedByValue] [nvarchar](50) NULL,
	[ModifiedByValue] [nvarchar](50) NULL,
	[IsIncepted] [bit] NULL,
	[InceptDate] [datetime] NULL,
	[LocalPurchaseNumber] [nvarchar](100) NULL,
	[TotalSumInsured] [decimal](18, 2) NULL,
	[ReferenceNumber] [nvarchar](50) NULL,
	[VehileDescription] [nvarchar](200) NULL,
	[OdometerReading] [int] NULL,
	[FinanceType] [bigint] NULL,
	[FinanceTypeValue] [nvarchar](50) NULL,
	[SellingPrice] [decimal](18, 2) NULL,
	[VehicleCostPrice] [decimal](18, 2) NULL,
	[Immoblizer] [bigint] NULL,
	[ImmoblizerValue] [nvarchar](50) NULL,
	[IsManufacturerWarranty] [bit] NULL,
	[ManWarrantyExpiryMonths] [bigint] NULL,
	[ManWarrantyExpiryKM] [int] NULL,
	[ExistingWarranty] [bit] NULL,
	[ExistingWarrantyExpiryDate] [date] NULL,
	[ExistingWarrantyExpiryKM] [int] NULL,
	[ManufacturePlanType] [bigint] NULL,
	[ManufacturePlanTypeValue] [nvarchar](50) NULL,
	[ManPlanExpiryMonths] [int] NULL,
	[ManPlanExpiryKM] [int] NULL,
	[ExistingPlanType] [bigint] NULL,
	[ExistingPlanTypeValue] [nvarchar](50) NULL,
	[ExistingPlanExpiryDate] [date] NULL,
	[ExistingPlanExpiryKM] [int] NULL,
	[PaymentTypeValue] [nvarchar](50) NULL,
	[ProfitRate] [decimal](18, 2) NULL,
	[PreferredCallTime] [bigint] NULL,
	[PreferredCallTimeValue] [nvarchar](50) NULL,
	[VehicleTradeInValue] [decimal](18, 2) NULL,
	[IsManufaturerApprovedUsedVehicle] [bit] NULL,
	[IsFullServiceHistory] [bit] NULL,
	[Kilometers] [int] NULL,
	[VehicleEmirateValue] [nvarchar](50) NULL,
	[ManWarrantyExpiryMonthsValue] [int] NULL,
	[VINNumber] [nvarchar](50) NULL,
	[UninceptReason] [nvarchar](1000) NULL,
	[DocInvoiceDate] [datetime] NULL,
	[DocInvoicePaidDate] [datetime] NULL,
	[VehicleDeliveryDate] [datetime] NULL,
	[OtherFee] [decimal](18, 2) NULL,
	[OtherCost] [decimal](18, 2) NULL,
	[DICAmount] [decimal](18, 2) NULL,
	[DICPercentage] [decimal](18, 2) NULL,
	[TransactionCreatedDate] [datetime] NULL,
	[TransactionNo] [bigint] NULL,
	[SalesPersonEmpNo] [nvarchar](100) NULL,
	[BusinessManagerEmpNo] [nvarchar](100) NULL,
	[StampDutyFees] [decimal](18, 2) NULL,
	[BankDocumentationFees] [decimal](18, 2) NULL,
	[PayOutRequestDate] [datetime] NULL,
	[CallBackCustomerDateTime] [datetime] NULL,
	[IsDisclosureofPersonalInfo] [bit] NULL,
	[IsDebitOrderInformationAndAuthorization] [bit] NULL,
	[IsCustomerBankStatement] [bit] NULL,
	[VehicleDescription] [nvarchar](200) NULL,
	[TransactionSource] [nvarchar](100) NULL,
	[UninceptDate] [datetime] NULL,
	[UninceptBy] [nvarchar](1000) NULL,
	[PrimeInterestRate] [decimal](18, 2) NULL,
	[FleetNumber] [nvarchar](max) NULL,
	[BusinessSegment] [bigint] NULL,
	[ParentTransactionId] [bigint] NULL,
	[TransactionFee] [decimal](18, 2) NULL,
	[LOIIssueDate] [datetime] NULL,
	[LOIExpiryDate] [datetime] NULL,
	[LOPIssueDate] [datetime] NULL,
	[LOPExpiryDate] [datetime] NULL,
	[Scheme] [nvarchar](max) NULL,
 CONSTRAINT [InceptTransaction_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[InceptTransaction] ADD  CONSTRAINT [InceptTransaction_DF_IsDealSighted]  DEFAULT ((0)) FOR [IsDealSighted]
GO
ALTER TABLE [dbo].[InceptTransaction] ADD  CONSTRAINT [InceptTransaction_DF_CashTransaction]  DEFAULT ((0)) FOR [IsCashTransaction]
GO
ALTER TABLE [dbo].[InceptTransaction] ADD  CONSTRAINT [InceptTransaction_DF_PreArrangedFinance]  DEFAULT ((0)) FOR [IsPreArrangedFinance]
GO
ALTER TABLE [dbo].[InceptTransaction] ADD  CONSTRAINT [DF_InceptTransaction_IsShareDetailsWithinCompany]  DEFAULT ((0)) FOR [IsShareDetailsWithinCompany]
GO
ALTER TABLE [dbo].[InceptTransaction] ADD  CONSTRAINT [DF_InceptTransaction_IsShareDetailsAmongPartner]  DEFAULT ((0)) FOR [IsShareDetailsAmongPartner]
GO
ALTER TABLE [dbo].[InceptTransaction] ADD  CONSTRAINT [DF_InceptTransaction_IsReceiveMarketingInfo]  DEFAULT ((0)) FOR [IsReceiveMarketingInfo]
GO
ALTER TABLE [dbo].[InceptTransaction] ADD  CONSTRAINT [InceptTransaction_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[InceptTransaction] ADD  CONSTRAINT [InceptTransaction_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[InceptTransaction] ADD  CONSTRAINT [DF__InceptTra__IsTra__19E306C7]  DEFAULT ((0)) FOR [IsTransactionIncepted]
GO
ALTER TABLE [dbo].[InceptTransaction] ADD  DEFAULT ((0)) FOR [IsTradeIn]
GO
ALTER TABLE [dbo].[InceptTransaction] ADD  DEFAULT ((0)) FOR [IsTradeInCashTransaction]
GO
ALTER TABLE [dbo].[InceptTransaction] ADD  DEFAULT ((0)) FOR [IsIncepted]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This Table stores the incepted transaction details' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InceptTransaction'