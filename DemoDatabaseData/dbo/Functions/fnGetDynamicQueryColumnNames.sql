﻿
CREATE FUNCTION  [dbo].[fnGetDynamicQueryColumnNames]
(  
  @Table_Name nvarchar(max)
)  
returns nvarchar(max)  
as  
begin 

--DECLARE @Table_Name as VARCHAR(50) 
--SET @Table_Name = '##tempspGetTransactionContactsDetails'       

DECLARE @sql NVARCHAR(MAX) 
SET @sql ='';-- 'select '

SELECT @sql = @sql + '[' + tempdb.sys.columns.name + '] as '''+
REPLACE((reverse(substring(reverse(tempdb.sys.columns.name),PATINDEX('%[0-9][a-z]%',reverse(tempdb.sys.columns.name))+1,
len(tempdb.sys.columns.name)-PATINDEX('%[0-9][a-z]%',reverse(tempdb.sys.columns.name))))), '_', ' ')
+''','
FROM tempdb.sys.columns 
JOIN tempdb.sys.tables ON tempdb.sys.columns.object_id = tables.object_id
WHERE 
 tempdb.sys.tables.name = @Table_Name

SET @sql = left(@sql,len(@sql)-1) -- remove trailing comma
--SET @sql = @sql + ' from ' + @Table_Name
--print @sql
--EXEC sp_executesql @sql
						
return @sql



end

