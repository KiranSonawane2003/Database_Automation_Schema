CREATE TABLE [dbo].[InceptTransactionAccessories](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Details] [nvarchar](100) NULL,
	[RetailPrice] [decimal](18, 2) NULL,
	[IsPayByCash] [bit] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[IsAccessoriesSelected] [bit] NULL,
	[TransactionId] [bigint] NOT NULL,
	[AccessoriesId] [bigint] NULL,
	[AccessoriesValue] [nvarchar](100) NULL,
	[Cost] [decimal](18, 2) NULL,
	[CountryValue] [nvarchar](50) NULL,
	[CreatedByValue] [nvarchar](50) NULL,
	[ModifiedByValue] [nvarchar](50) NULL,
	[InceptTransactionId] [bigint] NOT NULL,
 CONSTRAINT [InceptTransactionAccessories_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InceptTransactionAccessories]  WITH NOCHECK ADD  CONSTRAINT [FK_InceptTransactionAccessories_InceptTransaction] FOREIGN KEY([InceptTransactionId])
REFERENCES [dbo].[InceptTransaction] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionAccessories] CHECK CONSTRAINT [FK_InceptTransactionAccessories_InceptTransaction]
GO
ALTER TABLE [dbo].[InceptTransactionAccessories] ADD  CONSTRAINT [InceptTransactionAccessories_DF_PayByCash]  DEFAULT ((0)) FOR [IsPayByCash]
GO
ALTER TABLE [dbo].[InceptTransactionAccessories] ADD  CONSTRAINT [InceptTransactionAccessories_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[InceptTransactionAccessories] ADD  CONSTRAINT [InceptTransactionAccessories_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table stores accessories related to transaction.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InceptTransactionAccessories'