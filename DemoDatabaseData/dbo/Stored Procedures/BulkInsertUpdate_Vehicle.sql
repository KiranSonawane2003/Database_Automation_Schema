
CREATE PROCEDURE [dbo].[BulkInsertUpdate_Vehicle] 
(
  @VehicleSchema VehicleSchema  readonly
)

AS

BEGIN

BEGIN TRANSACTION

BEGIN TRY


;WITH VehicleInsert_CTE (RowNumber, Id,VehicleCode,ManufacturerId,Model,VehicleTypeId,BodyTypeId,IntroductionDate,ModelYear,TerminationDate,EngineCapacity,EnginePower,Cylinders,Doors,CountryId,IsActive,CreatedDate,CreatedBy,ModifiedBy)
AS
(
	SELECT ROW_NUMBER() OVER(Partition By vehiclecode ORDER BY  [SequenceNumber] ) As RowNumber,Id,VehicleCode,ManufacturerId,Model,VehicleTypeId,BodyTypeId,IntroductionDate,ModelYear,TerminationDate,EngineCapacity,EnginePower,Cylinders,Doors,CountryId,IsActive,CreatedDate,CreatedBy,ModifiedBy from @VehicleSchema
),

VehicleInsertFinal_CTE (RowNumber, Id,VehicleCode,ManufacturerId,Model,VehicleTypeId,BodyTypeId,IntroductionDate,ModelYear,TerminationDate,EngineCapacity,EnginePower,Cylinders,Doors,CountryId,IsActive,CreatedDate,CreatedBy,ModifiedBy)
AS
(
	SELECT  RowNumber,Id,VehicleCode,ManufacturerId,Model,VehicleTypeId,BodyTypeId,IntroductionDate,ModelYear,TerminationDate,EngineCapacity,EnginePower,Cylinders,Doors,CountryId,IsActive,CreatedDate,CreatedBy,ModifiedBy from VehicleInsert_CTE WHERE RowNumber = 1
)



MERGE INTO Vehicle h1
   USING  VehicleInsertFinal_CTE h2
   ON h1.VehicleCode = h2.VehicleCode AND
    h1.CountryID = h2.CountryID  AND h1.IsActive = 1 
   WHEN NOT MATCHED THEN
 
   INSERT (
			  VehicleCode,
			  ManufacturerId,
			  Model,
			  VehicleTypeId,
			  BodyTypeId,
			  IntroductionDate,
			  ModelYear,
			  TerminationDate,
			  EngineCapacity,
			  EnginePower,
			  Cylinders,
			  Doors,
			  CountryId,
			  IsActive,
			  CreatedDate,
			  CreatedBy,
			  ModifiedBy
			 )  VALUES
	        (
			  h2.VehicleCode,
			  h2.ManufacturerId,
			  h2.Model,
			  h2.VehicleTypeId,
			  h2.BodyTypeId,
			  h2.IntroductionDate,
			  h2.ModelYear,
			  h2.TerminationDate,
			  h2.EngineCapacity,
			  h2.EnginePower,
			  h2.Cylinders,
			  h2.Doors,
			  h2.CountryId,
			  h2.IsActive,
			  h2.CreatedDate,
			  h2.CreatedBy,
			  h2.ModifiedBy
			 ) ;

			
IF OBJECT_ID('tmpVehicleData') IS NOT NULL
	DROP TABLE tmpVehicleData

;WITH Vehicle_CTE (RowNumber, Id,VehicleCode,ManufacturerId,Model,VehicleTypeId,BodyTypeId,IntroductionDate,ModelYear,TerminationDate,EngineCapacity,EnginePower,Cylinders,Doors,CountryId,IsActive,CreatedDate,CreatedBy,ModifiedBy)
AS
(
	SELECT ROW_NUMBER() OVER(Partition By vehiclecode ORDER BY  [SequenceNumber] ) As RowNumber,Id,VehicleCode,ManufacturerId,Model,VehicleTypeId,BodyTypeId,IntroductionDate,ModelYear,TerminationDate,EngineCapacity,EnginePower,Cylinders,Doors,CountryId,IsActive,CreatedDate,CreatedBy,ModifiedBy from @VehicleSchema 
)



SELECT * INTO tmpVehicleData FROM Vehicle_CTE 


		 UPDATE V
		 SET
		  V.VehicleCode =  VS.VehicleCode ,
		  V.ManufacturerId = VS.ManufacturerId,
		  V.Model = VS.Model,
		  V.VehicleTypeId = VS.VehicleTypeId,
		  V.BodyTypeId = VS.BodyTypeId,
		  V.IntroductionDate = VS.IntroductionDate, 
		  V.ModelYear = VS.ModelYear,
		  V.TerminationDate =  VS.TerminationDate,
		  V.EngineCapacity = VS.EngineCapacity,
		  V.EnginePower = VS.EnginePower,
		  V.Cylinders = VS.Cylinders,
		  V.Doors = VS.Doors,
		  V.CountryId = VS.CountryId,
		  V.IsActive = VS.IsActive,
		  V.ModifiedDate = VS.CreatedDate,
		  V.ModifiedBy = VS.ModifiedBy
		 FROM
		   (
			 Select * From tmpVehicleData Where  RowNumber in (Select MaxRow From ( select  VehicleCode, Max(RowNumber) As MaxRow from tmpVehicleData group by  VehicleCode) t1 ) 
			)AS  VS
		 INNER JOIN
			Vehicle V  WITH (NOLOCK) 
		ON
			 V.VehicleCode = VS.VehicleCode AND V.CountryId = VS.CountryId --AND VS.Id <> 0
			
IF OBJECT_ID('tmpVehicleData') IS NOT NULL
	DROP TABLE tmpVehicleData
END TRY

BEGIN CATCH
  ROLLBACK TRANSACTION;
  Throw;
END CATCH


COMMIT TRANSACTION;
END

