CREATE TABLE [dbo].[StaticCategory] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (200) NOT NULL,
    [IsActive]     BIT            CONSTRAINT [DF_StaticCategory_IsActive] DEFAULT ((1)) NULL,
    [CreatedDate]  DATETIME       CONSTRAINT [DF_StaticCategory_CreatedDate] DEFAULT (getutcdate()) NULL,
    [ModifiedDate] DATETIME       NULL,
    [CreatedBy]    INT            NULL,
    [ModifiedBy]   INT            NULL,
    CONSTRAINT [PK_StaticCategory_1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_StaticCategory_Users] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_StaticCategory_Users1] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id])
);

