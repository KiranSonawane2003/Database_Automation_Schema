CREATE TABLE [dbo].[BranchProduct] (
    [Id]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [BranchId]           BIGINT         NOT NULL,
    [ProductTypeId]      BIGINT         NOT NULL,
    [ProductSubTypeId]   BIGINT         NOT NULL,
    [ProductId]          BIGINT         NOT NULL,
    [SortKey]            INT            NULL,
    [Editable]           BIT            CONSTRAINT [BranchProduct_DF_Editable] DEFAULT ((0)) NOT NULL,
    [RequireAtInception] NVARCHAR (100) NULL,
    [StartDate]          DATE           NOT NULL,
    [EndDate]            DATE           NOT NULL,
    [CountryId]          BIGINT         NULL,
    [IsActive]           BIT            CONSTRAINT [BranchProduct_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]        DATETIME       CONSTRAINT [BranchProduct_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]       DATETIME       NULL,
    [CreatedBy]          INT            NOT NULL,
    [ModifiedBy]         INT            NULL,
    CONSTRAINT [BranchProduct_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [BranchProduct_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [BranchProduct_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [BranchProduct_FK_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id]),
    CONSTRAINT [BranchProduct_FK_ProductSubType] FOREIGN KEY ([ProductSubTypeId]) REFERENCES [dbo].[ProductSubType] ([Id]),
    CONSTRAINT [BranchProduct_FK_ProductType] FOREIGN KEY ([ProductTypeId]) REFERENCES [dbo].[ProductType] ([Id]),
    CONSTRAINT [BranchProduct_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [BranchProduct_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table associated product with branch.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BranchProduct';

