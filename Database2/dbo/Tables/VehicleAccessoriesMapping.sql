CREATE TABLE [dbo].[VehicleAccessoriesMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VehicleId] [bigint] NOT NULL,
	[AccessoryId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [VehicleAccessoriesMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VehicleAccessoriesMapping]  WITH CHECK ADD  CONSTRAINT [VehicleAccessoriesMapping_FK_Accessory] FOREIGN KEY([AccessoryId])
REFERENCES [dbo].[Accessories] ([Id])
GO

ALTER TABLE [dbo].[VehicleAccessoriesMapping] CHECK CONSTRAINT [VehicleAccessoriesMapping_FK_Accessory]
GO
ALTER TABLE [dbo].[VehicleAccessoriesMapping]  WITH CHECK ADD  CONSTRAINT [VehicleAccessoriesMapping_FK_Vehicle] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicle] ([Id])
GO

ALTER TABLE [dbo].[VehicleAccessoriesMapping] CHECK CONSTRAINT [VehicleAccessoriesMapping_FK_Vehicle]