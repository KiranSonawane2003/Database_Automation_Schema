CREATE TABLE [dbo].[CompanyProductSubTypeMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyId] [bigint] NULL,
	[ProductTypeId] [bigint] NULL,
	[ProductSubTypeId] [bigint] NULL,
	[IsAccessory] [bit] NULL,
	[CompanyProductSubTypeName] [nvarchar](500) NULL,
	[CompanyProductSubTypeCode] [nvarchar](500) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [CompanyProductSubTypeMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyProductSubTypeMapping]  WITH CHECK ADD  CONSTRAINT [CompanyProductSubTypeMapping_FK_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[CompanyProductSubTypeMapping] CHECK CONSTRAINT [CompanyProductSubTypeMapping_FK_Company]
GO
ALTER TABLE [dbo].[CompanyProductSubTypeMapping]  WITH CHECK ADD  CONSTRAINT [CompanyProductSubTypeMapping_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[CompanyProductSubTypeMapping] CHECK CONSTRAINT [CompanyProductSubTypeMapping_FK_Country]
GO
ALTER TABLE [dbo].[CompanyProductSubTypeMapping]  WITH CHECK ADD  CONSTRAINT [CompanyProductSubTypeMapping_FK_ProductSubType] FOREIGN KEY([ProductSubTypeId])
REFERENCES [dbo].[ProductSubType] ([Id])
GO

ALTER TABLE [dbo].[CompanyProductSubTypeMapping] CHECK CONSTRAINT [CompanyProductSubTypeMapping_FK_ProductSubType]
GO
ALTER TABLE [dbo].[CompanyProductSubTypeMapping]  WITH CHECK ADD  CONSTRAINT [CompanyProductSubTypeMapping_FK_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO

ALTER TABLE [dbo].[CompanyProductSubTypeMapping] CHECK CONSTRAINT [CompanyProductSubTypeMapping_FK_ProductType]
GO
ALTER TABLE [dbo].[CompanyProductSubTypeMapping]  WITH CHECK ADD  CONSTRAINT [CompanyProductSubTypeMapping_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyProductSubTypeMapping] CHECK CONSTRAINT [CompanyProductSubTypeMapping_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[CompanyProductSubTypeMapping]  WITH CHECK ADD  CONSTRAINT [CompanyProductSubTypeMapping_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyProductSubTypeMapping] CHECK CONSTRAINT [CompanyProductSubTypeMapping_FK_UsersModifiedBy]