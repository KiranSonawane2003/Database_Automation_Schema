
CREATE PROCEDURE [dbo].[spGetDealTrackerReport]  
  
@TransactionId   NVARCHAR(max),  
@CountryID    BIGINT,  
@CompanyCompanyTypeIds NVARCHAR(max),  
@AppliedForFinance  BIGINT,  
@ApplicationApproved BIGINT,  
@ContractSigned   BIGINT,  
@PayoutRequested  BIGINT,
@PurchaseOrderIssued BIGINT,
@Declined BIGINT,
@DealNotTakenUp BIGINT,
@CustomerCancelled BIGINT,
@CompanyTakenUpIds  NVARCHAR(max)  
AS   
  
BEGIN  

DECLARE @IsGeneric BIT  
DECLARE @UTCTimeOffset BIGINT  
SELECT @IsGeneric=IsGeneric, @UTCTimeOffset=ISNULL(UTCTimeOffset,0) FROM Country WHERE Id=@CountryId  
  
---if table already exist then drop   
IF OBJECT_ID('tempdb..#TempDealTrackerReport') IS NOT NULL  
    BEGIN  
DROP TABLE #TempDealTrackerReport  
END  
  
---if table already exist then drop   
IF OBJECT_ID('tempdb..#TempDealTrackerAnalytics') IS NOT NULL BEGIN  
DROP TABLE #TempDealTrackerAnalytics  
END  
  
  
-- Create a table to store final output  
CREATE TABLE #TempDealTrackerReport(  
   TransactionId BIGINT,  
   CashTransaction NVARCHAR(200),  
   ClientName  NVARCHAR(max),  
   BusinessManagerName NVARCHAR(max),  
   SalesPersonName NVARCHAR(max),  
   CreatedDate NVARCHAR(200),  
   CreatedBy NVARCHAR(200),  
   CustomerAccessFinApp NVARCHAR(200),  
   FinanceCompany NVARCHAR(200),  
   CompanyCompanyTypeId BIGINT,  
   FinanceApplicationFinanceStatus NVARCHAR(200),  
   FirstApplyDate NVARCHAR(200),  
   NumberOfTimesApplied BIGINT,  
   CreateToApplyDate DATETIME,  
   AppliedToApprovedDate DATETIME,  
   ApprovedToContractSignedDate DATETIME,  
   ContractSignedToPayoutRequestDate DATETIME,  
   CreateToApply NVARCHAR(200),  
   AppliedToApproved NVARCHAR(200),  
   ApprovedToContractSigned NVARCHAR(200),  
   ContractSignedToIncept NVARCHAR(200),  
   ContractSignedToPayoutRequest NVARCHAR(200),  
   PayoutRequestToPaidOut NVARCHAR(200),  
   CreateToCallBackCustomer NVARCHAR(200),  
   DealDeclined NVARCHAR(200),  
   ResidualValue DECIMAL(18,2),  
   InceptToVehicleDelivery NVARCHAR(200),  
   CreateToIncept NVARCHAR(200),  
   CreateToPaidOut NVARCHAR(200),  
   DebtorsDays NVARCHAR(200),  
   TransactionStatus NVARCHAR(200),  
   TransactionAmount DECIMAL(18,2),  
   DICAmount DECIMAL(18,2),  
   GroupName NVARCHAR(200),  
   BranchName NVARCHAR(200),  
   FinanceType NVARCHAR(200),  
   FinanceCompanyTakenUp NVARCHAR(200),  
   FinanceTerm BIGINT,  
   Rate DECIMAL(18,2),  
   IsCashTransaction BIT,  
   IsIncepted BIT,     
   CompanyId BIGINT,  
   CreateDateTime DATETIME,  
   InceptDate DATETIME,  
   VehicleDeliveryDate DATETIME,  
   DocInvoicePaidDate DATETIME,  
   DocInvoiceDate DATETIME,  
   PayOutRequestDate   DATETIME,  
   CallBackCustomerDateTime DATETIME,  
   DeclineDateTime DateTime,  
   AppliedForFinance nvarchar(50),     
   FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled nvarchar(50),  
   ReceivedByFAndI nvarchar(50),  
   FirstAppliedToPurchaseOrderIssued nvarchar(50),  
   FirstAppliedToPaidOut nvarchar(50),  
   ApprovedToPurchaseOrderIssued nvarchar(50),  
   PurchaseOrderIssuedToIncept nvarchar(50),  
   FirstAppliedToIncept nvarchar(50),  
   AppliedToCustomerCancelled nvarchar(50),  
   AppliedToDeclined nvarchar(50),  
   PurchaseOrderIssuedDate datetime,  
   DealNotTakenDate datetime,  
   CustomerCancelledDate datetime,  
   ReceivedByFAndIDate datetime,  
   FinanceDeclinedDate datetime,  
  FinanceStatusId bigint,
  FinanceStatus nvarchar(200)
  
)  
  
  
--Create Clustered Index on #TempDealTrackerReport  
--CREATE CLUSTERED INDEX ix_TempDealTrackerReport ON #TempDealTrackerReport ([TransactionId],[CompanyCompanyTypeId]);  
  
-- Create a table to store final output  
CREATE TABLE #TempDealTrackerAnalytics(  
   Id BIGINT,  
   TransactionId BIGINT,  
   CompanyCompanyTypeId BIGINT,  
   FinanceStatusId BIGINT,  
   AnalyticsTypeId BIGINT,  
   CreatedDate DATETIME,  
   CompanyName NVARCHAR(200)  
   )  

	--Get non cash transaction list
	IF((@CompanyCompanyTypeIds ='' AND @CompanyTakenUpIds=''))
	INSERT INTO #TempDealTrackerReport  
	SELECT T.TransactionId,  
	T.CashTransaction,  
	T.Customer AS ClientName,  
	T.BusinessManager AS 'BusinessManagerName',  
	T.SalesPerson AS SalesPersonName,  
	FORMAT(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreatedDate), 'dd-MMM-yy HH:mm:ss' ) AS CreatedDate,  
	T.CreatedByUser AS 'CreatedBy',  
	'' AS CustomerAccessFinApp ,  
	'' AS FinanceCompany,  
	FA.CompanyCompanyTypeId AS CompanyCompanyTypeId,  
	-- Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  (SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId) else  '' end AS FinanceApplicationFinanceStatus,
	CASE WHEN T.IsCashTransaction=0 then concat((SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId),
	'|', Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.financestatus else ' ' end ) else ' ' end AS FinanceApplicationFinanceStatus,
	---facompany,fastatusid|tcompany,tfstatusid   AS FinanceApplicationFinanceStatus
	-- +'|'+isnull(FinanceStatus,'')
	'' AS FirstApplyDate,  
	NULL AS NumberOfTimesApplied,  
	NULL AS CreateToApplyDate,  
	NULL AS AppliedToApprovedDate,  
	NULL AS ApprovedToContractSignedDate,  
	NULL AS ContractSignedToPayoutRequestDate,  
	'' AS CreateToApply,  
	'' AS AppliedToApproved,  
	'' AS ApprovedToContractSigned,  
	'' AS ContractSignedToIncept,  
	'' AS ContractSignedToPayoutRequest,  
	'' AS PayoutRequestToPaidOut,  
	'' AS CreateToCallBackCustomer,  
	'' AS DealDeclined,  
	T.BalloonValue AS ResidualValue,  
	'' AS InceptToVehicleDelivery,  
	'' AS CreateToIncept,  
	'' AS CreateToPaidOut,  
	'' AS DebtorsDays,  
	T.TransactionStatus,  
	CASE WHEN T.IsCashTransaction=0 THEN  T.TotalFinanceAmount ELSE T.TotalCashAmount END  AS TransactionAmount,  
	T.DICAmount AS DICAmount,  
	T.GroupName AS 'Group',  
	T.BranchName AS 'Branch',  
	CASE WHEN T.IsCashTransaction=0 THEN  T.FinanceTypeName ELSE '' END  AS 'FinanceType',  
	CASE WHEN T.IsCashTransaction=0 THEN  Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.FinanceCompanyName else '' end ELSE '' END AS FinanceCompanyTakenUp,   
	CASE WHEN T.IsCashTransaction=0  THEN    T.FinanceTerm ELSE NULL END AS 'Term',  
	CASE WHEN T.IsCashTransaction=0  THEN    T.InterestRate  ELSE NULL END AS 'Rate',  
	T.IsCashTransaction,  
	T.IsIncepted,  
	FA.CompanyId,  
	T.CreatedDate,  
	T.InceptDate,  
	T.VehicleDeliveryDate,  
	T.DocInvoicePaidDate,  
	T.DocInvoiceDate,  
	T.PayOutRequestDate,  
	T.CallBackCustomerDateTime,  
	T.DeclineDateTime,  
	T.AppliedForFinance,  
	'' AS ReceivedByFAndI,  
	'' AS FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled,  
	'' AS FirstAppliedToPurchaseOrderIssued ,  
	'' AS FirstAppliedToPaidOut ,  
	'' AS ApprovedToPurchaseOrderIssued,  
	'' AS PurchaseOrderIssuedToIncept ,  
	'' AS FirstAppliedToIncept ,  
	'' AS AppliedToCustomerCancelled ,  
	'' AS AppliedToDeclined,  
	null AS  PurchaseOrderIssuedDate,  
	T.DealNotTakenDate,  
	T.CustomerCancelledDate,  
	T.ReceivedByFAndIDate,  
	null FinanceDeclinedDate,
	T.FinanceStatusId,
	(SELECT  NAME FROM staticvalue WHERE id=T.financestatusid) as FinanceStatus
     
    FROM dbo.ViewTransaction AS T WITH (NOLOCK)  
	LEFT JOIN TransactionFinanceApplication FA WITH (NOLOCK) ON FA.TransactionId = T.TransactionId AND FA.IsActive=1 
	AND FA.CompanyCompanyTypeid  IN (SELECT CompanyCompanyTypeid FROM  DealTrackerReportAnalytics D 
									  WHERE D.TransactionId IN (SELECT item FROM dbo.SplitString(@TransactionId, ',')) 
									  AND D.AnalyticsTypeId=1)
	LEFT JOIN DealTrackerReportAnalytics DA WITH (NOLOCK)  ON DA.TransactionId= T.TransactionId and DA.AnalyticsTypeId=1 
	LEFT JOIN InceptTransaction IT  WITH (NOLOCK)  ON IT.TransactionId= T.TransactionId
	WHERE T.CashTransaction='NO' 
	AND T.TransactionId IN (SELECT item FROM dbo.SplitString(@TransactionId, ','))  
	AND ((@CompanyCompanyTypeIds!='' AND FA.CompanyCompanyTypeId IN (SELECT item FROM dbo.SplitString(@CompanyCompanyTypeIds, ','))) OR @CompanyCompanyTypeIds='')
	AND ((@CompanyTakenUpIds!='' AND FA.CompanyCompanyTypeId=DA.CompanyCompanyTypeId AND FA.CompanyCompanyTypeId IN (SELECT item FROM dbo.SplitString(@CompanyTakenUpIds, ','))) OR @CompanyTakenUpIds='') 
	AND DA.AnalyticsTypeId=1
	--AND DA.AnalyticsTypeId=1
	
	--AND (
	--		(
	--		@CompanyCompanyTypeIds!=''  AND FA.CompanyCompanyTypeId IN (SELECT  item FROM dbo.SplitString(@CompanyCompanyTypeIds, ',')) 
	--		) 
	--		OR @CompanyCompanyTypeIds=''
	--	)
	--	AND (
	--		(
	--			@CompanyTakenUpIds!='' AND FA.CompanyCompanyTypeId=IT.FinanceCompanyId AND IT.FinanceCompanyId IN (SELECT item FROM dbo.SplitString(@CompanyTakenUpIds, ','))
	--		) 
	--		OR (@CompanyTakenUpIds='')
	--	)
	ELSE IF(@CompanyCompanyTypeIds LIKE '%-1%' AND @CompanyTakenUpIds LIKE '%-1%')
	INSERT INTO #TempDealTrackerReport  
	SELECT T.TransactionId,  
		T.CashTransaction,  
		T.Customer AS ClientName,  
		T.BusinessManager AS 'BusinessManagerName',  
		T.SalesPerson AS SalesPersonName,  
		FORMAT(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreatedDate), 'dd-MMM-yy HH:mm:ss' ) AS CreatedDate,  
		T.CreatedByUser AS 'CreatedBy',  
		'' AS CustomerAccessFinApp ,  
		'' AS FinanceCompany,  
		FA.CompanyCompanyTypeId AS CompanyCompanyTypeId,  
		-- Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  (SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId) else  '' end AS FinanceApplicationFinanceStatus,


		CASE WHEN T.IsCashTransaction=0 then concat((SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId),
		'|', Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.financestatus else ' ' end ) else ' ' end AS FinanceApplicationFinanceStatus,


		---facompany,fastatusid|tcompany,tfstatusid   AS FinanceApplicationFinanceStatus
		-- +'|'+isnull(FinanceStatus,'')
		'' AS FirstApplyDate,  
		NULL AS NumberOfTimesApplied,  
		NULL AS CreateToApplyDate,  
		NULL AS AppliedToApprovedDate,  
		NULL AS ApprovedToContractSignedDate,  
		NULL AS ContractSignedToPayoutRequestDate,  
		'' AS CreateToApply,  
		'' AS AppliedToApproved,  
		'' AS ApprovedToContractSigned,  
		'' AS ContractSignedToIncept,  
		'' AS ContractSignedToPayoutRequest,  
		'' AS PayoutRequestToPaidOut,  
		'' AS CreateToCallBackCustomer,  
		'' AS DealDeclined,  
		T.BalloonValue AS ResidualValue,  
		'' AS InceptToVehicleDelivery,  
		'' AS CreateToIncept,  
		'' AS CreateToPaidOut,  
		'' AS DebtorsDays,  
		T.TransactionStatus,  
		CASE WHEN T.IsCashTransaction=0 THEN  T.TotalFinanceAmount ELSE T.TotalCashAmount END  AS TransactionAmount,  
		T.DICAmount AS DICAmount,  
		T.GroupName AS 'Group',  
		T.BranchName AS 'Branch',  
		CASE WHEN T.IsCashTransaction=0 THEN  T.FinanceTypeName ELSE '' END  AS 'FinanceType',  
		CASE WHEN T.IsCashTransaction=0 THEN  Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.FinanceCompanyName else '' end ELSE '' END AS FinanceCompanyTakenUp,   
		CASE WHEN T.IsCashTransaction=0  THEN    T.FinanceTerm ELSE NULL END AS 'Term',  
		CASE WHEN T.IsCashTransaction=0  THEN    T.InterestRate  ELSE NULL END AS 'Rate',  
		T.IsCashTransaction,  
		T.IsIncepted,  
		FA.CompanyId,  
		T.CreatedDate,  
		T.InceptDate,  
		T.VehicleDeliveryDate,  
		T.DocInvoicePaidDate,  
		T.DocInvoiceDate,  
		T.PayOutRequestDate,  
		T.CallBackCustomerDateTime,  
		T.DeclineDateTime,  
		T.AppliedForFinance,  
		'' AS ReceivedByFAndI,  
		'' AS FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled,  
		'' AS FirstAppliedToPurchaseOrderIssued ,  
		'' AS FirstAppliedToPaidOut ,  
		'' AS ApprovedToPurchaseOrderIssued,  
		'' AS PurchaseOrderIssuedToIncept ,  
		'' AS FirstAppliedToIncept ,  
		'' AS AppliedToCustomerCancelled ,  
		'' AS AppliedToDeclined,  
		null AS  PurchaseOrderIssuedDate,  
		T.DealNotTakenDate,  
		T.CustomerCancelledDate,  
		T.ReceivedByFAndIDate,  
		null FinanceDeclinedDate,
		T.FinanceStatusId,
		(SELECT  NAME FROM staticvalue WHERE id=T.financestatusid) as FinanceStatus
     
		FROM dbo.ViewTransaction AS T WITH (NOLOCK)  
		LEFT JOIN TransactionFinanceApplication FA WITH (NOLOCK) ON FA.TransactionId = T.TransactionId AND FA.IsActive=1   and FA.CompanyCompanyTypeid  in (select TOP 1 CompanyCompanyTypeid from  DealTrackerReportAnalytics D where D.transactionid in (SELECT  
		item  
		FROM dbo.SplitString(@TransactionId, ',')) AND D.AnalyticsTypeId=1)
		LEFT JOIN DealTrackerReportAnalytics DA WITH (NOLOCK)  ON DA.TransactionId= T.TransactionId AND DA.AnalyticsTypeId=1
		LEFT JOIN InceptTransaction IT  WITH (NOLOCK)  ON IT.TransactionId= T.TransactionId and IT.IsIncepted=0
		WHERE T.CashTransaction='NO' AND T.TransactionId IN (SELECT item FROM dbo.SplitString(@TransactionId, ','))  
		--AND (
		--	(
		--	@CompanyCompanyTypeIds!=''  AND FA.CompanyCompanyTypeId IN (SELECT  item FROM dbo.SplitString(@CompanyCompanyTypeIds, ','))
		--	) 
		--	OR @CompanyCompanyTypeIds=''
		--)
		--AND (
		--	(
		--		@CompanyTakenUpIds!='' AND FA.CompanyCompanyTypeId=IT.FinanceCompanyId AND IT.FinanceCompanyId IN (SELECT item FROM dbo.SplitString(@CompanyTakenUpIds, ','))
		--	) 
		--	OR (@CompanyTakenUpIds='')
		--)
		AND T.TransactionId NOT IN (SELECT DISTINCT TransactionId from DealTrackerReportAnalytics Where AnalyticsTypeId=1) 
		AND DA.AnalyticsTypeId=1
	ELSE IF ((@CompanyCompanyTypeIds LIKE '%-1%' AND @CompanyTakenUpIds = ''))
	INSERT INTO #TempDealTrackerReport  
	SELECT T.TransactionId,  
		T.CashTransaction,  
		T.Customer AS ClientName,  
		T.BusinessManager AS 'BusinessManagerName',  
		T.SalesPerson AS SalesPersonName,  
		FORMAT(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreatedDate), 'dd-MMM-yy HH:mm:ss' ) AS CreatedDate,  
		T.CreatedByUser AS 'CreatedBy',  
		'' AS CustomerAccessFinApp ,  
		'' AS FinanceCompany,  
		FA.CompanyCompanyTypeId AS CompanyCompanyTypeId,  
		-- Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  (SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId) else  '' end AS FinanceApplicationFinanceStatus,


		CASE WHEN T.IsCashTransaction=0 then concat((SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId),
		'|', Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.financestatus else ' ' end ) else ' ' end AS FinanceApplicationFinanceStatus,


		---facompany,fastatusid|tcompany,tfstatusid   AS FinanceApplicationFinanceStatus
		-- +'|'+isnull(FinanceStatus,'')
		'' AS FirstApplyDate,  
		NULL AS NumberOfTimesApplied,  
		NULL AS CreateToApplyDate,  
		NULL AS AppliedToApprovedDate,  
		NULL AS ApprovedToContractSignedDate,  
		NULL AS ContractSignedToPayoutRequestDate,  
		'' AS CreateToApply,  
		'' AS AppliedToApproved,  
		'' AS ApprovedToContractSigned,  
		'' AS ContractSignedToIncept,  
		'' AS ContractSignedToPayoutRequest,  
		'' AS PayoutRequestToPaidOut,  
		'' AS CreateToCallBackCustomer,  
		'' AS DealDeclined,  
		T.BalloonValue AS ResidualValue,  
		'' AS InceptToVehicleDelivery,  
		'' AS CreateToIncept,  
		'' AS CreateToPaidOut,  
		'' AS DebtorsDays,  
		T.TransactionStatus,  
		CASE WHEN T.IsCashTransaction=0 THEN  T.TotalFinanceAmount ELSE T.TotalCashAmount END  AS TransactionAmount,  
		T.DICAmount AS DICAmount,  
		T.GroupName AS 'Group',  
		T.BranchName AS 'Branch',  
		CASE WHEN T.IsCashTransaction=0 THEN  T.FinanceTypeName ELSE '' END  AS 'FinanceType',  
		CASE WHEN T.IsCashTransaction=0 THEN  Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.FinanceCompanyName else '' end ELSE '' END AS FinanceCompanyTakenUp,   
		CASE WHEN T.IsCashTransaction=0  THEN    T.FinanceTerm ELSE NULL END AS 'Term',  
		CASE WHEN T.IsCashTransaction=0  THEN    T.InterestRate  ELSE NULL END AS 'Rate',  
		T.IsCashTransaction,  
		T.IsIncepted,  
		FA.CompanyId,  
		T.CreatedDate,  
		T.InceptDate,  
		T.VehicleDeliveryDate,  
		T.DocInvoicePaidDate,  
		T.DocInvoiceDate,  
		T.PayOutRequestDate,  
		T.CallBackCustomerDateTime,  
		T.DeclineDateTime,  
		T.AppliedForFinance,  
		'' AS ReceivedByFAndI,  
		'' AS FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled,  
		'' AS FirstAppliedToPurchaseOrderIssued ,  
		'' AS FirstAppliedToPaidOut ,  
		'' AS ApprovedToPurchaseOrderIssued,  
		'' AS PurchaseOrderIssuedToIncept ,  
		'' AS FirstAppliedToIncept ,  
		'' AS AppliedToCustomerCancelled ,  
		'' AS AppliedToDeclined,  
		null AS  PurchaseOrderIssuedDate,  
		T.DealNotTakenDate,  
		T.CustomerCancelledDate,  
		T.ReceivedByFAndIDate,  
		null FinanceDeclinedDate,
		T.FinanceStatusId,
		(SELECT  NAME FROM staticvalue where id=T.financestatusid) as FinanceStatus
     
		FROM dbo.ViewTransaction AS T WITH (NOLOCK)  
		LEFT JOIN TransactionFinanceApplication FA WITH (NOLOCK) ON FA.TransactionId = T.TransactionId AND FA.IsActive=1   and FA.CompanyCompanyTypeid  in (select CompanyCompanyTypeid from  DealTrackerReportAnalytics d where d.transactionid in (SELECT  
		item  
		FROM dbo.SplitString(@TransactionId, ',')) and d.AnalyticsTypeId=1)
		LEFT JOIN DealTrackerReportAnalytics DA WITH (NOLOCK)  ON DA.TransactionId= T.TransactionId and DA.AnalyticsTypeId=1
		LEFT JOIN InceptTransaction IT  WITH (NOLOCK)  ON IT.TransactionId= T.TransactionId
		WHERE T.CashTransaction='NO' AND T.TransactionId IN (SELECT item FROM dbo.SplitString(@TransactionId, ',')) 
		AND (
				(
				@CompanyCompanyTypeIds!='' AND FA.CompanyCompanyTypeId IN (SELECT  item FROM dbo.SplitString(@CompanyCompanyTypeIds, ',')) 
				) 
				OR @CompanyCompanyTypeIds=''
			)
		AND (
				(
					@CompanyTakenUpIds!='' AND FA.CompanyCompanyTypeId=IT.FinanceCompanyId AND IT.FinanceCompanyId IN (SELECT item FROM dbo.SplitString(@CompanyTakenUpIds, ',')) AND T.IsIncepted=1
				) 
				OR (@CompanyTakenUpIds='')
			)  
		AND DA.AnalyticsTypeId=1 
		--AND T.TransactionId NOT IN (Select Distinct TransactionId from DealTrackerReportAnalytics Where AnalyticsTypeId=1)  
		AND DA.AnalyticsTypeId=1
	ELSE IF ((@CompanyCompanyTypeIds='' AND @CompanyTakenUpIds = '-1'))
	INSERT INTO #TempDealTrackerReport  
	SELECT T.TransactionId,  
		T.CashTransaction,  
		T.Customer AS ClientName,  
		T.BusinessManager AS 'BusinessManagerName',  
		T.SalesPerson AS SalesPersonName,  
		FORMAT(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreatedDate), 'dd-MMM-yy HH:mm:ss' ) AS CreatedDate,  
		T.CreatedByUser AS 'CreatedBy',  
		'' AS CustomerAccessFinApp ,  
		'' AS FinanceCompany,  
		FA.CompanyCompanyTypeId AS CompanyCompanyTypeId,  
		-- Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  (SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId) else  '' end AS FinanceApplicationFinanceStatus,


		CASE WHEN T.IsCashTransaction=0 then concat((SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId),
		'|', Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.financestatus else ' ' end ) else ' ' end AS FinanceApplicationFinanceStatus,


		---facompany,fastatusid|tcompany,tfstatusid   AS FinanceApplicationFinanceStatus
		-- +'|'+isnull(FinanceStatus,'')
		'' AS FirstApplyDate,  
		NULL AS NumberOfTimesApplied,  
		NULL AS CreateToApplyDate,  
		NULL AS AppliedToApprovedDate,  
		NULL AS ApprovedToContractSignedDate,  
		NULL AS ContractSignedToPayoutRequestDate,  
		'' AS CreateToApply,  
		'' AS AppliedToApproved,  
		'' AS ApprovedToContractSigned,  
		'' AS ContractSignedToIncept,  
		'' AS ContractSignedToPayoutRequest,  
		'' AS PayoutRequestToPaidOut,  
		'' AS CreateToCallBackCustomer,  
		'' AS DealDeclined,  
		T.BalloonValue AS ResidualValue,  
		'' AS InceptToVehicleDelivery,  
		'' AS CreateToIncept,  
		'' AS CreateToPaidOut,  
		'' AS DebtorsDays,  
		T.TransactionStatus,  
		CASE WHEN T.IsCashTransaction=0 THEN  T.TotalFinanceAmount ELSE T.TotalCashAmount END  AS TransactionAmount,  
		T.DICAmount AS DICAmount,  
		T.GroupName AS 'Group',  
		T.BranchName AS 'Branch',  
		CASE WHEN T.IsCashTransaction=0 THEN  T.FinanceTypeName ELSE '' END  AS 'FinanceType',  
		CASE WHEN T.IsCashTransaction=0 THEN  Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.FinanceCompanyName else '' end ELSE '' END AS FinanceCompanyTakenUp,   
		CASE WHEN T.IsCashTransaction=0  THEN    T.FinanceTerm ELSE NULL END AS 'Term',  
		CASE WHEN T.IsCashTransaction=0  THEN    T.InterestRate  ELSE NULL END AS 'Rate',  
		T.IsCashTransaction,  
		T.IsIncepted,  
		FA.CompanyId,  
		T.CreatedDate,  
		T.InceptDate,  
		T.VehicleDeliveryDate,  
		T.DocInvoicePaidDate,  
		T.DocInvoiceDate,  
		T.PayOutRequestDate,  
		T.CallBackCustomerDateTime,  
		T.DeclineDateTime,  
		T.AppliedForFinance,  
		'' AS ReceivedByFAndI,  
		'' AS FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled,  
		'' AS FirstAppliedToPurchaseOrderIssued ,  
		'' AS FirstAppliedToPaidOut ,  
		'' AS ApprovedToPurchaseOrderIssued,  
		'' AS PurchaseOrderIssuedToIncept ,  
		'' AS FirstAppliedToIncept ,  
		'' AS AppliedToCustomerCancelled ,  
		'' AS AppliedToDeclined,  
		null AS  PurchaseOrderIssuedDate,  
		T.DealNotTakenDate,  
		T.CustomerCancelledDate,  
		T.ReceivedByFAndIDate,  
		null FinanceDeclinedDate,
		T.FinanceStatusId,
		(SELECT  NAME FROM staticvalue where id=T.financestatusid) as FinanceStatus
     
		FROM dbo.ViewTransaction AS T WITH (NOLOCK)  
		LEFT JOIN TransactionFinanceApplication FA WITH (NOLOCK) ON FA.TransactionId = T.TransactionId AND FA.IsActive=1   
		AND FA.CompanyCompanyTypeid  IN (SELECT CompanyCompanyTypeid from  DealTrackerReportAnalytics D 
		                                  where D.TransactionId IN (SELECT item  FROM dbo.SplitString(@TransactionId, ',')) ) 
		--AND FA.CompanyCompanyTypeid  IN (SELECT CompanyCompanyTypeId from (Select 
		--	ROW_NUMBER() Over(Partition By TransactionId,AnalyticsTypeId order by Id ) RowNo,
		--	* from DealTrackerReportAnalytics 
		--	Where TransactionId IN  (SELECT item  FROM dbo.SplitString(@TransactionId, ','))
		--	 ) as CompanyId
		--	Where CompanyId.RowNo=1 ) 
		LEFT JOIN DealTrackerReportAnalytics DA WITH (NOLOCK)  ON DA.TransactionId= T.TransactionId AND DA.AnalyticsTypeId=1
		LEFT JOIN InceptTransaction IT  WITH (NOLOCK)  ON IT.TransactionId= T.TransactionId AND IT.IsIncepted=0	
		WHERE T.CashTransaction='NO' 
		AND T.TransactionId IN (SELECT item FROM dbo.SplitString(@TransactionId, ','))  
		AND (
			(
			@CompanyCompanyTypeIds!='' AND FA.CompanyCompanyTypeId IN (SELECT  item FROM dbo.SplitString(@CompanyCompanyTypeIds, ','))
			) 
			OR @CompanyCompanyTypeIds=''
		)
		AND DA.AnalyticsTypeId=1
		AND T.IsIncepted=0
	ELSE IF ((@CompanyCompanyTypeIds='' AND @CompanyTakenUpIds LIKE '%-1%'))
	INSERT INTO #TempDealTrackerReport  
	SELECT T.TransactionId,  
	T.CashTransaction,  
	T.Customer AS ClientName,  
	T.BusinessManager AS 'BusinessManagerName',  
	T.SalesPerson AS SalesPersonName,  
	FORMAT(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreatedDate), 'dd-MMM-yy HH:mm:ss' ) AS CreatedDate,  
	T.CreatedByUser AS 'CreatedBy',  
	'' AS CustomerAccessFinApp ,  
	'' AS FinanceCompany,  
	FA.CompanyCompanyTypeId AS CompanyCompanyTypeId,  
	-- Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  (SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId) else  '' end AS FinanceApplicationFinanceStatus,


	CASE WHEN T.IsCashTransaction=0 then concat((SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId),
	'|', Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.financestatus else ' ' end ) else ' ' end AS FinanceApplicationFinanceStatus,


	---facompany,fastatusid|tcompany,tfstatusid   AS FinanceApplicationFinanceStatus
	-- +'|'+isnull(FinanceStatus,'')
	'' AS FirstApplyDate,  
	NULL AS NumberOfTimesApplied,  
	NULL AS CreateToApplyDate,  
	NULL AS AppliedToApprovedDate,  
	NULL AS ApprovedToContractSignedDate,  
	NULL AS ContractSignedToPayoutRequestDate,  
	'' AS CreateToApply,  
	'' AS AppliedToApproved,  
	'' AS ApprovedToContractSigned,  
	'' AS ContractSignedToIncept,  
	'' AS ContractSignedToPayoutRequest,  
	'' AS PayoutRequestToPaidOut,  
	'' AS CreateToCallBackCustomer,  
	'' AS DealDeclined,  
	T.BalloonValue AS ResidualValue,  
	'' AS InceptToVehicleDelivery,  
	'' AS CreateToIncept,  
	'' AS CreateToPaidOut,  
	'' AS DebtorsDays,  
	T.TransactionStatus,  
	CASE WHEN T.IsCashTransaction=0 THEN  T.TotalFinanceAmount ELSE T.TotalCashAmount END  AS TransactionAmount,  
	T.DICAmount AS DICAmount,  
	T.GroupName AS 'Group',  
	T.BranchName AS 'Branch',  
	CASE WHEN T.IsCashTransaction=0 THEN  T.FinanceTypeName ELSE '' END  AS 'FinanceType',  
	CASE WHEN T.IsCashTransaction=0 THEN  Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.FinanceCompanyName else '' end ELSE '' END AS FinanceCompanyTakenUp,   
	CASE WHEN T.IsCashTransaction=0  THEN    T.FinanceTerm ELSE NULL END AS 'Term',  
	CASE WHEN T.IsCashTransaction=0  THEN    T.InterestRate  ELSE NULL END AS 'Rate',  
	T.IsCashTransaction,  
	T.IsIncepted,  
	FA.CompanyId,  
	T.CreatedDate,  
	T.InceptDate,  
	T.VehicleDeliveryDate,  
	T.DocInvoicePaidDate,  
	T.DocInvoiceDate,  
	T.PayOutRequestDate,  
	T.CallBackCustomerDateTime,  
	T.DeclineDateTime,  
	T.AppliedForFinance,  
	'' AS ReceivedByFAndI,  
	'' AS FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled,  
	'' AS FirstAppliedToPurchaseOrderIssued ,  
	'' AS FirstAppliedToPaidOut ,  
	'' AS ApprovedToPurchaseOrderIssued,  
	'' AS PurchaseOrderIssuedToIncept ,  
	'' AS FirstAppliedToIncept ,  
	'' AS AppliedToCustomerCancelled ,  
	'' AS AppliedToDeclined,  
	null AS  PurchaseOrderIssuedDate,  
	T.DealNotTakenDate,  
	T.CustomerCancelledDate,  
	T.ReceivedByFAndIDate,  
	null FinanceDeclinedDate,
	T.FinanceStatusId,
	(SELECT  NAME FROM staticvalue where id=T.financestatusid) as FinanceStatus
     
	FROM dbo.ViewTransaction AS T WITH (NOLOCK)  
	LEFT JOIN TransactionFinanceApplication FA WITH (NOLOCK) ON FA.TransactionId = T.TransactionId AND FA.IsActive=1   
	AND FA.CompanyCompanyTypeid  IN (SELECT CompanyCompanyTypeid from  DealTrackerReportAnalytics D 
	                                  where D.TransactionId IN (SELECT item  FROM dbo.SplitString(@TransactionId, ',')) AND D.AnalyticsTypeId=1 ) 
	--AND FA.CompanyCompanyTypeid  IN (SELECT CompanyCompanyTypeId from (Select 
	--	ROW_NUMBER() Over(Partition By TransactionId,AnalyticsTypeId order by Id ) RowNo,
	--	* from DealTrackerReportAnalytics 
	--	Where TransactionId IN  (SELECT item  FROM dbo.SplitString(@TransactionId, ','))
	--	 ) as CompanyId
	--	Where CompanyId.RowNo=1 ) 
	LEFT JOIN DealTrackerReportAnalytics DA WITH (NOLOCK)  ON DA.TransactionId= T.TransactionId AND DA.AnalyticsTypeId=1
	LEFT JOIN InceptTransaction IT  WITH (NOLOCK)  ON IT.TransactionId= T.TransactionId
	WHERE T.CashTransaction='NO' AND T.TransactionId IN (SELECT item FROM dbo.SplitString(@TransactionId, ',')) 
	AND (
		(
		@CompanyCompanyTypeIds!='' AND FA.CompanyCompanyTypeId IN (SELECT  item FROM dbo.SplitString(@CompanyCompanyTypeIds, ','))
		) 
		OR @CompanyCompanyTypeIds=''
	)	
	
	AND T.TransactionId NOT IN (Select Distinct TransactionId from DealTrackerReportAnalytics Where AnalyticsTypeId=1) 
	AND DA.AnalyticsTypeId=1
	ELSE IF ((@CompanyCompanyTypeIds !='' AND @CompanyTakenUpIds LIKE '%-1%'))
	INSERT INTO #TempDealTrackerReport  
	SELECT T.TransactionId,  
		T.CashTransaction,  
		T.Customer AS ClientName,  
		T.BusinessManager AS 'BusinessManagerName',  
		T.SalesPerson AS SalesPersonName,  
		FORMAT(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreatedDate), 'dd-MMM-yy HH:mm:ss' ) AS CreatedDate,  
		T.CreatedByUser AS 'CreatedBy',  
		'' AS CustomerAccessFinApp ,  
		'' AS FinanceCompany,  
		FA.CompanyCompanyTypeId AS CompanyCompanyTypeId,  
		-- Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  (SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId) else  '' end AS FinanceApplicationFinanceStatus,


		CASE WHEN T.IsCashTransaction=0 then concat((SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId),
		'|', Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.financestatus else ' ' end ) else ' ' end AS FinanceApplicationFinanceStatus,


		---facompany,fastatusid|tcompany,tfstatusid   AS FinanceApplicationFinanceStatus
		-- +'|'+isnull(FinanceStatus,'')
		'' AS FirstApplyDate,  
		NULL AS NumberOfTimesApplied,  
		NULL AS CreateToApplyDate,  
		NULL AS AppliedToApprovedDate,  
		NULL AS ApprovedToContractSignedDate,  
		NULL AS ContractSignedToPayoutRequestDate,  
		'' AS CreateToApply,  
		'' AS AppliedToApproved,  
		'' AS ApprovedToContractSigned,  
		'' AS ContractSignedToIncept,  
		'' AS ContractSignedToPayoutRequest,  
		'' AS PayoutRequestToPaidOut,  
		'' AS CreateToCallBackCustomer,  
		'' AS DealDeclined,  
		T.BalloonValue AS ResidualValue,  
		'' AS InceptToVehicleDelivery,  
		'' AS CreateToIncept,  
		'' AS CreateToPaidOut,  
		'' AS DebtorsDays,  
		T.TransactionStatus,  
		CASE WHEN T.IsCashTransaction=0 THEN  T.TotalFinanceAmount ELSE T.TotalCashAmount END  AS TransactionAmount,  
		T.DICAmount AS DICAmount,  
		T.GroupName AS 'Group',  
		T.BranchName AS 'Branch',  
		CASE WHEN T.IsCashTransaction=0 THEN  T.FinanceTypeName ELSE '' END  AS 'FinanceType',  
		CASE WHEN T.IsCashTransaction=0 THEN  Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.FinanceCompanyName else '' end ELSE '' END AS FinanceCompanyTakenUp,   
		CASE WHEN T.IsCashTransaction=0  THEN    T.FinanceTerm ELSE NULL END AS 'Term',  
		CASE WHEN T.IsCashTransaction=0  THEN    T.InterestRate  ELSE NULL END AS 'Rate',  
		T.IsCashTransaction,  
		T.IsIncepted,  
		FA.CompanyId,  
		T.CreatedDate,  
		T.InceptDate,  
		T.VehicleDeliveryDate,  
		T.DocInvoicePaidDate,  
		T.DocInvoiceDate,  
		T.PayOutRequestDate,  
		T.CallBackCustomerDateTime,  
		T.DeclineDateTime,  
		T.AppliedForFinance,  
		'' AS ReceivedByFAndI,  
		'' AS FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled,  
		'' AS FirstAppliedToPurchaseOrderIssued ,  
		'' AS FirstAppliedToPaidOut ,  
		'' AS ApprovedToPurchaseOrderIssued,  
		'' AS PurchaseOrderIssuedToIncept ,  
		'' AS FirstAppliedToIncept ,  
		'' AS AppliedToCustomerCancelled ,  
		'' AS AppliedToDeclined,  
		null AS  PurchaseOrderIssuedDate,  
		T.DealNotTakenDate,  
		T.CustomerCancelledDate,  
		T.ReceivedByFAndIDate,  
		null FinanceDeclinedDate,
		T.FinanceStatusId,
		(select  name from staticvalue where id=T.financestatusid) as FinanceStatus
     
			FROM dbo.ViewTransaction AS T WITH (NOLOCK)  
		LEFT JOIN TransactionFinanceApplication FA WITH (NOLOCK) ON FA.TransactionId = T.TransactionId AND FA.IsActive=1   and FA.CompanyCompanyTypeid  in (select CompanyCompanyTypeid from  DealTrackerReportAnalytics d where d.transactionid in (SELECT  
		item  
		FROM dbo.SplitString(@TransactionId, ',')) and d.AnalyticsTypeId=1)
		LEFT JOIN DealTrackerReportAnalytics DA WITH (NOLOCK)  ON DA.TransactionId= T.TransactionId 
		LEFT JOIN InceptTransaction IT  WITH (NOLOCK)  ON IT.TransactionId= T.TransactionId
		WHERE T.CashTransaction='NO' AND T.TransactionId IN (SELECT item FROM dbo.SplitString(@TransactionId, ','))  
		AND (
				(
				@CompanyCompanyTypeIds!='' AND FA.CompanyCompanyTypeId IN (SELECT  item FROM dbo.SplitString(@CompanyCompanyTypeIds, ',')) 
				) 
				OR @CompanyCompanyTypeIds=''
			)
			AND (
				(
					@CompanyTakenUpIds!='' AND FA.CompanyCompanyTypeId=DA.CompanyCompanyTypeId AND DA.CompanyCompanyTypeId IN (SELECT item FROM dbo.SplitString(@CompanyTakenUpIds, ',')) AND T.IsIncepted IN(0,1)
				) 
				OR (@CompanyTakenUpIds='')
			)  
		AND DA.AnalyticsTypeId=1 
	ELSE IF(@CompanyCompanyTypeIds !='' AND @CompanyTakenUpIds!='')
	INSERT INTO #TempDealTrackerReport  
	SELECT T.TransactionId,  
		T.CashTransaction,  
		T.Customer AS ClientName,  
		T.BusinessManager AS 'BusinessManagerName',  
		T.SalesPerson AS SalesPersonName,  
		FORMAT(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreatedDate), 'dd-MMM-yy HH:mm:ss' ) AS CreatedDate,  
		T.CreatedByUser AS 'CreatedBy',  
		'' AS CustomerAccessFinApp ,  
		'' AS FinanceCompany,  
		FA.CompanyCompanyTypeId AS CompanyCompanyTypeId,  
		-- Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  (SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId) else  '' end AS FinanceApplicationFinanceStatus,


		CASE WHEN T.IsCashTransaction=0 then concat((SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId),
		'|', Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.financestatus else ' ' end ) else ' ' end AS FinanceApplicationFinanceStatus,


		---facompany,fastatusid|tcompany,tfstatusid   AS FinanceApplicationFinanceStatus
		-- +'|'+isnull(FinanceStatus,'')
		'' AS FirstApplyDate,  
		NULL AS NumberOfTimesApplied,  
		NULL AS CreateToApplyDate,  
		NULL AS AppliedToApprovedDate,  
		NULL AS ApprovedToContractSignedDate,  
		NULL AS ContractSignedToPayoutRequestDate,  
		'' AS CreateToApply,  
		'' AS AppliedToApproved,  
		'' AS ApprovedToContractSigned,  
		'' AS ContractSignedToIncept,  
		'' AS ContractSignedToPayoutRequest,  
		'' AS PayoutRequestToPaidOut,  
		'' AS CreateToCallBackCustomer,  
		'' AS DealDeclined,  
		T.BalloonValue AS ResidualValue,  
		'' AS InceptToVehicleDelivery,  
		'' AS CreateToIncept,  
		'' AS CreateToPaidOut,  
		'' AS DebtorsDays,  
		T.TransactionStatus,  
		CASE WHEN T.IsCashTransaction=0 THEN  T.TotalFinanceAmount ELSE T.TotalCashAmount END  AS TransactionAmount,  
		T.DICAmount AS DICAmount,  
		T.GroupName AS 'Group',  
		T.BranchName AS 'Branch',  
		CASE WHEN T.IsCashTransaction=0 THEN  T.FinanceTypeName ELSE '' END  AS 'FinanceType',  
		CASE WHEN T.IsCashTransaction=0 THEN  Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.FinanceCompanyName else '' end ELSE '' END AS FinanceCompanyTakenUp,   
		CASE WHEN T.IsCashTransaction=0  THEN    T.FinanceTerm ELSE NULL END AS 'Term',  
		CASE WHEN T.IsCashTransaction=0  THEN    T.InterestRate  ELSE NULL END AS 'Rate',  
		T.IsCashTransaction,  
		T.IsIncepted,  
		FA.CompanyId,  
		T.CreatedDate,  
		T.InceptDate,  
		T.VehicleDeliveryDate,  
		T.DocInvoicePaidDate,  
		T.DocInvoiceDate,  
		T.PayOutRequestDate,  
		T.CallBackCustomerDateTime,  
		T.DeclineDateTime,  
		T.AppliedForFinance,  
		'' AS ReceivedByFAndI,  
		'' AS FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled,  
		'' AS FirstAppliedToPurchaseOrderIssued ,  
		'' AS FirstAppliedToPaidOut ,  
		'' AS ApprovedToPurchaseOrderIssued,  
		'' AS PurchaseOrderIssuedToIncept ,  
		'' AS FirstAppliedToIncept ,  
		'' AS AppliedToCustomerCancelled ,  
		'' AS AppliedToDeclined,  
		null AS  PurchaseOrderIssuedDate,  
		T.DealNotTakenDate,  
		T.CustomerCancelledDate,  
		T.ReceivedByFAndIDate,  
		null FinanceDeclinedDate,
		T.FinanceStatusId,
		(SELECT  NAME FROM staticvalue WHERE id=T.financestatusid) AS FinanceStatus
		FROM dbo.ViewTransaction AS T WITH (NOLOCK)  
		LEFT JOIN TransactionFinanceApplication FA WITH (NOLOCK) ON FA.TransactionId = T.TransactionId AND FA.IsActive=1 
		AND FA.CompanyCompanyTypeid  in (select CompanyCompanyTypeid from  DealTrackerReportAnalytics d where d.transactionid in (SELECT  
		item  
		FROM dbo.SplitString(@TransactionId, ',')) and d.AnalyticsTypeId=1)
		LEFT JOIN DealTrackerReportAnalytics DA WITH (NOLOCK)  ON DA.TransactionId= T.TransactionId AND AnalyticsTypeId=1
		LEFT JOIN InceptTransaction IT  WITH (NOLOCK)  ON IT.TransactionId= T.TransactionId
		WHERE T.CashTransaction='NO' AND T.TransactionId IN (SELECT item FROM dbo.SplitString(@TransactionId, ','))  
		AND (
				(
				@CompanyCompanyTypeIds!='' AND FA.CompanyCompanyTypeId IN (SELECT  item FROM dbo.SplitString(@CompanyCompanyTypeIds, ',')) 
				) 
				OR @CompanyCompanyTypeIds=''
			)
		AND (
				(
					@CompanyTakenUpIds!='' AND DA.CompanyCompanyTypeId IN (SELECT item FROM dbo.SplitString(@CompanyTakenUpIds, ',')) AND T.IsIncepted=1
				) 
				OR (@CompanyTakenUpIds='')
			)  
		AND DA.AnalyticsTypeId=1 
	ELSE 
	INSERT INTO #TempDealTrackerReport  
	SELECT T.TransactionId,  
		T.CashTransaction,  
		T.Customer AS ClientName,  
		T.BusinessManager AS 'BusinessManagerName',  
		T.SalesPerson AS SalesPersonName,  
		FORMAT(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreatedDate), 'dd-MMM-yy HH:mm:ss' ) AS CreatedDate,  
		T.CreatedByUser AS 'CreatedBy',  
		'' AS CustomerAccessFinApp ,  
		'' AS FinanceCompany,  
		FA.CompanyCompanyTypeId AS CompanyCompanyTypeId,  
		-- Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  (SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId) else  '' end AS FinanceApplicationFinanceStatus,


		CASE WHEN T.IsCashTransaction=0 then concat((SELECT [NAME] FROM StaticValue WHERE ID= FA.FinanceStatusId),
		'|', Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.financestatus else ' ' end ) else ' ' end AS FinanceApplicationFinanceStatus,


		---facompany,fastatusid|tcompany,tfstatusid   AS FinanceApplicationFinanceStatus
		-- +'|'+isnull(FinanceStatus,'')
		'' AS FirstApplyDate,  
		NULL AS NumberOfTimesApplied,  
		NULL AS CreateToApplyDate,  
		NULL AS AppliedToApprovedDate,  
		NULL AS ApprovedToContractSignedDate,  
		NULL AS ContractSignedToPayoutRequestDate,  
		'' AS CreateToApply,  
		'' AS AppliedToApproved,  
		'' AS ApprovedToContractSigned,  
		'' AS ContractSignedToIncept,  
		'' AS ContractSignedToPayoutRequest,  
		'' AS PayoutRequestToPaidOut,  
		'' AS CreateToCallBackCustomer,  
		'' AS DealDeclined,  
		T.BalloonValue AS ResidualValue,  
		'' AS InceptToVehicleDelivery,  
		'' AS CreateToIncept,  
		'' AS CreateToPaidOut,  
		'' AS DebtorsDays,  
		T.TransactionStatus,  
		CASE WHEN T.IsCashTransaction=0 THEN  T.TotalFinanceAmount ELSE T.TotalCashAmount END  AS TransactionAmount,  
		T.DICAmount AS DICAmount,  
		T.GroupName AS 'Group',  
		T.BranchName AS 'Branch',  
		CASE WHEN T.IsCashTransaction=0 THEN  T.FinanceTypeName ELSE '' END  AS 'FinanceType',  
		CASE WHEN T.IsCashTransaction=0 THEN  Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.FinanceCompanyName else '' end ELSE '' END AS FinanceCompanyTakenUp,   
		CASE WHEN T.IsCashTransaction=0  THEN    T.FinanceTerm ELSE NULL END AS 'Term',  
		CASE WHEN T.IsCashTransaction=0  THEN    T.InterestRate  ELSE NULL END AS 'Rate',  
		T.IsCashTransaction,  
		T.IsIncepted,  
		FA.CompanyId,  
		T.CreatedDate,  
		T.InceptDate,  
		T.VehicleDeliveryDate,  
		T.DocInvoicePaidDate,  
		T.DocInvoiceDate,  
		T.PayOutRequestDate,  
		T.CallBackCustomerDateTime,  
		T.DeclineDateTime,  
		T.AppliedForFinance,  
		'' AS ReceivedByFAndI,  
		'' AS FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled,  
		'' AS FirstAppliedToPurchaseOrderIssued ,  
		'' AS FirstAppliedToPaidOut ,  
		'' AS ApprovedToPurchaseOrderIssued,  
		'' AS PurchaseOrderIssuedToIncept ,  
		'' AS FirstAppliedToIncept ,  
		'' AS AppliedToCustomerCancelled ,  
		'' AS AppliedToDeclined,  
		null AS  PurchaseOrderIssuedDate,  
		T.DealNotTakenDate,  
		T.CustomerCancelledDate,  
		T.ReceivedByFAndIDate,  
		null FinanceDeclinedDate,
		T.FinanceStatusId,
		(SELECT  NAME FROM staticvalue WHERE id=T.financestatusid) AS FinanceStatus
		FROM dbo.ViewTransaction AS T WITH (NOLOCK)  
		LEFT JOIN TransactionFinanceApplication FA WITH (NOLOCK) ON FA.TransactionId = T.TransactionId AND FA.IsActive=1 
		AND FA.CompanyCompanyTypeid  in (select CompanyCompanyTypeid from  DealTrackerReportAnalytics d where d.transactionid in (SELECT  
		item  
		FROM dbo.SplitString(@TransactionId, ',')) and d.AnalyticsTypeId=1)
		LEFT JOIN DealTrackerReportAnalytics DA WITH (NOLOCK)  ON DA.TransactionId= T.TransactionId AND AnalyticsTypeId=1
		LEFT JOIN InceptTransaction IT  WITH (NOLOCK)  ON IT.TransactionId= T.TransactionId
		WHERE T.CashTransaction='NO' AND T.TransactionId IN (SELECT item FROM dbo.SplitString(@TransactionId, ','))  
		AND (
				(
				@CompanyCompanyTypeIds!='' AND FA.CompanyCompanyTypeId IN (SELECT  item FROM dbo.SplitString(@CompanyCompanyTypeIds, ',')) 
				) 
				OR @CompanyCompanyTypeIds=''
			)
		AND (
				(
					@CompanyTakenUpIds!='' AND FA.CompanyCompanyTypeId=IT.FinanceCompanyId AND IT.FinanceCompanyId IN (SELECT item FROM dbo.SplitString(@CompanyTakenUpIds, ',')) AND T.IsIncepted=1
				) 
				OR (@CompanyTakenUpIds='')
			)  
		AND DA.AnalyticsTypeId=1 

	--SELECT FinanceCompany,FinanceCompanyTakenUp, * from #TempDealTrackerReport

	--Get cash transaction list
	INSERT INTO #TempDealTrackerReport  
	SELECT T.TransactionId, 
	   T.CashTransaction,  
	   T.Customer AS ClientName,  
	   T.BusinessManager AS 'BusinessManagerName',  
	   T.SalesPerson AS SalesPersonName,  
	   FORMAT(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreatedDate), 'dd-MMM-yy HH:mm:ss' ) AS CreatedDate,  
	   T.CreatedByUser AS 'CreatedBy',  
	   '' AS CustomerAccessFinApp ,  
	   '' AS FinanceCompany,  
	   NULL AS CompanyCompanyTypeId,  
	  --Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  (SELECT [NAME] FROM StaticValue WHERE ID= Fa.FinanceStatusId) else '' end AS FinanceApplicationFinanceStatus,  
	   ' | '  AS FinanceApplicationFinanceStatus,
	   '' AS FirstApplyDate,  
	   NULL AS NumberOfTimesApplied,  
	   NULL AS CreateToApplyDate,  
	   NULL AS AppliedToApprovedDate,  
	   NULL AS ApprovedToContractSignedDate,  
	   NULL AS ContractSignedToPayoutRequestDate,  
	   '' AS CreateToApply,  
	   '' AS AppliedToApproved,  
	   '' AS ApprovedToContractSigned,  
	   '' AS ContractSignedToIncept,  
	   '' AS ContractSignedToPayoutRequest,  
	   '' AS PayoutRequestToPaidOut,  
	   '' AS CreateToCallBackCustomer,  
	   '' AS DealDeclined,  
	   T.BalloonValue AS ResidualValue,  
	   '' AS InceptToVehicleDelivery,  
	   '' AS CreateToIncept,  
	   '' AS CreateToPaidOut,  
	   '' AS DebtorsDays,  
	   T.TransactionStatus,  
	   CASE WHEN T.IsCashTransaction=0 THEN  T.TotalFinanceAmount ELSE T.TotalCashAmount END  AS TransactionAmount,  
	   T.DICAmount AS DICAmount,  
	   T.GroupName AS 'Group',  
	   T.BranchName AS 'Branch',  
	   CASE WHEN T.IsCashTransaction=0 THEN  T.FinanceTypeName ELSE '' END  AS 'FinanceType',  
	   --CASE WHEN T.IsCashTransaction=0 THEN  Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.FinanceCompanyName else '' end ELSE '' END AS FinanceCompanyTakenUp,  
	   '' as FinanceCompanyTakenUp, 
	   CASE WHEN T.IsCashTransaction=0  THEN    T.FinanceTerm ELSE NULL END AS 'Term',  
	   CASE WHEN T.IsCashTransaction=0  THEN    T.InterestRate  ELSE NULL END AS 'Rate',  
	   T.IsCashTransaction,  
	   T.IsIncepted,  
	   null CompanyId,  
	  T.CreatedDate,  
	   T.InceptDate,  
	   T.VehicleDeliveryDate,  
	   T.DocInvoicePaidDate,  
	   T.DocInvoiceDate,  
	   T.PayOutRequestDate,  
	   T.CallBackCustomerDateTime,  
	   T.DeclineDateTime,  
	   T.AppliedForFinance,  
		'' AS ReceivedByFAndI,  
		'' AS FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled,  
		'' AS FirstAppliedToPurchaseOrderIssued ,  
	   '' AS FirstAppliedToPaidOut ,  
	   '' AS ApprovedToPurchaseOrderIssued,  
	   '' AS PurchaseOrderIssuedToIncept ,  
	   '' AS FirstAppliedToIncept ,  
	   '' AS AppliedToCustomerCancelled ,  
	   '' AS AppliedToDeclined,  
	   null AS  PurchaseOrderIssuedDate,  
	   T.DealNotTakenDate,  
	   T.CustomerCancelledDate,  
	   T.ReceivedByFAndIDate,  
	   null FinanceDeclinedDate,
	   T.FinanceStatusId,
	   (SELECT  NAME FROM StaticValue WHERE Id=T.FinanceStatusId) as FinanceStatus
     
	 FROM dbo.ViewTransaction AS T 
		LEFT JOIN   DealTrackerReportAnalytics DA  on DA.transactionid=T.transactionid
		--where T.cashtransaction='YES' and T.TransactionId IN (SELECT 
		--item 
		--FROM dbo.SplitString(@TransactionId, ',')) 
		WHERE T.TransactionId IN (SELECT item FROM dbo.SplitString((CASE WHEN ((@CompanyCompanyTypeIds ='' OR (@CompanyCompanyTypeIds LIKE '%-1%')) AND (@CompanyTakenUpIds ='' OR (@CompanyTakenUpIds LIKE '%-1%' ))) 
									   THEN  @TransactionId
									   ELSE ''
									   END),','))
		AND T.CashTransaction=(CASE WHEN (((@CompanyCompanyTypeIds ='' OR @CompanyCompanyTypeIds LIKE '%-1%') AND (@CompanyTakenUpIds='' OR @CompanyTakenUpIds LIKE '%-1%'))) 
									THEN 'YES'  ELSE '' END)
	
	--SELECT FinanceCompany,FinanceCompanyTakenUp, * from #TempDealTrackerReport

	IF(@CompanyCompanyTypeIds ='' AND @CompanyTakenUpIds = '')	
	INSERT INTO #TempDealTrackerReport
	SELECT T.TransactionId,  
	   T.CashTransaction,  
	   T.Customer AS ClientName,  
	   T.BusinessManager AS 'BusinessManagerName',  
	   T.SalesPerson AS SalesPersonName,  
	   FORMAT(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreatedDate), 'dd-MMM-yy HH:mm:ss' ) AS CreatedDate,  
	   T.CreatedByUser AS 'CreatedBy',  
	   '' AS CustomerAccessFinApp ,  
	   '' AS FinanceCompany,  
	   NULL AS CompanyCompanyTypeId,  
	  --Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  (SELECT [NAME] FROM StaticValue WHERE ID= Fa.FinanceStatusId) else '' end AS FinanceApplicationFinanceStatus,  
	   ' | '  AS FinanceApplicationFinanceStatus,
	   '' AS FirstApplyDate,  
	   NULL AS NumberOfTimesApplied,  
	   NULL AS CreateToApplyDate,  
	   NULL AS AppliedToApprovedDate,  
	   NULL AS ApprovedToContractSignedDate,  
	   NULL AS ContractSignedToPayoutRequestDate,  
	   '' AS CreateToApply,  
	   '' AS AppliedToApproved,  
	   '' AS ApprovedToContractSigned,  
	   '' AS ContractSignedToIncept,  
	   '' AS ContractSignedToPayoutRequest,  
	   '' AS PayoutRequestToPaidOut,  
	   '' AS CreateToCallBackCustomer,  
	   '' AS DealDeclined,  
	   T.BalloonValue AS ResidualValue,  
	   '' AS InceptToVehicleDelivery,  
	   '' AS CreateToIncept,  
	   '' AS CreateToPaidOut,  
	   '' AS DebtorsDays,  
	   T.TransactionStatus,  
	   CASE WHEN T.IsCashTransaction=0 THEN  T.TotalFinanceAmount ELSE T.TotalCashAmount END  AS TransactionAmount,  
	   T.DICAmount AS DICAmount,  
	   T.GroupName AS 'Group',  
	   T.BranchName AS 'Branch',  
	   CASE WHEN T.IsCashTransaction=0 THEN  T.FinanceTypeName ELSE '' END  AS 'FinanceType',  
	   --CASE WHEN T.IsCashTransaction=0 THEN  Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.FinanceCompanyName else '' end ELSE '' END AS FinanceCompanyTakenUp,  
	   '' as FinanceCompanyTakenUp, 
	   CASE WHEN T.IsCashTransaction=0  THEN    T.FinanceTerm ELSE NULL END AS 'Term',  
	   CASE WHEN T.IsCashTransaction=0  THEN    T.InterestRate  ELSE NULL END AS 'Rate',  
	   T.IsCashTransaction,  
	   T.IsIncepted,  
	   null CompanyId,  
	  T.CreatedDate,  
	   T.InceptDate,  
	   T.VehicleDeliveryDate,  
	   T.DocInvoicePaidDate,  
	   T.DocInvoiceDate,  
	   T.PayOutRequestDate,  
	   T.CallBackCustomerDateTime,  
	   T.DeclineDateTime,  
	   T.AppliedForFinance,  
		'' AS ReceivedByFAndI,  
		'' AS FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled,  
		'' AS FirstAppliedToPurchaseOrderIssued ,  
	   '' AS FirstAppliedToPaidOut ,  
	   '' AS ApprovedToPurchaseOrderIssued,  
	   '' AS PurchaseOrderIssuedToIncept ,  
	   '' AS FirstAppliedToIncept ,  
	   '' AS AppliedToCustomerCancelled ,  
	   '' AS AppliedToDeclined,  
	   NULL AS  PurchaseOrderIssuedDate,  
	   T.DealNotTakenDate,  
	   T.CustomerCancelledDate,  
	   T.ReceivedByFAndIDate,  
	   NULL FinanceDeclinedDate,
	   T.FinanceStatusId,
	   (SELECT  NAME FROM StaticValue WHERE id=T.FinanceStatusId) as FinanceStatus  
	   FROM dbo.ViewTransaction AS T 
	   LEFT JOIN   DealTrackerReportAnalytics DA  ON DA.TransactionId=T.TransactionId
	   LEFT JOIN InceptTransaction IT ON T.TransactionId=It.TransactionId
	   WHERE  T.TransactionId IN (SELECT item FROM dbo.SplitString(@TransactionId, ',') 
									WHERE (select count(1) from DealTrackerReportAnalytics  where transactionid=item  
									AND AnalyticsTypeId=1)=1) 
		AND (
				(
					@CompanyTakenUpIds!='' AND T.FinanceCompanyId=IT.FinanceCompanyId AND IT.FinanceCompanyId IN (SELECT item FROM dbo.SplitString(@CompanyTakenUpIds, ',')) AND T.IsIncepted=1
				) 
				OR (@CompanyTakenUpIds='')
			) 
	ELSE IF(@CompanyCompanyTypeIds ='-1' AND @CompanyTakenUpIds = '-1')	
	INSERT INTO #TempDealTrackerReport
	SELECT T.TransactionId,  
	   T.CashTransaction,  
	   T.Customer AS ClientName,  
	   T.BusinessManager AS 'BusinessManagerName',  
	   T.SalesPerson AS SalesPersonName,  
	   FORMAT(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreatedDate), 'dd-MMM-yy HH:mm:ss' ) AS CreatedDate,  
	   T.CreatedByUser AS 'CreatedBy',  
	   '' AS CustomerAccessFinApp ,  
	   '' AS FinanceCompany,  
	   NULL AS CompanyCompanyTypeId,  
	  --Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  (SELECT [NAME] FROM StaticValue WHERE ID= Fa.FinanceStatusId) else '' end AS FinanceApplicationFinanceStatus,  
	   ' | '  AS FinanceApplicationFinanceStatus,
	   '' AS FirstApplyDate,  
	   NULL AS NumberOfTimesApplied,  
	   NULL AS CreateToApplyDate,  
	   NULL AS AppliedToApprovedDate,  
	   NULL AS ApprovedToContractSignedDate,  
	   NULL AS ContractSignedToPayoutRequestDate,  
	   '' AS CreateToApply,  
	   '' AS AppliedToApproved,  
	   '' AS ApprovedToContractSigned,  
	   '' AS ContractSignedToIncept,  
	   '' AS ContractSignedToPayoutRequest,  
	   '' AS PayoutRequestToPaidOut,  
	   '' AS CreateToCallBackCustomer,  
	   '' AS DealDeclined,  
	   T.BalloonValue AS ResidualValue,  
	   '' AS InceptToVehicleDelivery,  
	   '' AS CreateToIncept,  
	   '' AS CreateToPaidOut,  
	   '' AS DebtorsDays,  
	   T.TransactionStatus,  
	   CASE WHEN T.IsCashTransaction=0 THEN  T.TotalFinanceAmount ELSE T.TotalCashAmount END  AS TransactionAmount,  
	   T.DICAmount AS DICAmount,  
	   T.GroupName AS 'Group',  
	   T.BranchName AS 'Branch',  
	   CASE WHEN T.IsCashTransaction=0 THEN  T.FinanceTypeName ELSE '' END  AS 'FinanceType',  
	   --CASE WHEN T.IsCashTransaction=0 THEN  Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.FinanceCompanyName else '' end ELSE '' END AS FinanceCompanyTakenUp,  
	   '' as FinanceCompanyTakenUp, 
	   CASE WHEN T.IsCashTransaction=0  THEN    T.FinanceTerm ELSE NULL END AS 'Term',  
	   CASE WHEN T.IsCashTransaction=0  THEN    T.InterestRate  ELSE NULL END AS 'Rate',  
	   T.IsCashTransaction,  
	   T.IsIncepted,  
	   null CompanyId,  
	  T.CreatedDate,  
	   T.InceptDate,  
	   T.VehicleDeliveryDate,  
	   T.DocInvoicePaidDate,  
	   T.DocInvoiceDate,  
	   T.PayOutRequestDate,  
	   T.CallBackCustomerDateTime,  
	   T.DeclineDateTime,  
	   T.AppliedForFinance,  
		'' AS ReceivedByFAndI,  
		'' AS FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled,  
		'' AS FirstAppliedToPurchaseOrderIssued ,  
	   '' AS FirstAppliedToPaidOut ,  
	   '' AS ApprovedToPurchaseOrderIssued,  
	   '' AS PurchaseOrderIssuedToIncept ,  
	   '' AS FirstAppliedToIncept ,  
	   '' AS AppliedToCustomerCancelled ,  
	   '' AS AppliedToDeclined,  
	   NULL AS  PurchaseOrderIssuedDate,  
	   T.DealNotTakenDate,  
	   T.CustomerCancelledDate,  
	   T.ReceivedByFAndIDate,  
	   NULL FinanceDeclinedDate,
	   T.FinanceStatusId,
	   (SELECT  NAME FROM StaticValue WHERE id=T.FinanceStatusId) as FinanceStatus  
	   FROM dbo.ViewTransaction AS T 
	   LEFT JOIN   DealTrackerReportAnalytics DA  ON DA.TransactionId=T.TransactionId
	   LEFT JOIN InceptTransaction IT ON T.TransactionId=It.TransactionId
	   WHERE  T.TransactionId IN (SELECT item FROM dbo.SplitString(@TransactionId, ',') 
									WHERE (select count(1) from DealTrackerReportAnalytics  where transactionid=item  
									AND AnalyticsTypeId=1)=1) 
	ELSE IF(@CompanyCompanyTypeIds ='' AND @CompanyTakenUpIds = '-1')	
	INSERT INTO #TempDealTrackerReport
	SELECT T.TransactionId,  
	   T.CashTransaction,  
	   T.Customer AS ClientName,  
	   T.BusinessManager AS 'BusinessManagerName',  
	   T.SalesPerson AS SalesPersonName,  
	   FORMAT(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreatedDate), 'dd-MMM-yy HH:mm:ss' ) AS CreatedDate,  
	   T.CreatedByUser AS 'CreatedBy',  
	   '' AS CustomerAccessFinApp ,  
	   '' AS FinanceCompany,  
	   NULL AS CompanyCompanyTypeId,  
	  --Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  (SELECT [NAME] FROM StaticValue WHERE ID= Fa.FinanceStatusId) else '' end AS FinanceApplicationFinanceStatus,  
	   ' | '  AS FinanceApplicationFinanceStatus,
	   '' AS FirstApplyDate,  
	   NULL AS NumberOfTimesApplied,  
	   NULL AS CreateToApplyDate,  
	   NULL AS AppliedToApprovedDate,  
	   NULL AS ApprovedToContractSignedDate,  
	   NULL AS ContractSignedToPayoutRequestDate,  
	   '' AS CreateToApply,  
	   '' AS AppliedToApproved,  
	   '' AS ApprovedToContractSigned,  
	   '' AS ContractSignedToIncept,  
	   '' AS ContractSignedToPayoutRequest,  
	   '' AS PayoutRequestToPaidOut,  
	   '' AS CreateToCallBackCustomer,  
	   '' AS DealDeclined,  
	   T.BalloonValue AS ResidualValue,  
	   '' AS InceptToVehicleDelivery,  
	   '' AS CreateToIncept,  
	   '' AS CreateToPaidOut,  
	   '' AS DebtorsDays,  
	   T.TransactionStatus,  
	   CASE WHEN T.IsCashTransaction=0 THEN  T.TotalFinanceAmount ELSE T.TotalCashAmount END  AS TransactionAmount,  
	   T.DICAmount AS DICAmount,  
	   T.GroupName AS 'Group',  
	   T.BranchName AS 'Branch',  
	   CASE WHEN T.IsCashTransaction=0 THEN  T.FinanceTypeName ELSE '' END  AS 'FinanceType',  
	   --CASE WHEN T.IsCashTransaction=0 THEN  Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.FinanceCompanyName else '' end ELSE '' END AS FinanceCompanyTakenUp,  
	   '' as FinanceCompanyTakenUp, 
	   CASE WHEN T.IsCashTransaction=0  THEN    T.FinanceTerm ELSE NULL END AS 'Term',  
	   CASE WHEN T.IsCashTransaction=0  THEN    T.InterestRate  ELSE NULL END AS 'Rate',  
	   T.IsCashTransaction,  
	   T.IsIncepted,  
	   null CompanyId,  
	  T.CreatedDate,  
	   T.InceptDate,  
	   T.VehicleDeliveryDate,  
	   T.DocInvoicePaidDate,  
	   T.DocInvoiceDate,  
	   T.PayOutRequestDate,  
	   T.CallBackCustomerDateTime,  
	   T.DeclineDateTime,  
	   T.AppliedForFinance,  
		'' AS ReceivedByFAndI,  
		'' AS FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled,  
		'' AS FirstAppliedToPurchaseOrderIssued ,  
	   '' AS FirstAppliedToPaidOut ,  
	   '' AS ApprovedToPurchaseOrderIssued,  
	   '' AS PurchaseOrderIssuedToIncept ,  
	   '' AS FirstAppliedToIncept ,  
	   '' AS AppliedToCustomerCancelled ,  
	   '' AS AppliedToDeclined,  
	   NULL AS  PurchaseOrderIssuedDate,  
	   T.DealNotTakenDate,  
	   T.CustomerCancelledDate,  
	   T.ReceivedByFAndIDate,  
	   NULL FinanceDeclinedDate,
	   T.FinanceStatusId,
	   (SELECT  NAME FROM StaticValue WHERE id=T.FinanceStatusId) as FinanceStatus  
	   FROM dbo.ViewTransaction AS T 
	   LEFT JOIN   DealTrackerReportAnalytics DA  ON DA.TransactionId=T.TransactionId
	   LEFT JOIN InceptTransaction IT ON T.TransactionId=It.TransactionId
	   WHERE  T.TransactionId IN (SELECT item FROM dbo.SplitString(@TransactionId, ',') 
									WHERE (select count(1) from DealTrackerReportAnalytics  where transactionid=item  
									AND AnalyticsTypeId=1)=1) 
	ELSE IF(@CompanyCompanyTypeIds NOT LIKE '%-1%' AND @CompanyTakenUpIds = '')	
	INSERT INTO #TempDealTrackerReport
	SELECT T.TransactionId,  
	   T.CashTransaction,  
	   T.Customer AS ClientName,  
	   T.BusinessManager AS 'BusinessManagerName',  
	   T.SalesPerson AS SalesPersonName,  
	   FORMAT(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreatedDate), 'dd-MMM-yy HH:mm:ss' ) AS CreatedDate,  
	   T.CreatedByUser AS 'CreatedBy',  
	   '' AS CustomerAccessFinApp ,  
	   '' AS FinanceCompany,  
	   NULL AS CompanyCompanyTypeId,  
	  --Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  (SELECT [NAME] FROM StaticValue WHERE ID= Fa.FinanceStatusId) else '' end AS FinanceApplicationFinanceStatus,  
	   ' | '  AS FinanceApplicationFinanceStatus,
	   '' AS FirstApplyDate,  
	   NULL AS NumberOfTimesApplied,  
	   NULL AS CreateToApplyDate,  
	   NULL AS AppliedToApprovedDate,  
	   NULL AS ApprovedToContractSignedDate,  
	   NULL AS ContractSignedToPayoutRequestDate,  
	   '' AS CreateToApply,  
	   '' AS AppliedToApproved,  
	   '' AS ApprovedToContractSigned,  
	   '' AS ContractSignedToIncept,  
	   '' AS ContractSignedToPayoutRequest,  
	   '' AS PayoutRequestToPaidOut,  
	   '' AS CreateToCallBackCustomer,  
	   '' AS DealDeclined,  
	   T.BalloonValue AS ResidualValue,  
	   '' AS InceptToVehicleDelivery,  
	   '' AS CreateToIncept,  
	   '' AS CreateToPaidOut,  
	   '' AS DebtorsDays,  
	   T.TransactionStatus,  
	   CASE WHEN T.IsCashTransaction=0 THEN  T.TotalFinanceAmount ELSE T.TotalCashAmount END  AS TransactionAmount,  
	   T.DICAmount AS DICAmount,  
	   T.GroupName AS 'Group',  
	   T.BranchName AS 'Branch',  
	   CASE WHEN T.IsCashTransaction=0 THEN  T.FinanceTypeName ELSE '' END  AS 'FinanceType',  
	   --CASE WHEN T.IsCashTransaction=0 THEN  Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.FinanceCompanyName else '' end ELSE '' END AS FinanceCompanyTakenUp,  
	   '' as FinanceCompanyTakenUp, 
	   CASE WHEN T.IsCashTransaction=0  THEN    T.FinanceTerm ELSE NULL END AS 'Term',  
	   CASE WHEN T.IsCashTransaction=0  THEN    T.InterestRate  ELSE NULL END AS 'Rate',  
	   T.IsCashTransaction,  
	   T.IsIncepted,  
	   null CompanyId,  
	  T.CreatedDate,  
	   T.InceptDate,  
	   T.VehicleDeliveryDate,  
	   T.DocInvoicePaidDate,  
	   T.DocInvoiceDate,  
	   T.PayOutRequestDate,  
	   T.CallBackCustomerDateTime,  
	   T.DeclineDateTime,  
	   T.AppliedForFinance,  
		'' AS ReceivedByFAndI,  
		'' AS FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled,  
		'' AS FirstAppliedToPurchaseOrderIssued ,  
	   '' AS FirstAppliedToPaidOut ,  
	   '' AS ApprovedToPurchaseOrderIssued,  
	   '' AS PurchaseOrderIssuedToIncept ,  
	   '' AS FirstAppliedToIncept ,  
	   '' AS AppliedToCustomerCancelled ,  
	   '' AS AppliedToDeclined,  
	   NULL AS  PurchaseOrderIssuedDate,  
	   T.DealNotTakenDate,  
	   T.CustomerCancelledDate,  
	   T.ReceivedByFAndIDate,  
	   NULL FinanceDeclinedDate,
	   T.FinanceStatusId,
	   (SELECT  NAME FROM StaticValue WHERE id=T.FinanceStatusId) as FinanceStatus  
	   FROM dbo.ViewTransaction AS T 
	   LEFT JOIN   DealTrackerReportAnalytics DA  ON DA.TransactionId=T.TransactionId
	   LEFT JOIN InceptTransaction IT ON T.TransactionId=It.TransactionId
	   WHERE  T.TransactionId IN (SELECT item FROM dbo.SplitString(@TransactionId, ',') 
									WHERE (select count(1) from DealTrackerReportAnalytics  where transactionid=item  
									AND AnalyticsTypeId=1)=1) 
		AND (
				(
					@CompanyTakenUpIds!='' AND T.FinanceCompanyId=IT.FinanceCompanyId AND IT.FinanceCompanyId IN (SELECT item FROM dbo.SplitString(@CompanyTakenUpIds, ',')) AND T.IsIncepted=1
				) 
				--OR (@CompanyTakenUpIds='')
			)  
	ELSE
	INSERT INTO #TempDealTrackerReport
	SELECT T.TransactionId,  
	   T.CashTransaction,  
	   T.Customer AS ClientName,  
	   T.BusinessManager AS 'BusinessManagerName',  
	   T.SalesPerson AS SalesPersonName,  
	   FORMAT(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreatedDate), 'dd-MMM-yy HH:mm:ss' ) AS CreatedDate,  
	   T.CreatedByUser AS 'CreatedBy',  
	   '' AS CustomerAccessFinApp ,  
	   '' AS FinanceCompany,  
	   NULL AS CompanyCompanyTypeId,  
	  --Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  (SELECT [NAME] FROM StaticValue WHERE ID= Fa.FinanceStatusId) else '' end AS FinanceApplicationFinanceStatus,  
	   ' | '  AS FinanceApplicationFinanceStatus,
	   '' AS FirstApplyDate,  
	   NULL AS NumberOfTimesApplied,  
	   NULL AS CreateToApplyDate,  
	   NULL AS AppliedToApprovedDate,  
	   NULL AS ApprovedToContractSignedDate,  
	   NULL AS ContractSignedToPayoutRequestDate,  
	   '' AS CreateToApply,  
	   '' AS AppliedToApproved,  
	   '' AS ApprovedToContractSigned,  
	   '' AS ContractSignedToIncept,  
	   '' AS ContractSignedToPayoutRequest,  
	   '' AS PayoutRequestToPaidOut,  
	   '' AS CreateToCallBackCustomer,  
	   '' AS DealDeclined,  
	   T.BalloonValue AS ResidualValue,  
	   '' AS InceptToVehicleDelivery,  
	   '' AS CreateToIncept,  
	   '' AS CreateToPaidOut,  
	   '' AS DebtorsDays,  
	   T.TransactionStatus,  
	   CASE WHEN T.IsCashTransaction=0 THEN  T.TotalFinanceAmount ELSE T.TotalCashAmount END  AS TransactionAmount,  
	   T.DICAmount AS DICAmount,  
	   T.GroupName AS 'Group',  
	   T.BranchName AS 'Branch',  
	   CASE WHEN T.IsCashTransaction=0 THEN  T.FinanceTypeName ELSE '' END  AS 'FinanceType',  
	   --CASE WHEN T.IsCashTransaction=0 THEN  Case When FA.CompanyCompanyTypeId=IT.financecompanyid then  T.FinanceCompanyName else '' end ELSE '' END AS FinanceCompanyTakenUp,  
	   '' as FinanceCompanyTakenUp, 
	   CASE WHEN T.IsCashTransaction=0  THEN    T.FinanceTerm ELSE NULL END AS 'Term',  
	   CASE WHEN T.IsCashTransaction=0  THEN    T.InterestRate  ELSE NULL END AS 'Rate',  
	   T.IsCashTransaction,  
	   T.IsIncepted,  
	   null CompanyId,  
	  T.CreatedDate,  
	   T.InceptDate,  
	   T.VehicleDeliveryDate,  
	   T.DocInvoicePaidDate,  
	   T.DocInvoiceDate,  
	   T.PayOutRequestDate,  
	   T.CallBackCustomerDateTime,  
	   T.DeclineDateTime,  
	   T.AppliedForFinance,  
		'' AS ReceivedByFAndI,  
		'' AS FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled,  
		'' AS FirstAppliedToPurchaseOrderIssued ,  
	   '' AS FirstAppliedToPaidOut ,  
	   '' AS ApprovedToPurchaseOrderIssued,  
	   '' AS PurchaseOrderIssuedToIncept ,  
	   '' AS FirstAppliedToIncept ,  
	   '' AS AppliedToCustomerCancelled ,  
	   '' AS AppliedToDeclined,  
	   NULL AS  PurchaseOrderIssuedDate,  
	   T.DealNotTakenDate,  
	   T.CustomerCancelledDate,  
	   T.ReceivedByFAndIDate,  
	   NULL FinanceDeclinedDate,
	   T.FinanceStatusId,
	   (SELECT  NAME FROM StaticValue WHERE id=T.FinanceStatusId) as FinanceStatus  
	   FROM dbo.ViewTransaction AS T 
	   LEFT JOIN   DealTrackerReportAnalytics DA  ON DA.TransactionId=T.TransactionId
	   LEFT JOIN InceptTransaction IT ON T.TransactionId=It.TransactionId
	   WHERE  T.TransactionId IN (SELECT item FROM dbo.SplitString(@TransactionId, ',') 
									WHERE (select count(1) from DealTrackerReportAnalytics  where transactionid=item  
									AND AnalyticsTypeId=1)=1) 
		AND (
				(
					@CompanyTakenUpIds!='' AND T.FinanceCompanyId=IT.FinanceCompanyId AND IT.FinanceCompanyId IN (SELECT item FROM dbo.SplitString(@CompanyTakenUpIds, ',')) AND T.IsIncepted=1
				) 
				OR (@CompanyTakenUpIds='')
			) 

	INSERT INTO #TempDealTrackerAnalytics  
	SELECT    
	  DA.Id,  
	  DA.TransactionId,  
	  DA.CompanyCompanyTypeId,  
	  DA.FinanceStatusId,  
	  DA.AnalyticsTypeId,  
	  DA.CreatedDate,  
	  C.CompanyName  
	FROM DealTrackerReportAnalytics AS DA WITH (NOLOCK)  
	INNER JOIN CompanyCompanyTypeMapping  AS CCT WITH (NOLOCK) ON CCT.Id=DA.CompanyCompanyTypeId   
	INNER JOIN Company AS C WITH (NOLOCK) ON C.Id=CCT.CompanyId  
	WHERE DA.IsActive= 1 AND DA.TransactionId IN (SELECT item FROM dbo.SplitString(@TransactionId, ','))  
	AND ((@CompanyCompanyTypeIds!='' AND DA.CompanyCompanyTypeId IN (SELECT  
	   item   
	  FROM dbo.SplitString(@CompanyCompanyTypeIds, ','))) OR @CompanyCompanyTypeIds='') 
	 ORDER BY DA.ID DESC 
  
  
UPDATE T  
SET T.FinanceCompany = M.CompanyName,  
    T.FirstApplyDate=FORMAT(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),M.CreatedDate), 'dd-MMM-yyyy HH:mm' ),  
 T.NumberOfTimesApplied=M.NumberOfTimesApplied  
FROM #TempDealTrackerReport T  
INNER JOIN (SELECT TDT.Id,  
    TDT.Transactionid,  
    TDT.CompanyCompanyTypeId,  
    TDT.AnalyticsTypeId,  
    TDT.CompanyName,  
    TMPDealTracker.NumberOfTimesApplied,  
    TDT.CreatedDate  
FROM  #TempDealTrackerAnalytics TDT  
INNER JOIN   
(Select min(ID) AS ID, Transactionid,CompanyCompanyTypeId,AnalyticsTypeId,CompanyName, count(Transactionid) AS NumberOfTimesApplied from #TempDealTrackerAnalytics where AnalyticsTypeId=1  
 group by Transactionid,CompanyCompanyTypeId,AnalyticsTypeId,CompanyName ) AS TMPDealTracker  ON TMPDealTracker.ID=TDT.Id ) M ON   
 M.CompanyCompanyTypeId=T.CompanyCompanyTypeId AND M.TransactionId=T.TransactionId  
   
--CREATE TO APPLY = AppliedForFinance  
UPDATE T  
SET T.CreateToApplyDate = M.CreatedDate  
FROM #TempDealTrackerReport T  
INNER JOIN (SELECT TDT.Id,  
    TDT.Transactionid,  
    TDT.CompanyCompanyTypeId,  
    TDT.AnalyticsTypeId,  
    TDT.CompanyName,  
    TMPDealTracker.NumberOfTimesApplied,  
    TDT.CreatedDate,  
    TDT.FinanceStatusId  
FROM  #TempDealTrackerAnalytics TDT  
INNER JOIN   
(Select min(ID) AS ID, Transactionid,CompanyCompanyTypeId,AnalyticsTypeId,CompanyName, count(Transactionid) AS NumberOfTimesApplied from #TempDealTrackerAnalytics where AnalyticsTypeId=2 AND FinanceStatusId IS NOT NULL AND FinanceStatusId=@AppliedForFinance  
 group by Transactionid,CompanyCompanyTypeId,AnalyticsTypeId,CompanyName ) AS TMPDealTracker  
 ON TMPDealTracker.ID=TDT.Id) M ON   
 M.CompanyCompanyTypeId=T.CompanyCompanyTypeId AND M.TransactionId=T.TransactionId AND M.FinanceStatusId=@AppliedForFinance  
  
--APPLIED TO APPROVED = ApplicationApproved  
 UPDATE T  
SET T.AppliedToApprovedDate = M.CreatedDate  
FROM #TempDealTrackerReport T  
INNER JOIN (SELECT TDT.Id,  
    TDT.Transactionid,  
    TDT.CompanyCompanyTypeId,  
    TDT.AnalyticsTypeId,  
    TDT.CompanyName,  
    TMPDealTracker.NumberOfTimesApplied,  
    TDT.CreatedDate,  
    TDT.FinanceStatusId  
FROM  #TempDealTrackerAnalytics TDT  
INNER JOIN   
(Select min(ID) AS ID, Transactionid,CompanyCompanyTypeId,AnalyticsTypeId,CompanyName, count(Transactionid) AS NumberOfTimesApplied from #TempDealTrackerAnalytics where AnalyticsTypeId=2 AND FinanceStatusId IS NOT NULL AND FinanceStatusId=@ApplicationApproved  
 group by Transactionid,CompanyCompanyTypeId,AnalyticsTypeId,CompanyName ) AS TMPDealTracker ON TMPDealTracker.ID=TDT.Id) M ON   
 M.CompanyCompanyTypeId=T.CompanyCompanyTypeId AND M.TransactionId=T.TransactionId AND M.FinanceStatusId=@ApplicationApproved  
  
--APPROVED TO CONTRACT SIGNED = ContractSigned  
 UPDATE T  
SET T.ApprovedToContractSignedDate = M.CreatedDate  
FROM #TempDealTrackerReport T  
INNER JOIN (SELECT TDT.Id,  
    TDT.Transactionid,  
    TDT.CompanyCompanyTypeId,  
    TDT.AnalyticsTypeId,  
    TDT.CompanyName,  
    TMPDealTracker.NumberOfTimesApplied,  
    TDT.CreatedDate,  
    TDT.FinanceStatusId  
FROM  #TempDealTrackerAnalytics TDT  
INNER JOIN   
(Select min(ID) AS ID, Transactionid,CompanyCompanyTypeId,AnalyticsTypeId,CompanyName, count(Transactionid) AS NumberOfTimesApplied from #TempDealTrackerAnalytics where AnalyticsTypeId=2 AND FinanceStatusId IS NOT NULL AND FinanceStatusId=@ContractSigned 

  group by Transactionid,CompanyCompanyTypeId,AnalyticsTypeId,CompanyName ) AS TMPDealTracker  
 ON TMPDealTracker.ID=TDT.Id) M ON   
 M.CompanyCompanyTypeId=T.CompanyCompanyTypeId AND M.TransactionId=T.TransactionId AND M.FinanceStatusId=@ContractSigned  
  
--CONTRACT SIGNED TO PAY OUT REQUEST = PayoutRequested  
 UPDATE T  
SET T.ContractSignedToPayoutRequestDate = M.CreatedDate  
FROM #TempDealTrackerReport T  
INNER JOIN (SELECT TDT.Id,  
    TDT.Transactionid,  
    TDT.CompanyCompanyTypeId,  
 TDT.AnalyticsTypeId,  
    TDT.CompanyName,  
    TMPDealTracker.NumberOfTimesApplied,  
    TDT.CreatedDate,  
    TDT.FinanceStatusId  
FROM  #TempDealTrackerAnalytics TDT  
INNER JOIN   
(Select min(ID) AS ID, Transactionid,CompanyCompanyTypeId,AnalyticsTypeId,CompanyName, count(Transactionid) AS NumberOfTimesApplied from #TempDealTrackerAnalytics where AnalyticsTypeId=2 AND FinanceStatusId IS NOT NULL AND FinanceStatusId=@PayoutRequested


group by Transactionid,CompanyCompanyTypeId,AnalyticsTypeId,CompanyName ) AS TMPDealTracker  
 ON TMPDealTracker.ID=TDT.Id) M ON   
 M.CompanyCompanyTypeId=T.CompanyCompanyTypeId AND M.TransactionId=T.TransactionId AND M.FinanceStatusId=@PayoutRequested  
--------------------------------------------------  
 --PURCHASE ORDER ISSUED DATE = PurchaseOrderIssued  
UPDATE T  
SET T.PurchaseOrderIssuedDate = M.CreatedDate  
FROM #TempDealTrackerReport T  
INNER JOIN (SELECT TDT.Id,  
    TDT.Transactionid,  
    TDT.CompanyCompanyTypeId,  
    TDT.AnalyticsTypeId,  
    TDT.CompanyName,  
    TMPDealTracker.NumberOfTimesApplied,  
    TDT.CreatedDate,  
    TDT.FinanceStatusId  
FROM  #TempDealTrackerAnalytics TDT  
INNER JOIN   
(Select min(ID) AS ID, Transactionid,CompanyCompanyTypeId,AnalyticsTypeId,CompanyName, count(Transactionid) AS NumberOfTimesApplied from #TempDealTrackerAnalytics where AnalyticsTypeId=2 AND FinanceStatusId IS NOT NULL AND FinanceStatusId=@PurchaseOrderIssued   
 group by Transactionid,CompanyCompanyTypeId,AnalyticsTypeId,CompanyName ) AS TMPDealTracker  
 ON TMPDealTracker.ID=TDT.Id) M ON   
 M.CompanyCompanyTypeId=T.CompanyCompanyTypeId AND M.TransactionId=T.TransactionId AND M.FinanceStatusId=@PurchaseOrderIssued
  
 --FinanvceDeclinedDate =Declined  
UPDATE T  
SET T.FinanceDeclinedDate = M.CreatedDate  
FROM #TempDealTrackerReport T  
INNER JOIN (SELECT TDT.Id,  
    TDT.Transactionid,  
    TDT.CompanyCompanyTypeId,  
    TDT.AnalyticsTypeId,  
    TDT.CompanyName,  
    TMPDealTracker.NumberOfTimesApplied,  
    TDT.CreatedDate,  
    TDT.FinanceStatusId  
FROM  #TempDealTrackerAnalytics TDT  
INNER JOIN   
(Select min(ID) AS ID, Transactionid,CompanyCompanyTypeId,AnalyticsTypeId,CompanyName, count(Transactionid) AS NumberOfTimesApplied from #TempDealTrackerAnalytics where AnalyticsTypeId=2 AND FinanceStatusId IS NOT NULL AND FinanceStatusId=@Declined  
 group by Transactionid,CompanyCompanyTypeId,AnalyticsTypeId,CompanyName ) AS TMPDealTracker  
 ON TMPDealTracker.ID=TDT.Id) M ON   
 M.CompanyCompanyTypeId=T.CompanyCompanyTypeId AND M.TransactionId=T.TransactionId AND M.FinanceStatusId=@Declined
  
 -----------------------------------------------------  
 ---------Evaluate--------  
 ---CREATE TO APPLY,   
 ---APPLIED TO APPROVED,   
 ---APPROVED TO CONTRACT SIGNED,   
 ---CONTRACT SIGNED TO INCEPT,  
 ------CONTRACT SIGNED TO PAY OUT REQUEST  
 ------PAY OUT REQUEST TO PAID OUT  
 ------CREATE TO CALL BACK CUSTOMER  
 ---------INCEPT TO VEHICLE DELIVERY   
 ---------CREATE TO INCEPT  
 ---------CREATE TO PAID OUT  
 ---------DEBTORS DAYS   
 

 UPDATE T  
SET   
T.CreateToApply= CASE WHEN T.FirstApplyDate IS NOT NULL AND T.CreatedDate IS NOT NULL  and T.FirstApplyDate !='' THEN   
----CONCAT(DATEDIFF(day,CAST(T.CreatedDate as datetime) , CAST(T.FirstApplyDate as datetime)),':',DATEDIFF(HOUR, CAST(T.CreatedDate as datetime) , CAST(T.FirstApplyDate as datetime)),':',DATEDIFF(MINUTE, CAST(T.CreatedDate as datetime), CAST(T.FirstApplyDate as datetime))) ELSE NULL END,
--CONCAT(DATEDIFF(day,CAST(T.CreatedDate as datetime) , CAST(T.FirstApplyDate as datetime)),':', CAST(DATEDIFF(second, CAST(T.CreatedDate as datetime), CAST(T.FirstApplyDate as datetime)) / 60 / 60 % 24  AS NVARCHAR(50)),':',CAST(DATEDIFF(second, CAST(T.CreatedDate as datetime), CAST(T.FirstApplyDate as datetime)) / 60 % 60 AS NVARCHAR(50))) ELSE NULL END,
--(select dbo.getdatetimediff (T.FirstApplyDate,T.CreatedDate)) ELSE NULL END,
(select dbo.fn_GetWorkingDayMinuts (T.CreatedDate,T.FirstApplyDate,@CountryID)) ELSE NULL END,

--
T.AppliedToApproved= CASE WHEN T.CreateToApplyDate IS NOT NULL AND T.AppliedToApprovedDate IS NOT NULL THEN   
--CAST(DATEDIFF(day,T.CreateToApplyDate, T.AppliedToApprovedDate) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.CreateToApplyDate, T.AppliedToApprovedDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, T.CreateToApplyDate, T.AppliedToApprovedDate) / 60 % 60 AS NVARCHAR(50))  
--(select dbo.getdatetimediff (T.AppliedToApprovedDate,T.CreateToApplyDate))  ELSE NULL END,
--(select dbo.fn_GetWorkingDayMinuts (T.CreateToApplyDate,T.AppliedToApprovedDate,@CountryID))  ELSE NULL END,
(select dbo.fn_GetWorkingDayMinuts (DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreateToApplyDate),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.AppliedToApprovedDate),@CountryID)) ELSE NULL end,
  
T.ApprovedToContractSigned= CASE WHEN T.AppliedToApprovedDate IS NOT NULL AND T.ApprovedToContractSignedDate IS NOT NULL THEN   
--CAST(DATEDIFF(day,T.AppliedToApprovedDate, T.ApprovedToContractSignedDate) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.AppliedToApprovedDate, T.ApprovedToContractSignedDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, T.AppliedToApprovedDate, T.ApprovedToContractSignedDate) / 60 % 60 AS NVARCHAR(50))  
--(select dbo.getdatetimediff (T.ApprovedToContractSignedDate,T.AppliedToApprovedDate))ELSE NULL END, 
 --(select dbo.fn_GetWorkingDayMinuts (T.AppliedToApprovedDate,T.ApprovedToContractSignedDate,@CountryID))ELSE NULL END,
 (select dbo.fn_GetWorkingDayMinuts (DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.AppliedToApprovedDate),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.ApprovedToContractSignedDate),@CountryID)) ELSE NULL end,
 
T.ContractSignedToIncept= CASE WHEN T.ApprovedToContractSignedDate IS NOT NULL AND T.InceptDate IS NOT NULL THEN   
--CAST(DATEDIFF(day,T.ApprovedToContractSignedDate, T.InceptDate) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.ApprovedToContractSignedDate, T.InceptDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, T.ApprovedToContractSignedDate, T.InceptDate) / 60 % 60 AS NVARCHAR(50))  
--(select dbo.getdatetimediff (T.InceptDate,T.ApprovedToContractSignedDate))ELSE NULL END,  
--(select dbo.fn_GetWorkingDayMinuts(T.ApprovedToContractSignedDate,T.InceptDate,@CountryID))ELSE NULL END,
 (select dbo.fn_GetWorkingDayMinuts (DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.ApprovedToContractSignedDate),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.InceptDate),@CountryID)) ELSE NULL end,


T.ContractSignedToPayoutRequest= CASE WHEN T.PayOutRequestDate IS NOT NULL AND T.ApprovedToContractSignedDate IS NOT NULL THEN   
--CAST(DATEDIFF(day,T.ApprovedToContractSignedDate, T.PayOutRequestDate) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.ApprovedToContractSignedDate, T.PayOutRequestDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, T.ApprovedToContractSignedDate, T.PayOutRequestDate) / 60 % 60 AS NVARCHAR(50))  
--(select dbo.getdatetimediff (T.PayOutRequestDate,T.ApprovedToContractSignedDate))ELSE NULL END, 
--(select dbo.fn_GetWorkingDayMinuts(T.ApprovedToContractSignedDate,T.PayOutRequestDate,@CountryID))ELSE NULL END, 
(select dbo.fn_GetWorkingDayMinuts (DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.ApprovedToContractSignedDate),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.PayOutRequestDate),@CountryID)) ELSE NULL end,
  
T.PayoutRequestToPaidOut= CASE WHEN T.DocInvoicePaidDate IS NOT NULL AND T.PayOutRequestDate IS NOT NULL THEN   
--CAST(DATEDIFF(day,T.PayOutRequestDate, T.DocInvoicePaidDate) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.PayOutRequestDate, T.DocInvoicePaidDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, T.PayOutRequestDate, T.DocInvoicePaidDate) / 60 % 60 AS NVARCHAR(50))  
--(select dbo.getdatetimediff (T.DocInvoicePaidDate,T.PayOutRequestDate))ELSE NULL END,
--(select dbo.fn_GetWorkingDayMinuts(T.PayOutRequestDate,T.DocInvoicePaidDate,@CountryID))ELSE NULL END,
(select dbo.fn_GetWorkingDayMinuts (DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.PayOutRequestDate),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.DocInvoicePaidDate),@CountryID)) ELSE NULL end, 
  
T.CreateToCallBackCustomer= CASE WHEN T.CallBackCustomerDateTime IS NOT NULL AND T.CreateDateTime IS NOT NULL THEN   
--CAST(DATEDIFF(day,T.CreateDateTime, T.CallBackCustomerDateTime) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.CreateDateTime, T.CallBackCustomerDateTime) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, T.CreateDateTime, T.CallBackCustomerDateTime) / 60 % 60 AS NVARCHAR(50))  
--ELSE NULL END,
--(select dbo.getdatetimediff (T.CallBackCustomerDateTime,T.CreateDateTime)) ELSE NULL END,
--(select dbo.fn_GetWorkingDayMinuts(T.CreateDateTime,T.CallBackCustomerDateTime,@CountryID)) ELSE NULL END,  
(select dbo.fn_GetWorkingDayMinuts (DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreateDateTime),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CallBackCustomerDateTime),@CountryID)) ELSE NULL end, 
  
T.InceptToVehicleDelivery= CASE WHEN T.VehicleDeliveryDate IS NOT NULL AND T.InceptDate IS NOT NULL THEN   
--CAST(DATEDIFF(day,T.InceptDate, T.VehicleDeliveryDate) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.InceptDate, T.VehicleDeliveryDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, T.InceptDate, T.VehicleDeliveryDate) / 60 % 60 AS NVARCHAR(50))  
--(select dbo.getdatetimediff (T.VehicleDeliveryDate,T.InceptDate))ELSE NULL END,
--(select dbo.fn_GetWorkingDayMinuts(T.InceptDate,T.VehicleDeliveryDate,@CountryID))ELSE NULL END, 
(select dbo.fn_GetWorkingDayMinuts (DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.InceptDate),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.VehicleDeliveryDate),@CountryID)) ELSE NULL end, 
  
T.CreateToIncept= CASE WHEN T.InceptDate IS NOT NULL AND T.CreateDateTime IS NOT NULL THEN   
--CAST(DATEDIFF(day,T.CreateDateTime, T.InceptDate) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.CreateDateTime, T.InceptDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, T.CreateDateTime, T.InceptDate) / 60 % 60 AS NVARCHAR(50))ELSE NULL END,    
--(select dbo.getdatetimediff (T.InceptDate,T.CreateDateTime))ELSE NULL END,
--(select dbo.fn_GetWorkingDayMinuts(T.CreateDateTime,T.InceptDate,@CountryID))ELSE NULL END, 
(select dbo.fn_GetWorkingDayMinuts (DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreateDateTime),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.InceptDate),@CountryID)) ELSE NULL end,


T.CreateToPaidOut= CASE WHEN T.DocInvoicePaidDate IS NOT NULL AND T.CreateDateTime IS NOT NULL THEN   
--CAST(DATEDIFF(day,T.CreateDateTime, T.DocInvoicePaidDate) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.CreateDateTime, T.DocInvoicePaidDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, T.CreateDateTime, T.DocInvoicePaidDate) / 60 %60 AS NVARCHAR(50))  
--(select dbo.getdatetimediff (T.DocInvoicePaidDate,T.CreateDateTime))ELSE NULL END,
--(select dbo.fn_GetWorkingDayMinuts(T.CreateDateTime,T.DocInvoicePaidDate,@CountryID))ELSE NULL END, 
(select dbo.fn_GetWorkingDayMinuts (DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreateDateTime),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.DocInvoicePaidDate),@CountryID)) ELSE NULL end, 

T.DebtorsDays= CASE WHEN T.DocInvoicePaidDate IS NOT NULL AND T.DocInvoiceDate IS NOT NULL THEN   
--CAST(DATEDIFF(day,T.DocInvoiceDate, T.DocInvoicePaidDate) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.DocInvoiceDate, T.DocInvoicePaidDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, T.DocInvoiceDate, T.DocInvoicePaidDate) / 60 %60 AS NVARCHAR(50))  
--(select dbo.getdatetimediff ( T.DocInvoicePaidDate,T.DocInvoiceDate))ELSE NULL END,
--(select dbo.fn_GetWorkingDayMinuts( T.DocInvoiceDate,T.DocInvoicePaidDate,@CountryID))ELSE NULL END, 
(select dbo.fn_GetWorkingDayMinuts (DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.DocInvoiceDate),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.DocInvoicePaidDate),@CountryID)) ELSE NULL end,
  
--T.DealDeclined= CASE WHEN T.DeclineDateTime IS NOT NULL AND T.CreateDateTime IS NOT NULL THEN 
--CAST(DATEDIFF(day,T.CreateDateTime, T.DeclineDateTime) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.CreateDateTime, T.DeclineDateTime) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, T.CreateDateTime, T.DeclineDateTime) / 60 % 60 AS NVARCHAR(50))  
--ELSE NULL END,  


T.DealDeclined=  CASE
    WHEN  T.DeclineDateTime is not null and T.FinanceStatusId =@Declined  AND T.CreateDateTime IS NOT NULL  THEN 	
	 -- CAST(DATEDIFF(day,T.CreateDateTime, T.DeclineDateTime) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.CreateDateTime, T.DeclineDateTime) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, T.CreateDateTime, T.DeclineDateTime) / 60 % 60 AS NVARCHAR(50))  
    --(select dbo.getdatetimediff (T.DeclineDateTime,T.CreateDateTime))  
	--(select dbo.fn_GetWorkingDayMinuts(T.CreateDateTime,T.DeclineDateTime,@CountryID))
	(select dbo.fn_GetWorkingDayMinuts(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreateDateTime),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.DeclineDateTime),@CountryID))
	WHEN T.DealNotTakenDate  is not null and T.FinanceStatusId =@DealNotTakenUp AND T.CreateDateTime IS NOT NULL  THEN 
	--CAST(DATEDIFF(day,T.CreateDateTime, T.DealNotTakenDate) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.CreateDateTime,T.DealNotTakenDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, T.CreateDateTime, T.DealNotTakenDate) / 60 % 60 AS NVARCHAR(50))  
     --(select dbo.getdatetimediff (T.DealNotTakenDate,T.CreateDateTime))
	 --(select dbo.fn_GetWorkingDayMinuts(T.CreateDateTime,T.DealNotTakenDate,@CountryID))
	 (select dbo.fn_GetWorkingDayMinuts(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreateDateTime),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.DealNotTakenDate),@CountryID))
	WHEN T.CustomerCancelledDate is not null  and T.FinanceStatusId =@CustomerCancelled AND T.CreateDateTime IS NOT NULL THEN 
	--CAST(DATEDIFF(day,T.CreateDateTime, T.CustomerCancelledDate) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.CreateDateTime, T.CustomerCancelledDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, T.CreateDateTime, T.CustomerCancelledDate) / 60 % 60 AS NVARCHAR(50)) 
	 --(select dbo.getdatetimediff (T.CustomerCancelledDate,T.CreateDateTime))
	 --(select dbo.fn_GetWorkingDayMinuts(T.CreateDateTime,T.CustomerCancelledDate,@CountryID))
	 (select dbo.fn_GetWorkingDayMinuts(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreateDateTime),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CustomerCancelledDate),@CountryID))      
ELSE NULL END, 

----------------------------------  

--T.Receivedbyfandi= CASE WHEN T.ReceivedByFAndIDate IS NOT NULL AND T.CreateDateTime IS NOT NULL THEN   
--CAST(DATEDIFF(day,T.CreateDateTime, T.ReceivedByFAndIDate) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.CreateDateTime, T.ReceivedByFAndIDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, T.CreateDateTime, T.ReceivedByFAndIDate) / 60 % 60 AS NVARCHAR(50))  
--ELSE NULL END,  
  

T.Receivedbyfandi= CASE WHEN T.ReceivedByFAndIDate IS NOT NULL AND T.CreateDateTime IS NOT NULL THEN   
--(select dbo.getdatetimediff (T.ReceivedByFAndIDate,T.CreateDateTime)) 
--(select dbo.fn_GetWorkingDayMinuts (T.CreateDateTime,T.ReceivedByFAndIDate,@CountryID)) 
(select dbo.fn_GetWorkingDayMinuts (DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CreateDateTime),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.ReceivedByFAndIDate),@CountryID)) ELSE NULL END,  
  


T.FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled =   CASE
    WHEN  T.DeclineDateTime is not null and T.FinanceStatusId =@Declined  AND T.FirstApplyDate IS NOT NULL and T.FirstApplyDate!=''  THEN 
	--CAST(DATEDIFF(hour,CAST(T.FirstApplyDate as datetime),T.DeclineDateTime)/24 AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second,CAST(T.FirstApplyDate as datetime),T.DeclineDateTime) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, CAST(T.FirstApplyDate as datetime),T.DeclineDateTime) / 60 % 60 AS NVARCHAR(50))  
  --(select dbo.getdatetimediff (DATEADD(mi,@UTCTimeOffset,T.DeclineDateTime ),CAST(T.FirstApplyDate as datetime)))
  (select dbo.fn_GetWorkingDayMinuts (CAST(T.FirstApplyDate as datetime),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.DeclineDateTime ),@CountryID))  
    WHEN T.DealNotTakenDate  is not null and T.FinanceStatusId =@DealNotTakenUp AND T.FirstApplyDate IS NOT NULL and T.FirstApplyDate!=''  THEN 
	--CAST(DATEDIFF(hour,CAST(T.FirstApplyDate as datetime),T.DealNotTakenDate)/24 AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second,CAST(T.FirstApplyDate as datetime),T.DealNotTakenDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, CAST(T.FirstApplyDate as datetime),T.DealNotTakenDate) / 60 % 60 AS NVARCHAR(50))  
  --(select dbo.getdatetimediff (DATEADD(mi,@UTCTimeOffset,T.DealNotTakenDate),CAST(T.FirstApplyDate as datetime)))
  (select dbo.fn_GetWorkingDayMinuts (CAST(T.FirstApplyDate as datetime),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.DealNotTakenDate),@CountryID))
    WHEN T.CustomerCancelledDate is not null  and T.FinanceStatusId =@CustomerCancelled AND T.FirstApplyDate IS NOT NULL and T.FirstApplyDate!='' THEN 
	--CAST(DATEDIFF(hour,CAST(T.FirstApplyDate as datetime),T.CustomerCancelledDate)/24 AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second,CAST(T.FirstApplyDate as datetime),T.CustomerCancelledDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, CAST(T.FirstApplyDate as datetime),T.CustomerCancelledDate) / 60 % 60 AS NVARCHAR(50))  
  --(select dbo.getdatetimediff (DATEADD(mi,@UTCTimeOffset,T.CustomerCancelledDate),CAST(T.FirstApplyDate as datetime)))
  (select dbo.fn_GetWorkingDayMinuts (CAST(T.FirstApplyDate as datetime),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CustomerCancelledDate),@CountryID))
    ELSE NULL         
END, 
  
T.FirstAppliedToPurchaseOrderIssued= CASE WHEN   T.FirstApplyDate IS NOT NULL AND T.PurchaseOrderIssuedDate IS NOT NULL  and T.FirstApplyDate !='' THEN   
--CAST(DATEDIFF(day, CAST(T.FirstApplyDate as datetime),FORMAT(DATEADD(mi,@UTCTimeOffset,T.PurchaseOrderIssuedDate ), 'dd-MMM-yyyy HH:mm', 'en-US' ) ) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second,  CAST(T.FirstApplyDate as datetime),FORMAT(DATEADD(mi,@UTCTimeOffset,T.PurchaseOrderIssuedDate ), 'dd-MMM-yyyy HH:mm', 'en-US' ) ) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second, CAST(T.FirstApplyDate as datetime),
--FORMAT(DATEADD(mi,@UTCTimeOffset,T.PurchaseOrderIssuedDate ), 'dd-MMM-yyyy HH:mm', 'en-US' ) ) / 60 % 60 AS NVARCHAR(50))  ELSE NULL END,  
--(select dbo.getdatetimediff (DATEADD(mi,@UTCTimeOffset,T.PurchaseOrderIssuedDate ),CAST(T.FirstApplyDate as datetime))) ELSE NULL END,
(select dbo.fn_GetWorkingDayMinuts (CAST(T.FirstApplyDate as datetime),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.PurchaseOrderIssuedDate ),@CountryID)) ELSE NULL END,  


T.FirstAppliedToPaidOut = CASE WHEN T.FirstApplyDate IS NOT NULL AND T.DocInvoicePaidDate IS NOT NULL  and T.FirstApplyDate !='' THEN   
--CAST(DATEDIFF(day, CAST(T.FirstApplyDate as datetime),FORMAT(DATEADD(mi,@UTCTimeOffset,T.DocInvoicePaidDate), 'dd-MMM-yyyy HH:mm', 'en-US' )) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second,  CAST(T.FirstApplyDate as datetime),FORMAT(DATEADD(mi,@UTCTimeOffset,T.DocInvoicePaidDate), 'dd-MMM-yyyy HH:mm', 'en-US' )) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second,CAST(T.FirstApplyDate as datetime),FORMAT(DATEADD(mi,@UTCTimeOffset,T.DocInvoicePaidDate), 'dd-MMM-yyyy HH:mm', 'en-US' )) / 60 % 60 AS
-- NVARCHAR(50))  
--(select dbo.getdatetimediff (DATEADD(mi,@UTCTimeOffset,T.DocInvoicePaidDate ),CAST(T.FirstApplyDate as datetime))) ELSE NULL END, 
(select dbo.fn_GetWorkingDayMinuts (CAST(T.FirstApplyDate as datetime),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.DocInvoicePaidDate ),@CountryID)) ELSE NULL END, 
  
T.PurchaseOrderIssuedToIncept= CASE WHEN T.IsIncepted=1 and T.PurchaseOrderIssuedDate IS NOT NULL AND T.InceptDate IS NOT NULL THEN   
--CAST(DATEDIFF(day,T.PurchaseOrderIssuedDate,T.InceptDate) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.PurchaseOrderIssuedDate,T.InceptDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second,T.PurchaseOrderIssuedDate,T.InceptDate) / 60 % 60 AS NVARCHAR(50))  
--(select dbo.getdatetimediff (T.InceptDate,T.PurchaseOrderIssuedDate))  ELSE NULL END,   
--(select dbo.fn_GetWorkingDayMinuts (T.PurchaseOrderIssuedDate,T.InceptDate,@CountryID))  ELSE NULL END,   
 (select dbo.fn_GetWorkingDayMinuts (DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.PurchaseOrderIssuedDate),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.InceptDate),@CountryID)) ELSE NULL END,


T.FirstAppliedToIncept= CASE WHEN  T.IsIncepted=1 and  T.InceptDate IS NOT NULL AND T.FirstApplyDate IS NOT NULL and T.FirstApplyDate!='' THEN   
--CAST(DATEDIFF(day,CAST(T.FirstApplyDate as datetime),FORMAT(DATEADD(mi,@UTCTimeOffset,T.InceptDate), 'dd-MMM-yyyy HH:mm', 'en-US' )) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second,CAST(T.FirstApplyDate as datetime),FORMAT(DATEADD(mi,@UTCTimeOffset,T.InceptDate), 'dd-MMM-yyyy HH:mm', 'en-US' )) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second,CAST(T.FirstApplyDate as datetime),FORMAT(DATEADD(mi,@UTCTimeOffset,T.InceptDate), 'dd-MMM-yyyy HH:mm', 'en-US' )) / 60 % 60 AS NVARCHAR(50))  
--ELSE NULL END,
--(select dbo.getdatetimediff (DATEADD(mi,@UTCTimeOffset,T.InceptDate ),CAST(T.FirstApplyDate as datetime))) ELSE NULL END,
(select dbo.fn_GetWorkingDayMinuts (CAST(T.FirstApplyDate as datetime),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.InceptDate ),@CountryID)) ELSE NULL END, 



T.AppliedToCustomerCancelled= CASE WHEN T.CustomerCancelledDate IS NOT NULL AND T.FirstApplyDate IS NOT NULL and T.FirstApplyDate!='' THEN   
--CAST(DATEDIFF(day,FORMAT(DATEADD(mi,@UTCTimeOffset,T.CustomerCancelledDate), 'dd-MMM-yyyy HH:mm', 'en-US' ),CAST(T.FirstApplyDate as datetime)) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second,FORMAT(DATEADD(mi,@UTCTimeOffset,T.CustomerCancelledDate), 'dd-MMM-yyyy HH:mm', 'en-US' ),CAST(T.FirstApplyDate as datetime)) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second,FORMAT(DATEADD(mi,@UTCTimeOffset,T.CustomerCancelledDate), 'dd-MMM-yyyy HH:mm', 'en-US' ),CAST(T.FirstApplyDate as datetime)) / 60 %
-- 60 AS NVARCHAR(50))  
--(select dbo.getdatetimediff (CAST(T.FirstApplyDate as datetime),DATEADD(mi,@UTCTimeOffset,T.CustomerCancelledDate))) ELSE NULL END, 
(select dbo.fn_GetWorkingDayMinuts (CAST(T.FirstApplyDate as datetime),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.CustomerCancelledDate),@CountryID)) ELSE NULL END,
  
T.AppliedToDeclined= CASE WHEN  T.FinanceDeclinedDate IS NOT NULL AND T.FirstApplyDate IS NOT NULL and T.FirstApplyDate!='' THEN   
--CAST(DATEDIFF(day,FORMAT(DATEADD(mi,@UTCTimeOffset,T.FinanceDeclinedDate), 'dd-MMM-yyyy HH:mm', 'en-US' ),CAST(T.FirstApplyDate as datetime)) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second,FORMAT(DATEADD(mi,@UTCTimeOffset,T.FinanceDeclinedDate), 'dd-MMM-yyyy HH:mm', 'en-US' ),CAST(T.FirstApplyDate as datetime)) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second,FORMAT(DATEADD(mi,@UTCTimeOffset,T.FinanceDeclinedDate), 'dd-MMM-yyyy HH:mm', 'en-US' ),CAST(T.FirstApplyDate as datetime)) / 60 % 60 AS  NVARCHAR(50)) ELSE NULL END,
--(select dbo.getdatetimediff (CAST(T.FirstApplyDate as datetime),DATEADD(mi,@UTCTimeOffset,T.FinanceDeclinedDate))) ELSE NULL END, 
(select dbo.fn_GetWorkingDayMinuts (CAST(T.FirstApplyDate as datetime),DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.FinanceDeclinedDate),@CountryID)) ELSE NULL END, 


T.ApprovedToPurchaseOrderIssued= CASE WHEN  T.PurchaseOrderIssuedDate IS NOT NULL AND T.AppliedToApprovedDate IS NOT NULL THEN   
--CAST(DATEDIFF(day,T.AppliedToApprovedDate,T.PurchaseOrderIssuedDate) AS NVARCHAR(50))+ ':' + CAST(DATEDIFF(second, T.AppliedToApprovedDate,T.PurchaseOrderIssuedDate) / 60 / 60 % 24  AS NVARCHAR(50)) + ':'  + CAST(DATEDIFF(second,T.AppliedToApprovedDate,T.PurchaseOrderIssuedDate) / 60 % 60 AS NVARCHAR(50))  
--(select dbo.getdatetimediff (T.PurchaseOrderIssuedDate,T.AppliedToApprovedDate))  ELSE NULL END
--(select dbo.fn_GetWorkingDayMinuts (T.AppliedToApprovedDate,T.PurchaseOrderIssuedDate,@CountryID))  ELSE NULL END  
(select dbo.fn_GetWorkingDayMinuts (DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.AppliedToApprovedDate),CAST(DATEADD(mi,(SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = T.TransactionId ),(select CountryId from [Transaction] where id = T.TransactionId ))),T.PurchaseOrderIssuedDate) as datetime),@CountryID)) ELSE NULL END


FROM #TempDealTrackerReport T  
INNER JOIN #TempDealTrackerReport M ON M.TransactionId=T.TransactionId   

--select T.CreateToApplyDate, T.AppliedToApprovedDate,@ContractSigned
--FROM #TempDealTrackerReport T  
--INNER JOIN #TempDealTrackerReport M ON M.TransactionId=T.TransactionId  
/*SQL changes for EDMX update*/  
/*
SELECT  
 cast(null as bigint)  as TransactionId,  
 cast(null as NVARCHAR(200))  as CashTransaction,  
 cast(null as NVARCHAR(max))  as ClientName,  
 cast(null as NVARCHAR(max))  as BusinessManagerName,  
 cast(null as NVARCHAR(max))  as SalesPersonName,  
 cast(null as NVARCHAR(200))  as CreatedDate,  
 cast(null as NVARCHAR(200))  as CreatedBy,  
 cast(null as NVARCHAR(200))  as CustomerAccessFinApp,  
 cast(null as NVARCHAR(200))  as FinanceCompany,  
 cast(null as bigint)  as CompanyCompanyTypeId,  
 cast(null as NVARCHAR(200))  as FinanceApplicationFinanceStatus,  
 cast(null as NVARCHAR(200))  as FirstApplyDate,  
 cast(null as bigint)  as NumberOfTimesApplied,  
 cast(null as DATETIME)  as CreateToApplyDate,  
 cast(null as DATETIME)  as AppliedToApprovedDate,  
 cast(null as DATETIME)  as ApprovedToContractSignedDate,  
 cast(null as DATETIME)  as ContractSignedToPayoutRequestDate,  
  cast(null as NVARCHAR(200))  as CreateToApply,  
 cast(null as NVARCHAR(200))  as AppliedToApproved,  
 cast(null as NVARCHAR(200))  as ApprovedToContractSigned,  
 cast(null as NVARCHAR(200))  as ContractSignedToIncept,  
 cast(null as NVARCHAR(200))  as ContractSignedToPayoutRequest,  
 cast(null as NVARCHAR(200))  as PayoutRequestToPaidOut,  
 cast(null as NVARCHAR(200)) as CreateToCallBackCustomer,  
 cast(null as NVARCHAR(200))as DealDeclined,  
 cast(null as DECIMAL(18,2)) as ResidualValue,  
 cast(null as NVARCHAR(200)) as InceptToVehicleDelivery,  
 cast(null as NVARCHAR(200)) as CreateToIncept,  
 cast(null as NVARCHAR(200)) as CreateToPaidOut,  
 cast(null as NVARCHAR(200)) as DebtorsDays,  
 cast(null as NVARCHAR(200)) as TransactionStatus,  
 cast(null as DECIMAL(18,2)) as TransactionAmount,  
 cast(null as DECIMAL(18,2)) as DICAmount,  
 cast(null as NVARCHAR(200)) as GroupName,  
 cast(null as NVARCHAR(200)) as BranchName,  
 cast(null as NVARCHAR(200)) as FinanceType,  
 cast(null as NVARCHAR(200)) as FinanceCompanyTakenUp,  
 cast(null as BIGINT) as FinanceTerm,  
 cast(null as DECIMAL(18,2)) as Rate,  
 cast(null as BIT) as IsCashTransaction,  
 cast(null as BIT) as IsIncepted,  
 cast(null as BIGINT) as CompanyId,  
 cast(null as DATETIME) as CreateDateTime,  
 cast(null as DATETIME) as InceptDate,  
 cast(null as DATETIME) as VehicleDeliveryDate,  
 cast(null as DATETIME) as DocInvoicePaidDate,  
cast(null as DATETIME) as DocInvoiceDate,  
cast(null as DATETIME) as PayOutRequestDate,  
cast(null as DATETIME) as CallBackCustomerDateTime,  
cast(null as DATETIME)  DeclineDateTime,  
cast(null as nvarchar(50)) as AppliedForFinance,  
cast(null as nvarchar(50)) ReceivedByFAndI,  
cast(null as nvarchar(50)) FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled, --pending  
cast(null as nvarchar(50)) FirstAppliedToPurchaseOrderIssued ,  
cast(null as nvarchar(50)) FirstAppliedToPaidOut ,  
cast(null as nvarchar(50)) ApprovedToPurchaseOrderIssued,  
cast(null as nvarchar(50)) PurchaseOrderIssuedToIncept ,  
cast(null as nvarchar(50)) FirstAppliedToIncept ,  
cast(null as nvarchar(50)) AppliedToCustomerCancelled ,  
cast(null as nvarchar(50)) AppliedToDeclined,  
cast(null as DATETIME)  PurchaseOrderIssuedDate,  
cast(null as DATETIME)	DealNotTakenDate,  
cast(null as DATETIME)  CustomerCancelledDate,  
cast(null as DATETIME)  ReceivedByFAndIDate,  
cast(null as bit)    as IsGeneric  
  
*/
  
SELECT distinct TransactionId,  
   CashTransaction,  
   ClientName ,  
   BusinessManagerName,  
   UPPER(SalesPersonName) as SalesPersonName ,  
   UPPER(  LEFT(CreatedDate, LEN(CreatedDate) - 3) ) AS CreatedDate ,  
   CreatedBy ,  
   CustomerAccessFinApp,  
   CASE WHEN IsCashTransaction=0 THEN UPPER(FinanceCompany) ELSE  '' END AS FinanceCompany,  
   CompanyCompanyTypeId,  
   CASE WHEN IsCashTransaction=0 THEN UPPER(FinanceApplicationFinanceStatus) ELSE ' | ' END AS FinanceApplicationFinanceStatus,  
   CASE WHEN IsCashTransaction=0 THEN UPPER(FirstApplyDate) ELSE ''  END AS  FirstApplyDate,  
   CASE WHEN IsCashTransaction=0 THEN NumberOfTimesApplied ELSE  0 END AS NumberOfTimesApplied,  
   CreateToApplyDate,  
   AppliedToApprovedDate,  
   ApprovedToContractSignedDate,  
   ContractSignedToPayoutRequestDate,  
   CASE WHEN IsCashTransaction=0 THEN CreateToApply ELSE  '' END AS CreateToApply,  
   CASE WHEN IsCashTransaction=0 THEN AppliedToApproved ELSE ''  END AS AppliedToApproved,  
   CASE WHEN IsCashTransaction=0 THEN ApprovedToContractSigned ELSE  '' END AS ApprovedToContractSigned,  
   CASE WHEN IsCashTransaction=0 THEN ContractSignedToIncept ELSE  ''  END AS ContractSignedToIncept,  
   CASE WHEN IsCashTransaction=0 THEN ContractSignedToPayoutRequest ELSE ''  END AS ContractSignedToPayoutRequest,  
   CASE WHEN IsCashTransaction=0 THEN PayoutRequestToPaidOut ELSE  '' END AS PayoutRequestToPaidOut,  
   CreateToCallBackCustomer,  
   DealDeclined,  
   DeclineDateTime,
   ResidualValue,  
   CASE WHEN IsIncepted=0 THEN '' ELSE  InceptToVehicleDelivery END AS InceptToVehicleDelivery,   
   CASE WHEN IsIncepted=0 THEN '' ELSE CreateToIncept END AS CreateToIncept,  
   CreateToPaidOut,  
   DebtorsDays,  
   UPPER(TransactionStatus) AS TransactionStatus,  
   CASE WHEN IsIncepted=0 THEN 0 ELSE TransactionAmount END AS TransactionAmount,  
   DICAmount,  
   GroupName,  
   BranchName,  
   FinanceType,  
   CASE WHEN IsIncepted=0 THEN '' ELSE FinanceCompanyTakenUp END AS FinanceCompanyTakenUp,  
   FinanceTerm,  
   Rate,  
   IsCashTransaction,  
   IsIncepted,     
   CompanyId,  
   CreateDateTime,  
   InceptDate,  
   VehicleDeliveryDate,  
   DocInvoicePaidDate,  
   DocInvoiceDate,  
   PayOutRequestDate,  
   CallBackCustomerDateTime,  
   AppliedForFinance,  
   FirstAppliedToCustomerCancelledDealNotTakenUpCustomerCancelled,  
   ReceivedByFAndI,  
   FirstAppliedToPurchaseOrderIssued,  
   FirstAppliedToPaidOut ,
   ApprovedToPurchaseOrderIssued,  
   PurchaseOrderIssuedToIncept ,  
   FirstAppliedToIncept ,  
   AppliedToCustomerCancelled ,  
   AppliedToDeclined,  
   PurchaseOrderIssuedDate,
   DealNotTakenDate,  
   CustomerCancelledDate,  
   ReceivedByFAndIDate,  
   @IsGeneric as IsGeneric
     
FROM #TempDealTrackerReport  
 
END
