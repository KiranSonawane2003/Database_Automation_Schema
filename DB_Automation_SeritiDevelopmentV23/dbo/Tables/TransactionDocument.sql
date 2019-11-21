CREATE TABLE [dbo].[TransactionDocument](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[DocumentCategoryId] [bigint] NOT NULL,
	[DocumentDescription] [nvarchar](500) NULL,
	[DocumentPath] [nvarchar](300) NULL,
	[DocumentName] [nvarchar](200) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[DocumentSize] [nvarchar](50) NULL,
	[FinanceApplicationId] [bigint] NULL,
	[LatestInd] [bit] NULL,
	[ElectronicallySignedInd] [bit] NULL,
	[IsAPIDocument] [bit] NULL,
	[DocumentSource] [nvarchar](max) NULL,
	[IsBankerDocument] [bit] NULL,
 CONSTRAINT [TransactionDocument_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionDocument]  WITH CHECK ADD  CONSTRAINT [FK_TransactionDocument_TransactionFinanceApplication] FOREIGN KEY([FinanceApplicationId])
REFERENCES [dbo].[TransactionFinanceApplication] ([Id])
GO

ALTER TABLE [dbo].[TransactionDocument] CHECK CONSTRAINT [FK_TransactionDocument_TransactionFinanceApplication]
GO
ALTER TABLE [dbo].[TransactionDocument]  WITH NOCHECK ADD  CONSTRAINT [TransactionDocument_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionDocument] CHECK CONSTRAINT [TransactionDocument_FK_Country]
GO
ALTER TABLE [dbo].[TransactionDocument]  WITH NOCHECK ADD  CONSTRAINT [TransactionDocument_FK_DocumentCategory] FOREIGN KEY([DocumentCategoryId])
REFERENCES [dbo].[DocumentCategory] ([Id])
GO

ALTER TABLE [dbo].[TransactionDocument] CHECK CONSTRAINT [TransactionDocument_FK_DocumentCategory]
GO
ALTER TABLE [dbo].[TransactionDocument]  WITH NOCHECK ADD  CONSTRAINT [TransactionDocument_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionDocument] CHECK CONSTRAINT [TransactionDocument_FK_Transaction]
GO
ALTER TABLE [dbo].[TransactionDocument]  WITH NOCHECK ADD  CONSTRAINT [TransactionDocument_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionDocument] CHECK CONSTRAINT [TransactionDocument_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[TransactionDocument]  WITH NOCHECK ADD  CONSTRAINT [TransactionDocument_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionDocument] CHECK CONSTRAINT [TransactionDocument_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[TransactionDocument] ADD  CONSTRAINT [DF_TransactionDocument_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionDocument] ADD  CONSTRAINT [DF_TransactionDocument_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TransactionDocument] ADD  DEFAULT ((0)) FOR [IsAPIDocument]