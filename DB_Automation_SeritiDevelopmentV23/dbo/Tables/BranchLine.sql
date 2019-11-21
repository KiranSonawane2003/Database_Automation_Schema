CREATE TABLE [dbo].[BranchLine](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[FSPCompanyId] [bigint] NULL,
	[IsJuristicRepresentative] [bit] NOT NULL,
	[ComplaintsOfficerId] [bigint] NULL,
	[VATNumber] [nvarchar](100) NULL,
	[CompanyRegNumber] [nvarchar](100) NULL,
	[RegisteredName] [nvarchar](200) NULL,
	[PhyAddCountryId] [bigint] NULL,
	[PostAddCountryId] [bigint] NULL,
	[BranchEmail] [varchar](100) NULL,
	[AccountsEmail] [nvarchar](100) NULL,
	[RemittanceEmail] [nvarchar](100) NULL,
	[AlternativeRemittanceEmail] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[Fax] [nvarchar](100) NULL,
	[MarketerId] [bigint] NULL,
	[ApprovalUserProductsId] [bigint] NULL,
	[ApprovalUserOtherId] [bigint] NULL,
	[FinancialManagerId] [bigint] NULL,
	[DealerPrincipalId] [bigint] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
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
	[IsVehicle] [bit] NULL,
	[IsFleet] [bit] NULL,
	[IsAfterMarket] [bit] NULL,
	[IsUnsecured] [bit] NULL,
	[TransactionTypeID] [bigint] NULL,
	[HFAVehicleURL] [nvarchar](4000) NULL,
	[HFAItemsURL] [nvarchar](4000) NULL,
	[HFAStyleSheetFileName] [nvarchar](4000) NULL,
	[HFAStyleSheetURL] [nvarchar](4000) NULL,
	[useSMTPDetails] [bit] NULL,
	[HFAVehicleParentURL] [nvarchar](max) NULL,
	[HFAItemsParentURL] [nvarchar](max) NULL,
	[HFAResumeLinkExpire] [int] NULL,
 CONSTRAINT [BranchLine_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[BranchLine]  WITH NOCHECK ADD  CONSTRAINT [BranchLine_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[BranchLine] CHECK CONSTRAINT [BranchLine_FK_Branch]
GO
ALTER TABLE [dbo].[BranchLine]  WITH NOCHECK ADD  CONSTRAINT [BranchLine_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[BranchLine] CHECK CONSTRAINT [BranchLine_FK_Country]
GO
ALTER TABLE [dbo].[BranchLine]  WITH NOCHECK ADD  CONSTRAINT [BranchLine_FK_FSPCompany] FOREIGN KEY([FSPCompanyId])
REFERENCES [dbo].[FSPCompany] ([Id])
GO

ALTER TABLE [dbo].[BranchLine] CHECK CONSTRAINT [BranchLine_FK_FSPCompany]
GO
ALTER TABLE [dbo].[BranchLine]  WITH NOCHECK ADD  CONSTRAINT [BranchLine_FK_FSPPersonComplaintsOfficer] FOREIGN KEY([ComplaintsOfficerId])
REFERENCES [dbo].[FSPPerson] ([Id])
GO

ALTER TABLE [dbo].[BranchLine] CHECK CONSTRAINT [BranchLine_FK_FSPPersonComplaintsOfficer]
GO
ALTER TABLE [dbo].[BranchLine]  WITH NOCHECK ADD  CONSTRAINT [BranchLine_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[BranchLine] CHECK CONSTRAINT [BranchLine_FK_Group]
GO
ALTER TABLE [dbo].[BranchLine]  WITH NOCHECK ADD  CONSTRAINT [BranchLine_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[BranchLine] CHECK CONSTRAINT [BranchLine_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[BranchLine]  WITH NOCHECK ADD  CONSTRAINT [BranchLine_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[BranchLine] CHECK CONSTRAINT [BranchLine_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[BranchLine]  WITH CHECK ADD  CONSTRAINT [FK_BranchLine_Country] FOREIGN KEY([PhyAddCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[BranchLine] CHECK CONSTRAINT [FK_BranchLine_Country]
GO
ALTER TABLE [dbo].[BranchLine]  WITH CHECK ADD  CONSTRAINT [FK_BranchLine_Country1] FOREIGN KEY([PostAddCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[BranchLine] CHECK CONSTRAINT [FK_BranchLine_Country1]
GO
ALTER TABLE [dbo].[BranchLine]  WITH CHECK ADD  CONSTRAINT [FK_BranchLine_StaticValue] FOREIGN KEY([PhyAddEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[BranchLine] CHECK CONSTRAINT [FK_BranchLine_StaticValue]
GO
ALTER TABLE [dbo].[BranchLine]  WITH CHECK ADD  CONSTRAINT [FK_BranchLine_StaticValue1] FOREIGN KEY([PostAddEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[BranchLine] CHECK CONSTRAINT [FK_BranchLine_StaticValue1]
GO
ALTER TABLE [dbo].[BranchLine]  WITH CHECK ADD  CONSTRAINT [FK_BranchLine_TransactionTypeID] FOREIGN KEY([TransactionTypeID])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[BranchLine] CHECK CONSTRAINT [FK_BranchLine_TransactionTypeID]
GO
ALTER TABLE [dbo].[BranchLine] ADD  CONSTRAINT [BranchLine_DF_JuristicRepresentative]  DEFAULT ((0)) FOR [IsJuristicRepresentative]
GO
ALTER TABLE [dbo].[BranchLine] ADD  CONSTRAINT [BranchLine_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[BranchLine] ADD  CONSTRAINT [BranchLine_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table Group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BranchLine', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table Branch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BranchLine', @level2type=N'COLUMN',@level2name=N'BranchId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table FSPCompany' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BranchLine', @level2type=N'COLUMN',@level2name=N'FSPCompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table FSPPerson' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BranchLine', @level2type=N'COLUMN',@level2name=N'ComplaintsOfficerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table Country' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BranchLine', @level2type=N'COLUMN',@level2name=N'PhyAddCountryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table Country' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BranchLine', @level2type=N'COLUMN',@level2name=N'PostAddCountryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Table Use to store Branch line details page. Under admin >> Branch >> Edit Branch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BranchLine'