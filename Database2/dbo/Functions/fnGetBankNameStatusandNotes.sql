CREATE FUNCTION       [dbo].[fnGetBankNameStatusandNotes] (@TransactionId int)  
RETURNS nvarchar(max)  
AS  
BEGIN

 DECLARE @List VARCHAR(max)
select @List= STUFF((SELECT '| '+(concat(UPPER(c.companyname),' (',UPPER(sv.Name),') ',' (',UPPER(tfa.FinanceStatusNotes),')')) 
            FROM [transaction] t
	 LEFT JOIN [TransactionFinanceApplication] tfa ON tfa.TransactionId =t.id
	 LEFT JOIN dbo.Company c ON c.Id = tfa.CompanyId
	 LEFT JOIN	 dbo.StaticValue sv ON sv.id=tfa.FinanceStatusId
	 WHERE t.id	=@TransactionId
            group by C.companyname,sv.Name,tfa.FinanceStatusNotes
            ORDER BY C.companyname,sv.Name,tfa.FinanceStatusNotes
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)')
         ,1,1,'')

		return  replace(@List,'()','')

END