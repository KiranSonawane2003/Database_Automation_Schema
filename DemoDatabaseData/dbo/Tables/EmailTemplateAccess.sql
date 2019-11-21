CREATE TABLE [dbo].[EmailTemplateAccess] (
    [Id]              BIGINT   IDENTITY (1, 1) NOT NULL,
    [TemplateId]      BIGINT   NOT NULL,
    [GroupId]         BIGINT   NULL,
    [BranchId]        BIGINT   NULL,
    [SortKey]         INT      NULL,
    [IsActive]        BIT      NULL,
    [isAutomatedSend] BIT      NULL,
    [StartDate]       DATETIME NULL,
    [EndDate]         DATETIME NULL,
    [CreatedDate]     DATETIME NULL,
    [ModifiedDate]    DATETIME NULL,
    [CreatedBy]       INT      NULL,
    [ModifiedBy]      INT      NULL,
    CONSTRAINT [PK_EmailTemplateAccess] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [EmailTemplateAccess_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [EmailTemplateAccess_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_EmailTemplateAccess_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [FK_EmailTemplateAccess_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [FK_EmailTemplateAccess_Template] FOREIGN KEY ([TemplateId]) REFERENCES [dbo].[Template] ([Id])
);

