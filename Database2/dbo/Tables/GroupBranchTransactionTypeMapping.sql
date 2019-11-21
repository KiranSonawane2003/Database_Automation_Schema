CREATE TABLE [dbo].[GroupBranchTransactionTypeMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NULL,
	[GroupLineId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[BranchLineId] [bigint] NULL,
	[TransactionTypeId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [GroupBranchTransactionTypeMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping]  WITH CHECK ADD  CONSTRAINT [GroupBranchTransactionTypeMapping_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping] CHECK CONSTRAINT [GroupBranchTransactionTypeMapping_FK_Branch]
GO
ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping]  WITH CHECK ADD  CONSTRAINT [GroupBranchTransactionTypeMapping_FK_BranchLine] FOREIGN KEY([BranchLineId])
REFERENCES [dbo].[BranchLine] ([Id])
GO

ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping] CHECK CONSTRAINT [GroupBranchTransactionTypeMapping_FK_BranchLine]
GO
ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping]  WITH CHECK ADD  CONSTRAINT [GroupBranchTransactionTypeMapping_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping] CHECK CONSTRAINT [GroupBranchTransactionTypeMapping_FK_Group]
GO
ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping]  WITH CHECK ADD  CONSTRAINT [GroupBranchTransactionTypeMapping_FK_GroupLine] FOREIGN KEY([GroupLineId])
REFERENCES [dbo].[GroupLine] ([Id])
GO

ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping] CHECK CONSTRAINT [GroupBranchTransactionTypeMapping_FK_GroupLine]
GO
ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping]  WITH CHECK ADD  CONSTRAINT [GroupBranchTransactionTypeMapping_FK_StaticValue] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping] CHECK CONSTRAINT [GroupBranchTransactionTypeMapping_FK_StaticValue]
GO
ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping]  WITH CHECK ADD  CONSTRAINT [GroupBranchTransactionTypeMapping_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping] CHECK CONSTRAINT [GroupBranchTransactionTypeMapping_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping]  WITH CHECK ADD  CONSTRAINT [GroupBranchTransactionTypeMapping_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping] CHECK CONSTRAINT [GroupBranchTransactionTypeMapping_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping] ADD  CONSTRAINT [DF__GroupBran__IsAct__0E3F774D]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GroupBranchTransactionTypeMapping] ADD  CONSTRAINT [DF__GroupBran__Creat__0F339B86]  DEFAULT (getutcdate()) FOR [CreatedDate]