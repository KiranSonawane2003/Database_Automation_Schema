CREATE TABLE [dbo].[Country] (
    [Id]                      BIGINT         IDENTITY (1, 1) NOT NULL,
    [CountryName]             NVARCHAR (500) NOT NULL,
    [CountryCode]             NVARCHAR (200) NULL,
    [Currency]                NVARCHAR (50)  NULL,
    [UTCTimestamp]            DATETIME       NULL,
    [Sequence]                INT            NULL,
    [IsCountryAdministration] BIT            NULL,
    [IsActive]                BIT            CONSTRAINT [Country_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]             DATETIME       CONSTRAINT [Country_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]            DATETIME       NULL,
    [CreatedBy]               INT            NOT NULL,
    [ModifiedBy]              INT            NULL,
    [EnumCountryName]         NVARCHAR (100) NULL,
    [UTCTimeOffset]           INT            NULL,
    [IsGeneric]               BIT            NULL,
    [CountryFlag]             NVARCHAR (200) NULL,
    CONSTRAINT [Country_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [Country_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Country_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is master for country. This table used for fill country dropdown of Create FSP Company page under Admin >> Companies', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Country';

