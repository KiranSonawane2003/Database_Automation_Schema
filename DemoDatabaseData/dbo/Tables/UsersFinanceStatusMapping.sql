CREATE TABLE [dbo].[UsersFinanceStatusMapping] (
    [Id]              BIGINT   IDENTITY (1, 1) NOT NULL,
    [UserId]          INT      NOT NULL,
    [CountryId]       BIGINT   NOT NULL,
    [FinanceStatusId] BIGINT   NOT NULL,
    [IsActive]        BIT      NULL,
    [CreatedBy]       INT      NULL,
    [CreatedDate]     DATETIME NULL,
    [ModifiedDate]    DATETIME NULL,
    [ModifiedBy]      INT      NULL,
    CONSTRAINT [PK_UsersFinanceStatusMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UsersFinanceStatusMapping_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_UsersFinanceStatusMapping_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_UsersFinanceStatusMapping_Users1] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_UsersFinanceStatusMapping_Users2] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

