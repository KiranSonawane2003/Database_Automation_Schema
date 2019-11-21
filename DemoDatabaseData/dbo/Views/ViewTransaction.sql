

CREATE VIEW [dbo].[ViewTransaction]
AS
WITH   CompanyDetail
AS     (SELECT IC.ID AS CompanyId,
               CM.Id AS CompanyCompanyTypeId,
               IC.CompanyName,
               CT.CompanyTypeName,
               IC.CreatedDate,
			   IC.IsActive
        FROM   CompanyCompanyTypeMapping AS CM WITH (NOLOCK)
               INNER JOIN
               Company AS IC WITH (NOLOCK)
               ON IC.Id = CM.CompanyId
               INNER JOIN
               CompanyType AS CT WITH (NOLOCK)
               ON CT.Id = CM.CompanyTypeId),
       VehicleDetail
AS     (SELECT V.Id AS VehicleId,
               V.VehicleCode,
               VM.Manufacturer,
               V.Model,
               VT.VehicleTypeName,
               V.Trim,
               V.ModelYear,
			   V.IsActive
        FROM   Vehicle AS V WITH (NOLOCK)
               LEFT OUTER JOIN
               VehicleManufacturer AS VM WITH (NOLOCK)
               ON V.ManufacturerId = VM.Id
               LEFT OUTER JOIN
               VehicleType AS VT WITH (NOLOCK)
               ON V.VehicleTypeID = VT.ID),
       InsuranceDetail
AS     (SELECT DISTINCT T.Id AS TransactionId,
        ISNULL(STUFF((SELECT   ' | ' + C.CompanyName
                        FROM     TransactionInsuranceApplication AS TI
                                INNER JOIN
                                CompanyDetail AS C
                                ON TI.InsuranceCompanyId = C.CompanyCompanyTypeId
                        WHERE    TI.TransactionId = T.Id
                                AND C.CompanyTypeName = 'INSURANCE'
                        ORDER BY C.CreatedDate
                        FOR      XML PATH ('')), 1, 2, ''), '') AS InsuranceCompany,
        ISNULL(STUFF((SELECT   ' | ' + LEFT(UPPER(CONVERT (VARCHAR, TI.LeadSentDate, 106)), 12)
                        FROM     TransactionInsuranceApplication AS TI
                                INNER JOIN
                                CompanyDetail AS C
                                ON TI.InsuranceCompanyId = C.CompanyCompanyTypeId
                        WHERE    TI.TransactionId = T.Id
                                AND C.CompanyTypeName = 'INSURANCE'
                        ORDER BY C.CreatedDate
                        FOR      XML PATH ('')), 1, 2, ''), '') AS InsuranceCompanyLeadDateSent,
        ISNULL(STUFF((SELECT   ' | ' + C.CompanyName
                        FROM     TransactionInsuranceApplication AS TI
                                INNER JOIN
                                CompanyDetail AS C
                                ON TI.InsuranceCompanyId = C.CompanyCompanyTypeId
                        WHERE    TI.TransactionId = T.Id
                                AND C.CompanyTypeName = 'BROKER'
                        ORDER BY C.CreatedDate
                        FOR      XML PATH ('')), 1, 2, ''), '') AS BrokerCompany,
        ISNULL(STUFF((SELECT   ' | ' + LEFT(UPPER(CONVERT (VARCHAR, TI.LeadSentDate, 106)), 12)
                        FROM     TransactionInsuranceApplication AS TI
                                INNER JOIN
                                CompanyDetail AS C
                                ON TI.InsuranceCompanyId = C.CompanyCompanyTypeId
                        WHERE    TI.TransactionId = T.Id
                                AND C.CompanyTypeName = 'BROKER'
                        ORDER BY C.CreatedDate
                        FOR      XML PATH ('')), 1, 2, ''), '') AS BrokerCompanyLeadDateSent,
						I.IsActive
        FROM   [Transaction] AS T WITH (NOLOCK)
               INNER JOIN
               TransactionInsuranceApplication AS I WITH (NOLOCK)
               ON T.Id = I.TransactionId),
       ProductDetail
AS     (SELECT TP.*,
               P.ProductTypeId,
               P.ProductSubTypeId,
               P.PaymentType
        FROM   TransactionProduct AS TP WITH (NOLOCK)
               INNER JOIN
               Product AS P WITH (NOLOCK)
               ON P.Id = TP.ProductId
        WHERE  TP.IsActive = 1
               AND TP.ProductOptionId IS NOT NULL),
	ItemDetails
AS (SELECT TI.*, (CASE WHEN TI.LoanAmountAppliedFor <> NULL THEN TI.LoanAmountAppliedFor ELSE (ISNULL(TI.TotalItemsRetailValue,0) - ISNULL(TI.Discount,0) - ISNULL(TI.Deposit,0))END) AS FinancedAmount FROM TransactionItem TI
		INNER JOIN [Transaction] T on T.Id = TI.TransactionId
		WHERE TI.IsActive = 1),
       InceptDetail
AS     (SELECT TransactionID,
               LocalPurchaseNumber,
			   IsActive
        FROM   InceptTransaction WITH (NOLOCK)),
       FinanceDetail
AS     (SELECT DISTINCT T.Id AS TransactionId,
        ISNULL(STUFF((SELECT   ' | ' + TF.BankDealReferenceNumber
                        FROM     TransactionFinanceApplication AS TF
                        WHERE    TF.TransactionId = T.Id AND TF.IsActive =1
                        ORDER BY TF.CreatedDate
                        FOR      XML PATH ('')), 1, 2, ''), '') AS FinAppBankDealReferenceNumber,
        ISNULL(STUFF((SELECT   ' | ' + convert(NVARCHAR, TF.FinanceStatusId)
                        FROM     TransactionFinanceApplication AS TF
                        WHERE    TF.TransactionId = T.Id AND TF.IsActive =1
                        ORDER BY TF.CreatedDate
                        FOR      XML PATH ('')), 1, 2, ''), '') AS FinAppFinanceStatusId,
        ISNULL(STUFF((SELECT   ' | ' + TF.FinanceAccountNumber
                        FROM     TransactionFinanceApplication AS TF
                        WHERE    TF.TransactionId = T.Id AND TF.IsActive =1
                        ORDER BY TF.CreatedDate
                        FOR      XML PATH ('')), 1, 2, ''), '') AS FinAppFinanceAccountNumber
        FROM   [Transaction] AS T WITH (NOLOCK)
               --INNER JOIN
               --TransactionFinanceApplication AS F WITH (NOLOCK)
               --ON T.Id = F.TransactionId
			   ),
       TransactionDetail
AS     (SELECT T.Id AS TransactionId,
               T.GroupId,
               UPPER(G.GroupName) AS GroupName,
               T.BranchId,
               UPPER(B.BranchName) AS BranchName,
               T.TransactionTypeId,
               UPPER(TT.Name) AS TrasactionType,
               TT.EnumName AS TrasactionTypeEnumName,
               T.TransactionStatusId,
               TS.Name AS TransactionStatus,
               T.TransactionStatusNotes,
               UPPER(T.ReferenceNumber) AS ReferenceNumber,
			   UPPER(T.FleetNumber) AS FleetNumber,
               T.TransactionAPIOwner,
               RTRIM(LTRIM(UPPER(CONCAT(AOU.Title, ' ', AOU.FirstName, ' ', AOU.LastName)))) AS TransactionAPIOwnerUser,
               CT.Name AS PreferredCallTime,
               T.SalesPersonId,              
			   SP.SalesPersonName as SalesPerson,
               SP.EmployeeNumber AS SalesPersonEmpNo,
               T.BusinessManagerId,
               RTRIM(LTRIM(UPPER(CONCAT(BM.Title, ' ', BM.FirstName, ' ', BM.LastName)))) AS BusinessManager,
               T.IsIncepted,
               T.InceptDate,
               T.CreatedBy,
               RTRIM(LTRIM(UPPER(CONCAT(UC.Title, ' ', UC.FirstName, ' ', UC.LastName)))) AS CreatedByUser,
               T.CreatedDate,
               T.ModifiedBy,
               RTRIM(LTRIM(UPPER(CONCAT(UM.Title, ' ', UM.FirstName, ' ', UM.LastName)))) AS ModifiedByUser,
               T.ModifiedDate,
               T.IsActive,
               T.CountryId,
               T.IsBlockAutomaticUpdate,
               T.APICompanyId,
               T.IsApiUpdate,
               CASE WHEN T.IsIncepted = 1 THEN T.PrimeInterestRate ELSE (SELECT TOP 1 PrimeInterestRate FROM GlobalSettings WHERE CountryId= T.CountryId) END AS PrimeInterestRate,
               INC.LocalPurchaseNumber,
               T.TransactionSource AS TransactionSource,
               ISNULL((SELECT UPPER(CompanyCode) FROM Company WHERE Id = T.APICompanyId),'') AS SalesCompCode,
               ISNULL((SELECT UPPER(CompanyName) FROM Company WHERE Id = T.APICompanyId),'') AS SalesCompName,
               T.NetTradeInDepositValue,
               T.IsCashTransaction,
               CASE WHEN T.IsCashTransaction = 1 THEN 'YES' ELSE 'NO' END AS CashTransaction,
               CASE WHEN (SELECT COUNT(FH.Id)
                          FROM   FinanceApplicationHistory AS FH WITH (NOLOCK)
                          WHERE  FH.TransactionId = T.Id
                                 AND FH.IsActive = 1) > 0 THEN 'YES' ELSE 'NO' END AS AppliedForFinance,
               T.FinanceCompanyId,
               UPPER(FC.CompanyName) AS FinanceCompanyName,
               UPPER(T.FinanceAccountNumber) AS FinanceAccountNumber,
               T.FinanceStatusId,
               UPPER(FS.Name) AS FinanceStatus,
               UPPER(T.FinanceStatusNotes) AS FinanceStatusNotes,
               CASE WHEN T.PreferredInterestRate IS NOT NULL THEN T.PreferredInterestRate ELSE T.ProfitRate END AS InterestRate,
               T.IsPreArrangedFinance,
               T.FinanceTermId,
               FT.FinanceTermName AS FinanceTerm,
               T.InterestRateTypeId,
               UPPER(RT.Name) AS InterestRateType,
               T.PaymentType,
               UPPER(PT.Name) AS PaymentTypeName,
               T.FinanceType,
               UPPER(FTI.Name) AS FinanceTypeName,
               T.DocInvoiceNo AS InvoiceNumber,
               T.StockNo,
               T.DocInvoiceDate,
               T.DocInvoicePaidDate,
               T.VehicleDeliveryDate,
               T.OtherFee,
               T.OtherCost,
               T.DICAmount,
               T.DICPercentage,
               CONVERT (VARCHAR, DATEDIFF(dd, T.DocInvoiceDate, T.DocInvoicePaidDate)) + ':' + CONVERT (VARCHAR, DATEDIFF(hh, T.DocInvoiceDate, T.DocInvoicePaidDate) % 24) + ':' + CONVERT (VARCHAR, DATEDIFF(mi, T.DocInvoiceDate, T.DocInvoicePaidDate) % 60) AS DebtorDays,
               CONVERT (INT, DATEDIFF(mi, T.DocInvoiceDate, T.DocInvoicePaidDate)) AS DebtorMinutes,
               T.PayOutRequestDate,
               T.CallBackCustomerDateTime,
               T.DeclineDateTime,
               T.TransactionClientId,
               TC.CustomerType,
               UPPER(TC.FirstName) AS FirstName,
               UPPER(TC.LastName) AS LastName,
               TC.Mobile,
               UPPER(TC.EmailAddress) AS EmailAddress,
               UPPER(TC.CompanyName) AS CompanyName,
               UPPER(TCE.Name) AS ComPhyAddEmirate,
               TC.[IDNumber] AS IDNumber,
               TC.[ComRegistrationNumber] AS [ComRegistrationNumber],
               CASE WHEN TC.CustomerType = 1 THEN RTRIM(LTRIM(UPPER(CONCAT(Title.Code, ' ', TC.FirstName, ' ', TC.LastName)))) ELSE UPPER(TC.CompanyName) END AS Customer,
               T.IsDealSighted,
               T.VehicleId,
               V.VehicleCode,
               V.Manufacturer,
               V.Model,
               V.VehicleTypeName,
               V.Trim,
               V.ModelYear,
               T.Kilometers,
               T.FirstRegistrationDate,
               CASE WHEN T.FirstRegistrationDate IS NOT NULL THEN CASE WHEN DATEADD(YEAR, DATEDIFF(YEAR, T.FirstRegistrationDate, GETDATE()), T.FirstRegistrationDate) > GETDATE() THEN DATEDIFF(MONTH, T.FirstRegistrationDate, GETDATE()) ELSE DATEDIFF(MONTH
			   , T.FirstRegistrationDate, GETDATE()) END END AS VehicleAge,
               T.VehicleUse AS VehicleUseId,
               UPPER(VU.Name) AS VehicleUse,
               T.VehicleCondition AS VehicleConditionId,
               UPPER(VC.Name) AS VehicleCondition,
               UPPER(VC.EnumName) AS VehicleConditionEnumName,
               T.DisburseId,
               UPPER(DT.Name) AS DisburseTo,
               UPPER(T.PrivateKey) AS PrivateKey,
               ISNULL(T.RetailPrice, 0) AS VehicleRetailPrice,
               ISNULL(T.VehicleCostPrice, 0) AS VehicleCostPrice,
               (ISNULL(T.RetailPrice, 0) - ISNULL(T.VehicleCostPrice, 0) - ISNULL(T.Discount, 0)) AS VehicleProfit,
               (ISNULL(T.RetailPrice, 0) - ISNULL(T.VehicleCostPrice, 0) - ISNULL(T.Discount, 0)) AS RevisedVehicleProfit,
               ISNULL(T.Discount, 0) AS VehicleDiscount,
               ISNULL(T.DownPayment, 0) AS VehicleDownPayment,
               ISNULL(T.BalloonValue, 0) AS BalloonValue,
               ISNULL(T.BalloonPercentage, 0) AS BalloonPercentage,
               CASE WHEN LEN(I.InsuranceCompanyLeadDateSent) > 0 THEN 'YES' ELSE 'NO' END AS InsuranceLeadSent,
               UPPER(I.InsuranceCompany) AS InsuranceCompany,
               I.InsuranceCompanyLeadDateSent,
               UPPER(I.BrokerCompany) AS BrokerCompany,
               I.BrokerCompanyLeadDateSent,
               ISNULL((SELECT SUM(A.RetailPrice)
                       FROM   TransactionAccessories AS A
                              INNER JOIN
                              Accessories AS S
                              ON S.Id = A.AccessoriesId
							  INNER JOIN [Transaction] AS TT
							  ON TT.Id = A.TransactionId
							  INNER JOIN StaticValue AS SV
							  ON TT.VehicleCondition = SV.Id
                       WHERE  
					   A.TransactionId = T.Id AND
					    A.IsPayByCash = 0 AND
						((UPPER(SV.EnumName) = 'NEW' AND S.IsNewVehicleAccessory = 1) OR S.IsGeneric=1)
                              AND A.IsActive = 1), 0) AS AccessoriesFinacedAmount,
               ISNULL((SELECT SUM(A.RetailPrice)
                       FROM   TransactionAccessories AS A
                              INNER JOIN
                              Accessories AS S
                              ON S.Id = A.AccessoriesId
							  INNER JOIN [Transaction] AS TT
							  ON TT.Id = A.TransactionId
							  INNER JOIN StaticValue AS SV
							  ON TT.VehicleCondition = SV.Id
                       WHERE  A.TransactionId = T.Id
                              AND A.IsPayByCash = 1
							  AND ((UPPER(SV.EnumName) = 'NEW' AND S.IsNewVehicleAccessory = 1) OR S.IsGeneric=1)
                              AND A.IsActive = 1), 0) AS AccessoriesCashAmount,
               ISNULL((SELECT SUM(A.RetailPrice)
                       FROM   TransactionAccessories AS A
                              INNER JOIN
                              Accessories AS S
                              ON S.Id = A.AccessoriesId
							  INNER JOIN StaticValue AS SV
							  ON T.VehicleCondition = SV.Id
                       WHERE  A.TransactionId = T.Id
                              --AND S.IsGeneric = 1
							  AND ((UPPER(SV.EnumName) = 'NEW' AND S.IsNewVehicleAccessory = 1) OR S.IsGeneric=1)
                              AND A.IsActive = 1), 0) AS TotalAccessoriesAmount,
               ISNULL((SELECT SUM(A.Cost)
                       FROM   TransactionAccessories AS A
                              INNER JOIN
                              Accessories AS S
                              ON S.Id = A.AccessoriesId
                       WHERE  A.TransactionId = T.Id
                              AND S.IsGeneric = 1
                              AND A.IsActive = 1), 0) AS TotalAccessoriesCostAmount,
               (SELECT COUNT(DISTINCT TP.ProductId)
                FROM   ProductDetail AS TP
                WHERE  TP.TransactionId = T.Id
                       AND TP.TransactionTypeId = T.TransactionTypeId) AS VAPSSold,
               (SELECT COUNT(DISTINCT TP.ProductTypeId)
                FROM   ProductDetail AS TP
                WHERE  TP.TransactionId = T.Id
                       AND TP.TransactionTypeId = T.TransactionTypeId) AS CategoriesSold,
               0 AS NoOfPackagesSold,
               ISNULL((SELECT SUM(TP.RetailPrice)
                     FROM   ProductDetail AS TP
                       WHERE  TP.TransactionId = T.Id
                              AND TP.IsPayByCash = 0
                              AND T.TransactionTypeId = TP.TransactionTypeId
                              AND TP.PaymentType != 2), 0) AS ProductFinanceAmount,
               ISNULL((SELECT SUM(TP.RetailPrice)
                       FROM   ProductDetail AS TP
                       WHERE  TP.TransactionId = T.Id
                              AND TP.IsActive = 1
                              AND TP.IsPayByCash = 1
                              AND T.TransactionTypeId = TP.TransactionTypeId), 0) AS ProductCashAmount,
               ISNULL((SELECT SUM(TP.RetailPrice)
                       FROM   ProductDetail AS TP
                       WHERE  TP.TransactionId = T.Id
                              AND TP.IsActive = 1
                              AND TP.IsPayByCash = 0
                              AND T.TransactionTypeId = TP.TransactionTypeId
                              AND TP.PaymentType = 2), 0) AS MonthlyProductAmount,
               ISNULL((SELECT SUM(TP.RetailPrice)
                       FROM   ProductDetail AS TP
                       WHERE  TP.TransactionId = T.Id
                              AND TP.IsActive = 1
                              AND T.TransactionTypeId = TP.TransactionTypeId), 0) AS TotalProductAmount,
               ISNULL((SELECT SUM(Payover)
                       FROM   ProductDetail AS TP
                       WHERE  TP.TransactionId = T.Id
                              AND TP.TransactionTypeId = T.TransactionTypeId
                              AND TP.IsActive = 1), 0) AS TotalProductPayoverAmount,
				ISNULL((SELECT SUM(FinancedAmount) 
						FROM ItemDetails TI
						WHERE TI.TransactionId = T.Id 
								AND TI.IsActive = 1),0) as ItemFinancedAmount,
				CASE WHEN T.IsIncepted = 1 THEN T.TransactionFee ELSE 0 END AS 'TransactionFee',
					T.ParentTransactionID,
					T.CopiedFrom,
					F.FinAppFinanceStatusId,
					F.FinAppFinanceAccountNumber,
					F.FinAppBankDealReferenceNumber,
					 T.ReceivedByFAndIDate, T.DealNotTakenDate,T.CustomerCancelledDate,
					UPPER(SP.SalesPersonName+' '+ CASE WHEN SP.IdNumber IS NOT NULL then '('+ SP.IdNumber+')' else '' end +' '+CASE WHEN B.BranchName IS NOT NULL then '('+ B.BranchName+')' else '' end) AS SalesPersonDetail
        FROM   [Transaction] AS T WITH (NOLOCK)
               LEFT OUTER JOIN
               [Group] AS G WITH (NOLOCK)
               ON G.Id = T.GroupId AND G.IsActive =1
               LEFT OUTER JOIN
               [Branch] AS B WITH (NOLOCK)
               ON B.Id = T.BranchId AND B.IsActive =1
               LEFT OUTER JOIN
               StaticValue AS TT WITH (NOLOCK)
               ON TT.Id = T.TransactionTypeId AND TT.IsActive =1
               LEFT OUTER JOIN
               StaticValue AS TS WITH (NOLOCK)
               ON TS.Id = T.TransactionStatusId AND TS.IsActive =1
               LEFT OUTER JOIN
               StaticValue AS FS WITH (NOLOCK)
               ON FS.Id = T.FinanceStatusId AND FS.IsActive =1
               LEFT OUTER JOIN
               SalesPerson AS SP WITH (NOLOCK)
               ON SP.Id = T.SalesPersonId AND SP.IsActive =1
               LEFT OUTER JOIN
               Users AS BM WITH (NOLOCK)
               ON BM.Id = T.BusinessManagerId AND BM.IsActive =1
               LEFT OUTER JOIN
               CompanyDetail AS FC WITH (NOLOCK)
               ON FC.CompanyCompanyTypeId = T.FinanceCompanyId AND FC.IsActive =1
               LEFT OUTER JOIN
               FinanceTerm AS FT WITH (NOLOCK)
               ON FT.Id = T.FinanceTermId
               LEFT OUTER JOIN
               StaticValue AS FTI WITH (NOLOCK)
               ON FTI.Id = T.FinanceType AND FTI.IsActive =1
               LEFT OUTER JOIN
               StaticValue AS RT WITH (NOLOCK)
               ON RT.Id = T.InterestRateTypeId AND RT.IsActive =1
               LEFT OUTER JOIN
               StaticValue AS PT WITH (NOLOCK)
               ON PT.Id = T.PaymentType AND PT.IsActive =1
               LEFT OUTER JOIN
              StaticValue AS CT WITH (NOLOCK)
               ON CT.Id = T.PreferredCallTime AND CT.IsActive =1
               LEFT OUTER JOIN
               Users AS UC WITH (NOLOCK)
               ON UC.Id = T.CreatedBy AND UC.IsActive =1
               LEFT OUTER JOIN
               Users AS UM WITH (NOLOCK)
               ON UM.Id = T.ModifiedBy AND UM.IsActive =1
               LEFT OUTER JOIN
               Users AS AOU WITH (NOLOCK)
               ON AOU.Id = T.TransactionAPIOwner AND AOU.IsActive =1
               LEFT OUTER JOIN
               TransactionClient AS TC WITH (NOLOCK)
               ON TC.Id = T.TransactionClientId AND TC.IsActive =1
               LEFT OUTER JOIN
               StaticValue AS TCE
               ON TCE.Id = TC.ComPhyAddEmirate AND TCE.IsActive =1
               LEFT OUTER JOIN
               StaticValue AS Title WITH (NOLOCK)
               ON Title.Id = TC.TitleId AND Title.IsActive =1
               LEFT OUTER JOIN
               VehicleDetail AS V WITH (NOLOCK)
               ON V.VehicleId = T.VehicleId AND V.IsActive =1
               LEFT OUTER JOIN
               StaticValue AS VU WITH (NOLOCK)
               ON VU.Id = T.VehicleUse AND VU.IsActive =1
               LEFT OUTER JOIN
               StaticValue AS VC WITH (NOLOCK)
               ON VC.Id = T.VehicleCondition AND VC.IsActive =1
               LEFT OUTER JOIN
               StaticValue AS DT WITH (NOLOCK)
               ON DT.Id = T.DisburseId AND DT.IsActive =1
               LEFT OUTER JOIN
               InsuranceDetail AS I WITH (NOLOCK)
               ON T.Id = I.TransactionId AND I.IsActive =1
               LEFT OUTER JOIN
               InceptDetail AS INC WITH (NOLOCK)
               ON T.ID = INC.TransactionID AND INC.IsActive =1
			   LEFT OUTER JOIN
			   FinanceDetail AS F WITH (NOLOCK)
			   ON T.ID = F.TransactionID 
			   ) 
SELECT T.*,
       ISNULL(T.InterestRate, 0) - ISNULL(T.PrimeInterestRate, 0) AS PrimeFactor,
       (T.TotalAccessoriesAmount - T.TotalAccessoriesCostAmount) AS TotalAccessoriesRetention,
       CASE WHEN T.IsCashTransaction = 1 THEN 0.00 
			ELSE CASE WHEN T.TrasactionTypeEnumName = 'UNSECUREDLENDING' THEN (T.ItemFinancedAmount + T.AccessoriesFinacedAmount + T.ProductFinanceAmount)
			ELSE (T.VehicleRetailPrice - T.VehicleDiscount - T.VehicleDownPayment + T.AccessoriesFinacedAmount + T.ProductFinanceAmount) END 
			END AS TotalFinanceAmount,
       (T.TotalProductAmount - T.TotalProductPayoverAmount) AS TotalProductRetension,
       (T.TotalProductAmount - T.TotalProductPayoverAmount) + T.VehicleProfit AS TotalVehicleAndProductProfit,
       CASE WHEN (T.VehicleRetailPrice - T.VehicleDiscount - T.VehicleDownPayment + T.AccessoriesFinacedAmount + T.ProductFinanceAmount) = 0 THEN 0 ELSE CONVERT (DECIMAL (18, 2), ISNULL(T.DICAmount, 0) / (T.VehicleRetailPrice - T.VehicleDiscount - T.VehicleDownPayment + T.AccessoriesFinacedAmount + T.ProductFinanceAmount) * 1000) END AS DICperR1000,
       CASE WHEN T.IsCashTransaction = 0 THEN CONVERT (DECIMAL (18, 2), ISNULL(T.ProductCashAmount, 0) + ISNULL(T.AccessoriesCashAmount, 0) + ISNULL(T.VehicleDownPayment, 0)) 
		ELSE CONVERT (DECIMAL (18, 2), ISNULL(T.ProductCashAmount, 0) + ISNULL(T.AccessoriesCashAmount, 0) + ISNULL(T.VehicleRetailPrice, 0) - ISNULL(T.VehicleDiscount, 0)) END AS TotalCashAmount
FROM   TransactionDetail AS T;

