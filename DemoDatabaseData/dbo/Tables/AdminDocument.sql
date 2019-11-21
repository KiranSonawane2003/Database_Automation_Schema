CREATE TABLE [dbo].[AdminDocument] (
    [Id]             BIGINT          IDENTITY (1, 1) NOT NULL,
    [TableId]        BIGINT          NULL,
    [DocCategoryId]  BIGINT          NULL,
    [DocDescription] NVARCHAR (2000) NULL,
    [DocName]        NVARCHAR (1000) NULL,
    [DocPath]        NVARCHAR (1000) NULL,
    [TypeEnum]       INT             NULL,
    [CountryId]      BIGINT          NULL,
    [IsActive]       BIT             DEFAULT ((1)) NOT NULL,
    [CreatedDate]    DATETIME        DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]   DATETIME        NULL,
    [CreatedBy]      INT             NULL,
    [ModifiedBy]     INT             NULL,
    CONSTRAINT [AdminDocument_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [AdminDocument_FK_DocumentCategory] FOREIGN KEY ([DocCategoryId]) REFERENCES [dbo].[AdminDocumentCategory] ([Id]),
    CONSTRAINT [BranchDocument_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [BranchDocument_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [BranchDocument_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

