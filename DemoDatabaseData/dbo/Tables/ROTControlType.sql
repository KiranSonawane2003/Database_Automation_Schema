CREATE TABLE [dbo].[ROTControlType] (
    [Id]                BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]              NVARCHAR (500) NULL,
    [CountryId]         BIGINT         NOT NULL,
    [IsSignaturePerson] BIT            NULL,
    [IsActive]          BIT            NULL,
    [CreatedDate]       DATETIME       NULL,
    [ModifiedDate]      DATETIME       NULL,
    [CreatedBy]         INT            NULL,
    [ModifiedBy]        INT            NULL,
    [IsInputRequired]   BIT            NULL,
    [EnumName]          NVARCHAR (500) NULL,
    CONSTRAINT [PK_ROTControlType] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ROTControlType_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_ROTControlType_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ROTControlType_ModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

