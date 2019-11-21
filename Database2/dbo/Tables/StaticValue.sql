CREATE TABLE [dbo].[StaticValue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StaticCategoryId] [bigint] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[EnumName] [nvarchar](200) NULL,
	[Code] [nvarchar](100) NULL,
	[Location] [nvarchar](200) NULL,
	[ParentId] [bigint] NULL,
	[SortOrder] [int] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_StaticValue_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StaticValue]  WITH NOCHECK ADD  CONSTRAINT [FK_StaticValue_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[StaticValue] CHECK CONSTRAINT [FK_StaticValue_Country]
GO
ALTER TABLE [dbo].[StaticValue]  WITH NOCHECK ADD  CONSTRAINT [FK_StaticValue_StaticCategory] FOREIGN KEY([StaticCategoryId])
REFERENCES [dbo].[StaticCategory] ([Id])
GO

ALTER TABLE [dbo].[StaticValue] CHECK CONSTRAINT [FK_StaticValue_StaticCategory]
GO
ALTER TABLE [dbo].[StaticValue]  WITH NOCHECK ADD  CONSTRAINT [FK_StaticValue_StaticValue] FOREIGN KEY([Id])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[StaticValue] CHECK CONSTRAINT [FK_StaticValue_StaticValue]
GO
ALTER TABLE [dbo].[StaticValue]  WITH NOCHECK ADD  CONSTRAINT [FK_StaticValue_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[StaticValue] CHECK CONSTRAINT [FK_StaticValue_Users]
GO
ALTER TABLE [dbo].[StaticValue]  WITH NOCHECK ADD  CONSTRAINT [FK_StaticValue_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[StaticValue] CHECK CONSTRAINT [FK_StaticValue_Users1]
GO
ALTER TABLE [dbo].[StaticValue] ADD  CONSTRAINT [DF_StaticValue_IsActive]  DEFAULT ((1)) FOR [IsActive]