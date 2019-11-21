CREATE TABLE [dbo].[CompanyType] (
    [Id]                    BIGINT         IDENTITY (1, 1) NOT NULL,
    [CompanyTypeName]       NVARCHAR (100) NOT NULL,
    [CountryId]             BIGINT         NULL,
    [IsActive]              BIT            CONSTRAINT [CompanyType_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]           DATETIME       CONSTRAINT [CompanyType_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]          DATETIME       NULL,
    [CreatedBy]             INT            NOT NULL,
    [ModifiedBy]            INT            NULL,
    [IsTransactionSpecific] BIT            DEFAULT ((0)) NULL,
    CONSTRAINT [CompanyType_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CompanyType_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [CompanyType_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [CompanyType_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Table use for fill the dropdown of Create Company page Under Administration >> Companies', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'CompanyType';

