CREATE TABLE [dbo].[MultipleFinanceSubmissionHistory] (
    [Id]                          BIGINT   IDENTITY (1, 1) NOT NULL,
    [FinanceApplicationHistoryId] BIGINT   NOT NULL,
    [TransactionDocumentId]       BIGINT   NOT NULL,
    [CreatedDate]                 DATETIME DEFAULT (getutcdate()) NULL,
    [IsActive]                    BIT      DEFAULT ((1)) NULL,
    CONSTRAINT [PK_MultipleFinanceSubmissionHistory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_MultipleFinanceSubmissionHistory_FinanceApplicationHistory] FOREIGN KEY ([FinanceApplicationHistoryId]) REFERENCES [dbo].[FinanceApplicationHistory] ([id]),
    CONSTRAINT [FK_MultipleFinanceSubmissionHistory_TransactionDocument] FOREIGN KEY ([TransactionDocumentId]) REFERENCES [dbo].[TransactionDocument] ([Id])
);

