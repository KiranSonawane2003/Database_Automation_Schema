CREATE TABLE [dbo].[MenuTab](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](max) NOT NULL,
	[ParentId] [int] NULL,
	[Sequence] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedBy] [bigint] NULL,
 CONSTRAINT [MenuTab_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MenuTab]  WITH NOCHECK ADD  CONSTRAINT [MenuTab_MenuTab_PK] FOREIGN KEY([ParentId])
REFERENCES [dbo].[MenuTab] ([Id])
GO

ALTER TABLE [dbo].[MenuTab] CHECK CONSTRAINT [MenuTab_MenuTab_PK]
GO
ALTER TABLE [dbo].[MenuTab] ADD  CONSTRAINT [MenuTab_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MenuTab] ADD  CONSTRAINT [MenuTab_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]