CREATE PROCEDURE [dbo].[BulkInsertUpdate_Accessories] 
(
   @AccessoriesSchema AccessoriesSchema readonly
)

AS

BEGIN

BEGIN TRANSACTION

BEGIN TRY


;WITH VehicleInsert_CTE (RowNumber, Id,AccessoryName,Code,IsGeneric,GroupId,BranchId,CostPrice,SellingPrice,[Description],TemplateId,CountryId,IsActive,IsEditable,CreatedDate,CreatedBy,ModifiedBy)
AS
(
	SELECT ROW_NUMBER() OVER(Partition By Code ORDER BY  [SequenceNumber] ) As RowNumber,Id,AccessoryName,Code,IsGeneric,GroupId,BranchId,CostPrice,SellingPrice,[Description],TemplateId,CountryId,IsActive,IsEditable,CreatedDate,CreatedBy,ModifiedBy from @AccessoriesSchema
),

VehicleInsertFinal_CTE (RowNumber, Id,AccessoryName,Code,IsGeneric,GroupId,BranchId,CostPrice,SellingPrice,[Description],TemplateId,CountryId,IsActive,IsEditable,CreatedDate,CreatedBy,ModifiedBy)
AS
(
	SELECT  RowNumber,Id,AccessoryName,Code,IsGeneric,GroupId,BranchId,CostPrice,SellingPrice,[Description],TemplateId,CountryId,IsActive,IsEditable,CreatedDate,CreatedBy,ModifiedBy from VehicleInsert_CTE WHERE RowNumber = 1
)



MERGE INTO Accessories h1
   USING  VehicleInsertFinal_CTE h2
   ON h1.Code = h2.Code AND
    h1.CountryID = h2.CountryID  AND h1.IsActive = 1 
   WHEN NOT MATCHED THEN
 
  -- Bulk Insert
   INSERT (
			  AccessoryName,
			  Code,
			  IsGeneric,
			  GroupId,
			  BranchId,
			  CostPrice,
			  SellingPrice,
			  [Description],
			  TemplateId,			  			
			  CountryId,
			  IsActive,
			  IsEditable,
			  CreatedDate,
			  CreatedBy,
			  ModifiedBy
			 )  VALUES
	        (
			  h2.AccessoryName,
			  h2.Code,
			  h2.IsGeneric,
			  h2.GroupId,
			  h2.BranchId,
			  h2.CostPrice,
			  h2.SellingPrice,
			  h2.[Description],
			  h2.TemplateId,
			  h2.CountryId,
			  h2.IsActive,
			  h2.IsEditable, 
			  h2.CreatedDate,
			  h2.CreatedBy,
			  h2.ModifiedBy
			 );

			
IF OBJECT_ID('tmpVehicleData') IS NOT NULL
	DROP TABLE tmpVehicleData

;WITH Vehicle_CTE (RowNumber, Id,AccessoryName,Code,IsGeneric,GroupId,BranchId,CostPrice,SellingPrice,[Description],TemplateId,CountryId,IsActive,IsEditable,CreatedDate,CreatedBy,ModifiedBy)
AS
(
	SELECT ROW_NUMBER() OVER(Partition By Code ORDER BY [SequenceNumber]) As RowNumber,Id,AccessoryName,Code,IsGeneric,GroupId,BranchId,CostPrice,SellingPrice,[Description],TemplateId,CountryId,IsActive,IsEditable,CreatedDate,CreatedBy,ModifiedBy from @AccessoriesSchema 
)



SELECT * INTO tmpVehicleData FROM Vehicle_CTE 

		-- Bulk update
		 UPDATE V
		 SET
		  V.Code =  VS.Code ,
		  V.AccessoryName = VS.AccessoryName,
		  V.IsGeneric = VS.IsGeneric,
		  V.GroupId = VS.GroupId,
		  V.BranchId = VS.BranchId,
		  V.CostPrice = VS.CostPrice, 
		  V.SellingPrice = VS.SellingPrice,
		  V.Description =  VS.Description,
		  V.TemplateId = VS.TemplateId,
		  V.CountryId = VS.CountryId,
		  V.IsEditable = VS.IsEditable,		
		  V.IsActive = VS.IsActive,
		  V.ModifiedDate = VS.CreatedDate,
		  V.ModifiedBy = VS.ModifiedBy
		 FROM
		   (
			 Select * From tmpVehicleData Where  RowNumber in (Select MaxRow From ( select  Code, Max(RowNumber) As MaxRow from tmpVehicleData group by  Code) t1 ) 
			)AS  VS
		 INNER JOIN
			Accessories V  WITH (NOLOCK) 
		ON
			 V.Code = VS.Code AND V.CountryId = VS.CountryId 
			
IF OBJECT_ID('tmpVehicleData') IS NOT NULL
	DROP TABLE tmpVehicleData
END TRY

BEGIN CATCH
  ROLLBACK TRANSACTION;
  Throw;
END CATCH


COMMIT TRANSACTION;
END