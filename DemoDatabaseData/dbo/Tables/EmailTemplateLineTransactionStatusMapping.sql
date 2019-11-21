CREATE TABLE [dbo].[EmailTemplateLineTransactionStatusMapping] (
    [Id]                  BIGINT   IDENTITY (1, 1) NOT NULL,
    [TemplateLineId]      BIGINT   NOT NULL,
    [TransactionStatusId] BIGINT   NULL,
    [IsActive]            BIT      CONSTRAINT [DF__EmailTemp__IsAct__2459A0F5] DEFAULT ((1)) NULL,
    [CreatedDate]         DATETIME CONSTRAINT [DF__EmailTemp__Creat__254DC52E] DEFAULT (getutcdate()) NULL,
    [ModifiedDate]        DATETIME NULL,
    [CreatedBy]           INT      NULL,
    [ModifiedBy]          INT      NULL,
    CONSTRAINT [EmailTemplateLineTransactionStatusMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [EmailTemplateLineTransactionStatusMapping_FK_TemplateLineId] FOREIGN KEY ([TemplateLineId]) REFERENCES [dbo].[EmailTemplateLine] ([Id]),
    CONSTRAINT [EmailTemplateLineTransactionStatusMapping_FK_TransactionStatusId] FOREIGN KEY ([TransactionStatusId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [EmailTemplateLineTransactionStatusMapping_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [EmailTemplateLineTransactionStatusMapping_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

