CREATE TABLE [dbo].[EmailDetailsManual](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FromEMail] [nvarchar](100) NULL,
	[ToEMail] [nvarchar](500) NULL,
	[CC] [nvarchar](500) NULL,
	[BCC] [nvarchar](500) NULL,
	[Subject] [nvarchar](500) NULL,
	[MessageBody] [nvarchar](max) NULL,
	[isSent] [bit] NULL,
	[isDrafted] [bit] NULL,
	[GroupID] [bigint] NULL,
	[BranchID] [bigint] NULL,
	[TemplateID] [bigint] NULL,
	[TransactionID] [bigint] NULL,
	[IncludeBusinessManager] [bit] NULL,
	[IncludeClient] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[TemplateLineID] [bigint] NULL,
	[IncludeSalesPerson] [bit] NULL,
	[ToBusinessManager] [bit] NULL,
 CONSTRAINT [EmailDetailsManual_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmailDetailsManual]  WITH CHECK ADD  CONSTRAINT [EmailDetailsManual_FK_BranchID] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[EmailDetailsManual] CHECK CONSTRAINT [EmailDetailsManual_FK_BranchID]
GO
ALTER TABLE [dbo].[EmailDetailsManual]  WITH CHECK ADD  CONSTRAINT [EmailDetailsManual_FK_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[EmailDetailsManual] CHECK CONSTRAINT [EmailDetailsManual_FK_GroupID]
GO
ALTER TABLE [dbo].[EmailDetailsManual]  WITH CHECK ADD  CONSTRAINT [EmailDetailsManual_FK_TemplateID] FOREIGN KEY([TemplateID])
REFERENCES [dbo].[Template] ([Id])
GO

ALTER TABLE [dbo].[EmailDetailsManual] CHECK CONSTRAINT [EmailDetailsManual_FK_TemplateID]
GO
ALTER TABLE [dbo].[EmailDetailsManual]  WITH CHECK ADD  CONSTRAINT [EmailDetailsManual_FK_TemplateLineID] FOREIGN KEY([TemplateLineID])
REFERENCES [dbo].[EmailTemplateLine] ([Id])
GO

ALTER TABLE [dbo].[EmailDetailsManual] CHECK CONSTRAINT [EmailDetailsManual_FK_TemplateLineID]
GO
ALTER TABLE [dbo].[EmailDetailsManual]  WITH CHECK ADD  CONSTRAINT [EmailDetailsManual_FK_TransactionID] FOREIGN KEY([TransactionID])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[EmailDetailsManual] CHECK CONSTRAINT [EmailDetailsManual_FK_TransactionID]
GO
ALTER TABLE [dbo].[EmailDetailsManual]  WITH CHECK ADD  CONSTRAINT [EmailDetailsManual_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmailDetailsManual] CHECK CONSTRAINT [EmailDetailsManual_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[EmailDetailsManual]  WITH CHECK ADD  CONSTRAINT [EmailDetailsManual_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmailDetailsManual] CHECK CONSTRAINT [EmailDetailsManual_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[EmailDetailsManual] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmailDetailsManual] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]