CREATE TABLE [dbo].[TransAndFinAppStatusHistory] (
    [Id]                  BIGINT   IDENTITY (1, 1) NOT NULL,
    [TransactionId]       BIGINT   NULL,
    [TransactionStatusId] BIGINT   NULL,
    [FinanceStatusId]     BIGINT   NULL,
    [FinanceCompanyId]    BIGINT   NULL,
    [CreatedBy]           BIGINT   NULL,
    [CreateDate]          DATETIME NULL,
    [IsAutomated]         BIT      NULL,
    CONSTRAINT [PK_TransAndFinAppStatusHistory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransAndFinAppStatusHistory_FinanceCompanyID] FOREIGN KEY ([FinanceCompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [FK_TransAndFinAppStatusHistory_FinanceStatusId] FOREIGN KEY ([FinanceStatusId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_TransAndFinAppStatusHistory_TransactionID] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [FK_TransAndFinAppStatusHistory_TransactionStatusId] FOREIGN KEY ([TransactionStatusId]) REFERENCES [dbo].[StaticValue] ([Id])
);

