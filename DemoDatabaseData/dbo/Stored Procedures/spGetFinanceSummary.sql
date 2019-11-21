
CREATE PROCEDURE [dbo].[spGetFinanceSummary](

@TransactionId NVARCHAR(max),
@CompanyID		NVARCHAR(max), 
@VehicleConditions NVARCHAR(max),
@TransactionTypes NVARCHAR(max),
@CountryID BIGINT,
@AdministratorId NVARCHAR(max),
@ClaimId NVARCHAR(max),
@OwnerId NVARCHAR(max),
@UnderwriterId NVARCHAR(max))

AS 

BEGIN

DECLARE @IsGeneric BIT
SELECT @IsGeneric=ISNULL(IsGeneric,0) FROM Country WHERE Id=@CountryID

IF OBJECT_ID('tempdb..#TempFinalOutput') IS NOT NULL
    BEGIN
  DROP TABLE #TempFinalOutput
    END

CREATE TABLE #TempFinalOutput
 (
 		ColumnGroupID							INT,
		FinanceCompanyID						INT,
        FinanceCompany							NVARCHAR(MAX),
		VehicleSoldCount						INT,
		VehicleProfit							DECIMAL(18,2),
		VehicleFinanced							INT,
		FinanceAmount							DECIMAL(18,2), 
		IntRate									DECIMAL(18,2), 
		PrimeFactor								DECIMAL(18,2), --pending
		FixedCount								DECIMAL(18,2),
		LinkedCount								DECIMAL(18,2),
		TotalDIC								DECIMAL(18,2), 
		PerR1000								DECIMAL(18,2), 
		DICAPU									DECIMAL(18,2), 
		SalesSystem								NVARCHAR(MAX),
		AvgDebtDays								NVARCHAR(MAX),
		AvgDebtMins								INT,
		AccessoriesRetension					DECIMAL(18,2),

		-- Product Type and SubType 
		LeadSentCount							INT,
		ProductCount							INT,
		ProductPenetration						DECIMAL(18,2),
		ProductRetension						DECIMAL(18,2),
		ProductAPU								DECIMAL(18,2),
		ProductAPP								DECIMAL(18,2),
		ProductTotalAPU							DECIMAL(18,2),

		-- 2nd GP				
		SecondGPAPPT							DECIMAL(18,2),
		SecondGPTotalRetension					DECIMAL(18,2),

		--1st GP columns computed in report it self

		--Total Ret
		TotalRetensionFrom_Product				DECIMAL(18,2),
		TotalRetensionFrom_DIC_OTRCOST_OTRFEES	DECIMAL(18,2),

		--%Retension columns computed in report it self

		--2nd GP APU
		SecondGPAPUFrom_Products				DECIMAL(18,2),
		SecondGPAPUFrom_DIC_OTRCOST_OTRFEES		DECIMAL(18,2),
		TotalSecondGPAPU						DECIMAL(18,2),
		
		--1st GP APU
		FirstGPAPU_Accessories					DECIMAL(18,2),
		FirstGPAPU_Vehicles						DECIMAL(18,2),

		--Final Total
		TotalVehicle_Product_Profit				DECIMAL(18,2),
		Total_APU								DECIMAL(18,2),

		ProductTypeID							INT,
		ProductSubTypeID						INT,
		ProductTypeName							NVARCHAR(MAX),
		ProductSubTypeName						NVARCHAR(MAX),
		IsInsuranceType							BIT,
		DivideByProductCount					DECIMAL(18,2)
 ) 


INSERT INTO #TempFinalOutput
exec dbo.spGetFinanceDealsSummary @TransactionId, @CompanyID, @VehicleConditions, @TransactionTypes, @CountryID, @AdministratorId, @ClaimId, @OwnerId, @UnderwriterId


INSERT INTO #TempFinalOutput
exec dbo.spGetCashDealsSummary @TransactionId, @VehicleConditions, @TransactionTypes, @CountryID, @AdministratorId, @ClaimId, @OwnerId, @UnderwriterId


select *,@IsGeneric AS IsGeneric from #TempFinalOutput

END

