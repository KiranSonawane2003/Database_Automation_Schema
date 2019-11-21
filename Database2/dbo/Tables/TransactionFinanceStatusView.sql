CREATE TABLE [dbo].[TransactionFinanceStatusView](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TemplateCategoryId] [bigint] NULL,
	[GroupingName] [nvarchar](200) NULL,
	[CountryId] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TransactionFinanceStatusView] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionFinanceStatusView]  WITH CHECK ADD  CONSTRAINT [FK_TransactionFinanceStatusView_TemplateCategory] FOREIGN KEY([TemplateCategoryId])
REFERENCES [dbo].[TemplateCategory] ([Id])
GO

ALTER TABLE [dbo].[TransactionFinanceStatusView] CHECK CONSTRAINT [FK_TransactionFinanceStatusView_TemplateCategory]
GO
ALTER TABLE [dbo].[TransactionFinanceStatusView]  WITH CHECK ADD  CONSTRAINT [FK_TransactionFinanceStatusView_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionFinanceStatusView] CHECK CONSTRAINT [FK_TransactionFinanceStatusView_Users]
GO
ALTER TABLE [dbo].[TransactionFinanceStatusView]  WITH CHECK ADD  CONSTRAINT [FK_TransactionFinanceStatusView_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionFinanceStatusView] CHECK CONSTRAINT [FK_TransactionFinanceStatusView_Users1]