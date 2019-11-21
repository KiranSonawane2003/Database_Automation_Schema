CREATE TABLE [dbo].[TransactionContactEmployerMapping] (
    [Id]         BIGINT IDENTITY (1, 1) NOT NULL,
    [ContactID]  BIGINT NULL,
    [EmployerID] BIGINT NULL,
    [IsActive]   BIT    DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_TransactionContactEmployerMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [TransactionContactEmployerMapping_FK_ContactID] FOREIGN KEY ([ContactID]) REFERENCES [dbo].[TransactionContact] ([Id]),
    CONSTRAINT [TransactionContactEmployerMapping_FK_EmployerID] FOREIGN KEY ([EmployerID]) REFERENCES [dbo].[TransactionEmployerDetails] ([Id])
);

