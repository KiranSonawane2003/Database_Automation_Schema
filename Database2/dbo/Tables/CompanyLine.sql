CREATE TABLE [dbo].[CompanyLine](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyId] [bigint] NULL,
	[CompanyPassword] [nvarchar](100) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsActive] [bit] NULL,
	[CountryId] [bigint] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [CompanyLine_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyLine]  WITH CHECK ADD  CONSTRAINT [CompanyLine_FK_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[CompanyLine] CHECK CONSTRAINT [CompanyLine_FK_Company]
GO
ALTER TABLE [dbo].[CompanyLine]  WITH CHECK ADD  CONSTRAINT [CompanyLine_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[CompanyLine] CHECK CONSTRAINT [CompanyLine_FK_Country]
GO
ALTER TABLE [dbo].[CompanyLine]  WITH CHECK ADD  CONSTRAINT [CompanyLine_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyLine] CHECK CONSTRAINT [CompanyLine_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[CompanyLine]  WITH CHECK ADD  CONSTRAINT [CompanyLine_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyLine] CHECK CONSTRAINT [CompanyLine_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[CompanyLine] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CompanyLine] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]