﻿CREATE TABLE [dbo].[ProductOptionCompanies] (
    [Id]                       BIGINT         IDENTITY (1, 1) NOT NULL,
    [ProductOptionId]          BIGINT         NULL,
    [CompanyTypeId]            BIGINT         NULL,
    [CompanyId]                BIGINT         NULL,
    [CompanyProductOptionName] NVARCHAR (500) NULL,
    [CompanyProductOptionCode] NVARCHAR (500) NULL,
    [IsAccessory]              BIT            NULL,
    [IsBulking]                BIT            NULL,
    [IsEnforceBulking]         BIT            NULL,
    [IsBankProduct]            BIT            NULL,
    [IsRegulated]              BIT            NULL,
    [CountryId]                BIGINT         NULL,
    [IsActive]                 BIT            NULL,
    [CreatedDate]              DATETIME       NULL,
    [ModifiedDate]             DATETIME       NULL,
    [CreatedBy]                INT            NULL,
    [ModifiedBy]               INT            NULL,
    CONSTRAINT [ProductOptionCompanies_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [ProductOptionCompanies_FK_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [ProductOptionCompanies_FK_CompanyType] FOREIGN KEY ([CompanyTypeId]) REFERENCES [dbo].[CompanyType] ([Id]),
    CONSTRAINT [ProductOptionCompanies_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [ProductOptionCompanies_FK_ProductOption] FOREIGN KEY ([ProductOptionId]) REFERENCES [dbo].[ProductOption] ([Id]),
    CONSTRAINT [ProductOptionCompanies_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ProductOptionCompanies_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

