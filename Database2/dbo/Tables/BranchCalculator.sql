CREATE TABLE [dbo].[BranchCalculator](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BranchId] [bigint] NULL,
	[IsCalculatorActive] [bit] NULL,
	[PurchasePriceMin] [nvarchar](max) NULL,
	[PurchasePriceMax] [nvarchar](max) NULL,
	[PurchasePriceMaxLength] [nvarchar](max) NULL,
	[DepositMin] [nvarchar](max) NULL,
	[DepositMax] [nvarchar](max) NULL,
	[DepositMaxLength] [nvarchar](max) NULL,
	[InterestRateMin] [nvarchar](max) NULL,
	[InterestRateMax] [nvarchar](max) NULL,
	[InterestRateMaxLength] [nvarchar](max) NULL,
	[BalloonPercentageMin] [nvarchar](max) NULL,
	[BalloonPercentageMax] [nvarchar](max) NULL,
	[BalloonPercentageMaxLength] [nvarchar](max) NULL,
	[BalloonAmtMin] [nvarchar](max) NULL,
	[BalloonAmtMax] [nvarchar](max) NULL,
	[BalloonAmtMaxLength] [nvarchar](max) NULL,
	[AdditionalFeeAmount] [nvarchar](max) NULL,
	[AdditionalFeePercentage] [nvarchar](max) NULL,
	[DisplayMessage] [nvarchar](max) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[IsBalloonPercentage] [bit] NULL,
	[IsBalloonAmt] [bit] NULL,
	[PaymentType] [int] NULL,
 CONSTRAINT [BranchCalculator_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[BranchCalculator]  WITH NOCHECK ADD  CONSTRAINT [BranchCalculator_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[BranchCalculator] CHECK CONSTRAINT [BranchCalculator_FK_Branch]
GO
ALTER TABLE [dbo].[BranchCalculator]  WITH NOCHECK ADD  CONSTRAINT [BranchCalculator_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[BranchCalculator] CHECK CONSTRAINT [BranchCalculator_FK_Country]
GO
ALTER TABLE [dbo].[BranchCalculator]  WITH NOCHECK ADD  CONSTRAINT [BranchCalculator_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[BranchCalculator] CHECK CONSTRAINT [BranchCalculator_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[BranchCalculator]  WITH NOCHECK ADD  CONSTRAINT [BranchCalculator_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[BranchCalculator] CHECK CONSTRAINT [BranchCalculator_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[BranchCalculator] ADD  CONSTRAINT [BranchCalculator_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[BranchCalculator] ADD  CONSTRAINT [BranchCalculator_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BranchCalculator] ADD  DEFAULT ((0)) FOR [IsBalloonPercentage]
GO
ALTER TABLE [dbo].[BranchCalculator] ADD  DEFAULT ((0)) FOR [IsBalloonAmt]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table associated calculator settingd with branch.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BranchCalculator'