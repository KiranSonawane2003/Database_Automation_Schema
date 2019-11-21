CREATE TABLE [dbo].[BranchCompanyTypeMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BranchCompanyId] [bigint] NOT NULL,
	[CompanyId] [bigint] NOT NULL,
	[CompanyTypeId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_BranchCompanyTypeMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BranchCompanyTypeMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_BranchCompanyTypeMapping_BranchCompanies] FOREIGN KEY([BranchCompanyId])
REFERENCES [dbo].[BranchCompanies] ([Id])
GO

ALTER TABLE [dbo].[BranchCompanyTypeMapping] CHECK CONSTRAINT [FK_BranchCompanyTypeMapping_BranchCompanies]
GO
ALTER TABLE [dbo].[BranchCompanyTypeMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_BranchCompanyTypeMapping_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[BranchCompanyTypeMapping] CHECK CONSTRAINT [FK_BranchCompanyTypeMapping_Company]
GO
ALTER TABLE [dbo].[BranchCompanyTypeMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_BranchCompanyTypeMapping_CompanyType] FOREIGN KEY([CompanyTypeId])
REFERENCES [dbo].[CompanyType] ([Id])
GO

ALTER TABLE [dbo].[BranchCompanyTypeMapping] CHECK CONSTRAINT [FK_BranchCompanyTypeMapping_CompanyType]