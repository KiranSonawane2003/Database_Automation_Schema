CREATE TABLE [dbo].[ProductCompanies](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[CompanyId] [bigint] NOT NULL,
	[IsBulking] [bit] NOT NULL,
	[IsBankProduct] [bit] NOT NULL,
	[IsRegulated] [bit] NOT NULL,
	[CompanyProductName] [nvarchar](100) NULL,
	[CompanyProductCode] [nvarchar](100) NULL,
	[IsAccessory] [bit] NULL,
	[IsEnforceBulking] [bit] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CompanyTypeId] [bigint] NULL,
 CONSTRAINT [ProductCompanyMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductCompanies]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductCompanyMapping_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[ProductCompanies] CHECK CONSTRAINT [FK_ProductCompanyMapping_Company]
GO
ALTER TABLE [dbo].[ProductCompanies]  WITH CHECK ADD  CONSTRAINT [ProductCompanies_FK_CompanyType] FOREIGN KEY([CompanyTypeId])
REFERENCES [dbo].[CompanyType] ([Id])
GO

ALTER TABLE [dbo].[ProductCompanies] CHECK CONSTRAINT [ProductCompanies_FK_CompanyType]
GO
ALTER TABLE [dbo].[ProductCompanies]  WITH NOCHECK ADD  CONSTRAINT [ProductCompanyMapping_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ProductCompanies] CHECK CONSTRAINT [ProductCompanyMapping_FK_Country]
GO
ALTER TABLE [dbo].[ProductCompanies]  WITH NOCHECK ADD  CONSTRAINT [ProductCompanyMapping_FK_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO

ALTER TABLE [dbo].[ProductCompanies] CHECK CONSTRAINT [ProductCompanyMapping_FK_Product]
GO
ALTER TABLE [dbo].[ProductCompanies]  WITH NOCHECK ADD  CONSTRAINT [ProductCompanyMapping_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductCompanies] CHECK CONSTRAINT [ProductCompanyMapping_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ProductCompanies]  WITH NOCHECK ADD  CONSTRAINT [ProductCompanyMapping_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductCompanies] CHECK CONSTRAINT [ProductCompanyMapping_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ProductCompanies] ADD  CONSTRAINT [ProductCompanyMapping_DF_Bulking]  DEFAULT ((0)) FOR [IsBulking]
GO
ALTER TABLE [dbo].[ProductCompanies] ADD  CONSTRAINT [ProductCompanyMapping_DF_BankProduct]  DEFAULT ((0)) FOR [IsBankProduct]
GO
ALTER TABLE [dbo].[ProductCompanies] ADD  CONSTRAINT [ProductCompanyMapping_DF_Regulated]  DEFAULT ((0)) FOR [IsRegulated]
GO
ALTER TABLE [dbo].[ProductCompanies] ADD  CONSTRAINT [ProductCompanyMapping_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductCompanies] ADD  CONSTRAINT [ProductCompanyMapping_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table mpa comany to product.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCompanies'