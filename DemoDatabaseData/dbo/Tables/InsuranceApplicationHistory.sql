CREATE TABLE [dbo].[InsuranceApplicationHistory] (
    [Id]                             BIGINT          IDENTITY (1, 1) NOT NULL,
    [InsuranceApplicationId]         BIGINT          NULL,
    [ProductTypeId]                  BIGINT          NULL,
    [ProductSubTypeId]               BIGINT          NULL,
    [LeadSentDate]                   DATETIME        CONSTRAINT [DF_InsuranceApplicationHistory_LeadSentDate] DEFAULT (getutcdate()) NULL,
    [InsuranceApplicationReportPath] NVARCHAR (2000) NULL,
    [StartDate]                      DATETIME        NULL,
    [ToDate]                         DATETIME        NULL,
    [GeneralNote]                    NVARCHAR (MAX)  NULL,
    [ContactNote]                    NVARCHAR (MAX)  NULL,
    [CompanyCompanyTypeId]           BIGINT          NULL,
    [LeadEmailAddress]               NVARCHAR (MAX)  NULL,
    CONSTRAINT [InsuranceApplicationHistory_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [InsuranceApplicationHistory_FK_CompanyCompanyTypeMappingCompanyId] FOREIGN KEY ([CompanyCompanyTypeId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [InsuranceApplicationHistory_FK_ProductSubType] FOREIGN KEY ([ProductSubTypeId]) REFERENCES [dbo].[ProductSubType] ([Id]),
    CONSTRAINT [InsuranceApplicationHistory_FK_ProductType] FOREIGN KEY ([ProductTypeId]) REFERENCES [dbo].[ProductType] ([Id]),
    CONSTRAINT [InsuranceApplicationHistory_FK_TransactionInsuranceApplication] FOREIGN KEY ([InsuranceApplicationId]) REFERENCES [dbo].[TransactionInsuranceApplication] ([Id])
);

