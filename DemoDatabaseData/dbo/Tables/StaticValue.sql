CREATE TABLE [dbo].[StaticValue] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [StaticCategoryId] BIGINT         NOT NULL,
    [Name]             NVARCHAR (200) NOT NULL,
    [EnumName]         NVARCHAR (200) NULL,
    [Code]             NVARCHAR (100) NULL,
    [Location]         NVARCHAR (200) NULL,
    [ParentId]         BIGINT         NULL,
    [SortOrder]        INT            NULL,
    [CountryId]        BIGINT         NULL,
    [IsActive]         BIT            CONSTRAINT [DF_StaticValue_IsActive] DEFAULT ((1)) NULL,
    [CreatedDate]      DATETIME       NULL,
    [ModifiedDate]     DATETIME       NULL,
    [CreatedBy]        INT            NULL,
    [ModifiedBy]       INT            NULL,
    CONSTRAINT [PK_StaticValue_1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_StaticValue_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_StaticValue_StaticCategory] FOREIGN KEY ([StaticCategoryId]) REFERENCES [dbo].[StaticCategory] ([Id]),
    CONSTRAINT [FK_StaticValue_StaticValue] FOREIGN KEY ([Id]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_StaticValue_Users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_StaticValue_Users1] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

