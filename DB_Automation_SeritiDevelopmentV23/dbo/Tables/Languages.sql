CREATE TABLE [dbo].[Languages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageName] [nvarchar](100) NULL,
	[CountryId] [bigint] NOT NULL,
	[IsRTL] [bit] NOT NULL,
	[Culture] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [Languages_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Languages]  WITH NOCHECK ADD  CONSTRAINT [Languages_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Languages] CHECK CONSTRAINT [Languages_FK_Country]
GO
ALTER TABLE [dbo].[Languages]  WITH NOCHECK ADD  CONSTRAINT [Languages_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Languages] CHECK CONSTRAINT [Languages_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[Languages]  WITH NOCHECK ADD  CONSTRAINT [Languages_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Languages] CHECK CONSTRAINT [Languages_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[Languages] ADD  CONSTRAINT [DF_Languages_IsRTL]  DEFAULT ((0)) FOR [IsRTL]
GO
ALTER TABLE [dbo].[Languages] ADD  CONSTRAINT [DF_Languages_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Languages] ADD  CONSTRAINT [DF_Languages_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]