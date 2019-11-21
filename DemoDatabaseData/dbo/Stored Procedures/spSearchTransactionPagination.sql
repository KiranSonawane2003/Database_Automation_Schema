


CREATE PROCEDURE [dbo].[spSearchTransactionPagination]
(
@AdvanceSearchDetails NVARCHAR(max), 
@BranchIdString NVARCHAR(max),
@start BIGINT,
@size BIGINT, 
@isPrivateSalesPerson VARCHAR (100) = '',
@transactionCount bigint output,
@IsBanker bit,
@LogedInUserId INT
)
  
AS    
BEGIN  

IF OBJECT_ID('tempdb..#TempTransactionDetail') IS NOT NULL  
 BEGIN  
DROP TABLE #TempTransactionDetail  
END  
  
IF OBJECT_ID('tempdb..#TempAdvanceSearchDetails') IS NOT NULL  
BEGIN  
DROP TABLE #TempAdvanceSearchDetails  
END  
  
  
DECLARE @p_xml XML  
SET @p_xml = @AdvanceSearchDetails  
  
  
    SET FMTONLY OFF
CREATE TABLE #TempAdvanceSearchDetails  
 (  
 Id BIGINT,  
 ReferenceNumber NVARCHAR(MAX),  
 GroupId BIGINT,  
 BranchId BIGINT,  
 BusinessManagerId BIGINT,  
 SalesPersonId BIGINT,
 TransactionTypeId BIGINT,  
 CountryId BIGINT,  
 UserId BIGINT,  
 TransactionStatusFlag bit,  
 IsAdmin bit,  
 TransactionStatusId BIGINT,  
 FinanceStatusId BIGINT,  
 FinanceCompanyId BIGINT,  
 FirstName NVARCHAR(MAX),  
 LastName NVARCHAR(MAX),  
 MobileNumber NVARCHAR(MAX),  
 EmailId NVARCHAR(MAX),  
 CompanyName NVARCHAR(MAX),  
 CompanyEmirateId NVARCHAR(MAX),  
 CreatedFrom datetime,  
 CreatedTo datetime,  
 InceptedFrom datetime,  
 InceptedTo datetime,  
 CustomerType BIGINT,  
 IdNumber NVARCHAR(MAX),  
 CompanyRegNumber NVARCHAR(MAX),  
 FleetNumber NVARCHAR(MAX),  
 FinanceAccountNumber NVARCHAR(MAX),
 BankDealReferenceNumber NVARCHAR(MAX),
 FinAppFinanceStatusId BIGINT   
 )  
  
INSERT INTO #TempAdvanceSearchDetails  
  
  SELECT  
   NULLIF(x.mytable.value('Id[1]', 'BIGINT'), 0)  
   ,NULLIF(x.mytable.value('ReferenceNumber[1]', 'NVARCHAR(max)'), '')  
   ,NULLIF(x.mytable.value('GroupId[1]', 'BIGINT'), 0)  
   ,NULLIF(x.mytable.value('BranchId[1]', 'BIGINT'), 0)  
   ,NULLIF(x.mytable.value('BusinessManagerId[1]', 'BIGINT'), 0) 
   ,NULLIF(x.mytable.value('SalesPersonId[1]', 'BIGINT'), 0)  
   ,NULLIF(x.mytable.value('TransactionTypeId[1]', 'BIGINT'), 0)  
   ,NULLIF(x.mytable.value('CountryId[1]', 'BIGINT'), 0)  
   ,NULLIF(x.mytable.value('UserId[1]', 'BIGINT'), 0)  
   ,NULLIF(x.mytable.value('TransactionStatusFlag[1]', 'NVARCHAR(max)'), '')  
   ,NULLIF(x.mytable.value('IsAdmin[1]', 'NVARCHAR(max)'), '')  
   ,NULLIF(x.mytable.value('TransactionStatusId[1]', 'BIGINT'), 0)  
   ,NULLIF(x.mytable.value('FinanceStatusId[1]', 'BIGINT'), 0)  
   ,NULLIF(x.mytable.value('FinanceCompanyId[1]', 'BIGINT'), 0)  
   ,NULLIF(x.mytable.value('FirstName[1]', 'NVARCHAR(max)'), '')  
   ,NULLIF(x.mytable.value('LastName[1]', 'NVARCHAR(max)'), '')  
   ,NULLIF(x.mytable.value('MobileNumber[1]', 'NVARCHAR(max)'), '')  
   ,NULLIF(x.mytable.value('EmailId[1]', 'NVARCHAR(max)'), '')  
   ,NULLIF(x.mytable.value('CompanyName[1]', 'NVARCHAR(max)'), '')  
   ,NULLIF(x.mytable.value('CompanyEmirateId[1]', 'BIGINT'), 0)  
   ,NULLIF(x.mytable.value('CreatedFrom[1]', 'DATETIME'), '1900-01-01 00:00:00.000')  
   ,NULLIF(x.mytable.value('CreatedTo[1]', 'DATETIME'), '1900-01-01 00:00:00.000')  
   ,NULLIF(x.mytable.value('InceptedFrom[1]', 'DATETIME'), '1900-01-01 00:00:00.000')  
   ,NULLIF(x.mytable.value('InceptedTo[1]', 'DATETIME'), '1900-01-01 00:00:00.000')  
   ,NULLIF(x.mytable.value('CustomerType[1]', 'BIGINT'), 0)  
   ,NULLIF(x.mytable.value('IdNumber[1]', 'NVARCHAR(max)'), '')  
   ,NULLIF(x.mytable.value('CompanyRegNumber[1]', 'NVARCHAR(max)'), '')  
   ,NULLIF(x.mytable.value('FleetNumber[1]', 'NVARCHAR(max)'), '') 
   ,NULLIF(x.mytable.value('FinanceAccountNumber[1]', 'NVARCHAR(max)'), '')
   ,NULLIF(x.mytable.value('BankDealReferenceNumber[1]', 'NVARCHAR(max)'), '')    
   ,NULLIF(x.mytable.value('FinAppFinanceStatusId[1]', 'BIGINT'), 0)																	   
FROM @p_xml.nodes('//AdvanceTransactionSearch') AS x (mytable)  

CREATE TABLE #TempTransactionDetail (  
 RecordNo BIGINT IDENTITY (1, 1)  
 ,Id BIGINT  
 ,GroupId BIGINT  
 ,GroupName NVARCHAR(MAX)  
 ,BranchId BIGINT  
 ,BranchName NVARCHAR(MAX)  
 ,TransactionTypeId BIGINT  
 ,TransactionStatus NVARCHAR(MAX)  
 ,TransactionStatusNotes NVARCHAR(MAX)  
 ,ReferenceNumber NVARCHAR(MAX)  
 ,TransactionAPIOwner BIGINT  
 ,PreferredCallTime NVARCHAR(MAX)  
 ,SalesPersonId BIGINT  
 ,SalesPerson NVARCHAR(MAX)  
 ,BusinessManagerId BIGINT  
 ,BusinessManager NVARCHAR(MAX)  
 ,IsIncepted BIT  
 ,InceptDate DATETIME  
 ,CreatedBy BIGINT  
 ,CreatedByUser NVARCHAR(MAX)  
 ,CreatedDate DATETIME  
 ,ModifiedBy BIGINT  
 ,ModifiedDate DATETIME  
 ,IsActive BIT  
 ,CountryId BIGINT  
  ,FinanceStatusId BIGINT
 ,FinanceStatus NVARCHAR(MAX)  
 ,FinanceStatusNotes NVARCHAR(MAX)  
 ,FirstName NVARCHAR(MAX)  
 ,LastName NVARCHAR(MAX)  
 ,CompanyName NVARCHAR(MAX)  
 ,IsBlockAutomaticUpdate BIT  
 ,APICompanyId BIGINT  
 ,IsApiUpdate BIT  
 ,TransactionOwnerFirstName NVARCHAR(MAX)  
 ,TransactionOwnerLastName  NVARCHAR(MAX)  
 ,IsTransactionOwner BIT  
 ,FleetNumber NVARCHAR(MAX)  
 ,FinanceAccountNumber  NVARCHAR(MAX) 
 ,DICAmount DECIMAL(18,2)
 ,IsCashTransaction BIT
 --,IsBankerUpdate BIT
)  
  
DECLARE @SortBy NVARCHAR(MAX)  
SET @SortBy='CreatedDate'  
  
Declare @ActiveTranasctionStatusId bigint
set @ActiveTranasctionStatusId= (SELECT [Id] FROM [StaticValue] where [StaticCategoryId]=(Select [Id] FROM [dbo].[StaticCategory] where [Name]='TransactionStatus' and [IsActive]=1) AND [IsActive]=1 AND [EnumName]='ACTIVE')


IF EXISTS(SELECT 1 FROM #TempAdvanceSearchDetails WHERE FleetNumber IS NOT NULL)  
BEGIN  
SET @SortBy='FleetNumber'  
END  
  
--set first get data from usertransactionMapping table  
INSERT INTO #TempTransactionDetail  
  SELECT   
   VD.TransactionId  
   ,VD.GroupId  
   ,VD.GroupName  
   ,VD.BranchId  
   ,VD.BranchName  
   ,VD.TransactionTypeId  
   ,VD.TransactionStatus  
   ,VD.TransactionStatusNotes  
   ,CASE WHEN VD.ReferenceNumber IS NOT NULL THEN VD.ReferenceNumber +
	 	CASE  WHEN VD.FleetNumber IS NOT NULL THEN  
			CASE WHEN VD.ParentTransactionID IS NULL and (select IsGeneric from Country where id =VD.CountryId) = 0 AND (VD.[TransactionStatusId] IS NULL OR VD.[TransactionStatusId]= @ActiveTranasctionStatusId)  THEN  '/FL' +  ISNULL(VD.FleetNumber,'') + 'P'
			ELSE '/FL' + ISNULL(VD.FleetNumber,'') END ELSE '' END
   ELSE
	CASE WHEN VD.CopiedFrom IS NOT NULL THEN (VD.CopiedFrom) +
			(CASE  WHEN VD.FleetNumber IS NOT NULL THEN  
			CASE WHEN VD.ParentTransactionID IS NULL and (select IsGeneric from Country where id =VD.CountryId) = 0 AND (VD.[TransactionStatusId] IS NULL OR VD.[TransactionStatusId]= @ActiveTranasctionStatusId)  THEN  '/FL' +  ISNULL(VD.FleetNumber,'') + 'P'
			ELSE '/FL' + ISNULL(VD.FleetNumber,'') END ELSE '' END)	
   ELSE CASE  WHEN VD.FleetNumber IS NOT NULL THEN  
			CASE WHEN VD.ParentTransactionID IS NULL and (select IsGeneric from Country where id =VD.CountryId) = 0  AND (VD.[TransactionStatusId] IS NULL OR VD.[TransactionStatusId]= @ActiveTranasctionStatusId)  THEN  'FL' +  ISNULL(VD.FleetNumber,'') + 'P'
			ELSE 'FL' + ISNULL(VD.FleetNumber,'') END END END
   END AS ReferenceNumber
   ,VD.TransactionAPIOwner  
   ,VD.PreferredCallTime  
   ,VD.SalesPersonId  
   ,VD.SalesPerson --+  ' ('+(select isnull(IdNumber,'') from SalesPerson where id=VD.SalesPersonId)+')'
   ,VD.BusinessManagerId  
   ,VD.BusinessManager  
   ,VD.IsIncepted  
   ,case when VD.IsIncepted=0 then null else vd.InceptDate end as InceptDate  
   ,vd.CreatedBy  
   ,vd.CreatedByUser  
   ,VD.CreatedDate  
   ,VD.ModifiedBy  
   ,VD.ModifiedDate  
   ,VD.IsActive  
   ,VD.CountryId
   ,VD.FinanceStatusId  
   ,(select financestatusname from TransactionFinanceStatusMapping as TF where VD.FinanceStatusId= TF.FinanceStatusId and TF.CountryId=VD.CountryId)
   ,VD.FinanceStatusNotes  
   ,VD.FirstName  
   ,VD.LastName  
   ,VD.CompanyName  
   ,VD.IsBlockAutomaticUpdate  
   ,VD.APICompanyId  
   ,VD.IsApiUpdate  
   ,(CASE WHEN VD.BusinessManagerId IS NOT NULL THEN VD.BusinessManager  
   ELSE (CASE WHEN VD.ReferenceNumber IS NOT NULL OR VD.ReferenceNumber != '' THEN VD.TransactionAPIOwnerUser ELSE VD.CreatedByUser END) END),  
   null 
    ,CASE WHEN VD.IsIncepted=1 THEN 0 ELSE 
	(CASE WHEN TD.IsAdmin=1 THEN 1 ELSE(  
    CASE WHEN VD.BusinessManagerId IS NULL THEN (  
    CASE WHEN VD.ReferenceNumber IS NULL OR VD.ReferenceNumber='' THEN (  
    CASE WHEN TD.UserId = VD.CreatedBy THEN 1 ELSE 0 END) ELSE (  
    CASE WHEN VD.TransactionAPIOwner IS NULL THEN 1 ELSE (  
    CASE WHEN TD.UserId = VD.TransactionAPIOwner THEN 1 ELSE 0 END) END) END)  
    ELSE (CASE WHEN TD.UserId=VD.BusinessManagerId THEN 1 ELSE 0 END) END) END) END      
	,VD.FleetNumber 
	,VD.FinanceAccountNumber
	,VD.DICAmount 
	,VD.IsCashTransaction
	--,(SELECT IsBankerUpdate from TransactionFinanceApplication WITH (NOLOCK) WHERE TransactionId=VD.TransactionId)
  FROM ViewTransaction VD WITH (NOLOCK)   
  ,#TempAdvanceSearchDetails TD  
  WHERE VD.CountryId = TD.CountryId
  AND VD.IsCashTransaction = (CASE WHEN @IsBanker=1 THEN 0 ELSE VD.IsCashTransaction END)
  AND (TD.Id IS NULL  
  OR VD.TransactionId = TD.Id)  
  AND (TD.ReferenceNumber IS NULL  
  OR (VD.ReferenceNumber LIKE ('%' + TD.ReferenceNumber + '%') COLLATE DATABASE_DEFAULT OR VD.CopiedFrom LIKE ('%' + TD.ReferenceNumber + '%') COLLATE DATABASE_DEFAULT) )  
  AND (TD.FleetNumber IS NULL  
  OR VD.FleetNumber =TD.FleetNumber  COLLATE DATABASE_DEFAULT)  
  AND (TD.FirstName IS NULL  
  OR VD.FirstName LIKE ('%' + TD.FirstName + '%') COLLATE DATABASE_DEFAULT)  
  AND (TD.LastName IS NULL  
  OR VD.LastName LIKE ('%' + TD.LastName + '%') COLLATE DATABASE_DEFAULT)  
  AND (TD.MobileNumber IS NULL  
  OR VD.Mobile LIKE ('%' + TD.MobileNumber + '%') COLLATE DATABASE_DEFAULT)  
  AND (TD.EmailId IS NULL  
  OR VD.EmailAddress LIKE ('%' + TD.EmailId + '%') COLLATE DATABASE_DEFAULT)  
  AND (TD.CompanyName IS NULL  
  OR VD.CompanyName LIKE ('%' + TD.CompanyName + '%') COLLATE DATABASE_DEFAULT)  
  AND (TD.CompanyEmirateId IS NULL  
  OR VD.ComPhyAddEmirate LIKE ('%' + TD.CompanyEmirateId + '%') COLLATE DATABASE_DEFAULT)  
  AND (TD.CreatedFrom IS NULL  
  OR (TD.CreatedFrom IS NOT NULL  
  AND VD.CreatedDate >= TD.CreatedFrom))  
  AND (TD.CreatedTo IS NULL  
  OR (TD.CreatedTo IS NOT NULL  
  AND VD.CreatedDate <= TD.CreatedTo))  
  AND (TD.InceptedFrom IS NULL  
  OR (TD.InceptedFrom IS NOT NULL  
  AND VD.InceptDate >= TD.InceptedFrom AND VD.IsIncepted=1))  
  AND (TD.InceptedTo IS NULL  
  OR (TD.InceptedTo IS NOT NULL  
  AND VD.InceptDate < TD.InceptedTo AND VD.IsIncepted=1))  
  AND (TD.FinanceStatusId IS NULL  
  OR (TD.FinanceStatusId IS NOT NULL  
  AND TD.FinanceStatusId = -2  
  AND VD.FinanceStatusId IS NULL)  
  OR (TD.FinanceStatusId IS NOT NULL  
  AND VD.FinanceStatusId = TD.FinanceStatusId))  
  AND ((TD.TransactionStatusFlag = 1  
  AND (TD.TransactionStatusId = -1  
  OR (TD.TransactionStatusId IS NULL  
  AND ((VD.TransactionStatusId IS NULL OR VD.TransactionStatus = 'ACTIVE')  
  OR VD.TransactionStatusId = TD.TransactionStatusId))  
  OR (TD.TransactionStatusId IS NOT NULL  
  AND TD.TransactionStatusId = -2  
  AND VD.TransactionStatusId IS NULL)  
  OR (TD.TransactionStatusId IS NOT NULL  
  AND TD.TransactionStatusId != -1  
  AND VD.TransactionStatusId = TD.TransactionStatusId)))  
  OR (TD.TransactionStatusFlag = 0  
  AND (TD.TransactionStatusId IS NULL  
  OR TD.TransactionStatusId = -1  
  OR (TD.TransactionStatusId IS NOT NULL  
  AND TD.TransactionStatusId = -2  
  AND VD.TransactionStatusId IS NULL)  
  OR (TD.TransactionStatusId IS NOT NULL  
  AND TD.TransactionStatusId != -1  
  AND VD.TransactionStatusId = TD.TransactionStatusId))))  
  AND (TD.TransactionTypeId IS NULL  
  OR (TD.TransactionTypeId IS NOT NULL  
  AND TD.TransactionTypeId = -2  
  AND VD.TransactionTypeId IS NULL)  
  OR (TD.TransactionTypeId IS NOT NULL  
  AND VD.TransactionTypeId = TD.TransactionTypeId))
  AND (TD.SalesPersonId IS NULL  
  OR (TD.SalesPersonId IS NOT NULL  
  AND TD.SalesPersonId = -2  
  AND VD.SalesPersonId IS NULL)  
  OR (TD.SalesPersonId IS NOT NULL  
  AND VD.SalesPersonId = TD.SalesPersonId))  
  AND (TD.BusinessManagerId IS NULL  
  OR (TD.BusinessManagerId IS NOT NULL  
  AND TD.BusinessManagerId = -2  
  AND VD.BusinessManagerId IS NULL  
  AND VD.TransactionAPIOwner IS NULL  
  AND VD.ReferenceNumber IS NOT NULL)  
  OR (TD.BusinessManagerId IS NOT NULL  
  AND TD.BusinessManagerId != -2 
  AND  (CASE  
      WHEN VD.BusinessManagerId IS NOT NULL THEN VD.BusinessManagerId  
      ELSE   
      CASE WHEN VD.BusinessManagerId IS NULL AND VD.TransactionAPIOwner IS NOT NULL AND VD.ReferenceNumber IS NOT NULL THEN VD.TransactionAPIOwner  
      ELSE VD.CreatedBy END 
      END) = TD.BusinessManagerId))
  AND (vd.BranchId IN (SELECT * FROM dbo.SplitString(@BranchIdString, ','))
  ) 
  AND (TD.FinanceCompanyId IS NULL  
  OR (TD.FinanceCompanyId IS NOT NULL  
  AND TD.FinanceCompanyId != 0  
  AND  TD.FinanceCompanyId IN(SELECT CompanyCompanyTypeId FROM DealTrackerReportAnalytics DT WITH (NOLOCK) WHERE AnalyticsTypeId = 1  
  AND DT.TransactionId = VD.TransactionId))  
  OR(TD.FinanceCompanyId IS NOT NULL  
  AND TD.FinanceCompanyId = -2  
  AND (SELECT COUNT(CompanyCompanyTypeId) FROM DealTrackerReportAnalytics DT WITH (NOLOCK) WHERE AnalyticsTypeId = 1  
  AND DT.TransactionId = VD.TransactionId) = 0))

  AND (TD.CustomerType IS NULL  
  OR (  
  TD.CustomerType IS NOT NULL  
  AND VD.CustomerType IS NOT NULL   
  AND VD.CustomerType = TD.CustomerType)  
  )  
  AND (TD.IdNumber IS NULL  
  OR VD.IDNumber LIKE ('%' + TD.IdNumber + '%') COLLATE DATABASE_DEFAULT)  
  AND (TD.CompanyRegNumber IS NULL  
  OR VD.ComRegistrationNumber LIKE ('%' + TD.CompanyRegNumber + '%') COLLATE DATABASE_DEFAULT)  
  --AND ((TD.FinAppFinanceStatusId IS NULL OR TD.FinAppFinanceStatusId=-1) 
   --OR (TD.FinAppFinanceStatusId IN (SELECT CAST(item AS BIGINT) FROM dbo.SplitString(VD.FinAppFinanceStatusId, '|') ) AND VD.IsCashTransaction=0))
  
  AND (TD.FinAppFinanceStatusId IS NULL  
  OR (TD.FinAppFinanceStatusId IS NOT NULL  
  AND TD.FinAppFinanceStatusId != 0  
  AND  TD.FinAppFinanceStatusId IN(SELECT FinanceStatusId FROM TransactionFinanceApplication TFA WITH (NOLOCK) WHERE TFA.TransactionId = VD.TransactionId) AND VD.IsCashTransaction=0)  
  OR(TD.FinAppFinanceStatusId IS NOT NULL  
  AND TD.FinAppFinanceStatusId = -2  
  AND (SELECT COUNT(FinanceStatusId) FROM TransactionFinanceApplication TFA2 WITH (NOLOCK) WHERE TFA2.TransactionId = VD.TransactionId AND VD.IsCashTransaction=0) = 0)
  OR(TD.FinAppFinanceStatusId IS NOT NULL  
  AND TD.FinAppFinanceStatusId = -1 ))

   

  AND (TD.FinanceAccountNumber IS NULL
   OR UPPER(TD.FinanceAccountNumber) IN (SELECT UPPER(RTRIM(LTRIM(item))) COLLATE DATABASE_DEFAULT FROM dbo.SplitString(VD.FinAppFinanceAccountNumber, '|')))
  AND (TD.BankDealReferenceNumber IS NULL
   OR UPPER(TD.BankDealReferenceNumber) IN (SELECT UPPER(RTRIM(LTRIM(item))) COLLATE DATABASE_DEFAULT FROM dbo.SplitString(VD.FinAppBankDealReferenceNumber, '|')))

  
   -------------------------------------------------Private Sales Person Changes---------------------------------------
   And ((@isPrivateSalesPerson = 'PSP'  and (
  (VD.SalesPersonId  IN (select sspm.SalesPersonid FROM SuitcaseSalesPersonMapping sspm  where sspm.TransactionAccess=1  and sspm.IsActive=1 
  and sspm.userid=(select UserId from #TempAdvanceSearchDetails) 
  and (sspm.DeactivationDate>=GETDATE() or sspm.DeactivationDate is null)) or (vd.createdby =TD.UserId  
  and (VD.SalesPersonId IN (select sspm.SalesPersonid FROM SuitcaseSalesPersonMapping sspm  where sspm.TransactionAccess=1  and sspm.IsActive=1 
  and sspm.userid=(select UserId from #TempAdvanceSearchDetails) and (sspm.DeactivationDate>=GETDATE() or sspm.DeactivationDate is null)) 
  or  VD.SalesPersonId is null)) ))) or (@isPrivateSalesPerson=''))
  ----------------------------------------------- Banker role-----------------------------
  AND (@IsBanker=1 AND (VD.TransactionId IN (SELECT DA.TransactionId FROM UserCompanyMapping UC 
						INNER JOIN DealTrackerReportAnalytics DA ON UC.CompanyCompanyTypeId=DA.CompanyCompanyTypeId
						INNER JOIN FinanceApplicationHistory FAH ON FAH.CompanyCompanyTypeID=UC.CompanyCompanyTypeId
						WHERE DA.TransactionId=VD.TransactionId 
						--AND DA.AnalyticsTypeId=1
						AND (DA.AnalyticsTypeId=1 OR (UC.CompanyCompanyTypeId IN(SELECT CompanyCompanyTypeId FROM FinanceApplicationHistory WHERE [Action]='APPLY' AND TransactionID=VD.TransactionId)))  
						AND UC.UserId=@LogedInUserId 
						AND UC.IsActive=1 
						AND UC.CountryId=VD.CountryId
						GROUP BY DA.TransactionId)) OR @IsBanker=0)
-------------------------------------------------------------------------------------------------------
  --AND (TD.CompanyEmirateId IS NULL  
  --OR VD.ComPhyAddEmirate LIKE ('%' + TD.CompanyEmirateId + '%') COLLATE DATABASE_DEFAULT) 
  ------------------------------------------------------------------------------------------------------------------

  ORDER BY CASE @SortBy  
     WHEN 'FleetNumber' THEN Vd.TransactionId   
     ELSE '' END ASC,  
     CASE @SortBy  
     WHEN 'CreatedDate' THEN Vd.CreatedDate   
     ELSE  ''    
     END DESC  

 --SELECT  @transactionCount= COUNT(Id) FROM #TempTransactionDetail  

SELECT  @transactionCount= CASE WHEN COUNT(Id) < 100  THEN COUNT(Id) ELSE 100 END 
FROM #TempTransactionDetail  
--select  @transactionCount= COUNT(Id)   
--from #TempTransactionDetail  

 --Declare @SearchRowCount int   
 --set @SearchRowCount=0  
 --set @SearchRowCount= ( Select Count(1) from #TempAdvanceSearchDetails TD   
 --where (   
 --TD.BranchId is not null   
 --OR TD.BusinessManagerId is not null   
 --OR TD.CompanyEmirateId is not null   
 --OR  TD.CompanyRegNumber is not null  
 --OR  TD.CreatedFrom is not null  
 --OR  TD.CreatedTo is not null  
 --OR  TD.CustomerType is not null  
 --OR  TD.EmailId is not null  
 --OR  TD.FinanceCompanyId is not null  
 --OR  TD.FinanceStatusId is not null  
 --OR  TD.FirstName is not null  
 --OR  TD.GroupId is not null  
 --OR  TD.IdNumber is not null  
 --OR  TD.InceptedFrom is not null  
 --OR  TD.InceptedTo is not null  
 --OR  TD.LastName is not null  
 --OR  TD.MobileNumber is not null  
 --OR  TD.ReferenceNumber is not null  
 --OR  TD.TransactionStatusId is not null  
 --OR  TD.TransactionTypeId is not null  
 --OR  TD.FleetNumber is not null  
 --)  
 --)  
  
 --IF (@SearchRowCount > 0 )
 --Begin   
 -- set @transactionCount = @transactionCount  
 --End  
 --ELSE  
 --Begin  
 --    --Default Condition/ No Filter Criteria Display 100 records  
 -- set @transactionCount =100
 --End  
   
  
  
SELECT  
 *  
FROM (SELECT  
  ROW_NUMBER() OVER (ORDER BY RecordNo) AS RowNum  
  ,*  
 FROM #TempTransactionDetail WITH (NOLOCK)) AS RowConstrainedResult   
WHERE RowNum > @start  
AND RowNum <= @start + @size  
ORDER BY RowNum  
  
--SELECT * FROM @Employee_Details  
--SELECT Top 100 * FROM #TempTransactionDetail    
  
END