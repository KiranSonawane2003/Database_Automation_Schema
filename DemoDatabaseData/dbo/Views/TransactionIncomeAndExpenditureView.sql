
CREATE VIEW [dbo].[TransactionIncomeAndExpenditureView]
AS 
SELECT 	
	ies.TransactionId,
	UPPER(ies.monthlysalary) monthlysalary,
	UPPER(ies.allowance) allowance,
	UPPER(ies.otherincome) otherincome,
	UPPER(ies.OtherDescription) OtherDescription,
	UPPER(ies.nonmonetarybenefits) nonmonetarybenefits,
	UPPER(ies.totalincome) totalincome,
	UPPER(ies.deductions) deductions,
	UPPER(convert(varchar,ies.salaryreceiveddate1, 106)) salaryreceiveddate1,
	UPPER(convert(varchar,ies.salaryreceiveddate2, 106)) salaryreceiveddate2,
	UPPER(convert(varchar,ies.salaryreceiveddate3, 106)) salaryreceiveddate3,
	UPPER(ies.BondHolderBank) BondHolderBank,
	UPPER(convert(varchar,ies.purchasedate, 106)) purchasedate,
	UPPER(ies.presentmarketvalue) presentmarketvalue,
	UPPER(ies.OutstandingBondAmount) OutstandingBondAmount,
	UPPER(ies.RegisterdTo) RegisterdTo,
	UPPER(ies.standnumber) standnumber,
	UPPER(ies.Surburb) Surburb,
	UPPER(ies.landlordname) landlordname,
	UPPER(ies.landlordaddress) landlordaddress,
	UPPER(fre.Name) AS Frequency,
	UPPER(sveowr.name) AS [ownership],
	UPPER(sveow.name) AS [ownershipotherthanrented],	
	UPPER(CASE WHEN ies.IsDisclosureofPersonalInfo=1 THEN 'yes' ELSE 'no' end) IsDisclosureofPersonalInfo,
	UPPER(CASE WHEN ies.IsDeclaredInsolvent=1 THEN 'yes' ELSE 'no' end) IsDeclaredInsolvent,
	UPPER(CASE WHEN ies.IsGuarantorsDetails=1 THEN 'yes' ELSE 'no' end) IsGuarantorsDetails,
	UPPER(CASE WHEN ies.IsShareDetailsWithinCompany=1 THEN 'yes' ELSE 'no' end) IsShareDetailsWithinCompany,
	UPPER(CASE WHEN ies.IsShareDetailsAmongPartner=1 THEN 'yes' ELSE 'no' end) IsShareDetailsAmongPartner,
	UPPER(CASE WHEN ies.IsReceiveMarketingInfo=1 THEN 'yes' ELSE 'no' end) IsReceiveMarketingInfo,
	UPPER(CASE WHEN ies.IsUnderDebtReview=1 then 'yes' else 'no' end ) IsUnderDebtReview,
	IsGuarantor,
	sv.Name AS  HowAreYouPaid,
	convert(varchar,ies.SalaryCertificateExpiryDate, 106) SalaryCertificateExpiryDate,
	ies.PurchasePrice 
	 FROM [Transaction] t
    left join TransactionIncomeAndExpenditure ies on ies.transactionid=t.id and ies.isActive=1
	LEFT JOIN staticvalue sveow on sveow.id=ies.OwnerShipTypeId and sveow.staticcategoryid=(select id from staticcategory where name like 'EmirateIncomeAndExpenditureOwnerShipType') and sveow.name <>'Rented' and sveow.isActive=1	
	LEFT JOIN staticvalue sveowr on sveowr.id=ies.OwnerShipTypeId and sveowr.staticcategoryid=(select id from staticcategory where name LIKE 'EmirateIncomeAndExpenditureOwnerShipType') and sveowr.name ='Rented' and sveowr.isActive=1	
	LEFT JOIN staticvalue fre on fre.id=ies.frequencyId and fre.staticcategoryid=(select id from staticcategory where name like 'EmirateIncomeAndExpenditureFrequency') and fre.countryid=t.countryid and fre.isActive=1	
	left join StaticValue sv ON sv.id=ies.HowAreYouPaid

