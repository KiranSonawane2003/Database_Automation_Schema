CREATE TABLE [dbo].[EmailTemplateLineFiananceStatusMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TemplateLineId] [bigint] NOT NULL,
	[FiananceStatusId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [EmailTemplateLineFiananceStatusMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmailTemplateLineFiananceStatusMapping]  WITH CHECK ADD  CONSTRAINT [EmailTemplateLineFiananceStatusMapping_FK_TemplateLineId] FOREIGN KEY([TemplateLineId])
REFERENCES [dbo].[EmailTemplateLine] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateLineFiananceStatusMapping] CHECK CONSTRAINT [EmailTemplateLineFiananceStatusMapping_FK_TemplateLineId]
GO
ALTER TABLE [dbo].[EmailTemplateLineFiananceStatusMapping]  WITH CHECK ADD  CONSTRAINT [EmailTemplateLineFiananceStatusMapping_FK_TransactionStatusId] FOREIGN KEY([FiananceStatusId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateLineFiananceStatusMapping] CHECK CONSTRAINT [EmailTemplateLineFiananceStatusMapping_FK_TransactionStatusId]
GO
ALTER TABLE [dbo].[EmailTemplateLineFiananceStatusMapping]  WITH CHECK ADD  CONSTRAINT [EmailTemplateLineFiananceStatusMapping_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateLineFiananceStatusMapping] CHECK CONSTRAINT [EmailTemplateLineFiananceStatusMapping_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[EmailTemplateLineFiananceStatusMapping]  WITH CHECK ADD  CONSTRAINT [EmailTemplateLineFiananceStatusMapping_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateLineFiananceStatusMapping] CHECK CONSTRAINT [EmailTemplateLineFiananceStatusMapping_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[EmailTemplateLineFiananceStatusMapping] ADD  CONSTRAINT [DF__EmailTemp__IsAct__217D344A]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmailTemplateLineFiananceStatusMapping] ADD  CONSTRAINT [DF__EmailTemp__Creat__22715883]  DEFAULT (getutcdate()) FOR [CreatedDate]