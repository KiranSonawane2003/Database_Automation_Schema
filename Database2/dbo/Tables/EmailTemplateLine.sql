CREATE TABLE [dbo].[EmailTemplateLine](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TemplateId] [bigint] NOT NULL,
	[EmailCategory] [bigint] NULL,
	[CountryId] [bigint] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[isAutomatedSend] [bit] NULL,
 CONSTRAINT [PK_EmailTemplateLine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmailTemplateLine]  WITH CHECK ADD  CONSTRAINT [EmailTemplateLine_FK_EmailCategoryId] FOREIGN KEY([EmailCategory])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateLine] CHECK CONSTRAINT [EmailTemplateLine_FK_EmailCategoryId]
GO
ALTER TABLE [dbo].[EmailTemplateLine]  WITH CHECK ADD  CONSTRAINT [EmailTemplateLine_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateLine] CHECK CONSTRAINT [EmailTemplateLine_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[EmailTemplateLine]  WITH CHECK ADD  CONSTRAINT [EmailTemplateLine_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateLine] CHECK CONSTRAINT [EmailTemplateLine_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[EmailTemplateLine]  WITH CHECK ADD  CONSTRAINT [FK_EmailTemplateLine_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateLine] CHECK CONSTRAINT [FK_EmailTemplateLine_Country]
GO
ALTER TABLE [dbo].[EmailTemplateLine]  WITH CHECK ADD  CONSTRAINT [FK_EmailTemplateLine_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateLine] CHECK CONSTRAINT [FK_EmailTemplateLine_CreatedBy]
GO
ALTER TABLE [dbo].[EmailTemplateLine]  WITH CHECK ADD  CONSTRAINT [FK_EmailTemplateLine_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateLine] CHECK CONSTRAINT [FK_EmailTemplateLine_ModifiedBy]
GO
ALTER TABLE [dbo].[EmailTemplateLine]  WITH CHECK ADD  CONSTRAINT [FK_EmailTemplateLine_Template] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[Template] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateLine] CHECK CONSTRAINT [FK_EmailTemplateLine_Template]