CREATE TABLE [dbo].[AdminDocumentCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentCategoryName] [nvarchar](2000) NULL,
	[IsGroupDocumentCategory] [bit] NULL,
	[IsBranchDocumentCategory] [bit] NULL,
	[IsUsersDocumentCategory] [bit] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [AdminDocumentCategory_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdminDocumentCategory]  WITH CHECK ADD  CONSTRAINT [AdminDocumentCategory_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[AdminDocumentCategory] CHECK CONSTRAINT [AdminDocumentCategory_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[AdminDocumentCategory]  WITH CHECK ADD  CONSTRAINT [AdminDocumentCategory_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[AdminDocumentCategory] CHECK CONSTRAINT [AdminDocumentCategory_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[AdminDocumentCategory] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AdminDocumentCategory] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]