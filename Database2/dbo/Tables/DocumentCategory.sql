CREATE TABLE [dbo].[DocumentCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DocCategory] [nvarchar](100) NOT NULL,
	[ParentId] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [DocumentCategory_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocumentCategory]  WITH NOCHECK ADD  CONSTRAINT [DocumentCategory_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[DocumentCategory] CHECK CONSTRAINT [DocumentCategory_FK_Country]
GO
ALTER TABLE [dbo].[DocumentCategory]  WITH NOCHECK ADD  CONSTRAINT [DocumentCategory_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[DocumentCategory] CHECK CONSTRAINT [DocumentCategory_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[DocumentCategory]  WITH NOCHECK ADD  CONSTRAINT [DocumentCategory_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[DocumentCategory] CHECK CONSTRAINT [DocumentCategory_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[DocumentCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_DocumentCategory_DocumentCategory] FOREIGN KEY([ParentId])
REFERENCES [dbo].[DocumentCategory] ([Id])
GO

ALTER TABLE [dbo].[DocumentCategory] CHECK CONSTRAINT [FK_DocumentCategory_DocumentCategory]
GO
ALTER TABLE [dbo].[DocumentCategory] ADD  CONSTRAINT [DocumentCategory_DF_AsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DocumentCategory] ADD  CONSTRAINT [DocumentCategory_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table is master for document category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumentCategory'