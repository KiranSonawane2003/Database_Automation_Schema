
CREATE PROCEDURE [dbo].[spGetPenetrationSummary](@TransactionId NVARCHAR(max),
@CountryID BIGINT,
@AdministratorId NVARCHAR(max),
@ClaimId NVARCHAR(max),
@OwnerId NVARCHAR(max),
@UnderwriterId NVARCHAR(max) )

AS

BEGIN
DECLARE @IsGeneric BIT
SELECT @IsGeneric=ISNULL(IsGeneric,0) FROM Country WITH(NOLOCK) WHERE Id=@CountryID

;
WITH


Products
AS
-- Get All Products for filter criteria Administrator, ClaimId, OwnerId, UnderwriterId
(SELECT
	P.Id,
	P.ProductTypeId,
	P.ProductSubTypeId,
	TP.Id AS TransactionProductId,
	TP.ProductId,
	TP.ProductOptionId as ProductOptionId,
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

TransactionProductDetail
AS 
-- Get All Transaction and Products matching with filter criteria 
(SELECT
	P.Id,
	P.ProductTypeId,
	P.ProductSubTypeId,
	P.TransactionProductId,
	P.ProductId,
	P.ProductOptionId,
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

ProductAndCondition
AS (SELECT
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
FROM ProductType PT WITH(NOLOCK)
INNER JOIN ProductSubType PST WITH(NOLOCK)
	ON PT.Id = PST.ProductTypeId
CROSS JOIN (SELECT
	S.Id,
	S.Name,
	S.EnumName,
	S.SortOrder
FROM StaticValue S WITH(NOLOCK)
INNER JOIN StaticCategory C WITH(NOLOCK)
	ON S.StaticCategoryId = C.Id
	AND C.Name = 'TransactionType'
WHERE S.CountryId = @CountryID
AND S.EnumName <> 'UNSECUREDLENDING'
AND S.IsActive = 1) TT
CROSS JOIN (SELECT
	S.Id,
	S.Name,
	S.EnumName,
	S.SortOrder
FROM StaticValue S WITH(NOLOCK)
INNER JOIN StaticCategory C WITH(NOLOCK)
	ON S.StaticCategoryId = C.Id
	AND C.Name = 'VehicleCondition'
WHERE S.CountryId = @CountryID
AND S.IsActive = 1) VC
WHERE PST.IsActive = 1
AND PT.IsActive = 1),

Result
AS (SELECT
	PC.ProductTypeId,
	PC.ProductTypeName ,
	PC.ProductSubTypeId ,
	PC.ProductSubTypeName,
	PC.TransactionTypeId,
	PC.TransactionType,
	PC.TransactionTypeEnumName,
	PC.TransactionTypeSortOrder,
	PC.VehicleConditionId,
	PC.VehicleCondition,
	PC.VehicleConditionEnumName,	
	CASE
		WHEN PC.TransactionTypeEnumName = 'FLEET' THEN 3
		WHEN PC.TransactionTypeEnumName = 'AFTERMARKET' THEN 4
		ELSE PC.VehicleConditionSortOrder
	END VehicleConditionSortOrder,
	CASE
		WHEN PC.TransactionTypeEnumName = 'FLEET' THEN 'FLEET'
		WHEN PC.TransactionTypeEnumName = 'AFTERMARKET' THEN 'AFTERMARKET'
		ELSE PC.VehicleCondition
	END VehicleConditionName,
	(SELECT
		COUNT(DISTINCT R.TransactionProductId)
	FROM TransactionProductDetail R WITH(NOLOCK)
	WHERE R.ProductTypeId = PC.ProductTypeId
	AND R.ProductSubTypeId = PC.ProductSubTypeId
	AND R.VehicleConditionId = PC.VehicleConditionId
	AND R.TransactionTypeId = PC.TransactionTypeId)
	AS [NoOfProducts],
	(SELECT
		COUNT(DISTINCT R.TransactionId)
	FROM TransactionProductDetail R 
	WHERE 
	--R.ProductTypeId = PC.ProductTypeId AND 
	--R.ProductSubTypeId = PC.ProductSubTypeId AND
	 R.VehicleConditionId = PC.VehicleConditionId AND
	 R.TransactionTypeId = PC.TransactionTypeId) --AND
	 --R.ProductOPtionId IS NOT NULL)
	AS [NoOfVehicles]

FROM ProductAndCondition PC),

FinalResult as (

SELECT
	Result.ProductTypeName,
	Result.ProductSubTypeName,
	Result.TransactionType,
	Result.TransactionTypeSortOrder AS ColumnGroup1,
	CASE
		WHEN Result.TransactionType = 'Aftermarket' THEN 2
		ELSE 1
	END AS ColumnGroup2,
	UPPER(Result.VehicleConditionName + ' VEHICLES') AS VehicleCondition,
	Result.VehicleConditionSortOrder,
	sum(Result.NoOfProducts) as NoOfProducts,
	sum(Result.NoOfVehicles) as NoOfVehicles	
FROM Result
group by Result.ProductTypeName,
Result.ProductSubTypeName,
	Result.TransactionType,
	Result.TransactionTypeSortOrder,
	Result.VehicleConditionName ,
	Result.VehicleConditionSortOrder
	)

select FR.*,
	CASE
		WHEN FR.NoOfVehicles = 0 THEN 0
		ELSE (CAST(FR.NoOfProducts AS DECIMAL(18, 2)) / FR.NoOfVehicles) * 100
	END AS ProductPenetration,
	@IsGeneric AS IsGeneric
	from FinalResult FR	
ORDER BY FR.ProductTypeName, FR.ProductSubTypeName, FR.VehicleConditionSortOrder

END

