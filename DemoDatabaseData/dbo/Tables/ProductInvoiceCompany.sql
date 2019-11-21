CREATE TABLE [dbo].[ProductInvoiceCompany] (
    [Id]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [ProductId]      BIGINT         NOT NULL,
    [InvoiceCompany] NVARCHAR (100) NOT NULL,
    [CountryId]      BIGINT         NULL,
    [IsActive]       BIT            CONSTRAINT [ProductInvoiceCompany_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]    DATETIME       CONSTRAINT [ProductInvoiceCompany_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [CreatedBy]      INT            NOT NULL,
    [ModifiedBy]     INT            NULL,
    CONSTRAINT [ProductInvoiceCompany_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [ProductInvoiceCompany_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [ProductInvoiceCompany_FK_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id]),
    CONSTRAINT [ProductInvoiceCompany_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ProductInvoiceCompany_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is master for Invoice Company.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ProductInvoiceCompany';

