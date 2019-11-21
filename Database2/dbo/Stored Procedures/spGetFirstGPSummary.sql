CREATE PROCEDURE [dbo].[spGetFirstGPSummary](@TransactionId NVARCHAR(max), @CountryID BIGINT)

--exec [spGetFirstGPSummary] '1',243


AS



BEGIN

DECLARE @IsGeneric BIT
SELECT @IsGeneric=ISNULL(IsGeneric,0) FROM Country WHERE Id=@CountryID


;
WITH
VehicleCondition
as ( SELECT
	S.Id,
	UPPER(S.Name + ' ' + 'VEHICLES') AS Name,
	S.EnumName,
	S.SortOrder
FROM StaticValue S WITH (NOLOCK)
INNER JOIN StaticCategory C WITH (NOLOCK)
	ON S.StaticCategoryId = C.Id
	AND C.Name = 'VehicleCondition'
WHERE S.CountryId = @CountryID
AND S.IsActive = 1),

TransactionType
AS (SELECT
	S.Id,
	UPPER(S.Name + ' ' + 'VEHICLES') AS Name,
	S.EnumName,
	S.SortOrder
FROM StaticValue S WITH (NOLOCK)
INNER JOIN StaticCategory C WITH (NOLOCK)
	ON S.StaticCategoryId = C.Id
	AND C.Name = 'TransactionType'
WHERE S.CountryId = @CountryID
AND S.IsActive = 1),

CrossJoin
AS (SELECT
	TT.Id AS TransactionTypeId,
	TT.Name AS TransactionType,
	TT.EnumName AS TransactionTypeEnumName,
	TT.SortOrder AS TransactionTypeSortOrder,
	VC.Id AS VehicleConditionId,
	VC.Name AS VehicleCondition,
	CASE
		WHEN TT.EnumName = 'Fleet' THEN TT.Name
		ELSE VC.Name
	END AS 'SummaryName',
	CASE
		WHEN TT.EnumName = 'Fleet' THEN TT.SortOrder
		ELSE VC.SortOrder
	END  AS VehicleConditionSortOrder
FROM VehicleCondition VC
CROSS JOIN TransactionType TT)


SELECT 
TempData.TransactionTypeId,
	TempData.TransactionType,
	TempData.SummaryName,
	SUM(TempData.VehicleSoldCount) AS 'VehicleSoldCount',
	ISNULL(SUM(TempData.VehicleCost), 0) AS 'VehicleCost',
	ISNULL(SUM(TempData.VehicleProfit), 0) AS 'VehicleProfit',
	COUNT(CASE
		WHEN TempData.SightedCount = 1 THEN 1
	END) AS 'SightedCount',
	sum(TempData.VehicleFinanceAmount) AS 'VehicleFinanceAmount',
	--COUNT(CASE
	--	WHEN TempData.VehicleFinanceAmount = 0 THEN 1
	--END) AS 'VehicleFinanceAmount',
	ISNULL(SUM(TempData.FinanceAmount), 0) AS 'FinanceAmount',
	ISNULL(SUM(TempData.TotalProductRetension), 0) AS 'TotalProductRetension',
	CONVERT(DECIMAL(18, 2), (ISNULL(CONVERT(DECIMAL(18, 2), SUM(TempData.TotalProductRetension)) / CONVERT(DECIMAL(18, 2), COUNT(TempData.VehicleCondition)), 0))) AS 'AverageProductRetension',
	ISNULL(SUM(TempData.TotalProductRetension) + SUM(TempData.VehicleRetailPrice - TempData.VehicleCostPrice - TempData.VehicleDiscount), 0) AS 'TotalVehicleProductProfit',
	TempData.TransactionTypeSortOrder,
	TempData.VehicleConditionSortOrder,
	@IsGeneric AS IsGeneric
FROM (

SELECT --T.Transactionid,
	R.TransactionTypeId,
	R.TransactionType,
	R.SummaryName,
	COUNT(T.TransactionId) AS 'VehicleSoldCount',
	ISNULL(SUM(T.VehicleCostPrice), 0) AS 'VehicleCost',
	ISNULL(SUM(T.VehicleProfit), 0) AS 'VehicleProfit',
	COUNT(CASE
		WHEN T.IsDealSighted = 1 THEN 1
	END) AS 'SightedCount',
	COUNT(CASE
		WHEN T.IsCashTransaction = 0 THEN 1
	END) AS 'VehicleFinanceAmount',
	ISNULL(SUM(T.TotalFinanceAmount), 0) AS 'FinanceAmount',
	ISNULL(SUM(T.TotalProductRetension), 0) AS 'TotalProductRetension',
	CONVERT(DECIMAL(18, 2), (ISNULL(CONVERT(DECIMAL(18, 2), SUM(T.TotalProductRetension)) / CONVERT(DECIMAL(18, 2), COUNT(T.VehicleCondition)), 0))) AS 'AverageProductRetension',
	ISNULL(SUM(T.TotalProductRetension) + SUM(T.VehicleRetailPrice - T.VehicleCostPrice - T.VehicleDiscount), 0) AS 'TotalVehicleProductProfit',
	R.TransactionTypeSortOrder,
	R.VehicleConditionSortOrder,
	@IsGeneric AS IsGeneric,
	COUNT(T.VehicleCondition) AS VehicleCondition,
	SUM(T.VehicleRetailPrice ) AS VehicleRetailPrice,
	SUM(T.VehicleCostPrice ) AS VehicleCostPrice,
	SUM(T.VehicleDiscount) AS VehicleDiscount

FROM CrossJoin R
LEFT JOIN ViewTransaction T WITH (NOLOCK)
	ON R.VehicleConditionId = T.VehicleConditionId
	AND R.TransactionTypeId = T.TransactionTypeId
	AND T.countryid = @CountryID
	AND T.TransactionId IN (SELECT
		item
	FROM dbo.SplitString(@TransactionId, ','))
WHERE R.TransactionTypeEnumName != 'Aftermarket'
AND R.TransactionTypeEnumName != 'UNSECUREDLENDING'
GROUP BY	R.TransactionType,
			R.TransactionTypeId,
			R.SummaryName,
			R.TransactionTypeSortOrder,
			R.VehicleConditionSortOrder,
			T.Transactionid
--ORDER BY R.TransactionTypeSortOrder, R.VehicleConditionSortOrder
) AS TempData

GROUP BY	TempData.TransactionType,
			TempData.TransactionTypeId,
			TempData.SummaryName,
			TempData.TransactionTypeSortOrder,
			TempData.VehicleConditionSortOrder
			--TempData.Transactionid
ORDER BY TempData.TransactionTypeSortOrder, TempData.VehicleConditionSortOrder



--SELECT --T.Transactionid,
--	R.TransactionTypeId,
--	R.TransactionType,
--	R.SummaryName,
--	SUM(T.TransactionId) AS 'VehicleSoldCount',
--	ISNULL(SUM(T.VehicleCostPrice), 0) AS 'VehicleCost',
--	ISNULL(SUM(T.VehicleProfit), 0) AS 'VehicleProfit',
--	COUNT(CASE
--		WHEN T.IsDealSighted = 1 THEN 1
--	END) AS 'SightedCount',
--	COUNT(CASE
--		WHEN T.IsCashTransaction = 0 THEN 1
--	END) AS 'VehicleFinanceAmount',
--	ISNULL(SUM(T.TotalFinanceAmount), 0) AS 'FinanceAmount',
--	ISNULL(SUM(T.TotalProductRetension), 0) AS 'TotalProductRetension',
--	CONVERT(DECIMAL(18, 2), (ISNULL(CONVERT(DECIMAL(18, 2), SUM(T.TotalProductRetension)) / CONVERT(DECIMAL(18, 2), COUNT(T.VehicleCondition)), 0))) AS 'AverageProductRetension',
--	ISNULL(SUM(T.TotalProductRetension) + SUM(T.VehicleRetailPrice - T.VehicleCostPrice - T.VehicleDiscount), 0) AS 'TotalVehicleProductProfit',
--	R.TransactionTypeSortOrder,
--	R.VehicleConditionSortOrder,
--	@IsGeneric AS IsGeneric,
--	COUNT(T.VehicleCondition) AS VehicleCondition,
--	SUM(T.VehicleRetailPrice ) AS VehicleRetailPrice,
--	SUM(T.VehicleCostPrice ) AS VehicleCostPrice,
--	SUM(T.VehicleDiscount) AS VehicleDiscount

--FROM CrossJoin R
--LEFT JOIN ViewTransaction T WITH (NOLOCK)
--	ON R.VehicleConditionId = T.VehicleConditionId
--	AND R.TransactionTypeId = T.TransactionTypeId
--	AND T.countryid = @CountryID
--	AND T.TransactionId IN (SELECT
--		item
--	FROM dbo.SplitString(@TransactionId, ','))
--WHERE R.TransactionTypeEnumName != 'Aftermarket'
--AND R.TransactionTypeEnumName != 'UNSECUREDLENDING'
--GROUP BY	R.TransactionType,
--			R.TransactionTypeId,
--			R.SummaryName,
--			R.TransactionTypeSortOrder,
--			R.VehicleConditionSortOrder
--			--T.Transactionid
--ORDER BY R.TransactionTypeSortOrder, R.VehicleConditionSortOrder






END