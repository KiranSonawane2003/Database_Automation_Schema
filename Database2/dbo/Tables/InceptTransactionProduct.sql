CREATE TABLE [dbo].[InceptTransactionProduct](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RetailPrice] [decimal](18, 2) NULL,
	[IsPayByCash] [bit] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[TransactionId] [bigint] NOT NULL,
	[ProductTypeId] [bigint] NULL,
	[ProductTypeValue] [nvarchar](100) NULL,
	[ProductSubTypeId] [bigint] NULL,
	[ProductSubTypeValue] [nvarchar](100) NULL,
	[ProductId] [bigint] NULL,
	[ProductValue] [nvarchar](100) NULL,
	[ProductOptionId] [bigint] NULL,
	[ProductOptionValue] [nvarchar](100) NULL,
	[ProductLineId] [bigint] NULL,
	[NotOffered] [bit] NULL,
	[Decline] [bit] NULL,
	[NotApplicable] [bit] NULL,
	[AdditionalKM] [int] NULL,
	[AdditionalMonth] [int] NULL,
	[ExpiryKM] [int] NULL,
	[ExpiryMonth] [int] NULL,
	[IsInsuranceProduct] [bit] NULL,
	[BodyConditionId] [bigint] NULL,
	[BodyConditionValue] [nvarchar](50) NULL,
	[MechanicalConditionId] [bigint] NULL,
	[MechanicalConditionValue] [nvarchar](50) NULL,
	[CountryValue] [nvarchar](50) NULL,
	[CreatedByValue] [nvarchar](50) NULL,
	[ModifiedByValue] [nvarchar](50) NULL,
	[InceptTransactionId] [bigint] NOT NULL,
	[IsEditablePayover] [bit] NULL,
	[TransactionTypeId] [bigint] NULL,
	[Payover] [decimal](18, 2) NULL,
	[InsuranceFrom] [date] NULL,
	[InsuranceTo] [date] NULL,
	[CalculationTemplateAmount] [decimal](18, 4) NULL,
 CONSTRAINT [InceptTransactionProduct_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InceptTransactionProduct]  WITH NOCHECK ADD  CONSTRAINT [FK_InceptTransactionProduct_InceptTransaction] FOREIGN KEY([InceptTransactionId])
REFERENCES [dbo].[InceptTransaction] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionProduct] CHECK CONSTRAINT [FK_InceptTransactionProduct_InceptTransaction]
GO
ALTER TABLE [dbo].[InceptTransactionProduct] ADD  CONSTRAINT [InceptTransactionProduct_DF_PayByCash]  DEFAULT ((0)) FOR [IsPayByCash]
GO
ALTER TABLE [dbo].[InceptTransactionProduct] ADD  CONSTRAINT [InceptTransactionProduct_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[InceptTransactionProduct] ADD  CONSTRAINT [InceptTransactionProduct_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table stores the incepted transaction Product information.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InceptTransactionProduct'