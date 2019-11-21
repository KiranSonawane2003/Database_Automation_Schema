CREATE TABLE [dbo].[BranchLine] (
    [Id]                          BIGINT          IDENTITY (1, 1) NOT NULL,
    [GroupId]                     BIGINT          NOT NULL,
    [BranchId]                    BIGINT          NOT NULL,
    [FSPCompanyId]                BIGINT          NULL,
    [IsJuristicRepresentative]    BIT             CONSTRAINT [BranchLine_DF_JuristicRepresentative] DEFAULT ((0)) NOT NULL,
    [ComplaintsOfficerId]         BIGINT          NULL,
    [VATNumber]                   NVARCHAR (100)  NULL,
    [CompanyRegNumber]            NVARCHAR (100)  NULL,
    [RegisteredName]              NVARCHAR (200)  NULL,
    [PhyAddCountryId]             BIGINT          NULL,
    [PostAddCountryId]            BIGINT          NULL,
    [BranchEmail]                 VARCHAR (100)   NULL,
    [AccountsEmail]               NVARCHAR (100)  NULL,
    [RemittanceEmail]             NVARCHAR (100)  NULL,
    [AlternativeRemittanceEmail]  NVARCHAR (100)  NULL,
    [Phone]                       NVARCHAR (100)  NULL,
    [Fax]                         NVARCHAR (100)  NULL,
    [MarketerId]                  BIGINT          NULL,
    [ApprovalUserProductsId]      BIGINT          NULL,
    [ApprovalUserOtherId]         BIGINT          NULL,
    [FinancialManagerId]          BIGINT          NULL,
    [DealerPrincipalId]           BIGINT          NULL,
    [StartDate]                   DATE            NOT NULL,
    [EndDate]                     DATE            NOT NULL,
    [CountryId]                   BIGINT          NULL,
    [IsActive]                    BIT             CONSTRAINT [BranchLine_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]                 DATETIME        CONSTRAINT [BranchLine_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]                DATETIME        NULL,
    [CreatedBy]                   INT             NOT NULL,
    [ModifiedBy]                  INT             NULL,
    [PhyAddBuildingName]          NVARCHAR (200)  NULL,
    [PhyAddStreetName]            NVARCHAR (200)  NULL,
    [PhyAddFloorNo]               INT             NULL,
    [PhyAddNearestLandmark]       NVARCHAR (200)  NULL,
    [PhyAddYearsAtCurrentAddress] INT             NULL,
    [PhyAddEmirate]               BIGINT          NULL,
    [PostAddPOBoxNo]              NVARCHAR (200)  NULL,
    [PostAddEmirate]              BIGINT          NULL,
    [PhyAdd1]                     NVARCHAR (200)  NULL,
    [PhyAdd2]                     NVARCHAR (200)  NULL,
    [PhyAdd3]                     NVARCHAR (200)  NULL,
    [PostAdd1]                    NVARCHAR (200)  NULL,
    [PostAdd2]                    NVARCHAR (200)  NULL,
    [PostAdd3]                    NVARCHAR (200)  NULL,
    [IsVehicle]                   BIT             NULL,
    [IsFleet]                     BIT             NULL,
    [IsAfterMarket]               BIT             NULL,
    [IsUnsecured]                 BIT             NULL,
    [TransactionTypeID]           BIGINT          NULL,
    [HFAVehicleURL]               NVARCHAR (4000) NULL,
    [HFAItemsURL]                 NVARCHAR (4000) NULL,
    [HFAStyleSheetFileName]       NVARCHAR (4000) NULL,
    [HFAStyleSheetURL]            NVARCHAR (4000) NULL,
    [useSMTPDetails]              BIT             NULL,
    [HFAVehicleParentURL]         NVARCHAR (MAX)  NULL,
    [HFAItemsParentURL]           NVARCHAR (MAX)  NULL,
    [HFAResumeLinkExpire]         INT             NULL,
    CONSTRAINT [BranchLine_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [BranchLine_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [BranchLine_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [BranchLine_FK_FSPCompany] FOREIGN KEY ([FSPCompanyId]) REFERENCES [dbo].[FSPCompany] ([Id]),
    CONSTRAINT [BranchLine_FK_FSPPersonComplaintsOfficer] FOREIGN KEY ([ComplaintsOfficerId]) REFERENCES [dbo].[FSPPerson] ([Id]),
    CONSTRAINT [BranchLine_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [BranchLine_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [BranchLine_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_BranchLine_Country] FOREIGN KEY ([PhyAddCountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_BranchLine_Country1] FOREIGN KEY ([PostAddCountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_BranchLine_StaticValue] FOREIGN KEY ([PhyAddEmirate]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_BranchLine_StaticValue1] FOREIGN KEY ([PostAddEmirate]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_BranchLine_TransactionTypeID] FOREIGN KEY ([TransactionTypeID]) REFERENCES [dbo].[StaticValue] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Table Use to store Branch line details page. Under admin >> Branch >> Edit Branch', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BranchLine';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table Group', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BranchLine', @level2type = N'COLUMN', @level2name = N'GroupId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table Branch', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BranchLine', @level2type = N'COLUMN', @level2name = N'BranchId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table FSPCompany', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BranchLine', @level2type = N'COLUMN', @level2name = N'FSPCompanyId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table FSPPerson', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BranchLine', @level2type = N'COLUMN', @level2name = N'ComplaintsOfficerId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table Country', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BranchLine', @level2type = N'COLUMN', @level2name = N'PhyAddCountryId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table Country', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BranchLine', @level2type = N'COLUMN', @level2name = N'PostAddCountryId';

