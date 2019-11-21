CREATE TABLE [dbo].[VehicleManufacturer] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [Manufacturer]     NVARCHAR (100) NOT NULL,
    [CountryId]        BIGINT         NULL,
    [ManufacturerDate] DATE           NULL,
    [IsActive]         BIT            CONSTRAINT [VehicleManufacturer_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]      DATETIME       CONSTRAINT [VehicleManufacturer_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [CreatedBy]        INT            NOT NULL,
    [ModifiedBy]       INT            NULL,
    CONSTRAINT [VehicleManufacturer_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [VehicleManufacturer_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [VehicleManufacturer_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [VehicleManufacturer_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is master table for Manufacturer', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'VehicleManufacturer';

