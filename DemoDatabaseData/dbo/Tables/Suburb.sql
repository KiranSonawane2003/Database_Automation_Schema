CREATE TABLE [dbo].[Suburb] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [SuburbName]   NVARCHAR (100) NOT NULL,
    [City]         NVARCHAR (100) NOT NULL,
    [PostCode]     NVARCHAR (100) NULL,
    [CountryId]    BIGINT         NULL,
    [IsActive]     BIT            CONSTRAINT [Suburb_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreartedDate] DATETIME       CONSTRAINT [Suburb_DF_CreartedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [CreatedBy]    INT            NOT NULL,
    [ModifiedBy]   INT            NULL,
    CONSTRAINT [Suburb_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [Suburb_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [Suburb_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Suburb_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This Table stores suburb master data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Suburb';

