CREATE TABLE [dbo].[TransactionFinanceStatusMapping] (
    [Id]                BIGINT         IDENTITY (1, 1) NOT NULL,
    [CountryId]         BIGINT         NULL,
    [FinanceStatusId]   BIGINT         NULL,
    [FinanceStatusName] NVARCHAR (200) NULL,
    [SortOrder]         INT            NULL,
    [IsActive]          BIT            NULL,
    CONSTRAINT [PK_TransactionFinanceStatusMapping] PRIMARY KEY CLUSTERED ([Id] ASC)
);

