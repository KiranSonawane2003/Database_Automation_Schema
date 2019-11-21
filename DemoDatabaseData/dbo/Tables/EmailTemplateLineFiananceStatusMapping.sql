CREATE TABLE [dbo].[EmailTemplateLineFiananceStatusMapping] (
    [Id]               BIGINT   IDENTITY (1, 1) NOT NULL,
    [TemplateLineId]   BIGINT   NOT NULL,
    [FiananceStatusId] BIGINT   NULL,
    [IsActive]         BIT      CONSTRAINT [DF__EmailTemp__IsAct__217D344A] DEFAULT ((1)) NULL,
    [CreatedDate]      DATETIME CONSTRAINT [DF__EmailTemp__Creat__22715883] DEFAULT (getutcdate()) NULL,
    [ModifiedDate]     DATETIME NULL,
    [CreatedBy]        INT      NULL,
    [ModifiedBy]       INT      NULL,
    CONSTRAINT [EmailTemplateLineFiananceStatusMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [EmailTemplateLineFiananceStatusMapping_FK_TemplateLineId] FOREIGN KEY ([TemplateLineId]) REFERENCES [dbo].[EmailTemplateLine] ([Id]),
    CONSTRAINT [EmailTemplateLineFiananceStatusMapping_FK_TransactionStatusId] FOREIGN KEY ([FiananceStatusId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [EmailTemplateLineFiananceStatusMapping_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [EmailTemplateLineFiananceStatusMapping_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

