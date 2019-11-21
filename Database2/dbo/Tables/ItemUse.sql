CREATE TABLE [dbo].[ItemUse](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ItemUse] [nvarchar](500) NOT NULL,
	[Notes] [nvarchar](4000) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[IsActive] [bit] NOT NULL,
	[CountryId] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [ItemUse_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ItemUse]  WITH CHECK ADD  CONSTRAINT [ItemUse_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ItemUse] CHECK CONSTRAINT [ItemUse_FK_Country]
GO
ALTER TABLE [dbo].[ItemUse]  WITH CHECK ADD  CONSTRAINT [ItemUse_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ItemUse] CHECK CONSTRAINT [ItemUse_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ItemUse]  WITH CHECK ADD  CONSTRAINT [ItemUse_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ItemUse] CHECK CONSTRAINT [ItemUse_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ItemUse] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ItemUse] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]