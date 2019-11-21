CREATE TABLE [dbo].[CompanyDocumentCategoryMapping] (
    [Id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [DocumentCategoryId]   BIGINT        NULL,
    [CompanyId]            BIGINT        NULL,
    [DocumentCategoryCode] NVARCHAR (50) NULL,
    [IsActive]             BIT           NULL,
    [CreatedBy]            INT           NULL,
    [ModifiedBy]           INT           NULL,
    [CreatedDate]          DATETIME      NULL,
    [ModifiedDate]         DATETIME      NULL,
    CONSTRAINT [PK_CompanyDocumentCategoryMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [Company_FK_CompanyDocumentCategoryMapping] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [DocumentCategory_FK_CompanyDocumentCategoryMapping] FOREIGN KEY ([DocumentCategoryId]) REFERENCES [dbo].[DocumentCategory] ([Id]),
    CONSTRAINT [UerCreatedBy_FK_CompanyDocumentCategoryMapping] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [UserModifiedBy_FK_CompanyDocumentCategoryMapping] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

