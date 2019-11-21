CREATE TABLE [dbo].[ProductWording] (
    [Id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [ProductId]              BIGINT         NOT NULL,
    [WordingFileName]        NVARCHAR (100) NULL,
    [WordingFilePath]        NVARCHAR (200) NOT NULL,
    [IsEffectiveImmediately] BIT            CONSTRAINT [ProductWording_DF_EffectiveImmediately] DEFAULT ((0)) NOT NULL,
    [StartDate]              DATE           NOT NULL,
    [EndDate]                DATE           NOT NULL,
    [CountryId]              BIGINT         NULL,
    [IsActive]               BIT            CONSTRAINT [ProductWording_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]            DATETIME       CONSTRAINT [ProductWording_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]           DATETIME       NULL,
    [CreatedBy]              INT            NOT NULL,
    [ModifiedBy]             INT            NULL,
    CONSTRAINT [ProductWording_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [ProductWording_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [ProductWording_FK_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id]),
    CONSTRAINT [ProductWording_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ProductWording_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table store details of product wording document under Product Admin >> Edit Product.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ProductWording';

