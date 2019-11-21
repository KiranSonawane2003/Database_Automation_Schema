CREATE TABLE [dbo].[TemplateCategory] (
    [Id]                   BIGINT         IDENTITY (1, 1) NOT NULL,
    [TemplateCategoryName] NVARCHAR (100) NOT NULL,
    [CountryId]            BIGINT         NULL,
    [IsActive]             BIT            CONSTRAINT [TemplateCategory_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]          DATETIME       CONSTRAINT [TemplateCategory_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]         DATETIME       NULL,
    [CreatedBy]            INT            NOT NULL,
    [ModifiedBy]           INT            NULL,
    CONSTRAINT [TemplateCategory_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [TemplateCategory_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [TemplateCategory_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [TemplateCategory_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is master for Template Category', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TemplateCategory';

