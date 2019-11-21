CREATE TABLE [dbo].[ROANotes] (
    [Id]                    BIGINT          IDENTITY (1, 1) NOT NULL,
    [TransactionId]         BIGINT          NOT NULL,
    [CountryId]             BIGINT          NOT NULL,
    [Description]           NVARCHAR (MAX)  NULL,
    [ROAType]               INT             NULL,
    [ProductFeedback]       NVARCHAR (1000) NULL,
    [IsActive]              BIT             NULL,
    [CreatedDate]           DATETIME        NULL,
    [ModifiedDate]          DATETIME        NULL,
    [CreatedBy]             INT             NULL,
    [ModifiedBy]            INT             NULL,
    [ProductSubTypeID]      BIGINT          NULL,
    [IsRecordofTransaction] BIT             NULL,
    [IsVestedInterestType]  BIT             NULL,
    CONSTRAINT [PK_ROANotes] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ROANotes_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_ROANotes_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ROANotes_ModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ROANotes_ProductSubType] FOREIGN KEY ([ProductSubTypeID]) REFERENCES [dbo].[ProductSubType] ([Id]),
    CONSTRAINT [FK_ROANotes_Transaction] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id])
);

