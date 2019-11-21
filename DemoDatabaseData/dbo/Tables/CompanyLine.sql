CREATE TABLE [dbo].[CompanyLine] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [CompanyId]       BIGINT         NULL,
    [CompanyPassword] NVARCHAR (100) NULL,
    [StartDate]       DATE           NULL,
    [EndDate]         DATE           NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    [CountryId]       BIGINT         NULL,
    [CreatedBy]       INT            NULL,
    [ModifiedBy]      INT            NULL,
    [CreatedDate]     DATETIME       DEFAULT (getutcdate()) NULL,
    [ModifiedDate]    DATETIME       NULL,
    CONSTRAINT [CompanyLine_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CompanyLine_FK_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [CompanyLine_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [CompanyLine_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [CompanyLine_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

