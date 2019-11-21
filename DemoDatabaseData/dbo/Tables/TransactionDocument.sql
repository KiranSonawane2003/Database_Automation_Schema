﻿CREATE TABLE [dbo].[TransactionDocument] (
    [Id]                      BIGINT         IDENTITY (1, 1) NOT NULL,
    [TransactionId]           BIGINT         NOT NULL,
    [DocumentCategoryId]      BIGINT         NOT NULL,
    [DocumentDescription]     NVARCHAR (500) NULL,
    [DocumentPath]            NVARCHAR (300) NULL,
    [DocumentName]            NVARCHAR (200) NULL,
    [CountryId]               BIGINT         NULL,
    [IsActive]                BIT            CONSTRAINT [DF_TransactionDocument_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedBy]               INT            NOT NULL,
    [ModifiedBy]              INT            NULL,
    [CreatedDate]             DATETIME       CONSTRAINT [DF_TransactionDocument_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]            DATETIME       NULL,
    [DocumentSize]            NVARCHAR (50)  NULL,
    [FinanceApplicationId]    BIGINT         NULL,
    [LatestInd]               BIT            NULL,
    [ElectronicallySignedInd] BIT            NULL,
    [IsAPIDocument]           BIT            DEFAULT ((0)) NULL,
    [DocumentSource]          NVARCHAR (MAX) NULL,
    [IsBankerDocument]        BIT            NULL,
    CONSTRAINT [TransactionDocument_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransactionDocument_TransactionFinanceApplication] FOREIGN KEY ([FinanceApplicationId]) REFERENCES [dbo].[TransactionFinanceApplication] ([Id]),
    CONSTRAINT [TransactionDocument_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [TransactionDocument_FK_DocumentCategory] FOREIGN KEY ([DocumentCategoryId]) REFERENCES [dbo].[DocumentCategory] ([Id]),
    CONSTRAINT [TransactionDocument_FK_Transaction] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [TransactionDocument_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [TransactionDocument_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

