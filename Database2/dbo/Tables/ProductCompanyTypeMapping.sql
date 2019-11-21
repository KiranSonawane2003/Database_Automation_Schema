CREATE TABLE [dbo].[ProductCompanyTypeMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductCompanyId] [bigint] NOT NULL,
	[CompanyId] [bigint] NOT NULL,
	[CompanyTypeId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ProductCompanyTypeMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductCompanyTypeMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductCompanyTypeMapping_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[ProductCompanyTypeMapping] CHECK CONSTRAINT [FK_ProductCompanyTypeMapping_Company]
GO
ALTER TABLE [dbo].[ProductCompanyTypeMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductCompanyTypeMapping_CompanyType] FOREIGN KEY([CompanyTypeId])
REFERENCES [dbo].[CompanyType] ([Id])
GO

ALTER TABLE [dbo].[ProductCompanyTypeMapping] CHECK CONSTRAINT [FK_ProductCompanyTypeMapping_CompanyType]
GO
ALTER TABLE [dbo].[ProductCompanyTypeMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductCompanyTypeMapping_ProductCompanies] FOREIGN KEY([ProductCompanyId])
REFERENCES [dbo].[ProductCompanies] ([Id])
GO

ALTER TABLE [dbo].[ProductCompanyTypeMapping] CHECK CONSTRAINT [FK_ProductCompanyTypeMapping_ProductCompanies]