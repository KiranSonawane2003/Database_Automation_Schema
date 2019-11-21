CREATE TABLE [dbo].[FinanceStatus] (
    [Id]                BIGINT         IDENTITY (1, 1) NOT NULL,
    [FinanceStatusName] NVARCHAR (200) NOT NULL,
    [CountryId]         BIGINT         NULL,
    [IsActive]          BIT            CONSTRAINT [FinanceStatus_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]       DATETIME       CONSTRAINT [FinanceStatus_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]      DATETIME       NULL,
    [CreatedBy]         INT            NOT NULL,
    [ModifiedBy]        INT            NULL,
    CONSTRAINT [FinanceStatus_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FinanceStatus_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FinanceStatus_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FinanceStatus_FK_UsersModififedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is master table for finance status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'FinanceStatus';

