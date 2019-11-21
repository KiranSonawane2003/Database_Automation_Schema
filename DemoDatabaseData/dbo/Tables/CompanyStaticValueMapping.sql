CREATE TABLE [dbo].[CompanyStaticValueMapping] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [StaticValueId]   BIGINT         NOT NULL,
    [CompanyId]       BIGINT         NOT NULL,
    [StaticValueCode] NVARCHAR (100) NULL,
    [CreatedBy]       INT            NULL,
    [ModifiedBy]      INT            NULL,
    [CreatedDate]     DATETIME       NULL,
    [ModifiedDate]    DATETIME       NULL,
    [IsActive]        BIT            NULL,
    CONSTRAINT [PK_CompanyStaticValueMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CompanyStaticValueMapping_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [FK_CompanyStaticValueMapping_StaticValue] FOREIGN KEY ([StaticValueId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_CompanyStaticValueMapping_Users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_CompanyStaticValueMapping_Users1] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

