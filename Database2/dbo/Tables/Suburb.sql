CREATE TABLE [dbo].[Suburb](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SuburbName] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[PostCode] [nvarchar](100) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreartedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [Suburb_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Suburb]  WITH NOCHECK ADD  CONSTRAINT [Suburb_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Suburb] CHECK CONSTRAINT [Suburb_FK_Country]
GO
ALTER TABLE [dbo].[Suburb]  WITH NOCHECK ADD  CONSTRAINT [Suburb_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Suburb] CHECK CONSTRAINT [Suburb_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[Suburb]  WITH NOCHECK ADD  CONSTRAINT [Suburb_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Suburb] CHECK CONSTRAINT [Suburb_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[Suburb] ADD  CONSTRAINT [Suburb_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Suburb] ADD  CONSTRAINT [Suburb_DF_CreartedDate]  DEFAULT (getutcdate()) FOR [CreartedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This Table stores suburb master data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suburb'