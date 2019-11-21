CREATE view ViewVehicles
 as select VehicleTypeName,Manufacturer,Model,Trim,ModelYear,Cylinders,BodyTypeId,Doors,EnginePower,TransmissionTypeId,FuelType,tv.VehicleId,tv.TransactionId,BodyStyle,tv.DownPaymentMadeTo
  from  TransactionVehicle tv 
left join [dbo].Vehicle v on tv.VehicleId=v.Id
left join [dbo].[VehicleType] vt on v.VehicleTypeId=vt.Id
left join [dbo].VehicleManufacturer vm on v.ManufacturerId=vm.Id
left Join [dbo].VehicleBodyType vbt on v.BodyTypeId=vbt.Id
where v.IsActive=1 
