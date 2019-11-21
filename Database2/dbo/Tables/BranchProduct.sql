CREATE TABLE [dbo].[BranchProduct](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BranchId] [bigint] NOT NULL,
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
 CONSTRAINT [BranchProduct_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BranchProduct]  WITH NOCHECK ADD  CONSTRAINT [BranchProduct_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[BranchProduct] CHECK CONSTRAINT [BranchProduct_FK_Branch]
GO
ALTER TABLE [dbo].[BranchProduct]  WITH NOCHECK ADD  CONSTRAINT [BranchProduct_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[BranchProduct] CHECK CONSTRAINT [BranchProduct_FK_Country]
GO
ALTER TABLE [dbo].[BranchProduct]  WITH NOCHECK ADD  CONSTRAINT [BranchProduct_FK_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO

ALTER TABLE [dbo].[BranchProduct] CHECK CONSTRAINT [BranchProduct_FK_Product]
GO
ALTER TABLE [dbo].[BranchProduct]  WITH NOCHECK ADD  CONSTRAINT [BranchProduct_FK_ProductSubType] FOREIGN KEY([ProductSubTypeId])
REFERENCES [dbo].[ProductSubType] ([Id])
GO

ALTER TABLE [dbo].[BranchProduct] CHECK CONSTRAINT [BranchProduct_FK_ProductSubType]
GO
ALTER TABLE [dbo].[BranchProduct]  WITH NOCHECK ADD  CONSTRAINT [BranchProduct_FK_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO

ALTER TABLE [dbo].[BranchProduct] CHECK CONSTRAINT [BranchProduct_FK_ProductType]
GO
ALTER TABLE [dbo].[BranchProduct]  WITH NOCHECK ADD  CONSTRAINT [BranchProduct_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[BranchProduct] CHECK CONSTRAINT [BranchProduct_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[BranchProduct]  WITH NOCHECK ADD  CONSTRAINT [BranchProduct_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[BranchProduct] CHECK CONSTRAINT [BranchProduct_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[BranchProduct] ADD  CONSTRAINT [BranchProduct_DF_Editable]  DEFAULT ((0)) FOR [Editable]
GO
ALTER TABLE [dbo].[BranchProduct] ADD  CONSTRAINT [BranchProduct_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[BranchProduct] ADD  CONSTRAINT [BranchProduct_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table associated product with branch.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BranchProduct'