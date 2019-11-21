CREATE TABLE [dbo].[TransactionClient](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TitleId] [bigint] NULL,
	[FirstName] [nvarchar](100) NULL,
	[MiddleName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Initials] [nvarchar](50) NULL,
	[DateofBirth] [date] NULL,
	[PlaceOfBirth] [nvarchar](200) NULL,
	[Nationality] [bigint] NULL,
	[NoofDependents] [int] NULL,
	[MaritalStatusId] [bigint] NULL,
	[MarriageDate] [date] NULL,
	[GenderId] [bigint] NULL,
	[MothersMaidenName] [nvarchar](200) NULL,
	[UAEResidentSince] [date] NULL,
	[IDTypeId] [bigint] NULL,
	[IDNumber] [nvarchar](100) NULL,
	[PassportNo] [nvarchar](100) NULL,
	[PassportIssueDate] [date] NULL,
	[PassportExpiryDate] [date] NULL,
	[PassportIssuePlace] [nvarchar](200) NULL,
	[VisaNo] [nvarchar](100) NULL,
	[VisaIssueDate] [date] NULL,
	[VisaExpiryDate] [date] NULL,
	[VisaIssuePlace] [nvarchar](200) NULL,
	[EmiratesIdNo] [nvarchar](200) NULL,
	[EmiratesIdIssueDate] [date] NULL,
	[EmiratesIdExpiryDate] [date] NULL,
	[EmiratesIdIssuePlace] [nvarchar](200) NULL,
	[DriversLicenceNo] [nvarchar](100) NULL,
	[DriversLicenceIssueDate] [date] NULL,
	[DriversLicenceExpiryDate] [date] NULL,
	[DriversLicenceIssuePlace] [nvarchar](200) NULL,
	[UAEDrivingLicenceNo] [nvarchar](100) NULL,
	[PreferredName] [nvarchar](100) NULL,
	[Mobile] [nvarchar](100) NULL,
	[AlternativeMobile] [nvarchar](100) NULL,
	[HomePhoneCode] [nvarchar](10) NULL,
	[HomePhoneNumber] [nvarchar](50) NULL,
	[WorkPhoneCode] [nvarchar](10) NULL,
	[WorkPhoneNumber] [nvarchar](50) NULL,
	[FaxCode] [nvarchar](10) NULL,
	[FaxNumber] [nvarchar](50) NULL,
	[ContactNumberInHomeCountry] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[IsSMSAlertRequired] [bit] NULL,
	[PreferedMailingAddress] [bigint] NULL,
	[NumberForSMSAlert] [nvarchar](100) NULL,
	[PhyAddBuildingName] [nvarchar](200) NULL,
	[PhyAddFlatNo] [nvarchar](50) NULL,
	[PhyAddUnitNo] [nvarchar](50) NULL,
	[PhyAddNearestLandmark] [nvarchar](200) NULL,
	[PhyAddArea] [nvarchar](100) NULL,
	[PhyAddStreetName] [nvarchar](200) NULL,
	[PostAddPOBoxNo] [nvarchar](200) NULL,
	[PhyAddEmirate] [bigint] NULL,
	[PhyAddCity] [nvarchar](200) NULL,
	[PhyAddState] [nvarchar](100) NULL,
	[PhyAddCountryId] [bigint] NULL,
	[PhyAddZipCode] [nvarchar](50) NULL,
	[PostAddEmirate] [bigint] NULL,
	[ResidentialStatus] [bigint] NULL,
	[NoOfYearsAtPesentAddress] [nvarchar](50) NULL,
	[PostAddCountryId] [bigint] NULL,
	[RentPerMonth] [decimal](18, 2) NULL,
	[AddressInHomeCountry] [nvarchar](500) NULL,
	[HomeCountryId] [bigint] NULL,
	[BankingDetailsId] [bigint] NULL,
	[CustomerType] [int] NOT NULL,
	[NameOfKin] [nvarchar](100) NULL,
	[AddressOfKin] [nvarchar](200) NULL,
	[ContactOfKin] [nvarchar](50) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[IsGuarantorApplication] [bit] NULL,
	[RegularDriver] [bit] NULL,
	[ConditionsResidentPermit] [nvarchar](100) NULL,
	[LanguageId] [bigint] NULL,
	[MarrageTypeId] [bigint] NULL,
	[SpousesName] [nvarchar](100) NULL,
	[SpousesBirthDate] [date] NULL,
	[PhyAddSurburb] [nvarchar](50) NULL,
	[PhyAddTown] [nvarchar](50) NULL,
	[PostAddSurburb] [nvarchar](50) NULL,
	[PostAddTown] [nvarchar](50) NULL,
	[SpecifyResidentialStatus] [nvarchar](100) NULL,
	[PreviousHomeAddress] [nvarchar](100) NULL,
	[PreferredCallTime] [bigint] NULL,
	[CompanyName] [nvarchar](max) NULL,
	[ComNatureOfBusiness] [bigint] NULL,
	[CompanyStartDate] [date] NULL,
	[ComTradeLicenceStartDate] [date] NULL,
	[ComTradeLicenceExpiryDate] [date] NULL,
	[ComVATNumber] [nvarchar](50) NULL,
	[ComPhyAddBuildingName] [nvarchar](200) NULL,
	[ComPhyAddStreetName] [nvarchar](100) NULL,
	[ComPhyAddEmirate] [bigint] NULL,
	[ComPhyAddPostCode] [nvarchar](100) NULL,
	[ComPhyAddCountryId] [bigint] NULL,
	[ComTradingAs] [nvarchar](50) NULL,
	[ComRegistrationNumber] [nvarchar](50) NULL,
	[ComNoOfYearsInBusiness] [int] NULL,
	[ComLandlord] [nvarchar](100) NULL,
	[ComHoldingCompany] [nvarchar](100) NULL,
	[ComAssociatedCompany] [nvarchar](200) NULL,
	[ComSubsidaryCompany] [nvarchar](200) NULL,
	[ComCompanyRepresentative] [nvarchar](100) NULL,
	[ComFloorNo] [int] NULL,
	[ComYearsAtCurrentAddress] [int] NULL,
	[ComEmirate] [bigint] NULL,
	[PhyAdd1] [nvarchar](200) NULL,
	[PhyAdd2] [nvarchar](200) NULL,
	[PhyAdd3] [nvarchar](200) NULL,
	[PostAdd1] [nvarchar](200) NULL,
	[PostAdd2] [nvarchar](200) NULL,
	[PostAdd3] [nvarchar](200) NULL,
	[FinanceStatus] [bigint] NULL,
	[FinanceStatusNotes] [nvarchar](500) NULL,
	[ConditionsOfResidentsPermit] [nvarchar](500) NULL,
	[BusinessTypeId] [bigint] NULL,
	[QualificationId] [bigint] NULL,
	[PermitNumber] [nvarchar](100) NULL,
	[PermitIssueDate] [date] NULL,
	[PermitExpiryDate] [date] NULL,
	[IdIssueDate] [date] NULL,
	[IdExpiryDate] [date] NULL,
	[SpecifyMaritalStatus] [nvarchar](100) NULL,
	[EthnicGroup] [bigint] NULL,
	[MarketingSource] [bigint] NULL,
	[ClaimFreeGroup] [bigint] NULL,
	[IsCompanyVATRegistered] [bit] NULL,
	[PhyAdd4] [nvarchar](200) NULL,
	[PhyAddCode] [nvarchar](100) NULL,
	[PostAdd4] [nvarchar](200) NULL,
	[PostAddCode] [nvarchar](100) NULL,
	[IsCompanyBlackOwned] [bit] NULL,
	[IsCompanyBalanceSheet] [bit] NULL,
	[CompanyFinancialYear] [nvarchar](200) NULL,
	[CompanyTurnover] [decimal](18, 4) NULL,
	[CompanyTotalAssets] [decimal](18, 4) NULL,
	[NoOfMonthsAtPesentAddress] [nvarchar](50) NULL,
	[ComPhyAdd1] [nvarchar](200) NULL,
	[ComPhyAdd2] [nvarchar](200) NULL,
	[ComPhyAdd3] [nvarchar](200) NULL,
	[ComPhyAdd4] [nvarchar](200) NULL,
	[ComPhyAddCode] [nvarchar](100) NULL,
	[HomeCountryAddress1] [nvarchar](200) NULL,
	[HomeCountryAddress2] [nvarchar](200) NULL,
	[HomeCountryAddress3] [nvarchar](200) NULL,
	[HomeCountryAddress4] [nvarchar](200) NULL,
	[HomeCountryAddressCode] [nvarchar](100) NULL,
	[PreferredLanguage] [nvarchar](200) NULL,
	[TradeLicenseNumber] [nvarchar](200) NULL,
	[IsSpouseDetailsIncluded] [bit] NULL,
	[ComPhyAddMakaniNumber] [nvarchar](200) NULL,
	[OfficeBuildingName] [nvarchar](200) NULL,
	[OfficeStreetName] [nvarchar](200) NULL,
	[OfficeEmirate] [bigint] NULL,
	[OfficeCountry] [bigint] NULL,
	[OfficeNearestLandmark] [nvarchar](200) NULL,
	[OfficeMakaniNumber] [nvarchar](200) NULL,
	[ComNumberofFleetVehicles] [bigint] NULL,
	[ComNumberofMortgagedVehicles] [bigint] NULL,
	[IsClientClaimedIn12Months] [bit] NULL,
	[IsStaffIndicator] [bit] NULL,
	[NewInCountry] [bit] NULL,
	[FamilyName] [nvarchar](200) NULL,
	[FirstNameInArabic] [nvarchar](200) NULL,
	[MiddleNameInArabic] [nvarchar](200) NULL,
	[LastNameInArabic] [nvarchar](200) NULL,
	[FamilyNameInArabic] [nvarchar](200) NULL,
	[IsResident] [bit] NULL,
	[ComNoOfPeopleEmployed] [int] NULL,
	[ComTradeLicensePlaceofIssue] [nvarchar](200) NULL,
	[AreaName] [nvarchar](200) NULL,
	[VillaOrApartmentNumber] [nvarchar](50) NULL,
	[AreaCodeId] [bigint] NULL,
	[OfficeTelephonenumberExtension] [nvarchar](10) NULL,
	[CityId] [bigint] NULL,
	[EmiratesCardNumber] [nvarchar](50) NULL,
	[EmiratesCardPhoto] [nvarchar](max) NULL,
	[IsEmiratesCardSwiped] [bit] NULL,
	[ResidencyStatus] [bigint] NULL,
	[IsUpdateStatustoTransaction] [bit] NULL,
 CONSTRAINT [TransactionClient_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [FK_TransactionClient_StaticValueClaimsFreeGroup] FOREIGN KEY([ClaimFreeGroup])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [FK_TransactionClient_StaticValueClaimsFreeGroup]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [FK_TransactionClient_StaticValueMarketingSource] FOREIGN KEY([MarketingSource])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [FK_TransactionClient_StaticValueMarketingSource]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [FK_TransactionClient_StaticValuePreferedMailingAddress] FOREIGN KEY([PreferedMailingAddress])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [FK_TransactionClient_StaticValuePreferedMailingAddress]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_Country]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_CountryComPhyAddCountryId] FOREIGN KEY([ComPhyAddCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_CountryComPhyAddCountryId]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_CountryHomeCountryId] FOREIGN KEY([HomeCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_CountryHomeCountryId]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_CountryNationality] FOREIGN KEY([Nationality])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_CountryNationality]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_CountryPhyAdd] FOREIGN KEY([PhyAddCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_CountryPhyAdd]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_CountryPhyAddCountryId] FOREIGN KEY([PhyAddCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_CountryPhyAddCountryId]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_CountryPostAdd] FOREIGN KEY([PostAddCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_CountryPostAdd]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_IdType] FOREIGN KEY([IDTypeId])
REFERENCES [dbo].[IdType] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_IdType]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_OfficeCountry] FOREIGN KEY([OfficeCountry])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_OfficeCountry]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_OfficeEmirate] FOREIGN KEY([OfficeEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_OfficeEmirate]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH NOCHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueAreaCodeId] FOREIGN KEY([AreaCodeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueAreaCodeId]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueBusinessTypeId] FOREIGN KEY([BusinessTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueBusinessTypeId]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH NOCHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueCityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueCityId]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueComEmirate] FOREIGN KEY([ComEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueComEmirate]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueComNatureOfBusiness] FOREIGN KEY([ComNatureOfBusiness])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueComNatureOfBusiness]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueComPhyAddEmirate] FOREIGN KEY([ComPhyAddEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueComPhyAddEmirate]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueEthnicGroup] FOREIGN KEY([EthnicGroup])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueEthnicGroup]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueFinanceStatus] FOREIGN KEY([FinanceStatus])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueFinanceStatus]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueGender] FOREIGN KEY([GenderId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueGender]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueLanguage] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueLanguage]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueMaritalStatus] FOREIGN KEY([MaritalStatusId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueMaritalStatus]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueMarrageType] FOREIGN KEY([MarrageTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueMarrageType]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValuePhyAddEmirate] FOREIGN KEY([PhyAddEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValuePhyAddEmirate]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValuePostAddEmirate] FOREIGN KEY([PostAddEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValuePostAddEmirate]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValuePreferredCallTime] FOREIGN KEY([PreferredCallTime])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValuePreferredCallTime]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueQualificationId] FOREIGN KEY([QualificationId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueQualificationId]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueResidenctStatus] FOREIGN KEY([ResidencyStatus])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueResidenctStatus]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueResidentialStatus] FOREIGN KEY([ResidentialStatus])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueResidentialStatus]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_StaticValueTitle] FOREIGN KEY([TitleId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_StaticValueTitle]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH NOCHECK ADD  CONSTRAINT [TransactionClient_FK_TransactionBankingDetails] FOREIGN KEY([BankingDetailsId])
REFERENCES [dbo].[TransactionBankingDetails] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_TransactionBankingDetails]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[TransactionClient]  WITH CHECK ADD  CONSTRAINT [TransactionClient_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionClient] CHECK CONSTRAINT [TransactionClient_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[TransactionClient] ADD  CONSTRAINT [DF_TransactionClient_IsSMSAlertRequired]  DEFAULT ((0)) FOR [IsSMSAlertRequired]
GO
ALTER TABLE [dbo].[TransactionClient] ADD  CONSTRAINT [TransactionClient_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionClient] ADD  CONSTRAINT [TransactionClient_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TransactionClient] ADD  DEFAULT ((0)) FOR [IsSpouseDetailsIncluded]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Male,1-Female' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionClient', @level2type=N'COLUMN',@level2name=N'GenderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table is for Transaction CLient details and driver Details.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionClient'