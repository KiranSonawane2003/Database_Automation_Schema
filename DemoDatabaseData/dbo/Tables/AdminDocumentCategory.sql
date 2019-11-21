CREATE TABLE [dbo].[AdminDocumentCategory] (
    [Id]                       BIGINT          IDENTITY (1, 1) NOT NULL,
    [DocumentCategoryName]     NVARCHAR (2000) NULL,
    [IsGroupDocumentCategory]  BIT             NULL,
    [IsBranchDocumentCategory] BIT             NULL,
    [IsUsersDocumentCategory]  BIT             NULL,
    [IsActive]                 BIT             DEFAULT ((1)) NULL,
    [CreatedDate]              DATETIME        DEFAULT (getutcdate()) NULL,
    [ModifiedDate]             DATETIME        NULL,
    [CreatedBy]                INT             NULL,
    [ModifiedBy]               INT             NULL,
    CONSTRAINT [AdminDocumentCategory_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [AdminDocumentCategory_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [AdminDocumentCategory_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

