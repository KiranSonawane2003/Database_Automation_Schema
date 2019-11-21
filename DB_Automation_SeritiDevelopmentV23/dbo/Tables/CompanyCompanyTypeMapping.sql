CREATE TABLE [dbo].[CompanyCompanyTypeMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyId] [bigint] NOT NULL,
	[CompanyTypeId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CountryId] [bigint] NULL,
 CONSTRAINT [CompanyTypeMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyCompanyTypeMapping]  WITH NOCHECK ADD  CONSTRAINT [CompanyTypeMapping_FK_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[CompanyCompanyTypeMapping] CHECK CONSTRAINT [CompanyTypeMapping_FK_Company]
GO
ALTER TABLE [dbo].[CompanyCompanyTypeMapping]  WITH NOCHECK ADD  CONSTRAINT [CompanyTypeMapping_FK_CompanyType] FOREIGN KEY([CompanyTypeId])
REFERENCES [dbo].[CompanyType] ([Id])
GO

ALTER TABLE [dbo].[CompanyCompanyTypeMapping] CHECK CONSTRAINT [CompanyTypeMapping_FK_CompanyType]
GO
ALTER TABLE [dbo].[CompanyCompanyTypeMapping]  WITH NOCHECK ADD  CONSTRAINT [CompanyTypeMapping_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[CompanyCompanyTypeMapping] CHECK CONSTRAINT [CompanyTypeMapping_FK_Country]
GO
ALTER TABLE [dbo].[CompanyCompanyTypeMapping]  WITH NOCHECK ADD  CONSTRAINT [CompanyTypeMapping_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyCompanyTypeMapping] CHECK CONSTRAINT [CompanyTypeMapping_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[CompanyCompanyTypeMapping]  WITH NOCHECK ADD  CONSTRAINT [CompanyTypeMapping_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyCompanyTypeMapping] CHECK CONSTRAINT [CompanyTypeMapping_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[CompanyCompanyTypeMapping] ADD  CONSTRAINT [DF_CompanyTypeMapping_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CompanyCompanyTypeMapping] ADD  CONSTRAINT [DF_CompanyTypeMapping_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]