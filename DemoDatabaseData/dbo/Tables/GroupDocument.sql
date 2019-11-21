CREATE TABLE [dbo].[GroupDocument] (
    [Id]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [GroupId]        BIGINT         NOT NULL,
    [DocCategoryId]  BIGINT         NOT NULL,
    [DocDescription] NVARCHAR (200) NULL,
    [DocName]        NVARCHAR (100) NULL,
    [DocPath]        NVARCHAR (200) NULL,
    [CountryId]      BIGINT         NULL,
    [IsActive]       BIT            CONSTRAINT [GroupDocument_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]    DATETIME       CONSTRAINT [GroupDocument_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [CreatedBy]      INT            NOT NULL,
    [ModifiedBy]     INT            NULL,
    CONSTRAINT [GroupDocument_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [GroupDocument_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [GroupDocument_FK_DocumentCategory] FOREIGN KEY ([DocCategoryId]) REFERENCES [dbo].[DocumentCategory] ([Id]),
    CONSTRAINT [GroupDocument_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [GroupDocument_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupDocument_FK_UsersModdifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table store document related with group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'GroupDocument';

