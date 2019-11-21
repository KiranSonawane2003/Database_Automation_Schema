CREATE TABLE [dbo].[InceptTransactionAccessories] (
    [Id]                    BIGINT          IDENTITY (1, 1) NOT NULL,
    [Details]               NVARCHAR (100)  NULL,
    [RetailPrice]           DECIMAL (18, 2) NULL,
    [IsPayByCash]           BIT             CONSTRAINT [InceptTransactionAccessories_DF_PayByCash] DEFAULT ((0)) NOT NULL,
    [CountryId]             BIGINT          NULL,
    [IsActive]              BIT             CONSTRAINT [InceptTransactionAccessories_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]           DATETIME        CONSTRAINT [InceptTransactionAccessories_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]          DATETIME        NULL,
    [CreatedBy]             INT             NOT NULL,
    [ModifiedBy]            INT             NULL,
    [IsAccessoriesSelected] BIT             NULL,
    [TransactionId]         BIGINT          NOT NULL,
    [AccessoriesId]         BIGINT          NULL,
    [AccessoriesValue]      NVARCHAR (100)  NULL,
    [Cost]                  DECIMAL (18, 2) NULL,
    [CountryValue]          NVARCHAR (50)   NULL,
    [CreatedByValue]        NVARCHAR (50)   NULL,
    [ModifiedByValue]       NVARCHAR (50)   NULL,
    [InceptTransactionId]   BIGINT          NOT NULL,
    CONSTRAINT [InceptTransactionAccessories_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_InceptTransactionAccessories_InceptTransaction] FOREIGN KEY ([InceptTransactionId]) REFERENCES [dbo].[InceptTransaction] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores accessories related to transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'InceptTransactionAccessories';

