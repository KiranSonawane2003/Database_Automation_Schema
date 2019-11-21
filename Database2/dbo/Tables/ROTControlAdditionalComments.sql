CREATE TABLE [dbo].[ROTControlAdditionalComments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TemplateLineId] [bigint] NULL,
	[ControlTypeId] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[AdditionalComments] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[TransactionId] [bigint] NULL,
 CONSTRAINT [PK_ROTControlAdditionalComments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ROTControlAdditionalComments]  WITH CHECK ADD  CONSTRAINT [FK_ROTControlAdditionalComments_ControlType] FOREIGN KEY([ControlTypeId])
REFERENCES [dbo].[ROTControlType] ([Id])
GO

ALTER TABLE [dbo].[ROTControlAdditionalComments] CHECK CONSTRAINT [FK_ROTControlAdditionalComments_ControlType]
GO
ALTER TABLE [dbo].[ROTControlAdditionalComments]  WITH CHECK ADD  CONSTRAINT [FK_ROTControlAdditionalComments_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ROTControlAdditionalComments] CHECK CONSTRAINT [FK_ROTControlAdditionalComments_Country]
GO
ALTER TABLE [dbo].[ROTControlAdditionalComments]  WITH CHECK ADD  CONSTRAINT [FK_ROTControlAdditionalComments_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ROTControlAdditionalComments] CHECK CONSTRAINT [FK_ROTControlAdditionalComments_CreatedBy]
GO
ALTER TABLE [dbo].[ROTControlAdditionalComments]  WITH CHECK ADD  CONSTRAINT [FK_ROTControlAdditionalComments_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ROTControlAdditionalComments] CHECK CONSTRAINT [FK_ROTControlAdditionalComments_ModifiedBy]
GO
ALTER TABLE [dbo].[ROTControlAdditionalComments]  WITH CHECK ADD  CONSTRAINT [FK_ROTControlAdditionalComments_TemplateLine] FOREIGN KEY([TemplateLineId])
REFERENCES [dbo].[ROTTemplateLine] ([Id])
GO

ALTER TABLE [dbo].[ROTControlAdditionalComments] CHECK CONSTRAINT [FK_ROTControlAdditionalComments_TemplateLine]
GO
ALTER TABLE [dbo].[ROTControlAdditionalComments]  WITH CHECK ADD  CONSTRAINT [FK_ROTControlAdditionalComments_TransactionID] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[ROTControlAdditionalComments] CHECK CONSTRAINT [FK_ROTControlAdditionalComments_TransactionID]