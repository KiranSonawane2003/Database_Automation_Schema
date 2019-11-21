CREATE TABLE [dbo].[ProductBrochure] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [ProductId]        BIGINT         NOT NULL,
    [BrochureFileName] NVARCHAR (100) NULL,
    [BrochureFilePath] NVARCHAR (200) NOT NULL,
    [CountryId]        BIGINT         NULL,
    [IsActive]         BIT            CONSTRAINT [ProductBrochure_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]      DATETIME       CONSTRAINT [ProductBrochure_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [CreatedBy]        INT            NOT NULL,
    [ModifiedBy]       INT            NULL,
    CONSTRAINT [ProductBrochure_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [ProductBrochure_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [ProductBrochure_FK_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id]),
    CONSTRAINT [ProductBrochure_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ProductBrochure_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores product brochure document.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ProductBrochure';

