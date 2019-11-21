CREATE TABLE [dbo].[CompanyProductSubTypeMapping] (
    [Id]                        BIGINT         IDENTITY (1, 1) NOT NULL,
    [CompanyId]                 BIGINT         NULL,
    [ProductTypeId]             BIGINT         NULL,
    [ProductSubTypeId]          BIGINT         NULL,
    [IsAccessory]               BIT            NULL,
    [CompanyProductSubTypeName] NVARCHAR (500) NULL,
    [CompanyProductSubTypeCode] NVARCHAR (500) NULL,
    [CountryId]                 BIGINT         NULL,
    [IsActive]                  BIT            NULL,
    [CreatedDate]               DATETIME       NULL,
    [ModifiedDate]              DATETIME       NULL,
    [CreatedBy]                 INT            NULL,
    [ModifiedBy]                INT            NULL,
    CONSTRAINT [CompanyProductSubTypeMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CompanyProductSubTypeMapping_FK_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [CompanyProductSubTypeMapping_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [CompanyProductSubTypeMapping_FK_ProductSubType] FOREIGN KEY ([ProductSubTypeId]) REFERENCES [dbo].[ProductSubType] ([Id]),
    CONSTRAINT [CompanyProductSubTypeMapping_FK_ProductType] FOREIGN KEY ([ProductTypeId]) REFERENCES [dbo].[ProductType] ([Id]),
    CONSTRAINT [CompanyProductSubTypeMapping_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [CompanyProductSubTypeMapping_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

