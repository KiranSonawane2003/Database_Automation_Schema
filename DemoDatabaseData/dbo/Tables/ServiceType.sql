CREATE TABLE [dbo].[ServiceType] (
    [Id]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [ServiceTypeName] NVARCHAR (4000) NOT NULL,
    [CountryId]       BIGINT          NULL,
    [IsActive]        BIT             CONSTRAINT [ServiceType_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]     DATETIME        CONSTRAINT [ServiceType_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]    DATETIME        NULL,
    [CreatedBy]       INT             NOT NULL,
    [ModifiedBy]      INT             NULL,
    CONSTRAINT [ServiceType_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [ServiceType_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [ServiceType_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ServiceType_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores service type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ServiceType';

