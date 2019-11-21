CREATE TABLE [dbo].[ProductOptionCompanies](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductOptionId] [bigint] NULL,
	[CompanyTypeId] [bigint] NULL,
	[CompanyId] [bigint] NULL,
	[CompanyProductOptionName] [nvarchar](500) NULL,
	[CompanyProductOptionCode] [nvarchar](500) NULL,
	[IsAccessory] [bit] NULL,
	[IsBulking] [bit] NULL,
	[IsEnforceBulking] [bit] NULL,
	[IsBankProduct] [bit] NULL,
	[IsRegulated] [bit] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [ProductOptionCompanies_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductOptionCompanies]  WITH CHECK ADD  CONSTRAINT [ProductOptionCompanies_FK_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionCompanies] CHECK CONSTRAINT [ProductOptionCompanies_FK_Company]
GO
ALTER TABLE [dbo].[ProductOptionCompanies]  WITH CHECK ADD  CONSTRAINT [ProductOptionCompanies_FK_CompanyType] FOREIGN KEY([CompanyTypeId])
REFERENCES [dbo].[CompanyType] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionCompanies] CHECK CONSTRAINT [ProductOptionCompanies_FK_CompanyType]
GO
ALTER TABLE [dbo].[ProductOptionCompanies]  WITH CHECK ADD  CONSTRAINT [ProductOptionCompanies_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionCompanies] CHECK CONSTRAINT [ProductOptionCompanies_FK_Country]
GO
ALTER TABLE [dbo].[ProductOptionCompanies]  WITH CHECK ADD  CONSTRAINT [ProductOptionCompanies_FK_ProductOption] FOREIGN KEY([ProductOptionId])
REFERENCES [dbo].[ProductOption] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionCompanies] CHECK CONSTRAINT [ProductOptionCompanies_FK_ProductOption]
GO
ALTER TABLE [dbo].[ProductOptionCompanies]  WITH CHECK ADD  CONSTRAINT [ProductOptionCompanies_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionCompanies] CHECK CONSTRAINT [ProductOptionCompanies_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ProductOptionCompanies]  WITH CHECK ADD  CONSTRAINT [ProductOptionCompanies_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionCompanies] CHECK CONSTRAINT [ProductOptionCompanies_FK_UsersModifiedBy]