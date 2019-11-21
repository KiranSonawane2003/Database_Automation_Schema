
-- =============================================
-- Author:      Pratap Kuyate
-- Create date: 08-feb-2017
-- Description: This procedure returns the RollOver details for provided Branches and between StartDate and EndDate
-- =============================================


CREATE PROCEDURE [dbo].[spGetRollOverIncome] (
@BranchId NVARCHAR(MAX) ,
@StartDate DATETIME ,
@EndDate DATETIME)

AS
BEGIN

WITH 
CompanyDetail as
(
SELECT
	IC.ID AS CompanyId,
	CM.Id AS CompanyCompanyTypeId,
	IC.CompanyName,
	CT.CompanyTypeName,
	IC.CreatedDate
FROM CompanyCompanyTypeMapping CM WITH(NOLOCK)
INNER JOIN Company IC WITH(NOLOCK)
	ON IC.Id = CM.CompanyId
INNER JOIN CompanyType CT WITH(NOLOCK)
	ON CT.Id = CM.CompanyTypeId)

SELECT
	R.Id,
	R.GroupId,
	UPPER(G.GroupName) AS GroupName,
	R.BranchId,
	UPPER(B.BranchName) AS BranchName,
	R.BranchCode,
	R.BusinessManagerId,
	RTRIM(LTRIM(UPPER(CONCAT(U.FirstName, ' ', U.LastName)))) AS BusinessManager,
	R.TransactionTypeId,
	UPPER(TT.Name) AS TransactionType,
	R.VehicleConditionId,
	UPPER(VC.Name) AS VehicleCondition,
	R.ProductTypeId,
	UPPER(PT.ProductTypeName) AS ProductType,
	R.ProductSubTypeId,
	UPPER(PST.ProductSubTypeName) AS ProductSubType,
	R.AmountExclVat,
	R.VatAmount,
	R.AmountInclVat,
	R.Note,
	R.ReceiptDate,
	C.CompanyName AS FinanceCompany
FROM RolloverDetails R WITH(NOLOCK)
LEFT JOIN [Group] G WITH(NOLOCK)
	ON G.Id = R.GroupId
LEFT JOIN Branch B WITH(NOLOCK)
	ON B.Id = R.BranchId
LEFT JOIN Users U WITH(NOLOCK)
	ON U.Id = R.BusinessManagerId
LEFT JOIN StaticValue TT WITH(NOLOCK)
	ON TT.Id = R.TransactionTypeId
LEFT JOIN StaticValue VC WITH(NOLOCK)
	ON VC.Id = R.VehicleConditionId
LEFT JOIN ProductType PT WITH(NOLOCK)
	ON PT.Id = R.ProductTypeId
LEFT JOIN ProductSubType PST WITH(NOLOCK)
	ON PST.Id = R.ProductSubTypeId
LEFT JOIN CompanyDetail C WITH(NOLOCK)
	ON C.CompanyCompanyTypeId=R.FinanceCompanyId
WHERE R.BranchId IN (SELECT
	item
FROM dbo.SplitString(@BranchId, ','))
AND R.ReceiptDate BETWEEN @StartDate AND @EndDate
AND R.IsActive = 1

END

