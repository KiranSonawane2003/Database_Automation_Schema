CREATE TABLE [dbo].[ProductSubType] (
    [Id]                          BIGINT         IDENTITY (1, 1) NOT NULL,
    [ProductTypeId]               BIGINT         NOT NULL,
    [ProductSubTypeName]          NVARCHAR (100) NOT NULL,
    [CountryId]                   BIGINT         NULL,
    [IsActive]                    BIT            CONSTRAINT [ProductSubType_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]                 DATETIME       CONSTRAINT [ProductSubType_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]                DATETIME       NULL,
    [CreatedBy]                   INT            NOT NULL,
    [ModifiedBy]                  INT            NULL,
    [ProductSubTypeAbbreviations] NVARCHAR (100) NULL,
    [ProductSubTypeEnumName]      NVARCHAR (MAX) NULL,
    CONSTRAINT [ProductSubType_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [ProductSubType_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [ProductSubType_FK_ProductType] FOREIGN KEY ([ProductTypeId]) REFERENCES [dbo].[ProductType] ([Id]),
    CONSTRAINT [ProductSubType_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ProductSubType_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table use to fill Product Subtype dropdown of Create Product Page under Administrator >> Product >> Product Admin', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ProductSubType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'foreign key from ProductType Table', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ProductSubType', @level2type = N'COLUMN', @level2name = N'ProductTypeId';

