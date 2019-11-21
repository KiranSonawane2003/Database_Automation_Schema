CREATE TABLE [dbo].[CompanyDocument] (
    [Id]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [CompanyId]          BIGINT         NOT NULL,
    [DocumentCategoryId] BIGINT         NOT NULL,
    [DocumentName]       NVARCHAR (200) NULL,
    [DocumentPath]       NVARCHAR (500) NOT NULL,
    [IsActive]           BIT            CONSTRAINT [DF_CompanyDocument_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]        DATETIME       CONSTRAINT [DF_CompanyDocument_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]       DATETIME       NULL,
    [CreatedBy]          INT            NOT NULL,
    [ModifiedBy]         INT            NULL,
    CONSTRAINT [CompanyDocument_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CompanyDocument_FK_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [CompanyDocument_FK_DocumentCategory] FOREIGN KEY ([DocumentCategoryId]) REFERENCES [dbo].[DocumentCategory] ([Id]),
    CONSTRAINT [CompanyDocument_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [CompanyDocument_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

