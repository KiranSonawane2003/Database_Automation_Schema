CREATE TABLE [dbo].[GroupTemplate](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[TemplateCategoryId] [bigint] NOT NULL,
	[TemplateId] [bigint] NOT NULL,
	[SortKey] [int] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [GroupTemplate_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupTemplate]  WITH NOCHECK ADD  CONSTRAINT [GroupTemplate_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[GroupTemplate] CHECK CONSTRAINT [GroupTemplate_FK_Country]
GO
ALTER TABLE [dbo].[GroupTemplate]  WITH NOCHECK ADD  CONSTRAINT [GroupTemplate_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[GroupTemplate] CHECK CONSTRAINT [GroupTemplate_FK_Group]
GO
ALTER TABLE [dbo].[GroupTemplate]  WITH NOCHECK ADD  CONSTRAINT [GroupTemplate_FK_Template] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[Template] ([Id])
GO

ALTER TABLE [dbo].[GroupTemplate] CHECK CONSTRAINT [GroupTemplate_FK_Template]
GO
ALTER TABLE [dbo].[GroupTemplate]  WITH NOCHECK ADD  CONSTRAINT [GroupTemplate_FK_TemplateCategory] FOREIGN KEY([TemplateCategoryId])
REFERENCES [dbo].[TemplateCategory] ([Id])
GO

ALTER TABLE [dbo].[GroupTemplate] CHECK CONSTRAINT [GroupTemplate_FK_TemplateCategory]
GO
ALTER TABLE [dbo].[GroupTemplate]  WITH NOCHECK ADD  CONSTRAINT [GroupTemplate_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupTemplate] CHECK CONSTRAINT [GroupTemplate_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[GroupTemplate]  WITH NOCHECK ADD  CONSTRAINT [GroupTemplate_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupTemplate] CHECK CONSTRAINT [GroupTemplate_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[GroupTemplate] ADD  CONSTRAINT [GroupTemplate_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GroupTemplate] ADD  CONSTRAINT [GroupTemplate_DF_CeratedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table Group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupTemplate', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table TemplateCategory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupTemplate', @level2type=N'COLUMN',@level2name=N'TemplateCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table Template' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupTemplate', @level2type=N'COLUMN',@level2name=N'TemplateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table relate template from template table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupTemplate'