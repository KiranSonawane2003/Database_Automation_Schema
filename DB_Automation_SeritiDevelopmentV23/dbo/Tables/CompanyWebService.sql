CREATE TABLE [dbo].[CompanyWebService](
	[Id] [bigint] NOT NULL,
	[CompanyCompanyTypeMapId] [bigint] NOT NULL,
	[WebServiceCode] [nvarchar](200) NOT NULL,
	[WebServiceType] [nvarchar](200) NULL,
	[WebServiceAction] [nvarchar](200) NULL,
	[WebServiceURL] [nvarchar](200) NOT NULL,
	[WebServiceUserName] [nvarchar](100) NULL,
	[WebServicePassword] [nvarchar](200) NULL,
	[EmailTo] [nvarchar](100) NULL,
	[EmailFrom] [nvarchar](100) NULL,
	[Version] [nvarchar](50) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [CompanyWebService_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyWebService]  WITH NOCHECK ADD  CONSTRAINT [CompanyWebService_FK_CompanyCompanyTypeMapping] FOREIGN KEY([CompanyCompanyTypeMapId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[CompanyWebService] CHECK CONSTRAINT [CompanyWebService_FK_CompanyCompanyTypeMapping]
GO
ALTER TABLE [dbo].[CompanyWebService]  WITH NOCHECK ADD  CONSTRAINT [CompanyWebService_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[CompanyWebService] CHECK CONSTRAINT [CompanyWebService_FK_Country]
GO
ALTER TABLE [dbo].[CompanyWebService]  WITH NOCHECK ADD  CONSTRAINT [CompanyWebService_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyWebService] CHECK CONSTRAINT [CompanyWebService_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[CompanyWebService]  WITH NOCHECK ADD  CONSTRAINT [CompanyWebService_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyWebService] CHECK CONSTRAINT [CompanyWebService_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[CompanyWebService] ADD  CONSTRAINT [CompanyWebService_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CompanyWebService] ADD  CONSTRAINT [CompanyWebService_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table Company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CompanyWebService', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This Table use to store WebService details from webservice page under Admin >> Companies >> Edit Company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CompanyWebService'