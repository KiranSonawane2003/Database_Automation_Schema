CREATE TABLE [dbo].[GroupTemplate] (
    [Id]                 BIGINT   IDENTITY (1, 1) NOT NULL,
    [GroupId]            BIGINT   NOT NULL,
    [TemplateCategoryId] BIGINT   NOT NULL,
    [TemplateId]         BIGINT   NOT NULL,
    [SortKey]            INT      NULL,
    [StartDate]          DATE     NOT NULL,
    [EndDate]            DATE     NULL,
    [CountryId]          BIGINT   NULL,
    [IsActive]           BIT      CONSTRAINT [GroupTemplate_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]        DATETIME CONSTRAINT [GroupTemplate_DF_CeratedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]       DATETIME NULL,
    [CreatedBy]          INT      NOT NULL,
    [ModifiedBy]         INT      NULL,
    CONSTRAINT [GroupTemplate_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [GroupTemplate_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [GroupTemplate_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [GroupTemplate_FK_Template] FOREIGN KEY ([TemplateId]) REFERENCES [dbo].[Template] ([Id]),
    CONSTRAINT [GroupTemplate_FK_TemplateCategory] FOREIGN KEY ([TemplateCategoryId]) REFERENCES [dbo].[TemplateCategory] ([Id]),
    CONSTRAINT [GroupTemplate_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupTemplate_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table relate template from template table', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'GroupTemplate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table Group', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'GroupTemplate', @level2type = N'COLUMN', @level2name = N'GroupId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table TemplateCategory', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'GroupTemplate', @level2type = N'COLUMN', @level2name = N'TemplateCategoryId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table Template', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'GroupTemplate', @level2type = N'COLUMN', @level2name = N'TemplateId';

