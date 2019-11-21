CREATE TABLE [dbo].[TransactionIncomeAndExpenditureIncomeSourceMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionIncomeAndExpenditureId] [bigint] NULL,
	[IncomeSourceId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_TransactionIncomeAndExpenditureIncomeSourceMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionIncomeAndExpenditureIncomeSourceMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransactionIncomeAndExpenditureIncomeSourceMapping_StaticValue] FOREIGN KEY([IncomeSourceId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionIncomeAndExpenditureIncomeSourceMapping] CHECK CONSTRAINT [FK_TransactionIncomeAndExpenditureIncomeSourceMapping_StaticValue]
GO
ALTER TABLE [dbo].[TransactionIncomeAndExpenditureIncomeSourceMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransactionIncomeAndExpenditureIncomeSourceMapping_TransactionIncomeAndExpenditure] FOREIGN KEY([TransactionIncomeAndExpenditureId])
REFERENCES [dbo].[TransactionIncomeAndExpenditure] ([Id])
GO

ALTER TABLE [dbo].[TransactionIncomeAndExpenditureIncomeSourceMapping] CHECK CONSTRAINT [FK_TransactionIncomeAndExpenditureIncomeSourceMapping_TransactionIncomeAndExpenditure]
GO
ALTER TABLE [dbo].[TransactionIncomeAndExpenditureIncomeSourceMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransactionIncomeAndExpenditureIncomeSourceMapping_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionIncomeAndExpenditureIncomeSourceMapping] CHECK CONSTRAINT [FK_TransactionIncomeAndExpenditureIncomeSourceMapping_Users]
GO
ALTER TABLE [dbo].[TransactionIncomeAndExpenditureIncomeSourceMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransactionIncomeAndExpenditureIncomeSourceMapping_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionIncomeAndExpenditureIncomeSourceMapping] CHECK CONSTRAINT [FK_TransactionIncomeAndExpenditureIncomeSourceMapping_Users1]
GO
ALTER TABLE [dbo].[TransactionIncomeAndExpenditureIncomeSourceMapping] ADD  CONSTRAINT [DF_TransactionIncomeAndExpenditureIncomeSourceMapping_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionIncomeAndExpenditureIncomeSourceMapping] ADD  CONSTRAINT [DF_TransactionIncomeAndExpenditureIncomeSourceMapping_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]