CREATE TABLE [dbo].[ROAProductAcceptance] (
    [Id]                    BIGINT   IDENTITY (1, 1) NOT NULL,
    [TransactionId]         BIGINT   NOT NULL,
    [ProductTypeId]         BIGINT   NOT NULL,
    [ProductSubTypeId]      BIGINT   NOT NULL,
    [CountryId]             BIGINT   NOT NULL,
    [OfferedValue]          BIT      NULL,
    [AcceptDeclinedValue]   BIT      NULL,
    [IsActive]              BIT      NULL,
    [CreatedDate]           DATETIME NULL,
    [ModifiedDate]          DATETIME NULL,
    [CreatedBy]             INT      NULL,
    [ModifiedBy]            INT      NULL,
    [IsRecordofTransaction] BIT      NULL,
    CONSTRAINT [PK_ROAProductAcceptance] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ROAProductAcceptance_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ROAProductAcceptance_ModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ROAProductAcceptance_ProductSubType] FOREIGN KEY ([ProductSubTypeId]) REFERENCES [dbo].[ProductSubType] ([Id]),
    CONSTRAINT [FK_ROAProductAcceptance_ProductType] FOREIGN KEY ([ProductTypeId]) REFERENCES [dbo].[ProductType] ([Id]),
    CONSTRAINT [FK_ROAProductAcceptance_Transaction] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id])
);

