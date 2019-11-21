CREATE TABLE [dbo].[PackageBranch](
	[Id] [bigint] NOT NULL,
	[PackageId] [bigint] NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[SortKey] [int] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PackageBranch_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PackageBranch]  WITH NOCHECK ADD  CONSTRAINT [PackageBranch_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[PackageBranch] CHECK CONSTRAINT [PackageBranch_FK_Branch]
GO
ALTER TABLE [dbo].[PackageBranch]  WITH NOCHECK ADD  CONSTRAINT [PackageBranch_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[PackageBranch] CHECK CONSTRAINT [PackageBranch_FK_Country]
GO
ALTER TABLE [dbo].[PackageBranch]  WITH NOCHECK ADD  CONSTRAINT [PackageBranch_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[PackageBranch] CHECK CONSTRAINT [PackageBranch_FK_Group]
GO
ALTER TABLE [dbo].[PackageBranch]  WITH NOCHECK ADD  CONSTRAINT [PackageBranch_FK_Packages] FOREIGN KEY([PackageId])
REFERENCES [dbo].[Package] ([Id])
GO

ALTER TABLE [dbo].[PackageBranch] CHECK CONSTRAINT [PackageBranch_FK_Packages]
GO
ALTER TABLE [dbo].[PackageBranch]  WITH NOCHECK ADD  CONSTRAINT [PackageBranch_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[PackageBranch] CHECK CONSTRAINT [PackageBranch_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[PackageBranch]  WITH NOCHECK ADD  CONSTRAINT [PackageBranch_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[PackageBranch] CHECK CONSTRAINT [PackageBranch_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[PackageBranch] ADD  CONSTRAINT [PackageBranch_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PackageBranch] ADD  CONSTRAINT [PackageBranch_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table is for Package Branch Mapping.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackageBranch'