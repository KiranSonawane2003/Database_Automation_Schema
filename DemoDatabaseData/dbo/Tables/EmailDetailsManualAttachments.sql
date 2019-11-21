CREATE TABLE [dbo].[EmailDetailsManualAttachments] (
    [Id]                       BIGINT         IDENTITY (1, 1) NOT NULL,
    [EmailId]                  BIGINT         NOT NULL,
    [DocumentPath]             NVARCHAR (300) NULL,
    [DocumentName]             NVARCHAR (200) NULL,
    [DocumentId]               BIGINT         NULL,
    [DocumentUploadedFromEnum] NVARCHAR (MAX) NULL,
    [IsActive]                 BIT            DEFAULT ((1)) NOT NULL,
    [CreatedBy]                INT            NOT NULL,
    [ModifiedBy]               INT            NULL,
    [CreatedDate]              DATETIME       DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]             DATETIME       NULL,
    [DocumentSize]             NVARCHAR (50)  NULL,
    CONSTRAINT [EmailDetailsManualAttachments_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [EmailDetailsManualAttachments_FK_EmailId] FOREIGN KEY ([EmailId]) REFERENCES [dbo].[EmailDetailsManual] ([Id]),
    CONSTRAINT [EmailDetailsManualAttachments_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [EmailDetailsManualAttachments_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

