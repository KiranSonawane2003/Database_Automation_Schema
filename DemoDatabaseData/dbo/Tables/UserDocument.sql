CREATE TABLE [dbo].[UserDocument] (
    [Id]             BIGINT         NOT NULL,
    [UserId]         INT            NOT NULL,
    [DocCategoryId]  BIGINT         NULL,
    [DocDescription] NVARCHAR (500) NULL,
    [DocName]        NVARCHAR (100) NULL,
    [DocPath]        NVARCHAR (200) NULL,
    [CountryId]      BIGINT         NULL,
    [IsActive]       BIT            DEFAULT ((1)) NOT NULL,
    [CreatedDate]    DATETIME       DEFAULT (getutcdate()) NULL,
    [ModifiedDate]   DATETIME       NULL,
    [CreatedBy]      INT            NULL,
    [ModifiedBy]     INT            NULL,
    CONSTRAINT [UserDocument_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserDocument_DocumentCategory] FOREIGN KEY ([DocCategoryId]) REFERENCES [dbo].[DocumentCategory] ([Id]),
    CONSTRAINT [UserDocument_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [UserDocument_FK_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [UserDocument_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [UserDocument_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

