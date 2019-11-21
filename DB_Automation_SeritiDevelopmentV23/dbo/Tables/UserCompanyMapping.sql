CREATE TABLE [dbo].[UserCompanyMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CompanyId] [bigint] NOT NULL,
	[CompanyCompanyTypeId] [bigint] NOT NULL,
	[CompanyCode] [nvarchar](100) NOT NULL,
	[CompanyName] [nvarchar](max) NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_UserCompanyMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserCompanyMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserCompanyMapping_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[UserCompanyMapping] CHECK CONSTRAINT [FK_UserCompanyMapping_Company]
GO
ALTER TABLE [dbo].[UserCompanyMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserCompanyMapping_CompanyCompanyTypeMapping] FOREIGN KEY([CompanyCompanyTypeId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[UserCompanyMapping] CHECK CONSTRAINT [FK_UserCompanyMapping_CompanyCompanyTypeMapping]
GO
ALTER TABLE [dbo].[UserCompanyMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserCompanyMapping_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[UserCompanyMapping] CHECK CONSTRAINT [FK_UserCompanyMapping_Country]
GO
ALTER TABLE [dbo].[UserCompanyMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserCompanyMapping_Users] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UserCompanyMapping] CHECK CONSTRAINT [FK_UserCompanyMapping_Users]
GO
ALTER TABLE [dbo].[UserCompanyMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserCompanyMapping_Users1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UserCompanyMapping] CHECK CONSTRAINT [FK_UserCompanyMapping_Users1]