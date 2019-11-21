CREATE TABLE [dbo].[TransactionAccessories](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NULL,
	[AccessoriesId] [bigint] NULL,
	[Details] [nvarchar](200) NULL,
	[IsAccessorySelected] [bit] NULL,
	[IsPayByCash] [bit] NULL,
	[Cost] [decimal](18, 2) NULL,
	[RetailPrice] [decimal](18, 2) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CostGroup] [int] NULL,
 CONSTRAINT [TransactionAccessories_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionAccessories]  WITH NOCHECK ADD  CONSTRAINT [TransactionAccessories_FK_Accessories] FOREIGN KEY([AccessoriesId])
REFERENCES [dbo].[Accessories] ([Id])
GO

ALTER TABLE [dbo].[TransactionAccessories] CHECK CONSTRAINT [TransactionAccessories_FK_Accessories]
GO
ALTER TABLE [dbo].[TransactionAccessories]  WITH NOCHECK ADD  CONSTRAINT [TransactionAccessories_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionAccessories] CHECK CONSTRAINT [TransactionAccessories_FK_Country]
GO
ALTER TABLE [dbo].[TransactionAccessories]  WITH NOCHECK ADD  CONSTRAINT [TransactionAccessories_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionAccessories] CHECK CONSTRAINT [TransactionAccessories_FK_Transaction]
GO
ALTER TABLE [dbo].[TransactionAccessories]  WITH NOCHECK ADD  CONSTRAINT [TransactionAccessories_FK_UsersCreaatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionAccessories] CHECK CONSTRAINT [TransactionAccessories_FK_UsersCreaatedBy]
GO
ALTER TABLE [dbo].[TransactionAccessories]  WITH NOCHECK ADD  CONSTRAINT [TransactionAccessories_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionAccessories] CHECK CONSTRAINT [TransactionAccessories_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[TransactionAccessories] ADD  CONSTRAINT [TransactionAccessories_DF_PayByCash]  DEFAULT ((0)) FOR [IsPayByCash]
GO
ALTER TABLE [dbo].[TransactionAccessories] ADD  CONSTRAINT [TransactionAccessories_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionAccessories] ADD  CONSTRAINT [TransactionAccessories_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table is for store accessories related with transaction.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionAccessories'