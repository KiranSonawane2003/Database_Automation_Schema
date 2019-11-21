CREATE TABLE [dbo].[TransactionDebitBankAccount](
	[Id] [bigint] NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[AccountType] [int] NOT NULL,
	[BankName] [nvarchar](100) NOT NULL,
	[BranchCode] [nvarchar](100) NOT NULL,
	[AccountNumber] [nvarchar](100) NOT NULL,
	[AccountHolderName] [nvarchar](200) NOT NULL,
	[AccountOpenDate] [date] NULL,
	[IsPrimaryAccount] [bit] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [TransactionDebitBankAccount_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionDebitBankAccount]  WITH NOCHECK ADD  CONSTRAINT [TransactionDebitBankAccount_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionDebitBankAccount] CHECK CONSTRAINT [TransactionDebitBankAccount_FK_Country]
GO
ALTER TABLE [dbo].[TransactionDebitBankAccount]  WITH NOCHECK ADD  CONSTRAINT [TransactionDebitBankAccount_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionDebitBankAccount] CHECK CONSTRAINT [TransactionDebitBankAccount_FK_Transaction]
GO
ALTER TABLE [dbo].[TransactionDebitBankAccount]  WITH NOCHECK ADD  CONSTRAINT [TransactionDebitBankAccount_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionDebitBankAccount] CHECK CONSTRAINT [TransactionDebitBankAccount_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[TransactionDebitBankAccount]  WITH NOCHECK ADD  CONSTRAINT [TransactionDebitBankAccount_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionDebitBankAccount] CHECK CONSTRAINT [TransactionDebitBankAccount_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[TransactionDebitBankAccount] ADD  CONSTRAINT [DF_TransactionDebitBankAccount_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionDebitBankAccount] ADD  CONSTRAINT [DF_TransactionDebitBankAccount_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table contains debit accounts of transaction for finance application' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionDebitBankAccount'