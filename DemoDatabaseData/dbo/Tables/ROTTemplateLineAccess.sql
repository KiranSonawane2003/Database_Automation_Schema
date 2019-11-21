CREATE TABLE [dbo].[ROTTemplateLineAccess] (
    [Id]           BIGINT   IDENTITY (1, 1) NOT NULL,
    [TemplateId]   BIGINT   NOT NULL,
    [GroupId]      BIGINT   NULL,
    [BranchId]     BIGINT   NULL,
    [CountryId]    BIGINT   NOT NULL,
    [SortKey]      INT      NULL,
    [StartDate]    DATETIME NULL,
    [EndDate]      DATETIME NULL,
    [IsActive]     BIT      NULL,
    [CreatedDate]  DATETIME NULL,
    [ModifiedDate] DATETIME NULL,
    [CreatedBy]    INT      NULL,
    [ModifiedBy]   INT      NULL,
    CONSTRAINT [PK_ROTTemplateLineAccess] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ROTTemplateLineAccess_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [FK_ROTTemplateLineAccess_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_ROTTemplateLineAccess_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [FK_ROTTemplateLineAccess_Template] FOREIGN KEY ([TemplateId]) REFERENCES [dbo].[Template] ([Id])
);

