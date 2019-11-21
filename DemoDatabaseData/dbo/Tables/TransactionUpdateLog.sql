CREATE TABLE [dbo].[TransactionUpdateLog] (
    [Id]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [TransactionId] BIGINT         NOT NULL,
    [FileName]      NVARCHAR (100) NOT NULL,
    [ModifiedBy]    INT            NOT NULL,
    [ModifiedDate]  DATETIME       NOT NULL,
    CONSTRAINT [PK_TransactionUpdateLog] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransactionUpdateLog_Transaction] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [FK_TransactionUpdateLog_Users] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

