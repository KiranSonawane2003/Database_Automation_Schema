
CREATE FUNCTION    fnGetBankDealReference (@TransactionId int)  
RETURNS nvarchar(max)  
AS  
BEGIN

 DECLARE @x1 nvarchar(max)

	
	 

	 --SELECT @x1=COALESCE(@x1,'')  + case when c.companyname is not null and t.ReferenceNumber is not null then concat(c.companyname  ,'(',cast(t.ReferenceNumber AS nvarchar),')') 
	 --ELSE CASE WHEN c.companyname IS NOT NULL THEN c.companyname ELSE CASE WHEN t.ReferenceNumber IS NOT NULL THEN t.ReferenceNumber END END END
	 
	 --FROM    [transaction] t
	 --LEFT JOIN [TransactionFinanceApplication] tfa ON tfa.TransactionId =t.id
	 --LEFT JOIN dbo.Company c ON c.Id = tfa.CompanyId
	 --LEFT JOIN	 dbo.StaticValue sv ON sv.id=tfa.FinanceStatusId
	 --WHERE t.id	=@TransactionId

	select @x1= STUFF((SELECT ('| ' + concat(UPPER(c.companyname),' (',UPPER(BankDealReferenceNumber),') '))
            FROM    [transaction] t
	 LEFT JOIN [TransactionFinanceApplication] tfa ON tfa.TransactionId =t.id
	 LEFT JOIN dbo.Company c ON c.Id = tfa.CompanyId	  
	 WHERE t.id	=@TransactionId
            group by c.companyname,BankDealReferenceNumber
            ORDER BY c.companyname,BankDealReferenceNumber
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)')
        ,1,1,'')
	 return   REPLACE(@x1,'()','')

END

