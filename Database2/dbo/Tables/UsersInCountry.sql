CREATE TABLE [dbo].[UsersInCountry](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_UsersInCountry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UsersInCountry]  WITH NOCHECK ADD  CONSTRAINT [FK_UsersInCountry_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[UsersInCountry] CHECK CONSTRAINT [FK_UsersInCountry_Country]
GO
ALTER TABLE [dbo].[UsersInCountry]  WITH NOCHECK ADD  CONSTRAINT [FK_UsersInCountry_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UsersInCountry] CHECK CONSTRAINT [FK_UsersInCountry_Users]
GO
ALTER TABLE [dbo].[UsersInCountry]  WITH NOCHECK ADD  CONSTRAINT [FK_UsersInCountry_Users1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UsersInCountry] CHECK CONSTRAINT [FK_UsersInCountry_Users1]
GO
ALTER TABLE [dbo].[UsersInCountry]  WITH NOCHECK ADD  CONSTRAINT [FK_UsersInCountry_Users2] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UsersInCountry] CHECK CONSTRAINT [FK_UsersInCountry_Users2]
GO
ALTER TABLE [dbo].[UsersInCountry] ADD  CONSTRAINT [DF_UsersInCountry_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UsersInCountry] ADD  CONSTRAINT [DF_UsersInCountry_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]