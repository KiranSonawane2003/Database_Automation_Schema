CREATE TABLE [dbo].[ProductInvoiceCompany](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[InvoiceCompany] [nvarchar](100) NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [ProductInvoiceCompany_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductInvoiceCompany]  WITH NOCHECK ADD  CONSTRAINT [ProductInvoiceCompany_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ProductInvoiceCompany] CHECK CONSTRAINT [ProductInvoiceCompany_FK_Country]
GO
ALTER TABLE [dbo].[ProductInvoiceCompany]  WITH NOCHECK ADD  CONSTRAINT [ProductInvoiceCompany_FK_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO

ALTER TABLE [dbo].[ProductInvoiceCompany] CHECK CONSTRAINT [ProductInvoiceCompany_FK_Product]
GO
ALTER TABLE [dbo].[ProductInvoiceCompany]  WITH NOCHECK ADD  CONSTRAINT [ProductInvoiceCompany_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductInvoiceCompany] CHECK CONSTRAINT [ProductInvoiceCompany_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ProductInvoiceCompany]  WITH NOCHECK ADD  CONSTRAINT [ProductInvoiceCompany_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductInvoiceCompany] CHECK CONSTRAINT [ProductInvoiceCompany_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ProductInvoiceCompany] ADD  CONSTRAINT [ProductInvoiceCompany_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductInvoiceCompany] ADD  CONSTRAINT [ProductInvoiceCompany_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table is master for Invoice Company.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductInvoiceCompany'