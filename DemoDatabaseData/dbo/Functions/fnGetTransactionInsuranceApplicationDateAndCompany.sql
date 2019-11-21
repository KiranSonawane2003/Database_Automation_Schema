
CREATE FUNCTION      [dbo].[fnGetTransactionInsuranceApplicationDateAndCompany](@transactionid int, @type nvarchar(100),@output int)  
RETURNS nvarchar(max)   
AS    
BEGIN  
    DECLARE @Result nvarchar(max);

  IF @output !=2
  BEGIN


SELECT @Result = COALESCE(@Result,'') + case when @output=0 AND tia.IsLeadSent=1 then UPPER(c.CompanyName) ELSE CASE WHEN tia.IsLeadSent=1 then UPPER(cast(convert(varchar, tia.LeadSentDate , 106) AS nvarchar)) end end +'|' 
FROM [TransactionInsuranceApplication] tia 
LEFT JOIN CompanyCompanyTypeMapping ccm on ccm.Id=tia.[InsuranceCompanyId]
 LEFT JOIN CompanyType ct on ct.id=ccm.CompanyTypeId and ct.CompanyTypeName=@type
 LEFT JOIN COMPANY c ON c.id=ccm.CompanyId

WHERE tia.TransactionId=@transactionid
END
ELSE IF @output =2
BEGIN

SELECT @Result=  CASE WHEN Count(*)>0 THEN 'YES' ELSE 'NO' end FROM TransactionInsuranceApplication WHERE transactionid =@transactionid

END
 
RETURN @Result;
END;

