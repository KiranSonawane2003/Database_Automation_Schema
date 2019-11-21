CREATE TABLE [dbo].[EmailTemplateLine] (
    [Id]              BIGINT   IDENTITY (1, 1) NOT NULL,
    [TemplateId]      BIGINT   NOT NULL,
    [EmailCategory]   BIGINT   NULL,
    [CountryId]       BIGINT   NOT NULL,
    [StartDate]       DATETIME NULL,
    [EndDate]         DATETIME NULL,
    [IsActive]        BIT      NULL,
    [CreatedDate]     DATETIME NULL,
    [ModifiedDate]    DATETIME NULL,
    [CreatedBy]       INT      NULL,
    [ModifiedBy]      INT      NULL,
    [isAutomatedSend] BIT      NULL,
    CONSTRAINT [PK_EmailTemplateLine] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [EmailTemplateLine_FK_EmailCategoryId] FOREIGN KEY ([EmailCategory]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [EmailTemplateLine_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [EmailTemplateLine_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_EmailTemplateLine_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_EmailTemplateLine_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_EmailTemplateLine_ModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_EmailTemplateLine_Template] FOREIGN KEY ([TemplateId]) REFERENCES [dbo].[Template] ([Id])
);

