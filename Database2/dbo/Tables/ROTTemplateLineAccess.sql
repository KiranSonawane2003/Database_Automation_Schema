CREATE TABLE [dbo].[ROTTemplateLineAccess](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TemplateId] [bigint] NOT NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[CountryId] [bigint] NOT NULL,
	[SortKey] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_ROTTemplateLineAccess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ROTTemplateLineAccess]  WITH CHECK ADD  CONSTRAINT [FK_ROTTemplateLineAccess_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[ROTTemplateLineAccess] CHECK CONSTRAINT [FK_ROTTemplateLineAccess_Branch]
GO
ALTER TABLE [dbo].[ROTTemplateLineAccess]  WITH CHECK ADD  CONSTRAINT [FK_ROTTemplateLineAccess_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ROTTemplateLineAccess] CHECK CONSTRAINT [FK_ROTTemplateLineAccess_Country]
GO
ALTER TABLE [dbo].[ROTTemplateLineAccess]  WITH CHECK ADD  CONSTRAINT [FK_ROTTemplateLineAccess_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[ROTTemplateLineAccess] CHECK CONSTRAINT [FK_ROTTemplateLineAccess_Group]
GO
ALTER TABLE [dbo].[ROTTemplateLineAccess]  WITH CHECK ADD  CONSTRAINT [FK_ROTTemplateLineAccess_Template] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[Template] ([Id])
GO

ALTER TABLE [dbo].[ROTTemplateLineAccess] CHECK CONSTRAINT [FK_ROTTemplateLineAccess_Template]