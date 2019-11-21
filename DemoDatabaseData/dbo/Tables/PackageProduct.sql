CREATE TABLE [dbo].[PackageProduct] (
    [Id]              BIGINT   IDENTITY (1, 1) NOT NULL,
    [PackageId]       BIGINT   NOT NULL,
    [ProductId]       BIGINT   NOT NULL,
    [ProductOptionId] BIGINT   NULL,
    [CountryId]       BIGINT   NULL,
    [IsActive]        BIT      CONSTRAINT [PackageProduct_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [IsRequired]      BIT      CONSTRAINT [DF_PackageProduct_IsActive1] DEFAULT ((0)) NOT NULL,
    [IsRecommended]   BIT      CONSTRAINT [DF_PackageProduct_IsRequired1] DEFAULT ((0)) NOT NULL,
    [IsNonEditable]   BIT      CONSTRAINT [DF_PackageProduct_IsRequired1_1] DEFAULT ((0)) NOT NULL,
    [CreatedDate]     DATETIME CONSTRAINT [PackageProduct_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]    DATETIME NULL,
    [CreatedBy]       INT      NOT NULL,
    [ModifiedBy]      INT      NULL,
    CONSTRAINT [PackageProduct_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [PackageProduct_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [PackageProduct_FK_Packages] FOREIGN KEY ([PackageId]) REFERENCES [dbo].[Package] ([Id]),
    CONSTRAINT [PackageProduct_FK_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id]),
    CONSTRAINT [PackageProduct_FK_ProductOption] FOREIGN KEY ([ProductOptionId]) REFERENCES [dbo].[ProductOption] ([Id]),
    CONSTRAINT [PackageProduct_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [PackageProduct_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table used to store Product assigned to packages', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageProduct';

