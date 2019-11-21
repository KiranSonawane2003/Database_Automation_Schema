CREATE TABLE [dbo].[UserDocument](
	[Id] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[DocCategoryId] [bigint] NULL,
	[DocDescription] [nvarchar](500) NULL,
	[DocName] [nvarchar](100) NULL,
	[DocPath] [nvarchar](200) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [UserDocument_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserDocument]  WITH CHECK ADD  CONSTRAINT [FK_UserDocument_DocumentCategory] FOREIGN KEY([DocCategoryId])
REFERENCES [dbo].[DocumentCategory] ([Id])
GO

ALTER TABLE [dbo].[UserDocument] CHECK CONSTRAINT [FK_UserDocument_DocumentCategory]
GO
ALTER TABLE [dbo].[UserDocument]  WITH CHECK ADD  CONSTRAINT [UserDocument_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[UserDocument] CHECK CONSTRAINT [UserDocument_FK_Country]
GO
ALTER TABLE [dbo].[UserDocument]  WITH CHECK ADD  CONSTRAINT [UserDocument_FK_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UserDocument] CHECK CONSTRAINT [UserDocument_FK_Users]
GO
ALTER TABLE [dbo].[UserDocument]  WITH CHECK ADD  CONSTRAINT [UserDocument_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UserDocument] CHECK CONSTRAINT [UserDocument_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[UserDocument]  WITH CHECK ADD  CONSTRAINT [UserDocument_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UserDocument] CHECK CONSTRAINT [UserDocument_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[UserDocument] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserDocument] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]