CREATE PROCEDURE [dbo].[Import_VehicleUAE]

@tblVehicleSchema VehicleUAESchemaV1 READONLY,
@BranchId int null,
@GroupId int null,
@CountryID int null,
@Message nvarchar(max) OUTPUT

AS 

BEGIN

SET NOCOUNT ON;

BEGIN TRAN

Declare @BeforeInsertionCount int
Declare @AfterInsertionCount int
Declare @AlreadyExistingCount int
Declare @ErrorCount int
Declare @UserId int
Declare @BlankVehicleTypeID bigint=0
Declare @BlankBodyTypeID bigint=0

set @BeforeInsertionCount = 0
set @AfterInsertionCount = 0
set @AlreadyExistingCount = 0
set @ErrorCount = 0
set @UserId = 0

-- GET Count of Rows before insertion
set @BeforeInsertionCount = (Select count(1) FROM Vehicle)

print('test point 1')

IF OBJECT_ID('tempdb..#temp_table_Manufactorer') IS NOT NULL
    DROP TABLE #temp_table_Manufactorer

IF OBJECT_ID('tempdb..#temp_table_BodyTypes') IS NOT NULL
    DROP TABLE #temp_table_BodyTypes

IF OBJECT_ID('tempdb..#temp_table_VehicleTypes') IS NOT NULL
    DROP TABLE #temp_table_VehicleTypes

IF OBJECT_ID('tempdb..#temp_table_name') IS NOT NULL
    DROP TABLE #temp_table_name

print('test point 2')

CREATE TABLE #temp_table_name
(
  ID					INT IDENTITY(1,1),
  Manufacturer			NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  ManufacturerID		BIGINT,
  Variant				NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  [Trim]				NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  Model					NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  ModelYear				INT,
  Transmission			NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  TransmissionTypeID	BIGINT,
  BodyStyle				NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  BodyTypeID			BIGINT,
  FuelType				NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  EngineCapacityLtrs	INT,
  Doors					NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  Cylinders				INT,
  [Weight]				DECIMAL(18,2),
  EnginePowerHP			NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  VehicleType			NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  VehicleTypeID			BIGINT,
  CountryId				BIGINT ,
  IsActive				BIT,
  CreatedDate			DateTime,
  ModifiedDate			DateTime ,
  CreatedBy             int,
  ModifiedBy            int ,
  SequenceNumber        BIGINT,
  IsRecordExist			BIT,
  IsMaxRecordID			BIT,
  VehicleTableID		BIGINT
)

print('test point 3')

Insert Into #temp_table_name (Manufacturer,Model,Variant,[trim],ModelYear,Transmission,BodyStyle,FuelType,EngineCapacityLtrs,Doors,Cylinders,[Weight],EnginePowerHP,VehicleType,CountryId,
  IsActive,CreatedDate,ModifiedDate,CreatedBy,ModifiedBy,SequenceNumber)
select distinct Manufacturer,Model,Variant,[trim],ModelYear,Transmission,BodyType,FuelType,EngineCapacity,Doors,Cylinders,[Weight],EnginePower,VehicleType,CountryId,
  IsActive,CreatedDate,ModifiedDate,CreatedBy,ModifiedBy,SequenceNumber from @tblVehicleSchema

 UPDATE #temp_table_name 
 SET IsRecordExist = 0,IsMaxRecordID=0,vehicleTableid=0

;WITH TopRecord_CTE(ID,Manufacturer,Model,[trim],ModelYear)
as
(
 Select max(ID), Manufacturer,Model,[trim],ModelYear from #temp_table_name
 group by Manufacturer,Model,[trim],ModelYear
)

--select * from TopRecord_CTE
UPDATE A    
  SET IsMaxRecordID = 1
from #temp_table_name A
  INNER JOIN TopRecord_CTE B
    ON A.ID = B.ID 
	
print('test point 4')

	
print('Count1')
select count(*) from #temp_table_name where IsMaxRecordID=1


   print('test point 5')
set @UserId = (Select top 1 CreatedBy from #temp_table_name)

 -- --GET Blank VehicleType ID
 set @BlankVehicleTypeID = (Select Id from VehicleType where [VehicleTypeName]='BLANK' and ([VehicleAbbreviation] IS NULL OR [VehicleAbbreviation]='') and [IsActive]=1 and [CountryId]=@CountryID)

 ----GET Blank VehicleBodyType ID
 set @BlankBodyTypeID = (Select Id from [VehicleBodyType] where [BodyStyle]='BLANK' and ([BodyTypeAbbreviation] IS NULL OR [BodyTypeAbbreviation]='')  and [IsActive]=1 and [CountryId]=@CountryID)


 ---- SET Blank VehicleType ID
 UPDATE #temp_table_name 
 SET VehicleTypeID = @BlankVehicleTypeID 
 WHERE #temp_table_name.VehicleType = NULL or #temp_table_name.VehicleType is null  AND #temp_table_name.IsMaxRecordID=1
 
 print('test point 6')

 -- -- SET Blank BodyType ID
 UPDATE #temp_table_name 
 SET BodyTypeID = @BlankBodyTypeID 
 WHERE #temp_table_name.BodyStyle = NULL or #temp_table_name.BodyStyle is null  AND #temp_table_name.IsMaxRecordID=1
 
 print('test point 7')

  -- GET List of New body types to insert
Select T1.BodyStyle into #temp_table_BodyTypes from #temp_table_name T1 where
not exists
(
  Select 1 from VehicleBodyType WITH (NOLOCK)
  where VehicleBodyType.BodyTypeAbbreviation = T1.BodyStyle 
  AND VehicleBodyType.CountryId = @CountryID
)  AND T1.IsMaxRecordID=1 GROUP BY T1.BodyStyle

INSERT INTO [dbo].[VehicleBodyType](
			BodyStyle
			,BodyTypeAbbreviation
		   ,[CountryId]
           ,[IsActive]
           ,[CreatedDate]
           ,[ModifiedDate]
           ,[CreatedBy]
           ,[ModifiedBy])
Select BodyStyle,BodyStyle,@CountryID,1,GETDATE(),GETDATE(),@UserId,@UserId from #temp_table_BodyTypes  where BodyStyle is not null

 print('test point 8')
-- GET List of New Vehicle types to insert
Select T1.VehicleType into #temp_table_VehicleTypes from #temp_table_name T1 where
not exists
(
  Select 1 from VehicleType WITH (NOLOCK)
  where VehicleType.VehicleAbbreviation = T1.VehicleType 
  AND VehicleType.CountryId = @CountryID
) AND T1.IsMaxRecordID=1 GROUP BY T1.VehicleType


-- Insert New Vehicle Type
INSERT INTO [dbo].[VehicleType](
			VehicleTypeName
			,VehicleAbbreviation
		   ,[CountryId]
           ,[IsActive]
           ,[CreatedDate]
           ,[ModifiedDate]
           ,[CreatedBy]
           ,[ModifiedBy])
Select VehicleType,VehicleType,@CountryID,1,GETDATE(),GETDATE(),@UserId,@UserId from #temp_table_VehicleTypes where VehicleType is not null


 print('test point 9')

-- set valid Vehicle Types ID
 UPDATE #temp_table_name 
 SET VehicleTypeID = VehicleType.Id
 FROM VehicleType  WITH (NOLOCK)
 WHERE VehicleType.VehicleAbbreviation = #temp_table_name.VehicleType   AND #temp_table_name.IsMaxRecordID=1
 AND VehicleType.CountryId = @CountryID
 AND (#temp_table_name.VehicleType <> NULL or #temp_table_name.VehicleType is not null)

  print('test point 10')
  -- set valid Body Types ID
 UPDATE #temp_table_name 
 SET BodyTypeID = VehicleBodyType.Id
 FROM VehicleBodyType  WITH (NOLOCK)
 WHERE VehicleBodyType.BodyTypeAbbreviation = #temp_table_name.BodyStyle  AND #temp_table_name.IsMaxRecordID=1
 AND VehicleBodyType.CountryId = @CountryID
 AND (#temp_table_name.BodyStyle <> NULL or #temp_table_name.BodyStyle is not null)


  print('test point 11')
-- GET List of New makes to insert
Select T1.Manufacturer into #temp_table_Manufactorer from #temp_table_name T1 where
not exists
(
  Select 1 from VehicleManufacturer WITH (NOLOCK)
  where VehicleManufacturer.Manufacturer = T1.Manufacturer 
  AND VehicleManufacturer.CountryId = @CountryID
) AND T1.IsMaxRecordID=1 GROUP BY T1.Manufacturer 

INSERT INTO [dbo].[VehicleManufacturer](
			[Manufacturer]
		   ,[CountryId]
           ,[ManufacturerDate]
           ,[IsActive]
           ,[CreatedDate]
           ,[ModifiedDate]
           ,[CreatedBy]
           ,[ModifiedBy])
Select Manufacturer,@CountryID,GETDATE(),1,GETDATE(),GETDATE(),@UserId,@UserId from #temp_table_Manufactorer

  print('test point 12')
 -- set valid Manufactorer ID
 UPDATE #temp_table_name 
 SET ManufacturerID = VehicleManufacturer.Id
 FROM VehicleManufacturer  WITH (NOLOCK)
 WHERE VehicleManufacturer.Manufacturer = #temp_table_name.Manufacturer AND VehicleManufacturer.IsActive=1  AND #temp_table_name.IsMaxRecordID=1
 AND VehicleManufacturer.CountryId = @CountryID
 AND (#temp_table_name.Manufacturer  <> NULL or #temp_table_name.Manufacturer  is not null)

   print('test point 13')
  -- Set Transmission Type
 UPDATE #temp_table_name
 SET TransmissionTypeId = StaticValue.Id
 FROM StaticValue WITH (NOLOCK)
 Where StaticValue.Code = #temp_table_name.Transmission AND #temp_table_name.IsMaxRecordID=1
 AND StaticCategoryId = (SELECT Id from StaticCategory Where Name='TransmissionType')

   print('test point 14')
--- Update IsRecordExist and VehicleTableID
 UPDATE #temp_table_name 
 SET IsRecordExist = 1,
 VehicleTableID= Vehicle.ID
 FROM Vehicle WITH (NOLOCK)
 WHERE Vehicle.ManufacturerId= #temp_table_name.ManufacturerID and Vehicle.Model= #temp_table_name.Model and Vehicle.ModelYear= #temp_table_name.ModelYear and (ISNULL(Vehicle.[Trim],'')= ISNULL(#temp_table_name.[Trim],'') OR (Vehicle.[Trim] is NULL AND 
 #temp_table_name.[Trim] IS NULL)) and Vehicle.CountryId = @CountryID

 print('Count2')
 SELECT  count(*) from #temp_table_name where #temp_table_name.IsMaxRecordID=1 and isrecordexist=1
  --AND #temp_table_name.IsMaxRecordID=1 and Vehicle.isactive=1

DECLARE @tempTable TABLE (Id INT,ManufacturerId INT, Model Nvarchar(100),[Trim] nvarchar(100),ModelYear nvarchar(100));


--Bulk insert of New Records
INSERT INTO [dbo].[Vehicle]
           ([VehicleTypeId],
		   [ManufacturerId],
		   [Model],
		   [Variant],
		   [Trim],
		   ModelYear,
		   [BodyTypeId],
		   [Doors],
		   [TransmissionTypeId],
		   [EngineCapacity],
		   [FuelType],
		   [EnginePower],
		   [Cylinders],
		   [Weight],
		   [CountryId],
		   [IsActive],
		   [CreatedDate],
		   [ModifiedDate],
		   [CreatedBy],
		   [ModifiedBy],
		   GroupId,
		   BranchId
)
OUTPUT INSERTED.[Id],INSERTED.[ManufacturerId],INSERTED.[Model],INSERTED.[trim],INSERTED.ModelYear
INTO @tempTable (Id,ManufacturerID,Model,[trim],ModelYear)
 SELECT distinct VehicleTypeID,
					ManufacturerID,
					Model,
					Variant,
					[trim],
					ModelYear,
					BodyTypeID,
					Doors,
					TransmissionTypeId,
					EngineCapacityLtrs,
					FuelType,
					EnginePowerHP,
					Cylinders,
					[Weight],
					@CountryID,
					1,
					GETUTCDATE(),
					GETUTCDATE(),
					@UserId,
					@UserId,
					@GroupID,
					@BranchID
FROM #temp_table_name WHERE IsRecordExist=0 and VehicleTypeID<>0 and BodyTypeID<>0 and ManufacturerID<>0 and VehicleTableID=0
AND IsMaxRecordID=1

  print('test point 15')
 print('Count3')
 select Count(*) from @temptable


 print('Count4')
 select count (*) from (
 SELECT distinct * from #temp_table_name where #temp_table_name.IsMaxRecordID=1 and isrecordexist=0) as T


--UPDATE VehicleTableID
 UPDATE #temp_table_name 
 SET IsRecordExist = 1,
 VehicleTableID= T.ID
 FROM @tempTable T
 WHERE T.ManufacturerId= #temp_table_name.ManufacturerID and T.Model=#temp_table_name.Model and T.ModelYear= #temp_table_name.ModelYear and (ISNULL(T.[Trim],'')= ISNULL(#temp_table_name.[Trim],'') OR (T.[Trim] is NULL AND #temp_table_name.[Trim] IS NULL))

 AND #temp_table_name.IsMaxRecordID=1 and #temp_table_name.IsRecordExist=0

  print('test point 16')

 print('Count5')
 select count (*) from (
 SELECT distinct * from #temp_table_name where #temp_table_name.IsMaxRecordID=1 and isrecordexist=1
 ) As M

  select count (*) from (
 SELECT distinct * from #temp_table_name where #temp_table_name.IsMaxRecordID=1 and isrecordexist=0
 ) As N


Update Vehicle 
SET VehicleTypeID=#temp_table_name.VehicleTypeID,
	ManufacturerID=#temp_table_name.ManufacturerID,
	Model=#temp_table_name.Model,		
	Variant=#temp_table_name.Variant,		
	[trim]=#temp_table_name.[trim],		
	BodyTypeID=#temp_table_name.BodyTypeID,		
	Doors=#temp_table_name.Doors,		
	TransmissionTypeId=#temp_table_name.TransmissionTypeId,		
	[EngineCapacity]=#temp_table_name.EngineCapacityLtrs,
	FuelType=#temp_table_name.FuelType,
	[EnginePower]=#temp_table_name.EnginePowerHP,		
	Cylinders=#temp_table_name.Cylinders,
	[Weight]=#temp_table_name.[Weight],
	 [ModifiedDate]=getutcdate(),
	[ModifiedBy]=@UserId
FROM #temp_table_name where #temp_table_name.VehicleTableID=Vehicle.ID 

 print('test point 17')

---set IsActive 0 for Previously Present Same Branch Id and Group Id
IF @BranchId is NULL 
BEGIN
UPDATE VehicleGroupBranchMapping SET IsActive=0 where VehicleId IN (Select distinct VehicleTableID 
from #temp_table_name WHERE IsMaxRecordID=1 AND VehicleTableID<>0) AND GroupId=@GroupId AND BranchId IS NOT NULL
END
ELSE
BEGIN
UPDATE VehicleGroupBranchMapping SET IsActive=0 where VehicleId IN (Select distinct VehicleTableID 
from #temp_table_name WHERE IsMaxRecordID=1 AND VehicleTableID<>0) AND GroupId=@GroupId AND BranchId IS NULL
END

print('test point 18')

IF @BranchID IS NULL
BEGIN
----- Insert into VehicleGroupBranchMapping-------
INSERT VehicleGroupBranchMapping(VehicleId, GroupId, BranchId, CountryId, IsActive, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy)  
Select distinct VehicleTableID As VehicleTableID, @GroupId, @BranchId,@CountryId,1,getutcdate(),getutcdate(),@UserId,@UserId
from #temp_table_name WHERE IsMaxRecordID=1 and VehicleTableID<>0
AND VehicleTableID NOT IN 
(Select v.Id from VehicleGroupBranchMapping VG INNER JOIN 
Vehicle v on V.Id= Vg.VehicleId 
WHere VG.GroupId=@GroupId AND VG.BranchID IS NULL AND V.CountryId=@CountryId AND VG.IsActive=1)
END
ELSE
BEGIN
INSERT VehicleGroupBranchMapping(VehicleId, GroupId, BranchId, CountryId, IsActive, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy)  
Select distinct VehicleTableID As VehicleTableID, @GroupId, @BranchId,@CountryId,1,getutcdate(),getutcdate(),@UserId,@UserId
from #temp_table_name WHERE IsMaxRecordID=1 and VehicleTableID<>0
AND VehicleTableID NOT IN 
(Select v.Id from VehicleGroupBranchMapping VG INNER JOIN 
Vehicle v on V.Id= Vg.VehicleId 
WHere VG.GroupId=@GroupId AND VG.BranchID =@BranchID AND V.CountryId=@CountryId AND VG.IsActive=1)
END

 print('test point 19')

-- GET Count of Rows after insertion
 set @AfterInsertionCount = (Select count(1) FROM Vehicle)

 IF @Message IS NULL BEGIN
    set @Message ='File Import Successful.'
	SELECT @Message
 END
 


COMMIT TRAN

END