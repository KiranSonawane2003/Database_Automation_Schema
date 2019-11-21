CREATE TABLE [dbo].[TransactionContactIncomeAndExpenditureMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ContactID] [bigint] NULL,
	[IncomeAndExpenditureID] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TransactionContactIncomeAndExpenditureMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionContactIncomeAndExpenditureMapping]  WITH CHECK ADD  CONSTRAINT [TransactionContactIncomeAndExpenditureMapping_FK_ContactID] FOREIGN KEY([ContactID])
REFERENCES [dbo].[TransactionContact] ([Id])
GO

ALTER TABLE [dbo].[TransactionContactIncomeAndExpenditureMapping] CHECK CONSTRAINT [TransactionContactIncomeAndExpenditureMapping_FK_ContactID]
GO
ALTER TABLE [dbo].[TransactionContactIncomeAndExpenditureMapping]  WITH CHECK ADD  CONSTRAINT [TransactionContactIncomeAndExpenditureMapping_FK_IncomeExpendID] FOREIGN KEY([IncomeAndExpenditureID])
REFERENCES [dbo].[TransactionIncomeAndExpenditure] ([Id])
GO

ALTER TABLE [dbo].[TransactionContactIncomeAndExpenditureMapping] CHECK CONSTRAINT [TransactionContactIncomeAndExpenditureMapping_FK_IncomeExpendID]
GO
ALTER TABLE [dbo].[TransactionContactIncomeAndExpenditureMapping] ADD  DEFAULT ((1)) FOR [IsActive]