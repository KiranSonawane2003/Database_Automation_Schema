CREATE TABLE [dbo].[ProductCompanyTypeMapping] (
    [Id]               BIGINT IDENTITY (1, 1) NOT NULL,
    [ProductCompanyId] BIGINT NOT NULL,
    [CompanyId]        BIGINT NOT NULL,
    [CompanyTypeId]    BIGINT NOT NULL,
    [IsActive]         BIT    NOT NULL,
    CONSTRAINT [PK_ProductCompanyTypeMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ProductCompanyTypeMapping_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [FK_ProductCompanyTypeMapping_CompanyType] FOREIGN KEY ([CompanyTypeId]) REFERENCES [dbo].[CompanyType] ([Id]),
    CONSTRAINT [FK_ProductCompanyTypeMapping_ProductCompanies] FOREIGN KEY ([ProductCompanyId]) REFERENCES [dbo].[ProductCompanies] ([Id])
);

