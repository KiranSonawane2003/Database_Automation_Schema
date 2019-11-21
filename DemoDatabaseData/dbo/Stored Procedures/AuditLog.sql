
-- =============================================
-- Author:		<Author, Vikas Nagare,>
-- Create date: <06 Aug 2015,>
-- Description:	<Description, Stored Procedure for Capture CDC data in well defined structure having field Id, FieldName, Old Value, New Value, Operation, Commit Time, ModifiedBy.
-- This is done by using Pivote and unpivote operation in sql,>
-- =============================================
CREATE PROCEDURE [dbo].[AuditLog]
(
	@TableNameForAudit NVARCHAR(256), --Dynamic Table Parameter for which audit log details are required
	@LocaleId NVARCHAR(10),
	@PrimaryKeyId INT = NULL		  --Dynamic Table Primary Key for which audit log details are required. If not provided result will display for all rows in dynamic table.
)
AS

BEGIN
	

	DECLARE @CaseStatementInsert NVARCHAR(MAX)			-- Variable for Insert Operation Dynamic Query

	DECLARE @CaseStatementBeforeUpdate NVARCHAR(MAX)	-- Variable for Before Update Operation Dynamic Query

	DECLARE @CaseStatementAfterUpdate NVARCHAR(MAX)		-- Variable for After Update Operation Dynamic Query

	DECLARE @CaseStatementDelete NVARCHAR(MAX)			-- Variable for Delete Operation Dynamic Query

	DECLARE @instatement NVARCHAR(MAX)=''				-- Variable for Dynamic Column name in all dynamic Query

	DECLARE @i INT =1

	DECLARE @NumOfRows INT;								--Variable for number of rows in Tempary table

	DECLARE @TableName NVARCHAR(256)

	DECLARE @Condition NVARCHAR(MAX)					-- Variable for Where Condition for if Id is available

	IF @PrimaryKeyId IS NOT NULL						-- If loop to set @condition variable if PrimaryKeyId is not null

		BEGIN

			SET @Condition= CONCAT(' WHERE Id=',@PrimaryKeyId)
		END

	SET @CaseStatementInsert ='SELECT CAST(up_b.Id AS BIGINT) AS Id, up_b.FieldName, null as old_value, Cast(up_b.new_value AS NVARCHAR(4000)) AS new_value, ''Insert'' as operation, sys.fn_cdc_map_lsn_to_time(up_b.__$start_lsn) as commit_time, up_b.ModifiedBy
	FROM
		( 
			SELECT __$start_lsn, Id, FieldName=(SELECT TOP 1 Value  FROM [Localizations] 
			                                    WHERE RESOURCESET= '''+ @TableNameForAudit +''' and RESOURCEID = FieldName AND LocaleId= '''+ @LocaleId +'''
											   )
		, new_value, ModifiedBy 
		FROM (
		SELECT __$start_lsn, Id, ModifiedBy,'					

		--Default initial string set for variable

	SET @CaseStatementBeforeUpdate= 'SELECT CAST(up_b.Id AS BIGINT) AS Id, up_b.FieldName, Cast(up_b.old_value AS NVARCHAR(4000)) AS old_value, Cast(up_a.new_value AS NVARCHAR(4000)) AS new_value, ''Update'' as operation, sys.fn_cdc_map_lsn_to_time(up_b.__$start_lsn) as commit_time, up_b.ModifiedBy
	FROM
		( 
			SELECT __$start_lsn, Id, FieldName=(SELECT TOP 1 Value  FROM [Localizations] 
			                                    WHERE RESOURCESET= '''+ @TableNameForAudit +''' and RESOURCEID = FieldName AND LocaleId= '''+ @LocaleId +'''
											   )
			, old_value, ModifiedBy
		FROM (
		SELECT __$start_lsn, Id, ModifiedBy,'

		--Default initial string set for variable

	SET @CaseStatementAfterUpdate= 'SELECT __$start_lsn, Id, FieldName=(SELECT TOP 1 Value  FROM [Localizations] 
			                                    WHERE RESOURCESET= '''+ @TableNameForAudit +''' and RESOURCEID = FieldName AND LocaleId= '''+ @LocaleId +'''
											   )
	, new_value, ModifiedBy 
		FROM (
		SELECT __$start_lsn, Id, ModifiedBy,'

		--Default initial string set for variable

	SET @CaseStatementDelete = 'SELECT CAST(up_b.Id AS BIGINT) AS Id, up_b.FieldName, Cast(up_b.old_value AS NVARCHAR(4000)) AS old_value, null as new_value, ''Delete'' as operation, sys.fn_cdc_map_lsn_to_time(up_b.__$start_lsn) as commit_time, ModifiedBy
	FROM
		( 
			SELECT __$start_lsn, Id, FieldName=(SELECT TOP 1 Value  FROM [Localizations] 
			                                    WHERE RESOURCESET= '''+ @TableNameForAudit +''' and RESOURCEID = FieldName AND LocaleId= '''+ @LocaleId +'''
											   )
			, old_value, ModifiedBy
		FROM (
		SELECT __$start_lsn, Id, ModifiedBy,'

		--Default initial string set for variable

	DECLARE @ColumnName NVARCHAr(256)

	DECLARE @temp_table TABLE				-- Declare temporary Table to store required column name for dynamic query
	(
	Id INT IDENTITY,

	ColumnName NVARCHAR(256)
	)

	INSERT INTO @temp_table (ColumnName)			-- Required Column name insert in temporary table

		SELECT c.name FROM sys.columns c INNER JOIN sys.tables t ON c.object_id=t.object_id WHERE t.is_ms_shipped=0 and t.name=@TableNameForAudit AND c.name Not IN('Id','ModifiedDate', 'CountryId', 'IsActive','CreatedDate', 'CreatedBy', 'ModifiedBy') 

	SELECT @NumOfRows= COUNT(ColumnName) FROM @temp_table

	/* ---------------------- Dynamic Query for Insert Operation Start -------------------------- */
	SET @instatement=''
	WHILE @i<=@NumOfRows

			BEGIN 

			SELECT @ColumnName= ColumnName FROM @temp_table WHERE Id=@i

			SET @CaseStatementInsert = CONCAT(@CaseStatementInsert,
			' CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (''dbo_'+@TableNameForAudit+''', '''+@ColumnName+'''),__$update_mask) = 1) THEN CAST('+@ColumnName+' as sql_variant) ELSE NULL END AS '+@ColumnName)

			SET @instatement += '['+@ColumnName+']'

			IF @i<>@NumOfRows

			BEGIN

			SET @CaseStatementInsert = CONCAT(@CaseStatementInsert,',')

			SET @instatement += ','

			END

			SET @i=@i+1

			END

	SET @CaseStatementInsert = CONCAT(@CaseStatementInsert, ' FROM cdc.fn_cdc_get_all_changes_dbo_'+@TableNameForAudit+'(@from_lsn, @to_lsn, N''all update old'')
		WHERE __$operation = 2
		) as t1
		UNPIVOT (new_value FOR FieldName IN (', @instatement, ') ) as unp
		) as  up_b ')			

		-- Dynamic Query string is updated in variable

	/* ---------------------- Dynamic Query for Insert Operation End -------------------------- */

	/* ---------------------- Dynamic Query for Before Update Operation Start -------------------------- */
	SET @i=1
	SET @instatement=''
	WHILE @i<=@NumOfRows

			BEGIN 

			SELECT @ColumnName= ColumnName FROM @temp_table WHERE Id=@i

			SET @CaseStatementBeforeUpdate = CONCAT(@CaseStatementBeforeUpdate,
			' CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (''dbo_'+@TableNameForAudit+''', '''+@ColumnName+'''),__$update_mask) = 1) THEN ISNULL(CAST('+@ColumnName+' as sql_variant),'''') ELSE NULL END AS '+@ColumnName)

			SET @instatement += '['+@ColumnName+']'

			IF @i<>@NumOfRows

			BEGIN

			SET @CaseStatementBeforeUpdate = CONCAT(@CaseStatementBeforeUpdate,',')

			SET @instatement += ','

			END

			SET @i=@i+1

			END

	SET @CaseStatementBeforeUpdate = CONCAT(@CaseStatementBeforeUpdate, ' FROM cdc.fn_cdc_get_all_changes_dbo_'+@TableNameForAudit+'(@from_lsn, @to_lsn, N''all update old'')
		WHERE __$operation = 3
		) as t1
		UNPIVOT (old_value FOR FieldName IN (', @instatement ,') ) as unp
		) as  up_b   ')

		-- Dynamic Query string is updated in variable

	/* ---------------------- Dynamic Query for Before Update Operation End -------------------------- */

	/* ---------------------- Dynamic Query for After Update Operation Start -------------------------- */
	SET @i=1
	SET @instatement=''
	WHILE @i<=@NumOfRows

			BEGIN 

			SELECT @ColumnName= ColumnName FROM @temp_table WHERE Id=@i

			SET @CaseStatementAfterUpdate = CONCAT(@CaseStatementAfterUpdate,
			' CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (''dbo_'+@TableNameForAudit+''', '''+@ColumnName+'''),__$update_mask) = 1) THEN ISNULL(CAST('+@ColumnName+' as sql_variant),'''') ELSE NULL END AS '+@ColumnName)

			SET @instatement += '['+@ColumnName+']'

			IF @i<>@NumOfRows

			BEGIN

			SET @CaseStatementAfterUpdate = CONCAT(@CaseStatementAfterUpdate,',')

			SET @instatement += ','

			END

			SET @i=@i+1

			END

	SET @CaseStatementAfterUpdate = CONCAT(@CaseStatementAfterUpdate, ' FROM cdc.fn_cdc_get_all_changes_dbo_'+@TableNameForAudit+'(@from_lsn, @to_lsn, N''all update old'')
		WHERE __$operation = 4
		) as t1
		UNPIVOT (new_value FOR FieldName IN (', @instatement ,')) as unp 
		) as up_a ')
	

		-- Dynamic Query string is updated in variable

	/* ---------------------- Dynamic Query for After Update Operation End -------------------------- */

	/* ---------------------- Dynamic Query for Delete Operation Start -------------------------- */
	SET @i=1
	SET @instatement=''
	WHILE @i<=@NumOfRows

			BEGIN 

			select @ColumnName= ColumnName FROM @temp_table WHERE Id=@i

			SET @CaseStatementDelete = CONCAT(@CaseStatementDelete,
			' CASE WHEN (sys.fn_cdc_is_bit_set (sys.fn_cdc_get_column_ordinal (''dbo_'+@TableNameForAudit+''', '''+@ColumnName+'''),__$update_mask) = 1) THEN CAST('+@ColumnName+' as sql_variant) ELSE NULL END AS '+@ColumnName)

			SET @instatement += '['+@ColumnName+']'

			IF @i<>@NumOfRows

			BEGIN

			SET @CaseStatementDelete = CONCAT(@CaseStatementDelete,',')

			SET @instatement += ','

			END

			SET @i=@i+1

			END

	SET @CaseStatementDelete = CONCAT(@CaseStatementDelete, ' FROM cdc.fn_cdc_get_all_changes_dbo_',@TableNameForAudit,'(@from_lsn, @to_lsn, N''all update old'')
		WHERE __$operation = 1
		) as t1
		UNPIVOT (old_value FOR FieldName IN (',@instatement,') ) as unp
		) as  up_b   ')

		-- Dynamic Query string is updated in variable

	/* ---------------------- Dynamic Query for Delete Operation End -------------------------- */

	DECLARE @from_lsn BINARY(10), @to_lsn BINARY(10)

	SET @from_lsn = (SELECT sys.fn_cdc_get_min_lsn ('dbo_'+@TableNameForAudit+''))

	SET @to_lsn = (SELECT sys.fn_cdc_get_max_lsn())

	DECLARE @Query NVARCHAR(MAX)		-- Variable Complete Query string for result


	SET @Query = CONCAT ('DECLARE @from_lsn BINARY(10), @to_lsn BINARY(10)

	SET @from_lsn = (SELECT sys.fn_cdc_get_min_lsn (''dbo_',@TableNameForAudit,'''))
	SET @to_lsn = (SELECT sys.fn_cdc_get_max_lsn())

	select * FROM
	(', @CaseStatementInsert, ' UNION ', @CaseStatementBeforeUpdate , ' INNER JOIN ' , '	(' , @CaseStatementAfterUpdate , ' ON up_b.__$start_lsn = up_a.__$start_lsn AND up_b.__$start_lsn = up_a.__$start_lsn AND up_b.FieldName = up_a.FieldName ' , ' UNION ' , @CaseStatementDelete , ') as data', @Condition ,' order by commit_time desc')

	-- @Query Variable set with binding of all dynamic query Result

			EXECUTE sp_executesql @Query		-- Query Execution


END

