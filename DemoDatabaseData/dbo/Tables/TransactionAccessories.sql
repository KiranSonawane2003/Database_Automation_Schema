CREATE TABLE [dbo].[TransactionAccessories] (
    [Id]                  BIGINT          IDENTITY (1, 1) NOT NULL,
    [TransactionId]       BIGINT          NULL,
    [AccessoriesId]       BIGINT          NULL,
    [Details]             NVARCHAR (200)  NULL,
    [IsAccessorySelected] BIT             NULL,
    [IsPayByCash]         BIT             CONSTRAINT [TransactionAccessories_DF_PayByCash] DEFAULT ((0)) NULL,
    [Cost]                DECIMAL (18, 2) NULL,
    [RetailPrice]         DECIMAL (18, 2) NULL,
    [CountryId]           BIGINT          NULL,
    [IsActive]            BIT             CONSTRAINT [TransactionAccessories_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]         DATETIME        CONSTRAINT [TransactionAccessories_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]        DATETIME        NULL,
    [CreatedBy]           INT             NOT NULL,
    [ModifiedBy]          INT             NULL,
    [CostGroup]           INT             NULL,
    CONSTRAINT [TransactionAccessories_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [TransactionAccessories_FK_Accessories] FOREIGN KEY ([AccessoriesId]) REFERENCES [dbo].[Accessories] ([Id]),
    CONSTRAINT [TransactionAccessories_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [TransactionAccessories_FK_Transaction] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [TransactionAccessories_FK_UsersCreaatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [TransactionAccessories_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is for store accessories related with transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TransactionAccessories';

