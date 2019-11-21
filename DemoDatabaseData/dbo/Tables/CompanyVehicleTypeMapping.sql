CREATE TABLE [dbo].[CompanyVehicleTypeMapping] (
    [Id]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [VehicleTypeId] BIGINT         NOT NULL,
    [CompanyId]     BIGINT         NULL,
    [CreatedBy]     INT            NULL,
    [ModifiedBy]    INT            NULL,
    [CreateDate]    DATETIME       NULL,
    [ModifiedDate]  DATETIME       NULL,
    [IsActive]      BIT            NULL,
    [Code]          NVARCHAR (100) NULL,
    CONSTRAINT [PK_CompanyVehicleTypeMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CompanyVehicleTypeMapping_FK_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [CompanyVehicleTypeMapping_FK_CompanyVehicleTypeMapping] FOREIGN KEY ([VehicleTypeId]) REFERENCES [dbo].[VehicleType] ([Id]),
    CONSTRAINT [FK_CompanyVehicleTypeMapping_Users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_CompanyVehicleTypeMapping_Users1] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

