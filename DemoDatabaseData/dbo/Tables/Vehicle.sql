CREATE TABLE [dbo].[Vehicle] (
    [Id]                  BIGINT          IDENTITY (1, 1) NOT NULL,
    [VehicleCode]         NVARCHAR (100)  NULL,
    [ManufacturerId]      BIGINT          NULL,
    [Model]               NVARCHAR (100)  NULL,
    [VehicleTypeId]       BIGINT          NULL,
    [BodyTypeId]          BIGINT          NULL,
    [IntroductionDate]    DATE            NULL,
    [TerminationDate]     DATE            NULL,
    [EngineCapacity]      INT             NULL,
    [EnginePower]         NVARCHAR (100)  NULL,
    [Cylinders]           INT             NULL,
    [Doors]               NVARCHAR (50)   NULL,
    [CountryId]           BIGINT          NULL,
    [IsActive]            BIT             CONSTRAINT [Vehicle_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]         DATETIME        CONSTRAINT [Vehicle_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]        DATETIME        NULL,
    [CreatedBy]           INT             NOT NULL,
    [ModifiedBy]          INT             NULL,
    [Weight]              DECIMAL (18, 2) NULL,
    [GroupId]             BIGINT          NULL,
    [BranchId]            BIGINT          NULL,
    [ModelYear]           INT             NULL,
    [TransmissionTypeId]  BIGINT          NULL,
    [Trim]                NVARCHAR (50)   NULL,
    [RegYear]             INT             NULL,
    [Variant]             NVARCHAR (MAX)  NULL,
    [PublicationSection]  NVARCHAR (MAX)  NULL,
    [MasterModel]         NVARCHAR (MAX)  NULL,
    [MakeCode]            INT             NULL,
    [ModelCode]           INT             NULL,
    [VariantCode]         INT             NULL,
    [AxleConfiguration]   NVARCHAR (MAX)  NULL,
    [Drive]               NVARCHAR (MAX)  NULL,
    [Seats]               INT             NULL,
    [Use]                 NVARCHAR (MAX)  NULL,
    [WheelBase]           NVARCHAR (MAX)  NULL,
    [NoGears]             INT             NULL,
    [Cooling]             NVARCHAR (MAX)  NULL,
    [CylConfiguration]    NVARCHAR (MAX)  NULL,
    [EngineCycle]         INT             NULL,
    [FuelTankSize]        DECIMAL (18, 2) NULL,
    [FuelType]            NVARCHAR (MAX)  NULL,
    [TurboOrSuperCharged] NVARCHAR (MAX)  NULL,
    [GCM]                 INT             NULL,
    [GVM]                 INT             NULL,
    [Tare]                INT             NULL,
    [Origin]              NVARCHAR (MAX)  NULL,
    [FrontNoTyres]        INT             NULL,
    [FrontTyreSize]       NVARCHAR (MAX)  NULL,
    [RearNoTyres]         INT             NULL,
    [RearTyreSize]        NVARCHAR (MAX)  NULL,
    [CO2]                 INT             NULL,
    [Length]              INT             NULL,
    [Height]              INT             NULL,
    [Width]               INT             NULL,
    [NewListPrice]        DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [Vehicle_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [Vehicle_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [Vehicle_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [Vehicle_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Vehicle_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Vehicle_FK_VehicleBodyType] FOREIGN KEY ([BodyTypeId]) REFERENCES [dbo].[VehicleBodyType] ([Id]),
    CONSTRAINT [Vehicle_FK_VehicleManufacturer] FOREIGN KEY ([ManufacturerId]) REFERENCES [dbo].[VehicleManufacturer] ([Id]),
    CONSTRAINT [Vehicle_FK_VehicleType] FOREIGN KEY ([VehicleTypeId]) REFERENCES [dbo].[VehicleType] ([Id]),
    CONSTRAINT [Vehicle_SFK_taticValueTransmissionType] FOREIGN KEY ([TransmissionTypeId]) REFERENCES [dbo].[StaticValue] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is table use to store created vehicle information under system >> Vehicle Code >> Create vehicle code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vehicle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table VehicleManufacurer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vehicle', @level2type = N'COLUMN', @level2name = N'ManufacturerId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table VehicleType', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vehicle', @level2type = N'COLUMN', @level2name = N'VehicleTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table VehicleBodyType', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vehicle', @level2type = N'COLUMN', @level2name = N'BodyTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Introduction date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vehicle', @level2type = N'COLUMN', @level2name = N'IntroductionDate';

