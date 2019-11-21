CREATE TABLE [dbo].[TransactionItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NULL,
	[ItemTypeId] [bigint] NULL,
	[ItemUseId] [bigint] NULL,
	[ItemDescription] [nvarchar](2000) NULL,
	[ItemCode] [nvarchar](100) NULL,
	[ItemSerialNumber] [nvarchar](100) NULL,
	[ItemCost] [decimal](18, 8) NULL,
	[ItemRetailValue] [decimal](18, 8) NULL,
	[ItemQuantity] [int] NULL,
	[TotalItemsRetailValue] [decimal](18, 8) NULL,
	[LoanAmountAppliedFor] [decimal](18, 8) NULL,
	[Discount] [decimal](18, 8) NULL,
	[Notes] [nvarchar](2000) NULL,
	[IsActive] [bit] NOT NULL,
	[CountryId] [bigint] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[MaxLoanApproved] [decimal](18, 8) NULL,
	[ItemInvoiceNo] [nvarchar](50) NULL,
	[ItemStockNo] [nvarchar](50) NULL,
	[ItemInvoiceDate] [datetime] NULL,
	[ItemInvoicePaidDate] [datetime] NULL,
	[ItemDeliveryDate] [datetime] NULL,
	[IncludeInLead] [bit] NULL,
	[Deposit] [decimal](18, 8) NULL,
 CONSTRAINT [TransactionItem_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionItem]  WITH CHECK ADD  CONSTRAINT [TransactionItem_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionItem] CHECK CONSTRAINT [TransactionItem_FK_Country]
GO
ALTER TABLE [dbo].[TransactionItem]  WITH CHECK ADD  CONSTRAINT [TransactionItem_FK_ItemTypes] FOREIGN KEY([ItemTypeId])
REFERENCES [dbo].[ItemTypes] ([Id])
GO

ALTER TABLE [dbo].[TransactionItem] CHECK CONSTRAINT [TransactionItem_FK_ItemTypes]
GO
ALTER TABLE [dbo].[TransactionItem]  WITH CHECK ADD  CONSTRAINT [TransactionItem_FK_ItemUse] FOREIGN KEY([ItemUseId])
REFERENCES [dbo].[ItemUse] ([Id])
GO

ALTER TABLE [dbo].[TransactionItem] CHECK CONSTRAINT [TransactionItem_FK_ItemUse]
GO
ALTER TABLE [dbo].[TransactionItem]  WITH CHECK ADD  CONSTRAINT [TransactionItem_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionItem] CHECK CONSTRAINT [TransactionItem_FK_Transaction]
GO
ALTER TABLE [dbo].[TransactionItem]  WITH CHECK ADD  CONSTRAINT [TransactionItem_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionItem] CHECK CONSTRAINT [TransactionItem_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[TransactionItem]  WITH CHECK ADD  CONSTRAINT [TransactionItem_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionItem] CHECK CONSTRAINT [TransactionItem_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[TransactionItem] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionItem] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]