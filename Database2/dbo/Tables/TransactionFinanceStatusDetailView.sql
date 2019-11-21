CREATE TABLE [dbo].[TransactionFinanceStatusDetailView](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionFinanceStatusViewId] [bigint] NOT NULL,
	[FinanceStatusId] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TransactionFinanceStatusDetailView] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionFinanceStatusDetailView]  WITH CHECK ADD  CONSTRAINT [FK_TransactionFinanceStatusDetailView_TransactionFinanceStatusView] FOREIGN KEY([TransactionFinanceStatusViewId])
REFERENCES [dbo].[TransactionFinanceStatusView] ([Id])
GO

ALTER TABLE [dbo].[TransactionFinanceStatusDetailView] CHECK CONSTRAINT [FK_TransactionFinanceStatusDetailView_TransactionFinanceStatusView]
GO
ALTER TABLE [dbo].[TransactionFinanceStatusDetailView]  WITH CHECK ADD  CONSTRAINT [FK_TransactionFinanceStatusDetailView_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionFinanceStatusDetailView] CHECK CONSTRAINT [FK_TransactionFinanceStatusDetailView_Users]
GO
ALTER TABLE [dbo].[TransactionFinanceStatusDetailView]  WITH CHECK ADD  CONSTRAINT [FK_TransactionFinanceStatusDetailView_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionFinanceStatusDetailView] CHECK CONSTRAINT [FK_TransactionFinanceStatusDetailView_Users1]