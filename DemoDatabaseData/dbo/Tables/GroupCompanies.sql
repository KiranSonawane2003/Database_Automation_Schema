CREATE TABLE [dbo].[GroupCompanies] (
    [Id]                    BIGINT         IDENTITY (1, 1) NOT NULL,
    [GroupId]               BIGINT         NOT NULL,
    [CompanyId]             BIGINT         NOT NULL,
    [SortKey]               INT            NULL,
    [StartDate]             DATE           NOT NULL,
    [EndDate]               DATE           NOT NULL,
    [CountryId]             BIGINT         NULL,
    [IsActive]              BIT            CONSTRAINT [GroupCompanies_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]           DATETIME       CONSTRAINT [GroupCompanies_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]          DATETIME       NULL,
    [CreatedBy]             INT            NOT NULL,
    [ModifiedBy]            INT            NULL,
    [AutoUpdateTransaction] BIT            DEFAULT ((0)) NULL,
    [EmailAddress]          NVARCHAR (MAX) NULL,
    [BankDealerCode]        NVARCHAR (MAX) NULL,
    CONSTRAINT [GroupCompanies_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GroupCompanies_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [GroupCompanies_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [GroupCompanies_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [GroupCompanies_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupCompanies_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table relates Companies with group', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'GroupCompanies';

