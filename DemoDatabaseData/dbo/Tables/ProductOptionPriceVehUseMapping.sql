CREATE TABLE [dbo].[ProductOptionPriceVehUseMapping] (
    [Id]                   BIGINT   IDENTITY (1, 1) NOT NULL,
    [ProductOptionPriceId] BIGINT   NOT NULL,
    [VehicleUseId]         BIGINT   NULL,
    [CountryId]            BIGINT   NULL,
    [IsActive]             BIT      CONSTRAINT [DF_ProductOptionPriceVehUseMapping_IsActive] DEFAULT ((1)) NULL,
    [CreatedDate]          DATETIME CONSTRAINT [DF_ProductOptionPriceVehUseMapping_CreatedDate] DEFAULT (getutcdate()) NULL,
    [ModifiedDate]         DATETIME NULL,
    [CreatedBy]            INT      NULL,
    [ModifiedBy]           INT      NULL,
    CONSTRAINT [PK_ProductOptionPriceVehUseMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ProductOptionPriceVehUseMapping_ProductOptionPrice] FOREIGN KEY ([ProductOptionPriceId]) REFERENCES [dbo].[ProductOptionPrice] ([Id]),
    CONSTRAINT [FK_ProductOptionPriceVehUseMapping_StaticValue] FOREIGN KEY ([VehicleUseId]) REFERENCES [dbo].[StaticValue] ([Id])
);

