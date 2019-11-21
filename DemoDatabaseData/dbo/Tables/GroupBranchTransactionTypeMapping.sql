CREATE TABLE [dbo].[GroupBranchTransactionTypeMapping] (
    [Id]                BIGINT   IDENTITY (1, 1) NOT NULL,
    [GroupId]           BIGINT   NULL,
    [GroupLineId]       BIGINT   NULL,
    [BranchId]          BIGINT   NULL,
    [BranchLineId]      BIGINT   NULL,
    [TransactionTypeId] BIGINT   NULL,
    [IsActive]          BIT      CONSTRAINT [DF__GroupBran__IsAct__0E3F774D] DEFAULT ((1)) NOT NULL,
    [CreatedBy]         INT      NULL,
    [ModifiedBy]        INT      NULL,
    [CreatedDate]       DATETIME CONSTRAINT [DF__GroupBran__Creat__0F339B86] DEFAULT (getutcdate()) NULL,
    [ModifiedDate]      DATETIME NULL,
    CONSTRAINT [GroupBranchTransactionTypeMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [GroupBranchTransactionTypeMapping_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [GroupBranchTransactionTypeMapping_FK_BranchLine] FOREIGN KEY ([BranchLineId]) REFERENCES [dbo].[BranchLine] ([Id]),
    CONSTRAINT [GroupBranchTransactionTypeMapping_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [GroupBranchTransactionTypeMapping_FK_GroupLine] FOREIGN KEY ([GroupLineId]) REFERENCES [dbo].[GroupLine] ([Id]),
    CONSTRAINT [GroupBranchTransactionTypeMapping_FK_StaticValue] FOREIGN KEY ([TransactionTypeId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [GroupBranchTransactionTypeMapping_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupBranchTransactionTypeMapping_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

