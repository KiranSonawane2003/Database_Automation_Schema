CREATE TABLE [dbo].[Branch](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[BranchName] [nvarchar](100) NOT NULL,
	[BranchCode] [nvarchar](50) NOT NULL,
	[BranchLogo] [nvarchar](200) NULL,
	[PrimeAdjustment] [decimal](18, 2) NULL,
	[FinanceTerm] [int] NULL,
	[BussinessManagerId] [int] NULL,
	[VehicleBussinessManagerId] [int] NULL,
	[FSPCompanyId] [bigint] NULL,
	[OverrideAdviceLicence] [bit] NULL,
	[ComplaintsOfficerId] [bigint] NULL,
	[VATNumber] [bigint] NULL,
	[PhyAddCountryId] [bigint] NULL,
	[PostAddCountryId] [bigint] NULL,
	[WorkTelephoneCode] [nvarchar](50) NULL,
	[WorkTelephoneNumber] [nvarchar](50) NULL,
	[FaxNumberCode] [nvarchar](50) NULL,
	[FaxNumber] [nvarchar](50) NULL,
	[MarketerId] [int] NULL,
	[Workflow] [bigint] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[PhyAddBuildingName] [nvarchar](200) NULL,
	[PhyAddStreetName] [nvarchar](200) NULL,
	[PhyAddFloorNo] [int] NULL,
	[PhyAddNearestLandmark] [nvarchar](200) NULL,
	[PhyAddYearsAtCurrentAddress] [int] NULL,
	[PhyAddEmirate] [bigint] NULL,
	[PostAddPOBoxNo] [nvarchar](200) NULL,
	[PostAddEmirate] [bigint] NULL,
	[PhyAdd1] [nvarchar](200) NULL,
	[PhyAdd2] [nvarchar](200) NULL,
	[PhyAdd3] [nvarchar](200) NULL,
	[PostAdd1] [nvarchar](200) NULL,
	[PostAdd2] [nvarchar](200) NULL,
	[PostAdd3] [nvarchar](200) NULL,
	[HFADocumentDescription] [nvarchar](max) NULL,
	[IsEnableEmiratesIDCard] [bit] NULL,
	[UTCTimeOffset] [int] NULL,
 CONSTRAINT [Branch_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Branch]  WITH NOCHECK ADD  CONSTRAINT [Branch_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [Branch_FK_Country]
GO
ALTER TABLE [dbo].[Branch]  WITH NOCHECK ADD  CONSTRAINT [Branch_FK_FSPCompany] FOREIGN KEY([FSPCompanyId])
REFERENCES [dbo].[FSPCompany] ([Id])
GO

ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [Branch_FK_FSPCompany]
GO
ALTER TABLE [dbo].[Branch]  WITH NOCHECK ADD  CONSTRAINT [Branch_FK_FSPPersonComplaintsOfficer] FOREIGN KEY([ComplaintsOfficerId])
REFERENCES [dbo].[FSPPerson] ([Id])
GO

ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [Branch_FK_FSPPersonComplaintsOfficer]
GO
ALTER TABLE [dbo].[Branch]  WITH NOCHECK ADD  CONSTRAINT [Branch_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [Branch_FK_Group]
GO
ALTER TABLE [dbo].[Branch]  WITH NOCHECK ADD  CONSTRAINT [Branch_FK_UsersBussinessManagerId] FOREIGN KEY([BussinessManagerId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [Branch_FK_UsersBussinessManagerId]
GO
ALTER TABLE [dbo].[Branch]  WITH NOCHECK ADD  CONSTRAINT [Branch_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [Branch_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[Branch]  WITH NOCHECK ADD  CONSTRAINT [Branch_FK_UsersMarketer] FOREIGN KEY([MarketerId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [Branch_FK_UsersMarketer]
GO
ALTER TABLE [dbo].[Branch]  WITH NOCHECK ADD  CONSTRAINT [Branch_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [Branch_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[Branch]  WITH NOCHECK ADD  CONSTRAINT [Branch_FK_UsersVehicleBussinessManagerId] FOREIGN KEY([VehicleBussinessManagerId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [Branch_FK_UsersVehicleBussinessManagerId]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Country] FOREIGN KEY([PhyAddCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_Country]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Country1] FOREIGN KEY([PostAddCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_Country1]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_StaticValue] FOREIGN KEY([PhyAddEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_StaticValue]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_StaticValue1] FOREIGN KEY([PostAddEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_StaticValue1]
GO
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [Branch_DF_OverrideAdviceLicence]  DEFAULT ((0)) FOR [OverrideAdviceLicence]
GO
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [Branch_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [Branch_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key fromtable Group. Fill dropdown of grup while creating branch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Branch', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This Field shoul be auto generated.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Branch', @level2type=N'COLUMN',@level2name=N'BranchCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'• Table Use to store Branch Details. 
• Will insert row by Create Branch under Administration >> Branch >> Branch admin or Branch Details under Administrator >> Branch >> Edit Branch
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Branch'