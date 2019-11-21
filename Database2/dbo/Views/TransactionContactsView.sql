CREATE VIEW [dbo].[TransactionContactsView] AS
select 

tc.id as ContactId
,tc.TransactionId
,Case when tcc.CustomerType=1 then  UPPER(svi.Name) else UPPER(svc.Name) end as 'RELATIONSHIP'
,UPPER(tc.FirstName) as 'FIRST_NAME'
,UPPER(tc.LastName) as 'LAST_NAME'
,case when tc.isRegularDriver=0 then 'NO' ELSE 'YES' END as 'REGULAR_DRIVER'
,case when tc.IsSecondInsured=0 then 'NO' ELSE 'YES' END as 'SECOND_INSURED'
,case when tc.IsThirdPartyRegistration=0 then 'NO' ELSE 'YES' END as 'THIRD_PARTY_REGISTRATION'
,UPPER(tc.Initials) as 'ADDITIONAL_INITIALS'
,UPPER(svg.Name) as 'ADDITIONAL_GENDER'
,UPPER(svt.Name) as 'ADDITIONAL_TITLE'
,UPPER(convert(varchar, tc.DateofBirth, 106)) as 'ADDITIONAL_DATE_OF_BIRTH'
,UPPER(tc.EmiratesIdNo) as 'ADDITIONAL_ID_NUMBER'
,UPPER(TC.EmiratesIdIssueDate) as 'ADDITIONAL_ISSUE_DATE'
,UPPER(convert(varchar,TC.EmiratesIdExpiryDate, 106)) as 'ADDITIONAL_ID_EXPIRY_DATE'
,UPPER(TC.PassportNo) as 'ADDITIONAL_PASSPORT_NUMBER'
,UPPER(convert(varchar,TC.PassportIssueDate, 106)) as 'ADDITIONAL_PASSPORT_ISSUE_DATE'
,UPPER(convert(varchar,tc.PassportExpiryDate, 106)) as 'ADDITIONAL_PASSPORT_EXPIRY_DATE'
,UPPER(tc.PermitNumber) as 'ADDITIONAL_PERMIT_NUMBER'
,UPPER(convert(varchar,tc.PermitIssueDate, 106)) as 'ADDITIONAL_PERMIT_ISSUE_DATE'
,UPPER(convert(varchar,tc.PermitExpiryDate, 106)) as 'ADDITIONAL_PERMIT_EXPIRY_DATE'
,UPPER(tc.DriversLicenceNo) as 'DRIVERS_LICENCE_NUMBER'
,UPPER(convert(varchar,tc.DriversLicenceIssueDate, 106)) as 'DRIVERS_LICENCE_ISSUE_DATE'
,UPPER(convert(varchar,tc.DriversLicenceExpiryDate, 106)) as 'DRIVERS_LICENCE_EXPIRY_DATE'
,UPPER(tc.DriversLicenceIssuePlace) as 'DRIVERS_LICENCE_ISSUE_PLACE'
,UPPER(svl.name) as 'ADDITIONAL_PREFERRED_LANGUAGE'
,CONCAT(CASE WHEN tc.HomePhoneCode is not null then '('+tc.HomePhoneCode+') 'else '' end,CASE WHEN tc.HomePhoneNumber is not null then  tc.HomePhoneNumber else '' end ) as 'ADDITIONAL_HOME_TELEPHONE'
,UPPER(tc.OfficeTelephonenumberExtension) as 'ADDITIONAL_TELEPHONE_EXT'
 ,CONCAT(CASE WHEN tc.WorkPhoneCode is not null then '('+tc.WorkPhoneCode+') 'else '' end,CASE WHEN tc.WorkTelephoneNumber is not null then  tc.WorkTelephoneNumber else '' end )  as 'ADDITIONAL_OFFICE_TELEPHONE'
 ,CONCAT(CASE WHEN tc.FaxCode is not null then '('+tc.FaxCode+') 'else '' end,CASE WHEN tc.FaxNumber is not null then  tc.FaxNumber else '' end ) as 'ADDITIONAL_FAX_NUMBER'
 ,tc.MobileNumber as 'MOBILE_NUMBER'
 ,UPPER(tc.EmailAddress) as 'ADDITIONAL_EMAIL_ADDRESS'
 ,UPPER(tc.PhyAddBuildingName) as 'ADDITIONAL_RESIDENTIAL_ADDRESS1'
 ,UPPER(tc.PhyAddArea) as 'ADDITIONAL_RESIDENTIAL_ADDRESS2'
 ,UPPER(tc.PhyAddEmirate) as 'ADDITIONAL_RESIDENTIAL_ADDRESS3'
 ,UPPER(tc.MakaniNumber) as 'ADDITIONAL_CONTACT_PERSON_MAKANI'
 ,UPPER(tc.PostAddPOBoxNo) as 'ADDITIONAL_POSTAL_ADDRESS1'
 ,UPPER(tc.PostAddEmirate) as 'ADDITIONAL_POSTAL_ADDRESS2'
 ,UPPER(svcntr.CountryName) as 'ADDITIONAL_POSTAL_ADDRESS3' --
 ,UPPER(tc.HomeCountryAddress1) as 'ADDITIONAL_COUNTRY_ADDRESS1'
 ,UPPER(tc.HomeCountryAddress2) as 'ADDITIONAL_COUNTRY_ADDRESS2'
 ,UPPER(tc.HomeCountryAddress3) as 'ADDITIONAL_COUNTRY_ADDRESS3'
 ,UPPER(tc.HomeCountryAddress4) as 'ADDITIONAL_COUNTRY_ADDRESS4'
 ,UPPER(tc.HomeCountryAddressCode) as 'ADDITIONAL_COUNTRY_ADDRESS5'
 ,UPPER(ctrcntl.CountryName) as 'ADDITIONAL_NATIONALITY'
 ,UPPER(pfvl.Name) as 'ADDITIONAL_PREFERRED_STATEMENT_METHOD'
 ,UPPER(svms.Name) as 'ADDITIONAL_MARITAL_STATUS'
 ,UPPER(svhm.name) as 'ADDITIONAL_HOW_MARRIED'
 ,UPPER(tc.SpecifyMaritalStatus) as 'ADDITIONAL_SPECIFY'
 ,UPPER(convert(varchar,tc.MarriageDate, 106)) as 'ADDITIONAL_DATE_MARRIED'
,UPPER(tc.ResidentialStatus) as 'ADDITIONAL_RESIDENTIAL_STATUS'
,UPPER(tc.SpouseEmployerName) as 'ADDITIONAL_EMPLOYER_NAME'
,UPPER(convert(varchar,tc.JoiningDate, 106)) as 'ADDITIONAL_DATE_OF_JOINING'
,UPPER(tc.Occupation) as 'ADDITIONAL_OCCUPATION'
,UPPER(tc.Designation) as 'ADDITIONAL_DESIGNATION'
,UPPER(svmq.Name) as 'ADDITIONAL_QUALIFICATION_LEVEL'
,UPPER(tc.TradeLicenseNumber) as 'ADDITIONAL_TRADE_LICENSE_NUMBER'
 ,UPPER(convert(varchar,tc.DateofInception, 106)) as 'ADDITIONAL_DATE_OF_INCEPTION'
 ,UPPER(convert(varchar,tc.TradelicenseExpiryDate, 106)) as 'ADDITIONAL_TRADE_LICENSE_EXPIRY_DATE'
 ,UPPER(svec.Name) as 'ADDITIONAL_EMPLOYMENT_CATEGORY'
 ,'' as 'ADDITIONAL_SIGNATORY_TYPE'
 from [dbo].[TransactionContact]  tc 
 	INNER join [Transaction] t on t.Id=tc.TransactionId  AND tc .isactive=1
 	left join TransactionClient tcc on tcc.id=t.TransactionClientId
 left join StaticValue svi on svi.Id=tc.RelationshipId and svi.StaticCategoryId = (select id from StaticCategory where name ='individualrelationship')
 	left join StaticValue svc on svc.Id=tc.RelationshipId and svc.StaticCategoryId = (select id from StaticCategory where name ='companyrelationship')
	left join StaticValue svt on svt.Id=tc.Title and svt.StaticCategoryId = (select id from StaticCategory where name ='Title')
	left join StaticValue svg on svg.Id=tc.GenderId and svg.StaticCategoryId = (select id from StaticCategory where name ='GENDER')
	left join StaticValue svl on svl.Id=tc.LanguageId and svl.StaticCategoryId = (select id from StaticCategory where name ='language')
	left join StaticValue svms on svms.Id=tc.MaritalStatusId and  svms.StaticCategoryId = (select id from StaticCategory where name ='MaritalStatus')
	left join StaticValue svmq on svmq.Id=tc.QualificationLevelId and  svmq.StaticCategoryId = (select id from StaticCategory where name ='QualificationLevel')
	left join StaticValue svec on svec.Id=tc.EmploymentCategoryId and  svec.StaticCategoryId = (select id from StaticCategory where name ='EmploymentCategory')
	left join StaticValue svhm on svhm.Id=tc.MarrageTypeId
	left join Country svcntr on svcntr.id =tc.PostAddCountryId 
	left join Country ctrcntl on ctrcntl.id =tc.Nationality
	left join StaticValue pfvl on pfvl.Id=tc.PreferedMailingAddress