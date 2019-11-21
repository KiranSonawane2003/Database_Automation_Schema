CREATE TABLE [dbo].[CompanyNationalityMapping] (
    [Id]         BIGINT        IDENTITY (1, 1) NOT NULL,
    [CountryId]  BIGINT        NULL,
    [CompanyId]  BIGINT        NULL,
    [Code]       NVARCHAR (10) NULL,
    [IsActive]   BIT           NULL,
    [CreatedOn]  DATETIME      NULL,
    [CreatedBy]  INT           NULL,
    [ModifiedOn] DATETIME      NULL,
    [ModifiedBy] INT           NULL,
    CONSTRAINT [PK_CompanyNationalityMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CompanyNationalityMapping_FK_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [CompanyNationalityMapping_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [CompanyNationalityMapping_FK_UserCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [CompanyNationalityMapping_FK_UserModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

