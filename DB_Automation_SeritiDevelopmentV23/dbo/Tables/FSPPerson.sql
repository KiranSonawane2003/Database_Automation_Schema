CREATE TABLE [dbo].[FSPPerson](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](100) NULL,
	[Fax] [nvarchar](100) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [FSPPerson_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FSPPerson]  WITH NOCHECK ADD  CONSTRAINT [FSPPerson_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[FSPPerson] CHECK CONSTRAINT [FSPPerson_FK_Country]
GO
ALTER TABLE [dbo].[FSPPerson]  WITH NOCHECK ADD  CONSTRAINT [FSPPerson_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[FSPPerson] CHECK CONSTRAINT [FSPPerson_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[FSPPerson]  WITH NOCHECK ADD  CONSTRAINT [FSPPerson_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[FSPPerson] CHECK CONSTRAINT [FSPPerson_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[FSPPerson] ADD  CONSTRAINT [FSPPerson_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[FSPPerson] ADD  CONSTRAINT [FSPPerson_DF_.CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store fields from FSP Person Admin under Administration >>FSP Person Admn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FSPPerson'