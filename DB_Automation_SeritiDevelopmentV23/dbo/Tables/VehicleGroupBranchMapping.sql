CREATE TABLE [dbo].[VehicleGroupBranchMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VehicleId] [bigint] NOT NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [VehicleGroupBranchMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VehicleGroupBranchMapping]  WITH NOCHECK ADD  CONSTRAINT [VehicleGroupBranchMapping_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[VehicleGroupBranchMapping] CHECK CONSTRAINT [VehicleGroupBranchMapping_FK_Branch]
GO
ALTER TABLE [dbo].[VehicleGroupBranchMapping]  WITH NOCHECK ADD  CONSTRAINT [VehicleGroupBranchMapping_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[VehicleGroupBranchMapping] CHECK CONSTRAINT [VehicleGroupBranchMapping_FK_Country]
GO
ALTER TABLE [dbo].[VehicleGroupBranchMapping]  WITH NOCHECK ADD  CONSTRAINT [VehicleGroupBranchMapping_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[VehicleGroupBranchMapping] CHECK CONSTRAINT [VehicleGroupBranchMapping_FK_Group]
GO
ALTER TABLE [dbo].[VehicleGroupBranchMapping]  WITH NOCHECK ADD  CONSTRAINT [VehicleGroupBranchMapping_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[VehicleGroupBranchMapping] CHECK CONSTRAINT [VehicleGroupBranchMapping_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[VehicleGroupBranchMapping]  WITH NOCHECK ADD  CONSTRAINT [VehicleGroupBranchMapping_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[VehicleGroupBranchMapping] CHECK CONSTRAINT [VehicleGroupBranchMapping_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[VehicleGroupBranchMapping]  WITH NOCHECK ADD  CONSTRAINT [VehicleGroupBranchMapping_FK_Vehicle] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicle] ([Id])
GO

ALTER TABLE [dbo].[VehicleGroupBranchMapping] CHECK CONSTRAINT [VehicleGroupBranchMapping_FK_Vehicle]