CREATE TABLE [dbo].[InceptTransactionContact](
	[Id] [bigint] NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[Title] [bigint] NULL,
	[TitleValue] [nvarchar](50) NULL,
	[LastName] [nvarchar](100) NULL,
	[FirstName] [nvarchar](100) NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[AlternativeMobileNumber] [nvarchar](50) NULL,
	[WorkTelephoneNumber] [nvarchar](100) NULL,
	[RelationshipId] [bigint] NULL,
	[RelationshipValue] [nvarchar](50) NULL,
	[SpouseEmployerName] [nvarchar](100) NULL,
	[SpouseEmployerAddress] [nvarchar](200) NULL,
	[SpouseOccupationId] [bigint] NULL,
	[SpouseOccupationValue] [nvarchar](50) NULL,
	[PeriodOfEmployment] [nvarchar](50) NULL,
	[IsRegularDriver] [bit] NULL,
	[GenderId] [bigint] NULL,
	[GenderValue] [nvarchar](50) NULL,
	[Initials] [nvarchar](20) NULL,
	[HomePhoneCode] [nvarchar](20) NULL,
	[HomePhoneNumber] [nvarchar](50) NULL,
	[WorkPhoneCode] [nvarchar](20) NULL,
	[WorkPhoneNumber] [nvarchar](50) NULL,
	[IsSecondInsured] [bit] NULL,
	[CountryId] [bigint] NULL,
	[CountryIdValue] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[CreatedByValue] [nvarchar](50) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedByValue] [nvarchar](50) NULL,
	[InceptTransactionId] [bigint] NULL,
	[MiddleName] [nvarchar](100) NULL,
	[DriversLicenceNo] [nvarchar](100) NULL,
	[DriversLicenceIssueDate] [date] NULL,
	[DriversLicenceExpiryDate] [date] NULL,
	[DriversLicenceIssuePlace] [nvarchar](200) NULL,
	[Nationality] [bigint] NULL,
	[NationalityValue] [nvarchar](50) NULL,
	[DateofBirth] [date] NULL,
	[PassportNo] [nvarchar](100) NULL,
	[PassportIssueDate] [date] NULL,
	[PassportExpiryDate] [date] NULL,
	[VisaNo] [nvarchar](100) NULL,
	[VisaIssueDate] [date] NULL,
	[VisaExpiryDate] [date] NULL,
	[EmiratesIdNo] [nvarchar](200) NULL,
	[EmiratesIdIssueDate] [date] NULL,
	[EmiratesIdExpiryDate] [date] NULL,
	[EmiratesIdIssuePlace] [nvarchar](200) NULL,
	[PhyAddBuildingName] [nvarchar](200) NULL,
	[PhyAddArea] [nvarchar](100) NULL,
	[PhyAddEmirate] [bigint] NULL,
	[PhyAddEmirateValue] [nvarchar](50) NULL,
	[PhyAddCountryId] [bigint] NULL,
	[PhyAddCountryValue] [nvarchar](50) NULL,
	[PostAddPOBoxNo] [nvarchar](200) NULL,
	[PostAddEmirate] [bigint] NULL,
	[PostAddEmirateValue] [nvarchar](50) NULL,
	[PostAddCountryId] [bigint] NULL,
	[PostAddCountryValue] [nvarchar](50) NULL,
	[ResidentialStatus] [bigint] NULL,
	[ResidentialStatusValue] [nvarchar](50) NULL,
	[QualificationLevelId] [bigint] NULL,
	[QualificationLevelValue] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[IsContract] [bit] NULL,
	[IsSurety] [bit] NULL,
	[IsThirdPartyRegistration] [bit] NULL,
	[JoiningDate] [date] NULL,
	[MakaniNumber] [nvarchar](200) NULL,
	[TradeLicenseNumber] [nvarchar](200) NULL,
	[TradelicenseExpiryDate] [date] NULL,
	[DateofInception] [date] NULL,
	[EmploymentCategoryId] [bigint] NULL,
	[PhyAddNearestLandMark] [nvarchar](200) NULL,
	[FaxCode] [nvarchar](10) NULL,
	[FaxNumber] [nvarchar](50) NULL,
	[FamilyName] [nvarchar](200) NULL,
	[AreaName] [nvarchar](200) NULL,
	[VillaOrApartmentNumber] [nvarchar](50) NULL,
	[AreaCodeId] [bigint] NULL,
	[OfficeTelephonenumberExtension] [nvarchar](10) NULL,
	[CityId] [bigint] NULL,
 CONSTRAINT [InceptTransactionContact_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InceptTransactionContact]  WITH NOCHECK ADD  CONSTRAINT [InceptTransactionContact_FK_InceptTransaction] FOREIGN KEY([InceptTransactionId])
REFERENCES [dbo].[InceptTransaction] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionContact] CHECK CONSTRAINT [InceptTransactionContact_FK_InceptTransaction]
GO
ALTER TABLE [dbo].[InceptTransactionContact]  WITH NOCHECK ADD  CONSTRAINT [InceptTransactionContact_FK_StaticValueAreaCodeId] FOREIGN KEY([AreaCodeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionContact] CHECK CONSTRAINT [InceptTransactionContact_FK_StaticValueAreaCodeId]
GO
ALTER TABLE [dbo].[InceptTransactionContact]  WITH NOCHECK ADD  CONSTRAINT [InceptTransactionContact_FK_StaticValueCityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionContact] CHECK CONSTRAINT [InceptTransactionContact_FK_StaticValueCityId]
GO
ALTER TABLE [dbo].[InceptTransactionContact] ADD  DEFAULT ((0)) FOR [IsRegularDriver]
GO
ALTER TABLE [dbo].[InceptTransactionContact] ADD  DEFAULT ((0)) FOR [IsSecondInsured]
GO
ALTER TABLE [dbo].[InceptTransactionContact] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[InceptTransactionContact] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]