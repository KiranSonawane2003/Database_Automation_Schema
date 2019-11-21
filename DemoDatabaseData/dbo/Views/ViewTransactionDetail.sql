
CREATE VIEW [dbo].[ViewTransactionDetail]
AS
SELECT R.*,
       CASE WHEN R.IsCashTransaction = 1 THEN 0.00 ELSE (R.VehicleRetailPrice - R.VehicleDiscount - R.VehicleDownPayment + R.AccessoriesFinacedAmount + R.ProductFinanceAmount) END AS TotalFinanceAmount,
       (R.TotalProductAmount - TotalProductPayoverAmount) AS TotalProductRetension,
       (R.TotalProductAmount - TotalProductPayoverAmount) + R.VehicleProfit AS TotalVehicleAndProductProfit
FROM   (SELECT T.Id AS TransactionId,
               T.TransactionClientId,
               T.GroupId,
               (SELECT G.GroupName
                FROM   [Group] AS G
                WHERE  G.Id = T.GroupId) AS GroupName,
               T.BranchId,
               (SELECT B.BranchName
                FROM   Branch AS B
                WHERE  B.Id = T.BranchId) AS BranchName,
               T.TransactionTypeId,
               (SELECT SV.Name
                FROM   StaticValue AS SV
                WHERE  SV.Id = T.TransactionTypeId) AS TransactionType,
               (SELECT SV.SortOrder
                FROM   StaticValue AS SV
                WHERE  SV.Id = T.TransactionTypeId) AS TransactionTypeSortOrder,
               T.TransactionStatusId,
               (SELECT SV.Name
                FROM   StaticValue AS SV
                WHERE  SV.Id = T.TransactionStatusId) AS TransactionStatus,
               T.FinanceStatusId,
               (SELECT SV.Name
                FROM   StaticValue AS SV
                WHERE  SV.Id = T.FinanceStatusId) AS FinanceStatus,
               T.FinanceStatusNotes,
               T.IsDealSighted,
               T.SalesPersonId,
               UPPER((SELECT S.SalesPersonName
                      FROM   SalesPerson AS S
                      WHERE  S.Id = T.SalesPersonId)) AS SalesPerson,
               T.BusinessManagerId,
               UPPER((SELECT U.FirstName + ' ' + U.LastName
                      FROM   Users AS U
                      WHERE  U.id = T.BusinessManagerId)) AS BusinessManager,
               T.IsCashTransaction,
               T.PreferredInterestRate,
               T.ProfitRate,
               T.FinanceCompanyId,
               UPPER((SELECT C.CompanyName
                      FROM   CompanyCompanyTypeMapping AS CM
                             INNER JOIN
                             Company AS C
                             ON CM.CompanyId = C.Id
                      WHERE  CM.Id = T.FinanceCompanyId)) AS FinanceCompany,
               T.IsPreArrangedFinance,
               T.FinanceAccountNumber,
               T.FinanceTermId,
               (SELECT FT.FinanceTermName
                FROM   FinanceTerm AS FT
                WHERE  FT.Id = T.FinanceTermId) AS FinanceTerm,
               T.VehicleId,
               T.VehicleUse AS VehicleUseId,
               UPPER((SELECT SV.NAME
                      FROM   StaticValue AS SV
                      WHERE  SV.Id = T.VehicleUse)) AS VehicleUse,
               T.VehicleCondition AS VehicleConditionId,
               UPPER((SELECT SV.NAME
                      FROM   StaticValue AS SV
                      WHERE  SV.Id = T.VehicleCondition)) AS VehicleCondition,
               T.DisburseId,
               UPPER((SELECT SV.NAME
                      FROM   StaticValue AS SV
                      WHERE  SV.Id = T.DisburseId)) AS DisburseTo,
               UPPER(T.PrivateKey) AS PrivateKey,
               ISNULL(T.RetailPrice, 0) AS VehicleRetailPrice,
               ISNULL(T.Discount, 0) AS VehicleDiscount,
               ISNULL(T.DownPayment, 0) AS VehicleDownPayment,
               ISNULL(T.BalloonValue, 0) AS BalloonValue,
               ISNULL(T.BalloonPercentage, 0) AS BalloonPercentage,
               T.IsTradeIn,
               T.IsTradeInCashTransaction,
               T.TradeInFinanceCompanyId,
               T.TradeInCarFinanceAccNumber,
               T.TradeInCurrentInstalment,
               T.TradeInValue,
               T.TradeInSettlementValue,
               T.TradeInCashPayback,
               T.NetTradeInDepositValue,
               UPPER(T.ChassisNumber) AS VehicleChassisNumber,
               UPPER(T.EngineNumber) AS VehicleEngineNumber,
               UPPER(T.RegistrationNumber) AS VehicleRegistrationNumber,
               T.FirstRegistrationDate AS VehicleFirstRegistrationDate,
               UPPER(T.Color) AS VehicleColor,
               T.VehicleEmirate AS VehicleEmirateId,
               UPPER((SELECT SV.NAME
                      FROM   StaticValue AS SV
                      WHERE  SV.Id = T.VehicleEmirate)) AS VehicleEmirate,
               T.InterestRateTypeId,
               UPPER((SELECT SV.NAME
                      FROM   StaticValue AS SV
                      WHERE  SV.Id = T.InterestRateTypeId)) AS InterestRateType,
               T.PaymentType AS PaymentTypeId,
               UPPER((SELECT SV.NAME
                      FROM   StaticValue AS SV
                      WHERE  SV.Id = T.PaymentType)) AS PaymentType,
               UPPER(T.ReferenceNumber) AS ReferenceNumber,
               T.FinanceType AS FinanceTypeId,
               UPPER((SELECT SV.NAME
                      FROM   StaticValue AS SV
                      WHERE  SV.Id = T.FinanceType)) AS FinanceType,
               T.VehicleCostPrice,
               T.Immoblizer AS ImmoblizerId,
               UPPER((SELECT SV.NAME
                      FROM   StaticValue AS SV
                      WHERE  SV.Id = T.Immoblizer)) AS Immoblizer,
               T.IsManufacturerWarranty,
               T.ManWarrantyExpiryMonths AS ManWarrantyExpiryMonthsId,
               (SELECT EM.Month
                FROM   ExpiryMonth AS EM
                WHERE  EM.Id = T.ManWarrantyExpiryMonths) AS ManWarrantyExpiryMonths,
               T.ManWarrantyExpiryKM,
               T.ExistingWarranty AS ExistingWarrantyId,
               UPPER((SELECT SV.NAME
                      FROM   StaticValue AS SV
                      WHERE  SV.Id = T.ExistingWarranty)) AS ExistingWarranty,
               T.ExistingWarrantyExpiryDate,
               T.ExistingWarrantyExpiryKM,
               T.ManufacturePlanType AS ManufacturePlanTypeId,
               UPPER((SELECT SV.NAME
                      FROM   StaticValue AS SV
                      WHERE  SV.Id = T.ManufacturePlanType)) AS ManufacturePlanType,
               T.ManPlanExpiryMonths AS ManPlanExpiryMonthsId,
               (SELECT EM.Month
                FROM   ExpiryMonth AS EM
                WHERE  EM.Id = T.ManPlanExpiryMonths) AS ManPlanExpiryMonths,
               T.ManPlanExpiryKM,
               T.ExistingPlanType AS ExistingPlanTypeId,
               UPPER((SELECT SV.NAME
                      FROM   StaticValue AS SV
                      WHERE  SV.Id = T.ExistingPlanType)) AS ExistingPlanType,
               T.ExistingPlanExpiryDate,
               T.ExistingPlanExpiryKM,
               T.VehicleDescription,
               T.PreferredCallTime AS PreferredCallTimeId,
               UPPER((SELECT SV.NAME
                      FROM   StaticValue AS SV
                      WHERE  SV.Id = T.PreferredCallTime)) AS PreferredCallTime,
               T.IsManufaturerApprovedUsedVehicle,
               T.IsFullServiceHistory,
               T.Kilometers,
               T.SeatingCapacity,
               UPPER(T.VINNumber) AS VINNumber,
               T.BankDocumentationFees,
               T.StampDutyFees,
               T.CallBackCustomerDateTime,
               T.DeclineDateTime,
               T.DocInvoiceNo,
               T.StockNo,
               T.DocInvoiceDate,
               T.DocInvoicePaidDate,
               T.VehicleDeliveryDate,
               T.OtherFee,
               T.OtherCost,
               T.DICAmount,
               T.DICPercentage,
               T.PayOutRequestDate,
               T.InceptDate,
               T.IsIncepted,
               T.IsActive,
               T.CountryId,
               T.CreatedDate,
               T.CreatedBy,
               (SELECT RTRIM(LTRIM(U.FirstName + ' ' + U.LastName))
                FROM   [Users] AS U
                WHERE  U.Id = T.CreatedBy) AS CreatedByUser,
               T.ModifiedDate,
               T.ModifiedBy,
               (SELECT RTRIM(LTRIM(U.FirstName + ' ' + U.LastName))
                FROM   [Users] AS U
                WHERE  U.Id = T.ModifiedBy) AS ModifiedByUser,
               (ISNULL(T.RetailPrice, 0) - ISNULL(T.VehicleCostPrice, 0) - ISNULL(T.Discount, 0)) AS VehicleProfit,
               (ISNULL(T.RetailPrice, 0) - ISNULL(T.VehicleCostPrice, 0) - ISNULL(T.Discount, 0)) AS RevisedVehicleProfit,
               ISNULL((SELECT SUM(A.RetailPrice)
                       FROM   TransactionAccessories AS A
                              INNER JOIN
                              Accessories AS S
                              ON S.Id = A.AccessoriesId
							  INNER JOIN [Transaction] AS T
							  ON T.Id = A.TransactionId
							  INNER JOIN StaticValue AS SV
							  ON T.VehicleCondition = SV.Id
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
							  INNER JOIN [Transaction] AS T
							  ON T.Id = A.TransactionId
							  INNER JOIN StaticValue AS SV
							  ON T.VehicleCondition = SV.Id
                       WHERE  A.TransactionId = T.Id
                              AND A.IsPayByCash = 1
							  AND ((UPPER(SV.EnumName) = 'NEW' AND S.IsNewVehicleAccessory = 1) OR S.IsGeneric=1)
                              AND A.IsActive = 1), 0) AS AccessoriesCashAmount,
               ISNULL((SELECT SUM(A.RetailPrice)
                       FROM   TransactionAccessories AS A
                       WHERE  A.TransactionId = T.Id
                              AND A.IsActive = 1), 0) AS TotalAccessoriesAmount,
               ISNULL((SELECT SUM(A.Cost)
                       FROM   TransactionAccessories AS A
                       WHERE  A.TransactionId = T.Id
                              AND A.IsActive = 1), 0) AS TotalAccessoriesCostAmount,
               ISNULL((SELECT SUM(TP.RetailPrice)
                       FROM   TransactionProduct AS TP
                              INNER JOIN
                              Product AS P
                              ON P.Id = TP.ProductId
                       WHERE  TP.TransactionId = T.Id
                              AND TP.IsActive = 1
                              AND TP.IsPayByCash = 0
                              AND T.TransactionTypeId = TP.TransactionTypeId
                              AND P.PaymentType != 2), 0) AS ProductFinanceAmount,
               ISNULL((SELECT SUM(TP.RetailPrice)
                       FROM   TransactionProduct AS TP
                              INNER JOIN
                              Product AS P
                              ON P.Id = TP.ProductId
                       WHERE  TP.TransactionId = T.Id
                              AND TP.IsActive = 1
                              AND TP.IsPayByCash = 1
                              AND T.TransactionTypeId = TP.TransactionTypeId), 0) AS ProductCashAmount,
               ISNULL((SELECT SUM(TP.RetailPrice)
                       FROM   TransactionProduct AS TP
                              INNER JOIN
                              Product AS P
                              ON P.Id = TP.ProductId
                       WHERE  TP.TransactionId = T.Id
                              AND TP.IsActive = 1
                              AND TP.IsPayByCash = 0
                              AND T.TransactionTypeId = TP.TransactionTypeId
                              AND P.PaymentType = 2), 0) AS MonthlyProductAmount,
               ISNULL((SELECT SUM(TP.RetailPrice)
                       FROM   TransactionProduct AS TP
                              INNER JOIN
                              Product AS P
                              ON P.Id = TP.ProductId
                       WHERE  TP.TransactionId = T.Id
                              AND TP.IsActive = 1
                              AND T.TransactionTypeId = TP.TransactionTypeId), 0) AS TotalProductAmount,
               ISNULL((SELECT SUM(Payover)
                       FROM   TransactionProduct AS TP
                       WHERE  TP.TransactionId = T.Id
                              AND TP.TransactionTypeId = T.TransactionTypeId
                              AND TP.IsActive = 1), 0) AS TotalProductPayoverAmount,
			   CASE When T.IsIncepted = 1 Then T.TransactionFee ELSE 0 END As TransactionFee
        FROM   [Transaction] AS T) AS R;

