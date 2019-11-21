-- =============================================
-- Author:		Pratap Kuyate
-- Create date: 20 Jan 2017
-- Description:	This procedure returns result required for DOC report for New , Demo and Pre-Owned Vehicles tab by
--				passing TransactionType, selected transasction ids, countryId and vehicleConditionId
-- =============================================

-- EXEC spGetByTransactionTypeAndVehicleCondition '20705,20704,20701,20685,20684,20683,20682,20681,20680,20679,20678,20677,20640,20630,20629,20628,20626,20614,20607,20606','12', '63','3'

CREATE PROCEDURE [dbo].[spGetByTransactionTypeAndVehicleCondition]
(
	@TransactionId			NVARCHAR(max),	
	@VehicleConditions		NVARCHAR(max),
	@TransactionTypes		NVARCHAR(max),
	@CountryID				BIGINT,
	@AdministratorId NVARCHAR(max),
	@ClaimId NVARCHAR(max),
	@OwnerId NVARCHAR(max),
	@UnderwriterId NVARCHAR(max)
)

AS
Begin

-- Create Product Details CTE
;
WITH ProductDetail AS
(
SELECT
	TP.TransactionId,
	TP.TransactionTypeId,
	TP.ProductId,
	P.ProductTypeId,
	P.ProductSubTypeId,
	ISNULL(TP.RetailPrice, 0) AS ProductRetailPrice,
	ISNULL(TP.Payover, 0) AS ProductPayOver,
	--CASE WHEN P.ProductSubTypeId = (Select Id from ProductSubType Where ProductSubTypeName =  'TRANSACTION FEE') THEN (ISNULL(TP.RetailPrice, 0) - ISNULL(TP.Payover, 0)) - ISNULL(T.TransactionFee, 0) ELSE (ISNULL(TP.RetailPrice, 0) - ISNULL(TP.Payover, 0)) END as ProductRetention
	(ISNULL(TP.RetailPrice, 0) - ISNULL(TP.Payover, 0)) AS ProductRetention
FROM [Transaction] T
INNER JOIN TransactionProduct TP WITH (NOLOCK)
	ON T.Id = TP.TransactionId
	AND T.TransactionTypeId = TP.TransactionTypeId
	AND TP.IsActive = 1
	AND TP.ProductOptionId IS NOT NULL
INNER JOIN Product P WITH (NOLOCK)
	ON TP.ProductId = P.Id
INNER JOIN ProductLine PL
	ON TP.ProductId = PL.ProductId
	AND PL.StartDate <=
						CASE
							WHEN T.IsIncepted = 1 THEN T.InceptDate
							ELSE (SELECT
									CONVERT(DATE, GETDATE()))
						END
	AND PL.EndDate >=
						CASE
							WHEN T.IsIncepted = 1 THEN T.InceptDate
							ELSE (SELECT
									CONVERT(DATE, GETDATE()))
						END
WHERE TP.IsActive = 1
AND TP.TransactionId IN (SELECT
	item
FROM dbo.SplitString(@TransactionId, ','))
AND PL.AdministratorId IN (SELECT
	item
FROM dbo.SplitString(@AdministratorId, ','))
AND PL.UnderwriterId IN (SELECT
	item
FROM dbo.SplitString(@UnderwriterId, ','))
AND PL.ClaimsId IN (SELECT
	item
FROM dbo.SplitString(@ClaimId, ','))
AND PL.OwnerId IN (SELECT
	item
FROM dbo.SplitString(@OwnerId, ','))
),

TransactionDetail
AS (SELECT
	T.*,
	PT.Id AS ProductTypeId,
	UPPER(PT.ProductTypeName) AS ProductTypeName,
	PS.Id AS ProductSubTypeId,
	UPPER(PS.ProductSubTypeName) AS ProductSubTypeName
FROM ProductType PT WITH (NOLOCK)
INNER JOIN ProductSubType PS WITH (NOLOCK)
	ON PT.Id = PS.ProductTypeId
CROSS JOIN [ViewTransaction] T WITH (NOLOCK)
WHERE PT.IsActive = 1
AND PS.IsActive = 1
AND T.IsActive = 1
AND T.CountryId = @CountryId
AND T.VehicleConditionId IN (SELECT
	SV.ID
FROM StaticValue SV WITH (NOLOCK)
WHERE SV.CountryId = @CountryId
AND SV.StaticCategoryId = (SELECT
	SC.Id
FROM StaticCategory SC WITH (NOLOCK)
WHERE SC.Name = 'VehicleCondition'))
AND T.VehicleConditionId IN (SELECT
	item
FROM dbo.SplitString(@VehicleConditions, ','))
AND T.TransactionId IN (SELECT
	item
FROM dbo.SplitString(@TransactionId, ','))
AND T.TransactionTypeId IN (SELECT
	item
FROM dbo.SplitString(@TransactionTypes, ',')))

SELECT
	T.*,
	
	--T.TransactionId,T.GroupId,T.GroupName,T.BranchId,T.BranchName,T.TransactionTypeId,T.TrasactionType,T.TrasactionTypeEnumName,T.TransactionStatusId,T.TransactionStatus,T.TransactionStatusNotes,T.ReferenceNumber,T.FleetNumber,T.TransactionAPIOwner,T.TransactionAPIOwnerUser,T.PreferredCallTime,T.SalesPersonId
	--,T.SalesPerson
	--,T.SalesPersonEmpNo,T.BusinessManagerId,T.BusinessManager,T.IsIncepted,T.InceptDate,T.CreatedBy,T.CreatedByUser,T.CreatedDate,T.ModifiedBy,T.ModifiedByUser,T.ModifiedDate,T.IsActive,T.CountryId,T.IsBlockAutomaticUpdate,T.APICompanyId,T.IsApiUpdate,T.PrimeInterestRate,T.LocalPurchaseNumber,T.TransactionSource,T.SalesCompCode,T.SalesCompName,T.NetTradeInDepositValue,T.IsCashTransaction,T.CashTransaction,T.AppliedForFinance,T.FinanceCompanyId,T.FinanceCompanyName,T.FinanceAccountNumber,T.FinanceStatusId,T.FinanceStatus,T.FinanceStatusNotes,T.InterestRate,T.IsPreArrangedFinance,T.FinanceTermId,T.FinanceTerm,T.InterestRateTypeId,T.InterestRateType,T.PaymentType,T.PaymentTypeName,T.FinanceType,T.FinanceTypeName,T.InvoiceNumber,T.StockNo,T.DocInvoiceDate,T.DocInvoicePaidDate,T.VehicleDeliveryDate,T.OtherFee,T.OtherCost,T.DICAmount,T.DICPercentage,T.DebtorDays,T.DebtorMinutes,T.PayOutRequestDate,T.CallBackCustomerDateTime,T.DeclineDateTime,T.TransactionClientId,T.CustomerType,T.FirstName,T.LastName,T.Mobile,T.EmailAddress,T.CompanyName,T.ComPhyAddEmirate,T.IDNumber,T.ComRegistrationNumber,T.Customer,T.IsDealSighted,T.VehicleId,T.VehicleCode,T.Manufacturer,T.Model,T.VehicleTypeName,T.Trim,T.ModelYear,T.Kilometers,T.FirstRegistrationDate,T.VehicleAge,T.VehicleUseId,T.VehicleUse,T.VehicleConditionId,T.VehicleCondition,T.VehicleConditionEnumName,T.DisburseId,T.DisburseTo,T.PrivateKey,T.VehicleRetailPrice,T.VehicleCostPrice,T.VehicleProfit,T.RevisedVehicleProfit,T.VehicleDiscount,T.VehicleDownPayment,T.BalloonValue,T.BalloonPercentage,T.InsuranceLeadSent,T.InsuranceCompany,T.InsuranceCompanyLeadDateSent,T.BrokerCompany,T.BrokerCompanyLeadDateSent,T.AccessoriesFinacedAmount,T.AccessoriesCashAmount,T.TotalAccessoriesAmount,T.TotalAccessoriesCostAmount,T.VAPSSold,T.CategoriesSold,T.NoOfPackagesSold,T.ProductFinanceAmount,T.ProductCashAmount,T.MonthlyProductAmount,T.TotalProductAmount,T.TotalProductPayoverAmount,T.ItemFinancedAmount,T.TransactionFee,T.ParentTransactionID,T.CopiedFrom,T.FinAppFinanceStatusId,T.FinAppFinanceAccountNumber,T.FinAppBankDealReferenceNumber,T.PrimeFactor,T.TotalAccessoriesRetention,T.TotalFinanceAmount,T.TotalProductRetension,T.TotalVehicleAndProductProfit,T.DICperR1000,T.TotalCashAmount,

	--(select CASE when idnumber is not null then ' ('+idnumber+') ' else '' end from SalesPerson where id= t.SalesPersonId)+ '('+T.BranchName+')' as SalesPersonUniqueId,
	CONCAT(T.ProductTypeName, ' : ', T.ProductSubTypeName) AS ProductType,
	ISNULL(P.ProductRetailPrice,0) AS ProductRetailPrice,
	ISNULL(P.ProductPayOver,0) AS ProductPayOver,
	--ISNULL(P.ProductRetention,0) AS ProductRetention
	CASE WHEN ProductSubTypeName = 'TRANSACTION FEE' THEN ISNULL((ISNULL(ProductRetention,0) - T.TransactionFee), 0) ELSE ISNULL(ProductRetention,0) END AS ProductRetention
FROM TransactionDetail T
LEFT JOIN ProductDetail P
	ON  P.TransactionId = T.TransactionId and P.ProductTypeId = T.ProductTypeId
	and P.ProductSubTypeId = T.ProductSubTypeId	
ORDER BY T.TransactionId, T.ProductTypeName, T.ProductSubTypeName

END