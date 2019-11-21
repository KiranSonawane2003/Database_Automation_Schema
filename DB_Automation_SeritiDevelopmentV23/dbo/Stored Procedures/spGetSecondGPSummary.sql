CREATE PROCEDURE [dbo].[spGetSecondGPSummary](@TransactionId NVARCHAR(max), 
@CountryID BIGINT,
@StartDate date ,
@EndDate date ,
@BranchId nvarchar(max),
@AdministratorId NVARCHAR(max),
@ClaimId NVARCHAR(max),
@OwnerId NVARCHAR(max),
@UnderwriterId NVARCHAR(max) ) AS

BEGIN

DECLARE @IsGeneric BIT
SELECT
	@IsGeneric = ISNULL(IsGeneric, 0)
FROM Country WITH (NOLOCK)
WHERE Id = @CountryID

;
WITH Rollover
AS (SELECT
	RD.*
FROM RolloverDetails RD WITH (NOLOCK)
WHERE RD.ReceiptDate BETWEEN @StartDate AND @EndDate
AND RD.BranchId IN (SELECT
	item
FROM dbo.SplitString(@BranchId, ','))
AND RD.IsActive = 1),
R
AS
-- Get all ProductType, ProductSubType, TransactionType
(SELECT
	PT.Id AS ProductTypeId,
	UPPER(PT.ProductTypeAbbreviation) AS ProductTypeName,
	PST.Id AS ProductSubTypeId,
	UPPER(PST.ProductSubTypeAbbreviations) AS ProductSubTypeName,
	TT.Id AS TransactionTypeId,
	TT.Name AS TransactionType,
	TT.EnumName AS TransactionTypeEnumName,
	TT.SortOrder AS TransactionTypeSortOrder,
	VC.Id AS VehicleConditionId,
	VC.Name AS VehicleCondition,
	VC.EnumName AS VehicleConditionEnumName,
	VC.SortOrder AS VehicleConditionSortOrder
FROM ProductType PT WITH (NOLOCK)
INNER JOIN ProductSubType PST WITH (NOLOCK)
	ON PT.Id = PST.ProductTypeId
CROSS JOIN (SELECT
	S.Id,
	S.Name,
	S.EnumName,
	S.SortOrder
FROM StaticValue S WITH (NOLOCK)
INNER JOIN StaticCategory C WITH (NOLOCK)
	ON S.StaticCategoryId = C.Id
	AND C.Name = 'TransactionType'
WHERE S.CountryId = @CountryID
--AND S.EnumName <> 'AFTERMARKET'
AND S.EnumName <> 'UNSECUREDLENDING'
AND S.IsActive = 1) TT
CROSS JOIN (SELECT
	S.Id,
	S.Name,
	S.EnumName,
	S.SortOrder
FROM StaticValue S WITH (NOLOCK)
INNER JOIN StaticCategory C WITH (NOLOCK)
	ON S.StaticCategoryId = C.Id
	AND C.Name = 'VehicleCondition'
WHERE S.CountryId = @CountryID
AND S.IsActive = 1) VC
WHERE PST.IsActive = 1
AND PT.IsActive = 1),


Products
AS
-- Get All Products for filter criteria Administrator, ClaimId, OwnerId, UnderwriterId
(SELECT
	P.Id,
	P.ProductTypeId,
	P.ProductSubTypeId,
	TP.Id AS TransactionProductId,
	TP.ProductId,
	ISNULL(TP.RetailPrice, 0) AS RetailPrice,
	ISNULL(TP.Payover, 0) AS Payover,
	TP.TransactionTypeId,
	T.Id AS TransactionId,
	T.VehicleCondition AS VehicleConditionId
FROM [Transaction] T WITH (NOLOCK)
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
WHERE T.CountryId = @CountryID
AND T.Id IN (SELECT
	item
FROM dbo.SplitString(@transactionID, ','))
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
FROM dbo.SplitString(@OwnerId, ','))),

P
AS 
-- Get All Transaction and Products matching with filter criteria 
(SELECT
	P.Id,
	P.ProductTypeId,
	P.ProductSubTypeId,
	P.TransactionProductId,
	P.ProductId,
	ISNULL(P.RetailPrice, 0) AS RetailPrice,
	ISNULL(P.Payover, 0) AS Payover,
	T.TransactionTypeId,
	T.Id AS TransactionId,
	T.VehicleCondition AS VehicleConditionId
FROM [Transaction] T
LEFT JOIN Products P
	ON T.Id = P.TransactionId
WHERE T.CountryId = @CountryID
AND T.Id IN (SELECT
	item
FROM dbo.SplitString(@TransactionId, ','))),

RM
AS (SELECT
	R.ProductTypeName AS ProductType,
	R.ProductSubTypeName AS ProductSubType,
	R.TransactionType,
	--CASE
	--	WHEN R.TransactionTypeEnumName = 'FLEET' THEN 'FLEET VEHICLES'
	--	ELSE UPPER(R.VehicleCondition) + ' ' + 'VEHICLES'
	--END AS VehicleCondition,
		CASE
		WHEN R.TransactionTypeEnumName = 'FLEET' THEN 'FLEET VEHICLES'
		ELSE
		CASE WHEN R.TransactionTypeEnumName = 'AFTERMARKET'  THEN 'AFTERMARKET VEHICLES' ELSE
		 UPPER(R.VehicleCondition) + ' ' + 'VEHICLES' END
	END 
	AS VehicleCondition,
	COUNT(DISTINCT P.TransactionProductId) AS [No],
	COUNT(DISTINCT P.TransactionId) AS [VehicleSold],
	ISNULL(SUM(P.RetailPrice - P.PayOver), 0) AS [Retention],
	0.00 AS [Target],
	ISNULL((SELECT
		SUM(RO.AmountInclVat)
	FROM Rollover RO WITH (NOLOCK)
	WHERE RO.ProductTypeId = P.ProductTypeId
	AND RO.ProductSubTypeId = P.ProductSubTypeId
	AND RO.VehicleConditionId = P.VehicleConditionId
	AND RO.TransactionTypeId = P.TransactionTypeId), 0) AS [RolloverINC],
	ISNULL((SUM(P.RetailPrice - P.PayOver) + ISNULL((SELECT
		SUM(RO.AmountInclVat)
	FROM Rollover RO WITH (NOLOCK)
	WHERE RO.ProductTypeId = P.ProductTypeId
	AND RO.ProductSubTypeId = P.ProductSubTypeId
	AND RO.VehicleConditionId = P.VehicleConditionId
	AND RO.TransactionTypeId = P.TransactionTypeId), 0)), 0) AS [RetRolloverINC],
	R.TransactionTypeSortOrder,
	R.VehicleConditionSortOrder,
	@IsGeneric AS IsGeneric
FROM R
LEFT JOIN P
	ON R.ProductTypeId = P.ProductTypeId
	AND R.ProductSubTypeId = P.ProductSubTypeId
	AND R.TransactionTypeId = P.TransactionTypeId
	AND R.VehicleConditionId = P.VehicleConditionId
GROUP BY	R.ProductTypeId,
			R.ProductTypeName,
			R.ProductSubTypeId,
			R.ProductSubTypeName,
			R.TransactionTypeId,
			R.TransactionType,
			R.TransactionTypeEnumName,
			R.VehicleConditionId,
			R.VehicleCondition,
			R.TransactionTypeSortOrder,
			R.VehicleConditionSortOrder,
			P.ProductTypeId,
			P.ProductSubTypeId,
			P.VehicleConditionId,
			P.TransactionTypeId)

SELECT
	*,
	(SELECT
		CONVERT(DECIMAL(18, 2), COUNT(*))
	FROM RM
	WHERE R.ProductType = ProductType
	AND R.ProductSubType = ProductSubType
	GROUP BY	ProductType,
				ProductSubType)
	AS RecordCount,
	(SELECT
		CASE
			WHEN SUM(No) = 0 THEN 0
			ELSE CONVERT(DECIMAL(18, 2), SUM(Retention) / SUM(No))
		END
	FROM RM
	WHERE R.ProductType = ProductType
	AND R.ProductSubType = ProductSubType
	GROUP BY	ProductType,
				ProductSubType)
	AS APPRet,
	(SELECT
		CASE
			WHEN SUM(No) = 0 THEN 0
			ELSE CONVERT(DECIMAL(18, 2), SUM([RetRolloverINC]) / SUM(No))
		END
	FROM RM
	WHERE R.ProductType = ProductType
	AND R.ProductSubType = ProductSubType
	GROUP BY	ProductType,
				ProductSubType)
	AS APPRetINC,
	(SELECT
		CASE
			WHEN SUM(VehicleSold) = 0 THEN 0
			ELSE CONVERT(DECIMAL(18, 2), SUM(Retention) / SUM(VehicleSold))
		END
	FROM RM
	WHERE R.ProductType = ProductType
	AND R.ProductSubType = ProductSubType
	GROUP BY	ProductType,
				ProductSubType)
	AS APURet,
	(SELECT
		CASE
			WHEN SUM(VehicleSold) = 0 THEN 0
			ELSE CONVERT(DECIMAL(18, 2), SUM([RetRolloverINC]) / SUM(VehicleSold))
		END
	FROM RM
	WHERE R.ProductType = ProductType
	AND R.ProductSubType = ProductSubType
	GROUP BY	ProductType,
				ProductSubType)
	AS APURetINC
FROM RM AS R
ORDER BY R.ProductType, R.ProductSubType, R.TransactionTypeSortOrder, R.VehicleConditionSortOrder


END