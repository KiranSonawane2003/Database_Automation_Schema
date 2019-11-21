CREATE TABLE [dbo].[PackageProduct](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PackageId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[ProductOptionId] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[IsRequired] [bit] NOT NULL,
	[IsRecommended] [bit] NOT NULL,
	[IsNonEditable] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PackageProduct_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PackageProduct]  WITH NOCHECK ADD  CONSTRAINT [PackageProduct_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[PackageProduct] CHECK CONSTRAINT [PackageProduct_FK_Country]
GO
ALTER TABLE [dbo].[PackageProduct]  WITH NOCHECK ADD  CONSTRAINT [PackageProduct_FK_Packages] FOREIGN KEY([PackageId])
REFERENCES [dbo].[Package] ([Id])
GO

ALTER TABLE [dbo].[PackageProduct] CHECK CONSTRAINT [PackageProduct_FK_Packages]
GO
ALTER TABLE [dbo].[PackageProduct]  WITH NOCHECK ADD  CONSTRAINT [PackageProduct_FK_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO

ALTER TABLE [dbo].[PackageProduct] CHECK CONSTRAINT [PackageProduct_FK_Product]
GO
ALTER TABLE [dbo].[PackageProduct]  WITH NOCHECK ADD  CONSTRAINT [PackageProduct_FK_ProductOption] FOREIGN KEY([ProductOptionId])
REFERENCES [dbo].[ProductOption] ([Id])
GO

ALTER TABLE [dbo].[PackageProduct] CHECK CONSTRAINT [PackageProduct_FK_ProductOption]
GO
ALTER TABLE [dbo].[PackageProduct]  WITH NOCHECK ADD  CONSTRAINT [PackageProduct_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[PackageProduct] CHECK CONSTRAINT [PackageProduct_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[PackageProduct]  WITH NOCHECK ADD  CONSTRAINT [PackageProduct_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[PackageProduct] CHECK CONSTRAINT [PackageProduct_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[PackageProduct] ADD  CONSTRAINT [PackageProduct_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PackageProduct] ADD  CONSTRAINT [DF_PackageProduct_IsActive1]  DEFAULT ((0)) FOR [IsRequired]
GO
ALTER TABLE [dbo].[PackageProduct] ADD  CONSTRAINT [DF_PackageProduct_IsRequired1]  DEFAULT ((0)) FOR [IsRecommended]
GO
ALTER TABLE [dbo].[PackageProduct] ADD  CONSTRAINT [DF_PackageProduct_IsRequired1_1]  DEFAULT ((0)) FOR [IsNonEditable]
GO
ALTER TABLE [dbo].[PackageProduct] ADD  CONSTRAINT [PackageProduct_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table used to store Product assigned to packages' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackageProduct'