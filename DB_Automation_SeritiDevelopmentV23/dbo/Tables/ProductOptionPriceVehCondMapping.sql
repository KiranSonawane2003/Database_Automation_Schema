CREATE TABLE [dbo].[ProductOptionPriceVehCondMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductOptionPriceId] [bigint] NOT NULL,
	[VehicleConditionId] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [ProductOptionPriceVehCondMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductOptionPriceVehCondMapping]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionPriceVehCondMapping_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPriceVehCondMapping] CHECK CONSTRAINT [ProductOptionPriceVehCondMapping_FK_Country]
GO
ALTER TABLE [dbo].[ProductOptionPriceVehCondMapping]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionPriceVehCondMapping_FK_ProductOptionPrice] FOREIGN KEY([ProductOptionPriceId])
REFERENCES [dbo].[ProductOptionPrice] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPriceVehCondMapping] CHECK CONSTRAINT [ProductOptionPriceVehCondMapping_FK_ProductOptionPrice]
GO
ALTER TABLE [dbo].[ProductOptionPriceVehCondMapping]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionPriceVehCondMapping_FK_StaticValueVehicleCondition] FOREIGN KEY([VehicleConditionId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPriceVehCondMapping] CHECK CONSTRAINT [ProductOptionPriceVehCondMapping_FK_StaticValueVehicleCondition]
GO
ALTER TABLE [dbo].[ProductOptionPriceVehCondMapping]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionPriceVehCondMapping_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPriceVehCondMapping] CHECK CONSTRAINT [ProductOptionPriceVehCondMapping_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ProductOptionPriceVehCondMapping]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionPriceVehCondMapping_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPriceVehCondMapping] CHECK CONSTRAINT [ProductOptionPriceVehCondMapping_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ProductOptionPriceVehCondMapping] ADD  CONSTRAINT [DF__ProductOp__Creat__45C18905]  DEFAULT (getutcdate()) FOR [CreatedDate]