CREATE TABLE [dbo].[GroupProduct] (
    [Id]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [GroupId]            BIGINT         NOT NULL,
    [ProductTypeId]      BIGINT         NOT NULL,
    [ProductSubTypeId]   BIGINT         NOT NULL,
    [ProductId]          BIGINT         NOT NULL,
    [SortKey]            INT            NULL,
    [Editable]           BIT            CONSTRAINT [GroupProduct_DF_Editable] DEFAULT ((0)) NOT NULL,
    [RequireAtInception] NVARCHAR (100) NULL,
    [StartDate]          DATE           NOT NULL,
    [EndDate]            DATE           NOT NULL,
    [CountryId]          BIGINT         NULL,
    [IsActive]           BIT            CONSTRAINT [GroupProduct_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]        DATETIME       CONSTRAINT [GroupProduct_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]       DATETIME       NULL,
    [CreatedBy]          INT            NOT NULL,
    [ModifiedBy]         INT            NULL,
    CONSTRAINT [GroupProduct_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [GroupProduct_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [GroupProduct_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [GroupProduct_FK_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id]),
    CONSTRAINT [GroupProduct_FK_ProductSubType] FOREIGN KEY ([ProductSubTypeId]) REFERENCES [dbo].[ProductSubType] ([Id]),
    CONSTRAINT [GroupProduct_FK_ProductType] FOREIGN KEY ([ProductTypeId]) REFERENCES [dbo].[ProductType] ([Id]),
    CONSTRAINT [GroupProduct_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupProduct_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table store Product assign for group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'GroupProduct';

