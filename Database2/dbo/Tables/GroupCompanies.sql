CREATE TABLE [dbo].[GroupCompanies](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[CompanyId] [bigint] NOT NULL,
	[SortKey] [int] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[AutoUpdateTransaction] [bit] NULL,
	[EmailAddress] [nvarchar](max) NULL,
	[BankDealerCode] [nvarchar](max) NULL,
 CONSTRAINT [GroupCompanies_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupCompanies]  WITH NOCHECK ADD  CONSTRAINT [FK_GroupCompanies_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[GroupCompanies] CHECK CONSTRAINT [FK_GroupCompanies_Company]
GO
ALTER TABLE [dbo].[GroupCompanies]  WITH NOCHECK ADD  CONSTRAINT [GroupCompanies_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[GroupCompanies] CHECK CONSTRAINT [GroupCompanies_FK_Country]
GO
ALTER TABLE [dbo].[GroupCompanies]  WITH NOCHECK ADD  CONSTRAINT [GroupCompanies_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[GroupCompanies] CHECK CONSTRAINT [GroupCompanies_FK_Group]
GO
ALTER TABLE [dbo].[GroupCompanies]  WITH NOCHECK ADD  CONSTRAINT [GroupCompanies_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupCompanies] CHECK CONSTRAINT [GroupCompanies_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[GroupCompanies]  WITH NOCHECK ADD  CONSTRAINT [GroupCompanies_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupCompanies] CHECK CONSTRAINT [GroupCompanies_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[GroupCompanies] ADD  CONSTRAINT [GroupCompanies_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GroupCompanies] ADD  CONSTRAINT [GroupCompanies_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[GroupCompanies] ADD  DEFAULT ((0)) FOR [AutoUpdateTransaction]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table relates Companies with group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupCompanies'