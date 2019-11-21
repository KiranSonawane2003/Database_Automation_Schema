CREATE TABLE [dbo].[ProductType] (
    [Id]                      BIGINT         IDENTITY (1, 1) NOT NULL,
    [ProductTypeName]         NVARCHAR (100) NOT NULL,
    [ProductTypeEnumName]     NVARCHAR (100) NULL,
    [IsInsuranceType]         BIT            NULL,
    [CountryId]               BIGINT         NULL,
    [IsActive]                BIT            CONSTRAINT [ProductType_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]             DATETIME       CONSTRAINT [ProductType_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]            DATETIME       NULL,
    [CreatedBy]               INT            NOT NULL,
    [ModifiedBy]              INT            NULL,
    [ProductTypeAbbreviation] NVARCHAR (100) NULL,
    [SortOrder]               INT            NULL,
    CONSTRAINT [ProductType_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [ProductType_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [ProductType_FK_UsersCreatyedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ProductType_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table use to fill Product Type Dropdown of Create Product Page Under Administration >> Product >> Product Admin', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ProductType';

