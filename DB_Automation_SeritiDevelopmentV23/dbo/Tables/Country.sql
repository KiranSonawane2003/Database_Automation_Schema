CREATE TABLE [dbo].[Country](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](500) NOT NULL,
	[CountryCode] [nvarchar](200) NULL,
	[Currency] [nvarchar](50) NULL,
	[UTCTimestamp] [datetime] NULL,
	[Sequence] [int] NULL,
	[IsCountryAdministration] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[EnumCountryName] [nvarchar](100) NULL,
	[UTCTimeOffset] [int] NULL,
	[IsGeneric] [bit] NULL,
	[CountryFlag] [nvarchar](200) NULL,
 CONSTRAINT [Country_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Country]  WITH NOCHECK ADD  CONSTRAINT [Country_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [Country_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[Country]  WITH NOCHECK ADD  CONSTRAINT [Country_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [Country_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [Country_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [Country_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table is master for country. This table used for fill country dropdown of Create FSP Company page under Admin >> Companies' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Country'