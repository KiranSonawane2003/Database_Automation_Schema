CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[HomeGroupId] [bigint] NULL,
	[HomeBranchId] [bigint] NULL,
	[IDTypeId] [bigint] NOT NULL,
	[IDNumber] [nvarchar](100) NOT NULL,
	[Gender] [int] NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Mobile] [nvarchar](100) NULL,
	[WorkPhoneCode] [nvarchar](10) NULL,
	[WorkPhone] [nvarchar](100) NULL,
	[FaxCode] [nvarchar](10) NULL,
	[Fax] [nvarchar](100) NULL,
	[DeactivationDate] [date] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[IdentityId] [nvarchar](128) NULL,
	[SMTPEmailAddress] [nvarchar](200) NULL,
	[SMTPEmailPassword] [nvarchar](max) NULL,
	[SMTPHost] [nvarchar](100) NULL,
	[SMTPPort] [nvarchar](100) NULL,
	[DefaultCountryId] [bigint] NULL,
	[IsBlockCopyTransaction] [bit] NULL,
	[IsBlockDocumentDelete] [bit] NULL,
	[IsAllowEditableInceptionDate] [bit] NULL,
 CONSTRAINT [Users_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Users_UQ] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users]  WITH NOCHECK ADD  CONSTRAINT [Users_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [Users_FK_Country]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [Users_FK_CountryDefaultCountryId] FOREIGN KEY([DefaultCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [Users_FK_CountryDefaultCountryId]
GO
ALTER TABLE [dbo].[Users]  WITH NOCHECK ADD  CONSTRAINT [Users_FK_HomeBranch] FOREIGN KEY([HomeBranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [Users_FK_HomeBranch]
GO
ALTER TABLE [dbo].[Users]  WITH NOCHECK ADD  CONSTRAINT [Users_Group] FOREIGN KEY([HomeGroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [Users_Group]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsBlockCopyTransaction]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsBlockDocumentDelete]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('FALSE') FOR [IsAllowEditableInceptionDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Male,1-Female' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Gender'