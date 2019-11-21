CREATE TABLE [dbo].[TransactionFinanceStatusView] (
    [Id]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [TemplateCategoryId] BIGINT         NULL,
    [GroupingName]       NVARCHAR (200) NULL,
    [CountryId]          BIGINT         NULL,
    [CreatedDate]        DATETIME       NULL,
    [ModifiedDate]       DATETIME       NULL,
    [CreatedBy]          INT            NULL,
    [ModifiedBy]         INT            NULL,
    [IsActive]           BIT            NOT NULL,
    CONSTRAINT [PK_TransactionFinanceStatusView] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransactionFinanceStatusView_TemplateCategory] FOREIGN KEY ([TemplateCategoryId]) REFERENCES [dbo].[TemplateCategory] ([Id]),
    CONSTRAINT [FK_TransactionFinanceStatusView_Users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_TransactionFinanceStatusView_Users1] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

