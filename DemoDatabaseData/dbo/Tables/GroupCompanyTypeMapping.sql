CREATE TABLE [dbo].[GroupCompanyTypeMapping] (
    [Id]             BIGINT IDENTITY (1, 1) NOT NULL,
    [GroupCompanyId] BIGINT NOT NULL,
    [CompanyId]      BIGINT NOT NULL,
    [CompanyTypeId]  BIGINT NOT NULL,
    [IsActive]       BIT    NOT NULL,
    CONSTRAINT [GroupCompanyTypeMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GroupCompanyTypeMapping_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [FK_GroupCompanyTypeMapping_CompanyType] FOREIGN KEY ([CompanyTypeId]) REFERENCES [dbo].[CompanyType] ([Id]),
    CONSTRAINT [FK_GroupCompanyTypeMapping_GroupCompanies] FOREIGN KEY ([GroupCompanyId]) REFERENCES [dbo].[GroupCompanies] ([Id])
);

