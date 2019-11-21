CREATE TABLE [dbo].[GroupDocument](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[DocCategoryId] [bigint] NOT NULL,
	[DocDescription] [nvarchar](200) NULL,
	[DocName] [nvarchar](100) NULL,
	[DocPath] [nvarchar](200) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [GroupDocument_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupDocument]  WITH NOCHECK ADD  CONSTRAINT [GroupDocument_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[GroupDocument] CHECK CONSTRAINT [GroupDocument_FK_Country]
GO
ALTER TABLE [dbo].[GroupDocument]  WITH NOCHECK ADD  CONSTRAINT [GroupDocument_FK_DocumentCategory] FOREIGN KEY([DocCategoryId])
REFERENCES [dbo].[DocumentCategory] ([Id])
GO

ALTER TABLE [dbo].[GroupDocument] CHECK CONSTRAINT [GroupDocument_FK_DocumentCategory]
GO
ALTER TABLE [dbo].[GroupDocument]  WITH NOCHECK ADD  CONSTRAINT [GroupDocument_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[GroupDocument] CHECK CONSTRAINT [GroupDocument_FK_Group]
GO
ALTER TABLE [dbo].[GroupDocument]  WITH NOCHECK ADD  CONSTRAINT [GroupDocument_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupDocument] CHECK CONSTRAINT [GroupDocument_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[GroupDocument]  WITH NOCHECK ADD  CONSTRAINT [GroupDocument_FK_UsersModdifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupDocument] CHECK CONSTRAINT [GroupDocument_FK_UsersModdifiedBy]
GO
ALTER TABLE [dbo].[GroupDocument] ADD  CONSTRAINT [GroupDocument_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GroupDocument] ADD  CONSTRAINT [GroupDocument_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store document related with group.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupDocument'