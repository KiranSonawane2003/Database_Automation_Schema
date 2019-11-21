CREATE TABLE [dbo].[AdminDocument](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TableId] [bigint] NULL,
	[DocCategoryId] [bigint] NULL,
	[DocDescription] [nvarchar](2000) NULL,
	[DocName] [nvarchar](1000) NULL,
	[DocPath] [nvarchar](1000) NULL,
	[TypeEnum] [int] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [AdminDocument_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdminDocument]  WITH CHECK ADD  CONSTRAINT [AdminDocument_FK_DocumentCategory] FOREIGN KEY([DocCategoryId])
REFERENCES [dbo].[AdminDocumentCategory] ([Id])
GO

ALTER TABLE [dbo].[AdminDocument] CHECK CONSTRAINT [AdminDocument_FK_DocumentCategory]
GO
ALTER TABLE [dbo].[AdminDocument]  WITH CHECK ADD  CONSTRAINT [BranchDocument_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[AdminDocument] CHECK CONSTRAINT [BranchDocument_FK_Country]
GO
ALTER TABLE [dbo].[AdminDocument]  WITH CHECK ADD  CONSTRAINT [BranchDocument_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[AdminDocument] CHECK CONSTRAINT [BranchDocument_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[AdminDocument]  WITH CHECK ADD  CONSTRAINT [BranchDocument_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[AdminDocument] CHECK CONSTRAINT [BranchDocument_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[AdminDocument] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AdminDocument] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]