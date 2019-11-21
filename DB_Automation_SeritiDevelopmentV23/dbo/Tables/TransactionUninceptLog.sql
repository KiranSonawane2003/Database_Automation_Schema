CREATE TABLE [dbo].[TransactionUninceptLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[InceptTransactionId] [bigint] NULL,
	[Action] [nvarchar](50) NULL,
	[Reason] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedByValue] [nvarchar](200) NULL,
 CONSTRAINT [PK_TransactionUninceptLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionUninceptLog]  WITH CHECK ADD  CONSTRAINT [TransactionUninceptLog_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionUninceptLog] CHECK CONSTRAINT [TransactionUninceptLog_FK_Transaction]
GO
ALTER TABLE [dbo].[TransactionUninceptLog]  WITH CHECK ADD  CONSTRAINT [TransactionUninceptLog_FK_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionUninceptLog] CHECK CONSTRAINT [TransactionUninceptLog_FK_Users]
GO
ALTER TABLE [dbo].[TransactionUninceptLog] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]