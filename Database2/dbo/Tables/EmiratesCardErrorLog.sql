CREATE TABLE [dbo].[EmiratesCardErrorLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NULL,
	[CardError] [nvarchar](200) NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_EmiratesCardErrorLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmiratesCardErrorLog]  WITH CHECK ADD  CONSTRAINT [Transaction_FK_EmiratesCardErrorLog] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[EmiratesCardErrorLog] CHECK CONSTRAINT [Transaction_FK_EmiratesCardErrorLog]
GO
ALTER TABLE [dbo].[EmiratesCardErrorLog]  WITH CHECK ADD  CONSTRAINT [UserCreatedBy_FK_EmiratesCardErrorLog] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmiratesCardErrorLog] CHECK CONSTRAINT [UserCreatedBy_FK_EmiratesCardErrorLog]
GO
ALTER TABLE [dbo].[EmiratesCardErrorLog]  WITH CHECK ADD  CONSTRAINT [UserModifiedBy_FK_EmiratesCardErrorLog] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmiratesCardErrorLog] CHECK CONSTRAINT [UserModifiedBy_FK_EmiratesCardErrorLog]