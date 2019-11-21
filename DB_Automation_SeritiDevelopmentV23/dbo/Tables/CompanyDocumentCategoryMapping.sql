CREATE TABLE [dbo].[CompanyDocumentCategoryMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentCategoryId] [bigint] NULL,
	[CompanyId] [bigint] NULL,
	[DocumentCategoryCode] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_CompanyDocumentCategoryMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyDocumentCategoryMapping]  WITH CHECK ADD  CONSTRAINT [Company_FK_CompanyDocumentCategoryMapping] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[CompanyDocumentCategoryMapping] CHECK CONSTRAINT [Company_FK_CompanyDocumentCategoryMapping]
GO
ALTER TABLE [dbo].[CompanyDocumentCategoryMapping]  WITH CHECK ADD  CONSTRAINT [DocumentCategory_FK_CompanyDocumentCategoryMapping] FOREIGN KEY([DocumentCategoryId])
REFERENCES [dbo].[DocumentCategory] ([Id])
GO

ALTER TABLE [dbo].[CompanyDocumentCategoryMapping] CHECK CONSTRAINT [DocumentCategory_FK_CompanyDocumentCategoryMapping]
GO
ALTER TABLE [dbo].[CompanyDocumentCategoryMapping]  WITH CHECK ADD  CONSTRAINT [UerCreatedBy_FK_CompanyDocumentCategoryMapping] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyDocumentCategoryMapping] CHECK CONSTRAINT [UerCreatedBy_FK_CompanyDocumentCategoryMapping]
GO
ALTER TABLE [dbo].[CompanyDocumentCategoryMapping]  WITH CHECK ADD  CONSTRAINT [UserModifiedBy_FK_CompanyDocumentCategoryMapping] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyDocumentCategoryMapping] CHECK CONSTRAINT [UserModifiedBy_FK_CompanyDocumentCategoryMapping]