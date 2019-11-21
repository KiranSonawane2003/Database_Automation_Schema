CREATE TABLE [dbo].[VehicleManufacturer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Manufacturer] [nvarchar](100) NOT NULL,
	[CountryId] [bigint] NULL,
	[ManufacturerDate] [date] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [VehicleManufacturer_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VehicleManufacturer]  WITH NOCHECK ADD  CONSTRAINT [VehicleManufacturer_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[VehicleManufacturer] CHECK CONSTRAINT [VehicleManufacturer_FK_Country]
GO
ALTER TABLE [dbo].[VehicleManufacturer]  WITH NOCHECK ADD  CONSTRAINT [VehicleManufacturer_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[VehicleManufacturer] CHECK CONSTRAINT [VehicleManufacturer_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[VehicleManufacturer]  WITH NOCHECK ADD  CONSTRAINT [VehicleManufacturer_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[VehicleManufacturer] CHECK CONSTRAINT [VehicleManufacturer_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[VehicleManufacturer] ADD  CONSTRAINT [VehicleManufacturer_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[VehicleManufacturer] ADD  CONSTRAINT [VehicleManufacturer_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is master table for Manufacturer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VehicleManufacturer'