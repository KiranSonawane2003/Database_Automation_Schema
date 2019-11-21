CREATE TABLE [dbo].[VehicleAccessoriesMapping] (
    [Id]          BIGINT IDENTITY (1, 1) NOT NULL,
    [VehicleId]   BIGINT NOT NULL,
    [AccessoryId] BIGINT NOT NULL,
    [IsActive]    BIT    NOT NULL,
    CONSTRAINT [VehicleAccessoriesMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [VehicleAccessoriesMapping_FK_Accessory] FOREIGN KEY ([AccessoryId]) REFERENCES [dbo].[Accessories] ([Id]),
    CONSTRAINT [VehicleAccessoriesMapping_FK_Vehicle] FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle] ([Id])
);

