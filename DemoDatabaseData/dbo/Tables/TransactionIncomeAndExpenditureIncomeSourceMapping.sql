CREATE TABLE [dbo].[TransactionIncomeAndExpenditureIncomeSourceMapping] (
    [Id]                                BIGINT   IDENTITY (1, 1) NOT NULL,
    [TransactionIncomeAndExpenditureId] BIGINT   NULL,
    [IncomeSourceId]                    BIGINT   NULL,
    [IsActive]                          BIT      CONSTRAINT [DF_TransactionIncomeAndExpenditureIncomeSourceMapping_IsActive] DEFAULT ((1)) NULL,
    [CreatedDate]                       DATETIME CONSTRAINT [DF_TransactionIncomeAndExpenditureIncomeSourceMapping_CreatedDate] DEFAULT (getutcdate()) NULL,
    [ModifiedDate]                      DATETIME NULL,
    [CreatedBy]                         INT      NULL,
    [ModifiedBy]                        INT      NULL,
    CONSTRAINT [PK_TransactionIncomeAndExpenditureIncomeSourceMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransactionIncomeAndExpenditureIncomeSourceMapping_StaticValue] FOREIGN KEY ([IncomeSourceId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_TransactionIncomeAndExpenditureIncomeSourceMapping_TransactionIncomeAndExpenditure] FOREIGN KEY ([TransactionIncomeAndExpenditureId]) REFERENCES [dbo].[TransactionIncomeAndExpenditure] ([Id]),
    CONSTRAINT [FK_TransactionIncomeAndExpenditureIncomeSourceMapping_Users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_TransactionIncomeAndExpenditureIncomeSourceMapping_Users1] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

