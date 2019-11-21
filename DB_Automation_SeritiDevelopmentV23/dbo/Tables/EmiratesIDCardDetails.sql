CREATE TABLE [dbo].[EmiratesIDCardDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionNo] [bigint] NULL,
	[EmiratesIDNo] [nvarchar](200) NULL,
	[TransactionContactId] [bigint] NULL,
	[TransactionClientId] [bigint] NULL,
	[CardNumber] [nvarchar](200) NULL,
	[CardStatusRequestDate] [datetime] NULL,
	[CardStatusResponseDate] [datetime] NULL,
	[CardStatus] [nvarchar](50) NULL,
	[PBDataRequestDate] [datetime] NULL,
	[PBDataResponseDate] [datetime] NULL,
	[PBData] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_EmiratesIDCardDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmiratesIDCardDetails]  WITH CHECK ADD  CONSTRAINT [EmiratesIDCardDetails_FK_Transaction] FOREIGN KEY([TransactionNo])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[EmiratesIDCardDetails] CHECK CONSTRAINT [EmiratesIDCardDetails_FK_Transaction]
GO
ALTER TABLE [dbo].[EmiratesIDCardDetails]  WITH CHECK ADD  CONSTRAINT [EmiratesIDCardDetails_FK_TransactionContact] FOREIGN KEY([TransactionContactId])
REFERENCES [dbo].[TransactionContact] ([Id])
GO

ALTER TABLE [dbo].[EmiratesIDCardDetails] CHECK CONSTRAINT [EmiratesIDCardDetails_FK_TransactionContact]
GO
ALTER TABLE [dbo].[EmiratesIDCardDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmiratesIDCardDetails_Users_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmiratesIDCardDetails] CHECK CONSTRAINT [FK_EmiratesIDCardDetails_Users_CreatedBy]
GO
ALTER TABLE [dbo].[EmiratesIDCardDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmiratesIDCardDetails_Users_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmiratesIDCardDetails] CHECK CONSTRAINT [FK_EmiratesIDCardDetails_Users_ModifiedBy]
GO
ALTER TABLE [dbo].[EmiratesIDCardDetails]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_EmiratesIDCardDetails] FOREIGN KEY([TransactionClientId])
REFERENCES [dbo].[TransactionClient] ([Id])
GO

ALTER TABLE [dbo].[EmiratesIDCardDetails] CHECK CONSTRAINT [TransactionClient_FK_EmiratesIDCardDetails]