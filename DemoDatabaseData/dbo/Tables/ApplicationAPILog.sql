CREATE TABLE [dbo].[ApplicationAPILog] (
    [Id]                   BIGINT          IDENTITY (1, 1) NOT NULL,
    [TransactionId]        BIGINT          NULL,
    [CompanyCompanyTypeId] BIGINT          NULL,
    [ApplicationType]      INT             NULL,
    [CompanyName]          NVARCHAR (1000) NULL,
    [RequestURL]           NVARCHAR (4000) NULL,
    [RequestContent]       NVARCHAR (4000) NULL,
    [RequestTimestamp]     DATETIME        NULL,
    [ResponseContent]      NVARCHAR (4000) NULL,
    [ResponseTimestamp]    DATETIME        NULL,
    [CreatedBy]            INT             NULL,
    [ModifiedBy]           INT             NULL,
    [CreatedDate]          DATETIME        DEFAULT (getutcdate()) NULL,
    [ModifiedDate]         DATETIME        NULL,
    CONSTRAINT [ApplicationAPILog_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [ApplicationAPILog_FK_CompanyCompanyTypeMapping] FOREIGN KEY ([CompanyCompanyTypeId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [ApplicationAPILog_FK_Transaction] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [ApplicationAPILog_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ApplicationAPILog_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

