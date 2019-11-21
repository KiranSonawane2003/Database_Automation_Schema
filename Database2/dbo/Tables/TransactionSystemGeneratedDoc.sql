CREATE TABLE [dbo].[TransactionSystemGeneratedDoc](
	[Id] [bigint] NOT NULL,
	[TransactionId] [bigint] NULL,
	[DocumentType] [nvarchar](200) NULL,
	[DocumentName] [nvarchar](200) NULL,
	[DocumentPath] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [TransactionSystemGeneratedDoc_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionSystemGeneratedDoc]  WITH NOCHECK ADD  CONSTRAINT [TransactionSystemGeneratedDoc_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionSystemGeneratedDoc] CHECK CONSTRAINT [TransactionSystemGeneratedDoc_FK_Transaction]
GO
ALTER TABLE [dbo].[TransactionSystemGeneratedDoc]  WITH NOCHECK ADD  CONSTRAINT [TransactionSystemGeneratedDoc_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionSystemGeneratedDoc] CHECK CONSTRAINT [TransactionSystemGeneratedDoc_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[TransactionSystemGeneratedDoc]  WITH NOCHECK ADD  CONSTRAINT [TransactionSystemGeneratedDoc_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionSystemGeneratedDoc] CHECK CONSTRAINT [TransactionSystemGeneratedDoc_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[TransactionSystemGeneratedDoc] ADD  CONSTRAINT [DF_TransactionSystemGeneratedDoc_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionSystemGeneratedDoc] ADD  CONSTRAINT [DF_TransactionSystemGeneratedDoc_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]