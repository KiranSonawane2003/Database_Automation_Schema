CREATE TABLE [dbo].[EmailTemplateAccess](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TemplateId] [bigint] NOT NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[SortKey] [int] NULL,
	[IsActive] [bit] NULL,
	[isAutomatedSend] [bit] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_EmailTemplateAccess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmailTemplateAccess]  WITH CHECK ADD  CONSTRAINT [EmailTemplateAccess_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateAccess] CHECK CONSTRAINT [EmailTemplateAccess_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[EmailTemplateAccess]  WITH CHECK ADD  CONSTRAINT [EmailTemplateAccess_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateAccess] CHECK CONSTRAINT [EmailTemplateAccess_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[EmailTemplateAccess]  WITH CHECK ADD  CONSTRAINT [FK_EmailTemplateAccess_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateAccess] CHECK CONSTRAINT [FK_EmailTemplateAccess_Branch]
GO
ALTER TABLE [dbo].[EmailTemplateAccess]  WITH CHECK ADD  CONSTRAINT [FK_EmailTemplateAccess_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateAccess] CHECK CONSTRAINT [FK_EmailTemplateAccess_Group]
GO
ALTER TABLE [dbo].[EmailTemplateAccess]  WITH CHECK ADD  CONSTRAINT [FK_EmailTemplateAccess_Template] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[Template] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateAccess] CHECK CONSTRAINT [FK_EmailTemplateAccess_Template]