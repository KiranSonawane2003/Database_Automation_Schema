CREATE TABLE [dbo].[IdType] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [IdTypeName]   NVARCHAR (100) NOT NULL,
    [CountryId]    BIGINT         NULL,
    [IsActive]     BIT            CONSTRAINT [IdType_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]  DATETIME       CONSTRAINT [IdType_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [CreatedBy]    INT            NOT NULL,
    [ModifiedBy]   INT            NULL,
    [SortOrder]    INT            NULL,
    CONSTRAINT [IdType_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [IdType_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [IdType_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [IdType_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This Table Store master for Id type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'IdType';

