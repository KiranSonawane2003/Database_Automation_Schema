CREATE TABLE [dbo].[ROAProductIdentified] (
    [Id]                     BIGINT   IDENTITY (1, 1) NOT NULL,
    [TransactionId]          BIGINT   NOT NULL,
    [ProductTypeId]          BIGINT   NOT NULL,
    [ProductSubTypeId]       BIGINT   NOT NULL,
    [CountryId]              BIGINT   NOT NULL,
    [ProductIdentifiedValue] BIT      NULL,
    [IsActive]               BIT      NULL,
    [CreatedDate]            DATETIME NULL,
    [ModifiedDate]           DATETIME NULL,
    [CreatedBy]              INT      NULL,
    [ModifiedBy]             INT      NULL,
    [IsRecordofTransaction]  BIT      NULL,
    CONSTRAINT [PK_ROAProductIdentified] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ROAProductIdentified_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ROAProductIdentified_ModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ROAProductIdentified_ProductSubType] FOREIGN KEY ([ProductSubTypeId]) REFERENCES [dbo].[ProductSubType] ([Id]),
    CONSTRAINT [FK_ROAProductIdentified_ProductType] FOREIGN KEY ([ProductTypeId]) REFERENCES [dbo].[ProductType] ([Id]),
    CONSTRAINT [FK_ROAProductIdentified_Transaction] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id])
);

