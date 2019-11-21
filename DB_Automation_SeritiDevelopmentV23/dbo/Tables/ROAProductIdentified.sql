CREATE TABLE [dbo].[ROAProductIdentified](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[ProductTypeId] [bigint] NOT NULL,
	[ProductSubTypeId] [bigint] NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[ProductIdentifiedValue] [bit] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[IsRecordofTransaction] [bit] NULL,
 CONSTRAINT [PK_ROAProductIdentified] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ROAProductIdentified]  WITH CHECK ADD  CONSTRAINT [FK_ROAProductIdentified_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ROAProductIdentified] CHECK CONSTRAINT [FK_ROAProductIdentified_CreatedBy]
GO
ALTER TABLE [dbo].[ROAProductIdentified]  WITH CHECK ADD  CONSTRAINT [FK_ROAProductIdentified_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ROAProductIdentified] CHECK CONSTRAINT [FK_ROAProductIdentified_ModifiedBy]
GO
ALTER TABLE [dbo].[ROAProductIdentified]  WITH CHECK ADD  CONSTRAINT [FK_ROAProductIdentified_ProductSubType] FOREIGN KEY([ProductSubTypeId])
REFERENCES [dbo].[ProductSubType] ([Id])
GO

ALTER TABLE [dbo].[ROAProductIdentified] CHECK CONSTRAINT [FK_ROAProductIdentified_ProductSubType]
GO
ALTER TABLE [dbo].[ROAProductIdentified]  WITH CHECK ADD  CONSTRAINT [FK_ROAProductIdentified_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO

ALTER TABLE [dbo].[ROAProductIdentified] CHECK CONSTRAINT [FK_ROAProductIdentified_ProductType]
GO
ALTER TABLE [dbo].[ROAProductIdentified]  WITH CHECK ADD  CONSTRAINT [FK_ROAProductIdentified_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[ROAProductIdentified] CHECK CONSTRAINT [FK_ROAProductIdentified_Transaction]