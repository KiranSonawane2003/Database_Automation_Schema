
CREATE PROCEDURE [dbo].[Import_Accessory]

@tblAccessoriesSchemaV1 AccessoriesSchemaV1 READONLY,
@Message nvarchar(max) OUTPUT

AS 

BEGIN

SET NOCOUNT ON;

BEGIN TRAN

Declare @BeforeInsertionCount int
Declare @AfterInsertionCount int
Declare @AlreadyExistingCount int
Declare @ErrorCount int

set @BeforeInsertionCount = 0
set @AfterInsertionCount = 0
set @AlreadyExistingCount = 0
set @ErrorCount = 0

-- GET Count of Rows before insertion
set @BeforeInsertionCount = (Select count(1) FROM Accessories)


IF OBJECT_ID('tempdb..#temp_table_name') IS NOT NULL
    DROP TABLE #temp_table_name

CREATE TABLE #temp_table_name
(
	ID INT,
	AccessoryName NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	Code NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	IsGeneric bit NOT NULL,
	GroupId bigint NULL,
	BranchId bigint NULL,
	CostPrice decimal(18, 2) NULL,
	SellingPrice decimal(18, 2) NULL,
	[Description] nvarchar(200) NULL,
	TemplateId bigint NULL,
	CountryId bigint NULL,
	IsActive bit NOT NULL,
	IsEditable bit NULL,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NULL,
	CreatedBy int NOT NULL,
	ModifiedBy int NULL,
	IsNewVehicleAccessory bit NULL,
    IsRecordExist BIT
)

	 ;WITH DistinctRecords(MaxSeqNumber)
	 AS
	 (
	   SELECT MAX([SequenceNumber])
	   FROM @tblAccessoriesSchemaV1
	   GROUP BY [Code]
	 )
	 INSERT INTO #temp_table_name(ID,AccessoryName,Code,IsGeneric,GroupId,BranchId,CostPrice,SellingPrice,[Description],TemplateId,CountryId, IsActive,IsEditable,CreatedDate,ModifiedDate,CreatedBy,ModifiedBy, IsNewVehicleAccessory, IsRecordExist)
	 SELECT ID,[AccessoryName],[Code],IsGeneric,GroupId,BranchId,CostPrice,SellingPrice,[Description],TemplateId,CountryId, IsActive,IsEditable,CreatedDate,ModifiedDate,CreatedBy,ModifiedBy,IsNewVehicleAccessory,0 FROM @tblAccessoriesSchemaV1 T
	 INNER JOIN DistinctRecords ON DistinctRecords.MaxSeqNumber = T.[SequenceNumber]
	

	UPDATE #temp_table_name 
	SET IsRecordExist = 1
	FROM Accessories WITH (NOLOCK) 
	WHERE Accessories.Code =#temp_table_name.Code 
	AND Accessories.CountryId = #temp_table_name.CountryId AND Accessories.IsNewVehicleAccessory=0
	 
	 	
	-- GET Count of  Already Existing Count
	set @AlreadyExistingCount = (Select count(1) FROM #temp_table_name WHERE IsRecordExist=1 )


		-- Bulk update
		 UPDATE V SET
		  V.Code =  VS.Code ,
		  V.AccessoryName = VS.AccessoryName,
		  --V.IsGeneric = VS.IsGeneric,
		  --V.GroupId = VS.GroupId,
		  --V.BranchId = VS.BranchId,
		  --V.CostPrice = VS.CostPrice, 
		  --V.SellingPrice = VS.SellingPrice,
		  --V.[Description] =  VS.[Description],
		  --V.TemplateId = VS.TemplateId,
		  --V.CountryId = VS.CountryId,
		  --V.IsEditable = VS.IsEditable,		
		  --V.IsActive = VS.IsActive,
		  V.ModifiedDate = VS.ModifiedDate,
		  V.ModifiedBy = VS.ModifiedBy,
		  V.IsNewVehicleAccessory = VS.IsNewVehicleAccessory
		 FROM #temp_table_name AS  VS
		 INNER JOIN Accessories V WITH (NOLOCK) 
		 ON V.Code = VS.Code AND V.CountryId = VS.CountryId 
		 WHERE IsRecordExist=1

	--select * from #temp_table_name
	INSERT INTO Accessories (AccessoryName,Code,IsGeneric,GroupId,BranchId,CostPrice,SellingPrice,[Description],TemplateId,CountryId, IsActive,IsEditable,CreatedDate,ModifiedDate,CreatedBy,ModifiedBy, IsNewVehicleAccessory)
	SELECT AccessoryName,Code,IsGeneric,GroupId,BranchId,CostPrice,SellingPrice,[Description],TemplateId,CountryId, IsActive,IsEditable,CreatedDate,ModifiedDate,CreatedBy,ModifiedBy, IsNewVehicleAccessory FROM #temp_table_name WHERE IsRecordExist=0 

	-- GET Count of Rows after insertion
	set @AfterInsertionCount = (Select count(1) FROM Accessories)


	IF @AfterInsertionCount  > @BeforeInsertionCount 
	BEGIN
			set @Message ='File Import Successful.'
		
			SELECT @Message

	END 
	ELSE IF @AfterInsertionCount  <= @BeforeInsertionCount 
	BEGIN
					
		IF @AlreadyExistingCount = (Select count(1) FROM #temp_table_name) 
		BEGIN
			set @Message ='File Import Successful.'
		END
		ELSE
		BEGIN
			set @Message ='Import unsuccessful please contact the Seriti Administrator.'
		END		

		IF @Message IS NULL BEGIN			
			set @Message ='File Import Successful.'
		END
		
		SELECT @Message

	END 
	IF @Message IS NULL BEGIN			
			set @Message ='File Import Successful.'
			SELECT @Message
	END
	

 IF (@@ERROR <> 0) BEGIN
        SELECT @Message='Import unsuccessful please contact the Seriti Administrator.'
        ROLLBACK TRAN
        RETURN 1
 END


COMMIT TRAN

END

