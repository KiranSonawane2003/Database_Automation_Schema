CREATE FUNCTION    [dbo].[fnGetBankDetails] (@TransactionId int)  
RETURNS nvarchar(max)  
AS  
BEGIN


--SELECT 
--@x1=COALESCE(@x1,'') +
--CONCAT(UPPER(c.companyname),' ',
--case when BankersName IS NOT NULL THEN   ' ('+UPPER(BankersName)+') '  ELSE '' END,case when BankersOfficeTelephoneCode IS NOT NULL then ' ('+UPPER(BankersOfficeTelephoneCode)+') ' ELSE '' END  ,
--case when BankersOfficeTelephoneNumber IS NOT NULL then ' ('+UPPER(BankersOfficeTelephoneNumber)+') ' ELSE '' END ,case when BankersMobileNumber IS NOT NULL then ' ('+UPPER(BankersMobileNumber)+') ' ELSE '' END
-- ,case when BankersEmailAddress IS NOT NULL then ' ('+UPPER(BankersEmailAddress)+') ' ELSE '' END) +' | '
-- FROM [TransactionFinanceApplication] tfa
-- LEFT JOIN dbo.Company c ON c.Id = tfa.CompanyId
 
--  WHERE tfa.transactionid=28052 
--   --ORDER BY c.companyname,BankersName,BankersOfficeTelephoneCode,BankersOfficeTelephoneNumber,BankersEmailAddress,BankersMobileNumber
  

  DECLARE @x1 nvarchar(max)

  select @x1= STUFF((SELECT ('| ' + concat(UPPER(c.companyname),' (',UPPER(BankersName),') ',' (',UPPER(BankersOfficeTelephoneCode),') ',' (',UPPER(BankersOfficeTelephoneNumber),') ',' (',UPPER(BankersMobileNumber),') ',' (',UPPER(BankersEmailAddress),') '))
             FROM [TransactionFinanceApplication] tfa
 LEFT JOIN dbo.Company c ON c.Id = tfa.CompanyId 
  WHERE tfa.transactionid=@TransactionId 
            group by c.companyname,BankersName,BankersOfficeTelephoneCode,BankersOfficeTelephoneNumber,BankersEmailAddress,BankersMobileNumber
  
            ORDER BY c.companyname,BankersName,BankersOfficeTelephoneCode,BankersOfficeTelephoneNumber,BankersEmailAddress,BankersMobileNumber
  
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)')
        ,1,1,'')
	 return   REPLACE(@x1,'()','')
END