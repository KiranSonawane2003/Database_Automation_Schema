CREATE TABLE [dbo].[WordingCategory] (
    [Id]                  BIGINT         IDENTITY (1, 1) NOT NULL,
    [WordingCategoryName] NVARCHAR (100) NOT NULL,
    [CountryId]           BIGINT         NULL,
    [IsActive]            BIT            CONSTRAINT [WordingCategory_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]         DATETIME       CONSTRAINT [WordingCategory_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]        DATETIME       NULL,
    [CreatedBy]           INT            NOT NULL,
    [ModifiedBy]          INT            NULL,
    CONSTRAINT [WordingCategory_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [WordingCategory_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [WordingCategory_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [WordingCategory_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is maaster for wording type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WordingCategory';

