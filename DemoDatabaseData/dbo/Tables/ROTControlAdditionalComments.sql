CREATE TABLE [dbo].[ROTControlAdditionalComments] (
    [Id]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [TemplateLineId]     BIGINT         NULL,
    [ControlTypeId]      BIGINT         NULL,
    [CountryId]          BIGINT         NULL,
    [AdditionalComments] NVARCHAR (MAX) NULL,
    [IsActive]           BIT            NULL,
    [CreatedDate]        DATETIME       NULL,
    [ModifiedDate]       DATETIME       NULL,
    [CreatedBy]          INT            NULL,
    [ModifiedBy]         INT            NULL,
    [TransactionId]      BIGINT         NULL,
    CONSTRAINT [PK_ROTControlAdditionalComments] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ROTControlAdditionalComments_ControlType] FOREIGN KEY ([ControlTypeId]) REFERENCES [dbo].[ROTControlType] ([Id]),
    CONSTRAINT [FK_ROTControlAdditionalComments_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_ROTControlAdditionalComments_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ROTControlAdditionalComments_ModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ROTControlAdditionalComments_TemplateLine] FOREIGN KEY ([TemplateLineId]) REFERENCES [dbo].[ROTTemplateLine] ([Id]),
    CONSTRAINT [FK_ROTControlAdditionalComments_TransactionID] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id])
);

