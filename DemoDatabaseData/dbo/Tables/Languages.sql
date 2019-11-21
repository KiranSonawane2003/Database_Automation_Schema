CREATE TABLE [dbo].[Languages] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [LanguageName] NVARCHAR (100) NULL,
    [CountryId]    BIGINT         NOT NULL,
    [IsRTL]        BIT            CONSTRAINT [DF_Languages_IsRTL] DEFAULT ((0)) NOT NULL,
    [Culture]      NVARCHAR (50)  NULL,
    [IsActive]     BIT            CONSTRAINT [DF_Languages_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]  DATETIME       CONSTRAINT [DF_Languages_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [CreatedBy]    INT            NULL,
    [ModifiedBy]   INT            NULL,
    CONSTRAINT [Languages_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [Languages_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [Languages_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Languages_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

