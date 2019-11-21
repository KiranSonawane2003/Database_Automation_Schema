CREATE TABLE [dbo].[TransactionContact](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[Title] [bigint] NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[AlternativeMobileNumber] [nvarchar](50) NULL,
	[WorkTelephoneNumber] [nvarchar](100) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[RelationshipId] [bigint] NOT NULL,
	[SpouseEmployerName] [nvarchar](100) NULL,
	[SpouseEmployerAddress] [nvarchar](200) NULL,
	[SpouseOccupationId] [bigint] NULL,
	[PeriodOfEmployment] [nvarchar](50) NULL,
	[IsRegularDriver] [bit] NULL,
	[GenderId] [bigint] NULL,
	[Initials] [nvarchar](20) NULL,
	[HomePhoneCode] [nvarchar](20) NULL,
	[HomePhoneNumber] [nvarchar](50) NULL,
	[WorkPhoneCode] [nvarchar](20) NULL,
	[WorkPhoneNumber] [nvarchar](50) NULL,
	[IsSecondInsured] [bit] NOT NULL,
	[MiddleName] [nvarchar](100) NULL,
	[DriversLicenceNo] [nvarchar](100) NULL,
	[DriversLicenceIssueDate] [date] NULL,
	[DriversLicenceExpiryDate] [date] NULL,
	[DriversLicenceIssuePlace] [nvarchar](200) NULL,
	[Nationality] [bigint] NULL,
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
	[PhyAddCountryId] [bigint] NULL,
	[PostAddPOBoxNo] [nvarchar](200) NULL,
	[PostAddEmirate] [bigint] NULL,
	[PostAddCountryId] [bigint] NULL,
	[ResidentialStatus] [bigint] NULL,
	[QualificationLevelId] [bigint] NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[PhyAdd1] [nvarchar](200) NULL,
	[PhyAdd2] [nvarchar](200) NULL,
	[PhyAdd3] [nvarchar](200) NULL,
	[PostAdd1] [nvarchar](200) NULL,
	[PostAdd2] [nvarchar](200) NULL,
	[PostAdd3] [nvarchar](200) NULL,
	[IDNumber] [nvarchar](200) NULL,
	[IdIssueDate] [date] NULL,
	[IdExpiryDate] [date] NULL,
	[PermitNumber] [nvarchar](100) NULL,
	[PermitIssueDate] [date] NULL,
	[PermitExpiryDate] [date] NULL,
	[UAEResidentSince] [date] NULL,
	[Occupation] [nvarchar](200) NULL,
	[Designation] [nvarchar](200) NULL,
	[PhyAdd4] [nvarchar](200) NULL,
	[PhyAddCode] [nvarchar](100) NULL,
	[PostAdd4] [nvarchar](200) NULL,
	[PostAddCode] [nvarchar](100) NULL,
	[LanguageId] [bigint] NULL,
	[ConditionsOfResidentsPermit] [nvarchar](500) NULL,
	[MaritalStatusId] [bigint] NULL,
	[MarriageDate] [date] NULL,
	[NoofDependents] [int] NULL,
	[MarrageTypeId] [bigint] NULL,
	[SpecifyMaritalStatus] [nvarchar](100) NULL,
	[NoOfYearsAtPesentAddress] [int] NULL,
	[NoOfMonthsAtPesentAddress] [int] NULL,
	[PreferedMailingAddress] [bigint] NULL,
	[PreferedContactMethod] [bigint] NULL,
	[CountryOfBirth] [bigint] NULL,
	[PreviousAdd1] [nvarchar](200) NULL,
	[PreviousAdd2] [nvarchar](200) NULL,
	[PreviousAdd3] [nvarchar](200) NULL,
	[PreviousAdd4] [nvarchar](50) NULL,
	[PreviousAddCode] [nvarchar](100) NULL,
	[NoOfYearsAtPreviousAddress] [int] NULL,
	[NoOfMonthsAtPreviousAddress] [int] NULL,
	[IsDualCitizenship] [bit] NULL,
	[DualCitizenshipCountryId] [bigint] NULL,
	[HomeCountryId] [bigint] NULL,
	[AddressInHomeCountry] [nvarchar](500) NULL,
	[ContactNumberInHomeCountry] [nvarchar](50) NULL,
	[ShareholdingPercentage] [decimal](18, 2) NULL,
	[IsOwnHome] [bit] NULL,
	[HomeCountryAddress1] [nvarchar](200) NULL,
	[HomeCountryAddress2] [nvarchar](200) NULL,
	[HomeCountryAddress3] [nvarchar](200) NULL,
	[HomeCountryAddress4] [nvarchar](200) NULL,
	[HomeCountryAddressCode] [nvarchar](100) NULL,
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
	[NoOfYearsWithEmployer] [nvarchar](50) NULL,
	[NoOfMonthsWithEmployer] [nvarchar](50) NULL,
	[EmiratesCardNumber] [nvarchar](50) NULL,
	[EmiratesCardPhoto] [nvarchar](max) NULL,
	[IsEmiratesCardSwiped] [bit] NULL,
 CONSTRAINT [TransactionContact_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_Country]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_CountryCountryOfBirth] FOREIGN KEY([CountryOfBirth])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_CountryCountryOfBirth]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_CountryHomeCountryId] FOREIGN KEY([HomeCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_CountryHomeCountryId]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_CountryNationality] FOREIGN KEY([Nationality])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_CountryNationality]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_CountryPhyAddCountryId] FOREIGN KEY([PhyAddCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_CountryPhyAddCountryId]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_EmploymentCategory] FOREIGN KEY([EmploymentCategoryId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_EmploymentCategory]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH NOCHECK ADD  CONSTRAINT [TransactionContact_FK_StaticValueAreaCodeId] FOREIGN KEY([AreaCodeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_StaticValueAreaCodeId]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH NOCHECK ADD  CONSTRAINT [TransactionContact_FK_StaticValueCityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_StaticValueCityId]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_StaticValueGenderId] FOREIGN KEY([GenderId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_StaticValueGenderId]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_StaticValueLanguageId] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_StaticValueLanguageId]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_StaticValueMaritalStatusId] FOREIGN KEY([MaritalStatusId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_StaticValueMaritalStatusId]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_StaticValueMarrageTypeId] FOREIGN KEY([MarrageTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_StaticValueMarrageTypeId]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_StaticValuePhyAddEmirate] FOREIGN KEY([PhyAddEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_StaticValuePhyAddEmirate]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_StaticValuePostAddCountryId] FOREIGN KEY([PostAddCountryId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_StaticValuePostAddCountryId]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_StaticValuePostAddEmirate] FOREIGN KEY([PostAddEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_StaticValuePostAddEmirate]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_StaticValuePreferedContactMethod] FOREIGN KEY([PreferedContactMethod])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_StaticValuePreferedContactMethod]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_StaticValueQaulificationLevelId] FOREIGN KEY([QualificationLevelId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_StaticValueQaulificationLevelId]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_StaticValueRelationshipId] FOREIGN KEY([RelationshipId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_StaticValueRelationshipId]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_StaticValueResidentialStatus] FOREIGN KEY([ResidentialStatus])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_StaticValueResidentialStatus]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_StaticValueSpouseOccupationId] FOREIGN KEY([SpouseOccupationId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_StaticValueSpouseOccupationId]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_StaticValueTitle] FOREIGN KEY([Title])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_StaticValueTitle]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH NOCHECK ADD  CONSTRAINT [TransactionContact_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_Transaction]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_TransactionContact_PreferrefMailingAddress] FOREIGN KEY([PreferedMailingAddress])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_TransactionContact_PreferrefMailingAddress]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[TransactionContact]  WITH CHECK ADD  CONSTRAINT [TransactionContact_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionContact] CHECK CONSTRAINT [TransactionContact_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[TransactionContact] ADD  CONSTRAINT [DF_TransactionContact_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionContact] ADD  CONSTRAINT [DF_TransactionContact_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TransactionContact] ADD  DEFAULT ((0)) FOR [IsRegularDriver]
GO
ALTER TABLE [dbo].[TransactionContact] ADD  DEFAULT ((0)) FOR [IsSecondInsured]