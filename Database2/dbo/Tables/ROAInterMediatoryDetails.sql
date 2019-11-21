CREATE TABLE [dbo].[ROAInterMediatoryDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TemplateLineId] [bigint] NOT NULL,
	[ControlTypeId] [bigint] NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[Name] [nvarchar](500) NULL,
	[IsSignaturePerson] [bit] NULL,
	[InterMediatoryDetailsValue] [nvarchar](max) NULL,
	[TemplateLineOptionId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[TransactionId] [bigint] NULL,
 CONSTRAINT [PK_ROAInterMediatoryDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ROAInterMediatoryDetails]  WITH CHECK ADD  CONSTRAINT [FK_ROAInterMediatoryDetails_ControlType] FOREIGN KEY([ControlTypeId])
REFERENCES [dbo].[ROTControlType] ([Id])
GO

ALTER TABLE [dbo].[ROAInterMediatoryDetails] CHECK CONSTRAINT [FK_ROAInterMediatoryDetails_ControlType]
GO
ALTER TABLE [dbo].[ROAInterMediatoryDetails]  WITH CHECK ADD  CONSTRAINT [FK_ROAInterMediatoryDetails_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ROAInterMediatoryDetails] CHECK CONSTRAINT [FK_ROAInterMediatoryDetails_Country]
GO
ALTER TABLE [dbo].[ROAInterMediatoryDetails]  WITH CHECK ADD  CONSTRAINT [FK_ROAInterMediatoryDetails_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ROAInterMediatoryDetails] CHECK CONSTRAINT [FK_ROAInterMediatoryDetails_CreatedBy]
GO
ALTER TABLE [dbo].[ROAInterMediatoryDetails]  WITH CHECK ADD  CONSTRAINT [FK_ROAInterMediatoryDetails_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ROAInterMediatoryDetails] CHECK CONSTRAINT [FK_ROAInterMediatoryDetails_ModifiedBy]
GO
ALTER TABLE [dbo].[ROAInterMediatoryDetails]  WITH CHECK ADD  CONSTRAINT [FK_ROAInterMediatoryDetails_TemplateLineId] FOREIGN KEY([TemplateLineId])
REFERENCES [dbo].[ROTTemplateLine] ([Id])
GO

ALTER TABLE [dbo].[ROAInterMediatoryDetails] CHECK CONSTRAINT [FK_ROAInterMediatoryDetails_TemplateLineId]
GO
ALTER TABLE [dbo].[ROAInterMediatoryDetails]  WITH CHECK ADD  CONSTRAINT [FK_ROAInterMediatoryDetails_TemplateLineOptionID] FOREIGN KEY([TemplateLineOptionId])
REFERENCES [dbo].[ROTTemplateLineOption] ([Id])
GO

ALTER TABLE [dbo].[ROAInterMediatoryDetails] CHECK CONSTRAINT [FK_ROAInterMediatoryDetails_TemplateLineOptionID]
GO
ALTER TABLE [dbo].[ROAInterMediatoryDetails]  WITH CHECK ADD  CONSTRAINT [FK_ROAInterMediatoryDetails_TransactionId] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[ROAInterMediatoryDetails] CHECK CONSTRAINT [FK_ROAInterMediatoryDetails_TransactionId]