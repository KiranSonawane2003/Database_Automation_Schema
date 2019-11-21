CREATE TABLE [dbo].[UsersInCountry] (
    [Id]           BIGINT   IDENTITY (1, 1) NOT NULL,
    [UserId]       INT      NOT NULL,
    [CountryId]    BIGINT   NOT NULL,
    [IsActive]     BIT      CONSTRAINT [DF_UsersInCountry_IsActive] DEFAULT ((0)) NOT NULL,
    [CreatedDate]  DATETIME CONSTRAINT [DF_UsersInCountry_CreatedDate] DEFAULT (getutcdate()) NULL,
    [ModifiedDate] DATETIME NULL,
    [CreatedBy]    INT      NULL,
    [ModifiedBy]   INT      NULL,
    CONSTRAINT [PK_UsersInCountry] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UsersInCountry_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_UsersInCountry_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_UsersInCountry_Users1] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_UsersInCountry_Users2] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

