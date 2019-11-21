CREATE TABLE [dbo].[EmailDetailsManualAttachments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmailId] [bigint] NOT NULL,
	[DocumentPath] [nvarchar](300) NULL,
	[DocumentName] [nvarchar](200) NULL,
	[DocumentId] [bigint] NULL,
	[DocumentUploadedFromEnum] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[DocumentSize] [nvarchar](50) NULL,
 CONSTRAINT [EmailDetailsManualAttachments_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmailDetailsManualAttachments]  WITH CHECK ADD  CONSTRAINT [EmailDetailsManualAttachments_FK_EmailId] FOREIGN KEY([EmailId])
REFERENCES [dbo].[EmailDetailsManual] ([Id])
GO

ALTER TABLE [dbo].[EmailDetailsManualAttachments] CHECK CONSTRAINT [EmailDetailsManualAttachments_FK_EmailId]
GO
ALTER TABLE [dbo].[EmailDetailsManualAttachments]  WITH CHECK ADD  CONSTRAINT [EmailDetailsManualAttachments_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmailDetailsManualAttachments] CHECK CONSTRAINT [EmailDetailsManualAttachments_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[EmailDetailsManualAttachments]  WITH CHECK ADD  CONSTRAINT [EmailDetailsManualAttachments_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmailDetailsManualAttachments] CHECK CONSTRAINT [EmailDetailsManualAttachments_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[EmailDetailsManualAttachments] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmailDetailsManualAttachments] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]