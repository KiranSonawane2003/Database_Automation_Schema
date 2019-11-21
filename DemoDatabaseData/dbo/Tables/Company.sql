CREATE TABLE [dbo].[Company] (
    [Id]                          BIGINT         IDENTITY (1, 1) NOT NULL,
    [CompanyCode]                 NVARCHAR (100) NOT NULL,
    [CompanyName]                 NVARCHAR (MAX) NOT NULL,
    [CompanyLogo]                 NVARCHAR (200) NULL,
    [FinanceCompanyName]          NVARCHAR (MAX) NULL,
    [InvoiceGenerator]            INT            NULL,
    [QuoteValidityDays]           INT            NULL,
    [WorkingDays]                 INT            NULL,
    [IsRecurringDebitDay]         BIT            CONSTRAINT [Company_DF_RecurringDebitDay] DEFAULT ((0)) NOT NULL,
    [IsEditableFirstDebitAmount]  BIT            CONSTRAINT [Company_DF_EditableFirstDebitAmount] DEFAULT ((0)) NOT NULL,
    [ParentCompanyId]             BIGINT         NULL,
    [LegalName]                   NVARCHAR (200) NULL,
    [RequirementTemplateId]       BIGINT         NULL,
    [LeadEmail]                   NVARCHAR (MAX) NULL,
    [AutomatedLeadEmail]          NVARCHAR (MAX) NULL,
    [IsVATVendor]                 BIT            CONSTRAINT [Company_DF_VATVendor] DEFAULT ((0)) NOT NULL,
    [VATNumber]                   NVARCHAR (100) NULL,
    [CompanyRegNo]                NVARCHAR (100) NULL,
    [FSPCompanyId]                BIGINT         NULL,
    [NCRRegistrationNumber]       NVARCHAR (100) NULL,
    [IsJuristicRepresentative]    BIT            CONSTRAINT [Company_DF_JuristicRepresentativ] DEFAULT ((0)) NOT NULL,
    [NCRRegNo]                    NVARCHAR (100) NULL,
    [SLASignDate]                 DATE           NULL,
    [CompanyEmail]                NVARCHAR (MAX) NULL,
    [RemittanceEmail]             NVARCHAR (MAX) NULL,
    [AltRemittanceEmail]          NVARCHAR (MAX) NULL,
    [Phone]                       NVARCHAR (100) NULL,
    [Fax]                         NVARCHAR (100) NULL,
    [PhyAddCountryId]             BIGINT         NULL,
    [PostAddCountryId]            BIGINT         NULL,
    [CountryId]                   BIGINT         NULL,
    [IsActive]                    BIT            CONSTRAINT [Company_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]                 DATETIME       CONSTRAINT [Company_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]                DATETIME       NULL,
    [CreatedBy]                   INT            NOT NULL,
    [ModifiedBy]                  INT            NULL,
    [BrochureDocumentName]        NVARCHAR (200) NULL,
    [BrochureDocumentPath]        NVARCHAR (500) NULL,
    [PhyAddBuildingName]          NVARCHAR (200) NULL,
    [PhyAddStreetName]            NVARCHAR (200) NULL,
    [PhyAddFloorNo]               INT            NULL,
    [PhyAddNearestLandmark]       NVARCHAR (200) NULL,
    [PhyAddYearsAtCurrentAddress] INT            NULL,
    [PhyAddEmirate]               BIGINT         NULL,
    [PostAddPOBoxNo]              NVARCHAR (200) NULL,
    [PostAddEmirate]              BIGINT         NULL,
    [PhyAdd1]                     NVARCHAR (200) NULL,
    [PhyAdd2]                     NVARCHAR (200) NULL,
    [PhyAdd3]                     NVARCHAR (200) NULL,
    [PostAdd1]                    NVARCHAR (200) NULL,
    [PostAdd2]                    NVARCHAR (200) NULL,
    [PostAdd3]                    NVARCHAR (200) NULL,
    [CompanyPassword]             NVARCHAR (500) NULL,
    [SendFinanceApplicationEmail] BIT            NULL,
    [AttachFinanceDocumentEmail]  BIT            NULL,
    [ShowFinAppHistory]           BIT            NULL,
    [IsDocumentProtected]         BIT            NULL,
    [DocumentPassword]            NVARCHAR (MAX) NULL,
    [IsEBankIntegration]          BIT            NULL,
    CONSTRAINT [Company_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [Company_FK_CompanyParentCompany] FOREIGN KEY ([ParentCompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [Company_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [Company_FK_FSPCompany] FOREIGN KEY ([FSPCompanyId]) REFERENCES [dbo].[FSPCompany] ([Id]),
    CONSTRAINT [Company_FK_Template] FOREIGN KEY ([RequirementTemplateId]) REFERENCES [dbo].[Template] ([Id]),
    CONSTRAINT [Company_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Company_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_Company_Country] FOREIGN KEY ([PhyAddCountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_Company_Country1] FOREIGN KEY ([PostAddCountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_Company_StaticValue] FOREIGN KEY ([PhyAddEmirate]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_Company_StaticValue1] FOREIGN KEY ([PostAddEmirate]) REFERENCES [dbo].[StaticValue] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores the information of Company. Will fill by create company page.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Company';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key from table FSPCompany. Will fill the FSP Company Dropdown of Create Company under Administration >> Company Admin>> Create company.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Company', @level2type = N'COLUMN', @level2name = N'FSPCompanyId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key from table Country. Will fill the Physical Address Country Dropdown of Create Company under Administration >> Company Admin>> Create company.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Company', @level2type = N'COLUMN', @level2name = N'PhyAddCountryId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key from table Country. Will fill the Postal Address Country Dropdown of Create Company under Administration >> Company Admin>> Create company.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Company', @level2type = N'COLUMN', @level2name = N'PostAddCountryId';

