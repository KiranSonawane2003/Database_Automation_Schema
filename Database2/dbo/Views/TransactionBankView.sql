CREATE VIEW [dbo].[TransactionBankView]
AS
     SELECT tbd.TransactionId,
			tbd.AccountDetailsType AS ACCOUNT_DETAILS_TYPE, 
            UPPER(svbankid.Name) AS BANK_NAME, 
            UPPER(tbd.BranchName) AS BRANCH_NAME, 
            UPPER(tbd.BranchCode) BRANCH_CODE, 
            UPPER(svactype.Name) AS ACCOUNT_TYPE,
			UPPER(convert(varchar, tbd.FirstEMIDate, 106)) AS FIRST_EMI_DATE,
            --CONVERT(VARCHAR(10), tbd.FirstEMIDate, 23) AS FirstEMIDate, 
            UPPER(tbd.IBANNumber) AS IBAN_NUMBER,
            CASE
                WHEN tbd.RepaymentAccount = 1
                THEN 'YES'
                ELSE 'NO'
            END AS REPAYMENT_ACCOUNT,
            CASE
                WHEN tbd.IsDownPaymentAccount = 1
                THEN 'YES'
                ELSE 'NO'
            END AS IS_DOWN_PAYMENT_ACCOUNT, 
            UPPER(tbd.ExistingCASAAccountNumber) AS CASA_NUMBER,
            CASE
                WHEN tbd.IsFeeCollectionbyDebitOrder = 1
                THEN 'YES'
                ELSE 'NO'
            END AS IS_FEE_COLLECTION_BY_DEBIT_ORDER, 
            UPPER(svpaymethod.Name) AS PAYMENT_METHOD, 
            UPPER(svcctype.Name) AS CREDIT_CARD_TYPE, 
            UPPER(tbd.CreditCardNumber) AS CREDIT_CARD_NUMBER, 
			UPPER(convert(varchar,tbd.CreditCardDateofIssue, 106)) AS CREDIT_CARD_DATE_OF_ISSUE, 
            UPPER(convert(varchar,tbd.CreditCardDateofExpiry , 106)) AS CREDIT_CARD_DATE_OF_EXPIRY, 
            tbd.LoanOutstanding  AS  LOAN_OUT_STANDING,  
            tbd.MonthlyInstalment  AS MONTHLY_INSTALMENT, 
            tbd.CreditCardOutStanding AS CREDIT_CARD_OUT_STANDING, 
            UPPER(tbd.AccountNo) AS ACCOUNT_NUMBER, 
            UPPER(svltype.Name) AS LOAN_TYPE, 
            tbd.NoOfEMIsForObligation AS NO_OF_EMIS_FOR_OBLIGATION, 
            tbd.IsActive
     FROM dbo.TransactionBankingDetails tbd
          LEFT JOIN dbo.StaticValue svbankid ON tbd.BankId = svbankid.Id
          LEFT JOIN dbo.StaticValue svactype ON tbd.AccountType = svactype.Id
          LEFT JOIN dbo.StaticValue svpaymethod ON tbd.PaymentMethod = svpaymethod.Id
          LEFT JOIN dbo.StaticValue svcctype ON tbd.CreditCardTypeId = svcctype.Id
          LEFT JOIN dbo.StaticValue svltype ON tbd.LoanType = svltype.Id
     WHERE tbd.IsActive = 1 AND tbd.AccountDetailsType = 1