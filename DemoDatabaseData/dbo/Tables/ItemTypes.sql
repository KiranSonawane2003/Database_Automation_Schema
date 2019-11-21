CREATE TABLE [dbo].[ItemTypes] (
    [Id]           BIGINT          IDENTITY (1, 1) NOT NULL,
    [ItemType]     NVARCHAR (500)  NOT NULL,
    [Notes]        NVARCHAR (4000) NULL,
    [StartDate]    DATE            NOT NULL,
    [EndDate]      DATE            NULL,
    [IsActive]     BIT             DEFAULT ((1)) NOT NULL,
    [CountryId]    BIGINT          NULL,
    [CreatedDate]  DATETIME        DEFAULT (getutcdate()) NULL,
    [ModifiedDate] DATETIME        NULL,
    [CreatedBy]    INT             NULL,
    [ModifiedBy]   INT             NULL,
    CONSTRAINT [ItemTypes_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [ItemTypes_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [ItemTypes_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ItemTypes_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

