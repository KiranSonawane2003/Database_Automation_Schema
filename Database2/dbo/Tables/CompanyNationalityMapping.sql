CREATE TABLE [dbo].[CompanyNationalityMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryId] [bigint] NULL,
	[CompanyId] [bigint] NULL,
	[Code] [nvarchar](10) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_CompanyNationalityMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyNationalityMapping]  WITH CHECK ADD  CONSTRAINT [CompanyNationalityMapping_FK_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[CompanyNationalityMapping] CHECK CONSTRAINT [CompanyNationalityMapping_FK_Company]
GO
ALTER TABLE [dbo].[CompanyNationalityMapping]  WITH CHECK ADD  CONSTRAINT [CompanyNationalityMapping_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[CompanyNationalityMapping] CHECK CONSTRAINT [CompanyNationalityMapping_FK_Country]
GO
ALTER TABLE [dbo].[CompanyNationalityMapping]  WITH CHECK ADD  CONSTRAINT [CompanyNationalityMapping_FK_UserCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyNationalityMapping] CHECK CONSTRAINT [CompanyNationalityMapping_FK_UserCreatedBy]
GO
ALTER TABLE [dbo].[CompanyNationalityMapping]  WITH CHECK ADD  CONSTRAINT [CompanyNationalityMapping_FK_UserModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyNationalityMapping] CHECK CONSTRAINT [CompanyNationalityMapping_FK_UserModifiedBy]