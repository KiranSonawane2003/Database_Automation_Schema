CREATE TABLE [dbo].[Vehicle](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VehicleCode] [nvarchar](100) NULL,
	[ManufacturerId] [bigint] NULL,
	[Model] [nvarchar](100) NULL,
	[VehicleTypeId] [bigint] NULL,
	[BodyTypeId] [bigint] NULL,
	[IntroductionDate] [date] NULL,
	[TerminationDate] [date] NULL,
	[EngineCapacity] [int] NULL,
	[EnginePower] [nvarchar](100) NULL,
	[Cylinders] [int] NULL,
	[Doors] [nvarchar](50) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[Weight] [decimal](18, 2) NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[ModelYear] [int] NULL,
	[TransmissionTypeId] [bigint] NULL,
	[Trim] [nvarchar](50) NULL,
	[RegYear] [int] NULL,
	[Variant] [nvarchar](max) NULL,
	[PublicationSection] [nvarchar](max) NULL,
	[MasterModel] [nvarchar](max) NULL,
	[MakeCode] [int] NULL,
	[ModelCode] [int] NULL,
	[VariantCode] [int] NULL,
	[AxleConfiguration] [nvarchar](max) NULL,
	[Drive] [nvarchar](max) NULL,
	[Seats] [int] NULL,
	[Use] [nvarchar](max) NULL,
	[WheelBase] [nvarchar](max) NULL,
	[NoGears] [int] NULL,
	[Cooling] [nvarchar](max) NULL,
	[CylConfiguration] [nvarchar](max) NULL,
	[EngineCycle] [int] NULL,
	[FuelTankSize] [decimal](18, 2) NULL,
	[FuelType] [nvarchar](max) NULL,
	[TurboOrSuperCharged] [nvarchar](max) NULL,
	[GCM] [int] NULL,
	[GVM] [int] NULL,
	[Tare] [int] NULL,
	[Origin] [nvarchar](max) NULL,
	[FrontNoTyres] [int] NULL,
	[FrontTyreSize] [nvarchar](max) NULL,
	[RearNoTyres] [int] NULL,
	[RearTyreSize] [nvarchar](max) NULL,
	[CO2] [int] NULL,
	[Length] [int] NULL,
	[Height] [int] NULL,
	[Width] [int] NULL,
	[NewListPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vehicle]  WITH NOCHECK ADD  CONSTRAINT [Vehicle_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [Vehicle_FK_Branch]
GO
ALTER TABLE [dbo].[Vehicle]  WITH NOCHECK ADD  CONSTRAINT [Vehicle_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [Vehicle_FK_Country]
GO
ALTER TABLE [dbo].[Vehicle]  WITH NOCHECK ADD  CONSTRAINT [Vehicle_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [Vehicle_FK_Group]
GO
ALTER TABLE [dbo].[Vehicle]  WITH NOCHECK ADD  CONSTRAINT [Vehicle_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [Vehicle_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[Vehicle]  WITH NOCHECK ADD  CONSTRAINT [Vehicle_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [Vehicle_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[Vehicle]  WITH NOCHECK ADD  CONSTRAINT [Vehicle_FK_VehicleBodyType] FOREIGN KEY([BodyTypeId])
REFERENCES [dbo].[VehicleBodyType] ([Id])
GO

ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [Vehicle_FK_VehicleBodyType]
GO
ALTER TABLE [dbo].[Vehicle]  WITH NOCHECK ADD  CONSTRAINT [Vehicle_FK_VehicleManufacturer] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[VehicleManufacturer] ([Id])
GO

ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [Vehicle_FK_VehicleManufacturer]
GO
ALTER TABLE [dbo].[Vehicle]  WITH NOCHECK ADD  CONSTRAINT [Vehicle_FK_VehicleType] FOREIGN KEY([VehicleTypeId])
REFERENCES [dbo].[VehicleType] ([Id])
GO

ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [Vehicle_FK_VehicleType]
GO
ALTER TABLE [dbo].[Vehicle]  WITH NOCHECK ADD  CONSTRAINT [Vehicle_SFK_taticValueTransmissionType] FOREIGN KEY([TransmissionTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [Vehicle_SFK_taticValueTransmissionType]
GO
ALTER TABLE [dbo].[Vehicle] ADD  CONSTRAINT [Vehicle_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Vehicle] ADD  CONSTRAINT [Vehicle_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table VehicleManufacurer.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vehicle', @level2type=N'COLUMN',@level2name=N'ManufacturerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table VehicleType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vehicle', @level2type=N'COLUMN',@level2name=N'VehicleTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table VehicleBodyType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vehicle', @level2type=N'COLUMN',@level2name=N'BodyTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Introduction date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vehicle', @level2type=N'COLUMN',@level2name=N'IntroductionDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is table use to store created vehicle information under system >> Vehicle Code >> Create vehicle code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vehicle'