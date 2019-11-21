CREATE TABLE [dbo].[VehicleBodyType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BodyStyle] [nvarchar](100) NULL,
	[CountryId] [bigint] NULL,
	[BodyTypeAbbreviation] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [VehicleBodyType_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VehicleBodyType]  WITH NOCHECK ADD  CONSTRAINT [VehicleBodyType_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[VehicleBodyType] CHECK CONSTRAINT [VehicleBodyType_FK_Country]
GO
ALTER TABLE [dbo].[VehicleBodyType]  WITH NOCHECK ADD  CONSTRAINT [VehicleBodyType_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[VehicleBodyType] CHECK CONSTRAINT [VehicleBodyType_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[VehicleBodyType]  WITH NOCHECK ADD  CONSTRAINT [VehicleBodyType_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[VehicleBodyType] CHECK CONSTRAINT [VehicleBodyType_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[VehicleBodyType] ADD  CONSTRAINT [VehicleBodyType_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[VehicleBodyType] ADD  CONSTRAINT [VehicleBodyType_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table is master for vehicle body type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VehicleBodyType'