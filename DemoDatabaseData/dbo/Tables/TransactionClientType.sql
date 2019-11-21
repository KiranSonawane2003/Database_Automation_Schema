CREATE TABLE [dbo].[TransactionClientType] (
    [Id]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [ClientTypeName] NVARCHAR (200) NOT NULL,
    [CountryId]      BIGINT         NULL,
    [IsActive]       BIT            CONSTRAINT [DF_TransactionClientType_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]    DATETIME       CONSTRAINT [DF_TransactionClientType_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [CreatedBy]      INT            NOT NULL,
    [ModifiedBy]     INT            NULL,
    CONSTRAINT [PK_TransactionClientType] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransactionClientType_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_TransactionClientType_Users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_TransactionClientType_Users1] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

