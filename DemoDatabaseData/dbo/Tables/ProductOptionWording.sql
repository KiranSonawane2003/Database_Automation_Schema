CREATE TABLE [dbo].[ProductOptionWording] (
    [Id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [ProductOptionId]        BIGINT         NOT NULL,
    [ProdOptWordingFileName] NVARCHAR (100) NULL,
    [ProdOptWordingFilePath] NVARCHAR (100) NOT NULL,
    [CountryId]              BIGINT         NULL,
    [IsActive]               BIT            CONSTRAINT [ProductOptionWording_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]            DATETIME       CONSTRAINT [ProductOptionWording_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]           DATETIME       NULL,
    [CreatedBy]              INT            NOT NULL,
    [ModifiedBy]             INT            NULL,
    CONSTRAINT [ProductOptionWording_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [ProductOptionWording_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [ProductOptionWording_FK_ProductOption] FOREIGN KEY ([ProductOptionId]) REFERENCES [dbo].[ProductOption] ([Id]),
    CONSTRAINT [ProductOptionWording_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ProductOptionWording_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table store option wording insode product option.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ProductOptionWording';

