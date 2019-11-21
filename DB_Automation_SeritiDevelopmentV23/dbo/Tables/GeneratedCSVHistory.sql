CREATE TABLE [dbo].[GeneratedCSVHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[FinanceCompanyId] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[MidifiedBy] [int] NULL,
 CONSTRAINT [GeneratedCSVHistory_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GeneratedCSVHistory]  WITH CHECK ADD  CONSTRAINT [GeneratedCSVHistory_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[GeneratedCSVHistory] CHECK CONSTRAINT [GeneratedCSVHistory_FK_Branch]
GO
ALTER TABLE [dbo].[GeneratedCSVHistory]  WITH CHECK ADD  CONSTRAINT [GeneratedCSVHistory_FK_Company] FOREIGN KEY([FinanceCompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[GeneratedCSVHistory] CHECK CONSTRAINT [GeneratedCSVHistory_FK_Company]
GO
ALTER TABLE [dbo].[GeneratedCSVHistory]  WITH CHECK ADD  CONSTRAINT [GeneratedCSVHistory_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[GeneratedCSVHistory] CHECK CONSTRAINT [GeneratedCSVHistory_FK_Group]
GO
ALTER TABLE [dbo].[GeneratedCSVHistory]  WITH CHECK ADD  CONSTRAINT [GeneratedCSVHistory_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[GeneratedCSVHistory] CHECK CONSTRAINT [GeneratedCSVHistory_FK_Transaction]
GO
ALTER TABLE [dbo].[GeneratedCSVHistory]  WITH CHECK ADD  CONSTRAINT [GeneratedCSVHistory_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GeneratedCSVHistory] CHECK CONSTRAINT [GeneratedCSVHistory_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[GeneratedCSVHistory]  WITH CHECK ADD  CONSTRAINT [GeneratedCSVHistory_FK_UsersMidifiedBy] FOREIGN KEY([MidifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GeneratedCSVHistory] CHECK CONSTRAINT [GeneratedCSVHistory_FK_UsersMidifiedBy]