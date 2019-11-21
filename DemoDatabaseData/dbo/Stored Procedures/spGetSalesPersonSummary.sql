

CREATE PROCEDURE [dbo].[spGetSalesPersonSummary](

@TransactionId			NVARCHAR(max),
@SalesPersonID		NVARCHAR(max), 
@VehicleConditions		NVARCHAR(max),
@TransactionTypes		NVARCHAR(max),
@CountryID				BIGINT,
@AdministratorId NVARCHAR(max),
@ClaimId NVARCHAR(max),
@OwnerId NVARCHAR(max),
@UnderwriterId NVARCHAR(max))

AS

BEGIN


----------------Input Parameters-------
--DECLARE @CountryID INT=243
--DECLARE @SalesPersonID NVARCHAR(max)
--SET @SalesPersonID = '51,0'
--DECLARE @transactionID NVARCHAR(max)
--SET @transactionID = '10417,10418,10420,10422,10423,10424,10425,10426,10428,10429,10433,10434,10435,10436,10437,10438,10439,10441,10442,10443,10444,10445,10446,10447,10448,10449,10450,10451,10452,10453,10455,10456,10457,10463,10464,10465,10466,10467,10468,10469,10470,10471,10472,10473'
--DECLARE @vehicleConditions NVARCHAR(max)
--DECLARE @TransactionTypes NVARCHAR(max)
--SET @vehicleConditions = '562.563,564'
--SET @TransactionTypes = '572,573,574'
--DECLARE @AdministratorId NVARCHAR(Max)
--DECLARE @UnderwriterId NVARCHAR(Max)
--DECLARE @ClaimId nvarchar(max)
--DECLARE @OwnerId nvarchar(max)
--SET @AdministratorId = '68,82,10097,10103,10141,10143,10157,10166,10168,10174,10188,10212,10220,10236,10275'
--SET @UnderwriterId =  '68,82,10097,10103,10141,10143,10157,10166,10168,10174,10188,10212,10220,10236,10275'
--SET @ClaimId =  '68,82,10097,10103,10141,10143,10157,10166,10168,10174,10188,10212,10220,10236,10275'
--SET @OwnerId = '68,82,10097,10103,10141,10143,10157,10166,10168,10174,10188,10212,10220,10236,10275'

DECLARE @IsGeneric BIT
SELECT
	@IsGeneric = ISNULL(IsGeneric, 0)
FROM Country WITH (NOLOCK)
WHERE Id = @CountryID

---if table already exist then drop 
IF OBJECT_ID('tempdb..#TempVehicleConditions') IS NOT NULL
    BEGIN
DROP TABLE #TempVehicleConditions
END

---if table already exist then drop 
IF OBJECT_ID('tempdb..#TempTransactionType') IS NOT NULL BEGIN
DROP TABLE #TempTransactionType
END

---if table already exist then drop 
IF OBJECT_ID('tempdb..#TempSalesPerson') IS NOT NULL BEGIN
DROP TABLE #TempSalesPerson
END

---if table already exist then drop 
IF OBJECT_ID('tempdb..#TempOutput') IS NOT NULL BEGIN
DROP TABLE #TempOutput
END

---if table already exist then drop 	
IF OBJECT_ID('tempdb..#TempProductCTE') IS NOT NULL BEGIN
DROP TABLE #TempProductCTE
END

-- Create a table to store vehicle conditions
CREATE TABLE #TempVehicleConditions(VehicleConditionID INT,
Name NVARCHAR(MAX),
EnumName NVARCHAR(MAX),
SortOrder INT)

-- Create a table to store transaction Types
CREATE TABLE #TempTransactionType(TransactionTypeID INT,
Name NVARCHAR(MAX),
EnumName NVARCHAR(MAX),
SortOrder INT)

--Create a table to store finance company
CREATE TABLE #TempSalesPerson(SalesPersonID INT,
SalesPersonName NVARCHAR(MAX))

-- Create a table to store final output
CREATE TABLE #TempOutput(ColumnGroupID INT,
SalesPersonID INT,
SalesPerson NVARCHAR(MAX),
VehicleSoldCount INT,
VehicleProfit DECIMAL(18, 2),
RevisedVehicleProfit DECIMAL(18, 2),
SightedCount INT,
VehicleFinanced INT,
FinanceAmount DECIMAL(18, 2),
IntRate DECIMAL(18, 2),
PrimeFactor DECIMAL(18, 2), --pending
FixedCount DECIMAL(18, 2),
LinkedCount DECIMAL(18, 2),
TotalDIC DECIMAL(18, 2),
PerR1000 DECIMAL(18, 2),
DICAPU DECIMAL(18, 2),
SalesSystem NVARCHAR(MAX),
AvgDebtDays INT,
AccessoriesRetension DECIMAL(18, 2),
TransactionFee DECIMAL(18, 2),
-- Product Type and SubType 
LeadSentCount INT,
ProductCount INT,
ProductPenetration DECIMAL(18, 2),
ProductRetension DECIMAL(18, 2),
ProductAPU DECIMAL(18, 2),
ProductAPP DECIMAL(18, 2),
ProductTotalAPU DECIMAL(18, 2),

-- 2nd GP				
SecondGPAPPT DECIMAL(18, 2),
SecondGPTotalRetension DECIMAL(18, 2),

--1st GP columns computed in report it self

--Total Ret
TotalRetensionFrom_Product DECIMAL(18, 2),
TotalRetensionFrom_DIC_OTRCOST_OTRFEES DECIMAL(18, 2),

--%Retension columns computed in report it self

--2nd GP APU
SecondGPAPUFrom_Products DECIMAL(18, 2),
SecondGPAPUFrom_DIC_OTRCOST_OTRFEES DECIMAL(18, 2),
TotalSecondGPAPU DECIMAL(18, 2),

--1st GP APU
FirstGPAPU_Accessories DECIMAL(18, 2),
FirstGPAPU_Vehicles DECIMAL(18, 2),

--Final Total
TotalVehicle_Product_Profit DECIMAL(18, 2),
Total_APU DECIMAL(18, 2),

ProductTypeID INT,
ProductSubTypeID INT,
ProductTypeName NVARCHAR(MAX),
ProductSubTypeName NVARCHAR(MAX),
IsInsuranceType BIT,
DivideByProductCount DECIMAL(18, 2))

-- Temporary table to store Product Data
CREATE TABLE #TempProductCTE(ProductID INT,
Producttypeid INT,
Productsubtypeid INT,
SalesPersonID INT,
ProductCount INT,
Retension DECIMAL(18, 2),
RetailPrice DECIMAL(18, 2),
ProductTypeEnumName NVARCHAR(MAX),
IsInsuranceType BIT)

--Insert Vehicle Conditions 
INSERT INTO #TempVehicleConditions
	SELECT
		S.Id
	   ,S.Name
	   ,S.EnumName
	   ,S.SortOrder
	FROM StaticValue S WITH (NOLOCK)
	INNER JOIN StaticCategory C WITH (NOLOCK)
		ON S.StaticCategoryId = C.Id
			AND LOWER(C.Name) = 'vehiclecondition'
	WHERE S.CountryId = @CountryID
	AND S.IsActive = 1
	AND S.Id IN (SELECT
			item
		FROM dbo.SplitString(@vehicleConditions, ','))
		

--Insert Transaction Types
INSERT INTO #TempTransactionType
	SELECT
		S.Id
	   ,S.Name
	   ,S.EnumName
	   ,S.SortOrder
	FROM StaticValue S WITH (NOLOCK)
	INNER JOIN StaticCategory C WITH (NOLOCK)
		ON S.StaticCategoryId = C.Id
			AND LOWER(C.Name) = 'transactiontype'
	WHERE S.CountryId = @CountryID
	AND S.IsActive = 1
	AND S.Id IN (SELECT
			item
		FROM dbo.SplitString(@TransactionTypes, ','))--
		--and s.id in (572,573,574)


INSERT INTO #TempSalesPerson
	SELECT
		S.ID AS SalesPersonID
	   ,UPPER(S.SalesPersonName + '('+S.IdNumber +')('+  (select  BranchName from Branch where id =S.BranchId)+')') as SalesPersonName
	FROM SalesPerson S WITH (NOLOCK)
	INNER JOIN (SELECT
			item
		FROM dbo.SplitString(@SalesPersonID, ',') WHERE item <> '') b
		ON b.Item = S.ID


DECLARE @Unassigned NVARCHAR(max) = (SELECT TOP 1 item FROM dbo.SplitString(@SalesPersonID, ',') Where item ='0')

IF(@Unassigned = '0')
INSERT INTO #TempSalesPerson VALUES (NULL,  'UNASSIGNED')



--select sp.* from ViewTransaction t
--INNER JOIN #TempSalesPerson sp on t.SalesPersonId = sp.SalesPersonID  or t.SalesPersonId is null and sp.SalesPersonID is null

--select * from #TempSalesPerson
;
WITH R
AS
(SELECT
		1 AS ColumnGroupID
	   ,T.SalesPersonID
	   ,B.SalesPersonName
	   ,COUNT(T.TransactionId) AS 'VehicleSoldCount'
	   ,ISNULL(SUM(T.VehicleProfit), 0) AS 'VehicleProfit'
	   ,ISNULL(SUM(T.RevisedVehicleProfit), 0) AS 'RevisedVehicleProfit'
	   ,COUNT(CASE
			WHEN T.IsDealSighted = 1 THEN 1
		END) AS 'SightedCount'
	   ,COUNT(CASE
			WHEN T.IsCashTransaction = 0 THEN 1
		END) AS 'VehicleFinanced'
	   ,ISNULL(SUM(T.TotalFinanceAmount), 0) AS 'FinanceAmount'
	   ,CASE
			WHEN COUNT(CASE
					WHEN T.IsCashTransaction = 0 THEN 1
				END) = 0.00 THEN 0
			ELSE CONVERT(DECIMAL(18, 2), (ISNULL(SUM(T.InterestRate), 0))) / CONVERT(DECIMAL(18, 2), COUNT(CASE
					WHEN T.IsCashTransaction = 0 THEN 1
				END))
		END AS 'IntRate'
	   ,CASE
			WHEN COUNT(CASE
					WHEN T.IsCashTransaction = 0 THEN 1
				END) = 0.00 THEN 0
			ELSE CONVERT(DECIMAL(18, 2), (ISNULL(SUM(T.PrimeFactor), 0))) / CONVERT(DECIMAL(18, 2), COUNT(CASE
					WHEN T.IsCashTransaction = 0 THEN 1
				END))
		END AS 'PrimeFactor'
	   ,CONVERT(DECIMAL(18, 2), COUNT(CASE
			WHEN T.InterestRateType = 'FIXED' THEN 1
		END)) AS 'FixedCount'
	   ,CONVERT(DECIMAL(18, 2), COUNT(CASE
			WHEN T.InterestRateType = 'LINKED' THEN 1
		END)) AS 'LinkedCount'
	   ,ISNULL(SUM(T.DICAMOUNT), 0) AS 'TotalDIC'
	   ,CONVERT(DECIMAL(18, 2), CASE
			WHEN ISNULL(SUM(T.TotalFinanceAmount), 0) = 0 THEN 0
			ELSE (ISNULL(SUM(T.DICAMOUNT), 0)) / CONVERT(DECIMAL(18, 2), ISNULL(SUM(T.TotalFinanceAmount), 0))
		END) * 1000 AS 'PerR1000'
	   ,CONVERT(DECIMAL(18, 2), CASE
			WHEN ISNULL(COUNT(T.TransactionId), 0) = 0 THEN 0
			ELSE (ISNULL(SUM(T.DICAMOUNT), 0)) / CONVERT(DECIMAL(18, 2), COUNT(T.TransactionId))
		END) AS 'DICAPU'
	   ,'' AS SalesSystem
	   ,CASE
			WHEN COUNT(T.TransactionId) > 0 THEN ISNULL(SUM(DebtorMinutes), 0) / COUNT(T.TransactionId)
			ELSE 0
		END AS AvgDebtDays
	   ,(ISNULL(SUM(T.TotalAccessoriesAmount), 0) - ISNULL(SUM(T.TotalAccessoriesCostAmount), 0)) AS 'AccessoriesRetension'
	   ,(ISNULL(SUM(T.TransactionFee), 0)) AS 'TransactionFee'
	   ,0 AS LeadSentCount
	   ,0 AS ProductCount
	   ,0 AS ProductPenetration
	   ,0 AS ProductRetension
	   ,0 AS ProductAPU
	   ,0 AS ProductAPP
	   ,0 AS ProductTotalAPU
	   ,0 AS SecondGPAPPT
	   ,0 AS SecondGPTotalRetension
	   ,0 AS TotalRetensionFrom_Product
	   ,ISNULL(SUM(T.DICAMOUNT), 0) + ISNULL(SUM(T.OtherCost), 0) + ISNULL(SUM(T.OtherFee), 0) AS TotalRetensionFrom_DIC_OTRCOST_OTRFEES
	   ,0 AS SecondGPAPUFrom_Products
	   ,0 AS SecondGPAPUFrom_DIC_OTRCOST_OTRFEES
	   ,0 AS TotalSecondGPAPU
	   ,0 AS FirstGPAPU_Accessories
	   ,0 AS FirstGPAPU_Vehicles
	   ,0 AS TotalVehicle_Product_Profit
	   ,0 AS Total_APU
	   ,0 AS DivideByProductCount
	   ,0 AS IsInsuranceType

	FROM ViewTransaction AS T WITH (NOLOCK)
	INNER JOIN #TempSalesPerson B
		ON ISNULL(B.SalesPersonID,0) = ISNULL(T.SalesPersonId,0)
	INNER JOIN #TempTransactionType tt
		ON tt.TransactionTypeId = t.TransactionTypeId
	WHERE T.CountryId = @CountryID
	AND T.TransactionId IN (SELECT
			item
		FROM dbo.SplitString(@TransactionId, ','))
	----AND T.IsCashTransaction = 0
	----AND T.SalesPersonID IS NOT NULL
	AND T.VehicleConditionId IS NOT NULL
	AND T.VehicleConditionId IN (SELECT
			item
		FROM dbo.SplitString(@vehicleConditions, ','))
	GROUP BY B.SalesPersonName
			,T.SalesPersonID),
S
AS
(SELECT
		p.id AS ProductTypeID
	   ,ps.id AS ProductSubtypeID
	   ,UPPER(p.ProductTypeAbbreviation) AS ProductTypeName
	   ,UPPER(ps.ProductSubTypeAbbreviations) AS ProductSubTypeName
	   ,p.IsInsuranceType
	FROM ProductType p WITH (NOLOCK)
	INNER JOIN ProductSubType ps WITH (NOLOCK)
		ON p.id = ps.ProductTypeId)

--select * from R

INSERT INTO #TempOutput
	SELECT
		R.ColumnGroupID
	   ,R.SalesPersonID
	   ,R.SalesPersonName
	   ,R.VehicleSoldCount
	   ,R.VehicleProfit
	   ,R.RevisedVehicleProfit
	   ,R.SightedCount
	   ,R.VehicleFinanced
	   ,R.FinanceAmount
	   ,R.IntRate
	   ,R.PrimeFactor
	   ,R.FixedCount
	   ,R.LinkedCount
	   ,R.TotalDIC
	   ,R.PerR1000
	   ,R.DICAPU
	   ,R.SalesSystem
	   ,R.AvgDebtDays
	   ,R.AccessoriesRetension
	   ,R.TransactionFee
	   ,R.LeadSentCount
	   ,R.ProductCount
	   ,R.ProductPenetration
	   ,R.ProductRetension
	   ,R.ProductAPU
	   ,R.ProductAPP
	   ,R.ProductTotalAPU
	   ,R.SecondGPAPPT
	   ,R.SecondGPTotalRetension
	   ,R.TotalRetensionFrom_Product
	   ,R.TotalRetensionFrom_DIC_OTRCOST_OTRFEES
	   ,R.SecondGPAPUFrom_Products
	   ,R.SecondGPAPUFrom_DIC_OTRCOST_OTRFEES
	   ,R.TotalSecondGPAPU
	   ,R.FirstGPAPU_Accessories
	   ,R.FirstGPAPU_Vehicles
	   ,R.TotalVehicle_Product_Profit
	   ,R.Total_APU
	   ,S.ProductTypeID
	   ,S.ProductSubTypeID
	   ,S.ProductTypeName
	   ,S.ProductSubTypeName
	   ,S.IsInsuranceType
	   ,(SELECT
				CONVERT(DECIMAL(18, 2), COUNT(*))
			FROM ProductType p WITH (NOLOCK)
			INNER JOIN ProductSubType ps WITH (NOLOCK)
				ON p.id = ps.ProductTypeId)
		AS DivideByProductCount
	FROM R
		,S

--Update leadcount from Insurance History Table
UPDATE T
SET T.LeadSentCount = M.LeadSentCount
FROM #TempOutput T
INNER JOIN (SELECT
		p.id AS ProductID
	   ,ps.id AS ProductSubtypeID
	   ,p.ProductTypeName
	   ,ps.ProductSubTypeName
	   ,COUNT(insurance.id) AS LeadSentCount
	   ,insurance.SalesPersonID
	FROM ProductType p WITH (NOLOCK)
	INNER JOIN ProductSubType ps WITH (NOLOCK)
		ON p.id = ps.ProductTypeId
	LEFT JOIN (SELECT
			ins.ProductTypeId
		   ,ins.ProductSubTypeId
		   ,ins.id
		   ,t.SalesPersonID
		   ,t.IsCashTransaction
		   ,t.TransactionTypeId
		FROM [Transaction] t WITH (NOLOCK)
		INNER JOIN TransactionInsuranceApplication TI WITH (NOLOCK)
			ON TI.TransactionId = t.Id
			AND t.Id IN (SELECT
					item
				FROM dbo.SplitString(@TransactionId, ','))
		INNER JOIN InsuranceApplicationHistory ins WITH (NOLOCK)
			ON ins.InsuranceApplicationId = TI.Id
			AND t.countryID = @CountryID) AS insurance
		ON insurance.ProductTypeId = p.id
		AND insurance.productSubtypeid = ps.id
	WHERE --insurance.SalesPersonId IS NOT NULL AND 
	--AND insurance.IsCashTransaction = 0
	
	insurance.TransactionTypeId IN (SELECT
			item
		FROM dbo.SplitString(@TransactionTypes, ','))
	GROUP BY p.producttypeName
			,ps.productsubtypename
			,p.id
			,ps.Id
			,insurance.SalesPersonID) AS M
	ON ISNULL(T.SalesPersonID,0) = ISNULL(M.SalesPersonID,0)
	AND T.ProductTypeID = M.ProductID
	AND T.ProductSubTypeID = M.ProductSubtypeID

--Insert Transaction Product Data compute the restesion and retail price
INSERT INTO #TempProductCTE
	SELECT
		M.productID
	   ,M.producttypeid
	   ,M.productsubtypeid
	   ,M.SalesPersonID
	   ,SUM(M.productCount) AS productCount
	   ,SUM(M.retension) AS retension
	   ,SUM(M.retailPrice) AS retailPrice
	   ,M.ProductTypeEnumName
	   ,M.IsInsuranceType
	FROM (SELECT
			0 productID
		   ,pt.Id AS producttypeid
		   ,ps.id AS productsubtypeid
		   ,t.SalesPersonID
		   ,COUNT(p.id) AS productCount
		   ,ISNULL(SUM(tp.RetailPrice), 0) - ISNULL(SUM(tp.payover), 0) AS retension
			,ISNULL(SUM(tp.RetailPrice), 0) AS retailPrice
		   ,'' AS ProductTypeEnumName
		   ,pt.IsInsuranceType
		FROM [Transaction] t WITH (NOLOCK)
		INNER JOIN TransactionProduct TP
			ON TP.TransactionId = t.Id
			AND tp.TransactionTypeId = t.TransactionTypeId
			AND t.Id IN (SELECT
					item
				FROM dbo.SplitString(@TransactionId, ','))
		INNER JOIN Product P
			ON p.id = tp.ProductId
		INNER JOIN ProductLine PL
			ON TP.ProductId = PL.ProductId AND PL.IsActive=1 --added by ganesh dated 07/02/2019
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
		INNER JOIN ProductType pt
			ON pt.Id = p.ProductTypeId
		INNER JOIN ProductSubType ps
			ON ps.id = p.ProductSubTypeId
			AND t.CountryId = @CountryID --and 
		WHERE tp.IsActive = 1
		--AND t.IsCashTransaction = 0
		--AND t.SalesPersonID IS NOT NULL
		AND tp.ProductOptionId IS NOT NULL
		AND t.TransactionTypeId IN (SELECT
				item
			FROM dbo.SplitString(@TransactionTypes, ','))
		AND t.VehicleCondition IN (SELECT
				item
			FROM dbo.SplitString(@VehicleConditions, ','))
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
		GROUP BY tp.productID
				,pt.Id
				,ps.Id
				,pt.IsInsuranceType
				,t.SalesPersonID
				,ProductTypeEnumName) M
	GROUP BY M.productID
			,M.producttypeid
			,M.productsubtypeid
			,M.IsInsuranceType
			,M.SalesPersonID
			,M.ProductTypeEnumName

--Update product type and sub types fields
UPDATE T
SET T.ProductCount = M.ProductCount
   ,T.ProductPenetration =
	CASE
		WHEN T.VehicleSoldCount = 0 THEN 0
		ELSE ((CONVERT(DECIMAL(18, 2), M.ProductCount) / CONVERT(DECIMAL(18, 2), T.VehicleSoldCount)) * 100)
	END
   ,T.ProductRetension = M.retension
   ,T.ProductAPP =
	CASE
		WHEN M.productCount = 0 THEN 0
		ELSE (M.retension / M.productCount)
	END
 --  ,T.ProductAPU =
	--CASE
	--	WHEN T.VehicleSoldCount = 0 THEN 0
	--	ELSE (M.retension / CONVERT(DECIMAL(18, 2), T.VehicleSoldCount))
	--END
   ,T.IsInsuranceType = M.IsInsuranceType
FROM #TempOutput T
INNER JOIN #TempProductCTE AS M
	ON ISNULL(T.SalesPersonID,0) = ISNULL(M.SalesPersonID,0)
	AND T.ProductTypeID = M.producttypeid
	AND T.ProductSubTypeID = M.productsubtypeid


UPDATE T
SET T.ProductRetension = ISNULL(T.ProductRetension, 0) - ISNULL(T.TransactionFee, 0)
FROM #TempOutput T
WHERE ProductSubTypeName = 'TRANSACTION FEE'

--UPDATE T
--SET T.ProductRetension =
--CASE
--	WHEN (SELECT
--				ProductCount
--			FROM #TempOutput
--			WHERE ProductSubTypeName = 'Transaction FEE'
--			AND SalesPersonID = T.SalesPersonID)
--		= 0 THEN ISNULL(T.ProductRetension, 0) - ISNULL(T.TransactionFee, 0)
--END
--FROM #TempOutput T
--WHERE ProductSubTypeName = 'Transaction FEE'

UPDATE T SET ProductAPU = 
CASE WHEN  T.VehicleSoldCount = 0 THEN 0
ELSE (T.ProductRetension / CONVERT(DECIMAL(18, 2), T.VehicleSoldCount)) END
FROM #TempOutput T


--Update Total Income From VAPS AND INS
UPDATE T
SET T.TotalRetensionFrom_Product = M.retension
FROM #TempOutput T
INNER JOIN (SELECT
		M.SalesPersonID
	   ,SUM(M.ProductRetension) AS retension
	FROM #TempOutput M
	GROUP BY M.SalesPersonID) AS M
	ON ISNULL(T.SalesPersonID,0) = ISNULL(M.SalesPersonID,0)

--Update Product Total APU/ Second GP Total Retension
UPDATE T
SET SecondGPTotalRetension = P.ProductRetension
FROM #TempOutput T
INNER JOIN (SELECT
		ProductTypeID
	   ,ProductSubTypeID
	   ,SalesPersonID
	   ,SUM(ProductAPU) AS ProductAPU
	   ,SUM(ProductRetension) AS ProductRetension
	FROM #TempOutput
	GROUP BY ProductTypeID
			,ProductSubTypeID
			,SalesPersonID) P
	ON P.ProductTypeID = T.ProductTypeID
	AND P.ProductSubTypeID = T.ProductSubTypeID
	AND ISNULL(P.SalesPersonID,0) = ISNULL(T.SalesPersonID,0)

UPDATE T
SET SecondGPTotalRetension = M.SecondGPTotalRetension
FROM #TempOutput T
INNER JOIN (SELECT
		SalesPersonID
	   ,SUM(SecondGPTotalRetension) AS SecondGPTotalRetension
	FROM #TempOutput
	GROUP BY SalesPersonID) M
	ON ISNULL(M.SalesPersonID,0) = ISNULL(T.SalesPersonID,0)

/*update TotalVehicle_Product_Profit
		 SecondGPAPUFrom_DIC_OTRCOST_OTRFEES
		 TotalSecondGPAPU	
		 FirstGPAPU_Accessories
		 FirstGPAPU_Vehicles
		 TotalVehicle_Product_Profit
		 Total_APU
*/
UPDATE #TempOutput
SET TotalVehicle_Product_Profit = ISNULL(ISNULL(TotalRetensionFrom_Product, 0) + ISNULL(VehicleProfit, 0), 0)
   ,TotalSecondGPAPU =
	CASE
		WHEN VehicleSoldCount = 0 THEN 0
		ELSE (TotalRetensionFrom_Product / CONVERT(DECIMAL(18, 2), VehicleSoldCount))
	END +
	CASE
		WHEN VehicleSoldCount = 0 THEN 0
		ELSE (TotalRetensionFrom_DIC_OTRCOST_OTRFEES / CONVERT(DECIMAL(18, 2), VehicleSoldCount))
	END
   ,FirstGPAPU_Accessories =
	CASE
		WHEN VehicleSoldCount = 0 THEN 0
		ELSE (AccessoriesRetension / CONVERT(DECIMAL(18, 2), VehicleSoldCount))
	END
   ,FirstGPAPU_Vehicles =
	CASE
		WHEN VehicleSoldCount = 0 THEN 0
		ELSE (VehicleProfit / CONVERT(DECIMAL(18, 2), VehicleSoldCount))
	END
   ,Total_APU =
	CASE
		WHEN VehicleSoldCount = 0 THEN 0
		ELSE (ISNULL(ISNULL(TotalRetensionFrom_Product, 0) + ISNULL(VehicleProfit, 0), 0) / CONVERT(DECIMAL(18, 2), VehicleSoldCount))
	END
   ,SecondGPAPUFrom_Products =
	CASE
		WHEN VehicleSoldCount = 0 THEN 0
		ELSE TotalRetensionFrom_Product / CONVERT(DECIMAL(18, 2), VehicleSoldCount)
	END
   ,SecondGPAPUFrom_DIC_OTRCOST_OTRFEES =
	CASE
		WHEN VehicleSoldCount = 0 THEN 0
		ELSE (TotalRetensionFrom_DIC_OTRCOST_OTRFEES / CONVERT(DECIMAL(18, 2), VehicleSoldCount))
	END


---update Second GP APPT
UPDATE T
SET SecondGPAPPT =
CASE
	WHEN T.VehicleSoldCount = 0 THEN 0
	ELSE CONVERT(DECIMAL(18, 2), p.ProductCount) / CONVERT(DECIMAL(18, 2), T.VehicleSoldCount)
END
FROM #TempOutput T
INNER JOIN (SELECT
		SalesPersonID
	   ,SUM(ProductCount) AS ProductCount
	FROM #TempOutput
	GROUP BY SalesPersonID) P
	ON ISNULL(P.SalesPersonID,0) = ISNULL(T.SalesPersonID,0)

;
WITH T
AS
(
	-- Select final output 
	SELECT
		T.ColumnGroupID
	   ,T.SalesPersonID
	   ,T.SalesPerson
	   ,ISNULL(T.VehicleSoldCount, 0) AS VehicleSoldCount
	   ,ISNULL(T.VehicleProfit, 0) AS VehicleProfit
	   ,ISNULL(T.RevisedVehicleProfit, 0) AS RevisedVehicleProfit
	   ,ISNULL(T.VehicleFinanced, 0) AS VehicleFinanced
	   ,ISNULL(T.FinanceAmount, 0) AS FinanceAmount
	   ,ISNULL(T.IntRate, 0) AS IntRate
	   ,ISNULL(T.PrimeFactor, 0) AS PrimeFactor
	   ,ISNULL(T.FixedCount, 0) AS FixedCount
	   ,ISNULL(T.LinkedCount,0) AS LinkedCount
	 --  ,CASE
		--	WHEN ISNULL(T.VehicleSoldCount, 0) = 0 THEN 0.00
		--	ELSE CONVERT(DECIMAL(18, 2), ISNULL(T.FixedCount, 0) / CONVERT(DECIMAL(18, 2), T.VehicleSoldCount) * 100)
		--END AS FixedCount
	 --  ,CASE
		--	WHEN ISNULL(T.VehicleSoldCount, 0) = 0 THEN 0.00
		--	ELSE CONVERT(DECIMAL(18, 2), ISNULL(T.LinkedCount, 0) / CONVERT(DECIMAL(18, 2), T.VehicleSoldCount) * 100)
		--END AS LinkedCount
	   ,ISNULL(T.TotalDIC, 0) AS TotalDIC
	   ,CASE
			WHEN ISNULL(T.FinanceAmount, 0) = 0 THEN 0.00
			ELSE CONVERT(DECIMAL(18, 2), (ISNULL(T.TotalDIC, 0) / ISNULL(T.FinanceAmount, 0)) * 1000)
		END AS PerR1000
	   ,ISNULL(T.DICAPU, 0) AS DICAPU
	   ,ISNULL(T.SalesSystem, '') AS SalesSystem
	   ,ISNULL(T.AvgDebtDays, 0) AS AvgDebtDays
	   ,ISNULL(T.AccessoriesRetension, 0) AS AccessoriesRetension
	   ,ISNULL(T.TransactionFee, 0) AS TransactionFee
	   ,ISNULL(T.LeadSentCount, 0) AS LeadSentCount
	   ,ISNULL(T.ProductCount, 0) AS ProductCount
	   ,ISNULL(T.ProductPenetration, 0) AS ProductPenetration
	   ,ISNULL(T.ProductRetension, 0) AS ProductRetension
	   ,ISNULL(T.ProductAPP, 0) AS ProductAPP
	   ,ISNULL(T.ProductAPU, 0) AS ProductAPU
	   ,CASE
			WHEN ISNULL(T.Total_APU, 0) = 0 THEN 0
			ELSE CONVERT(DECIMAL(18, 2), ((ProductAPU / Total_APU) * 100))
		END AS ProductTotalAPU
	   ,ISNULL(T.SecondGPAPPT, 0) AS SecondGPAPPT
	   ,CASE
			WHEN ISNULL(T.VehicleSoldCount, 0) = 0 THEN 0.00
			ELSE CONVERT(DECIMAL(18, 2), ISNULL(T.SecondGPTotalRetension, 0) / CONVERT(DECIMAL(18, 2), T.VehicleSoldCount))
		END AS SecondGPTotalRetension
	   ,ISNULL(T.TotalRetensionFrom_Product, 0) AS TotalRetensionFrom_Product
	   ,ISNULL(T.TotalRetensionFrom_DIC_OTRCOST_OTRFEES, 0) AS TotalRetensionFrom_DIC_OTRCOST_OTRFEES
	   ,ISNULL(T.SecondGPAPUFrom_Products, 0) AS SecondGPAPUFrom_Products
	   ,ISNULL(T.SecondGPAPUFrom_DIC_OTRCOST_OTRFEES, 0) AS SecondGPAPUFrom_DIC_OTRCOST_OTRFEES
	   ,ISNULL(T.SecondGPAPUFrom_Products, 0) + ISNULL(T.SecondGPAPUFrom_DIC_OTRCOST_OTRFEES, 0) AS TotalSecondGPAPU
	   ,ISNULL(T.FirstGPAPU_Accessories, 0) AS FirstGPAPU_Accessories
	   ,ISNULL(T.FirstGPAPU_Vehicles, 0) AS FirstGPAPU_Vehicles
	   ,ISNULL(T.TotalVehicle_Product_Profit, 0) AS TotalVehicle_Product_Profit
	   ,ISNULL(T.Total_APU, 0) AS Total_APU
	   ,ISNULL(T.ProductTypeID, 0) AS ProductTypeID
	   ,ISNULL(T.ProductSubTypeID, 0) AS ProductSubTypeID
	   ,ISNULL(T.ProductTypeName, '') AS ProductTypeName
	   ,ISNULL(T.ProductSubTypeName, '') AS ProductSubTypeName
	   ,T.IsInsuranceType
	   ,ISNULL(T.DivideByProductCount, 0) AS DivideByProductCount
	FROM #TempOutput T UNION ALL SELECT
		1 AS ColumnGroupID
	   ,M.SalesPersonID
	   ,M.SalesPersonName
	   ,0 AS VehicleSoldCount
	   ,0 AS VehicleProfit
	   ,0 AS RevisedVehicleProfit
	   ,0 AS VehicleFinanced
	   ,0 AS FinanceAmount
	   ,0 AS IntRate
	   ,0 AS PrimeFactor
	   ,0 AS FixedCount
	   ,0 AS LinkedCount
	   ,0 AS TotalDIC
	   ,0 AS PerR1000
	   ,0 AS DICAPU
	   ,'' AS SalesSystem
	   ,0 AS AvgDebtDays
	   ,0 AS AccessoriesRetension
	   ,0 AS TransactionFee
	   ,0 AS LeadSentCount
	   ,0 AS ProductCount
	   ,0 AS ProductPenetration
	   ,0 AS ProductRetension
	   ,0 AS ProductAPP
	   ,0 AS ProductAPU
	   ,0 AS ProductTotalAPU
	   ,0 AS SecondGPAPPT
	   ,0 AS SecondGPTotalRetension
	   ,0 AS TotalRetensionFrom_Product
	   ,0 AS TotalRetensionFrom_DIC_OTRCOST_OTRFEES
	   ,0 AS SecondGPAPUFrom_Products
	   ,0 AS SecondGPAPUFrom_DIC_OTRCOST_OTRFEES
	   ,0 AS TotalSecondGPAPU
	   ,0 AS FirstGPAPU_Accessories
	   ,0 AS FirstGPAPU_Vehicles
	   ,0 AS TotalVehicle_Product_Profit
	   ,0 AS Total_APU
	   ,0 AS ProductTypeID
	   ,0 AS ProductSubTypeID
	   ,N.ProductTypeName COLLATE Latin1_General_CI_AI AS ProductTypeName
	   ,N.ProductSubTypeName COLLATE Latin1_General_CI_AI AS ProductSubTypeName
	   ,N.IsInsuranceType
	   ,(SELECT
				CONVERT(DECIMAL(18, 2), COUNT(*))
			FROM ProductType p WITH (NOLOCK)
			INNER JOIN ProductSubType ps WITH (NOLOCK)
				ON p.id = ps.ProductTypeId)
		AS DivideByProductCount
	FROM (SELECT *
		FROM #TempSalesPerson
		WHERE IsNULL(SalesPersonID,0) NOT IN (SELECT
			  IsNULL(SalesPersonID,0)
			FROM #TempOutput)) AS M
	CROSS JOIN (SELECT
			p.id AS ProductTypeID
		   ,ps.id AS ProductSubtypeID
		   ,p.ProductTypeAbbreviation AS ProductTypeName
		   ,ps.ProductSubTypeAbbreviations AS ProductSubTypeName
		   ,p.IsInsuranceType
		FROM ProductType p WITH (NOLOCK)
		INNER JOIN ProductSubType ps WITH (NOLOCK)
			ON p.id = ps.ProductTypeId) AS N)

SELECT
	T.ColumnGroupID
   ,T.SalesPersonID
   ,T.SalesPerson
   ,T.VehicleSoldCount
   ,T.VehicleProfit
   ,T.RevisedVehicleProfit
   ,T.VehicleFinanced
   ,T.FinanceAmount
   ,T.IntRate
   ,T.PrimeFactor
   ,T.FixedCount
   ,T.LinkedCount
   ,T.TotalDIC
   ,T.PerR1000
   ,T.DICAPU
   ,T.SalesSystem
   ,CAST(T.AvgDebtDays / 1440 AS VARCHAR) + ':' +
	RIGHT('0' + CAST((T.AvgDebtDays / 60) % 24 AS VARCHAR), 2) + ':' +
	RIGHT('0' + CAST(T.AvgDebtDays % 60 AS VARCHAR), 2) AS AvgDebtDays
   ,T.AvgDebtDays AS AvgDebtMins
   ,T.AccessoriesRetension
   ,T.LeadSentCount
   ,T.ProductCount
   ,T.ProductPenetration
   ,T.ProductRetension
   ,T.ProductAPP
   ,T.ProductAPU
   ,T.ProductTotalAPU
   ,T.SecondGPAPPT
   ,T.SecondGPTotalRetension
   ,T.TotalRetensionFrom_Product
   ,T.TotalRetensionFrom_DIC_OTRCOST_OTRFEES
   ,T.SecondGPAPUFrom_Products
   ,T.SecondGPAPUFrom_DIC_OTRCOST_OTRFEES
   ,T.TotalSecondGPAPU
   ,T.FirstGPAPU_Accessories
   ,T.FirstGPAPU_Vehicles
   ,T.TotalVehicle_Product_Profit
   ,T.Total_APU
   ,T.ProductTypeID
   ,T.ProductSubTypeID
   ,T.ProductTypeName
   ,T.ProductSubTypeName
   ,T.IsInsuranceType
   ,T.DivideByProductCount
   ,@IsGeneric AS IsGeneric
FROM T
ORDER BY  
case when SalesPersonID is null then 1 else 0 end, SalesPersonID,
T.ProductTypeName, T.ProductSubTypeName 

END

