CREATE TABLE [dbo].[TransactionUpdateLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[FileName] [nvarchar](100) NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TransactionUpdateLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionUpdateLog]  WITH CHECK ADD  CONSTRAINT [FK_TransactionUpdateLog_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionUpdateLog] CHECK CONSTRAINT [FK_TransactionUpdateLog_Transaction]
GO
ALTER TABLE [dbo].[TransactionUpdateLog]  WITH CHECK ADD  CONSTRAINT [FK_TransactionUpdateLog_Users] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionUpdateLog] CHECK CONSTRAINT [FK_TransactionUpdateLog_Users]