CREATE TABLE [dbo].[GroupProduct](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[ProductTypeId] [bigint] NOT NULL,
	[ProductSubTypeId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[SortKey] [int] NULL,
	[Editable] [bit] NOT NULL,
	[RequireAtInception] [nvarchar](100) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [GroupProduct_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupProduct]  WITH NOCHECK ADD  CONSTRAINT [GroupProduct_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[GroupProduct] CHECK CONSTRAINT [GroupProduct_FK_Country]
GO
ALTER TABLE [dbo].[GroupProduct]  WITH NOCHECK ADD  CONSTRAINT [GroupProduct_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[GroupProduct] CHECK CONSTRAINT [GroupProduct_FK_Group]
GO
ALTER TABLE [dbo].[GroupProduct]  WITH NOCHECK ADD  CONSTRAINT [GroupProduct_FK_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO

ALTER TABLE [dbo].[GroupProduct] CHECK CONSTRAINT [GroupProduct_FK_Product]
GO
ALTER TABLE [dbo].[GroupProduct]  WITH NOCHECK ADD  CONSTRAINT [GroupProduct_FK_ProductSubType] FOREIGN KEY([ProductSubTypeId])
REFERENCES [dbo].[ProductSubType] ([Id])
GO

ALTER TABLE [dbo].[GroupProduct] CHECK CONSTRAINT [GroupProduct_FK_ProductSubType]
GO
ALTER TABLE [dbo].[GroupProduct]  WITH NOCHECK ADD  CONSTRAINT [GroupProduct_FK_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO

ALTER TABLE [dbo].[GroupProduct] CHECK CONSTRAINT [GroupProduct_FK_ProductType]
GO
ALTER TABLE [dbo].[GroupProduct]  WITH NOCHECK ADD  CONSTRAINT [GroupProduct_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupProduct] CHECK CONSTRAINT [GroupProduct_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[GroupProduct]  WITH NOCHECK ADD  CONSTRAINT [GroupProduct_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupProduct] CHECK CONSTRAINT [GroupProduct_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[GroupProduct] ADD  CONSTRAINT [GroupProduct_DF_Editable]  DEFAULT ((0)) FOR [Editable]
GO
ALTER TABLE [dbo].[GroupProduct] ADD  CONSTRAINT [GroupProduct_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GroupProduct] ADD  CONSTRAINT [GroupProduct_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store Product assign for group.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupProduct'