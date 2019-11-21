CREATE TABLE [dbo].[TransactionItemHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ApplicationHistoryId] [bigint] NOT NULL,
	[ItemId] [bigint] NOT NULL,
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
 CONSTRAINT [PK_TransactionItemHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionItemHistory] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionItemHistory] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]