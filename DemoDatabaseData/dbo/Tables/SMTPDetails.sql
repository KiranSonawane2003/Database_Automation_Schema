CREATE TABLE [dbo].[SMTPDetails] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [GroupId]         BIGINT         NULL,
    [BranchId]        BIGINT         NULL,
    [EmailAddress]    NVARCHAR (100) COLLATE Latin1_General_CI_AS NULL,
    [EmailPassword]   NVARCHAR (MAX) COLLATE Latin1_General_CI_AS NULL,
    [SMTPHost]        NVARCHAR (100) NULL,
    [SMTPPort]        INT            NULL,
    [SMTPDetailsType] INT            NULL,
    [IsActive]        BIT            CONSTRAINT [DF_SMTPDetails_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]     DATETIME       CONSTRAINT [DF_SMTPDetails_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]    DATETIME       NULL,
    [CreatedBy]       INT            NULL,
    [ModifiedBy]      INT            NULL,
    CONSTRAINT [SMTPDetails_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [SMTPDetails_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [SMTPDetails_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [SMTPDetails_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [SMTPDetails_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

