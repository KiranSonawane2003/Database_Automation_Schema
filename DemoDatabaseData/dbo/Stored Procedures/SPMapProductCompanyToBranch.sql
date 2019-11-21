
-- =============================================
-- Author:		<Raja>
-- Create date: <20-05-2019>
-- Description:	<To Map the Product company with Branch of transaction, if its not having mapping.>
-- =============================================
--Exec SPMapProductCompanyToBranch '21423','339,158,349,422,390,391,36,389'
CREATE PROCEDURE [dbo].[SPMapProductCompanyToBranch]
@TransactionId bigint =null,
@ProductLineIds nvarchar(max) 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @TransactionBranchId BIGINT,
		    @CompanyId BIGINT,
			@TransactionGroupId BIGINT,
			@CountryId BIGINT,
			@UTCDateTime DATETIME

IF(@TransactionId IS NOT NULL)
BEGIN

	SELECT @TransactionBranchId = BranchId,
	 	   @TransactionGroupId = GroupId,
		   @CountryId = CountryId,
		   @UTCDateTime= GETUTCDATE()
	FROM [Transaction]
	WHERE Id =@TransactionId;


	SELECT TOP 1 * INTO #TEMPGROUP FROM [Group] WHERE Id = @TransactionGroupId;
	SELECT TOP 1 * INTO #TEMPBRANCH FROM [Branch] WHERE Id = @TransactionBranchId;
	
	SELECT DISTINCT C.CompanyId 
	INTO #TempCompany 
	FROM
	(	
		SELECT DISTINCT CompanyId
		FROM [dbo].[Product] 
		UNPIVOT(
			CompanyId
			FOR field IN(AdministratorId, ClaimsId, OwnerId, UnderwriterId)
		) CA
		WHERE Id IN( SELECT * FROM [dbo].[SplitString](@ProductLineIds,',')) 
	) TC inner join CompanyCompanyTypeMapping C ON TC.CompanyId = C.Id
	WHERE C.CompanyId NOT IN( SELECT CompanyId FROM BranchCompanies BC WHERE BC.BranchId = @TransactionBranchId)
	--select * from #TempCompany
	--select * from #TEMPGROUP
	--select * from #TEMPBRANCH


	--begin tran
	
	DECLARE cursor_companyMapping 
	CURSOR FOR 
	SELECT CompanyId FROM #TempCompany TC 
	OPEN cursor_companyMapping  
	FETCH NEXT FROM cursor_companyMapping INTO @CompanyId  

	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		  
		IF(NOT EXISTS (SELECT * FROM [GroupCompanies] WHERE CompanyId = @CompanyId AND GroupId = @TransactionGroupId)) 
		BEGIN
			INSERT INTO GroupCompanies([GroupId], [CompanyId], [SortKey], [StartDate], [EndDate], [CountryId], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy])
			SELECT top 1 @TransactionGroupId, @CompanyId, 1, StartDate, EndDate, @CountryId, 1,@UTCDateTime,@UTCDateTime, CreatedBy,CreatedBy  
		    FROM #TEMPGROUP;
		END

		IF(NOT EXISTS (SELECT * FROM [BranchCompanies] WHERE CompanyId = @CompanyId AND BranchId = @TransactionBranchId)) 
		BEGIN
			INSERT INTO BranchCompanies([BranchId], [GroupId], [CompanyId], [SortKey], [StartDate], [EndDate], [CountryId], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy])
			SELECT @TransactionBranchId, @TransactionGroupId, @CompanyId, 1, StartDate, EndDate, @CountryId, 1,@UTCDateTime,@UTCDateTime ,CreatedBy,CreatedBy 
			FROM #TEMPBRANCH;
		END
		
		FETCH NEXT FROM cursor_companyMapping INTO @CompanyId 
	END 

	CLOSE cursor_companyMapping  
	DEALLOCATE cursor_companyMapping 

--rollback tran
		--Select * from BranchCompanies BC where BC.BranchId = @TransactionBranchId and CompanyId in ( 50,54,10221,10245,10350)
		--Select * from GroupCompanies  where Groupid = @TransactionGroupId and CompanyId in ( 50,54,10221,10245,10350)
	SELECT 'SUCCESS' AS Result;
END
ELSE
BEGIN
	SELECT 'TRANSACTION ID CANNOT BE NULL' AS Result;
END
END
