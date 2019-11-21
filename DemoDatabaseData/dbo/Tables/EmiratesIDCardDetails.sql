﻿CREATE TABLE [dbo].[EmiratesIDCardDetails] (
    [Id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [TransactionNo]          BIGINT         NULL,
    [EmiratesIDNo]           NVARCHAR (200) NULL,
    [TransactionContactId]   BIGINT         NULL,
    [TransactionClientId]    BIGINT         NULL,
    [CardNumber]             NVARCHAR (200) NULL,
    [CardStatusRequestDate]  DATETIME       NULL,
    [CardStatusResponseDate] DATETIME       NULL,
    [CardStatus]             NVARCHAR (50)  NULL,
    [PBDataRequestDate]      DATETIME       NULL,
    [PBDataResponseDate]     DATETIME       NULL,
    [PBData]                 NVARCHAR (50)  NULL,
    [CreatedDate]            DATETIME       NULL,
    [ModifiedDate]           DATETIME       NULL,
    [CreatedBy]              INT            NULL,
    [ModifiedBy]             INT            NULL,
    CONSTRAINT [PK_EmiratesIDCardDetails] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [EmiratesIDCardDetails_FK_Transaction] FOREIGN KEY ([TransactionNo]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [EmiratesIDCardDetails_FK_TransactionContact] FOREIGN KEY ([TransactionContactId]) REFERENCES [dbo].[TransactionContact] ([Id]),
    CONSTRAINT [FK_EmiratesIDCardDetails_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_EmiratesIDCardDetails_Users_ModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [TransactionClient_FK_EmiratesIDCardDetails] FOREIGN KEY ([TransactionClientId]) REFERENCES [dbo].[TransactionClient] ([Id])
);
