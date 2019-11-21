
CREATE PROCEDURE [dbo].[spListTransactionPagination](
@AdvanceSearchDetails NVARCHAR(max), 
@BranchIdString NVARCHAR(max),
@start BIGINT,
@size BIGINT,
@isPrivateSalesPerson nvarchar(50)=null,
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
 CompanyRegNumber NVARCHAR(MAX)    
    
 )    
    
INSERT INTO #TempAdvanceSearchDetails    
    
  SELECT    
   NULLIF(x.mytable.value('Id[1]', 'BIGINT'), 0)    
   ,NULLIF(x.mytable.value('ReferenceNumber[1]', 'NVARCHAR(max)'), '')    
   ,NULLIF(x.mytable.value('GroupId[1]', 'BIGINT'), 0)    
   ,NULLIF(x.mytable.value('BranchId[1]', 'BIGINT'), 0)    
   ,NULLIF(x.mytable.value('BusinessManagerId[1]', 'BIGINT'), 0)    
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
 ,FinanceStatus NVARCHAR(MAX)    
 ,FinanceStatusNotes NVARCHAR(MAX) 
  ,FinanceStatusId BIGINT       
 ,FirstName NVARCHAR(MAX)    
 ,LastName NVARCHAR(MAX)    
 ,CompanyName NVARCHAR(MAX)    
 ,IsBlockAutomaticUpdate BIT    
 ,APICompanyId BIGINT    
 ,IsApiUpdate BIT    
 ,TransactionOwnerFirstName NVARCHAR(MAX)    
 ,TransactionOwnerLastName  NVARCHAR(MAX)    
 ,IsTransactionOwner BIT
 ,FinanceAccountNumber NVARCHAR(MAX)
 ,DICAmount DECIMAL(18,2)  ,
 IsCashTransaction BIT
)    
    
	Declare @ActiveTranasctionStatusId bigint
set @ActiveTranasctionStatusId= (SELECT [Id] FROM [StaticValue] where [StaticCategoryId]=(Select [Id] FROM [dbo].[StaticCategory] where [Name]='TransactionStatus' and [IsActive]=1) AND [IsActive]=1 AND [EnumName]='ACTIVE')


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
			CASE WHEN VD.ParentTransactionID IS NULL and (select IsGeneric from Country where id =VD.CountryId) = 0  AND (VD.[TransactionStatusId] IS NULL OR VD.[TransactionStatusId]= @ActiveTranasctionStatusId)  THEN  '/FL' +  ISNULL(VD.FleetNumber,'') +  'P'
			ELSE '/FL' + ISNULL(VD.FleetNumber,'') END ELSE '' END
   ELSE
	CASE WHEN VD.CopiedFrom IS NOT NULL THEN (VD.CopiedFrom) +
			(CASE  WHEN VD.FleetNumber IS NOT NULL THEN  
			CASE WHEN VD.ParentTransactionID IS NULL and (select IsGeneric from Country where id =VD.CountryId) = 0   AND (VD.[TransactionStatusId] IS NULL OR VD.[TransactionStatusId]= @ActiveTranasctionStatusId)  THEN  '/FL' +  ISNULL(VD.FleetNumber,'') + 'P'
			ELSE '/FL' + ISNULL(VD.FleetNumber,'') END ELSE '' END)	
   ELSE CASE  WHEN VD.FleetNumber IS NOT NULL THEN  
			CASE WHEN VD.ParentTransactionID IS NULL and (select IsGeneric from Country where id =VD.CountryId) = 0   AND (VD.[TransactionStatusId] IS NULL OR VD.[TransactionStatusId]= @ActiveTranasctionStatusId)  THEN  'FL' +  ISNULL(VD.FleetNumber,'') + 'P'
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
   ,(select financestatusname from TransactionFinanceStatusMapping as TF where VD.FinanceStatusId= TF.FinanceStatusId and TF.CountryId=VD.CountryId)
   ,VD.FinanceStatusNotes 
   ,VD.FinanceStatusId   
   ,VD.FirstName    
   ,VD.LastName    
   ,VD.CompanyName    
   ,VD.IsBlockAutomaticUpdate    
   ,VD.APICompanyId    
   ,VD.IsApiUpdate    
   ,(CASE WHEN VD.BusinessManagerId IS NOT NULL THEN VD.BusinessManager    
   ELSE (CASE WHEN VD.ReferenceNumber IS NOT NULL OR VD.ReferenceNumber != '' THEN VD.TransactionAPIOwnerUser ELSE VD.CreatedByUser END) END),    
   null    
   --(CASE WHEN VD.BusinessManagerId IS NOT NULL THEN VD.LastName ELSE(CASE WHEN VD.ReferenceNumber IS NOT NULL then VD.LastName ELSE NULL end)END)     
     ,CASE WHEN VD.IsIncepted=1 THEN 0 ELSE    
     (    
     CASE WHEN TD.IsAdmin=1 THEN 1 ELSE(    
     CASE WHEN VD.BusinessManagerId IS NULL THEN (    
     CASE WHEN VD.ReferenceNumber IS NULL OR VD.ReferenceNumber='' THEN (    
     CASE WHEN TD.UserId = VD.CreatedBy THEN 1 ELSE 0 END) ELSE (    
     CASE WHEN VD.TransactionAPIOwner IS NULL THEN 1 ELSE (    
     CASE WHEN TD.UserId = VD.TransactionAPIOwner THEN 1 ELSE 0 END) END) END)    
     ELSE (CASE WHEN TD.UserId=VD.BusinessManagerId THEN 1 ELSE 0 END) END) END) END    
     ,VD.FinanceAccountNumber
	 ,VD.DICAmount
	 ,VD.IsCashTransaction
   --(CASE WHEN VD.ReferenceNumber IS NULL OR VD.ReferenceNumber='' THEN (CASE WHEN TD.UserId=VD.CreatedBy THEN 1 ELSE 0 END) END    
      
  FROM ViewTransaction VD WITH (NOLOCK) INNER JOIN     
  UserTransactionMapping UTM WITH (NOLOCK) on VD.TransactionId=UTM.TransactionID --and VD.ModifiedBy=UTM.UserID    
    ,#TempAdvanceSearchDetails TD     

  WHERE VD.CountryId = TD.CountryId    
  --AND VD.ModifiedBy = TD.UserId  
  AND VD.IsCashTransaction = (CASE WHEN @IsBanker=1 THEN 0 ELSE VD.IsCashTransaction END)    
  AND TD.UserId=UTM.UserID    
  AND (TD.Id IS NULL    
  OR VD.TransactionId = TD.Id)    
  AND (TD.ReferenceNumber IS NULL    
  OR VD.ReferenceNumber LIKE ('%' + TD.ReferenceNumber + '%') COLLATE DATABASE_DEFAULT)    
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
  --AND   
  --(TD.CreatedFrom IS NULL    
  --OR (TD.CreatedFrom IS NOT NULL    
  --AND VD.CreatedDate >= TD.CreatedFrom))    
  --AND (TD.CreatedTo IS NULL    
  --OR (TD.CreatedTo IS NOT NULL    
  --AND VD.CreatedDate <= TD.CreatedTo))    
   AND (TD.InceptedFrom IS NULL    
   OR (TD.InceptedFrom IS NOT NULL    
   AND VD.InceptDate >= TD.InceptedFrom))    
   AND (TD.InceptedTo IS NULL    
   OR (TD.InceptedTo IS NOT NULL    
   AND VD.InceptDate < TD.InceptedTo))    
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
  AND ((TD.BusinessManagerId IS NULL)    
  OR (TD.BusinessManagerId IS NULL    
  AND TD.BusinessManagerId != 0)    
  OR (TD.BusinessManagerId != 0    
  AND TD.BusinessManagerId IS NOT NULL    
  AND (CASE    
   WHEN VD.BusinessManagerId IS NOT NULL THEN VD.BusinessManagerId    
   ELSE VD.CreatedBy    
  END) = TD.BusinessManagerId)    
  OR (TD.BusinessManagerId != 0    
  AND TD.BusinessManagerId IS NOT NULL    
  AND (CASE    
   WHEN VD.BusinessManagerId IS NULL AND    
    VD.TransactionAPIOwner IS NOT NULL AND    
    VD.ReferenceNumber IS NOT NULL THEN VD.TransactionAPIOwner    
   ELSE NULL    
  END) = TD.BusinessManagerId)    
  OR (TD.BusinessManagerId = 0    
  AND (VD.BusinessManagerId IS NULL    
  AND VD.TransactionAPIOwner IS NULL    
  AND VD.ReferenceNumber IS NOT NULL)))    
    
  AND (vd.BranchId IN (SELECT    
    *    
   FROM dbo.SplitString(@BranchIdString, ','))    
  )    
  AND (TD.FinanceCompanyId IS NULL    
  OR (TD.FinanceCompanyId != 0  
  AND (SELECT 
    CompanyCompanyTypeId    
   FROM DealTrackerReportAnalytics DT WITH (NOLOCK)    
   WHERE AnalyticsTypeId = 1    
   AND DT.TransactionId = TD.Id)    
  = TD.FinanceCompanyId))    
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
  
  -------------------------------------------------Private Sales Person Changes---------------------------------------
  --And ((@isPrivateSalesPerson = 'PSP'  and ((VD.SalesPersonId  IN (select sspm.SalesPersonid FROM SuitcaseSalesPersonMapping sspm
  --where sspm.TransactionAccess=1 
  --and sspm.userid=(select UserId from #TempAdvanceSearchDetails) and (DeactivationDate<GETDATE() or DeactivationDate is null)) or vd.createdby =TD.UserId ))) or (@isPrivateSalesPerson=''))
 And ((@isPrivateSalesPerson = 'PSP'  and (
  (VD.SalesPersonId  IN (select sspm.SalesPersonid FROM SuitcaseSalesPersonMapping sspm  where sspm.TransactionAccess=1  and sspm.IsActive=1 
  and sspm.userid=(select UserId from #TempAdvanceSearchDetails) 
  and (sspm.DeactivationDate>=GETDATE() or sspm.DeactivationDate is null)) or (vd.createdby =TD.UserId  
  and (VD.SalesPersonId IN (select sspm.SalesPersonid FROM SuitcaseSalesPersonMapping sspm  where sspm.TransactionAccess=1  and sspm.IsActive=1 
  and sspm.userid=(select UserId from #TempAdvanceSearchDetails) and (sspm.DeactivationDate>=GETDATE() or sspm.DeactivationDate is null)) 
  or  VD.SalesPersonId is null)) ))) or (@isPrivateSalesPerson=''))

   ----------------------------------------------- Banker Role-----------------------------------------------------------
  --AND (@IsBanker=1 AND (VD.TransactionId IN (SELECT DA.TransactionId FROM UserCompanyMapping UC 
		--				INNER JOIN DealTrackerReportAnalytics DA ON UC.CompanyCompanyTypeId=DA.CompanyCompanyTypeId
		--				WHERE DA.TransactionId=VD.TransactionId and DA.AnalyticsTypeId=1 and UC.UserId=@LogedInUserId and UC.IsActive=1 and UC.CountryId=VD.CountryId
		--				GROUP BY DA.TransactionId)) OR @IsBanker=0)
   ------------------------------------------------------------------------------------------------------------------

    
  ORDER BY UTM.ModifiedDate DESC    
    
-- set second get data from view ViewTransaction with respect to the userId    
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
			CASE WHEN VD.ParentTransactionID IS NULL and (select IsGeneric from Country where id =VD.CountryId) = 0  THEN  '/FL' +  ISNULL(VD.FleetNumber,'') --+ 'P'
			ELSE '/FL' + ISNULL(VD.FleetNumber,'') END ELSE '' END
   ELSE
	CASE WHEN VD.CopiedFrom IS NOT NULL THEN (VD.CopiedFrom) +
			(CASE  WHEN VD.FleetNumber IS NOT NULL THEN  
			CASE WHEN VD.ParentTransactionID IS NULL and (select IsGeneric from Country where id =VD.CountryId) = 0 THEN  '/FL' +  ISNULL(VD.FleetNumber,'') --+ 'P'
			ELSE '/FL' + ISNULL(VD.FleetNumber,'') END ELSE '' END)	
   ELSE CASE  WHEN VD.FleetNumber IS NOT NULL THEN  
			CASE WHEN VD.ParentTransactionID IS NULL and (select IsGeneric from Country where id =VD.CountryId) = 0 THEN  'FL' +  ISNULL(VD.FleetNumber,'') --+ 'P'
			ELSE 'FL' + ISNULL(VD.FleetNumber,'') END END END
   END AS ReferenceNumber  
   ,VD.TransactionAPIOwner    
   ,VD.PreferredCallTime    
   ,VD.SalesPersonId    
   ,VD.SalesPerson  --+  ' ('+(select isnull(IdNumber,'') from SalesPerson where id=VD.SalesPersonId)+')'   
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
    ,(select financestatusname from TransactionFinanceStatusMapping as TF where VD.FinanceStatusId= TF.FinanceStatusId and TF.CountryId=VD.CountryId)
   ,VD.FinanceStatusNotes  
   ,VD.FinanceStatusId  
   ,VD.FirstName    
   ,VD.LastName    
   ,VD.CompanyName    
   ,VD.IsBlockAutomaticUpdate    
   ,VD.APICompanyId    
   ,VD.IsApiUpdate    
   ,(CASE WHEN VD.BusinessManagerId IS NOT NULL THEN VD.BusinessManager    
   ELSE (CASE WHEN VD.ReferenceNumber IS NOT NULL OR VD.ReferenceNumber != '' THEN VD.TransactionAPIOwnerUser ELSE VD.CreatedByUser END) END),    
   null    
   --(CASE WHEN VD.BusinessManagerId IS NOT NULL THEN VD.LastName ELSE(CASE WHEN VD.ReferenceNumber IS NOT NULL then VD.LastName ELSE NULL end)END)     
     ,CASE WHEN VD.IsIncepted=1 THEN 0 ELSE(    
     CASE WHEN TD.IsAdmin=1 THEN 1 ELSE(    
     CASE WHEN VD.BusinessManagerId IS NULL THEN (    
     CASE WHEN VD.ReferenceNumber IS NULL OR VD.ReferenceNumber='' THEN (    
     CASE WHEN TD.UserId = VD.CreatedBy THEN 1 ELSE 0 END) ELSE (    
     CASE WHEN VD.TransactionAPIOwner IS NULL THEN 1 ELSE (    
     CASE WHEN TD.UserId = VD.TransactionAPIOwner THEN 1 ELSE 0 END) END) END)    
     ELSE (CASE WHEN TD.UserId=VD.BusinessManagerId THEN 1 ELSE 0 END) END) END) END    
     ,VD.FinanceAccountNumber
	 ,VD.DICAmount 
	 ,VD.IsCashTransaction
   --(CASE WHEN VD.ReferenceNumber IS NULL OR VD.ReferenceNumber='' THEN (CASE WHEN TD.UserId=VD.CreatedBy THEN 1 ELSE 0 END) END    
      
  FROM ViewTransaction VD WITH (NOLOCK)    
    ,#TempAdvanceSearchDetails TD WITH (NOLOCK)    
  WHERE NOT EXISTS(SELECT id from #TempTransactionDetail TTD WITH (NOLOCK) where TTD.Id=VD.TransactionId     
  ) AND VD.CountryId = TD.CountryId  
  AND VD.IsCashTransaction = (CASE WHEN @IsBanker=1 THEN 0 ELSE VD.IsCashTransaction END)    
  AND VD.ModifiedBy = TD.UserId    
  AND (TD.Id IS NULL    
  OR VD.TransactionId = TD.Id)    
  AND (TD.ReferenceNumber IS NULL    
  OR VD.ReferenceNumber LIKE ('%' + TD.ReferenceNumber + '%') COLLATE DATABASE_DEFAULT)    
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
  --AND (TD.CreatedFrom IS NULL    
  --OR (TD.CreatedFrom IS NOT NULL    
  --AND VD.CreatedDate >= TD.CreatedFrom))    
  --AND (TD.CreatedTo IS NULL    
  --OR (TD.CreatedTo IS NOT NULL    
  --AND VD.CreatedDate <= TD.CreatedTo))    
   AND (TD.InceptedFrom IS NULL    
   OR (TD.InceptedFrom IS NOT NULL    
   AND VD.InceptDate >= TD.InceptedFrom))    
   AND (TD.InceptedTo IS NULL    
   OR (TD.InceptedTo IS NOT NULL    
   AND VD.InceptDate < TD.InceptedTo))    
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
  AND ((TD.BusinessManagerId IS NULL)    
  OR (TD.BusinessManagerId IS NULL    
  AND TD.BusinessManagerId != 0)    
  OR (TD.BusinessManagerId != 0    
  AND TD.BusinessManagerId IS NOT NULL    
  AND (CASE    
   WHEN VD.BusinessManagerId IS NOT NULL THEN VD.BusinessManagerId    
   ELSE VD.CreatedBy    
  END) = TD.BusinessManagerId)    
  OR (TD.BusinessManagerId != 0    
  AND TD.BusinessManagerId IS NOT NULL    
  AND (CASE    
   WHEN VD.BusinessManagerId IS NULL AND    
    VD.TransactionAPIOwner IS NOT NULL AND    
    VD.ReferenceNumber IS NOT NULL THEN VD.TransactionAPIOwner    
   ELSE NULL    
  END) = TD.BusinessManagerId)    
  OR (TD.BusinessManagerId = 0    
  AND (VD.BusinessManagerId IS NULL    
  AND VD.TransactionAPIOwner IS NULL    
  AND VD.ReferenceNumber IS NOT NULL)))    
    
  AND (vd.BranchId IN (SELECT    
    *    
   FROM dbo.SplitString(@BranchIdString, ','))    
  )    
  AND (TD.FinanceCompanyId IS NULL    
  OR (TD.FinanceCompanyId != 0    
  AND (SELECT    
    CompanyCompanyTypeId     
   FROM DealTrackerReportAnalytics DT WITH (NOLOCK)    
   WHERE AnalyticsTypeId = 1    
   AND DT.TransactionId = TD.Id)    
  = TD.FinanceCompanyId))    
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
  
    -------------------------------------------------Private Sales Person Changes---------------------------------------
  --And ((@isPrivateSalesPerson = 'PSP'  and ((VD.SalesPersonId  IN (select sspm.SalesPersonid FROM SuitcaseSalesPersonMapping sspm
  --where sspm.TransactionAccess=1 
  --and sspm.userid=(select UserId from #TempAdvanceSearchDetails) and (DeactivationDate<GETDATE() or DeactivationDate is null)) or vd.createdby =TD.UserId ))) or (@isPrivateSalesPerson=''))
  And ((@isPrivateSalesPerson = 'PSP'  and (
  (VD.SalesPersonId  IN (select sspm.SalesPersonid FROM SuitcaseSalesPersonMapping sspm  where sspm.TransactionAccess=1  and sspm.IsActive=1 
  and sspm.userid=(select UserId from #TempAdvanceSearchDetails) 
  and (sspm.DeactivationDate>=GETDATE() or sspm.DeactivationDate is null)) or (vd.createdby =TD.UserId  
  and (VD.SalesPersonId IN (select sspm.SalesPersonid FROM SuitcaseSalesPersonMapping sspm  where sspm.TransactionAccess=1  and sspm.IsActive=1 
  and sspm.userid=(select UserId from #TempAdvanceSearchDetails) and (sspm.DeactivationDate>=GETDATE() or sspm.DeactivationDate is null)) 
  or  VD.SalesPersonId is null)) ))) or (@isPrivateSalesPerson=''))

   ----------------------------------------------- Banker Role-----------------------------------------------------------
  --AND (@IsBanker=1 AND (VD.TransactionId IN (SELECT DA.TransactionId FROM UserCompanyMapping UC 
		--				INNER JOIN DealTrackerReportAnalytics DA ON UC.CompanyCompanyTypeId=DA.CompanyCompanyTypeId
		--				WHERE DA.TransactionId=VD.TransactionId and DA.AnalyticsTypeId=1 and UC.UserId=@LogedInUserId and UC.IsActive=1 and UC.CountryId=VD.CountryId
		--				GROUP BY DA.TransactionId)) OR @IsBanker=0)
    ------------------------------------------------------------------------------------------------------------------
    
  ORDER BY VD.ModifiedDate DESC    
    
    
--set third get data from view ViewTransaction other than same user Id    
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
			CASE WHEN VD.ParentTransactionID IS NULL and (select IsGeneric from Country where id =VD.CountryId) = 0 THEN  '/FL' +  ISNULL(VD.FleetNumber,'') --+ 'P'
			ELSE '/FL' + ISNULL(VD.FleetNumber,'') END ELSE '' END
   ELSE
	CASE WHEN VD.CopiedFrom IS NOT NULL THEN (VD.CopiedFrom) +
			(CASE  WHEN VD.FleetNumber IS NOT NULL THEN  
			CASE WHEN VD.ParentTransactionID IS NULL and (select IsGeneric from Country where id =VD.CountryId) = 0 THEN  '/FL' +  ISNULL(VD.FleetNumber,'') --+ 'P'
			ELSE '/FL' + ISNULL(VD.FleetNumber,'') END ELSE '' END)	
   ELSE CASE  WHEN VD.FleetNumber IS NOT NULL THEN  
			CASE WHEN VD.ParentTransactionID IS NULL and (select IsGeneric from Country where id =VD.CountryId) = 0 THEN  'FL' +  ISNULL(VD.FleetNumber,'') --+ 'P'
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
    ,(select financestatusname from TransactionFinanceStatusMapping as TF where VD.FinanceStatusId= TF.FinanceStatusId and TF.CountryId=VD.CountryId)
   ,VD.FinanceStatusNotes    
   ,VD.FinanceStatusId
   ,VD.FirstName    
   ,VD.LastName    
   ,VD.CompanyName    
   ,VD.IsBlockAutomaticUpdate    
   ,VD.APICompanyId    
   ,VD.IsApiUpdate    
   ,(CASE WHEN VD.BusinessManagerId IS NOT NULL THEN VD.BusinessManager    
   ELSE (CASE WHEN VD.ReferenceNumber IS NOT NULL OR VD.ReferenceNumber != '' THEN VD.TransactionAPIOwnerUser ELSE VD.CreatedByUser END) END),    
   null    
   ,CASE WHEN VD.IsIncepted=1 THEN 0 ELSE(    
     CASE WHEN TD.IsAdmin=1 THEN 1 ELSE(    
     CASE WHEN VD.BusinessManagerId IS NULL THEN (    
     CASE WHEN VD.ReferenceNumber IS NULL OR VD.ReferenceNumber='' THEN (    
     CASE WHEN TD.UserId = VD.CreatedBy THEN 1 ELSE 0 END) ELSE (    
     CASE WHEN VD.TransactionAPIOwner IS NULL THEN 1 ELSE (    
     CASE WHEN TD.UserId = VD.TransactionAPIOwner THEN 1 ELSE 0 END) END) END)    
     ELSE (CASE WHEN TD.UserId=VD.BusinessManagerId THEN 1 ELSE 0 END) END) END) END    
     ,VD.FinanceAccountNumber
	 ,VD.DICAmount  
	 ,VD.IsCashTransaction
  FROM ViewTransaction VD  WITH (NOLOCK)    
    ,#TempAdvanceSearchDetails TD  WITH (NOLOCK)    
  WHERE  NOT EXISTS(SELECT id from #TempTransactionDetail TTD WITH (NOLOCK) where TTD.Id=VD.TransactionId     
  ) AND    
  VD.CountryId = TD.CountryId 
  AND VD.IsCashTransaction = (CASE WHEN @IsBanker=1 THEN 0 ELSE VD.IsCashTransaction END)    
  AND VD.ModifiedBy != TD.UserId    
  AND (TD.Id IS NULL    
  OR VD.TransactionId = TD.Id)    
  AND (TD.ReferenceNumber IS NULL    
  OR VD.ReferenceNumber LIKE ('%' + TD.ReferenceNumber + '%') COLLATE DATABASE_DEFAULT)    
  AND (TD.FirstName IS NULL    
  OR VD.FirstName LIKE ('%' + TD.FirstName + '%') COLLATE DATABASE_DEFAULT)    
  AND (TD.LastName IS NULL    
  OR VD.LastName LIKE ('%' + TD.LastName + '%')COLLATE DATABASE_DEFAULT)    
  AND (TD.MobileNumber IS NULL    
  OR VD.Mobile LIKE ('%' + TD.MobileNumber + '%')COLLATE DATABASE_DEFAULT)    
  AND (TD.EmailId IS NULL    
  OR VD.EmailAddress LIKE ('%' + TD.EmailId + '%')COLLATE DATABASE_DEFAULT)    
  AND (TD.CompanyName IS NULL    
  OR VD.CompanyName LIKE ('%' + TD.CompanyName + '%')COLLATE DATABASE_DEFAULT)    
  AND (TD.CompanyEmirateId IS NULL    
  OR VD.ComPhyAddEmirate LIKE ('%' + TD.CompanyEmirateId + '%')COLLATE DATABASE_DEFAULT)    
   --AND (TD.CreatedFrom IS NULL    
   -- OR (TD.CreatedFrom IS NOT NULL    
   --  AND VD.CreatedDate >= TD.CreatedFrom))    
   --AND (TD.CreatedTo IS NULL    
   -- OR (TD.CreatedTo IS NOT NULL    
   --  AND VD.CreatedDate <= TD.CreatedTo))    
  AND (TD.InceptedFrom IS NULL    
  OR (TD.InceptedFrom IS NOT NULL    
  AND VD.InceptDate >= TD.InceptedFrom))    
  AND (TD.InceptedTo IS NULL    
  OR (TD.InceptedTo IS NOT NULL    
  AND VD.InceptDate < TD.InceptedTo))    
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
  AND ((TD.BusinessManagerId IS NULL)    
  OR (TD.BusinessManagerId IS NULL    
  AND TD.BusinessManagerId != 0)    
  OR (TD.BusinessManagerId != 0    
  AND TD.BusinessManagerId IS NOT NULL    
  AND (CASE    
   WHEN VD.BusinessManagerId IS NOT NULL THEN VD.BusinessManagerId    
   ELSE VD.CreatedBy    
  END) = TD.BusinessManagerId)    
  OR (TD.BusinessManagerId != 0    
  AND TD.BusinessManagerId IS NOT NULL    
  AND (CASE    
   WHEN VD.BusinessManagerId IS NULL AND    
    VD.TransactionAPIOwner IS NOT NULL AND    
    VD.ReferenceNumber IS NOT NULL THEN VD.TransactionAPIOwner    
   ELSE NULL    
  END) = TD.BusinessManagerId)    
  OR (TD.BusinessManagerId = 0    
  AND (VD.BusinessManagerId IS NULL    
  AND VD.TransactionAPIOwner IS NULL    
  AND VD.ReferenceNumber IS NOT NULL)))    
    
  AND (vd.BranchId IN (SELECT    
    *    
   FROM dbo.SplitString(@BranchIdString, ','))    
  )    
  AND (TD.FinanceCompanyId IS NULL    
  OR (TD.FinanceCompanyId != 0    
  AND (SELECT    
    CompanyCompanyTypeId    
   FROM DealTrackerReportAnalytics DT WITH (NOLOCK)    
   WHERE AnalyticsTypeId = 1    
   AND DT.TransactionId = TD.Id)    
  = TD.FinanceCompanyId))    
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
  
  -------------------------------------------------Private Sales Person Changes---------------------------------------
  --And ((@isPrivateSalesPerson = 'PSP'  and ((VD.SalesPersonId  IN (select sspm.SalesPersonid FROM SuitcaseSalesPersonMapping sspm
  --where sspm.TransactionAccess=1 
  --and sspm.userid=(select UserId from #TempAdvanceSearchDetails) and (DeactivationDate<GETDATE() or DeactivationDate is null)) or vd.createdby =TD.UserId ))) or (@isPrivateSalesPerson=''))
  And ((@isPrivateSalesPerson = 'PSP'  and (
  (VD.SalesPersonId  IN (select sspm.SalesPersonid FROM SuitcaseSalesPersonMapping sspm  where sspm.TransactionAccess=1  and sspm.IsActive=1 
  and sspm.userid=(select UserId from #TempAdvanceSearchDetails) 
  and (sspm.DeactivationDate>=GETDATE() or sspm.DeactivationDate is null)) or (vd.createdby =TD.UserId  
  and (VD.SalesPersonId IN (select sspm.SalesPersonid FROM SuitcaseSalesPersonMapping sspm  where sspm.TransactionAccess=1  and sspm.IsActive=1 
  and sspm.userid=(select UserId from #TempAdvanceSearchDetails) and (sspm.DeactivationDate>=GETDATE() or sspm.DeactivationDate is null)) 
 or  VD.SalesPersonId is null)) ))) or (@isPrivateSalesPerson=''))

  ----------------------------------------------- Banker Role-----------------------------------------------------------
  --AND (@IsBanker=1 AND (VD.TransactionId IN (SELECT DA.TransactionId FROM UserCompanyMapping UC 
		--				INNER JOIN DealTrackerReportAnalytics DA ON UC.CompanyCompanyTypeId=DA.CompanyCompanyTypeId
		--				WHERE DA.TransactionId=VD.TransactionId and DA.AnalyticsTypeId=1 and UC.UserId=@LogedInUserId and UC.IsActive=1 and UC.CountryId=VD.CountryId
		--				GROUP BY DA.TransactionId)) OR @IsBanker=0)
    ------------------------------------------------------------------------------------------------------------------
   
  ORDER BY VD.ModifiedDate DESC    
    
--set fourth to get only trasaction with userid and modifieddate null from usertransactionmapping    
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
			CASE WHEN VD.ParentTransactionID IS NULL and (select IsGeneric from Country where id =VD.CountryId) = 0 THEN  '/FL' +  ISNULL(VD.FleetNumber,'') --+ 'P'
			ELSE '/FL' + ISNULL(VD.FleetNumber,'') END ELSE ''END
   ELSE
	CASE WHEN VD.CopiedFrom IS NOT NULL THEN (VD.CopiedFrom) +
			(CASE  WHEN VD.FleetNumber IS NOT NULL THEN  
			CASE WHEN VD.ParentTransactionID IS NULL and (select IsGeneric from Country where id =VD.CountryId) = 0 THEN  '/FL' +  ISNULL(VD.FleetNumber,'') --+ 'P'
			ELSE '/FL' + ISNULL(VD.FleetNumber,'') END ELSE '' END)	
   ELSE CASE  WHEN VD.FleetNumber IS NOT NULL THEN  
			CASE WHEN VD.ParentTransactionID IS NULL and (select IsGeneric from Country where id =VD.CountryId) = 0 THEN  'FL' +  ISNULL(VD.FleetNumber,'') --+ 'P'
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
    ,(select financestatusname from TransactionFinanceStatusMapping as TF where VD.FinanceStatusId= TF.FinanceStatusId and TF.CountryId=VD.CountryId)
   ,VD.FinanceStatusNotes  
   ,VD.FinanceStatusId  
   ,VD.FirstName    
   ,VD.LastName    
   ,VD.CompanyName    
   ,VD.IsBlockAutomaticUpdate    
   ,VD.APICompanyId    
   ,VD.IsApiUpdate    
   ,(CASE WHEN VD.BusinessManagerId IS NOT NULL THEN VD.BusinessManager    
   ELSE (CASE WHEN VD.ReferenceNumber IS NOT NULL OR VD.ReferenceNumber != '' THEN VD.TransactionAPIOwnerUser ELSE VD.CreatedByUser END) END),    
   null    
   --(CASE WHEN VD.BusinessManagerId IS NOT NULL THEN VD.LastName ELSE(CASE WHEN VD.ReferenceNumber IS NOT NULL then VD.LastName ELSE NULL end)END)     
     ,CASE WHEN VD.IsIncepted=1 THEN 0 ELSE(    
   CASE WHEN TD.IsAdmin=1 THEN 1 ELSE(    
     CASE WHEN VD.BusinessManagerId IS NULL THEN (    
     CASE WHEN VD.ReferenceNumber IS NULL OR VD.ReferenceNumber='' THEN (    
     CASE WHEN TD.UserId = VD.CreatedBy THEN 1 ELSE 0 END) ELSE (    
     CASE WHEN VD.TransactionAPIOwner IS NULL THEN 1 ELSE (    
     CASE WHEN TD.UserId = VD.TransactionAPIOwner THEN 1 ELSE 0 END) END) END)    
     ELSE (CASE WHEN TD.UserId=VD.BusinessManagerId THEN 1 ELSE 0 END) END) END) END    
    ,VD.FinanceAccountNumber
	 ,VD.DICAmount  
	 ,VD.IsCashTransaction
   --(CASE WHEN VD.ReferenceNumber IS NULL OR VD.ReferenceNumber='' THEN (CASE WHEN TD.UserId=VD.CreatedBy THEN 1 ELSE 0 END) END    
      
  FROM ViewTransaction VD WITH (NOLOCK) INNER JOIN     
  UserTransactionMapping UTM WITH (NOLOCK) on VD.TransactionId=UTM.TransactionID and UTM.UserID is NULL and UTM.ModifiedDate is NULL    
    ,#TempAdvanceSearchDetails TD WITH (NOLOCK)    
        
   WHERE  NOT EXISTS(SELECT id from #TempTransactionDetail TTD WITH (NOLOCK) where TTD.Id=VD.TransactionId     
  ) AND VD.CountryId = TD.CountryId    
  
  AND VD.IsCashTransaction = (CASE WHEN @IsBanker=1 THEN 0 ELSE VD.IsCashTransaction END)      
  AND (TD.Id IS NULL    
  OR VD.TransactionId = TD.Id)    
  AND (TD.ReferenceNumber IS NULL    
  OR VD.ReferenceNumber LIKE ('%' + TD.ReferenceNumber + '%') COLLATE DATABASE_DEFAULT)    
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
  --AND (TD.CreatedFrom IS NULL    
  --OR (TD.CreatedFrom IS NOT NULL    
  --AND VD.CreatedDate >= TD.CreatedFrom))    
  --AND (TD.CreatedTo IS NULL    
  --OR (TD.CreatedTo IS NOT NULL    
  --AND VD.CreatedDate <= TD.CreatedTo))    
   AND (TD.InceptedFrom IS NULL    
   OR (TD.InceptedFrom IS NOT NULL    
   AND VD.InceptDate >= TD.InceptedFrom))    
   AND (TD.InceptedTo IS NULL    
   OR (TD.InceptedTo IS NOT NULL    
   AND VD.InceptDate < TD.InceptedTo))    
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
  AND ((TD.BusinessManagerId IS NULL)    
  OR (TD.BusinessManagerId IS NULL    
  AND TD.BusinessManagerId != 0)    
  OR (TD.BusinessManagerId != 0    
  AND TD.BusinessManagerId IS NOT NULL    
  AND (CASE    
   WHEN VD.BusinessManagerId IS NOT NULL THEN VD.BusinessManagerId    
   ELSE VD.CreatedBy    
  END) = TD.BusinessManagerId)    
  OR (TD.BusinessManagerId != 0    
  AND TD.BusinessManagerId IS NOT NULL    
  AND (CASE    
   WHEN VD.BusinessManagerId IS NULL AND    
    VD.TransactionAPIOwner IS NOT NULL AND    
    VD.ReferenceNumber IS NOT NULL THEN VD.TransactionAPIOwner    
   ELSE NULL    
  END) = TD.BusinessManagerId)    
  OR (TD.BusinessManagerId = 0    
  AND (VD.BusinessManagerId IS NULL    
  AND VD.TransactionAPIOwner IS NULL    
  AND VD.ReferenceNumber IS NOT NULL)))    
    
  AND (vd.BranchId IN (SELECT    
    *    
   FROM dbo.SplitString(@BranchIdString, ','))    
  )    
  AND (TD.FinanceCompanyId IS NULL    
  OR (TD.FinanceCompanyId != 0    
  AND (SELECT    
    CompanyCompanyTypeId    
   FROM DealTrackerReportAnalytics DT WITH (NOLOCK)    
   WHERE AnalyticsTypeId = 1    
   AND DT.TransactionId = TD.Id)    
  = TD.FinanceCompanyId))    
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
  -------------------------------------------------Private Sales Person Changes---------------------------------------
  --And ((@isPrivateSalesPerson = 'PSP'  and ((VD.SalesPersonId  IN (select sspm.SalesPersonid FROM SuitcaseSalesPersonMapping sspm
  --where sspm.TransactionAccess=1 
  --and sspm.userid=(select UserId from #TempAdvanceSearchDetails) and (DeactivationDate<GETDATE() or DeactivationDate is null)) or vd.createdby =TD.UserId ))) or (@isPrivateSalesPerson=''))
  And ((@isPrivateSalesPerson = 'PSP'  and (
  (VD.SalesPersonId  IN (select sspm.SalesPersonid FROM SuitcaseSalesPersonMapping sspm  where sspm.TransactionAccess=1  and sspm.IsActive=1 
  and sspm.userid=(select UserId from #TempAdvanceSearchDetails) 
  and (sspm.DeactivationDate>=GETDATE() or sspm.DeactivationDate is null)) or (vd.createdby =TD.UserId  
  and (VD.SalesPersonId IN (select sspm.SalesPersonid FROM SuitcaseSalesPersonMapping sspm  where sspm.TransactionAccess=1  and sspm.IsActive=1 
  and sspm.userid=(select UserId from #TempAdvanceSearchDetails) and (sspm.DeactivationDate>=GETDATE() or sspm.DeactivationDate is null)) 
  or  VD.SalesPersonId is null)) ))) or (@isPrivateSalesPerson=''))

  ----------------------------------------------- Banker Role-----------------------------------------------------------
  --AND (@IsBanker=1 AND (VD.TransactionId IN (SELECT DA.TransactionId FROM UserCompanyMapping UC 
		--				INNER JOIN DealTrackerReportAnalytics DA ON UC.CompanyCompanyTypeId=DA.CompanyCompanyTypeId
		--				WHERE DA.TransactionId=VD.TransactionId and DA.AnalyticsTypeId=1 and UC.UserId=@LogedInUserId and UC.IsActive=1 and UC.CountryId=VD.CountryId
		--				GROUP BY DA.TransactionId)) OR @IsBanker=0)
    ------------------------------------------------------------------------------------------------------------------

  ORDER BY VD.ModifiedDate DESC

    
--select  @transactionCount=COUNT(Id)     
--from #TempTransactionDetail    
 
--SELECT  @transactionCount= CASE WHEN COUNT(Id) < 100  THEN COUNT(Id) ELSE 100 END 
--FROM #TempTransactionDetail 
 
    
    
    
--SELECT    
-- *    
--FROM (SELECT    
--  ROW_NUMBER() OVER (ORDER BY RecordNo) AS RowNum    
--  ,*    
-- FROM #TempTransactionDetail WITH (NOLOCK)) AS RowConstrainedResult     
--WHERE RowNum > @start    
--AND RowNum <= @start + @size    
--ORDER BY RowNum  


 IF(@IsBanker=1)
 BEGIN
		 SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY RecordNo) AS RowNum ,* FROM #TempTransactionDetail TT
		 INNER JOIN  (SELECT DISTINCT DA.TransactionId,UC.CountryId AS Country FROM UserCompanyMapping UC 
					 INNER JOIN DealTrackerReportAnalytics DA ON UC.CompanyCompanyTypeId=DA.CompanyCompanyTypeId
					 INNER JOIN FinanceApplicationHistory FAH ON FAH.CompanyCompanyTypeID=UC.CompanyCompanyTypeId 
																 --AND DA.AnalyticsTypeId=1 
																 AND (DA.AnalyticsTypeId=1 OR (UC.CompanyCompanyTypeId IN(SELECT CompanyCompanyTypeId FROM FinanceApplicationHistory WHERE [Action]='APPLY'))) 
																 AND UC.UserId=@LogedInUserId 
																 and UC.IsActive=1 ) TDA 
					 ON TDA.TransactionId=TT.Id and TT.CountryId=TDA.Country
		) AS RowConstrainedResult     
			WHERE RowNum > @start    
			AND RowNum <= @start + @size    
			ORDER BY RowNum 

			SELECT  @transactionCount= CASE WHEN COUNT(Id) < 100  THEN COUNT(Id) ELSE 100 END 
			FROM #TempTransactionDetail TT
			INNER JOIN  (SELECT DISTINCT DA.TransactionId,UC.CountryId AS Country FROM UserCompanyMapping UC 
					 INNER JOIN DealTrackerReportAnalytics DA ON UC.CompanyCompanyTypeId=DA.CompanyCompanyTypeId
					 INNER JOIN FinanceApplicationHistory FAH ON FAH.CompanyCompanyTypeID=UC.CompanyCompanyTypeId 
																 --AND DA.AnalyticsTypeId=1 
																 AND (DA.AnalyticsTypeId=1 OR (UC.CompanyCompanyTypeId IN(SELECT CompanyCompanyTypeId FROM FinanceApplicationHistory WHERE [Action]='APPLY'))) 
																 AND UC.UserId=@LogedInUserId 
																 AND UC.IsActive=1) TDA 
					 ON TDA.TransactionId=TT.Id and TT.CountryId=TDA.Country 
 END  
 ELSE
 BEGIN
		SELECT    
			*    
		FROM (

		SELECT    
			ROW_NUMBER() OVER (ORDER BY RecordNo) AS RowNum    
			,*    
			FROM #TempTransactionDetail
 
			WITH (NOLOCK)) AS RowConstrainedResult     
		WHERE RowNum > @start    
		AND RowNum <= @start + @size    
		ORDER BY RowNum    

		SELECT  @transactionCount= CASE WHEN COUNT(Id) < 100  THEN COUNT(Id) ELSE 100 END 
		FROM #TempTransactionDetail 
   END 

  
    
--SELECT * FROM @Employee_Details    
--SELECT top 100 * FROM #TempTransactionDetail    
   
    
END
