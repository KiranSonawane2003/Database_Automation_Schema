CREATE TABLE [dbo].[Template](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TemplateName] [nvarchar](100) NOT NULL,
	[ReportHeading] [nvarchar](100) NULL,
	[CommentRequired] [int] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[TemplateType] [tinyint] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[TemplateCategoryId] [bigint] NULL,
	[IsAnswerRequired] [bit] NULL,
 CONSTRAINT [Template_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Template]  WITH NOCHECK ADD  CONSTRAINT [FK_Template_TemplateCategory] FOREIGN KEY([TemplateCategoryId])
REFERENCES [dbo].[TemplateCategory] ([Id])
GO

ALTER TABLE [dbo].[Template] CHECK CONSTRAINT [FK_Template_TemplateCategory]
GO
ALTER TABLE [dbo].[Template]  WITH NOCHECK ADD  CONSTRAINT [Template_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Template] CHECK CONSTRAINT [Template_FK_Country]
GO
ALTER TABLE [dbo].[Template]  WITH NOCHECK ADD  CONSTRAINT [Template_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Template] CHECK CONSTRAINT [Template_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[Template]  WITH NOCHECK ADD  CONSTRAINT [Template_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Template] CHECK CONSTRAINT [Template_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[Template] ADD  CONSTRAINT [DF_Template_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Template] ADD  CONSTRAINT [DF_Template_EndDate]  DEFAULT (dateadd(year,(10),getdate())) FOR [EndDate]
GO
ALTER TABLE [dbo].[Template] ADD  CONSTRAINT [Template_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Template] ADD  CONSTRAINT [Template_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This Table use to store created templet details under admin system >> Template Admin >> Create Template' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Template'