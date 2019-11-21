CREATE TABLE [dbo].[UserTransactionMapping] (
    [Id]            UNIQUEIDENTIFIER CONSTRAINT [PK_SerialID] DEFAULT (newid()) NOT NULL,
    [UserID]        INT              NULL,
    [TransactionID] BIGINT           NULL,
    [ModifiedDate]  DATETIME         NULL,
    CONSTRAINT [PK_UserTransactionMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserTransactionMapping_TransactionID] FOREIGN KEY ([TransactionID]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [FK_UserTransactionMapping_UserID] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([Id])
);

