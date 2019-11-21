CREATE TABLE [dbo].[FinanceApplicationFieldMaster] (
    [Id]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [CountryId]   BIGINT         NOT NULL,
    [Section]     NVARCHAR (50)  NOT NULL,
    [FieldName]   NVARCHAR (50)  NOT NULL,
    [UIFieldName] NVARCHAR (500) NOT NULL,
    [MaxLength]   NVARCHAR (MAX) NULL,
    [IsActive]    BIT            NULL,
    CONSTRAINT [PK_FinanceApplicationFieldMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_FinanceApplicationFieldMaster_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id])
);

