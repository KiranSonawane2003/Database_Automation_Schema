CREATE TABLE [dbo].[EmiratesCardErrorLog] (
    [Id]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [TransactionId] BIGINT         NULL,
    [CardError]     NVARCHAR (200) NULL,
    [CreatedBy]     INT            NULL,
    [ModifiedBy]    INT            NULL,
    [CreatedDate]   DATETIME       NULL,
    [ModifiedDate]  DATETIME       NULL,
    CONSTRAINT [PK_EmiratesCardErrorLog] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [Transaction_FK_EmiratesCardErrorLog] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [UserCreatedBy_FK_EmiratesCardErrorLog] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [UserModifiedBy_FK_EmiratesCardErrorLog] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

