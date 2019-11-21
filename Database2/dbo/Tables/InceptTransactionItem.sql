CREATE TABLE [dbo].[InceptTransactionItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NULL,
	[InceptTransactionId] [bigint] NULL,
	[ItemTypeId] [bigint] NULL,
	[ItemTypeValue] [nvarchar](500) NULL,
	[ItemUseId] [bigint] NULL,
	[ItemUseValue] [nvarchar](500) NULL,
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
	[CountryValue] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedByValue] [nvarchar](500) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedByValue] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[MaxLoanApproved] [decimal](18, 8) NULL,
	[ItemInvoiceNo] [nvarchar](50) NULL,
	[ItemStockNo] [nvarchar](50) NULL,
	[ItemInvoiceDate] [datetime] NULL,
	[ItemInvoicePaidDate] [datetime] NULL,
	[ItemDeliveryDate] [datetime] NULL,
	[Deposit] [decimal](18, 8) NULL,
 CONSTRAINT [InceptTransactionItem_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InceptTransactionItem]  WITH CHECK ADD  CONSTRAINT [InceptTransactionItem_FK_InceptTransaction] FOREIGN KEY([InceptTransactionId])
REFERENCES [dbo].[InceptTransaction] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionItem] CHECK CONSTRAINT [InceptTransactionItem_FK_InceptTransaction]
GO
ALTER TABLE [dbo].[InceptTransactionItem] ADD  CONSTRAINT [DF_InceptTransactionItem_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[InceptTransactionItem] ADD  CONSTRAINT [DF_InceptTransactionItem_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]