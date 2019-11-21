CREATE TABLE [dbo].[ProductOptionPrice](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductOptionId] [bigint] NOT NULL,
	[IsDepositInd] [bit] NOT NULL,
	[IsFinanceTermInd] [bit] NOT NULL,
	[TermId] [bigint] NULL,
	[MaximumTermId] [bigint] NULL,
	[MaximumTermQualifier] [int] NULL,
	[DefaultCashTermId] [bigint] NULL,
	[MinimumCoverAmount] [decimal](18, 2) NULL,
	[MaximumCoverAmount] [decimal](18, 2) NULL,
	[MaximumCoverQualifier] [int] NULL,
	[VehicleCondition] [int] NULL,
	[VehiclePurpose] [int] NULL,
	[MinimumPremiumPayable] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[PayoverAmount] [decimal](18, 2) NULL,
	[PayoverPercentage] [decimal](18, 2) NULL,
	[AdminFee] [decimal](18, 2) NULL,
	[AdminPercentage] [decimal](18, 2) NULL,
	[BinderFee] [decimal](18, 2) NULL,
	[BinderPercentage] [decimal](18, 2) NULL,
	[CollectionFee] [decimal](18, 2) NULL,
	[CollectionPercentage] [decimal](18, 2) NULL,
	[CommissionAmount] [decimal](18, 2) NULL,
	[CommissionPercentage] [decimal](18, 2) NULL,
	[DealerDocumentationFee] [decimal](18, 2) NULL,
	[DealerDocPercentage] [decimal](18, 2) NULL,
	[InspectionFee] [decimal](18, 2) NULL,
	[InspectionPercentage] [decimal](18, 2) NULL,
	[PolicyFee] [decimal](18, 2) NULL,
	[PolicyPercentage] [decimal](18, 2) NULL,
	[ValuationFee] [decimal](18, 2) NULL,
	[ValuationPercentage] [decimal](18, 2) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[RatePercentage] [decimal](18, 6) NULL,
	[MinimumPrice] [decimal](18, 2) NULL,
	[IsVatIndicator] [bit] NULL,
	[CalculationTemplate] [int] NULL,
	[AllowAutoSelect] [bit] NULL,
	[CostPercentage] [decimal](18, 6) NULL,
 CONSTRAINT [ProductOptionPrice_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductOptionPrice]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionPrice_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPrice] CHECK CONSTRAINT [ProductOptionPrice_FK_Country]
GO
ALTER TABLE [dbo].[ProductOptionPrice]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionPrice_FK_FinanceTermDefaultCashTerm] FOREIGN KEY([DefaultCashTermId])
REFERENCES [dbo].[FinanceTerm] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPrice] CHECK CONSTRAINT [ProductOptionPrice_FK_FinanceTermDefaultCashTerm]
GO
ALTER TABLE [dbo].[ProductOptionPrice]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionPrice_FK_FinanceTermMaxTerm] FOREIGN KEY([MaximumTermId])
REFERENCES [dbo].[FinanceTerm] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPrice] CHECK CONSTRAINT [ProductOptionPrice_FK_FinanceTermMaxTerm]
GO
ALTER TABLE [dbo].[ProductOptionPrice]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionPrice_FK_FinanceTermTerm] FOREIGN KEY([TermId])
REFERENCES [dbo].[FinanceTerm] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPrice] CHECK CONSTRAINT [ProductOptionPrice_FK_FinanceTermTerm]
GO
ALTER TABLE [dbo].[ProductOptionPrice]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionPrice_FK_ProductOption] FOREIGN KEY([ProductOptionId])
REFERENCES [dbo].[ProductOption] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPrice] CHECK CONSTRAINT [ProductOptionPrice_FK_ProductOption]
GO
ALTER TABLE [dbo].[ProductOptionPrice]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionPrice_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPrice] CHECK CONSTRAINT [ProductOptionPrice_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ProductOptionPrice]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionPrice_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionPrice] CHECK CONSTRAINT [ProductOptionPrice_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ProductOptionPrice] ADD  CONSTRAINT [DF_ProductOptionPrice_IsDepositInd]  DEFAULT ((0)) FOR [IsDepositInd]
GO
ALTER TABLE [dbo].[ProductOptionPrice] ADD  CONSTRAINT [DF_ProductOptionPrice_IsFinanceTermInd]  DEFAULT ((0)) FOR [IsFinanceTermInd]
GO
ALTER TABLE [dbo].[ProductOptionPrice] ADD  CONSTRAINT [ProductOptionPrice_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductOptionPrice] ADD  CONSTRAINT [ProductOptionPrice_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store product option price inside product option.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductOptionPrice'