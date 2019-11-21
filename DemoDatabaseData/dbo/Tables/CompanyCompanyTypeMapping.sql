CREATE TABLE [dbo].[CompanyCompanyTypeMapping] (
    [Id]            BIGINT   IDENTITY (1, 1) NOT NULL,
    [CompanyId]     BIGINT   NOT NULL,
    [CompanyTypeId] BIGINT   NOT NULL,
    [IsActive]      BIT      CONSTRAINT [DF_CompanyTypeMapping_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]   DATETIME CONSTRAINT [DF_CompanyTypeMapping_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]  DATETIME NULL,
    [CreatedBy]     INT      NOT NULL,
    [ModifiedBy]    INT      NULL,
    [CountryId]     BIGINT   NULL,
    CONSTRAINT [CompanyTypeMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CompanyTypeMapping_FK_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [CompanyTypeMapping_FK_CompanyType] FOREIGN KEY ([CompanyTypeId]) REFERENCES [dbo].[CompanyType] ([Id]),
    CONSTRAINT [CompanyTypeMapping_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [CompanyTypeMapping_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [CompanyTypeMapping_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

