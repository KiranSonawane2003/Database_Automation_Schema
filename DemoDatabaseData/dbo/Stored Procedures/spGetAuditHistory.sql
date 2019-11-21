
CREATE PROCEDURE [dbo].[spGetAuditHistory](@TableName NVARCHAR(200), @TransactionId BIGINT)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @UTCTimeOffset int
	-- Get UTC Time Offset from Country Table and get country Id from Transaction table
	-- select @UTCTimeOffset = UTCTimeOffset from Country where id = 

	set @UTCTimeOffset = (SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = @TransactionId),(select CountryId from [Transaction] where id = @TransactionId)))

SELECT * FROM 
(
		SELECT 

		CASE 
		WHEN ColumnName = 'TransactionTypeId' THEN 'Transaction Type'
		WHEN ColumnName = 'TransactionStatusNotes' THEN 'Transaction Status Notes'
		WHEN ColumnName = 'TransactionStatusId' THEN 'Transaction Status'
		WHEN ColumnName = 'FinanceStatusId' THEN 'Finance Status'
		WHEN ColumnName = 'FinanceStatusNotes' THEN 'Finance Status Notes'
		WHEN ColumnName = 'IsDealSighted' THEN 'Deal Sighted'
		WHEN ColumnName = 'SalesPersonId' THEN 'Sales Person'
		WHEN ColumnName = 'BusinessManagerId' THEN 'Business Manager'
		WHEN ColumnName = 'IsCashTransaction' THEN 'Cash Transaction'
		WHEN ColumnName = 'PreferredInterestRate' THEN 'Preferred Interest Rate'
		WHEN ColumnName = 'IsPreArrangedFinance' THEN 'PreArranged Finance'
		WHEN ColumnName = 'FinanceCompanyId' THEN 'Finance Company'
		WHEN ColumnName = 'FinanceAccountNumber' THEN 'Finance Account Number'
		WHEN ColumnName = 'PaymentType' THEN 'Payment Type'
		WHEN ColumnName = 'FinanceTermId' THEN 'Finance Term (Months)'
		WHEN ColumnName = 'InterestRateTypeId' THEN 'Interest Rate Type'
		WHEN ColumnName = 'ProfitRate' THEN 'Profit Rate'
		WHEN ColumnName = 'FinanceType' THEN 'Finance Type'
		WHEN ColumnName = 'PreferredCallTime' THEN 'Preferred Contact Time' ELSE '' END AS ColumnName,

		CASE 
		WHEN ColumnName = 'TransactionTypeId' THEN  (SELECT NAME FROM StaticValue Where Id = Convert(BIGINT,ISNULL(A.OriginalValue,0)))
		WHEN ColumnName = 'TransactionStatusId' THEN (SELECT NAME FROM StaticValue Where Id = Convert(BIGINT,ISNULL(A.OriginalValue,0)))
		WHEN ColumnName = 'FinanceStatusId' THEN (SELECT NAME FROM StaticValue Where Id = Convert(BIGINT,ISNULL(A.OriginalValue,0)))
		WHEN ColumnName = 'SalesPersonId' THEN (SELECT  SalesPersonName FROM SalesPerson Where Id = Convert(BIGINT,ISNULL(A.OriginalValue,0)))
		WHEN ColumnName = 'BusinessManagerId' THEN (SELECT FirstName + ' ' + LastName FROM Users Where Id = Convert(BIGINT,ISNULL(A.OriginalValue,0)))
		WHEN ColumnName = 'PreferredInterestRate' THEN A.OriginalValue
		WHEN ColumnName = 'FinanceCompanyId' THEN (SELECT CompanyName FROM Company Where Id = (SELECT CompanyId FROM CompanyCompanyTypeMapping Where Id= Convert(BIGINT,ISNULL(A.OriginalValue,0))))
		WHEN ColumnName = 'PaymentType' THEN (SELECT NAME FROM StaticValue Where Id = Convert(BIGINT,ISNULL(A.OriginalValue,0)))
		WHEN ColumnName = 'FinanceTermId' THEN (SELECT Convert(nvarchar,FinanceTermName)  FROM FinanceTerm Where Id = Convert(BIGINT,ISNULL(A.OriginalValue,0)))
		WHEN ColumnName = 'InterestRateTypeId' THEN (SELECT NAME FROM StaticValue Where Id = Convert(BIGINT,ISNULL(A.OriginalValue,0)))
		WHEN ColumnName = 'FinanceType' THEN (SELECT NAME FROM StaticValue Where Id = Convert(BIGINT,ISNULL(A.OriginalValue,0)))
		WHEN ColumnName = 'TransactionStatusNotes' THEN A.OriginalValue
		WHEN ColumnName = 'FinanceStatusNotes' THEN A.OriginalValue
		WHEN ColumnName = 'IsDealSighted' THEN A.OriginalValue
		WHEN ColumnName = 'IsCashTransaction' THEN A.OriginalValue
		WHEN ColumnName = 'IsPreArrangedFinance' THEN A.OriginalValue
		WHEN ColumnName = 'FinanceAccountNumber' THEN A.OriginalValue
		WHEN ColumnName = 'ProfitRate' THEN A.OriginalValue
		WHEN ColumnName = 'PreferredCallTime' THEN (SELECT NAME FROM StaticValue Where Id = Convert(BIGINT,ISNULL(A.OriginalValue,0))) ELSE '' END AS OriginalValue,

		CASE 
		WHEN ColumnName = 'TransactionTypeId' THEN (SELECT NAME FROM StaticValue Where Id = Convert(BIGINT,ISNULL(A.NewValue,0)))
		WHEN ColumnName = 'TransactionStatusId' THEN (SELECT NAME FROM StaticValue Where Id = Convert(BIGINT,ISNULL(A.NewValue,0)))
		WHEN ColumnName = 'FinanceStatusId' THEN (SELECT NAME FROM StaticValue Where Id = Convert(BIGINT,ISNULL(A.NewValue,0)))
		WHEN ColumnName = 'SalesPersonId' THEN (SELECT  SalesPersonName FROM SalesPerson Where Id = Convert(BIGINT,ISNULL(A.NewValue,0)))
		WHEN ColumnName = 'BusinessManagerId' THEN (SELECT FirstName + ' ' + LastName FROM Users Where Id = Convert(INT,A.NewValue))
		WHEN ColumnName = 'PreferredInterestRate' THEN A.NewValue
		WHEN ColumnName = 'FinanceCompanyId' THEN (SELECT CompanyName FROM Company Where Id = (SELECT CompanyId FROM CompanyCompanyTypeMapping Where Id= Convert(BIGINT,ISNULL(A.NewValue,0))))
		WHEN ColumnName = 'PaymentType' THEN (SELECT NAME FROM StaticValue Where Id = Convert(BIGINT,ISNULL(A.NewValue,0)))
		WHEN ColumnName = 'FinanceTermId' THEN (SELECT Convert(nvarchar,FinanceTermName)  FROM FinanceTerm Where Id = Convert(BIGINT,ISNULL(A.NewValue,0)))
		WHEN ColumnName = 'InterestRateTypeId' THEN (SELECT NAME FROM StaticValue Where Id = Convert(BIGINT,ISNULL(A.NewValue,0)))
		WHEN ColumnName = 'FinanceType' THEN (SELECT NAME FROM StaticValue Where Id = Convert(BIGINT,ISNULL(A.NewValue,0)))
		WHEN ColumnName = 'TransactionStatusNotes' THEN A.NewValue
		WHEN ColumnName = 'FinanceStatusNotes' THEN A.NewValue
		WHEN ColumnName = 'IsDealSighted' THEN A.NewValue
		WHEN ColumnName = 'IsCashTransaction' THEN A.NewValue
		WHEN ColumnName = 'IsPreArrangedFinance' THEN A.NewValue
		WHEN ColumnName = 'FinanceAccountNumber' THEN A.NewValue
		WHEN ColumnName = 'ProfitRate' THEN A.NewValue
		WHEN ColumnName = 'PreferredCallTime' THEN (SELECT NAME FROM StaticValue Where Id = Convert(BIGINT,ISNULL(A.NewValue,0))) ELSE '' END AS NewValue,

		A.AuditId,
		A.UserId,
		U.FirstName + ' ' + U.LastName AS UserName, 
		DATEADD(MINUTE, @UTCTimeOffset, A.EventDateUTC) as EventDateUTC,
		CASE WHEN A.EventType = 'A' THEN 'Created'
		WHEN A.EventType = 'M' THEN 'Modified' 
		WHEN A.EventType = 'D' THEN 'Deleted' 
		END AS EventType, A.TableName,A.RecordId

		FROM [Audit] A
		LEFT OUTER JOIN Users U ON A.UserId = U.Id 
		WHERE A.EventType = 'M' AND A.TableName = @TableName --AND A.OriginalValue IS NOT NULL and A.OriginalValue <> ''
		AND A.RecordId = @TransactionId
)  
AS R  Where R.ColumnName <> '' order by R.EventDateUTC DESC -- AND R.OldValue  <> '' 


	
END

