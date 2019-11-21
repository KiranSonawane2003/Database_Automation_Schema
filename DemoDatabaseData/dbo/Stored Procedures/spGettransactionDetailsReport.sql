





CREATE PROCEDURE [dbo].[spGettransactionDetailsReport]  

@Countryid         INT,
@transactios	   TransactionsIdList READONLY ,
@tblCols		   ColumnList READONLY
 
AS 
BEGIN
  SET NOCOUNT ON
 
 DECLARE @Title int,@CustomerType int,@Gender int, @MaritalStatus int, @EmirateAreaCode int, @EmirateCity int, @Emirate int, @TransmissionType int, @BodyCondition int,@MechanicalCondition int;


select @Title=id from staticcategory where name like 'Title'
select @CustomerType=id from staticcategory where name like 'CustomerType'
select @Gender=id from staticcategory where name like 'gender'
select  @MaritalStatus=id from staticcategory where name like 'MaritalStatus'
select @EmirateAreaCode=id from staticcategory where name like 'EmirateAreaCode'
select @EmirateCity =id from staticcategory where name like 'EmirateCity'
select @Emirate=id from staticcategory where name like 'Emirate'
select @TransmissionType=id from staticcategory where name like 'TransmissionType'	
select @BodyCondition=id from staticcategory where name like 'BodyCondition'
select @MechanicalCondition=id from staticcategory where name like 'MechanicalCondition'

DECLARE 
@transactiontemptablename  NVARCHAR(255) = '##'+replace(CONVERT(varchar(255), NEWID()),'-',''),
@CreditCardtemptablename NVARCHAR(255) = '##'+REPLACE(CONVERT(varchar(255), NEWID()) ,'-',''),
@Liabilitytemptablename NVARCHAR(255) = '##'+REPLACE(CONVERT(varchar(255), NEWID()),'-',''),
@Banktemptablename NVARCHAR(255) = '##'+REPLACE(CONVERT(varchar(255), NEWID()),'-',''),
@Contacttemptablename NVARCHAR(255) = '##'+REPLACE(CONVERT(varchar(255), NEWID()),'-','')

  DECLARE @Query NVARCHAR(max);
  BEGIN TRY  
    
DECLARE @IDQuery NVARCHAR(200)='';
DECLARE @COUNTER INT = 0;
--DECLARE @MAX INT = (SELECT COUNT(1) FROM @transactios)
DECLARE @VALUE VARCHAR(MAX);

DECLARE @OtherColumns NVARCHAR(MAX);
DECLARE @CreditCardColumns NVARCHAR(MAX);
DECLARE @BankColumns NVARCHAR(MAX);
DECLARE @LiabilityColumns NVARCHAR(MAX);
DECLARE @ContactColumns NVARCHAR(MAX);


--Removes extra commas from the coloumn listing.
SELECT @OtherColumns= REPLACE(REPLACE(REPLACE(FieldList, ',', '><'), '<>', ''), '><', ',') FROM @tblCols WHERE ParentTable='OTHERS'
SELECT @CreditCardColumns= REPLACE(REPLACE(REPLACE(FieldList, ',', '><'), '<>', ''), '><', ',') FROM @tblCols WHERE ParentTable='CREDITCARD'
SELECT @BankColumns= REPLACE(REPLACE(REPLACE(FieldList, ',', '><'), '<>', ''), '><', ',') FROM @tblCols WHERE ParentTable='BANK'
SELECT @LiabilityColumns= REPLACE(REPLACE(REPLACE(FieldList, ',', '><'), '<>', ''), '><', ',') FROM @tblCols WHERE ParentTable='LIABILITY'
SELECT @ContactColumns= REPLACE(REPLACE(REPLACE(FieldList, ',', '><'), '<>', ''), '><', ',') FROM @tblCols WHERE ParentTable='TransactionContact'


IF(@CreditCardColumns != '')
SET @CreditCardColumns=@CreditCardColumns + ',';
IF(@BankColumns != '')
SET @BankColumns=@BankColumns +',';
IF(@LiabilityColumns != '')
SET @LiabilityColumns=@LiabilityColumns +',';
IF(@ContactColumns != '')
SET @ContactColumns=@ContactColumns +',';




--WHILE @COUNTER < @MAX
--BEGIN

--	SET @VALUE = (SELECT transactionid
--				  FROM (SELECT (ROW_NUMBER() OVER (ORDER BY (SELECT NULL))) [index] , transactionid FROM @transactios) R 
--				  ORDER BY R.[index] OFFSET @COUNTER 
--				  ROWS FETCH NEXT 1 ROWS ONLY
--				 );


IF LEN(@OtherColumns) > 0
SET @IDQuery ='tt.id,'
ELSE
SET @IDQuery ='tt.id'


Declare @insertstatment nvarchar(max)='',
        @intostatment nvarchar(max)='';


IF OBJECT_ID('tempdb..'+@transactiontemptablename) IS NOT NULL 
BEGIN
	SET @insertstatment ='INSERT INTO '+@transactiontemptablename +' ';
END
else
BEGIN
	 SET @intostatment =' INTO '+@transactiontemptablename +' ';
END

IF Object_id('tempdb..#TempTrans') IS NOT NULL 
BEGIN
DROP TABLE #TempTrans;
END

 CREATE TABLE #TempTrans(transactionid bigint);
 INSERT INTO #TempTrans
 SELECT * FROM @transactios;

	EXEC(@insertstatment + 'SELECT '   
        + @IDQuery+ @OtherColumns+ 
		 @intostatment+' 
	   FROM viewtransaction t  
	   INNER JOIN 	#TempTrans tns on tns.transactionid=t.transactionid
	   left join Users u  WITH (NOLOCK) on u.id=t.[CreatedBy]  and u.isActive=1
	   left join [transaction] tt  WITH (NOLOCK) on t.TransactionId=tt.Id  and tt.isActive=1
	   left join [Group] g  WITH (NOLOCK) on g.id=t.[GroupId] and g.isActive=1
	   left join [Branch] b  WITH (NOLOCK) on b.id=t.[BranchId]  and b.isActive=1
	   left join [Company] c  WITH (NOLOCK) on c.id=t.[APICompanyId]  and c.isActive=1
	   left join [salesperson] sp  WITH (NOLOCK) on sp.id=t.SalesPersonId  and sp.isActive=1
	   left join Users bm  WITH (NOLOCK) on bm.id=t.businessmanagerid  and bm.isActive=1
	   left join [staticvalue] sv  WITH (NOLOCK) on sv.id=t.transactiontypeid   and sv.isActive=1
	   left join [staticvalue] svts  WITH (NOLOCK) on svts.id=t.transactionstatusid  and svts.isActive=1
	   LEFT JOIN TransactionClient tc  WITH (NOLOCK) on tc.id=t.[TransactionClientId]  and tc.isActive=1
	   LEFT JOIN staticvalue svct  WITH (NOLOCK) on tc.CustomerType=svct.SortOrder and svct.staticcategoryid ='+@CustomerType+'  and svct.isActive=1
	   LEFT JOIN staticvalue svind  WITH (NOLOCK) on svind.id=tc.TitleId and svind.staticcategoryid ='+@Title+'  and svind.isActive=1	   
	   LEFT JOIN staticvalue svgen  WITH (NOLOCK) on svgen.id=tc.GenderId and svgen.staticcategoryid ='+@Gender+'   and svgen.isActive=1	
	   LEFT JOIN staticvalue svmrd  WITH (NOLOCK) on svmrd.id=tc.MaritalStatusId and svmrd.staticcategoryid ='+@MaritalStatus+' and svmrd.isActive=1	
	   LEFT JOIN staticvalue svac  WITH (NOLOCK) on svac.id=tc.AreaCodeId and svac.staticcategoryid ='+@EmirateAreaCode+'  and svac.isActive=1	 
	   LEFT JOIN staticvalue svcit  WITH (NOLOCK) on svcit.id=tc.CityId and svcit.staticcategoryid ='+@EmirateCity+'   and svcit.isActive=1	
	   LEFT JOIN staticvalue svemr  WITH (NOLOCK) on svemr.id=tc.OfficeEmirate and svemr.staticcategoryid ='+@Emirate+'  and svemr.isActive=1	
	   LEFT JOIN TransactionVehicle tv  WITH (NOLOCK) on tv.TransactionId=t.TransactionId and tv.isActive=1 AND  tv.ModifiedDate IS NOT null
	   LEFT JOIN [dbo].[Vehicle] v  WITH (NOLOCK) on v.id=tv.VehicleId and tv.TransactionId=t.transactionid and v.isActive=1	
	   LEFT JOIN TransactionNotes tn  WITH (NOLOCK) on tn.TransactionId=t.TransactionId  and tn.isActive=1	
	   LEFT JOIN COUNTRY ctr  WITH (NOLOCK) on ctr.id=tc.nationality  and ctr.isActive=1	
	   LEFT JOIN COUNTRY ctry  WITH (NOLOCK) on ctry.id=tc.OfficeCountry  and ctry.isActive=1	
	   LEFT JOIN InceptTransaction it  WITH (NOLOCK) on it.transactionid=t.transactionid
	   LEFT JOIN TransactionIncomeAndExpenditure itie  WITH (NOLOCK) on itie.transactionid=t.transactionid and  itie.isActive=1 and itie.IsGuarantor=0 
	   LEFT JOIN staticvalue trt  WITH (NOLOCK) on trt.id=v.TransmissionTypeId and trt.staticcategoryid ='+@TransmissionType+'  and trt.isActive=1	
		LEFT JOIN staticvalue bc  WITH (NOLOCK) on bc.id=tn.BodyConditionId and bc.staticcategoryid ='+@BodyCondition+'  and bc.isActive=1
		LEFT JOIN staticvalue mlc  WITH (NOLOCK) on mlc.id=tn.MechanicalConditionId and mlc.staticcategoryid='+@MechanicalCondition+'  and mlc.isActive=1
		LEFT JOIN staticvalue fl  WITH (NOLOCK) on fl.id=tn.FuelTypeId  and fl.isActive=1
		LEFT JOIN [TransactionEmployerDetails] td  WITH (NOLOCK) on td.TransactionId=t.TransactionId and td.isActive=1
		LEFT JOIN staticvalue ds  WITH (NOLOCK) on ds.id=td.DesignationId and ds.countryid='+@Countryid+' and ds.isActive=1
		LEFT JOIN StaticValue fssv  WITH (NOLOCK) on fssv.id=t.FinanceStatusId and  fssv.IsActive=1  
		LEFT JOIN [VehicleBodyType] vbt  WITH (NOLOCK) on vbt.id=v.BodyTypeId 	and vbt.isActive=1
		LEFT JOIN staticvalue bsg  WITH (NOLOCK) on  bsg.id= tt.businesssegment  and bsg.isActive=1
		LEFT JOIN  staticvalue mssv  WITH (NOLOCK) on mssv.id=tc.MaritalStatusId AND mssv.isActive=1	
		LEFT JOIN  staticvalue mtsv  WITH (NOLOCK) on mtsv.id=tc.MarrageTypeid AND mtsv.isactive=1
		LEFT JOIN  staticvalue ctsv  WITH (NOLOCK) on ctsv.id=tc.ComPhyAddEmirate AND ctsv.isactive=1
		LEFT JOIN country ertCtr  WITH (NOLOCK) on ertCtr.id=tc.ComPhyAddCountryId AND ertCtr.isactive=1
		LEFT JOIN staticvalue postCotr  WITH (NOLOCK) on postCotr.id=tc.PostAddEmirate AND postCotr.isactive=1
		LEFT JOIN country postadd   WITH (NOLOCK) on postadd.id=tc.PostAddCountryId
		LEFT JOIN [dbo].[VehicleManufacturer] vf  WITH (NOLOCK) on vf.id=v.Manufacturerid and vf.isactive=1
		LEFT JOIN staticvalue  vtsv  WITH (NOLOCK) on vtsv.id = v.TransmissionTypeId and vtsv.isActive=1
		LEFT JOIN staticvalue  wrnt  WITH (NOLOCK) on wrnt.id = tn.Warranty and wrnt.isActive=1
		LEFT JOIN staticvalue  dpnt  WITH (NOLOCK) on dpnt.id = tv.DownPaymentMadeTo and dpnt.isActive=1
	    LEFT JOIN staticvalue  rgtp  WITH (NOLOCK) on rgtp.id = tv.registrationtypeid and rgtp.isActive=1
		LEFT JOIN staticvalue  feec  WITH (NOLOCK) on feec.id = tv.FeesCollection and feec.isActive=1
		LEFT JOIN staticvalue  mddpnt  WITH (NOLOCK) on mddpnt.id = tv.ModeOfDownPayment and mddpnt.isActive=1
		LEFT JOIN staticvalue  tifcomp  WITH (NOLOCK) on tifcomp.id = tt.TradeInFinanceCompanyId and tifcomp.isActive=1
		--LEFT JOIN TransactionInsuranceApplication tia  WITH (NOLOCK) on tia.transactionid=t.transactionid
		LEFT JOIN staticvalue ecsv  WITH (NOLOCK) on ecsv.id=td.EmploymentCategoryId and ecsv.isActive=1
		LEFT JOIN staticvalue lngsv  WITH (NOLOCK) on lngsv.id=tc.languageid and lngsv.isActive=1
		LEFT JOIN TransactionIncomeAndExpenditureView vwAplicant WITH (NOLOCK) ON  vwAplicant.TransactionId=t.TransactionId and  vwAplicant.IsGuarantor=0
		LEFT JOIN TransactionIncomeAndExpenditureView vwGuarantor WITH (NOLOCK) ON  vwGuarantor.TransactionId=t.TransactionId and  vwGuarantor.IsGuarantor=1
		LEFT JOIN TransactionIncomeAndExpenditureView vwSpouse WITH (NOLOCK) ON  vwSpouse.TransactionId=t.TransactionId and  vwSpouse.IsGuarantor=2
		LEFT JOIN Users INUSR WITH (NOLOCK) ON INUSR.Id=IT.InceptedBy AND INUSR.IsActive=1');
		
 
--PRINT 'Main-'+cast(getdate() AS nvarchar);

--SET @COUNTER = @COUNTER + 1

--END


IF Object_id('tempdb..#curtable') IS NOT NULL 
begin
DROP TABLE #curtable;
end

CREATE TABLE #curtable(
Id int identity(1,1),
columnlist NVARCHAR(MAX),
temptablename NVARCHAR(50),
viewname NVARCHAR(200)
);

IF (LEN(@CreditCardColumns)>0 AND @CreditCardColumns != ',')
INSERT INTO #curtable(columnlist ,temptablename, viewname)  VALUES (@CreditCardColumns, @CreditCardtemptablename,'TransactionCreditCardView');
IF (LEN(@LiabilityColumns)>0 AND @LiabilityColumns != ',')
INSERT INTO #curtable (columnlist ,temptablename, viewname) VALUES (@LiabilityColumns,@Liabilitytemptablename,'TransactionLiabilityAccountView');
IF (LEN(@BankColumns)>0 AND @BankColumns != ',')
INSERT INTO #curtable (columnlist ,temptablename, viewname) VALUES (@BankColumns,@Banktemptablename,'TransactionBankView');
IF (LEN(@ContactColumns)>0 AND @ContactColumns != ',')
INSERT INTO #curtable (columnlist ,temptablename, viewname) VALUES (@ContactColumns,@Contacttemptablename,'TransactionContactsView');

DECLARE @C_Columns NVARCHAR(MAX), @C_temptablename NVARCHAR(50), @ViewName NVARCHAR(200), @loop_inc int=1, @tempcount int;

--DECLARE db_cursor CURSOR FOR 
--SELECT * 
--FROM #curtable 

--OPEN db_cursor  
--FETCH NEXT FROM db_cursor INTO @C_Columns, @C_temptablename, @ViewName

--WHILE @@FETCH_STATUS = 0  
--BEGIN  
SET @tempcount = (SELECT COUNT(*) FROM #curtable);
WHILE @loop_inc <= isnull(@tempcount,0)
BEGIN      

	SELECT @C_Columns= columnlist, 
			@C_temptablename=temptablename, 
			@ViewName=viewname 
	FROM #curtable 
	WHERE Id = @loop_inc;


--PRINT @ViewName+'-START-'+cast(getdate() AS nvarchar);

	  DECLARE @pos INT 
      DECLARE @len INT 
      DECLARE @values VARCHAR(8000) 
      DECLARE @QueryList NVARCHAR(max)=''; 
      DECLARE @QueryList1 NVARCHAR(max)=''; 

      SET @pos = 0 
      SET @len = 0 

      DECLARE @cnt INT=1; 

      WHILE Charindex(',', @C_Columns, @pos + 1) > 0 
        BEGIN 
            SET @len = Charindex(',', @C_Columns, @pos + 1) - @pos 
            SET @values =  (LTRIM(RTRIM(Substring(@C_Columns, @pos, @len))))
			DECLARE @valueCast NVARCHAR(MAX)='CAST('+(RTRIM(LTRIM(@values)))+' as NVARCHAR(MAX))';
			
            SET @QueryList = @QueryList + ' SELECT  v.transactionid,'''+REPLACE(@values, '	', '')+''' + CAST(ROW_NUMBER() OVER (PARTITION BY v.transactionid order BY v.transactionid)  AS NVARCHAR(MAX)) AS Cols,'
                             + @valueCast + 'AS Vals,'+CAST(@cnt AS NVARCHAR) 
                             + ' as common FROM [dbo].['+ @ViewName +'] as v inner join #TempTrans tt on v.transactionid=tt.transactionid UNION ALL '; 

            SET @QueryList1 = @QueryList1 + ' SELECT  vt.transactionid ,''' + REPLACE(@values, '	', '') + ''' + CAST(ROW_NUMBER() OVER (PARTITION BY vt.transactionid order BY vt.transactionid)  AS NVARCHAR(MAX)) AS Cols, ' 
                              + @valueCast 
                              + ' AS Vals FROM [dbo].['+@ViewName+'] vt  inner join #TempTrans tvt on vt.transactionid=tvt.transactionid UNION ALL '; 

            SET @cnt=@cnt + 1; 
            SET @pos = CHARINDEX(',', @C_Columns, @pos+@len) + 1 
        END 
		--PRINT @QueryList
      SET @QueryList=RTRIM(@QueryList); 
      SET @QueryList= SUBSTRING(@QueryList, 0, LEN(@QueryList) - 8); 
      SET @QueryList1=RTRIM(@QueryList1); 
      SET @QueryList1= SUBSTRING(@QueryList1, 0, LEN(@QueryList1) - 8); 
      DECLARE @columnResult NVARCHAR(MAX)=''; 

	  DECLARE 
	  @QueryColumnList NVARCHAR(MAX)=
	  'WITH Splitted AS 
	  ( 
		SELECT a  ,CAST(''<x>'' + REPLACE(a,'','',''</x><x>'') + ''</x>'' AS XML) AS TheParts     
		FROM 
		(
		 SELECT STUFF(( SELECT '','' + a.Cols  
		 			    FROM (SELECT *,  CAST(ROW_NUMBER() OVER (PARTITION BY transactionid, common ORDER BY common)  AS NVARCHAR(MAX)) as RowNum 
							  FROM (' + @QueryList + ') as d order by RowNum, transactionid,common OFFSET 0 ROWS) as a FOR XML PATH(''''), TYPE ).value(''.'', ''NVARCHAR(MAX)''),1,1,'''') AS a 
		) AS a 
	  ) 
	  SELECT STUFF((TheParts.query ('' for $x in distinct-values(/x/text()) return <x>{concat(",", $x)}</x> '').value(''.'',''nvarchar(max)'')),1,1,'''') AS ColumnB   
	  FROM Splitted;' ;

	  IF Object_id('tempdb..#temp_columns') IS NOT NULL
	  begin 
		DROP TABLE #temp_columns;
	  end

	  CREATE TABLE #temp_columns
	  (
	    TheParts NVARCHAR(MAX)
	  );

	  INSERT INTO #temp_columns 
	  EXEC(@QueryColumnList);
 
      SET @columnResult =(SELECT top 1 TheParts FROM #temp_columns); 

	  if(@columnResult is null)
		set  @columnResult=Left(@C_Columns,len(@C_Columns)-1)



	  IF(ISNULL(@columnResult,'') <>'')
	  BEGIN
      EXEC ('SELECT  p.transactionid ,' + @columnResult + ' '+'
			 INTO '+@C_temptablename+' ' +'
			 FROM
			(' + @QueryList1 
            + ') t  PIVOT (MAX(Vals) FOR Cols IN (' + @columnResult 
            + ')) P inner join #TempTrans tpt on p.transactionid=tpt.transactionid');
		END


			--WHERE p.transactionid in (
   --         select transactionid from #TempTrans)
--      FETCH NEXT FROM db_cursor INTO @C_Columns, @C_temptablename, @ViewName 
--END 

--CLOSE db_cursor  
--DEALLOCATE db_cursor 
 
SET @loop_inc = @loop_inc + 1;
--PRINT @ViewName+'-STOP-'+cast(getdate() AS nvarchar);
END

DECLARE @SQLJoins NVARCHAR(MAX)='';
DECLARE @SQLColumns NVARCHAR(MAX)='';


DECLARE @Temptablevalcount BIGINT=0,
	    @countquery NVARCHAR(MAX);

IF OBJECT_ID('tempdb..'+@CreditCardtemptablename) IS NOT NULL 
BEGIN
	SELECT @Temptablevalcount =0, @countquery ='SELECT @x= COUNT(*) FROM ' + @CreditCardtemptablename;
	EXEC sp_executesql @countquery, N'@x int out', @Temptablevalcount OUT

	IF (LEN(@CreditCardColumns)>0 AND @CreditCardColumns != ',' AND  @Temptablevalcount>0)
	BEGIN
		SET @SQLColumns=@SQLColumns+ ' ttc.*';
		SET @SQLJoins= @SQLJoins + ' LEFT JOIN '+@CreditCardtemptablename+' ttc  WITH (NOLOCK) on ttc.transactionid = ttt.id ';
	END
END

IF OBJECT_ID('tempdb..'+@Liabilitytemptablename) IS NOT NULL 
BEGIN
	SELECT @Temptablevalcount =0, @countquery =('SELECT @x = COUNT(*) FROM ' + @Liabilitytemptablename);
	EXEC SP_EXECUTESQL @countquery, N'@x int out', @Temptablevalcount OUT
	IF (LEN(@LiabilityColumns)>0 AND @LiabilityColumns != ',' AND  @Temptablevalcount>0)
	BEGIN
		SET @SQLColumns=@SQLColumns+CASE WHEN LEN(@SQLColumns)>0 THEN ',tta.*' ELSE  ' tta.*' END;
		SET @SQLJoins=@SQLJoins+' LEFT JOIN '+@Liabilitytemptablename+' tta WITH (NOLOCK) ON tta.transactionid=ttt.id ';
	END
END

IF OBJECT_ID('tempdb..'+@Banktemptablename) IS NOT NULL 
BEGIN
	SELECT @Temptablevalcount =0, @countquery =('SELECT @x = COUNT(*) FROM ' + @Banktemptablename);
	EXEC SP_EXECUTESQL @countquery, N'@x INT OUT', @Temptablevalcount OUT

	IF (LEN(@BankColumns)>0 AND @BankColumns != ',' AND  @Temptablevalcount>0)
	BEGIN
		SET @SQLColumns=@SQLColumns+CASE WHEN LEN(@SQLColumns)>0 THEN ',ttb.*' ELSE  ' ttb.*' END;
		SET @SQLJoins=@SQLJoins+' LEFT JOIN '+@Banktemptablename+' ttb  WITH (NOLOCK) ON ttb.transactionid=ttt.id ';
	END
END

IF OBJECT_ID('tempdb..'+@Contacttemptablename) IS NOT NULL 
BEGIN
	SELECT @Temptablevalcount =0, @countquery =('SELECT @x = COUNT(*) FROM ' + @Contacttemptablename);
	EXEC sp_executesql @countquery, N'@x INT OUT', @Temptablevalcount OUT
	
	IF (LEN(@ContactColumns)>0 AND @ContactColumns != ',' AND  @Temptablevalcount>0)
	BEGIN
		SET @SQLColumns=@SQLColumns+CASE WHEN LEN(@SQLColumns)>0 THEN ',ttg.*' ELSE  ' ttg.*' END;
		SET @SQLJoins=@SQLJoins+' LEFT JOIN '+@Contacttemptablename+' ttg  WITH (NOLOCK) ON ttg.transactionid=ttt.id ';
	END
END

EXEC('SELECT ttt.* FROM '+@transactiontemptablename+' ttt '); --Brings Transaction Data

 --PRINT '-REST-'+cast(getdate() AS nvarchar);

IF LEN(@SQLColumns)>0 
EXEC('SELECT  ttt.id as [TRANSACTION ID], '+@SQLColumns+' FROM '+@transactiontemptablename+' ttt ' + @SQLJoins); --Brings Transaction Bank and Contact Data  



IF Object_id('tempdb..'+@CreditCardtemptablename) IS NOT NULL 
begin
exec('DROP TABLE '+ @CreditCardtemptablename);
end
IF Object_id('tempdb..'+@Liabilitytemptablename) IS NOT NULL 
BEGIN
EXEC('DROP TABLE '+@Liabilitytemptablename);
END
IF Object_id('tempdb..'+@Banktemptablename) IS NOT NULL 
BEGIN
EXEC('DROP TABLE '+@Banktemptablename);
END
IF Object_id('tempdb..'+@Contacttemptablename) IS NOT NULL 
BEGIN
EXEC('DROP TABLE '+@Contacttemptablename);
END
IF Object_id('tempdb..'+@transactiontemptablename) IS NOT NULL 
BEGIN
EXEC('DROP TABLE '+@transactiontemptablename);
END

END TRY  
BEGIN CATCH  

IF Object_id('tempdb..'+@CreditCardtemptablename) IS NOT NULL 
begin
exec('DROP TABLE '+ @CreditCardtemptablename)
end
IF Object_id('tempdb..'+@Liabilitytemptablename) IS NOT NULL 
BEGIN
EXEC('DROP TABLE '+@Liabilitytemptablename);
END
IF Object_id('tempdb..'+@Banktemptablename) IS NOT NULL 
BEGIN
EXEC('DROP TABLE '+@Banktemptablename);
END
IF Object_id('tempdb..'+@Contacttemptablename) IS NOT NULL 
BEGIN
EXEC('DROP TABLE '+@Contacttemptablename);
END
IF Object_id('tempdb..'+@transactiontemptablename) IS NOT NULL 
BEGIN
EXEC('DROP TABLE '+@transactiontemptablename);
END




SELECT  
ERROR_NUMBER() AS ErrorNumber  
,ERROR_SEVERITY() AS ErrorSeverity  
,ERROR_STATE() AS ErrorState  
,ERROR_PROCEDURE() AS ErrorProcedure  
,ERROR_LINE() AS ErrorLine  
,ERROR_MESSAGE() AS ErrorMessage  
END CATCH;

END

