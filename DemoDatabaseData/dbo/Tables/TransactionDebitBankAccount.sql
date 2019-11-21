CREATE TABLE [dbo].[TransactionDebitBankAccount] (
    [Id]                BIGINT         NOT NULL,
    [TransactionId]     BIGINT         NOT NULL,
    [AccountType]       INT            NOT NULL,
    [BankName]          NVARCHAR (100) NOT NULL,
    [BranchCode]        NVARCHAR (100) NOT NULL,
    [AccountNumber]     NVARCHAR (100) NOT NULL,
    [AccountHolderName] NVARCHAR (200) NOT NULL,
    [AccountOpenDate]   DATE           NULL,
    [IsPrimaryAccount]  BIT            NOT NULL,
    [CountryId]         BIGINT         NULL,
    [IsActive]          BIT            CONSTRAINT [DF_TransactionDebitBankAccount_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]       DATETIME       CONSTRAINT [DF_TransactionDebitBankAccount_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]      DATETIME       NULL,
    [CreatedBy]         INT            NOT NULL,
    [ModifiedBy]        INT            NULL,
    CONSTRAINT [TransactionDebitBankAccount_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [TransactionDebitBankAccount_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [TransactionDebitBankAccount_FK_Transaction] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [TransactionDebitBankAccount_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [TransactionDebitBankAccount_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains debit accounts of transaction for finance application', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TransactionDebitBankAccount';

