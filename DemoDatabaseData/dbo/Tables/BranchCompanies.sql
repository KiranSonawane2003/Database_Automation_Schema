CREATE TABLE [dbo].[BranchCompanies] (
    [Id]                    BIGINT         IDENTITY (1, 1) NOT NULL,
    [BranchId]              BIGINT         NOT NULL,
    [GroupId]               BIGINT         NOT NULL,
    [CompanyId]             BIGINT         NOT NULL,
    [SortKey]               INT            NULL,
    [StartDate]             DATE           NOT NULL,
    [EndDate]               DATE           NOT NULL,
    [CountryId]             BIGINT         NULL,
    [IsActive]              BIT            CONSTRAINT [BranchCompanies_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]           DATETIME       CONSTRAINT [BranchCompanies_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]          DATETIME       NULL,
    [CreatedBy]             INT            NOT NULL,
    [ModifiedBy]            INT            NULL,
    [AutoUpdateTransaction] BIT            DEFAULT ((0)) NULL,
    [EmailAddress]          NVARCHAR (MAX) NULL,
    [BankDealerCode]        NVARCHAR (MAX) NULL,
    CONSTRAINT [BranchCompanies_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [BranchCompanies_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [BranchCompanies_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [BranchCompanies_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [BranchCompanies_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_BranchCompanies_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [FK_BranchCompanies_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'• This Table used to map companies with branch.
• This will be filled by Companies page under Admin >> Branch Admin >> Edit Branch', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BranchCompanies';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key from table Branch', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BranchCompanies', @level2type = N'COLUMN', @level2name = N'BranchId';

