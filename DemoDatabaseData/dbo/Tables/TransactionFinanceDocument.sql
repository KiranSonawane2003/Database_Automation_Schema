CREATE TABLE [dbo].[TransactionFinanceDocument] (
    [Id]                              BIGINT   IDENTITY (1, 1) NOT NULL,
    [TransactionFinanceApplicationId] BIGINT   NULL,
    [TransactionDocumentId]           BIGINT   NULL,
    [IsActive]                        BIT      NULL,
    [CreatedDate]                     DATETIME NOT NULL,
    [ModifiedDate]                    DATETIME NULL,
    [CreatedBy]                       INT      NOT NULL,
    [ModifiedBy]                      INT      NULL,
    CONSTRAINT [PK_TransactionFinanceDocument] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransactionFinanceDocument_TransactionDocument] FOREIGN KEY ([TransactionDocumentId]) REFERENCES [dbo].[TransactionDocument] ([Id])
);

