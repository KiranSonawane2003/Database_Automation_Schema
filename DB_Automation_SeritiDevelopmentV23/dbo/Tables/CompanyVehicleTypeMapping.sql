CREATE TABLE [dbo].[CompanyVehicleTypeMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VehicleTypeId] [bigint] NOT NULL,
	[CompanyId] [bigint] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreateDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[Code] [nvarchar](100) NULL,
 CONSTRAINT [PK_CompanyVehicleTypeMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyVehicleTypeMapping]  WITH CHECK ADD  CONSTRAINT [CompanyVehicleTypeMapping_FK_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[CompanyVehicleTypeMapping] CHECK CONSTRAINT [CompanyVehicleTypeMapping_FK_Company]
GO
ALTER TABLE [dbo].[CompanyVehicleTypeMapping]  WITH CHECK ADD  CONSTRAINT [CompanyVehicleTypeMapping_FK_CompanyVehicleTypeMapping] FOREIGN KEY([VehicleTypeId])
REFERENCES [dbo].[VehicleType] ([Id])
GO

ALTER TABLE [dbo].[CompanyVehicleTypeMapping] CHECK CONSTRAINT [CompanyVehicleTypeMapping_FK_CompanyVehicleTypeMapping]
GO
ALTER TABLE [dbo].[CompanyVehicleTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_CompanyVehicleTypeMapping_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyVehicleTypeMapping] CHECK CONSTRAINT [FK_CompanyVehicleTypeMapping_Users]
GO
ALTER TABLE [dbo].[CompanyVehicleTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_CompanyVehicleTypeMapping_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyVehicleTypeMapping] CHECK CONSTRAINT [FK_CompanyVehicleTypeMapping_Users1]