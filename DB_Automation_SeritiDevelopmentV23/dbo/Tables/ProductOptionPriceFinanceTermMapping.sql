CREATE TABLE [dbo].[ProductOptionPriceFinanceTermMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductOptionPriceId] [bigint] NOT NULL,
	[TermId] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [ProductOptionPriceFinanceTermMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductOptionPriceFinanceTermMapping]  WITH CHECK ADD  CONSTRAINT [ProductOptionPriceFinanceTermMapping_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPriceFinanceTermMapping] CHECK CONSTRAINT [ProductOptionPriceFinanceTermMapping_FK_Country]
GO
ALTER TABLE [dbo].[ProductOptionPriceFinanceTermMapping]  WITH CHECK ADD  CONSTRAINT [ProductOptionPriceFinanceTermMapping_FK_FinanceTerm] FOREIGN KEY([TermId])
REFERENCES [dbo].[FinanceTerm] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPriceFinanceTermMapping] CHECK CONSTRAINT [ProductOptionPriceFinanceTermMapping_FK_FinanceTerm]
GO
ALTER TABLE [dbo].[ProductOptionPriceFinanceTermMapping]  WITH CHECK ADD  CONSTRAINT [ProductOptionPriceFinanceTermMapping_FK_ProductOptionPrice] FOREIGN KEY([ProductOptionPriceId])
REFERENCES [dbo].[ProductOptionPrice] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPriceFinanceTermMapping] CHECK CONSTRAINT [ProductOptionPriceFinanceTermMapping_FK_ProductOptionPrice]
GO
ALTER TABLE [dbo].[ProductOptionPriceFinanceTermMapping]  WITH CHECK ADD  CONSTRAINT [ProductOptionPriceFinanceTermMapping_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPriceFinanceTermMapping] CHECK CONSTRAINT [ProductOptionPriceFinanceTermMapping_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ProductOptionPriceFinanceTermMapping]  WITH CHECK ADD  CONSTRAINT [ProductOptionPriceFinanceTermMapping_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPriceFinanceTermMapping] CHECK CONSTRAINT [ProductOptionPriceFinanceTermMapping_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ProductOptionPriceFinanceTermMapping] ADD  CONSTRAINT [DF_ProductOptionPriceFinanceTermMapping_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductOptionPriceFinanceTermMapping] ADD  CONSTRAINT [DF_ProductOptionPriceFinanceTermMapping_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]