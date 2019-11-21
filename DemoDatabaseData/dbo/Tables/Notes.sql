CREATE TABLE [dbo].[Notes] (
    [Id]            BIGINT          IDENTITY (1, 1) NOT NULL,
    [TransactionId] BIGINT          NULL,
    [Notes]         NVARCHAR (4000) NULL,
    [NotesTypeEnum] INT             NULL,
    [IsActive]      BIT             DEFAULT ((1)) NOT NULL,
    [CreatedDate]   DATETIME        DEFAULT (getutcdate()) NULL,
    [ModifiedDate]  DATETIME        NULL,
    [CreatedBy]     INT             NULL,
    [ModifiedBy]    INT             NULL,
    CONSTRAINT [Notes_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [Notes_FK_Transaction] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [Notes_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Notes_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

