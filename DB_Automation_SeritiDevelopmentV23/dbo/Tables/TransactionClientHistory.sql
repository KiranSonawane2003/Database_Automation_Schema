﻿CREATE TABLE [dbo].[TransactionClientHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ApplicationHistoryId] [bigint] NOT NULL,
	[ClientId] [bigint] NOT NULL,
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
	[PreferedMailingAddress] [int] NULL,
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
 CONSTRAINT [PK_TransactionClientHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionClientHistory] ADD  CONSTRAINT [DF_TransactionClientHistory_IsSpouseDetailsIncluded]  DEFAULT ((0)) FOR [IsSpouseDetailsIncluded]