CREATE TABLE [dbo].[Notes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NULL,
	[Notes] [nvarchar](4000) NULL,
	[NotesTypeEnum] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [Notes_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [Notes_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [Notes_FK_Transaction]
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [Notes_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [Notes_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [Notes_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [Notes_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[Notes] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Notes] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]