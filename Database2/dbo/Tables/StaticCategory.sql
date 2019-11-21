CREATE TABLE [dbo].[StaticCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_StaticCategory_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StaticCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_StaticCategory_Users] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[StaticCategory] CHECK CONSTRAINT [FK_StaticCategory_Users]
GO
ALTER TABLE [dbo].[StaticCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_StaticCategory_Users1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[StaticCategory] CHECK CONSTRAINT [FK_StaticCategory_Users1]
GO
ALTER TABLE [dbo].[StaticCategory] ADD  CONSTRAINT [DF_StaticCategory_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[StaticCategory] ADD  CONSTRAINT [DF_StaticCategory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]