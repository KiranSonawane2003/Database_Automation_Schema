CREATE TABLE [dbo].[TransactionProduct](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[ProductOptionId] [bigint] NULL,
	[ProductLineId] [bigint] NULL,
	[RetailPrice] [decimal](18, 2) NOT NULL,
	[IsPayByCash] [bit] NOT NULL,
	[NotOffered] [bit] NULL,
	[Decline] [bit] NULL,
	[NotApplicable] [bit] NULL,
	[AdditionalKM] [int] NULL,
	[AdditionalMonth] [int] NULL,
	[ExpiryKM] [int] NULL,
	[ExpiryMonth] [int] NULL,
	[IsInsuranceProduct] [bit] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[BodyConditionId] [bigint] NULL,
	[MechanicalConditionId] [bigint] NULL,
	[IsEditablePayover] [bit] NULL,
	[TransactionTypeId] [bigint] NULL,
	[Payover] [decimal](18, 2) NULL,
	[InsuranceFrom] [date] NULL,
	[InsuranceTo] [date] NULL,
	[CalculationTemplateAmount] [decimal](18, 4) NULL,
 CONSTRAINT [TransactionProduct_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionProduct]  WITH CHECK ADD  CONSTRAINT [FK_TransactionProduct_StaticValue_Body] FOREIGN KEY([BodyConditionId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionProduct] CHECK CONSTRAINT [FK_TransactionProduct_StaticValue_Body]
GO
ALTER TABLE [dbo].[TransactionProduct]  WITH CHECK ADD  CONSTRAINT [FK_TransactionProduct_StaticValue_Mech] FOREIGN KEY([MechanicalConditionId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionProduct] CHECK CONSTRAINT [FK_TransactionProduct_StaticValue_Mech]
GO
ALTER TABLE [dbo].[TransactionProduct]  WITH CHECK ADD  CONSTRAINT [TransactionProduct_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionProduct] CHECK CONSTRAINT [TransactionProduct_FK_Country]
GO
ALTER TABLE [dbo].[TransactionProduct]  WITH CHECK ADD  CONSTRAINT [TransactionProduct_FK_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO

ALTER TABLE [dbo].[TransactionProduct] CHECK CONSTRAINT [TransactionProduct_FK_Product]
GO
ALTER TABLE [dbo].[TransactionProduct]  WITH CHECK ADD  CONSTRAINT [TransactionProduct_FK_ProductLine] FOREIGN KEY([ProductLineId])
REFERENCES [dbo].[ProductLine] ([Id])
GO

ALTER TABLE [dbo].[TransactionProduct] CHECK CONSTRAINT [TransactionProduct_FK_ProductLine]
GO
ALTER TABLE [dbo].[TransactionProduct]  WITH CHECK ADD  CONSTRAINT [TransactionProduct_FK_ProductOption] FOREIGN KEY([ProductOptionId])
REFERENCES [dbo].[ProductOption] ([Id])
GO

ALTER TABLE [dbo].[TransactionProduct] CHECK CONSTRAINT [TransactionProduct_FK_ProductOption]
GO
ALTER TABLE [dbo].[TransactionProduct]  WITH CHECK ADD  CONSTRAINT [TransactionProduct_FK_StaticValueTransactionTypeId] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionProduct] CHECK CONSTRAINT [TransactionProduct_FK_StaticValueTransactionTypeId]
GO
ALTER TABLE [dbo].[TransactionProduct]  WITH NOCHECK ADD  CONSTRAINT [TransactionProduct_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionProduct] CHECK CONSTRAINT [TransactionProduct_FK_Transaction]
GO
ALTER TABLE [dbo].[TransactionProduct]  WITH CHECK ADD  CONSTRAINT [TransactionProduct_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionProduct] CHECK CONSTRAINT [TransactionProduct_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[TransactionProduct]  WITH CHECK ADD  CONSTRAINT [TransactionProduct_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionProduct] CHECK CONSTRAINT [TransactionProduct_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[TransactionProduct] ADD  CONSTRAINT [TransactionProduct_DF_PayByCash]  DEFAULT ((0)) FOR [IsPayByCash]
GO
ALTER TABLE [dbo].[TransactionProduct] ADD  CONSTRAINT [TransactionProduct_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionProduct] ADD  CONSTRAINT [TransactionProduct_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table for Product and product Option respective Transaction.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionProduct'