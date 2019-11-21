CREATE PROCEDURE [dbo].[spGetFinanceApplication]
@TransactionId int,
@CompanyId int,
@UserId int

AS
BEGIN
SELECT
	 tfa.BankersName
	,tfa.BankersOfficeTelephoneNumber
	,tfa.BankersMobileNumber
	,tfa.BankersEmailAddress
	,comp.CompanyName
	,comp.Id as CompanyId
	,comp.CompanyEmail as CompanyEmailAddress
	,comp.CompanyLogo
	,tr.Id as TransactionId
	,isnull('TR' + cast(tr.Id AS NVARCHAR(50)), '') + isnull('/FL' + tr.FleetNumber, '') AS TransactionIdFleet
	,brn.Id as BranchId
	,brn.WorkTelephoneNumber as BranchTelephoneNumber
	,SalesPerson=(select isnull(SalesPersonName,'') from salesperson where BranchId=brn.Id and id=tr.SalesPersonId)
	,brn.BranchName
	,grp.GroupName
	,tc.Id as ClientId
	,ClientType = CASE 
		WHEN tc.CustomerType IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'customertype'
						)
					AND id = tc.CustomerType
				)
		END
		,Case WHEN tc.IsGuarantorApplication is not null and tc.IsGuarantorApplication  !=0 then 'Yes' Else 'No' End  as  ClientIsGuarantorApplication
		,Case WHEN tc.IsSpouseDetailsIncluded is not null and tc.IsSpouseDetailsIncluded  !=0 then 'Yes' Else 'No' End  as  IsSpouseDetailsIncluded
		,CASE 
		WHEN tc.RegularDriver IS NULL
			OR (tc.RegularDriver = 0)
			THEN 'No'
		ELSE 'Yes'
		END AS RegularDriver	
	,Title = CASE 
		WHEN tc.TitleId IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'Title'
						)
					AND id = tc.TitleId
				)
		END
	,tc.Initials	
	,Nationality = CASE 
		WHEN tc.GenderId IS NULL
			THEN ''
		ELSE (
				SELECT CountryName
				FROM [dbo].[Country]
				WHERE Id = tc.Nationality
					AND IsActive = 1
				)
		END
	,tc.DateOfBirth AS DateOfBirth
	,Gender = CASE 
		WHEN tc.GenderId IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'Gender'
						)
					AND id = tc.GenderId
				)
		END
	,SpecifyMaritalStatus as MaritalStatus
	,HowMarried = CASE 
		WHEN tc.MarrageTypeId IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'MarriageType'
						)
					AND id = tc.MarrageTypeId
				)
		END
	 ,MarriageDate AS DateMarried	
	,tc.NoofDependents AS NoofDependents
	,tc.PreferredLanguage AS PreferredLanguage	
	,Qualification = CASE 
		WHEN tc.QualificationId IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'Qualification'
						)
					AND id = tc.QualificationId
				)
		END
		,BusinessSegment = CASE 
		WHEN tc.BusinessTypeId IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'BusinessSegment'
						)
					AND id = tc.BusinessTypeId
				)
		END
		,TransactionFinanceType = CASE 
		WHEN tc.MarrageTypeId IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'FinanceType'
						)
					AND id = tr.FinanceType
				)
		END
		,tc.MothersMaidenName AS MothersMaidenName
		,tc.UAEResidentSince AS UAEResidentSince
		,tc.FamilyName AS FamilyNameInEnglish
		,isnull(tc.FirstName, '') + isnull(tc.MiddleName, '') + isnull(tc.LastName, '') AS FullName
		,isnull(tc.FirstNameInArabic, '') + isnull(tc.MiddleNameInArabic, '') + isnull(tc.LastNameInArabic, '') AS FullNameInArabic	
		,tc.FamilyNameInArabic AS FamilyNameinArabic
		,Case When tc.NewInCountry is null or tc.NewInCountry=0 then 'No' Else 'Yes' End AS NewInCountry
		,Case When tc.IsResident is null or tc.IsResident=0 then 'No' Else 'Yes' End AS WhetherResident
		,tc.PhyAddBuildingName--
		,tc.PhyAddStreetName
		,tc.PhyAddEmirate		
		,PhyAddCountry=Case when tc.ComPhyAddCountryId is not null then (select CountryName from Country where id=tc.ComPhyAddCountryId) else '' end
		,tc.PhyAddNearestLandmark
		,tc.ComPhyAddMakaniNumber --check		
		,tc.AreaName
		,AreaCode  = CASE 
		WHEN tc.AreaCodeId IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'EmirateAreaCode'
						)
					AND id = tc.AreaCodeId
				)
		END	
		,tc.PhyAddFlatNo
		,ComPhyAddEmirate = CASE 
		WHEN tc.ComPhyAddEmirate IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'Emirate'
						)
					AND id = tc.ComPhyAddEmirate
				)
		END,
		 tc.ComPhyAddEmirate	
		,tc.PostAddPOBoxNo
		,tc.PostAddEmirate
		,PostAddCountry=(select CountryName from Country where id=tc.PostAddCountryId)
		,PostAddCountry=Case when tc.PostAddCountryId is not null then (select CountryName from Country where id=tc.PostAddCountryId) else '' end
		,tc.OfficeBuildingName
		,tc.ComPhyAddStreetName
		,tc.ComPhyAddEmirate
		,tc.ComPhyAddCountryId --
		,tc.OfficeNearestLandmark
		,tc.OfficeMakaniNumber
		,tc.NoOfYearsAtPesentAddress
		,tc.NoOfMonthsAtPesentAddress
		,PreferedMailingAddress = CASE 
		WHEN tc.PreferedMailingAddress IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'MailingAddress'
						)
					AND id = tc.PreferedMailingAddress
				)
		END
		,tc.HomeCountryAddress1  as AddressInHomeCountry
		,tc.ContactNumberInHomeCountry as ContactInHomeCountry
		,tc.Mobile
		,tc.HomePhoneNumber
		,tc.HomePhoneCode
		,tc.EmailAddress
		,tc.FaxCode
		,tc.FaxNumber
		,tc.AlternativeMobile
		,tc.WorkPhoneCode
		,tc.WorkPhoneNumber
		,tc.OfficeTelephonenumberExtension
		,tc.PassportExpiryDate
		,tc.PassportIssueDate
		,tc.PassportIssuePlace
		,tc.PassportNo
		,tc.EmiratesCardNumber
		,tc.EmiratesIdExpiryDate
		,tc.EmiratesIdIssueDate
		,tc.EmiratesIdIssuePlace
		,tc.VisaExpiryDate
		,tc.VisaIssueDate
		,tc.VisaIssuePlace
		,tc.VisaNo
		,ClientType = Case When tc.CustomerType =1 then 'INDIVIDUAL' else 'COMPANY' END
		,EmploymentType = CASE 
		WHEN ted.EmploymentTypeId IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'EmploymentType'
						)
					AND id = ted.EmploymentTypeId
				)
		END,
		ted.NameofEmployer,
		ted.EmployeeNumber,
		ted.Occupation,
		ted.JoiningDate,
		ted.Designation,
		ted.PreviousEmployer,
		ted.NoOfYearsWithPreviousEmployer,
		ted.EmploymentCategoryId,
		ted.PreviousEmployerAddress,
		ted.NoOfYearsWithPreviousEmployer,
		ted.CurrentEmployerDateOfEstablishment,
		ted.MODRank,
		ted.NatureOfBusiness,
		ted.WebsiteOfEmployer,
		ted.NoOfEmployees,
		ted.PreviousEmployerTelephoneNumber,
		ted.PreviousEmployerTelephoneNumberCode,
		ted.PhyAdd1,
		ted.PhyAdd2,
		ted.PhyAdd3,
		ted.PhyAdd4,
		EmploymentCategory = CASE 
		WHEN ted.EmploymentCategoryId IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'EmploymentCategory'
						)
					AND id = ted.EmploymentCategoryId
				)
		END,
		ted.BusinessName,
		ted.DateofInception,
		ted.TradeLicenceNo,
		ted.TradeLicenceExpiryDate,
		ted.NatureOfBusiness,
		NatureofBusiness  = CASE 
		WHEN ted.NatureOfBusiness IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'Industry'
						)
					AND id = ted.NatureOfBusiness
				)
		END,
		tr.color,
		tr.VehicleCondition,
		tr.ChassisNumber,
		tr.Kilometers,
		tr.EngineNumber,
		tr.DisburseId,--
		tr.FirstRegistrationDate,
		tr.VehicleRegisteredAt,
		tr.VehicleRegistrationName,
		tr.Valuator,tr.ValuationDate,
		tr.VehicleDescription,
		tr.RegistrationNumber,
		tv.VehicleTypeName,
		tv.Manufacturer,
		tv.Model,
		tv.Trim,
		tv.ModelYear,
		tv.Cylinders,
		tv.BodyTypeId,--
		tv.BodyStyle as BodyType,
		tv.Doors,
		tv.EnginePower,
		tv.TransmissionTypeId,--		
		FuelType  = CASE 
		WHEN tv.TransmissionTypeId IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'FuelType'
						)
					AND id = tv.TransmissionTypeId
				)
		END,
		TransmissionType  = CASE 
		WHEN tn.FuelTypeId IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'TransmissionType'
						)
					AND id = tn.FuelTypeId
				)
		END,
		DownPaymentMadeTo  = CASE 
		WHEN tv.DownPaymentMadeTo IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'DownPaymentMadeTo'
						)
					AND id = tv.DownPaymentMadeTo
				)
		END,
		tr.RetailPrice,
		tr.Discount as TransactionDiscount,
		tr.DownPayment as TransactionDownPayment,
		VehicleCondition  = CASE 
		WHEN tr.VehicleCondition IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'VehicleCondition'
						)
					AND id = tr.VehicleCondition
				)
		END,
		DisburseTo  = CASE 
		WHEN tr.DisburseId IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'Disburse'
						)
					AND id = tr.DisburseId
				)
		END,
		--tie.PurchasePrice,
		tr.IsTradeIn,
		
		tr.IsTradeInCashTransaction,
		
		tr.TradeInFinanceCompanyId,
		--ti.ItemRetailValue,
		tr.TradeInCarFinanceAccNumber,
		TransactionType  = CASE 
		WHEN tr.DisburseId IS NULL
			THEN ''
		ELSE (
				SELECT Name
				FROM [dbo].[StaticValue]
				WHERE StaticCategoryId = (
						SELECT ID
						FROM [dbo].[StaticCategory]
						WHERE Name = 'TransactionType'
						)
					AND id = tr.TransactionTypeId
				)
		END,
		tr.TransactionTypeId
		--,FinancedProductsRetailValue =ISNULL(SUM(tp.RetailPrice),0)
		
FROM [dbo].[Transaction] tr
LEFT JOIN [dbo].[TransactionFinanceApplication] tfa ON tr.Id = tfa.TransactionId
LEFT JOIN [dbo].[Company] comp ON tfa.CompanyId = comp.Id
LEFT JOIN [dbo].Branch brn ON brn.Id = tr.BranchId
LEFT JOIN [dbo].[Group] grp ON grp.Id = tr.GroupId
LEFT JOIN [dbo].[TransactionClient] tc ON tfa.clientid = tc.id
LEFT JOIN [dbo].[TransactionEmployerDetails] ted on tr.Id=ted.TransactionId
LEFT JOIN [dbo].ViewVehicles tv on tr.id=tv.TransactionId
LEFT JOIN [dbo].[transactionNotes] tn on tr.id=tn.transactionid
LEFT JOIN [dbo].[TransactionProduct] tp on tr.id=tp.TransactionId and tp.TransactionTypeId=tr.TransactionTypeId and tp.IsActive=1
--LEFT JOIN [dbo].TransactionIncomeAndExpenditure tie on  tr.id=tie.TransactionId
--LEFT JOIN [dbo].TransactionItem ti on tr.id=ti.TransactionId
Where tr.Id=@TransactionId and  comp.companyname =(select CompanyName from Company where  Id=@CompanyId)

END

--exec spGetFinanceApplication 137130,10161,1
--FinancedProductsRetailValue =ISNULL(SUM(tp.RetailPrice),0)