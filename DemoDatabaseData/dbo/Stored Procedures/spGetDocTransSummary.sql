
CREATE PROCEDURE [dbo].[spGetDocTransSummary]
(
	@TransactionId			NVARCHAR(max),	
	@CountryID				BIGINT,
	@AdministratorId		NVARCHAR(max),
	@ClaimId				NVARCHAR(max),
	@OwnerId				NVARCHAR(max),
	@UnderwriterId			NVARCHAR(max)
)

AS
Begin

------------Input Parameters-------
--DECLARE @CountryID INT=243
--DECLARE @transactionID NVARCHAR(max)
--SET @transactionID = '131425,131423'
--DECLARE @AdministratorId NVARCHAR(Max)
--DECLARE @UnderwriterId NVARCHAR(Max)
--DECLARE @ClaimId nvarchar(max)
--DECLARE @OwnerId nvarchar(max)
--SET @AdministratorId = '68,82,10097,10103,10141,10143,10157,10166,10168,10174,10188,10212,10216,10217'
--SET	@UnderwriterId ='68,82,10097,10103,10141,10143,10157,10166,10168,10174,10188,10212,10216,10217'
--SET	@ClaimId ='68,82,10097,10103,10141,10143,10157,10166,10168,10174,10188,10212,10216,10217'
--SET	@OwnerId ='68,82,10097,10103,10141,10143,10157,10166,10168,10174,10188,10212,10216,10217'

;
WITH ProductDetail AS
(
SELECT
	TP.TransactionId,
	TP.TransactionTypeId,
	P.ProductTypeId,
	P.ProductSubTypeId,
	SUM(ISNULL(TP.RetailPrice, 0)) AS ProductRetailPrice,
	SUM(ISNULL(TP.Payover, 0)) AS ProductPayOver,
	(SUM(ISNULL(TP.RetailPrice, 0)) - (SUM(ISNULL(TP.Payover, 0)))) AS ProductRetention
FROM TransactionProduct TP WITH (NOLOCK)
INNER JOIN Product P WITH (NOLOCK)
	ON TP.ProductId = P.Id
INNER JOIN [Transaction]  T WITH (NOLOCK) ON T.ID=TP.TransactionId AND T.TransactionTypeId=TP.TransactionTypeId
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
AND TP.ProductOptionId IS NOT NULL

AND T.ID IN (SELECT
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
GROUP BY TP.TransactionId,
	TP.TransactionTypeId,
	P.ProductTypeId,
	P.ProductSubTypeId
),

TransactionDetail
AS (SELECT
	T.*,
	PT.Id AS ProductTypeId,
	UPPER(PT.ProductTypeName) AS ProductTypeName,
	PS.Id AS ProductSubTypeId,
	UPPER(PS.ProductSubTypeName) AS ProductSubTypeName
FROM ProductType PT WITH(NOLOCK)
INNER JOIN ProductSubType PS
	ON PT.Id = PS.ProductTypeId
CROSS JOIN [ViewTransaction] T
WHERE PT.IsActive = 1
AND PS.IsActive = 1
AND T.IsActive = 1
AND T.CountryId = @CountryId
AND T.TransactionId IN (SELECT
	item
FROM dbo.SplitString(@TransactionId, ',')))


SELECT 
	T.*,
	CONCAT(T.ProductTypeName, ' : ', T.ProductSubTypeName) AS ProductType,
	ISNULL(P.ProductRetailPrice,0) AS ProductRetailPrice,
	ISNULL(P.ProductPayOver,0) AS ProductPayOver,
	 --ISNULL(ProductRetention,0) AS ProductRetention
	CASE WHEN T.ProductSubTypeName = 'TRANSACTION FEE' THEN ISNULL((ISNULL(P.ProductRetention, 0) - T.TransactionFee),0) ELSE ISNULL(P.ProductRetention,0) END  AS ProductRetention

FROM TransactionDetail T WITH(NOLOCK)
LEFT JOIN ProductDetail P WITH(NOLOCK)
	ON  P.TransactionId = T.TransactionId and P.ProductTypeId = T.ProductTypeId
	and P.ProductSubTypeId = T.ProductSubTypeId	
ORDER BY T.TransactionId, T.ProductTypeName, T.ProductSubTypeName

END

