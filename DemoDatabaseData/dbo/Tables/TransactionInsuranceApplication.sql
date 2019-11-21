CREATE TABLE [dbo].[TransactionInsuranceApplication] (
    [Id]                    BIGINT          IDENTITY (1, 1) NOT NULL,
    [TransactionId]         BIGINT          NOT NULL,
    [InsuranceCompanyId]    BIGINT          NOT NULL,
    [ContactNote]           NVARCHAR (500)  NULL,
    [GeneralNote]           NVARCHAR (500)  NULL,
    [TotalInsuranceAmount]  DECIMAL (18, 2) NULL,
    [CountryId]             BIGINT          NULL,
    [IsActive]              BIT             CONSTRAINT [DF_TransactionInsuranceApplication_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]           DATETIME        CONSTRAINT [DF_TransactionInsuranceApplication_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]          DATETIME        NULL,
    [CreatedBy]             INT             NOT NULL,
    [Modifiedby]            INT             NULL,
    [ProductTypeId]         BIGINT          NULL,
    [ProductSubTypeId]      BIGINT          NULL,
    [IsLeadSent]            BIT             NULL,
    [LeadSentDate]          DATETIME        NULL,
    [PeriodOfInsuranceFrom] DATE            NULL,
    [PeriodOfInsuranceTo]   DATE            NULL,
    CONSTRAINT [TransactionInsuranceApplication_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [TransactionInsuranceApplication_FK_CompanyCompanyTypeMapping] FOREIGN KEY ([InsuranceCompanyId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [TransactionInsuranceApplication_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [TransactionInsuranceApplication_FK_ProductSubType] FOREIGN KEY ([ProductSubTypeId]) REFERENCES [dbo].[ProductSubType] ([Id]),
    CONSTRAINT [TransactionInsuranceApplication_FK_ProductType] FOREIGN KEY ([ProductTypeId]) REFERENCES [dbo].[ProductType] ([Id]),
    CONSTRAINT [TransactionInsuranceApplication_FK_Transaction] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [TransactionInsuranceApplication_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [TransactionInsuranceApplication_FK_UsersModifiedBy] FOREIGN KEY ([Modifiedby]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores the insurance applicationDetails.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TransactionInsuranceApplication';

