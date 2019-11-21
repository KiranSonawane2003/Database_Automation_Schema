CREATE TABLE [dbo].[BranchCompanyTypeMapping] (
    [Id]              BIGINT IDENTITY (1, 1) NOT NULL,
    [BranchCompanyId] BIGINT NOT NULL,
    [CompanyId]       BIGINT NOT NULL,
    [CompanyTypeId]   BIGINT NOT NULL,
    [IsActive]        BIT    NOT NULL,
    CONSTRAINT [PK_BranchCompanyTypeMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_BranchCompanyTypeMapping_BranchCompanies] FOREIGN KEY ([BranchCompanyId]) REFERENCES [dbo].[BranchCompanies] ([Id]),
    CONSTRAINT [FK_BranchCompanyTypeMapping_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [FK_BranchCompanyTypeMapping_CompanyType] FOREIGN KEY ([CompanyTypeId]) REFERENCES [dbo].[CompanyType] ([Id])
);

