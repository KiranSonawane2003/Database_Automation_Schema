
CREATE PROCEDURE [dbo].[Import_VehicleAccessory_Mapping]

@tblVehicleAccessoryCodeSchema VehicleAccessoryCodeSchemaV1 READONLY,
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

CREATE TABLE #temp_table_name(
  ID INT,
  MMCode NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  OptionName_Code NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  VehicleID bigint,
  AccessoryID bigint,
  IsRecordExist BIT
)


 INSERT INTO #temp_table_name(ID,MMCode,OptionName_Code,VehicleID,AccessoryID,IsRecordExist)
 SELECT distinct ID,MMCode,OptionName_Code,0,0,0 FROM @tblVehicleAccessoryCodeSchema
 
 
 UPDATE #temp_table_name 
 SET VehicleID = Vehicle.Id
 FROM Vehicle  WITH (NOLOCK)
 WHERE Vehicle.VehicleCode  = #temp_table_name.MMCode 
 AND Vehicle.CountryId = @CountryID

 UPDATE #temp_table_name 
 SET AccessoryID = Accessories.Id
 FROM Accessories  WITH (NOLOCK)
 WHERE Accessories.Code = #temp_table_name.OptionName_Code AND Accessories.IsNewVehicleAccessory =0
 AND Accessories.CountryId = @CountryID

  

 UPDATE #temp_table_name 
 SET IsRecordExist = 1
 FROM VehicleAccessoriesMapping  WITH (NOLOCK)
 WHERE VehicleAccessoriesMapping.VehicleId= #temp_table_name.VehicleId 
 and VehicleAccessoriesMapping.AccessoryID = #temp_table_name.AccessoryID 



 -- GET Count of  Invalid Vehicle Count
 set @InvalidVehicleCount = (Select count(1) FROM #temp_table_name WHERE VehicleId=0 )
 -- GET Count of  Invalid Accessory Count
 set @InvalidAccessoryCount = (Select count(1) FROM #temp_table_name WHERE AccessoryId=0 )
 
 -- GET Count of  Already Existing Count
 set @AlreadyExistingCount = (Select count(1) FROM #temp_table_name WHERE IsRecordExist=1 )

 
 --select * from #temp_table_name
 INSERT INTO VehicleAccessoriesMapping (VehicleId,AccessoryId,IsActive)
 SELECT VehicleId,AccessoryId,1 FROM #temp_table_name WHERE IsRecordExist=0 and VehicleId<>0 and AccessoryId<>0

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
   set @Message ='File imported successfully.'
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
    
   IF @AlreadyExistingCount = (Select count(1) FROM #temp_table_name) 
   BEGIN
    set @Message ='File Import Successful.'
   END
   ELSE
   BEGIN
    set @Message ='Import unsuccessful please contact the Seriti Administrator.'
   END
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

