CREATE TABLE [dbo].[FinanceTerm] (
    [Id]              BIGINT IDENTITY (1, 1) NOT NULL,
    [FinanceTermName] BIGINT NOT NULL,
    [CountryId]       BIGINT NULL,
    [SortOrder]       INT    NULL,
    CONSTRAINT [FinanceTerm_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FinanceTerm_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id])
);

