CREATE TABLE [dbo].[TransactionFinanceStatusDetailView] (
    [Id]                             BIGINT   IDENTITY (1, 1) NOT NULL,
    [TransactionFinanceStatusViewId] BIGINT   NOT NULL,
    [FinanceStatusId]                BIGINT   NULL,
    [CreatedDate]                    DATETIME NULL,
    [ModifiedDate]                   DATETIME NULL,
    [CreatedBy]                      INT      NULL,
    [ModifiedBy]                     INT      NULL,
    [IsActive]                       BIT      NOT NULL,
    CONSTRAINT [PK_TransactionFinanceStatusDetailView] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransactionFinanceStatusDetailView_TransactionFinanceStatusView] FOREIGN KEY ([TransactionFinanceStatusViewId]) REFERENCES [dbo].[TransactionFinanceStatusView] ([Id]),
    CONSTRAINT [FK_TransactionFinanceStatusDetailView_Users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_TransactionFinanceStatusDetailView_Users1] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

