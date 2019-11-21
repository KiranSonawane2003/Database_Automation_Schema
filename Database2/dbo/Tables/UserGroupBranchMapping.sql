CREATE TABLE [dbo].[UserGroupBranchMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CountryId] [bigint] NULL,
	[CompanyTypeId] [bigint] NULL,
	[CompanyId] [bigint] NULL,
	[AccessType] [int] NULL,
 CONSTRAINT [UserGroupBranchMap_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserGroupBranchMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_UserGroupBranchMapping_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[UserGroupBranchMapping] CHECK CONSTRAINT [FK_UserGroupBranchMapping_Branch]
GO
ALTER TABLE [dbo].[UserGroupBranchMapping]  WITH CHECK ADD  CONSTRAINT [UserGroupBranchMapping_FK_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[UserGroupBranchMapping] CHECK CONSTRAINT [UserGroupBranchMapping_FK_Company]
GO
ALTER TABLE [dbo].[UserGroupBranchMapping]  WITH CHECK ADD  CONSTRAINT [UserGroupBranchMapping_FK_CompanyType] FOREIGN KEY([CompanyTypeId])
REFERENCES [dbo].[CompanyType] ([Id])
GO

ALTER TABLE [dbo].[UserGroupBranchMapping] CHECK CONSTRAINT [UserGroupBranchMapping_FK_CompanyType]
GO
ALTER TABLE [dbo].[UserGroupBranchMapping]  WITH NOCHECK ADD  CONSTRAINT [UserGroupBranchMapping_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[UserGroupBranchMapping] CHECK CONSTRAINT [UserGroupBranchMapping_FK_Group]
GO
ALTER TABLE [dbo].[UserGroupBranchMapping]  WITH NOCHECK ADD  CONSTRAINT [UserGroupBranchMapping_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UserGroupBranchMapping] CHECK CONSTRAINT [UserGroupBranchMapping_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[UserGroupBranchMapping]  WITH NOCHECK ADD  CONSTRAINT [UserGroupBranchMapping_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UserGroupBranchMapping] CHECK CONSTRAINT [UserGroupBranchMapping_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[UserGroupBranchMapping]  WITH NOCHECK ADD  CONSTRAINT [UserGroupBranchMapping_FK_UsersUserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UserGroupBranchMapping] CHECK CONSTRAINT [UserGroupBranchMapping_FK_UsersUserId]
GO
ALTER TABLE [dbo].[UserGroupBranchMapping] ADD  CONSTRAINT [DF_UserGroupBranchMap_IsActive]  DEFAULT ((1)) FOR [IsActive]