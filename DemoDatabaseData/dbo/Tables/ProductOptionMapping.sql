CREATE TABLE [dbo].[ProductOptionMapping] (
    [Id]                      BIGINT         IDENTITY (1, 1) NOT NULL,
    [ProductOptionId]         BIGINT         NOT NULL,
    [CompanyCompanyTypeMapId] BIGINT         NOT NULL,
    [CompanyProdOptName]      NVARCHAR (100) NULL,
    [CompanyProdOptCode]      NVARCHAR (100) NULL,
    [CountryId]               BIGINT         NULL,
    [IsActive]                BIT            CONSTRAINT [ProductOptionMapping_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]             DATETIME       CONSTRAINT [ProductOptionMapping_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]            DATETIME       NULL,
    [CreatedBy]               INT            NOT NULL,
    [ModifiedBy]              INT            NULL,
    CONSTRAINT [ProductOptionMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [ProductOptionMapping_FK_CompanyCompanyTypeMapping] FOREIGN KEY ([CompanyCompanyTypeMapId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [ProductOptionMapping_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [ProductOptionMapping_FK_ProductOption] FOREIGN KEY ([ProductOptionId]) REFERENCES [dbo].[ProductOption] ([Id]),
    CONSTRAINT [ProductOptionMapping_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ProductOptionMapping_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table map the product option in product admin', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ProductOptionMapping';

