CREATE TABLE [dbo].[TransactionStatus] (
    [Id]                    BIGINT         IDENTITY (1, 1) NOT NULL,
    [TransactionStatusName] NVARCHAR (100) NOT NULL,
    [CountryId]             BIGINT         NULL,
    [IsActive]              BIT            CONSTRAINT [TransactionStatus_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]           DATETIME       CONSTRAINT [TransactionStatus_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]          DATETIME       NULL,
    [CreatedBy]             INT            NOT NULL,
    [ModifiedBy]            INT            NULL,
    CONSTRAINT [TransactionStatus_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [TransactionStatus_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [TransactionStatus_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [TransactionStatus_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is master for Transaction Status.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TransactionStatus';

