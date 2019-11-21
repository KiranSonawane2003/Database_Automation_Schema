CREATE TABLE [dbo].[FSPCompany](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Number] [nvarchar](100) NOT NULL,
	[ComplienceOfficerId] [bigint] NOT NULL,
	[ComplaintsOfficerId] [bigint] NOT NULL,
	[PhyAddCountryId] [bigint] NULL,
	[PhyAddAddressLine1] [nvarchar](200) NULL,
	[PhyAddAddressLine2] [nvarchar](200) NULL,
	[PhyAddSuburbId] [bigint] NULL,
	[PhyAddProvinceId] [bigint] NULL,
	[PostAddCountryId] [bigint] NULL,
	[PostAddAddressLine1] [nvarchar](200) NULL,
	[PostAddAddressLine2] [nvarchar](200) NULL,
	[PostAddSuburbId] [bigint] NULL,
	[PostAddProvinceId] [bigint] NULL,
	[Phone] [nvarchar](100) NULL,
	[Fax] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[FSPApprovalPersonId] [bigint] NULL,
	[IsAdviceLicence] [bit] NOT NULL,
	[IsIntermediaryServices] [bit] NOT NULL,
	[IsShortTermInsurancePersonal] [bit] NOT NULL,
	[IsShortTermInsuranceCommercial] [bit] NOT NULL,
	[IsLongTermInsCatA] [bit] NOT NULL,
	[IsLongTermInsSubCatB1] [bit] NOT NULL,
	[IsLongTermInsSubCatB2] [bit] NOT NULL,
	[IsLongTermInsCatC] [bit] NOT NULL,
	[ReviewDate] [date] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[IsTerminated] [bit] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [FSPCompany_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FSPCompany]  WITH NOCHECK ADD  CONSTRAINT [FSPCompany_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[FSPCompany] CHECK CONSTRAINT [FSPCompany_FK_Country]
GO
ALTER TABLE [dbo].[FSPCompany]  WITH NOCHECK ADD  CONSTRAINT [FSPCompany_FK_CountryPhyAdd] FOREIGN KEY([PhyAddCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[FSPCompany] CHECK CONSTRAINT [FSPCompany_FK_CountryPhyAdd]
GO
ALTER TABLE [dbo].[FSPCompany]  WITH NOCHECK ADD  CONSTRAINT [FSPCompany_FK_CountryPostAdd] FOREIGN KEY([PostAddCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[FSPCompany] CHECK CONSTRAINT [FSPCompany_FK_CountryPostAdd]
GO
ALTER TABLE [dbo].[FSPCompany]  WITH NOCHECK ADD  CONSTRAINT [FSPCompany_FK_FSPCompany] FOREIGN KEY([PostAddProvinceId])
REFERENCES [dbo].[Province] ([Id])
GO

ALTER TABLE [dbo].[FSPCompany] CHECK CONSTRAINT [FSPCompany_FK_FSPCompany]
GO
ALTER TABLE [dbo].[FSPCompany]  WITH NOCHECK ADD  CONSTRAINT [FSPCompany_FK_FSPCompanyPostAdd] FOREIGN KEY([PostAddProvinceId])
REFERENCES [dbo].[Province] ([Id])
GO

ALTER TABLE [dbo].[FSPCompany] CHECK CONSTRAINT [FSPCompany_FK_FSPCompanyPostAdd]
GO
ALTER TABLE [dbo].[FSPCompany]  WITH NOCHECK ADD  CONSTRAINT [FSPCompany_FK_FSPPersonApproval] FOREIGN KEY([FSPApprovalPersonId])
REFERENCES [dbo].[FSPPerson] ([Id])
GO

ALTER TABLE [dbo].[FSPCompany] CHECK CONSTRAINT [FSPCompany_FK_FSPPersonApproval]
GO
ALTER TABLE [dbo].[FSPCompany]  WITH NOCHECK ADD  CONSTRAINT [FSPCompany_FK_FSPPersonComplaintsOfficer] FOREIGN KEY([ComplaintsOfficerId])
REFERENCES [dbo].[FSPPerson] ([Id])
GO

ALTER TABLE [dbo].[FSPCompany] CHECK CONSTRAINT [FSPCompany_FK_FSPPersonComplaintsOfficer]
GO
ALTER TABLE [dbo].[FSPCompany]  WITH NOCHECK ADD  CONSTRAINT [FSPCompany_FK_FSPPersonComplienceOfficer] FOREIGN KEY([ComplienceOfficerId])
REFERENCES [dbo].[FSPPerson] ([Id])
GO

ALTER TABLE [dbo].[FSPCompany] CHECK CONSTRAINT [FSPCompany_FK_FSPPersonComplienceOfficer]
GO
ALTER TABLE [dbo].[FSPCompany]  WITH NOCHECK ADD  CONSTRAINT [FSPCompany_FK_ProvincePhyAdd] FOREIGN KEY([PhyAddProvinceId])
REFERENCES [dbo].[Province] ([Id])
GO

ALTER TABLE [dbo].[FSPCompany] CHECK CONSTRAINT [FSPCompany_FK_ProvincePhyAdd]
GO
ALTER TABLE [dbo].[FSPCompany]  WITH NOCHECK ADD  CONSTRAINT [FSPCompany_FK_ProvincePostAdd] FOREIGN KEY([PostAddProvinceId])
REFERENCES [dbo].[Province] ([Id])
GO

ALTER TABLE [dbo].[FSPCompany] CHECK CONSTRAINT [FSPCompany_FK_ProvincePostAdd]
GO
ALTER TABLE [dbo].[FSPCompany]  WITH NOCHECK ADD  CONSTRAINT [FSPCompany_FK_SuburbPhyAdd] FOREIGN KEY([PhyAddSuburbId])
REFERENCES [dbo].[Suburb] ([Id])
GO

ALTER TABLE [dbo].[FSPCompany] CHECK CONSTRAINT [FSPCompany_FK_SuburbPhyAdd]
GO
ALTER TABLE [dbo].[FSPCompany]  WITH NOCHECK ADD  CONSTRAINT [FSPCompany_FK_SuburbPostAdd] FOREIGN KEY([PostAddSuburbId])
REFERENCES [dbo].[Suburb] ([Id])
GO

ALTER TABLE [dbo].[FSPCompany] CHECK CONSTRAINT [FSPCompany_FK_SuburbPostAdd]
GO
ALTER TABLE [dbo].[FSPCompany]  WITH NOCHECK ADD  CONSTRAINT [FSPCompany_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[FSPCompany] CHECK CONSTRAINT [FSPCompany_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[FSPCompany]  WITH NOCHECK ADD  CONSTRAINT [FSPCompany_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[FSPCompany] CHECK CONSTRAINT [FSPCompany_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[FSPCompany] ADD  CONSTRAINT [FSPCompany_DF_AdviceLicence]  DEFAULT ((0)) FOR [IsAdviceLicence]
GO
ALTER TABLE [dbo].[FSPCompany] ADD  CONSTRAINT [FSPCompany_DF_IntermediaryServices]  DEFAULT ((0)) FOR [IsIntermediaryServices]
GO
ALTER TABLE [dbo].[FSPCompany] ADD  CONSTRAINT [FSPCompany_DF_ShortTermInsurancePersonal]  DEFAULT ((0)) FOR [IsShortTermInsurancePersonal]
GO
ALTER TABLE [dbo].[FSPCompany] ADD  CONSTRAINT [FSPCompany_DF_ShortTermInsuranceCommercial]  DEFAULT ((0)) FOR [IsShortTermInsuranceCommercial]
GO
ALTER TABLE [dbo].[FSPCompany] ADD  CONSTRAINT [FSPCompany_LongTermInsCatA]  DEFAULT ((0)) FOR [IsLongTermInsCatA]
GO
ALTER TABLE [dbo].[FSPCompany] ADD  CONSTRAINT [FSPCompany_DF_LongTermInsSubCatB1]  DEFAULT ((0)) FOR [IsLongTermInsSubCatB1]
GO
ALTER TABLE [dbo].[FSPCompany] ADD  CONSTRAINT [FSPCompany_DF_LongTermInsSubCatB2]  DEFAULT ((0)) FOR [IsLongTermInsSubCatB2]
GO
ALTER TABLE [dbo].[FSPCompany] ADD  CONSTRAINT [FSPCompany_DF_LongTermInsCatC]  DEFAULT ((0)) FOR [IsLongTermInsCatC]
GO
ALTER TABLE [dbo].[FSPCompany] ADD  CONSTRAINT [FSPCompany_DF_Terminated]  DEFAULT ((0)) FOR [IsTerminated]
GO
ALTER TABLE [dbo].[FSPCompany] ADD  CONSTRAINT [FSPCompany_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[FSPCompany] ADD  CONSTRAINT [FSPCompany_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Complience Officer Dropdown fill by FSPPerson table. It is Foreign Key from table FSPPerson.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FSPCompany', @level2type=N'COLUMN',@level2name=N'ComplienceOfficerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Complaints Officer Dropdown fill by FSPPerson table. It is Foreign Key from table FSPPerson.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FSPCompany', @level2type=N'COLUMN',@level2name=N'ComplaintsOfficerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Physical address Country Dropdown fill by Country table. It is Foreign Key from table Country.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FSPCompany', @level2type=N'COLUMN',@level2name=N'PhyAddCountryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Select Suburb of physical address by Suburb table. It is Foreign Key from table Suburb.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FSPCompany', @level2type=N'COLUMN',@level2name=N'PhyAddSuburbId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Postal address Country Dropdown fill by Country table. It is Foreign Key from table Country.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FSPCompany', @level2type=N'COLUMN',@level2name=N'PostAddCountryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Select Suburb of Postal address by Suburb table. It is Foreign Key from table Suburb.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FSPCompany', @level2type=N'COLUMN',@level2name=N'PostAddSuburbId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store the FSP Company information. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FSPCompany'