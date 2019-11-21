﻿CREATE TABLE [dbo].[EmailDetailsManual] (
    [Id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [FromEMail]              NVARCHAR (100) COLLATE Latin1_General_CI_AS NULL,
    [ToEMail]                NVARCHAR (500) COLLATE Latin1_General_CI_AS NULL,
    [CC]                     NVARCHAR (500) NULL,
    [BCC]                    NVARCHAR (500) NULL,
    [Subject]                NVARCHAR (500) NULL,
    [MessageBody]            NVARCHAR (MAX) NULL,
    [isSent]                 BIT            NULL,
    [isDrafted]              BIT            NULL,
    [GroupID]                BIGINT         NULL,
    [BranchID]               BIGINT         NULL,
    [TemplateID]             BIGINT         NULL,
    [TransactionID]          BIGINT         NULL,
    [IncludeBusinessManager] BIT            NULL,
    [IncludeClient]          BIT            NULL,
    [IsActive]               BIT            DEFAULT ((1)) NOT NULL,
    [CreatedDate]            DATETIME       DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]           DATETIME       NULL,
    [CreatedBy]              INT            NOT NULL,
    [ModifiedBy]             INT            NULL,
    [TemplateLineID]         BIGINT         NULL,
    [IncludeSalesPerson]     BIT            NULL,
    [ToBusinessManager]      BIT            NULL,
    CONSTRAINT [EmailDetailsManual_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [EmailDetailsManual_FK_BranchID] FOREIGN KEY ([BranchID]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [EmailDetailsManual_FK_GroupID] FOREIGN KEY ([GroupID]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [EmailDetailsManual_FK_TemplateID] FOREIGN KEY ([TemplateID]) REFERENCES [dbo].[Template] ([Id]),
    CONSTRAINT [EmailDetailsManual_FK_TemplateLineID] FOREIGN KEY ([TemplateLineID]) REFERENCES [dbo].[EmailTemplateLine] ([Id]),
    CONSTRAINT [EmailDetailsManual_FK_TransactionID] FOREIGN KEY ([TransactionID]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [EmailDetailsManual_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [EmailDetailsManual_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);
