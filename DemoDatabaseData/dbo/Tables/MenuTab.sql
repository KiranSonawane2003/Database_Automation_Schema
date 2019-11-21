CREATE TABLE [dbo].[MenuTab] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [MenuName]     NVARCHAR (MAX) NOT NULL,
    [ParentId]     INT            NULL,
    [Sequence]     INT            NULL,
    [IsActive]     BIT            CONSTRAINT [MenuTab_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]  DATETIME       CONSTRAINT [MenuTab_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [CreatedBy]    BIGINT         NOT NULL,
    [ModifiedBy]   BIGINT         NULL,
    CONSTRAINT [MenuTab_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [MenuTab_MenuTab_PK] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[MenuTab] ([Id])
);

