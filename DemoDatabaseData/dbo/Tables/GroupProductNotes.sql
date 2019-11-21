CREATE TABLE [dbo].[GroupProductNotes] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [GroupId]      BIGINT         NOT NULL,
    [ProductNote]  NVARCHAR (300) NULL,
    [StartDate]    DATE           NOT NULL,
    [EndDate]      DATE           NOT NULL,
    [CountryId]    BIGINT         NULL,
    [IsActive]     BIT            CONSTRAINT [GroupProductNotes_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]  DATETIME       CONSTRAINT [GroupProductNotes_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [CreatedBy]    INT            NOT NULL,
    [ModifiedBy]   INT            NULL,
    CONSTRAINT [GroupProductNotes_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GroupProductNotes_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [GroupProductNotes_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [GroupProductNotes_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupProductNotes_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores the notes for the product assigned to group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'GroupProductNotes';

