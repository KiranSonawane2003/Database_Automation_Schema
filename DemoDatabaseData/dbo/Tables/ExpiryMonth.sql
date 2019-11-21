CREATE TABLE [dbo].[ExpiryMonth] (
    [Id]        BIGINT IDENTITY (1, 1) NOT NULL,
    [Month]     INT    NULL,
    [CountryId] BIGINT NULL,
    [SortOrder] INT    NULL,
    CONSTRAINT [PK_ExpiryMonth] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ExpiryMonth_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id])
);

