
CREATE FUNCTION   [dbo].[fnGetIncomeSource](@transactionid int,@countryid int, @IsGuarantor int)   
 
returns nvarchar(1000)  
as  
begin 
DECLARE @IncomeSource nvarchar(max);
 
SELECT  @IncomeSource=COALESCE(@IncomeSource,'') +svemis.name +'|' from viewtransaction t
   left join TransactionIncomeAndExpenditure iea on iea.transactionid=t.transactionid and iea.IsGuarantor=@IsGuarantor
   Left join TransactionIncomeAndExpenditureIncomeSourceMapping tie on tie.TransactionIncomeAndExpenditureId=iea.id	and   iea.IsGuarantor=@IsGuarantor
	   LEFT JOIN staticvalue svemis on svemis.id=tie.IncomeSourceId and svemis.staticcategoryid=(select id from staticcategory where name like 'IncomeSource') and svemis.countryid=@countryid
	   WHERE t.TransactionId=@transactionid and iea.isactive =1

	   return @IncomeSource
END

