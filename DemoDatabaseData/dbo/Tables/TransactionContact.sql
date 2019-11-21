﻿CREATE TABLE [dbo].[TransactionContact] (
    [Id]                             BIGINT          IDENTITY (1, 1) NOT NULL,
    [TransactionId]                  BIGINT          NOT NULL,
    [Title]                          BIGINT          NULL,
    [LastName]                       NVARCHAR (100)  NOT NULL,
    [FirstName]                      NVARCHAR (100)  NOT NULL,
    [MobileNumber]                   NVARCHAR (50)   NULL,
    [AlternativeMobileNumber]        NVARCHAR (50)   NULL,
    [WorkTelephoneNumber]            NVARCHAR (100)  NULL,
    [CountryId]                      BIGINT          NULL,
    [IsActive]                       BIT             CONSTRAINT [DF_TransactionContact_IsActive] DEFAULT ((1)) NULL,
    [CreatedDate]                    DATETIME        CONSTRAINT [DF_TransactionContact_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]                   DATETIME        NULL,
    [CreatedBy]                      INT             NOT NULL,
    [ModifiedBy]                     INT             NULL,
    [RelationshipId]                 BIGINT          NOT NULL,
    [SpouseEmployerName]             NVARCHAR (100)  NULL,
    [SpouseEmployerAddress]          NVARCHAR (200)  NULL,
    [SpouseOccupationId]             BIGINT          NULL,
    [PeriodOfEmployment]             NVARCHAR (50)   NULL,
    [IsRegularDriver]                BIT             DEFAULT ((0)) NULL,
    [GenderId]                       BIGINT          NULL,
    [Initials]                       NVARCHAR (20)   NULL,
    [HomePhoneCode]                  NVARCHAR (20)   NULL,
    [HomePhoneNumber]                NVARCHAR (50)   NULL,
    [WorkPhoneCode]                  NVARCHAR (20)   NULL,
    [WorkPhoneNumber]                NVARCHAR (50)   NULL,
    [IsSecondInsured]                BIT             DEFAULT ((0)) NOT NULL,
    [MiddleName]                     NVARCHAR (100)  NULL,
    [DriversLicenceNo]               NVARCHAR (100)  NULL,
    [DriversLicenceIssueDate]        DATE            NULL,
    [DriversLicenceExpiryDate]       DATE            NULL,
    [DriversLicenceIssuePlace]       NVARCHAR (200)  NULL,
    [Nationality]                    BIGINT          NULL,
    [DateofBirth]                    DATE            NULL,
    [PassportNo]                     NVARCHAR (100)  NULL,
    [PassportIssueDate]              DATE            NULL,
    [PassportExpiryDate]             DATE            NULL,
    [VisaNo]                         NVARCHAR (100)  NULL,
    [VisaIssueDate]                  DATE            NULL,
    [VisaExpiryDate]                 DATE            NULL,
    [EmiratesIdNo]                   NVARCHAR (200)  NULL,
    [EmiratesIdIssueDate]            DATE            NULL,
    [EmiratesIdExpiryDate]           DATE            NULL,
    [EmiratesIdIssuePlace]           NVARCHAR (200)  NULL,
    [PhyAddBuildingName]             NVARCHAR (200)  NULL,
    [PhyAddArea]                     NVARCHAR (100)  NULL,
    [PhyAddEmirate]                  BIGINT          NULL,
    [PhyAddCountryId]                BIGINT          NULL,
    [PostAddPOBoxNo]                 NVARCHAR (200)  NULL,
    [PostAddEmirate]                 BIGINT          NULL,
    [PostAddCountryId]               BIGINT          NULL,
    [ResidentialStatus]              BIGINT          NULL,
    [QualificationLevelId]           BIGINT          NULL,
    [EmailAddress]                   NVARCHAR (100)  NULL,
    [PhyAdd1]                        NVARCHAR (200)  NULL,
    [PhyAdd2]                        NVARCHAR (200)  NULL,
    [PhyAdd3]                        NVARCHAR (200)  NULL,
    [PostAdd1]                       NVARCHAR (200)  NULL,
    [PostAdd2]                       NVARCHAR (200)  NULL,
    [PostAdd3]                       NVARCHAR (200)  NULL,
    [IDNumber]                       NVARCHAR (200)  NULL,
    [IdIssueDate]                    DATE            NULL,
    [IdExpiryDate]                   DATE            NULL,
    [PermitNumber]                   NVARCHAR (100)  NULL,
    [PermitIssueDate]                DATE            NULL,
    [PermitExpiryDate]               DATE            NULL,
    [UAEResidentSince]               DATE            NULL,
    [Occupation]                     NVARCHAR (200)  NULL,
    [Designation]                    NVARCHAR (200)  NULL,
    [PhyAdd4]                        NVARCHAR (200)  NULL,
    [PhyAddCode]                     NVARCHAR (100)  NULL,
    [PostAdd4]                       NVARCHAR (200)  NULL,
    [PostAddCode]                    NVARCHAR (100)  NULL,
    [LanguageId]                     BIGINT          NULL,
    [ConditionsOfResidentsPermit]    NVARCHAR (500)  NULL,
    [MaritalStatusId]                BIGINT          NULL,
    [MarriageDate]                   DATE            NULL,
    [NoofDependents]                 INT             NULL,
    [MarrageTypeId]                  BIGINT          NULL,
    [SpecifyMaritalStatus]           NVARCHAR (100)  NULL,
    [NoOfYearsAtPesentAddress]       INT             NULL,
    [NoOfMonthsAtPesentAddress]      INT             NULL,
    [PreferedMailingAddress]         BIGINT          NULL,
    [PreferedContactMethod]          BIGINT          NULL,
    [CountryOfBirth]                 BIGINT          NULL,
    [PreviousAdd1]                   NVARCHAR (200)  NULL,
    [PreviousAdd2]                   NVARCHAR (200)  NULL,
    [PreviousAdd3]                   NVARCHAR (200)  NULL,
    [PreviousAdd4]                   NVARCHAR (50)   NULL,
    [PreviousAddCode]                NVARCHAR (100)  NULL,
    [NoOfYearsAtPreviousAddress]     INT             NULL,
    [NoOfMonthsAtPreviousAddress]    INT             NULL,
    [IsDualCitizenship]              BIT             NULL,
    [DualCitizenshipCountryId]       BIGINT          NULL,
    [HomeCountryId]                  BIGINT          NULL,
    [AddressInHomeCountry]           NVARCHAR (500)  NULL,
    [ContactNumberInHomeCountry]     NVARCHAR (50)   NULL,
    [ShareholdingPercentage]         DECIMAL (18, 2) NULL,
    [IsOwnHome]                      BIT             NULL,
    [HomeCountryAddress1]            NVARCHAR (200)  NULL,
    [HomeCountryAddress2]            NVARCHAR (200)  NULL,
    [HomeCountryAddress3]            NVARCHAR (200)  NULL,
    [HomeCountryAddress4]            NVARCHAR (200)  NULL,
    [HomeCountryAddressCode]         NVARCHAR (100)  NULL,
    [IsContract]                     BIT             NULL,
    [IsSurety]                       BIT             NULL,
    [IsThirdPartyRegistration]       BIT             NULL,
    [JoiningDate]                    DATE            NULL,
    [MakaniNumber]                   NVARCHAR (200)  NULL,
    [TradeLicenseNumber]             NVARCHAR (200)  NULL,
    [TradelicenseExpiryDate]         DATE            NULL,
    [DateofInception]                DATE            NULL,
    [EmploymentCategoryId]           BIGINT          NULL,
    [PhyAddNearestLandMark]          NVARCHAR (200)  NULL,
    [FaxCode]                        NVARCHAR (10)   NULL,
    [FaxNumber]                      NVARCHAR (50)   NULL,
    [FamilyName]                     NVARCHAR (200)  NULL,
    [AreaName]                       NVARCHAR (200)  NULL,
    [VillaOrApartmentNumber]         NVARCHAR (50)   NULL,
    [AreaCodeId]                     BIGINT          NULL,
    [OfficeTelephonenumberExtension] NVARCHAR (10)   NULL,
    [CityId]                         BIGINT          NULL,
    [NoOfYearsWithEmployer]          NVARCHAR (50)   NULL,
    [NoOfMonthsWithEmployer]         NVARCHAR (50)   NULL,
    [EmiratesCardNumber]             NVARCHAR (50)   NULL,
    [EmiratesCardPhoto]              NVARCHAR (MAX)  NULL,
    [IsEmiratesCardSwiped]           BIT             NULL,
    CONSTRAINT [TransactionContact_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [TransactionContact_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [TransactionContact_FK_CountryCountryOfBirth] FOREIGN KEY ([CountryOfBirth]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [TransactionContact_FK_CountryHomeCountryId] FOREIGN KEY ([HomeCountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [TransactionContact_FK_CountryNationality] FOREIGN KEY ([Nationality]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [TransactionContact_FK_CountryPhyAddCountryId] FOREIGN KEY ([PhyAddCountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [TransactionContact_FK_EmploymentCategory] FOREIGN KEY ([EmploymentCategoryId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_StaticValueAreaCodeId] FOREIGN KEY ([AreaCodeId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_StaticValueCityId] FOREIGN KEY ([CityId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_StaticValueGenderId] FOREIGN KEY ([GenderId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_StaticValueLanguageId] FOREIGN KEY ([LanguageId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_StaticValueMaritalStatusId] FOREIGN KEY ([MaritalStatusId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_StaticValueMarrageTypeId] FOREIGN KEY ([MarrageTypeId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_StaticValuePhyAddEmirate] FOREIGN KEY ([PhyAddEmirate]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_StaticValuePostAddCountryId] FOREIGN KEY ([PostAddCountryId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_StaticValuePostAddEmirate] FOREIGN KEY ([PostAddEmirate]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_StaticValuePreferedContactMethod] FOREIGN KEY ([PreferedContactMethod]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_StaticValueQaulificationLevelId] FOREIGN KEY ([QualificationLevelId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_StaticValueRelationshipId] FOREIGN KEY ([RelationshipId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_StaticValueResidentialStatus] FOREIGN KEY ([ResidentialStatus]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_StaticValueSpouseOccupationId] FOREIGN KEY ([SpouseOccupationId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_StaticValueTitle] FOREIGN KEY ([Title]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_Transaction] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [TransactionContact_FK_TransactionContact_PreferrefMailingAddress] FOREIGN KEY ([PreferedMailingAddress]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [TransactionContact_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [TransactionContact_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

