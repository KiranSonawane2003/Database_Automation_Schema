CREATE TABLE [dbo].[UserTransactionMapping](
	[Id] [uniqueidentifier] NOT NULL,
	[UserID] [int] NULL,
	[TransactionID] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_UserTransactionMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserTransactionMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserTransactionMapping_TransactionID] FOREIGN KEY([TransactionID])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[UserTransactionMapping] CHECK CONSTRAINT [FK_UserTransactionMapping_TransactionID]
GO
ALTER TABLE [dbo].[UserTransactionMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserTransactionMapping_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UserTransactionMapping] CHECK CONSTRAINT [FK_UserTransactionMapping_UserID]
GO
ALTER TABLE [dbo].[UserTransactionMapping] ADD  CONSTRAINT [PK_SerialID]  DEFAULT (newid()) FOR [Id]