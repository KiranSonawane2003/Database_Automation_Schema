CREATE TABLE [dbo].[GroupBranchDocCategoryMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[DocumentCategoryId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [GroupBranchDocCategoryMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupBranchDocCategoryMapping]  WITH CHECK ADD  CONSTRAINT [GroupBranchDocCategoryMapping_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[GroupBranchDocCategoryMapping] CHECK CONSTRAINT [GroupBranchDocCategoryMapping_FK_Branch]
GO
ALTER TABLE [dbo].[GroupBranchDocCategoryMapping]  WITH CHECK ADD  CONSTRAINT [GroupBranchDocCategoryMapping_FK_DocumentCategory] FOREIGN KEY([DocumentCategoryId])
REFERENCES [dbo].[DocumentCategory] ([Id])
GO

ALTER TABLE [dbo].[GroupBranchDocCategoryMapping] CHECK CONSTRAINT [GroupBranchDocCategoryMapping_FK_DocumentCategory]
GO
ALTER TABLE [dbo].[GroupBranchDocCategoryMapping]  WITH CHECK ADD  CONSTRAINT [GroupBranchDocCategoryMapping_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[GroupBranchDocCategoryMapping] CHECK CONSTRAINT [GroupBranchDocCategoryMapping_FK_Group]
GO
ALTER TABLE [dbo].[GroupBranchDocCategoryMapping]  WITH CHECK ADD  CONSTRAINT [GroupBranchDocCategoryMapping_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupBranchDocCategoryMapping] CHECK CONSTRAINT [GroupBranchDocCategoryMapping_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[GroupBranchDocCategoryMapping]  WITH CHECK ADD  CONSTRAINT [GroupBranchDocCategoryMapping_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupBranchDocCategoryMapping] CHECK CONSTRAINT [GroupBranchDocCategoryMapping_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[GroupBranchDocCategoryMapping] ADD  CONSTRAINT [DF_GroupBranchDocCategoryMapping_IsActive]  DEFAULT ((1)) FOR [IsActive]