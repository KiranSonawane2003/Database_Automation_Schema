CREATE TABLE [dbo].[TransactionBankingDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BankId] [bigint] NULL,
	[BranchName] [nvarchar](200) NULL,
	[AccountType] [bigint] NULL,
	[AccountNo] [nvarchar](200) NULL,
	[LoanType] [bigint] NULL,
	[IsSalaryTransferedToBank] [bit] NULL,
	[LoanOutstanding] [decimal](18, 2) NULL,
	[Emirate] [nvarchar](200) NULL,
	[NoOfYearsAccountHeld] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CountryId] [bigint] NULL,
	[BranchCode] [nvarchar](50) NULL,
	[BranchType] [nvarchar](50) NULL,
	[NameOfAccountHolder] [nvarchar](100) NULL,
	[DateOfAccountOpened] [date] NULL,
	[TransactionId] [bigint] NULL,
	[MonthlyInstalment] [decimal](18, 2) NULL,
	[CreditCardTypeId] [bigint] NULL,
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
	[AccountName] [nvarchar](200) NULL,
	[IBANNumber] [nvarchar](200) NULL,
	[NoOfEMIsForObligation] [int] NULL,
	[RepaymentAccount] [bit] NULL,
	[IsExistingCASAAccountNumber] [bit] NULL,
	[ExistingCASAAccountNumber] [nvarchar](200) NULL,
	[IsDownPaymentAccount] [bit] NULL,
	[BranchId] [bigint] NULL,
	[IsFeeCollectionbyDebitOrder] [bit] NULL,
	[SalaryPayDate] [datetime] NULL,
	[SalaryPayDay] [int] NULL,
 CONSTRAINT [ClientBankingDetails_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionBankingDetails]  WITH CHECK ADD  CONSTRAINT [FK_InceptTransactionBankingDetails_StaticValue_LoanType] FOREIGN KEY([LoanType])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionBankingDetails] CHECK CONSTRAINT [FK_InceptTransactionBankingDetails_StaticValue_LoanType]
GO
ALTER TABLE [dbo].[TransactionBankingDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransactionBankingDetails_StaticValue_LoanType] FOREIGN KEY([LoanType])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionBankingDetails] CHECK CONSTRAINT [FK_TransactionBankingDetails_StaticValue_LoanType]
GO
ALTER TABLE [dbo].[TransactionBankingDetails]  WITH CHECK ADD  CONSTRAINT [TransactionBankingDetails_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionBankingDetails] CHECK CONSTRAINT [TransactionBankingDetails_FK_Country]
GO
ALTER TABLE [dbo].[TransactionBankingDetails]  WITH CHECK ADD  CONSTRAINT [TransactionBankingDetails_FK_PaymentMethod] FOREIGN KEY([PaymentMethod])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionBankingDetails] CHECK CONSTRAINT [TransactionBankingDetails_FK_PaymentMethod]
GO
ALTER TABLE [dbo].[TransactionBankingDetails]  WITH CHECK ADD  CONSTRAINT [TransactionBankingDetails_FK_StaticValueAccountType] FOREIGN KEY([AccountType])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionBankingDetails] CHECK CONSTRAINT [TransactionBankingDetails_FK_StaticValueAccountType]
GO
ALTER TABLE [dbo].[TransactionBankingDetails]  WITH CHECK ADD  CONSTRAINT [TransactionBankingDetails_FK_StaticValueBankId] FOREIGN KEY([BankId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionBankingDetails] CHECK CONSTRAINT [TransactionBankingDetails_FK_StaticValueBankId]
GO
ALTER TABLE [dbo].[TransactionBankingDetails]  WITH NOCHECK ADD  CONSTRAINT [TransactionBankingDetails_FK_StaticValueBranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionBankingDetails] CHECK CONSTRAINT [TransactionBankingDetails_FK_StaticValueBranchId]
GO
ALTER TABLE [dbo].[TransactionBankingDetails]  WITH CHECK ADD  CONSTRAINT [TransactionBankingDetails_FK_StaticValueCreditCardTypeId] FOREIGN KEY([CreditCardTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionBankingDetails] CHECK CONSTRAINT [TransactionBankingDetails_FK_StaticValueCreditCardTypeId]
GO
ALTER TABLE [dbo].[TransactionBankingDetails]  WITH NOCHECK ADD  CONSTRAINT [TransactionBankingDetails_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionBankingDetails] CHECK CONSTRAINT [TransactionBankingDetails_FK_Transaction]
GO
ALTER TABLE [dbo].[TransactionBankingDetails]  WITH CHECK ADD  CONSTRAINT [TransactionBankingDetails_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionBankingDetails] CHECK CONSTRAINT [TransactionBankingDetails_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[TransactionBankingDetails]  WITH CHECK ADD  CONSTRAINT [TransactionBankingDetails_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionBankingDetails] CHECK CONSTRAINT [TransactionBankingDetails_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[TransactionBankingDetails] ADD  CONSTRAINT [DF__Transacti__IsAct__3871AF88]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionBankingDetails] ADD  CONSTRAINT [DF__Transacti__Creat__3965D3C1]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TransactionBankingDetails] ADD  DEFAULT ((0)) FOR [IsIncludeDetails]