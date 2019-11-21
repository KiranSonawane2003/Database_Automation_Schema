CREATE TABLE [dbo].[CompanyDocument](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyId] [bigint] NOT NULL,
	[DocumentCategoryId] [bigint] NOT NULL,
	[DocumentName] [nvarchar](200) NULL,
	[DocumentPath] [nvarchar](500) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [CompanyDocument_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyDocument]  WITH NOCHECK ADD  CONSTRAINT [CompanyDocument_FK_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[CompanyDocument] CHECK CONSTRAINT [CompanyDocument_FK_Company]
GO
ALTER TABLE [dbo].[CompanyDocument]  WITH NOCHECK ADD  CONSTRAINT [CompanyDocument_FK_DocumentCategory] FOREIGN KEY([DocumentCategoryId])
REFERENCES [dbo].[DocumentCategory] ([Id])
GO

ALTER TABLE [dbo].[CompanyDocument] CHECK CONSTRAINT [CompanyDocument_FK_DocumentCategory]
GO
ALTER TABLE [dbo].[CompanyDocument]  WITH NOCHECK ADD  CONSTRAINT [CompanyDocument_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyDocument] CHECK CONSTRAINT [CompanyDocument_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[CompanyDocument]  WITH NOCHECK ADD  CONSTRAINT [CompanyDocument_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyDocument] CHECK CONSTRAINT [CompanyDocument_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[CompanyDocument] ADD  CONSTRAINT [DF_CompanyDocument_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CompanyDocument] ADD  CONSTRAINT [DF_CompanyDocument_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]