CREATE TABLE [dbo].[GroupCompanyTypeMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupCompanyId] [bigint] NOT NULL,
	[CompanyId] [bigint] NOT NULL,
	[CompanyTypeId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [GroupCompanyTypeMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupCompanyTypeMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_GroupCompanyTypeMapping_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[GroupCompanyTypeMapping] CHECK CONSTRAINT [FK_GroupCompanyTypeMapping_Company]
GO
ALTER TABLE [dbo].[GroupCompanyTypeMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_GroupCompanyTypeMapping_CompanyType] FOREIGN KEY([CompanyTypeId])
REFERENCES [dbo].[CompanyType] ([Id])
GO

ALTER TABLE [dbo].[GroupCompanyTypeMapping] CHECK CONSTRAINT [FK_GroupCompanyTypeMapping_CompanyType]
GO
ALTER TABLE [dbo].[GroupCompanyTypeMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_GroupCompanyTypeMapping_GroupCompanies] FOREIGN KEY([GroupCompanyId])
REFERENCES [dbo].[GroupCompanies] ([Id])
GO

ALTER TABLE [dbo].[GroupCompanyTypeMapping] CHECK CONSTRAINT [FK_GroupCompanyTypeMapping_GroupCompanies]