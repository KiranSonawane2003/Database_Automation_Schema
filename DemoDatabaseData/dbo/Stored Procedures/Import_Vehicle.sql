
CREATE PROCEDURE [dbo].[Import_Vehicle]

@tblVehicleSchema VehicleSchemaV2 READONLY,
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

--CREATE TABLE #temp_table_Manufactorer
--(  
--  ManufactorerName NVARCHAR(MAX) COLLATE DATABASE_DEFAULT
--)

IF OBJECT_ID('tempdb..#temp_table_name') IS NOT NULL
    DROP TABLE #temp_table_name

print('test point 2')

CREATE TABLE #temp_table_name
(
  ID INT,
  VehicleCode NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  Make NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  Model NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  VehicleType NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,  
  BodyType NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,  
  IntroductionDate Datetime,
  ModelYear int,
  TerminationDate Datetime,
  EngineCapacity int, 
  EnginePower NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
  Cylinders int,
  Doors NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,  
  CountryId int,
  IsActive bit,
  CreatedDate Datetime,
  ModifiedDate Datetime,
  CreatedBy int,
  ModifiedBy int,
  SequenceNumber bigint,
  VehicleTypeID bigint,
  BodyTypeID bigint,
  ManufactorerID bigint,

	[RegYear] int,
	[Variant] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[PublicationSection] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[MasterModel] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[MakeCode] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[ModelCode] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[VariantCode] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[AxleConfiguration] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[Drive] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[Seats] int,
	[Use] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[WheelBase] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[TransmissionType] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[TransmissionTypeId] bigint,
	[NoGears] int,
	[Cooling] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[CylConfiguration] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[EngineCycle] int,
	[FuelTankSize] decimal(18, 2),
	[FuelType] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[TurboOrSuperCharged] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[GCM] int,
	[GVM] int,
	[Tare] int,
	[Origin] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[FrontNoTyres] int,
	[FrontTyreSize] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[RearNoTyres] int,
	[RearTyreSize] NVARCHAR(MAX) COLLATE DATABASE_DEFAULT,
	[CO2] int,
	[Length] int,
	[Height] int,
	[Width] int,
	[NewListPrice] decimal(18, 2),
	IsRecordExist BIT
)

print('test point 3')

--Remove duplicates based on Vehicle Code
 ;WITH DistinctRecords(MaxSeqNumber)
 AS
 (
	SELECT MAX([SequenceNumber])
	FROM @tblVehicleSchema
	GROUP BY [VehicleCode]
 )
 INSERT INTO #temp_table_name(ID,VehicleCode,Make,Model,VehicleType,BodyType,IntroductionDate,ModelYear,TerminationDate,EngineCapacity
 ,EnginePower,Cylinders,Doors,RegYear,Variant,PublicationSection, MasterModel,MakeCode,ModelCode,VariantCode,AxleConfiguration,Drive,Seats,
 [Use],WheelBase,TransmissionType, NoGears,Cooling,CylConfiguration,EngineCycle,FuelTankSize,FuelType,TurboOrSuperCharged,
 GCM,GVM,Tare,Origin,FrontNoTyres, FrontTyreSize,RearNoTyres,RearTyreSize,CO2,[Length],Height,Width,NewListPrice,
 CountryId,IsActive,CreatedDate,ModifiedDate,CreatedBy,ModifiedBy,VehicleTypeID,BodyTypeID,ManufactorerID,TransmissionTypeId,IsRecordExist)
 SELECT ID,VehicleCode,Make,Model,VehicleType,BodyType,IntroductionDate,ModelYear,TerminationDate,EngineCapacity,
 EnginePower,Cylinders,Doors,RegYear,Variant,PublicationSection, MasterModel,MakeCode,ModelCode,VariantCode,AxleConfiguration,Drive,Seats,
 [Use],WheelBase,TransmissionType, NoGears,Cooling,CylConfiguration,EngineCycle,FuelTankSize,FuelType,TurboOrSuperCharged,
 GCM,GVM,Tare,Origin,FrontNoTyres, FrontTyreSize,RearNoTyres,RearTyreSize,CO2,[Length],Height,Width,NewListPrice,
 CountryId,IsActive,CreatedDate,ModifiedDate,CreatedBy,ModifiedBy,NULL,NULL,NULL,NULL,0 FROM @tblVehicleSchema T
 INNER JOIN DistinctRecords ON DistinctRecords.MaxSeqNumber = T.[SequenceNumber]
 
 print('test point 4')

 --GET Blank VehicleType ID
 set @BlankVehicleTypeID = (Select Id from VehicleType where [VehicleTypeName]='BLANK' and [VehicleAbbreviation]='' and [IsActive]=1 and [CountryId]=@CountryID)

 --GET Blank VehicleBodyType ID
 set @BlankBodyTypeID = (Select Id from [VehicleBodyType] where [BodyStyle]='BLANK' and [BodyTypeAbbreviation]='' and [IsActive]=1 and [CountryId]=@CountryID)
 
set @UserId = (Select top 1 CreatedBy from #temp_table_name)

 print('test point 5')

-- SET Blank VehicleType ID
 UPDATE #temp_table_name 
 SET VehicleTypeID = @BlankVehicleTypeID 
 WHERE #temp_table_name.VehicleType = '' or #temp_table_name.VehicleType is null
 
  print('test point 6')

  -- SET Blank BodyType ID
 UPDATE #temp_table_name 
 SET BodyTypeID = @BlankBodyTypeID 
 WHERE #temp_table_name.BodyType = '' or #temp_table_name.BodyType is null

 print('test point 7')

 -- GET List of New body types to insert
Select T1.BodyType into #temp_table_BodyTypes from #temp_table_name T1 where
not exists
(
  Select 1 from VehicleBodyType WITH (NOLOCK)
  where VehicleBodyType.BodyTypeAbbreviation = T1.BodyType 
  AND VehicleBodyType.CountryId = @CountryID
)  GROUP BY T1.BodyType

print('test point 8')

-- Insert New Body Type
INSERT INTO [dbo].[VehicleBodyType](
			BodyStyle
			,BodyTypeAbbreviation
		   ,[CountryId]
           ,[IsActive]
           ,[CreatedDate]
           ,[ModifiedDate]
           ,[CreatedBy]
           ,[ModifiedBy])
Select BodyType,BodyType,@CountryID,1,GETDATE(),GETDATE(),@UserId,@UserId from #temp_table_BodyTypes

print('test point 9')

-- GET List of New Vehicle types to insert
Select T1.VehicleType into #temp_table_VehicleTypes from #temp_table_name T1 where
not exists
(
  Select 1 from VehicleType WITH (NOLOCK)
  where VehicleType.VehicleAbbreviation = T1.VehicleType 
  AND VehicleType.CountryId = @CountryID
) GROUP BY T1.VehicleType

print('test point 10')

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
Select VehicleType,VehicleType,@CountryID,1,GETDATE(),GETDATE(),@UserId,@UserId from #temp_table_VehicleTypes

print('test point 11')

-- set valid Vehicle Types ID
 UPDATE #temp_table_name 
 SET VehicleTypeID = VehicleType.Id
 FROM VehicleType  WITH (NOLOCK)
 WHERE VehicleType.VehicleAbbreviation = #temp_table_name.VehicleType 
 AND VehicleType.CountryId = @CountryID
 AND (#temp_table_name.VehicleType <> '' or #temp_table_name.VehicleType is not null)

print('test point 12')

  -- set valid Body Types ID
 UPDATE #temp_table_name 
 SET BodyTypeID = VehicleBodyType.Id
 FROM VehicleBodyType  WITH (NOLOCK)
 WHERE VehicleBodyType.BodyTypeAbbreviation = #temp_table_name.BodyType 
 AND VehicleBodyType.CountryId = @CountryID
 AND (#temp_table_name.BodyType <> '' or #temp_table_name.BodyType is not null)
   
print('test point 13')

 

--Select * from #temp_table_name
--Select T1.Make from #temp_table_name T1 where 
--not exists
--(
--  Select 1 from VehicleManufacturer 
--  where VehicleManufacturer.Manufacturer = T1.Make 
--  AND VehicleManufacturer.CountryId = @CountryID
--)

-- GET List of New makes to insert
Select T1.Make into #temp_table_Manufactorer from #temp_table_name T1 where
not exists
(
  Select 1 from VehicleManufacturer WITH (NOLOCK)
  where VehicleManufacturer.Manufacturer = T1.Make 
  AND VehicleManufacturer.CountryId = @CountryID
) GROUP BY T1.Make 

print('test point 14')

-- Insert New Make
INSERT INTO [dbo].[VehicleManufacturer](
			[Manufacturer]
		   ,[CountryId]
           ,[ManufacturerDate]
           ,[IsActive]
           ,[CreatedDate]
           ,[ModifiedDate]
           ,[CreatedBy]
           ,[ModifiedBy])
Select Make,@CountryID,GETDATE(),1,GETDATE(),GETDATE(),@UserId,@UserId from #temp_table_Manufactorer
 
print('test point 15')
         
 -- set valid Manufactorer ID
 UPDATE #temp_table_name 
 SET ManufactorerID = VehicleManufacturer.Id
 FROM VehicleManufacturer  WITH (NOLOCK)
 WHERE VehicleManufacturer.Manufacturer = #temp_table_name.Make 
 AND VehicleManufacturer.CountryId = @CountryID
 AND (#temp_table_name.Make <> '' or #temp_table_name.Make is not null)

 print('test point 16')

 -- Set Transmission Type
 UPDATE #temp_table_name
 SET TransmissionTypeId = StaticValue.Id
 FROM StaticValue WITH (NOLOCK)
 Where StaticValue.Code = #temp_table_name.TransmissionType
 AND StaticCategoryId = (SELECT Id from StaticCategory Where Name='TransmissionType')

  print('test point 17')

 -- GET Exisiting Records
 UPDATE #temp_table_name 
 SET IsRecordExist = 1
 FROM Vehicle WITH (NOLOCK)
 WHERE Vehicle.VehicleCode= #temp_table_name.VehicleCode 
 and Vehicle.CountryId = @CountryID
 
  print('test point 18')

   -- GET Count of  Already Existing Count
 set @AlreadyExistingCount = (Select count(1) FROM #temp_table_name WHERE IsRecordExist=1 )

   print('test point 19')

   -- Bulk update of Existing Records
		 UPDATE V SET
		  V.VehicleCode =  VS.VehicleCode ,
		  V.VehicleTypeId = VS.VehicleTypeID,
		  V.ManufacturerId = VS.ManufactorerID,	
		  V.Model = VS.Variant,		 
		  V.Variant = VS.Model,
		  V.RegYear = VS.RegYear,
		  V.PublicationSection = VS.PublicationSection,
		  V.MasterModel = VS.MasterModel,
		  V.MakeCode = VS.MakeCode,
		  V.ModelCode = VS.ModelCode,
		  V.VariantCode = VS.VariantCode,
		  V.AxleConfiguration = VS.AxleConfiguration,
		  V.BodyTypeID = VS.BodyTypeID,
		  V.Doors = VS.Doors, 
		  V.Drive = VS.Drive,
		  V.Seats = VS.Seats,
		  V.[Use] = VS.[Use],
		  V.WheelBase = VS.WheelBase,
		  V.TransmissionTypeId = VS.TransmissionTypeId,
		  V.NoGears = VS.NoGears,
		  V.Cooling = VS.Cooling,
		  V.EngineCapacity = VS.EngineCapacity,
		  V.CylConfiguration = VS.CylConfiguration,
		  V.EngineCycle = VS.EngineCycle,
		  V.FuelTankSize = VS.FuelTankSize,
		  V.FuelType = VS.FuelType,
		  V.EnginePower =  VS.EnginePower,
		  V.Cylinders = VS.Cylinders,
		  V.TurboOrSuperCharged = VS.TurboOrSuperCharged,
		  V.GCM = VS.GCM,
		  V.GVM = VS.GVM,
		  V.Tare = VS.Tare,
		  V.Origin = VS.Origin,
		  V.FrontNoTyres = VS.FrontNoTyres,
		  V.FrontTyreSize = VS.FrontTyreSize,
		  V.RearNoTyres = VS.RearNoTyres,
		  V.RearTyreSize = VS.RearTyreSize,
		   V.IntroductionDate = VS.IntroductionDate,
		  V.TerminationDate = VS.TerminationDate,
		  V.CO2 = VS.CO2,
		  V.[Length] = VS.[Length],
		  V.Height = VS.Height,
		  V.Width = VS.Width,
		  V.NewListPrice = VS.NewListPrice,
		  V.CountryId = VS.CountryId,
		  V.IsActive = VS.IsActive,
		  V.ModifiedDate = VS.ModifiedDate,
		  V.ModifiedBy = VS.ModifiedBy
		 FROM #temp_table_name AS  VS
		 INNER JOIN [Vehicle] V 
		 ON V.VehicleCode = VS.VehicleCode AND V.CountryId = VS.CountryId 
		 WHERE VS.IsRecordExist=1 
		 and VS.VehicleTypeID<>0 and VS.BodyTypeID<>0 and VS.ManufactorerID<>0

    print('test point 20')

--Bulk insert of New Records
INSERT INTO [dbo].[Vehicle]
           ([VehicleCode],[VehicleTypeId],[ManufacturerId],[Model],[Variant],[RegYear],[PublicationSection],[MasterModel],[MakeCode],
		   [ModelCode],[VariantCode],[AxleConfiguration],[BodyTypeId],[Doors],[Drive],[Seats],[Use],[WheelBase],[TransmissionTypeId],
		   [NoGears],[Cooling],[EngineCapacity],[CylConfiguration],[EngineCycle],[FuelTankSize],[FuelType],[EnginePower],[Cylinders],
			[TurboOrSuperCharged],[GCM],[GVM],[Tare],[Origin],[FrontNoTyres],[FrontTyreSize],[RearNoTyres],[RearTyreSize],
			[IntroductionDate],[TerminationDate],[CO2],[Length],[Height],[Width],[NewListPrice],
			[CountryId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy]
)
 SELECT  
			VehicleCode,VehicleTypeID,ManufactorerID,Variant,Model,RegYear,PublicationSection,MasterModel,MakeCode,
			ModelCode,VariantCode,AxleConfiguration,BodyTypeID,Doors, Drive,Seats,[Use],WheelBase,TransmissionTypeId,
			NoGears,Cooling,EngineCapacity,CylConfiguration,EngineCycle,FuelTankSize,FuelType,EnginePower,Cylinders,
			TurboOrSuperCharged,GCM,GVM,Tare,Origin,FrontNoTyres,FrontTyreSize,RearNoTyres,RearTyreSize,
			IntroductionDate,TerminationDate,CO2,[Length],Height,Width,NewListPrice,
			CountryId,IsActive,CreatedDate,ModifiedDate,CreatedBy,ModifiedBy
 FROM #temp_table_name WHERE IsRecordExist=0 and VehicleTypeID<>0 and BodyTypeID<>0 and ManufactorerID<>0
 
 print('test point 21')
 
 -- GET Count of Rows after insertion
 set @AfterInsertionCount = (Select count(1) FROM Vehicle)

 IF @Message IS NULL BEGIN
    set @Message ='File Import Successful.'
	SELECT @Message
 END
 


COMMIT TRAN

END

