CREATE TABLE [dbo].[TransactionStatusTest] (
    [Id]                BIGINT         IDENTITY (1, 1) NOT NULL,
    [CountryId]         BIGINT         NOT NULL,
    [FinanceStatusId]   BIGINT         NOT NULL,
    [FinanceStatusName] NVARCHAR (200) NULL,
    [SortOrder]         INT            NULL,
    [IsActive]          BIT            NULL
);

