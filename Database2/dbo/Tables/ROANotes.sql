CREATE TABLE [dbo].[ROANotes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ROAType] [int] NULL,
	[ProductFeedback] [nvarchar](1000) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[ProductSubTypeID] [bigint] NULL,
	[IsRecordofTransaction] [bit] NULL,
	[IsVestedInterestType] [bit] NULL,
 CONSTRAINT [PK_ROANotes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ROANotes]  WITH CHECK ADD  CONSTRAINT [FK_ROANotes_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ROANotes] CHECK CONSTRAINT [FK_ROANotes_Country]
GO
ALTER TABLE [dbo].[ROANotes]  WITH CHECK ADD  CONSTRAINT [FK_ROANotes_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ROANotes] CHECK CONSTRAINT [FK_ROANotes_CreatedBy]
GO
ALTER TABLE [dbo].[ROANotes]  WITH CHECK ADD  CONSTRAINT [FK_ROANotes_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ROANotes] CHECK CONSTRAINT [FK_ROANotes_ModifiedBy]
GO
ALTER TABLE [dbo].[ROANotes]  WITH CHECK ADD  CONSTRAINT [FK_ROANotes_ProductSubType] FOREIGN KEY([ProductSubTypeID])
REFERENCES [dbo].[ProductSubType] ([Id])
GO

ALTER TABLE [dbo].[ROANotes] CHECK CONSTRAINT [FK_ROANotes_ProductSubType]
GO
ALTER TABLE [dbo].[ROANotes]  WITH CHECK ADD  CONSTRAINT [FK_ROANotes_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[ROANotes] CHECK CONSTRAINT [FK_ROANotes_Transaction]