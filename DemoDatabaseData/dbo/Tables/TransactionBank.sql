CREATE TABLE [dbo].[TransactionBank] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [BankName]     NVARCHAR (500) NOT NULL,
    [Abbreviation] NVARCHAR (50)  NULL,
    [CountryId]    BIGINT         NULL,
    [IsActive]     BIT            CONSTRAINT [DF_TransactionBank_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]  DATETIME       CONSTRAINT [DF_TransactionBank_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [CreatedBy]    INT            NOT NULL,
    [ModifiedBy]   INT            NULL,
    CONSTRAINT [PK_TransactionBank] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransactionBank_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_TransactionBank_Users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_TransactionBank_Users1] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

