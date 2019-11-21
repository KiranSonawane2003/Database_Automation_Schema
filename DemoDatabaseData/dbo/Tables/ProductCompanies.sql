CREATE TABLE [dbo].[ProductCompanies] (
    [Id]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [ProductId]          BIGINT         NOT NULL,
    [CompanyId]          BIGINT         NOT NULL,
    [IsBulking]          BIT            CONSTRAINT [ProductCompanyMapping_DF_Bulking] DEFAULT ((0)) NOT NULL,
    [IsBankProduct]      BIT            CONSTRAINT [ProductCompanyMapping_DF_BankProduct] DEFAULT ((0)) NOT NULL,
    [IsRegulated]        BIT            CONSTRAINT [ProductCompanyMapping_DF_Regulated] DEFAULT ((0)) NOT NULL,
    [CompanyProductName] NVARCHAR (100) NULL,
    [CompanyProductCode] NVARCHAR (100) NULL,
    [IsAccessory]        BIT            NULL,
    [IsEnforceBulking]   BIT            NULL,
    [CountryId]          BIGINT         NULL,
    [IsActive]           BIT            CONSTRAINT [ProductCompanyMapping_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]        DATETIME       CONSTRAINT [ProductCompanyMapping_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]       DATETIME       NULL,
    [CreatedBy]          INT            NOT NULL,
    [ModifiedBy]         INT            NULL,
    [CompanyTypeId]      BIGINT         NULL,
    CONSTRAINT [ProductCompanyMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ProductCompanyMapping_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [ProductCompanies_FK_CompanyType] FOREIGN KEY ([CompanyTypeId]) REFERENCES [dbo].[CompanyType] ([Id]),
    CONSTRAINT [ProductCompanyMapping_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [ProductCompanyMapping_FK_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id]),
    CONSTRAINT [ProductCompanyMapping_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ProductCompanyMapping_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table mpa comany to product.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ProductCompanies';

