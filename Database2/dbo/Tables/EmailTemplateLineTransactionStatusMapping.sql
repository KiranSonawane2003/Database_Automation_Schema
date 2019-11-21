CREATE TABLE [dbo].[EmailTemplateLineTransactionStatusMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TemplateLineId] [bigint] NOT NULL,
	[TransactionStatusId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [EmailTemplateLineTransactionStatusMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmailTemplateLineTransactionStatusMapping]  WITH CHECK ADD  CONSTRAINT [EmailTemplateLineTransactionStatusMapping_FK_TemplateLineId] FOREIGN KEY([TemplateLineId])
REFERENCES [dbo].[EmailTemplateLine] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateLineTransactionStatusMapping] CHECK CONSTRAINT [EmailTemplateLineTransactionStatusMapping_FK_TemplateLineId]
GO
ALTER TABLE [dbo].[EmailTemplateLineTransactionStatusMapping]  WITH CHECK ADD  CONSTRAINT [EmailTemplateLineTransactionStatusMapping_FK_TransactionStatusId] FOREIGN KEY([TransactionStatusId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateLineTransactionStatusMapping] CHECK CONSTRAINT [EmailTemplateLineTransactionStatusMapping_FK_TransactionStatusId]
GO
ALTER TABLE [dbo].[EmailTemplateLineTransactionStatusMapping]  WITH CHECK ADD  CONSTRAINT [EmailTemplateLineTransactionStatusMapping_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateLineTransactionStatusMapping] CHECK CONSTRAINT [EmailTemplateLineTransactionStatusMapping_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[EmailTemplateLineTransactionStatusMapping]  WITH CHECK ADD  CONSTRAINT [EmailTemplateLineTransactionStatusMapping_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmailTemplateLineTransactionStatusMapping] CHECK CONSTRAINT [EmailTemplateLineTransactionStatusMapping_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[EmailTemplateLineTransactionStatusMapping] ADD  CONSTRAINT [DF__EmailTemp__IsAct__2459A0F5]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmailTemplateLineTransactionStatusMapping] ADD  CONSTRAINT [DF__EmailTemp__Creat__254DC52E]  DEFAULT (getutcdate()) FOR [CreatedDate]