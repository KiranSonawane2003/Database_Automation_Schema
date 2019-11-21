CREATE TABLE [dbo].[Group] (
    [Id]                         BIGINT          IDENTITY (1, 1) NOT NULL,
    [GroupCode]                  NVARCHAR (100)  NOT NULL,
    [GroupName]                  NVARCHAR (100)  NULL,
    [GroupLogoName]              NVARCHAR (100)  NULL,
    [FSPCompanyId]               BIGINT          NULL,
    [IsOverrideAdviceLicence]    BIT             CONSTRAINT [DF_Group_IsOverrideAdviceLicence] DEFAULT ((0)) NOT NULL,
    [IsJuristicRepresentative]   BIT             CONSTRAINT [DF_Group_IsJuristicRepresentative] DEFAULT ((0)) NOT NULL,
    [ComplaintsOfficerId]        BIGINT          NULL,
    [IsProfessionalIndemnity]    BIT             CONSTRAINT [DF_Group_IsProfessionalIndemnity] DEFAULT ((0)) NOT NULL,
    [IsFidelityGuarantee]        BIT             CONSTRAINT [DF_Group_IsFidelityGuarantee] DEFAULT ((0)) NOT NULL,
    [VatNumber]                  NVARCHAR (100)  NULL,
    [DefaultPrimeAdjustment]     DECIMAL (18, 2) NULL,
    [DefaultFinanceTerm]         INT             NULL,
    [TransactionCharge]          INT             NULL,
    [ServiceFee]                 DECIMAL (18, 2) NULL,
    [ConsultingFee]              DECIMAL (18, 2) NULL,
    [ComplianceFee]              DECIMAL (18, 2) NULL,
    [ServiceTypeId]              BIGINT          NULL,
    [IsSMSFunctionality]         BIT             CONSTRAINT [Group_DF_\SMSFunctionality] DEFAULT ((0)) NOT NULL,
    [SLASignatureDate]           DATE            NULL,
    [PayoverJobId]               BIGINT          NULL,
    [AccountManagerId]           INT             NULL,
    [MarketerId]                 INT             NULL,
    [ApprovalUserProductsId]     INT             NULL,
    [ApprovalUserOtherId]        INT             NULL,
    [IsEditableAccessoryPayover] BIT             CONSTRAINT [DF_Group_IsEditableAccessoryPayover] DEFAULT ((0)) NOT NULL,
    [FloorplanProviderId]        BIGINT          NULL,
    [Workflow]                   BIGINT          NULL,
    [TSFDefaultPrice]            DECIMAL (18, 2) NULL,
    [StartDate]                  DATE            NOT NULL,
    [EndDate]                    DATE            NOT NULL,
    [CountryId]                  BIGINT          NULL,
    [IsActive]                   BIT             CONSTRAINT [Group_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]                DATETIME        CONSTRAINT [Group_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]               DATETIME        NULL,
    [CreatedBy]                  INT             NOT NULL,
    [ModifiedBy]                 INT             NULL,
    [HFADocumentDescription]     NVARCHAR (MAX)  NULL,
    [IsEnableEmiratesIDCard]     BIT             NULL,
    CONSTRAINT [Group_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [Group_FK_CompanyCompanyTypeMapId] FOREIGN KEY ([FloorplanProviderId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [Group_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [Group_FK_FSPCompany] FOREIGN KEY ([FSPCompanyId]) REFERENCES [dbo].[FSPCompany] ([Id]),
    CONSTRAINT [Group_FK_FSPPerson] FOREIGN KEY ([ComplaintsOfficerId]) REFERENCES [dbo].[FSPPerson] ([Id]),
    CONSTRAINT [Group_FK_PayoverJob] FOREIGN KEY ([PayoverJobId]) REFERENCES [dbo].[PayoverJob] ([Id]),
    CONSTRAINT [Group_FK_ServiceType] FOREIGN KEY ([ServiceTypeId]) REFERENCES [dbo].[ServiceType] ([Id]),
    CONSTRAINT [Group_FK_UsersAccountManager] FOREIGN KEY ([AccountManagerId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Group_FK_UsersApprovalUserOther] FOREIGN KEY ([ApprovalUserOtherId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Group_FK_UsersApprovalUserProduct] FOREIGN KEY ([ApprovalUserProductsId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Group_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Group_FK_UsersMarketer] FOREIGN KEY ([MarketerId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Group_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores the group information. having relationship with FSPCompany, FSPPerson, PayoverJob and ServiceType tables.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Group';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Type Id is used to fill dropdown of ServiceType on Creategroup page under Administration >> Group. Is foreign key from table ServiceType', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'ServiceTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Type Id is used to fill dropdown of Payover Job Name on Creategroup page under Administration >> Group, Is Foreign key from table PayoverJob', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'PayoverJobId';

