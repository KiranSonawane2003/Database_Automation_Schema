CREATE TABLE [dbo].[TransactionContactIncomeAndExpenditureMapping] (
    [Id]                     BIGINT IDENTITY (1, 1) NOT NULL,
    [ContactID]              BIGINT NULL,
    [IncomeAndExpenditureID] BIGINT NULL,
    [IsActive]               BIT    DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_TransactionContactIncomeAndExpenditureMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [TransactionContactIncomeAndExpenditureMapping_FK_ContactID] FOREIGN KEY ([ContactID]) REFERENCES [dbo].[TransactionContact] ([Id]),
    CONSTRAINT [TransactionContactIncomeAndExpenditureMapping_FK_IncomeExpendID] FOREIGN KEY ([IncomeAndExpenditureID]) REFERENCES [dbo].[TransactionIncomeAndExpenditure] ([Id])
);

