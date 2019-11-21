CREATE TABLE [dbo].[GroupLine] (
    [Id]                         BIGINT         IDENTITY (1, 1) NOT NULL,
    [GroupId]                    BIGINT         NOT NULL,
    [DefaultFSPCompanyId]        BIGINT         NULL,
    [IsJuristicRepresentative]   BIT            CONSTRAINT [GroupLine_DF_JuristicRepresentative] DEFAULT ((0)) NOT NULL,
    [IsOverrideAdviceLicence]    BIT            CONSTRAINT [GroupLine_DF_OverrideAdviceLicence] DEFAULT ((0)) NOT NULL,
    [ComplaintsOfficerId]        BIGINT         NULL,
    [IsProfessionalIndemnity]    BIT            CONSTRAINT [GroupLine_DF_ProfessionalIndemnity] DEFAULT ((0)) NOT NULL,
    [IsFidelityGuarantee]        BIT            CONSTRAINT [GroupLine_DF_FidelityGuarantee] DEFAULT ((0)) NOT NULL,
    [VATNumber]                  NVARCHAR (50)  NULL,
    [CompanyRegNumber]           NVARCHAR (50)  NULL,
    [RegisteredName]             NVARCHAR (100) NULL,
    [AccountManagerId]           INT            NULL,
    [MarketerId]                 INT            NULL,
    [ApprovalUserProductsId]     INT            NULL,
    [ApprovalUserOtherId]        INT            NULL,
    [FinancialManagerId]         INT            NULL,
    [IsEditableAccessoryPayover] BIT            CONSTRAINT [GroupLine_DF_EditableAccessoryPayover] DEFAULT ((0)) NOT NULL,
    [FloorplanProviderId]        BIGINT         NULL,
    [StartDate]                  DATE           NOT NULL,
    [EndDate]                    DATE           NOT NULL,
    [CountryId]                  BIGINT         NULL,
    [IsActive]                   BIT            CONSTRAINT [GroupLine_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]                DATETIME       CONSTRAINT [GroupLine_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]               DATETIME       NULL,
    [CreatedBy]                  INT            NOT NULL,
    [ModifiedBy]                 INT            NULL,
    [IsVehicle]                  BIT            NULL,
    [IsFleet]                    BIT            NULL,
    [IsAfterMarket]              BIT            NULL,
    [IsUnsecured]                BIT            NULL,
    [TransactionTypeID]          BIGINT         NULL,
    CONSTRAINT [GroupLine_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GroupLine_TransactionTypeID] FOREIGN KEY ([TransactionTypeID]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [GroupLine_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [GroupLine_FK_FSPCompany] FOREIGN KEY ([DefaultFSPCompanyId]) REFERENCES [dbo].[FSPCompany] ([Id]),
    CONSTRAINT [GroupLine_FK_FSPPerson] FOREIGN KEY ([ComplaintsOfficerId]) REFERENCES [dbo].[FSPPerson] ([Id]),
    CONSTRAINT [GroupLine_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [GroupLine_FK_UsersAccountManager] FOREIGN KEY ([AccountManagerId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupLine_FK_UsersApprovalUserOther] FOREIGN KEY ([ApprovalUserOtherId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupLine_FK_UsersApprovalUserProduct] FOREIGN KEY ([ApprovalUserProductsId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupLine_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupLine_FK_UsersFinancialManager] FOREIGN KEY ([FinancialManagerId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupLine_FK_UsersMarketer] FOREIGN KEY ([MarketerId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupLine_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is use to store info from group line pag under Admin >> Group admin >> Edit Group', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'GroupLine';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table Group', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'GroupLine', @level2type = N'COLUMN', @level2name = N'GroupId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table FSPCompany', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'GroupLine', @level2type = N'COLUMN', @level2name = N'DefaultFSPCompanyId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table FSPPerson', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'GroupLine', @level2type = N'COLUMN', @level2name = N'ComplaintsOfficerId';

