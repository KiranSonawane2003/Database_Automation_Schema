CREATE TABLE [dbo].[ProductOptionPriceVehUseMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductOptionPriceId] [bigint] NOT NULL,
	[VehicleUseId] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_ProductOptionPriceVehUseMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductOptionPriceVehUseMapping]  WITH CHECK ADD  CONSTRAINT [FK_ProductOptionPriceVehUseMapping_ProductOptionPrice] FOREIGN KEY([ProductOptionPriceId])
REFERENCES [dbo].[ProductOptionPrice] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPriceVehUseMapping] CHECK CONSTRAINT [FK_ProductOptionPriceVehUseMapping_ProductOptionPrice]
GO
ALTER TABLE [dbo].[ProductOptionPriceVehUseMapping]  WITH CHECK ADD  CONSTRAINT [FK_ProductOptionPriceVehUseMapping_StaticValue] FOREIGN KEY([VehicleUseId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPriceVehUseMapping] CHECK CONSTRAINT [FK_ProductOptionPriceVehUseMapping_StaticValue]
GO
ALTER TABLE [dbo].[ProductOptionPriceVehUseMapping] ADD  CONSTRAINT [DF_ProductOptionPriceVehUseMapping_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductOptionPriceVehUseMapping] ADD  CONSTRAINT [DF_ProductOptionPriceVehUseMapping_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]