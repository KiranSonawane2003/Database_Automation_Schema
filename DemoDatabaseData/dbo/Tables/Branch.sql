CREATE TABLE [dbo].[Branch] (
    [Id]                          BIGINT          IDENTITY (1, 1) NOT NULL,
    [GroupId]                     BIGINT          NOT NULL,
    [BranchName]                  NVARCHAR (100)  NOT NULL,
    [BranchCode]                  NVARCHAR (50)   NOT NULL,
    [BranchLogo]                  NVARCHAR (200)  NULL,
    [PrimeAdjustment]             DECIMAL (18, 2) NULL,
    [FinanceTerm]                 INT             NULL,
    [BussinessManagerId]          INT             NULL,
    [VehicleBussinessManagerId]   INT             NULL,
    [FSPCompanyId]                BIGINT          NULL,
    [OverrideAdviceLicence]       BIT             CONSTRAINT [Branch_DF_OverrideAdviceLicence] DEFAULT ((0)) NULL,
    [ComplaintsOfficerId]         BIGINT          NULL,
    [VATNumber]                   BIGINT          NULL,
    [PhyAddCountryId]             BIGINT          NULL,
    [PostAddCountryId]            BIGINT          NULL,
    [WorkTelephoneCode]           NVARCHAR (50)   NULL,
    [WorkTelephoneNumber]         NVARCHAR (50)   NULL,
    [FaxNumberCode]               NVARCHAR (50)   NULL,
    [FaxNumber]                   NVARCHAR (50)   NULL,
    [MarketerId]                  INT             NULL,
    [Workflow]                    BIGINT          NULL,
    [StartDate]                   DATE            NOT NULL,
    [EndDate]                     DATE            NULL,
    [CountryId]                   BIGINT          NULL,
    [IsActive]                    BIT             CONSTRAINT [Branch_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]                 DATETIME        CONSTRAINT [Branch_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
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
    [HFADocumentDescription]      NVARCHAR (MAX)  NULL,
    [IsEnableEmiratesIDCard]      BIT             NULL,
    [UTCTimeOffset]               INT             NULL,
    CONSTRAINT [Branch_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [Branch_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [Branch_FK_FSPCompany] FOREIGN KEY ([FSPCompanyId]) REFERENCES [dbo].[FSPCompany] ([Id]),
    CONSTRAINT [Branch_FK_FSPPersonComplaintsOfficer] FOREIGN KEY ([ComplaintsOfficerId]) REFERENCES [dbo].[FSPPerson] ([Id]),
    CONSTRAINT [Branch_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [Branch_FK_UsersBussinessManagerId] FOREIGN KEY ([BussinessManagerId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Branch_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Branch_FK_UsersMarketer] FOREIGN KEY ([MarketerId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Branch_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Branch_FK_UsersVehicleBussinessManagerId] FOREIGN KEY ([VehicleBussinessManagerId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_Branch_Country] FOREIGN KEY ([PhyAddCountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_Branch_Country1] FOREIGN KEY ([PostAddCountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_Branch_StaticValue] FOREIGN KEY ([PhyAddEmirate]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_Branch_StaticValue1] FOREIGN KEY ([PostAddEmirate]) REFERENCES [dbo].[StaticValue] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'• Table Use to store Branch Details. 
• Will insert row by Create Branch under Administration >> Branch >> Branch admin or Branch Details under Administrator >> Branch >> Edit Branch
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Branch';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key fromtable Group. Fill dropdown of grup while creating branch', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Branch', @level2type = N'COLUMN', @level2name = N'GroupId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This Field shoul be auto generated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Branch', @level2type = N'COLUMN', @level2name = N'BranchCode';

