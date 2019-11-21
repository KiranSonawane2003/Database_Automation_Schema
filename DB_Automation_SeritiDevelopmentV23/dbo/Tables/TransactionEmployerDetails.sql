CREATE TABLE [dbo].[TransactionEmployerDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[EmploymentTypeId] [bigint] NULL,
	[NameofEmployer] [nvarchar](200) NULL,
	[JoiningDate] [date] NULL,
	[EmployeeNumber] [nvarchar](200) NULL,
	[Designation] [nvarchar](200) NULL,
	[TypeOfOrganization] [bigint] NULL,
	[Sector] [nvarchar](200) NULL,
	[PreviousEmployer] [nvarchar](200) NULL,
	[NoOfYearsWithPreviousEmployer] [int] NULL,
	[BusinessName] [nvarchar](200) NULL,
	[DateofInception] [date] NULL,
	[TradeLicenceNo] [nvarchar](200) NULL,
	[TradeLicenceExpiryDate] [date] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NULL,
	[CountryId] [bigint] NULL,
	[Occupation] [nvarchar](100) NULL,
	[SalaryCycle] [bigint] NULL,
	[NoOfEmployees] [int] NULL,
	[WebsiteOfEmployer] [nvarchar](200) NULL,
	[PhyAdd1] [nvarchar](200) NULL,
	[PhyAdd2] [nvarchar](200) NULL,
	[PhyAdd3] [nvarchar](200) NULL,
	[PhyAdd4] [nvarchar](200) NULL,
	[Code] [nvarchar](50) NULL,
	[NatureOfBusiness] [bigint] NULL,
	[EmploymentCategoryId] [bigint] NULL,
	[SectorId] [bigint] NULL,
	[MODRank] [nvarchar](200) NULL,
	[PreviousEmployerAddress] [nvarchar](500) NULL,
	[PreviousEmployerTelephoneNumberCode] [nvarchar](10) NULL,
	[PreviousEmployerTelephoneNumber] [nvarchar](50) NULL,
	[CurrentEmployerDateOfEstablishment] [date] NULL,
	[OccupationLevelId] [bigint] NULL,
	[DesignationId] [bigint] NULL,
 CONSTRAINT [PK_TransactionFinanceApplication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionEmployerDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransactionEmployerDetails_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionEmployerDetails] CHECK CONSTRAINT [FK_TransactionEmployerDetails_Country]
GO
ALTER TABLE [dbo].[TransactionEmployerDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransactionEmployerDetails_EmployerCategoryId] FOREIGN KEY([EmploymentCategoryId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionEmployerDetails] CHECK CONSTRAINT [FK_TransactionEmployerDetails_EmployerCategoryId]
GO
ALTER TABLE [dbo].[TransactionEmployerDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionEmployerDetails_StaticValueDesignationId] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionEmployerDetails] CHECK CONSTRAINT [FK_TransactionEmployerDetails_StaticValueDesignationId]
GO
ALTER TABLE [dbo].[TransactionEmployerDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransactionEmployerDetails_StaticValueEmploymentTypeId] FOREIGN KEY([EmploymentTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionEmployerDetails] CHECK CONSTRAINT [FK_TransactionEmployerDetails_StaticValueEmploymentTypeId]
GO
ALTER TABLE [dbo].[TransactionEmployerDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransactionEmployerDetails_StaticValueTypeOfOrganization] FOREIGN KEY([TypeOfOrganization])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionEmployerDetails] CHECK CONSTRAINT [FK_TransactionEmployerDetails_StaticValueTypeOfOrganization]
GO
ALTER TABLE [dbo].[TransactionEmployerDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransactionEmployerDetails_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionEmployerDetails] CHECK CONSTRAINT [FK_TransactionEmployerDetails_Transaction]
GO
ALTER TABLE [dbo].[TransactionEmployerDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransactionEmployerDetails_TransactionEmployerDetails_NatureOfBusiness] FOREIGN KEY([NatureOfBusiness])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionEmployerDetails] CHECK CONSTRAINT [FK_TransactionEmployerDetails_TransactionEmployerDetails_NatureOfBusiness]
GO
ALTER TABLE [dbo].[TransactionEmployerDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransactionEmployerDetails_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionEmployerDetails] CHECK CONSTRAINT [FK_TransactionEmployerDetails_Users]
GO
ALTER TABLE [dbo].[TransactionEmployerDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransactionEmployerDetails_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionEmployerDetails] CHECK CONSTRAINT [FK_TransactionEmployerDetails_Users1]
GO
ALTER TABLE [dbo].[TransactionEmployerDetails]  WITH CHECK ADD  CONSTRAINT [TransactionEmployerDetails_FK_StaticValue] FOREIGN KEY([SectorId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionEmployerDetails] CHECK CONSTRAINT [TransactionEmployerDetails_FK_StaticValue]
GO
ALTER TABLE [dbo].[TransactionEmployerDetails]  WITH CHECK ADD  CONSTRAINT [TransactionEmployerDetails_FK_StaticValueSalaryCycle] FOREIGN KEY([SalaryCycle])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionEmployerDetails] CHECK CONSTRAINT [TransactionEmployerDetails_FK_StaticValueSalaryCycle]
GO
ALTER TABLE [dbo].[TransactionEmployerDetails]  WITH CHECK ADD  CONSTRAINT [TransactionEmployerDetails_OccupationLevelId_FK_StaticValue] FOREIGN KEY([OccupationLevelId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionEmployerDetails] CHECK CONSTRAINT [TransactionEmployerDetails_OccupationLevelId_FK_StaticValue]
GO
ALTER TABLE [dbo].[TransactionEmployerDetails] ADD  CONSTRAINT [DF_TransactionFinanceApplication_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TransactionEmployerDetails] ADD  DEFAULT ((1)) FOR [IsActive]