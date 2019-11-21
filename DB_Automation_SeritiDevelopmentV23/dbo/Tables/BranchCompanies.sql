CREATE TABLE [dbo].[BranchCompanies](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BranchId] [bigint] NOT NULL,
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
 CONSTRAINT [BranchCompanies_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[BranchCompanies]  WITH NOCHECK ADD  CONSTRAINT [BranchCompanies_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[BranchCompanies] CHECK CONSTRAINT [BranchCompanies_FK_Branch]
GO
ALTER TABLE [dbo].[BranchCompanies]  WITH NOCHECK ADD  CONSTRAINT [BranchCompanies_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[BranchCompanies] CHECK CONSTRAINT [BranchCompanies_FK_Country]
GO
ALTER TABLE [dbo].[BranchCompanies]  WITH NOCHECK ADD  CONSTRAINT [BranchCompanies_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[BranchCompanies] CHECK CONSTRAINT [BranchCompanies_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[BranchCompanies]  WITH NOCHECK ADD  CONSTRAINT [BranchCompanies_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[BranchCompanies] CHECK CONSTRAINT [BranchCompanies_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[BranchCompanies]  WITH NOCHECK ADD  CONSTRAINT [FK_BranchCompanies_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[BranchCompanies] CHECK CONSTRAINT [FK_BranchCompanies_Company]
GO
ALTER TABLE [dbo].[BranchCompanies]  WITH NOCHECK ADD  CONSTRAINT [FK_BranchCompanies_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[BranchCompanies] CHECK CONSTRAINT [FK_BranchCompanies_Group]
GO
ALTER TABLE [dbo].[BranchCompanies] ADD  CONSTRAINT [BranchCompanies_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[BranchCompanies] ADD  CONSTRAINT [BranchCompanies_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BranchCompanies] ADD  DEFAULT ((0)) FOR [AutoUpdateTransaction]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key from table Branch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BranchCompanies', @level2type=N'COLUMN',@level2name=N'BranchId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'• This Table used to map companies with branch.
• This will be filled by Companies page under Admin >> Branch Admin >> Edit Branch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BranchCompanies'