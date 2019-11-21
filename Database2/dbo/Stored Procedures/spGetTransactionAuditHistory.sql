-- ============================================================================================
--Author- Manish
--CreateDate- 15-10-2019
--Description- Get transaction audit log
--============================================================================================
CREATE PROCEDURE [dbo].[spGetTransactionAuditHistory](
@TransactionId BIGINT
)

AS
BEGIN

SET FMTONLY OFF;
	--- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	 IF OBJECT_ID('tempdb..#TempTransactionAuditDetail') IS NOT NULL    
	 BEGIN    
		DROP TABLE #TempTransactionAuditDetail    
	 END 

     CREATE TABLE #TempTransactionAuditDetail (    
	 TransactionId  BIGINT     
	 ,UserName      VARCHAR(500)    
	 ,EventDateUTC  VARCHAR(500)        
	 ,TableName     VARCHAR(500)        
	 ,ColumnName    VARCHAR(500) 
	 ,OriginalValue VARCHAR(max) 
	 ,NewValue      VARCHAR(max) 
	 )

	IF EXISTS (SELECT 1 FROM [Transaction] (NOLOCK) WHERE Id=@TransactionId)
	BEGIN
				INSERT INTO #TempTransactionAuditDetail  
				SELECT @TransactionId AS TransactionId,
				UPPER(U.FirstName +' ' +U.LastName) AS UserName,
				A.EventDateUTC,
				A.TableName,
				A.ColumnName,
				A.OriginalValue,
				A.NewValue
				FROM [Audit]  (NOLOCK) A
				INNER JOIN Users (NOLOCK) U ON U.Id=A.UserId
				WHERE A.TableName='Transaction' 
				AND A.RecordId in (SELECT Id FROM [Transaction](NOLOCK) WHERE Id=@TransactionId)
	END

	 IF EXISTS (SELECT 1 FROM TransactionIncomeANDExpenditure (NOLOCK) WHERE TransactionId=@TransactionId)
	 BEGIN
				INSERT INTO #TempTransactionAuditDetail  
				SELECT @TransactionId AS TransactionId,
				UPPER(U.FirstName +' ' +U.LastName) AS UserName,
				A.EventDateUTC,
				A.TableName,
				A.ColumnName,
				A.OriginalValue,
		        A.NewValue
				FROM [Audit] (NOLOCK) A
				INNER JOIN Users (nolock) U ON U.Id=A.UserId
				WHERE 
				A.TableName='TransactionIncomeANDExpenditure' 
				AND A.RecordId in (SELECT Id FROM TransactionIncomeANDExpenditure (NOLOCK) WHERE TransactionId=@TransactionId)				
	END


	IF EXISTS (SELECT 1 FROM TransactionEmployerDetails (NOLOCK) WHERE TransactionId=@TransactionId)
	BEGIN
				INSERT INTO #TempTransactionAuditDetail  
				SELECT @TransactionId AS TransactionId,
				UPPER(U.FirstName +' ' +U.LastName) AS UserName,
				A.EventDateUTC,
				A.TableName,
				A.ColumnName,
				A.OriginalValue,
				A.NewValue
				FROM [Audit] (NOLOCK) A
				INNER JOIN Users (nolock) U ON U.Id=A.UserId
				WHERE A.TableName='TransactionEmployerDetails' 
				AND A.RecordId in (SELECT Id FROM [TransactionEmployerDetails] (NOLOCK) WHERE Id=@TransactionId)
	END

	IF EXISTS (SELECT 1 FROM TransactionBankingDetails (NOLOCK) WHERE TransactionId=@TransactionId)
	BEGIN
				INSERT INTO #TempTransactionAuditDetail  
				SELECT @TransactionId AS TransactionId,
				UPPER(U.FirstName +' ' +U.LastName) AS UserName,
				A.EventDateUTC,
				A.TableName,
				A.ColumnName,

				A.OriginalValue,
				A.NewValue
				FROM [Audit] (NOLOCK) A
				INNER JOIN Users (nolock) U ON U.Id=A.UserId
				WHERE A.TableName='TransactionBankingDetails' 
				AND A.RecordId in (SELECT Id FROM [TransactionBankingDetails] (NOLOCK) WHERE TransactionId=@TransactionId)
	END

	IF EXISTS (SELECT 1 FROM TransactionClient (NOLOCK) WHERE Id=@TransactionId)
	BEGIN
				INSERT INTO #TempTransactionAuditDetail  
				SELECT @TransactionId AS TransactionId,
				UPPER(U.FirstName +' ' +U.LastName) AS UserName,
				A.EventDateUTC,
				A.TableName,
				A.ColumnName,
				A.OriginalValue,
				A.NewValue
				FROM [Audit] (NOLOCK) A
				INNER JOIN Users (nolock) U ON U.Id=A.UserId
				WHERE A.TableName='TransactionClient' 
				AND A.RecordId in (SELECT Id FROM [TransactionClient] (NOLOCK) WHERE Id=@TransactionId)
	END

	 

	SELECT  UserName, EventDateUTC, TableName, ColumnName, OriginalValue, NewValue     
	FROM #TempTransactionAuditDetail 
	Order by EventDateUTC desc

END