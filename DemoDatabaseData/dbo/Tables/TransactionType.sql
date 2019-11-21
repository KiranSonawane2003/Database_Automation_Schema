CREATE TABLE [dbo].[TransactionType] (
    [Id]                  BIGINT         IDENTITY (1, 1) NOT NULL,
    [TransactionTypeName] NVARCHAR (100) NOT NULL,
    [CountryId]           BIGINT         NULL,
    [IsActive]            BIT            CONSTRAINT [TransactionType_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]         DATETIME       CONSTRAINT [TransactionType_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]        DATETIME       NULL,
    [CreatedBy]           INT            NOT NULL,
    [ModifiedBy]          INT            NULL,
    CONSTRAINT [TransactionType_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [TransactionType_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [TransactionType_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [TransactionType_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is master for Transaction Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TransactionType';

