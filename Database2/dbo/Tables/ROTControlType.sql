CREATE TABLE [dbo].[ROTControlType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[CountryId] [bigint] NOT NULL,
	[IsSignaturePerson] [bit] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[IsInputRequired] [bit] NULL,
	[EnumName] [nvarchar](500) NULL,
 CONSTRAINT [PK_ROTControlType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ROTControlType]  WITH CHECK ADD  CONSTRAINT [FK_ROTControlType_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ROTControlType] CHECK CONSTRAINT [FK_ROTControlType_Country]
GO
ALTER TABLE [dbo].[ROTControlType]  WITH CHECK ADD  CONSTRAINT [FK_ROTControlType_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ROTControlType] CHECK CONSTRAINT [FK_ROTControlType_CreatedBy]
GO
ALTER TABLE [dbo].[ROTControlType]  WITH CHECK ADD  CONSTRAINT [FK_ROTControlType_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ROTControlType] CHECK CONSTRAINT [FK_ROTControlType_ModifiedBy]