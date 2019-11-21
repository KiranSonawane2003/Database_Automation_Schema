CREATE TABLE [dbo].[ItemTypes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ItemType] [nvarchar](500) NOT NULL,
	[Notes] [nvarchar](4000) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[IsActive] [bit] NOT NULL,
	[CountryId] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [ItemTypes_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ItemTypes]  WITH CHECK ADD  CONSTRAINT [ItemTypes_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ItemTypes] CHECK CONSTRAINT [ItemTypes_FK_Country]
GO
ALTER TABLE [dbo].[ItemTypes]  WITH CHECK ADD  CONSTRAINT [ItemTypes_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ItemTypes] CHECK CONSTRAINT [ItemTypes_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ItemTypes]  WITH CHECK ADD  CONSTRAINT [ItemTypes_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ItemTypes] CHECK CONSTRAINT [ItemTypes_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ItemTypes] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ItemTypes] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]