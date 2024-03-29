﻿CREATE TABLE [dbo].[Transaction] (
    [Id]                               BIGINT          IDENTITY (1, 1) NOT NULL,
    [GroupId]                          BIGINT          NOT NULL,
    [BranchId]                         BIGINT          NOT NULL,
    [TransactionTypeId]                BIGINT          NULL,
    [TransactionStatusId]              BIGINT          NULL,
    [TransactionStatusNotes]           NVARCHAR (4000) NULL,
    [FinanceStatusId]                  BIGINT          NULL,
    [FinanceStatusNotes]               NVARCHAR (4000) NULL,
    [IsDealSighted]                    BIT             CONSTRAINT [Transaction_DF_IsDealSighted] DEFAULT ((0)) NOT NULL,
    [SalesCompanyId]                   BIGINT          NULL,
    [SalesReferenceNumber]             NVARCHAR (100)  NULL,
    [SalesPersonId]                    BIGINT          NULL,
    [BusinessManagerId]                INT             NULL,
    [CompanyType]                      BIGINT          NULL,
    [IsCashTransaction]                BIT             CONSTRAINT [Transaction_DF_CashTransaction] DEFAULT ((0)) NOT NULL,
    [PreferredInterestRate]            DECIMAL (18, 2) NULL,
    [FinanceCompanyId]                 BIGINT          NULL,
    [IsPreArrangedFinance]             BIT             CONSTRAINT [Transaction_DF_PreArrangedFinance] DEFAULT ((0)) NOT NULL,
    [FinanceAccountNumber]             NVARCHAR (100)  NULL,
    [FinanceTermId]                    BIGINT          NULL,
    [VehicleId]                        BIGINT          NULL,
    [VehicleUse]                       BIGINT          NULL,
    [VehicleCondition]                 BIGINT          NULL,
    [VehicleRegistrationName]          NVARCHAR (100)  NULL,
    [VehicleRegisteredAt]              NVARCHAR (100)  NULL,
    [ValuationDate]                    DATE            NULL,
    [Valuator]                         NVARCHAR (100)  NULL,
    [DisburseId]                       BIGINT          NULL,
    [PrivateKey]                       NVARCHAR (100)  NULL,
    [IsAssetInsured]                   BIT             NULL,
    [RetailPrice]                      DECIMAL (18, 2) NULL,
    [Discount]                         DECIMAL (18, 2) NULL,
    [TotalDeposit]                     DECIMAL (18, 2) NULL,
    [BalloonValue]                     DECIMAL (18, 2) NULL,
    [BalloonPercentage]                DECIMAL (18, 2) NULL,
    [IsTradeIn]                        BIT             CONSTRAINT [Transaction_DF_TradeIn] DEFAULT ((0)) NULL,
    [IsTradeInCashTransaction]         BIT             CONSTRAINT [DF_Transaction_IsTradeInCashTransaction] DEFAULT ((0)) NULL,
    [TradeInFinanceCompanyId]          BIGINT          NULL,
    [TradeInCarFinanceAccNumber]       NVARCHAR (100)  NULL,
    [TradeInCurrentInstalment]         DECIMAL (18, 2) NULL,
    [TradeInValue]                     DECIMAL (18, 2) NULL,
    [TradeInSettlementValue]           DECIMAL (18, 2) NULL,
    [TradeInCashPayback]               DECIMAL (18, 2) NULL,
    [NetTradeInDepositValue]           DECIMAL (18, 2) NULL,
    [TransactionClientId]              BIGINT          NULL,
    [TransactionDriverId]              BIGINT          NULL,
    [ChassisNumber]                    NVARCHAR (100)  NULL,
    [EngineNumber]                     NVARCHAR (100)  NULL,
    [RegistrationNumber]               NVARCHAR (100)  NULL,
    [FirstRegistrationDate]            DATETIME        NULL,
    [Color]                            NVARCHAR (50)   NULL,
    [VehicleEmirate]                   BIGINT          NULL,
    [DownPayment]                      DECIMAL (18, 2) NULL,
    [CountryId]                        BIGINT          NULL,
    [IsActive]                         BIT             CONSTRAINT [Transaction_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]                      DATETIME        CONSTRAINT [Transaction_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]                     DATETIME        NULL,
    [CreatedBy]                        INT             NOT NULL,
    [ModifiedBy]                       INT             NULL,
    [InterestRateTypeId]               BIGINT          NULL,
    [PaymentType]                      BIGINT          NULL,
    [ReferenceNumber]                  NVARCHAR (50)   NULL,
    [OdometerReading]                  INT             NULL,
    [FinanceType]                      BIGINT          NULL,
    [SellingPrice]                     DECIMAL (18, 2) NULL,
    [VehicleCostPrice]                 DECIMAL (18, 2) NULL,
    [Immoblizer]                       BIGINT          NULL,
    [IsManufacturerWarranty]           BIT             NULL,
    [ManWarrantyExpiryMonths]          BIGINT          NULL,
    [ManWarrantyExpiryKM]              INT             NULL,
    [ExistingWarranty]                 BIT             NULL,
    [ExistingWarrantyExpiryDate]       DATE            NULL,
    [ExistingWarrantyExpiryKM]         INT             NULL,
    [ManufacturePlanType]              BIGINT          NULL,
    [ManPlanExpiryMonths]              BIGINT          NULL,
    [ManPlanExpiryKM]                  INT             NULL,
    [ExistingPlanType]                 BIGINT          NULL,
    [ExistingPlanExpiryDate]           DATE            NULL,
    [ExistingPlanExpiryKM]             INT             NULL,
    [IsIncepted]                       BIT             DEFAULT ((0)) NOT NULL,
    [VehicleDescription]               NVARCHAR (200)  NULL,
    [ProfitRate]                       DECIMAL (18, 2) NULL,
    [PreferredCallTime]                BIGINT          NULL,
    [VehicleTradeInValue]              DECIMAL (18, 2) NULL,
    [IsManufaturerApprovedUsedVehicle] BIT             NULL,
    [IsFullServiceHistory]             BIT             NULL,
    [Kilometers]                       INT             NULL,
    [VINNumber]                        NVARCHAR (50)   NULL,
    [TransactionNo]                    BIGINT          NULL,
    [InceptDate]                       DATETIME        NULL,
    [BankDocumentationFees]            DECIMAL (18, 2) NULL,
    [StampDutyFees]                    DECIMAL (18, 2) NULL,
    [CallBackCustomerDateTime]         DATETIME        NULL,
    [DeclineDateTime]                  DATETIME        NULL,
    [TransactionAPIOwner]              INT             NULL,
    [HFAId]                            BIGINT          NULL,
    [DocInvoiceNo]                     NVARCHAR (50)   NULL,
    [StockNo]                          NVARCHAR (50)   NULL,
    [DocInvoiceDate]                   DATETIME        NULL,
    [DocInvoicePaidDate]               DATETIME        NULL,
    [VehicleDeliveryDate]              DATETIME        NULL,
    [OtherFee]                         DECIMAL (18, 2) NULL,
    [OtherCost]                        DECIMAL (18, 2) NULL,
    [DICAmount]                        DECIMAL (18, 2) NULL,
    [DICPercentage]                    DECIMAL (18, 2) NULL,
    [PayOutRequestDate]                DATETIME        NULL,
    [TransactionSource]                NVARCHAR (100)  NULL,
    [SeatingCapacity]                  INT             NULL,
    [PrimeInterestRate]                DECIMAL (18, 2) NULL,
    [IsBlockAutomaticUpdate]           BIT             DEFAULT ((0)) NULL,
    [APICompanyId]                     BIGINT          NULL,
    [IsApiUpdate]                      BIT             DEFAULT ((0)) NULL,
    [FleetNumber]                      NVARCHAR (MAX)  NULL,
    [BusinessSegment]                  BIGINT          NULL,
    [ParentTransactionId]              BIGINT          NULL,
    [TransactionFee]                   DECIMAL (18, 2) NULL,
    [LOIIssueDate]                     DATETIME        NULL,
    [LOIExpiryDate]                    DATETIME        NULL,
    [LocalPurchaseNumber]              NVARCHAR (200)  NULL,
    [LOPIssueDate]                     DATETIME        NULL,
    [LOPExpiryDate]                    DATETIME        NULL,
    [CopiedFrom]                       NVARCHAR (MAX)  NULL,
    [Scheme]                           NVARCHAR (MAX)  NULL,
    [ReceivedByFAndIDate]              DATETIME        NULL,
    [DealNotTakenDate]                 DATETIME        NULL,
    [CustomerCancelledDate]            DATETIME        NULL,
    [TakeABreakMonthId]                BIGINT          NULL,
    CONSTRAINT [Transaction_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_StaticValue_FinanceStatus] FOREIGN KEY ([FinanceStatusId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_StaticValue_TransactionStatus] FOREIGN KEY ([TransactionStatusId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_StaticValue_TransactionType] FOREIGN KEY ([TransactionTypeId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_Transaction_ExpiryMonth] FOREIGN KEY ([ManPlanExpiryMonths]) REFERENCES [dbo].[ExpiryMonth] ([Id]),
    CONSTRAINT [FK_Transaction_ExpiryMonth1] FOREIGN KEY ([ManWarrantyExpiryMonths]) REFERENCES [dbo].[ExpiryMonth] ([Id]),
    CONSTRAINT [FK_Transaction_FinanceTerm] FOREIGN KEY ([FinanceTermId]) REFERENCES [dbo].[FinanceTerm] ([Id]),
    CONSTRAINT [FK_Transaction_PaymentType] FOREIGN KEY ([PaymentType]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_Transaction_StaticValueExistingPlanType] FOREIGN KEY ([ExistingPlanType]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_Transaction_StaticValueFinanceType] FOREIGN KEY ([FinanceType]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_Transaction_StaticValueImmoblizer] FOREIGN KEY ([Immoblizer]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_Transaction_StaticValueInterestRateTypeId] FOREIGN KEY ([InterestRateTypeId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_Transaction_StaticValueManufacturePlanType] FOREIGN KEY ([ManufacturePlanType]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_Transaction_StaticValueTradeInFinanceCompanyId] FOREIGN KEY ([TradeInFinanceCompanyId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_Transaction_Transaction_BusinessSegment] FOREIGN KEY ([BusinessSegment]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_Transaction_TransactionClient] FOREIGN KEY ([TransactionClientId]) REFERENCES [dbo].[TransactionClient] ([Id]),
    CONSTRAINT [FK_Transaction_TransactionClient1] FOREIGN KEY ([TransactionDriverId]) REFERENCES [dbo].[TransactionClient] ([Id]),
    CONSTRAINT [FK_Transaction_Users] FOREIGN KEY ([TransactionAPIOwner]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_Transaction_UsersBusinessManager] FOREIGN KEY ([BusinessManagerId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Transaction_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [Transaction_FK_CompanyAPICompanyId] FOREIGN KEY ([APICompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [Transaction_FK_CompanyCompanyTypeMappingFinanceCompanyId] FOREIGN KEY ([FinanceCompanyId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [Transaction_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [Transaction_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [Transaction_FK_SalesPerson] FOREIGN KEY ([SalesPersonId]) REFERENCES [dbo].[SalesPerson] ([Id]),
    CONSTRAINT [Transaction_FK_StaticValueDisbursedId] FOREIGN KEY ([DisburseId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [Transaction_FK_StaticValuePreferredCallTime] FOREIGN KEY ([PreferredCallTime]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [Transaction_FK_StaticValueTakeABreakMonth] FOREIGN KEY ([TakeABreakMonthId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [Transaction_FK_StaticValueVehicleCondition] FOREIGN KEY ([VehicleCondition]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [Transaction_FK_StaticValueVehicleEmirate] FOREIGN KEY ([VehicleEmirate]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [Transaction_FK_StaticValueVehicleUse] FOREIGN KEY ([VehicleUse]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [Transaction_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Transaction_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Transaction_FK_Vehicle] FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores OTP information related with transaction. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Transaction';

