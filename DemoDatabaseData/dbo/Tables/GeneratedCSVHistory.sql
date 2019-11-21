CREATE TABLE [dbo].[GeneratedCSVHistory] (
    [Id]               BIGINT   IDENTITY (1, 1) NOT NULL,
    [TransactionId]    BIGINT   NULL,
    [GroupId]          BIGINT   NULL,
    [BranchId]         BIGINT   NULL,
    [FinanceCompanyId] BIGINT   NULL,
    [CreatedDate]      DATETIME NULL,
    [ModifiedDate]     DATETIME NULL,
    [CreatedBy]        INT      NULL,
    [MidifiedBy]       INT      NULL,
    CONSTRAINT [GeneratedCSVHistory_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [GeneratedCSVHistory_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [GeneratedCSVHistory_FK_Company] FOREIGN KEY ([FinanceCompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [GeneratedCSVHistory_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [GeneratedCSVHistory_FK_Transaction] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [GeneratedCSVHistory_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GeneratedCSVHistory_FK_UsersMidifiedBy] FOREIGN KEY ([MidifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

