
CREATE PROCEDURE [dbo].[spTransactionDetailsAuditLog] (@PrimaryKeyId BIGINT, @LocaleId NVARCHAR(50), @CountryId BIGINT)
AS
BEGIN
	
	DECLARE @from_lsn BINARY(10), @to_lsn BINARY(10)
	DECLARE @TableName NVARCHAR(50)

	SET @from_lsn = (SELECT Min(__$start_lsn) FROM [cdc].[dbo_Transaction_CT])
	SET @to_lsn = (SELECT Max(__$start_lsn) FROM [cdc].[dbo_Transaction_CT])
	SET @TableName='dbo_Transaction'

SELECT * FROM
	(
		SELECT up_b.Id, FieldName=(SELECT TOP 1 Value FROM Localizations WHERE ResourceId= up_b.FieldName AND LocaleId=@LocaleId) , null AS old_value, Cast(up_b.new_value AS NVARCHAR(4000)) AS new_value, 'Created' AS operation, DATEADD (MINUTE, (SELECT UTCTimeOffset FROM Country WHERE Id=@CountryId),sys.fn_cdc_map_lsn_to_time(up_b.__$start_lsn)) AS commit_time, CAST((SELECT FirstName+' '+LastName FROM Users WHERE Id=up_b.ModifiedBy) AS NVARCHAR(4000)) AS ModifiedBy
		FROM
			( 
				SELECT __$start_lsn, Id, FieldName, new_value, ModifiedBy 
				FROM 
					(
						SELECT __$start_lsn, Id, ModifiedBy,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'TransactionTypeId'),__$update_mask) = 1) THEN CAST((SELECT Name FROM StaticValue WHERE Id=TransactionTypeId) AS SQL_VARIANT) ELSE NULL END AS TransactionTypeId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'TransactionStatusNotes'),__$update_mask) = 1) THEN CAST(TransactionStatusNotes AS SQL_VARIANT) ELSE NULL END AS TransactionStatusNotes,	
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'TransactionStatusId'),__$update_mask) = 1) THEN CAST((SELECT Name FROM StaticValue WHERE Id=TransactionStatusId) AS SQL_VARIANT) ELSE NULL END AS TransactionStatusId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceStatusId'),__$update_mask) = 1) THEN CAST((SELECT Name FROM StaticValue WHERE Id=FinanceStatusId) AS SQL_VARIANT) ELSE NULL END AS FinanceStatusId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceStatusNotes'),__$update_mask) = 1) THEN CAST(FinanceStatusNotes AS SQL_VARIANT) ELSE NULL END AS FinanceStatusNotes,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'IsDealSighted'),__$update_mask) = 1) THEN CAST(CASE WHEN (IsDealSighted) = 1 THEN 'Yes' ELSE 'No' END AS SQL_VARIANT) ELSE NULL END AS IsDealSighted,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'SalesPersonId'),__$update_mask) = 1) THEN CAST((SELECT SalesPersonName FROM SalesPerson WHERE Id=SalesPersonId) AS SQL_VARIANT) ELSE NULL END AS SalesPersonId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'BusinessManagerId'),__$update_mask) = 1) THEN CAST((SELECT FirstName+' '+LastName FROM Users WHERE Id=BusinessManagerId) AS SQL_VARIANT) ELSE NULL END AS BusinessManagerId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'IsCashTransaction'),__$update_mask) = 1) THEN CAST(CASE WHEN IsCashTransaction = 1 THEN 'Yes' ELSE 'No' END AS SQL_VARIANT) ELSE NULL END AS IsCashTransaction,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'PreferredInterestRate'),__$update_mask) = 1) THEN CAST((PreferredInterestRate) AS SQL_VARIANT) ELSE NULL END AS PreferredInterestRate,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'IsPreArrangedFinance'),__$update_mask) = 1) THEN CAST(CASE WHEN IsPreArrangedFinance = 1 THEN 'Yes' ELSE 'No' END AS SQL_VARIANT) ELSE NULL END AS IsPreArrangedFinance,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceCompanyId'),__$update_mask) = 1) THEN CAST((SELECT c.CompanyName FROM Company c INNER JOIN  CompanyCompanyTypeMapping cct ON c.Id = CompanyId AND cct.Id =FinanceCompanyId) AS SQL_VARIANT) ELSE NULL END AS FinanceCompanyId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceAccountNumber'),__$update_mask) = 1) THEN CAST((FinanceAccountNumber) AS SQL_VARIANT) ELSE NULL END AS FinanceAccountNumber,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'PaymentType'),__$update_mask) = 1) THEN CAST((SELECT Name FROM StaticValue WHERE Id=PaymentType) AS SQL_VARIANT) ELSE NULL END AS PaymentType,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceTermId'),__$update_mask) = 1) THEN CAST((SELECT FinanceTermName FROM FinanceTerm WHERE Id=FinanceTermId) AS SQL_VARIANT) ELSE NULL END AS FinanceTermId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'InterestRateTypeId'),__$update_mask) = 1) THEN CAST((SELECT Name FROM StaticValue WHERE Id=InterestRateTypeId) AS SQL_VARIANT) ELSE NULL END AS InterestRateTypeId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'ProfitRate'),__$update_mask) = 1) THEN CAST((ProfitRate) AS SQL_VARIANT) ELSE NULL END AS ProfitRate,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceType'),__$update_mask) = 1) THEN CAST((SELECT Name FROM StaticValue WHERE Id=FinanceType) AS SQL_VARIANT) ELSE NULL END AS FinanceType,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'PreferredCallTime'),__$update_mask) = 1) THEN CAST((SELECT Name FROM StaticValue WHERE Id=PreferredCallTime) AS SQL_VARIANT) ELSE NULL END AS PreferredCallTime
						FROM cdc.fn_cdc_get_all_changes_dbo_Transaction(@from_lsn, @to_lsn, N'all update old')
						WHERE __$operation = 2
					) AS t1
				UNPIVOT 
					(new_value 
					FOR FieldName IN (TransactionTypeId,TransactionStatusNotes,TransactionStatusId,FinanceStatusId,FinanceStatusNotes,IsDealSighted,SalesPersonId,BusinessManagerId,IsCashTransaction,PreferredInterestRate,IsPreArrangedFinance,FinanceCompanyId,FinanceAccountNumber,PaymentType,FinanceTermId,InterestRateTypeId,ProfitRate,FinanceType,PreferredCallTime) 
			) AS unp) 
		AS  up_b
	UNION
		SELECT up_b.Id,  FieldName=(SELECT TOP 1 Value FROM Localizations WHERE ResourceId= up_b.FieldName AND LocaleId=@LocaleId),Cast(up_b.old_value AS NVARCHAR(4000)) AS old_value,Cast(up_a.new_value AS NVARCHAR(4000)) AS new_value, 'Edited' AS operation, DATEADD(MINUTE, (SELECT UTCTimeOffset FROM Country WHERE Id=@CountryId),sys.fn_cdc_map_lsn_to_time(up_b.__$start_lsn)) AS commit_time ,  CAST((SELECT FirstName+' '+LastName FROM Users WHERE Id=up_a.ModifiedBy) AS NVARCHAR(4000)) AS ModifiedBy
		FROM
			( 
				SELECT __$start_lsn, Id, FieldName, old_value,ModifiedBy 
				FROM 
					(
						SELECT __$start_lsn, Id, ModifiedBy, 
						 
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'TransactionTypeId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT Name FROM StaticValue WHERE Id=TransactionTypeId) AS SQL_VARIANT),'') ELSE NULL END AS TransactionTypeId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'TransactionStatusNotes'),__$update_mask) = 1) THEN IsNull(CAST(TransactionStatusNotes AS SQL_VARIANT),'') ELSE NULL END AS TransactionStatusNotes,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'TransactionStatusId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT Name FROM StaticValue WHERE Id=TransactionStatusId) AS SQL_VARIANT),'') ELSE NULL END AS TransactionStatusId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceStatusId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT Name FROM StaticValue WHERE Id=FinanceStatusId) AS SQL_VARIANT),'') ELSE '' END AS FinanceStatusId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceStatusNotes'),__$update_mask) = 1) THEN IsNull(CAST(FinanceStatusNotes AS SQL_VARIANT),'') ELSE NULL END AS FinanceStatusNotes,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'IsDealSighted'),__$update_mask) = 1) THEN IsNull(CAST(CASE WHEN IsDealSighted = 1 THEN 'Yes' ELSE 'No' END AS SQL_VARIANT),'') ELSE NULL END AS IsDealSighted,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'SalesPersonId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT SalesPersonName FROM SalesPerson WHERE Id=SalesPersonId) AS SQL_VARIANT),'') ELSE NULL END AS SalesPersonId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'BusinessManagerId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT FirstName+' '+LastName FROM Users WHERE Id=BusinessManagerId) AS SQL_VARIANT),'') ELSE NULL END AS BusinessManagerId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'IsCashTransaction'),__$update_mask) = 1) THEN IsNull(CAST(CASE WHEN IsCashTransaction = 1 THEN 'Yes' ELSE 'No' END AS SQL_VARIANT),'') ELSE NULL END AS IsCashTransaction,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'PreferredInterestRate'),__$update_mask) = 1) THEN IsNull(CAST((PreferredInterestRate) AS SQL_VARIANT),'') ELSE NULL END AS PreferredInterestRate,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'IsPreArrangedFinance'),__$update_mask) = 1) THEN IsNull(CAST(CASE WHEN IsPreArrangedFinance = 1 THEN 'Yes' ELSE 'No' END AS SQL_VARIANT),'') ELSE NULL END AS IsPreArrangedFinance,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceCompanyId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT c.CompanyName FROM Company c INNER JOIN  CompanyCompanyTypeMapping cct ON c.Id = CompanyId AND cct.Id =FinanceCompanyId) AS SQL_VARIANT),'') ELSE NULL END AS FinanceCompanyId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceAccountNumber'),__$update_mask) = 1) THEN IsNull(CAST((FinanceAccountNumber) AS SQL_VARIANT),'') ELSE NULL END AS FinanceAccountNumber,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'PaymentType'),__$update_mask) = 1) THEN IsNull(CAST((SELECT Name FROM StaticValue WHERE Id=PaymentType) AS SQL_VARIANT),'') ELSE NULL END AS PaymentType,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceTermId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT FinanceTermName FROM FinanceTerm WHERE Id=FinanceTermId) AS SQL_VARIANT),'') ELSE NULL END AS FinanceTermId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'InterestRateTypeId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT Name FROM StaticValue WHERE Id=InterestRateTypeId) AS SQL_VARIANT),'') ELSE NULL END AS InterestRateTypeId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'ProfitRate'),__$update_mask) = 1) THEN IsNull(CAST((ProfitRate) AS SQL_VARIANT),'') ELSE NULL END AS ProfitRate,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceType'),__$update_mask) = 1) THEN IsNull(CAST((SELECT Name FROM StaticValue WHERE Id=FinanceType) AS SQL_VARIANT),'') ELSE NULL END AS FinanceType,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'PreferredCallTime'),__$update_mask) = 1) THEN IsNull(CAST((SELECT Name FROM StaticValue WHERE Id=PreferredCallTime) AS SQL_VARIANT),'') ELSE NULL END AS PreferredCallTime
						FROM cdc.fn_cdc_get_all_changes_dbo_Transaction(@from_lsn, @to_lsn, N'all update old')
						WHERE __$operation = 3
					) AS t1
				UNPIVOT 
					(old_value 
					FOR FieldName IN (TransactionTypeId,TransactionStatusNotes,TransactionStatusId,FinanceStatusId,FinanceStatusNotes,IsDealSighted,SalesPersonId,BusinessManagerId,IsCashTransaction,PreferredInterestRate,IsPreArrangedFinance,FinanceCompanyId,FinanceAccountNumber,PaymentType,FinanceTermId,InterestRateTypeId,ProfitRate,FinanceType,PreferredCallTime) 
				) AS unp
			) AS  up_b    -- before update
	INNER JOIN
		(
			SELECT __$start_lsn, Id, FieldName, new_value, ModifiedBy 
				FROM 
					(
						SELECT __$start_lsn, Id, ModifiedBy , 
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'TransactionTypeId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT Name FROM StaticValue WHERE Id=TransactionTypeId) AS SQL_VARIANT),'') ELSE NULL END AS TransactionTypeId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'TransactionStatusNotes'),__$update_mask) = 1) THEN IsNull(CAST(TransactionStatusNotes AS SQL_VARIANT),'') ELSE NULL END AS TransactionStatusNotes,	
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'TransactionStatusId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT Name FROM StaticValue WHERE Id=TransactionStatusId) AS SQL_VARIANT),'') ELSE NULL END AS TransactionStatusId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceStatusId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT Name FROM StaticValue WHERE Id=FinanceStatusId) AS SQL_VARIANT),'') ELSE NULL END AS FinanceStatusId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceStatusNotes'),__$update_mask) = 1) THEN IsNull(CAST(FinanceStatusNotes AS SQL_VARIANT),'') ELSE NULL END AS FinanceStatusNotes,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'IsDealSighted'),__$update_mask) = 1) THEN IsNull(CAST(CASE WHEN (IsDealSighted) = 1 THEN 'Yes' ELSE 'No' END AS SQL_VARIANT),'') ELSE NULL END AS IsDealSighted,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'SalesPersonId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT SalesPersonName FROM SalesPerson WHERE Id=SalesPersonId) AS SQL_VARIANT),'') ELSE NULL END AS SalesPersonId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'BusinessManagerId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT FirstName+' '+LastName FROM Users WHERE Id=BusinessManagerId) AS SQL_VARIANT),'') ELSE NULL END AS BusinessManagerId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'IsCashTransaction'),__$update_mask) = 1) THEN IsNull(CAST(CASE WHEN IsCashTransaction = 1 THEN 'Yes' ELSE 'No' END AS SQL_VARIANT),'') ELSE NULL END AS IsCashTransaction,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'PreferredInterestRate'),__$update_mask) = 1) THEN IsNull(CAST((PreferredInterestRate) AS SQL_VARIANT),'') ELSE NULL END AS PreferredInterestRate,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'IsPreArrangedFinance'),__$update_mask) = 1) THEN IsNull(CAST(CASE WHEN IsPreArrangedFinance = 1 THEN 'Yes' ELSE 'No' END AS SQL_VARIANT),'') ELSE NULL END AS IsPreArrangedFinance,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceCompanyId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT c.CompanyName FROM Company c INNER JOIN  CompanyCompanyTypeMapping cct ON c.Id = CompanyId AND cct.Id =FinanceCompanyId) AS SQL_VARIANT),'') ELSE NULL END AS FinanceCompanyId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceAccountNumber'),__$update_mask) = 1) THEN IsNull(CAST((FinanceAccountNumber) AS SQL_VARIANT),'') ELSE NULL END AS FinanceAccountNumber,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'PaymentType'),__$update_mask) = 1) THEN IsNull(CAST((SELECT Name FROM StaticValue WHERE Id=PaymentType) AS SQL_VARIANT),'') ELSE NULL END AS PaymentType,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceTermId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT FinanceTermName FROM FinanceTerm WHERE Id=FinanceTermId) AS SQL_VARIANT),'') ELSE NULL END AS FinanceTermId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'InterestRateTypeId'),__$update_mask) = 1) THEN IsNull(CAST((SELECT Name FROM StaticValue WHERE Id=InterestRateTypeId) AS SQL_VARIANT),'') ELSE NULL END AS InterestRateTypeId,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'ProfitRate'),__$update_mask) = 1) THEN IsNull(CAST((ProfitRate) AS SQL_VARIANT),'') ELSE NULL END AS ProfitRate,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceType'),__$update_mask) = 1) THEN IsNull(CAST((SELECT Name FROM StaticValue WHERE Id=FinanceType) AS SQL_VARIANT),'') ELSE NULL END AS FinanceType,
							CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'PreferredCallTime'),__$update_mask) = 1) THEN IsNull(CAST((SELECT Name FROM StaticValue WHERE Id=PreferredCallTime) AS SQL_VARIANT),'') ELSE NULL END AS PreferredCallTime
						FROM cdc.fn_cdc_get_all_changes_dbo_Transaction(@from_lsn, @to_lsn, N'all update old')
						WHERE __$operation = 4
					) AS t1
				UNPIVOT 
					(new_value 
					FOR FieldName IN (TransactionTypeId,TransactionStatusNotes,TransactionStatusId,FinanceStatusId,FinanceStatusNotes,IsDealSighted,SalesPersonId,BusinessManagerId,IsCashTransaction,PreferredInterestRate,IsPreArrangedFinance,FinanceCompanyId,FinanceAccountNumber,PaymentType,FinanceTermId,InterestRateTypeId,ProfitRate,FinanceType,PreferredCallTime)
				) AS unp 
			) AS up_a -- after update
		ON up_b.__$start_lsn = up_a.__$start_lsn AND up_b.__$start_lsn = up_a.__$start_lsn AND up_b.FieldName = up_a.FieldName 
	UNION
		SELECT up_b.Id,  FieldName=(SELECT TOP 1 Value FROM Localizations WHERE ResourceId= up_b.FieldName AND LocaleId=@LocaleId),Cast(up_b.old_value AS NVARCHAR(4000)) AS old_value, null AS new_value, 'Deleted' AS operation, DATEADD(MINUTE, (Select UTCTimeOffset FROM Country WHERE Id=@CountryId),sys.fn_cdc_map_lsn_to_time(up_b.__$start_lsn)) AS commit_time, CAST((SELECT FirstName+' '+LastName FROM Users WHERE Id=up_b.ModifiedBy) AS NVARCHAR(4000)) AS ModifiedBy
		FROM
			( 
				SELECT __$start_lsn, Id, FieldName, old_value, ModifiedBy
					FROM 
						(
							SELECT __$start_lsn, Id, ModifiedBy,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'TransactionTypeId'),__$update_mask) = 1) THEN CAST((SELECT Name FROM StaticValue WHERE Id=TransactionTypeId) AS SQL_VARIANT) ELSE NULL END AS TransactionTypeId,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'TransactionStatusNotes'),__$update_mask) = 1) THEN CAST(TransactionStatusNotes AS SQL_VARIANT) ELSE NULL END AS TransactionStatusNotes,	
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'TransactionStatusId'),__$update_mask) = 1) THEN CAST((SELECT Name FROM StaticValue WHERE Id=TransactionStatusId) AS SQL_VARIANT) ELSE NULL END AS TransactionStatusId,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceStatusId'),__$update_mask) = 1) THEN CAST((SELECT Name FROM StaticValue WHERE Id=FinanceStatusId) AS SQL_VARIANT) ELSE NULL END AS FinanceStatusId,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceStatusNotes'),__$update_mask) = 1) THEN CAST(FinanceStatusNotes AS SQL_VARIANT) ELSE NULL END AS FinanceStatusNotes,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'IsDealSighted'),__$update_mask) = 1) THEN CAST(CASE WHEN (IsDealSighted) = 1 THEN 'Yes' ELSE 'No' END AS SQL_VARIANT) ELSE NULL END AS IsDealSighted,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'SalesPersonId'),__$update_mask) = 1) THEN CAST((SELECT SalesPersonName FROM SalesPerson WHERE Id=SalesPersonId) AS SQL_VARIANT) ELSE NULL END AS SalesPersonId,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'BusinessManagerId'),__$update_mask) = 1) THEN CAST((SELECT FirstName+' '+LastName FROM Users WHERE Id=BusinessManagerId) AS SQL_VARIANT) ELSE NULL END AS BusinessManagerId,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'IsCashTransaction'),__$update_mask) = 1) THEN CAST(CASE WHEN IsCashTransaction = 1 THEN 'Yes' ELSE 'No' END AS SQL_VARIANT) ELSE NULL END AS IsCashTransaction,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'PreferredInterestRate'),__$update_mask) = 1) THEN CAST((PreferredInterestRate) AS SQL_VARIANT) ELSE NULL END AS PreferredInterestRate,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'IsPreArrangedFinance'),__$update_mask) = 1) THEN CAST(CASE WHEN IsPreArrangedFinance = 1 THEN 'Yes' ELSE 'No' END AS SQL_VARIANT) ELSE NULL END AS IsPreArrangedFinance,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceCompanyId'),__$update_mask) = 1) THEN CAST((SELECT c.CompanyName FROM Company c INNER JOIN  CompanyCompanyTypeMapping cct ON c.Id = CompanyId AND cct.Id =FinanceCompanyId) AS SQL_VARIANT) ELSE NULL END AS FinanceCompanyId,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceAccountNumber'),__$update_mask) = 1) THEN CAST((FinanceAccountNumber) AS SQL_VARIANT) ELSE NULL END AS FinanceAccountNumber,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'PaymentType'),__$update_mask) = 1) THEN CAST((SELECT Name FROM StaticValue WHERE Id=PaymentType) AS SQL_VARIANT) ELSE NULL END AS PaymentType,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceTermId'),__$update_mask) = 1) THEN CAST((SELECT FinanceTermName FROM FinanceTerm WHERE Id=FinanceTermId) AS SQL_VARIANT) ELSE NULL END AS FinanceTermId,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'InterestRateTypeId'),__$update_mask) = 1) THEN CAST((SELECT Name FROM StaticValue WHERE Id=InterestRateTypeId) AS SQL_VARIANT) ELSE NULL END AS InterestRateTypeId,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'ProfitRate'),__$update_mask) = 1) THEN CAST((ProfitRate) AS SQL_VARIANT) ELSE NULL END AS ProfitRate,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'FinanceType'),__$update_mask) = 1) THEN CAST((SELECT Name FROM StaticValue WHERE Id=FinanceType) AS SQL_VARIANT) ELSE NULL END AS FinanceType,
								CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (@TableName, 'PreferredCallTime'),__$update_mask) = 1) THEN CAST((SELECT Name FROM StaticValue WHERE Id=PreferredCallTime) AS SQL_VARIANT) ELSE NULL END AS PreferredCallTime
							FROM cdc.fn_cdc_get_all_changes_dbo_Transaction(@from_lsn, @to_lsn, N'all update old')
							WHERE __$operation = 1
					) AS t1
				UNPIVOT 
					(old_value 
					FOR FieldName IN (TransactionTypeId,TransactionStatusNotes,TransactionStatusId,FinanceStatusId,FinanceStatusNotes,IsDealSighted,SalesPersonId,BusinessManagerId,IsCashTransaction,PreferredInterestRate,IsPreArrangedFinance,FinanceCompanyId,FinanceAccountNumber,PaymentType,FinanceTermId,InterestRateTypeId,ProfitRate,FinanceType,PreferredCallTime) 
				) AS unp
			) AS  up_b 
) AS data 
WHERE Id=@PrimaryKeyId order by commit_time desc
END

