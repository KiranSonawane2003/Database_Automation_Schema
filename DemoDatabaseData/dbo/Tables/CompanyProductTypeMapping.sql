CREATE TABLE [dbo].[CompanyProductTypeMapping] (
    [Id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [CompanyId]              BIGINT         NULL,
    [ProductTypeId]          BIGINT         NULL,
    [IsAccessory]            BIT            NULL,
    [CompanyProductTypeName] NVARCHAR (500) NULL,
    [CompanyProductTypeCode] NVARCHAR (500) NULL,
    [CountryId]              BIGINT         NULL,
    [IsActive]               BIT            NULL,
    [CreatedDate]            DATETIME       NULL,
    [ModifiedDate]           DATETIME       NULL,
    [CreatedBy]              INT            NULL,
    [ModifiedBy]             INT            NULL,
    CONSTRAINT [CompanyProductTypeMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CompanyProductTypeMapping_FK_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [CompanyProductTypeMapping_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [CompanyProductTypeMapping_FK_ProductType] FOREIGN KEY ([ProductTypeId]) REFERENCES [dbo].[ProductType] ([Id]),
    CONSTRAINT [CompanyProductTypeMapping_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [CompanyProductTypeMapping_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

