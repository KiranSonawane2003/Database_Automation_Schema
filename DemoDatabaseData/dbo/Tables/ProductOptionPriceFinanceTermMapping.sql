CREATE TABLE [dbo].[ProductOptionPriceFinanceTermMapping] (
    [Id]                   BIGINT   IDENTITY (1, 1) NOT NULL,
    [ProductOptionPriceId] BIGINT   NOT NULL,
    [TermId]               BIGINT   NULL,
    [CountryId]            BIGINT   NULL,
    [IsActive]             BIT      CONSTRAINT [DF_ProductOptionPriceFinanceTermMapping_IsActive] DEFAULT ((1)) NULL,
    [CreatedDate]          DATETIME CONSTRAINT [DF_ProductOptionPriceFinanceTermMapping_CreatedDate] DEFAULT (getutcdate()) NULL,
    [ModifiedDate]         DATETIME NULL,
    [CreatedBy]            INT      NULL,
    [ModifiedBy]           INT      NULL,
    CONSTRAINT [ProductOptionPriceFinanceTermMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [ProductOptionPriceFinanceTermMapping_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [ProductOptionPriceFinanceTermMapping_FK_FinanceTerm] FOREIGN KEY ([TermId]) REFERENCES [dbo].[FinanceTerm] ([Id]),
    CONSTRAINT [ProductOptionPriceFinanceTermMapping_FK_ProductOptionPrice] FOREIGN KEY ([ProductOptionPriceId]) REFERENCES [dbo].[ProductOptionPrice] ([Id]),
    CONSTRAINT [ProductOptionPriceFinanceTermMapping_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ProductOptionPriceFinanceTermMapping_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

