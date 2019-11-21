CREATE TABLE [dbo].[TransAndFinAppStatusHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NULL,
	[TransactionStatusId] [bigint] NULL,
	[FinanceStatusId] [bigint] NULL,
	[FinanceCompanyId] [bigint] NULL,
	[CreatedBy] [bigint] NULL,
	[CreateDate] [datetime] NULL,
	[IsAutomated] [bit] NULL,
 CONSTRAINT [PK_TransAndFinAppStatusHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransAndFinAppStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_TransAndFinAppStatusHistory_FinanceCompanyID] FOREIGN KEY([FinanceCompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[TransAndFinAppStatusHistory] CHECK CONSTRAINT [FK_TransAndFinAppStatusHistory_FinanceCompanyID]
GO
ALTER TABLE [dbo].[TransAndFinAppStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_TransAndFinAppStatusHistory_FinanceStatusId] FOREIGN KEY([FinanceStatusId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransAndFinAppStatusHistory] CHECK CONSTRAINT [FK_TransAndFinAppStatusHistory_FinanceStatusId]
GO
ALTER TABLE [dbo].[TransAndFinAppStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_TransAndFinAppStatusHistory_TransactionID] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransAndFinAppStatusHistory] CHECK CONSTRAINT [FK_TransAndFinAppStatusHistory_TransactionID]
GO
ALTER TABLE [dbo].[TransAndFinAppStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_TransAndFinAppStatusHistory_TransactionStatusId] FOREIGN KEY([TransactionStatusId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransAndFinAppStatusHistory] CHECK CONSTRAINT [FK_TransAndFinAppStatusHistory_TransactionStatusId]