CREATE TYPE [dbo].[NewVehicleAccessoriesSchema] AS TABLE (
    [Id]                    BIGINT          NOT NULL,
    [MMCode]                NVARCHAR (MAX)  NOT NULL,
    [AccessoryCode]         NVARCHAR (MAX)  NOT NULL,
    [AccessoryName]         NVARCHAR (MAX)  NOT NULL,
    [SellingPrice]          DECIMAL (18, 2) NULL,
    [IsEditable]            BIT             NULL,
    [IsGeneric]             BIT             NOT NULL,
    [IsNewVehicleAccessory] BIT             NULL,
    [CountryId]             BIGINT          NULL,
    [IsActive]              BIT             NOT NULL,
    [CreatedDate]           DATETIME        NOT NULL,
    [ModifiedDate]          DATETIME        NULL,
    [CreatedBy]             INT             NOT NULL,
    [ModifiedBy]            INT             NULL,
    [SequenceNumber]        BIGINT          NOT NULL);

