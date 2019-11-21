CREATE TABLE [dbo].[ProductOptionPriceVehCondMapping] (
    [Id]                   BIGINT   IDENTITY (1, 1) NOT NULL,
    [ProductOptionPriceId] BIGINT   NOT NULL,
    [VehicleConditionId]   BIGINT   NULL,
    [CountryId]            BIGINT   NULL,
    [IsActive]             BIT      NULL,
    [CreatedDate]          DATETIME CONSTRAINT [DF__ProductOp__Creat__45C18905] DEFAULT (getutcdate()) NULL,
    [ModifiedDate]         DATETIME NULL,
    [CreatedBy]            INT      NULL,
    [ModifiedBy]           INT      NULL,
    CONSTRAINT [ProductOptionPriceVehCondMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [ProductOptionPriceVehCondMapping_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [ProductOptionPriceVehCondMapping_FK_ProductOptionPrice] FOREIGN KEY ([ProductOptionPriceId]) REFERENCES [dbo].[ProductOptionPrice] ([Id]),
    CONSTRAINT [ProductOptionPriceVehCondMapping_FK_StaticValueVehicleCondition] FOREIGN KEY ([VehicleConditionId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [ProductOptionPriceVehCondMapping_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ProductOptionPriceVehCondMapping_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

