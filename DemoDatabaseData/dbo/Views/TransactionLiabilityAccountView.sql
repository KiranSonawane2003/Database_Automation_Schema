
CREATE VIEW [dbo].[TransactionLiabilityAccountView] AS
    SELECT tbd.TransactionId,
			tbd.AccountDetailsType AS ACCOUNT_DETAILS_TYPE, 
            UPPER(svbankid.Name) AS BANK_NAME, 
			UPPER(tbd.AccountNo) AS ACCOUNT_NUMBER, 
            UPPER(svltype.Name) AS LOAN_TYPE, 
			tbd.LoanOutstanding AS LOAN_OUTSTANDING, 
            tbd.NoOfEMIsForObligation AS NO_OF_EMIS_FOR_OBLIGATION, 
			tbd.MonthlyInstalment AS MONTHLY_INSTALLMENTS,
            tbd.IsActive
     FROM dbo.TransactionBankingDetails tbd
          LEFT JOIN dbo.StaticValue svbankid ON tbd.BankId = svbankid.Id
          LEFT JOIN dbo.StaticValue svltype ON tbd.LoanType = svltype.Id
     WHERE tbd.IsActive = 1 AND tbd.AccountDetailsType = 3;

