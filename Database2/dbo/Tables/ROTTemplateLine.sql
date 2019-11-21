CREATE TABLE [dbo].[ROTTemplateLine](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TemplateId] [bigint] NOT NULL,
	[ControlTypeId] [bigint] NULL,
	[SignatureControlTypeID] [bigint] NULL,
	[CountryId] [bigint] NOT NULL,
	[Label] [nvarchar](max) NULL,
	[IsAdditionalComments] [bit] NULL,
	[ImagePath] [nvarchar](1000) NULL,
	[IsDisplayCustomerAccessPage] [bit] NULL,
	[SortKey] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_ROTTemplateLine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ROTTemplateLine]  WITH CHECK ADD  CONSTRAINT [FK_ROTTemplateLine_ControlType] FOREIGN KEY([ControlTypeId])
REFERENCES [dbo].[ROTControlType] ([Id])
GO

ALTER TABLE [dbo].[ROTTemplateLine] CHECK CONSTRAINT [FK_ROTTemplateLine_ControlType]
GO
ALTER TABLE [dbo].[ROTTemplateLine]  WITH CHECK ADD  CONSTRAINT [FK_ROTTemplateLine_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ROTTemplateLine] CHECK CONSTRAINT [FK_ROTTemplateLine_Country]
GO
ALTER TABLE [dbo].[ROTTemplateLine]  WITH CHECK ADD  CONSTRAINT [FK_ROTTemplateLine_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ROTTemplateLine] CHECK CONSTRAINT [FK_ROTTemplateLine_CreatedBy]
GO
ALTER TABLE [dbo].[ROTTemplateLine]  WITH CHECK ADD  CONSTRAINT [FK_ROTTemplateLine_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ROTTemplateLine] CHECK CONSTRAINT [FK_ROTTemplateLine_ModifiedBy]
GO
ALTER TABLE [dbo].[ROTTemplateLine]  WITH CHECK ADD  CONSTRAINT [FK_ROTTemplateLine_SignatureControlType] FOREIGN KEY([SignatureControlTypeID])
REFERENCES [dbo].[ROTControlType] ([Id])
GO

ALTER TABLE [dbo].[ROTTemplateLine] CHECK CONSTRAINT [FK_ROTTemplateLine_SignatureControlType]
GO
ALTER TABLE [dbo].[ROTTemplateLine]  WITH CHECK ADD  CONSTRAINT [FK_ROTTemplateLine_Template] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[Template] ([Id])
GO

ALTER TABLE [dbo].[ROTTemplateLine] CHECK CONSTRAINT [FK_ROTTemplateLine_Template]