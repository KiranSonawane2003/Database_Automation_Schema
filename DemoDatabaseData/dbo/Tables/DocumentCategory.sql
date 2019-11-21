CREATE TABLE [dbo].[DocumentCategory] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [DocCategory]  NVARCHAR (100) NOT NULL,
    [ParentId]     BIGINT         NULL,
    [CountryId]    BIGINT         NULL,
    [IsActive]     BIT            CONSTRAINT [DocumentCategory_DF_AsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]  DATETIME       CONSTRAINT [DocumentCategory_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [CreatedBy]    INT            NOT NULL,
    [ModifiedBy]   INT            NULL,
    CONSTRAINT [DocumentCategory_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [DocumentCategory_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [DocumentCategory_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [DocumentCategory_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_DocumentCategory_DocumentCategory] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[DocumentCategory] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is master for document category', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DocumentCategory';

