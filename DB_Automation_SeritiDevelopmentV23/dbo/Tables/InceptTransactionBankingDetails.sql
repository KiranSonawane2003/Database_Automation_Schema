CREATE TABLE [dbo].[InceptTransactionBankingDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BranchName] [nvarchar](200) NULL,
	[AccountType] [bigint] NULL,
	[AccountNo] [nvarchar](200) NULL,
	[LoanType] [bigint] NULL,
	[IsSalaryTransferedToBank] [bit] NULL,
	[LoanOutstanding] [decimal](18, 2) NULL,
	[Emirate] [nvarchar](200) NULL,
	[NoOfYearsAccountHeld] [int] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[BankId] [bigint] NULL,
	[BankValue] [nvarchar](100) NULL,
	[AccountTypeValue] [nvarchar](50) NULL,
	[LoanTypeValue] [nvarchar](50) NULL,
	[CountryValue] [nvarchar](50) NULL,
	[CreatedByValue] [nvarchar](50) NULL,
	[ModifiedByValue] [nvarchar](50) NULL,
	[InceptTransactionId] [bigint] NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[BranchCode] [nvarchar](50) NULL,
	[BranchType] [nvarchar](50) NULL,
	[NameOfAccountHolder] [nvarchar](100) NULL,
	[DateOfAccountOpened] [date] NULL,
	[MonthlyInstalment] [decimal](18, 2) NULL,
	[CreditCardTypeId] [bigint] NULL,
	[CreditCardTypeValue] [nvarchar](50) NULL,
	[CreditCardNumber] [nvarchar](50) NULL,
	[CreditCardDateofIssue] [date] NULL,
	[CreditCardDateofExpiry] [date] NULL,
	[AccountDetailsType] [int] NULL,
	[IsIncludeDetails] [bit] NULL,
	[DebitOrderDate] [date] NULL,
	[IsSendDebitOrderDetails] [bit] NULL,
	[DebitOrderStartDate] [date] NULL,
	[DebitOrderEndDate] [date] NULL,
	[NoOfPaymentPeriods] [int] NULL,
	[DebitAmount] [decimal](18, 8) NULL,
	[MaximumAmount] [decimal](18, 8) NULL,
	[DebitOrderCompanyID] [bigint] NULL,
	[IsDebitOrder] [bit] NULL,
	[CreditCardOutStanding] [decimal](18, 8) NULL,
	[FirstEMIDate] [date] NULL,
	[PaymentMethod] [bigint] NULL,
	[IBANNumber] [nvarchar](200) NULL,
	[NoOfEMIsForObligation] [int] NULL,
	[RepaymentAccount] [bit] NULL,
	[IsExistingCASAAccountNumber] [bit] NULL,
	[ExistingCASAAccountNumber] [nvarchar](200) NULL,
	[IsDownPaymentAccount] [bit] NULL,
	[BranchId] [bigint] NULL,
	[IsFeeCollectionbyDebitOrder] [bit] NULL,
 CONSTRAINT [InceptClientBankingDetails_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InceptTransactionBankingDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_InceptTransactionBankingDetails_InceptTransaction] FOREIGN KEY([InceptTransactionId])
REFERENCES [dbo].[InceptTransaction] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionBankingDetails] CHECK CONSTRAINT [FK_InceptTransactionBankingDetails_InceptTransaction]
GO
ALTER TABLE [dbo].[InceptTransactionBankingDetails]  WITH NOCHECK ADD  CONSTRAINT [InceptTransactionBankingDetails_FK_StaticValueBranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionBankingDetails] CHECK CONSTRAINT [InceptTransactionBankingDetails_FK_StaticValueBranchId]
GO
ALTER TABLE [dbo].[InceptTransactionBankingDetails] ADD  CONSTRAINT [DF__InceptTransacti__IsAct__3871AF88]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[InceptTransactionBankingDetails] ADD  CONSTRAINT [DF__InceptTransacti__Creat__3965D3C1]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[InceptTransactionBankingDetails] ADD  DEFAULT ((0)) FOR [IsIncludeDetails]