CREATE TABLE [dbo].[TransactionSystemGeneratedDoc] (
    [Id]            BIGINT         NOT NULL,
    [TransactionId] BIGINT         NULL,
    [DocumentType]  NVARCHAR (200) NULL,
    [DocumentName]  NVARCHAR (200) NULL,
    [DocumentPath]  NVARCHAR (500) NULL,
    [IsActive]      BIT            CONSTRAINT [DF_TransactionSystemGeneratedDoc_IsActive] DEFAULT ((1)) NULL,
    [CreatedDate]   DATETIME       CONSTRAINT [DF_TransactionSystemGeneratedDoc_CreatedDate] DEFAULT (getutcdate()) NULL,
    [ModifiedDate]  DATETIME       NULL,
    [CreatedBy]     INT            NULL,
    [ModifiedBy]    INT            NULL,
    CONSTRAINT [TransactionSystemGeneratedDoc_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [TransactionSystemGeneratedDoc_FK_Transaction] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [TransactionSystemGeneratedDoc_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [TransactionSystemGeneratedDoc_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

