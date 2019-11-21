
CREATE PROCEDURE [dbo].[Import_NewVehicleAccessory]

@tblAccessoriesSchema NewVehicleAccessoriesSchema READONLY,
@CountryID bigint null=0,
@Message nvarchar(max) OUTPUT

AS 

BEGIN

SET NOCOUNT ON;

BEGIN TRAN

Declare @BeforeInsertionCount int
Declare @AfterInsertionCount int
Declare @InvalidVehicleCount int
Declare @InvalidAccessoryCount int
Declare @AlreadyExistingCount int
Declare @ErrorCount int

set @BeforeInsertionCount = 0
set @AfterInsertionCount = 0
set @InvalidVehicleCount = 0
set @InvalidAccessoryCount = 0
set @AlreadyExistingCount = 0
set @ErrorCount = 0

-- GET Count of Rows before insertion
set @BeforeInsertionCount = (Select count(1) FROM VehicleAccessoriesMapping)


IF OBJECT_ID('tempdb..#temp_table_name') IS NOT NULL
    DROP TABLE #temp_table_name

IF OBJECT_ID('tempdb..#temp_table_mapping') IS NOT NULL
    DROP TABLE #temp_table_mapping


CREATE TABLE #temp_table_name
(
	ID INT,
	AccessoryCode  NVARCHAR(100) COLLATE DATABASE_DEFAULT,
	AccessoryName  NVARCHAR(200) COLLATE DATABASE_DEFAULT,	
	SellingPrice decimal(18, 2) NULL,
	IsEditable bit NULL,
	IsGeneric bit NOT NULL,	
	IsNewVehicleAccessory bit NULL,
	CountryId bigint NULL,
	IsActive bit NOT NULL,	
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NULL,
	CreatedBy int NOT NULL,
	ModifiedBy int NULL,	
    IsRecordExist BIT
)

;WITH DistinctRecords(MaxSeqNumber)
	 AS
	 (
	   SELECT MAX([SequenceNumber])
	   FROM @tblAccessoriesSchema
	   GROUP BY [AccessoryCode]
	 )
	 INSERT INTO #temp_table_name(ID,AccessoryCode,AccessoryName,SellingPrice,IsEditable,IsGeneric,IsNewVehicleAccessory,CountryId, IsActive,CreatedDate,ModifiedDate,CreatedBy,ModifiedBy,IsRecordExist)
	 SELECT [ID],[AccessoryCode],[AccessoryName],[SellingPrice],[IsEditable],[IsGeneric],[IsNewVehicleAccessory],CountryId, IsActive,CreatedDate,ModifiedDate,CreatedBy,ModifiedBy,0 FROM @tblAccessoriesSchema T
	 INNER JOIN DistinctRecords ON DistinctRecords.MaxSeqNumber = T.[SequenceNumber]

 
 UPDATE #temp_table_name 
	SET IsRecordExist = 1
	FROM Accessories  WITH (NOLOCK)
	WHERE Accessories.Code =#temp_table_name.AccessoryCode 
	AND Accessories.CountryId = #temp_table_name.CountryId AND Accessories.IsNewVehicleAccessory=1


-- GET Count of  Already Existing Count
	set @AlreadyExistingCount = (Select count(1) FROM #temp_table_name WHERE IsRecordExist=1 )

	-- Bulk update
		 UPDATE V SET
		  V.AccessoryName = VS.AccessoryName,
		  V.SellingPrice = VS.SellingPrice,
		  V.IsEditable = VS.IsEditable,
		  V.IsGeneric = VS.IsGeneric,
		  V.ModifiedDate = VS.ModifiedDate,
		  V.ModifiedBy = VS.ModifiedBy
		 FROM #temp_table_name AS  VS
		 INNER JOIN Accessories V WITH (NOLOCK) 
		 ON V.Code = VS.AccessoryCode AND V.CountryId = VS.CountryId AND V.IsNewVehicleAccessory=1
		 WHERE IsRecordExist=1

--select * from #temp_table_name
	INSERT INTO Accessories (AccessoryName,Code,SellingPrice,IsEditable,IsGeneric,IsNewVehicleAccessory,CountryId, IsActive,CreatedDate,ModifiedDate,CreatedBy,ModifiedBy)
	SELECT AccessoryName,AccessoryCode,SellingPrice,IsEditable,IsGeneric,IsNewVehicleAccessory,CountryId, IsActive,CreatedDate,ModifiedDate,CreatedBy,ModifiedBy FROM #temp_table_name WHERE IsRecordExist=0 

	--Select * from Accessories order by 1 desc


CREATE TABLE #temp_table_mapping(
  ID INT,
  MMCode  NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  AccessoryCode  NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  VehicleID bigint,
  AccessoryID bigint,
  IsRecordExist BIT
)

INSERT INTO #temp_table_mapping(ID,MMCode,AccessoryCode,VehicleID,AccessoryID,IsRecordExist)
 SELECT distinct ID,MMCode,AccessoryCode,0,0,0 FROM @tblAccessoriesSchema

 UPDATE #temp_table_mapping 
 SET VehicleID = Vehicle.Id
 FROM Vehicle  WITH (NOLOCK)
 WHERE Vehicle.VehicleCode  = #temp_table_mapping.MMCode 
 AND Vehicle.CountryId = @CountryID

 UPDATE #temp_table_mapping 
 SET AccessoryID = Accessories.Id
 FROM Accessories  WITH (NOLOCK)
 WHERE Accessories.Code = #temp_table_mapping.AccessoryCode 
 AND Accessories.CountryId = @CountryID AND Accessories.IsNewVehicleAccessory = 1

 UPDATE #temp_table_mapping
 SET IsRecordExist = 1
 FROM VehicleAccessoriesMapping  WITH (NOLOCK)
 INNER JOIN #temp_table_mapping ON #temp_table_mapping.VehicleID = VehicleAccessoriesMapping.VehicleId
 AND #temp_table_mapping.AccessoryID = VehicleAccessoriesMapping.AccessoryID
 

 -- GET Count of  Invalid Vehicle Count
 set @InvalidVehicleCount = (Select count(1) FROM #temp_table_mapping WHERE VehicleId=0 )
 -- GET Count of  Invalid Accessory Count
 set @InvalidAccessoryCount = (Select count(1) FROM #temp_table_mapping WHERE AccessoryId=0 )
 
 -- GET Count of  Already Existing Count
 set @AlreadyExistingCount = (Select count(1) FROM #temp_table_mapping WHERE IsRecordExist=1 )

 --select * from #temp_table_name
 INSERT INTO VehicleAccessoriesMapping (VehicleId,AccessoryId,IsActive)
 SELECT VehicleId,AccessoryId,1 FROM #temp_table_mapping WHERE IsRecordExist=0 and VehicleId<>0 and AccessoryId<>0

  -- GET Count of Rows after insertion
 set @AfterInsertionCount = (Select count(1) FROM VehicleAccessoriesMapping)

 set @ErrorCount = @ErrorCount+1 
   set @Message = CONCAT( @Message, CAST( @ErrorCount as nvarchar)+'. File imported successfully.<br/>')

 IF @AfterInsertionCount  > @BeforeInsertionCount 
 BEGIN
  
  IF @InvalidVehicleCount > 0 BEGIN 
   set @ErrorCount = @ErrorCount+1 
   set @Message = CONCAT( @Message, CAST( @ErrorCount as nvarchar)+'. Some records could not be imported due to invalid MMCode, please contact the Seriti Administrator.<br/>')
  END
  IF @InvalidAccessoryCount > 0 BEGIN 
   set @ErrorCount = @ErrorCount+1 
   set @Message = CONCAT( @Message, CAST( @ErrorCount as nvarchar) +'. Some records could not be imported due to invalid OptionName_Code, please contact the Seriti Administrator.<br/>')   
  END
  IF @Message IS NULL BEGIN  
   set @Message ='File Import Successful.'
  END

  SELECT @Message

 END 
 ELSE IF @AfterInsertionCount  <= @BeforeInsertionCount 
 BEGIN
 
  IF( @InvalidVehicleCount > 0 or @InvalidAccessoryCount > 0 )
  BEGIN  
   IF @InvalidVehicleCount > 0 BEGIN 
    set @ErrorCount = @ErrorCount+1 
    set @Message = CONCAT( @Message, CAST( @ErrorCount as nvarchar)+'. Some records could not be imported due to invalid MMCode, please contact the Seriti Administrator.<br/>')   
   END
   IF @InvalidAccessoryCount > 0 BEGIN 
    set @ErrorCount = @ErrorCount+1 
    set @Message = CONCAT( @Message, CAST( @ErrorCount as nvarchar) +'. Some records could not be imported due to invalid OptionName_Code, please contact the Seriti Administrator.<br/>')   
   END
  END
  ELSE
  BEGIN 
    set @Message ='File Import Successful.'  
  END

  IF @Message IS NULL BEGIN
   
   set @Message ='File Import Successful.'
  END
  
  SELECT @Message

 END 
  
  --IF @Message IS NULL BEGIN
   
  -- set @Message ='File Import Successful.'
  --END
  
  --SELECT @Message

 IF (@@ERROR <> 0) BEGIN
        SELECT @Message='Import unsuccessful please contact the Seriti Administrator.'
        ROLLBACK TRAN
        RETURN 1
 END


COMMIT TRAN

END

