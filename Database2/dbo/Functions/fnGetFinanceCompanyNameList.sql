CREATE FUNCTION   [dbo].[fnGetFinanceCompanyNameList] 
(
	@TransactionId bigint
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
 

 DECLARE @List VARCHAR(max)
select @List= STUFF((SELECT (' | ' +  UPPER(C.companyname))
            FROM FinanceApplicationHistory  FAH 
					LEFT JOIN [Transaction] T ON T.Id=FAH.TransactionId
					LEFT JOIN CompanyCompanyTypeMapping CCT ON CCT.Id=FAH.CompanyCompanyTypeID
					LEFT JOIN Company C ON C.Id=CCT.CompanyId
                    WHERE    FAH.TransactionId = @TransactionId AND FAH.IsActive =1
            group by C.companyname
            ORDER BY C.companyname
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)')
        ,2,1,'')

		RETURN @List 
 

END