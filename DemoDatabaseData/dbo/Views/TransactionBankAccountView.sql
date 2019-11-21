
CREATE VIEW TransactionBankAccountView
AS
 SELECT tbd.TransactionId,
			tbd.AccountDetailsType AS ACCOUNT_DETAILS_TYPE, 
            UPPER(svbankid.Name) AS BANK_NAME, 
            UPPER(tbd.BranchName) AS BRANCH_NAME, 
            UPPER(tbd.BranchCode) BRANCH_CODE, 
            UPPER(svactype.Name) AS ACCOUNT_TYPE,
			tbd.FirstEMIDate AS FIRST_EMI_DATE,  
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
            END AS IS_DOWNPAYMENT_ACCOUNT, 
            UPPER(tbd.ExistingCASAAccountNumber) AS CASA_NUMBER,
			UPPER(tbd.AccountNo) AS ACCOUNT_NUMBER, 
            CASE
                WHEN tbd.IsFeeCollectionbyDebitOrder = 1
                THEN 'YES'
                ELSE 'NO'
            END AS IS_FEE_COLLECTION_BY_DEBIT_ORDER, 
            UPPER(svpaymethod.Name) AS PAYMENT_METHOD, 
            tbd.IsActive
     FROM dbo.TransactionBankingDetails tbd
          LEFT JOIN dbo.StaticValue svbankid ON tbd.BankId = svbankid.Id
          LEFT JOIN dbo.StaticValue svactype ON tbd.AccountType = svactype.Id
          LEFT JOIN dbo.StaticValue svpaymethod ON tbd.PaymentMethod = svpaymethod.Id
     WHERE tbd.IsActive = 1;

