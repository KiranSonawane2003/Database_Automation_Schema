CREATE TABLE [dbo].[FSPPerson] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [Title]        NVARCHAR (50)  NOT NULL,
    [LastName]     NVARCHAR (100) COLLATE Latin1_General_CI_AS NOT NULL,
    [FirstName]    NVARCHAR (100) COLLATE Latin1_General_CI_AS NOT NULL,
    [Phone]        NVARCHAR (100) COLLATE Latin1_General_CI_AS NULL,
    [Fax]          NVARCHAR (100) NULL,
    [Mobile]       NVARCHAR (50)  NULL,
    [Email]        NVARCHAR (50)  COLLATE Latin1_General_CI_AS NULL,
    [CountryId]    BIGINT         NULL,
    [IsActive]     BIT            CONSTRAINT [FSPPerson_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]  DATETIME       CONSTRAINT [FSPPerson_DF_.CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [CreatedBy]    INT            NOT NULL,
    [ModifiedBy]   INT            NULL,
    CONSTRAINT [FSPPerson_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FSPPerson_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FSPPerson_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FSPPerson_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table store fields from FSP Person Admin under Administration >>FSP Person Admn', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'FSPPerson';

