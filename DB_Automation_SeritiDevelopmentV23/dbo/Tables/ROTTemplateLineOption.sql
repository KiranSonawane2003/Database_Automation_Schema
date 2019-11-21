CREATE TABLE [dbo].[ROTTemplateLineOption](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TemplateLineId] [bigint] NOT NULL,
	[ControlTypeId] [bigint] NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[OptionValue] [nvarchar](1000) NULL,
	[SortKey] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_ROTTemplateLineOption] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ROTTemplateLineOption]  WITH CHECK ADD  CONSTRAINT [FK_ROTTemplateLineOption_ControlType] FOREIGN KEY([ControlTypeId])
REFERENCES [dbo].[ROTControlType] ([Id])
GO

ALTER TABLE [dbo].[ROTTemplateLineOption] CHECK CONSTRAINT [FK_ROTTemplateLineOption_ControlType]
GO
ALTER TABLE [dbo].[ROTTemplateLineOption]  WITH CHECK ADD  CONSTRAINT [FK_ROTTemplateLineOption_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ROTTemplateLineOption] CHECK CONSTRAINT [FK_ROTTemplateLineOption_Country]
GO
ALTER TABLE [dbo].[ROTTemplateLineOption]  WITH CHECK ADD  CONSTRAINT [FK_ROTTemplateLineOption_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ROTTemplateLineOption] CHECK CONSTRAINT [FK_ROTTemplateLineOption_CreatedBy]
GO
ALTER TABLE [dbo].[ROTTemplateLineOption]  WITH CHECK ADD  CONSTRAINT [FK_ROTTemplateLineOption_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ROTTemplateLineOption] CHECK CONSTRAINT [FK_ROTTemplateLineOption_ModifiedBy]
GO
ALTER TABLE [dbo].[ROTTemplateLineOption]  WITH CHECK ADD  CONSTRAINT [FK_ROTTemplateLineOption_TemplateLine] FOREIGN KEY([TemplateLineId])
REFERENCES [dbo].[ROTTemplateLine] ([Id])
GO

ALTER TABLE [dbo].[ROTTemplateLineOption] CHECK CONSTRAINT [FK_ROTTemplateLineOption_TemplateLine]