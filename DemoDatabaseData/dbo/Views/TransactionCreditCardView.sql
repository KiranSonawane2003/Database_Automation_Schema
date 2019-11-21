
CREATE VIEW [dbo].[TransactionCreditCardView] AS
SELECT tbd.TransactionId,
			tbd.AccountDetailsType AS ACCOUNT_DETAILS_TYPE, 
            UPPER(svbankid.Name) AS BANK_NAME,           
            UPPER(svcctype.Name) AS CREDIT_CARD_TYPE, 
            UPPER(tbd.CreditCardNumber) AS CREDIT_CARD_NUMBER, 
            UPPER(convert(varchar, tbd.CreditCardDateofIssue, 106)) AS CREDIT_CARD_DATE_OF_ISSUE, 
            UPPER(convert(varchar, tbd.CreditCardDateofExpiry , 106)) AS CREDIT_CARD_DATE_OF_EXPIRY,
            CAST(tbd.LoanOutstanding AS NUMERIC(18,2)) AS LOAN_OUTSTANDING, 
             CAST(tbd.MonthlyInstalment AS NUMERIC(18,2)) AS MONTHLY_INSTALMENT, 
            CAST(tbd.CreditCardOutStanding  AS NUMERIC(18,2))AS CREDIT_CARD_OUTSTANDING, 
            tbd.IsActive
     FROM dbo.TransactionBankingDetails tbd
          LEFT JOIN dbo.StaticValue svbankid ON tbd.BankId = svbankid.Id
          LEFT JOIN dbo.StaticValue svactype ON tbd.AccountType = svactype.Id
          LEFT JOIN dbo.StaticValue svcctype ON tbd.CreditCardTypeId = svcctype.Id
     WHERE tbd.IsActive = 1 AND tbd.AccountDetailsType = 2;

