
-- =============================================
-- Author:	Vikas Nagare	
-- Create date: 08-12-2015
-- Description:	Stored procedure for Unincept audit trail
-- =============================================
CREATE PROCEDURE [dbo].[spUninceptAuditLog] (@InceptTransactionId BIGINT, @CountryId BIGINT)
AS
BEGIN
declare @TransactionId bigint
declare @UTCTimeOffset int

	SET @TransactionId = (Select TransactionId from [InceptTransaction] Where Id= @InceptTransactionId)
	set @UTCTimeOffset = (SELECT dbo.fn_GetUTCOffsetMinutes((select BranchId from [Transaction] where id = @TransactionId),(select CountryId from [Transaction] where id = @TransactionId)))

		SELECT DATEADD(MINUTE,(Select ISNULL(@UTCTimeOffset,0) ), C.EventDateUTC) AS ModifiedDate, 'UNINCEPTED' AS [Action], 
			(U.FirstName+ ' ' + U.LastName) AS  ModifiedByName,
			C.NewValue As UninceptReason
	from [Audit] C
	INNER JOIN USERS U ON U.ID = C.UserId

	Where C.ColumnName='UninceptReason' AND 
			C.NewValue <> '' AND
			C.RecordId= @InceptTransactionId AND
			C.TableName = 'InceptTransaction'

UNION 
SELECT DATEADD(MINUTE,(Select ISNULL(@UTCTimeOffset,0)), C.EventDateUTC) AS ModifiedDate, 'INCEPTED' AS [Action], 
			(U.FirstName+ ' ' + U.LastName) AS  ModifiedByName,
			'' As UninceptReason
	from [Audit] C
	INNER JOIN USERS U ON U.ID = C.UserId
	Where C.ColumnName='IsIncepted' 
	AND C.RecordId= (Select TransactionId from [InceptTransaction] Where Id= @InceptTransactionId)
	AND C.NewValue = 'True'
	AND C.TableName = 'Transaction'
	
	ORDER BY ModifiedDate DESC
END

