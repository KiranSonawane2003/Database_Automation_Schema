CREATE TABLE [dbo].[InceptTransactionEmployerDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[EmploymentTypeId] [bigint] NULL,
	[EmploymentTypeValue] [nvarchar](50) NULL,
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
	[CountryId] [bigint] NULL,
	[CountryValue] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[CreatedByValue] [nvarchar](50) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedByValue] [nvarchar](50) NULL,
	[InceptTransactionId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[TypeOfOrganizationValue] [nvarchar](50) NULL,
	[SalaryCycle] [bigint] NULL,
	[SalaryCycleValue] [nvarchar](200) NULL,
	[PhyAdd1] [nvarchar](200) NULL,
	[PhyAdd2] [nvarchar](200) NULL,
	[PhyAdd3] [nvarchar](200) NULL,
	[PhyAdd4] [nvarchar](200) NULL,
	[Code] [nvarchar](50) NULL,
	[NatureOfBusiness] [bigint] NULL,
	[MODRank] [nvarchar](200) NULL,
	[PreviousEmployerAddress] [nvarchar](500) NULL,
	[PreviousEmployerTelephoneNumberCode] [nvarchar](10) NULL,
	[PreviousEmployerTelephoneNumber] [nvarchar](50) NULL,
	[CurrentEmployerDateOfEstablishment] [date] NULL,
	[OccupationLevelId] [bigint] NULL,
	[DesignationId] [bigint] NULL,
 CONSTRAINT [InceptTransactionEmployerDetails_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InceptTransactionEmployerDetails]  WITH NOCHECK ADD  CONSTRAINT [InceptTransactionEmployerDetails_FK_InceptTransaction] FOREIGN KEY([InceptTransactionId])
REFERENCES [dbo].[InceptTransaction] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionEmployerDetails] CHECK CONSTRAINT [InceptTransactionEmployerDetails_FK_InceptTransaction]
GO
ALTER TABLE [dbo].[InceptTransactionEmployerDetails] ADD  CONSTRAINT [DF__InceptTra__Creat__395BB220]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[InceptTransactionEmployerDetails] ADD  CONSTRAINT [DF__InceptTra__IsAct__01D6730C]  DEFAULT ((1)) FOR [IsActive]