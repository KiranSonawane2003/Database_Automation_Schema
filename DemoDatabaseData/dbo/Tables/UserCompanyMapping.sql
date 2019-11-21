CREATE TABLE [dbo].[UserCompanyMapping] (
    [Id]                   BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserId]               INT            NOT NULL,
    [CompanyId]            BIGINT         NOT NULL,
    [CompanyCompanyTypeId] BIGINT         NOT NULL,
    [CompanyCode]          NVARCHAR (100) NOT NULL,
    [CompanyName]          NVARCHAR (MAX) NOT NULL,
    [CountryId]            BIGINT         NOT NULL,
    [IsActive]             BIT            NOT NULL,
    [CreatedDate]          DATETIME       NULL,
    [CreatedBy]            INT            NULL,
    [ModifiedDate]         DATETIME       NULL,
    [ModifiedBy]           INT            NULL,
    CONSTRAINT [PK_UserCompanyMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserCompanyMapping_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [FK_UserCompanyMapping_CompanyCompanyTypeMapping] FOREIGN KEY ([CompanyCompanyTypeId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [FK_UserCompanyMapping_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_UserCompanyMapping_Users] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_UserCompanyMapping_Users1] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id])
);

