CREATE TABLE [dbo].[TransactionUninceptLog] (
    [Id]                  BIGINT         IDENTITY (1, 1) NOT NULL,
    [TransactionId]       BIGINT         NOT NULL,
    [InceptTransactionId] BIGINT         NULL,
    [Action]              NVARCHAR (50)  NULL,
    [Reason]              NVARCHAR (MAX) NULL,
    [CreatedDate]         DATETIME       DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]           INT            NOT NULL,
    [CreatedByValue]      NVARCHAR (200) NULL,
    CONSTRAINT [PK_TransactionUninceptLog] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [TransactionUninceptLog_FK_Transaction] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [TransactionUninceptLog_FK_Users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id])
);

