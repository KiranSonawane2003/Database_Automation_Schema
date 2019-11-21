CREATE TABLE [dbo].[GroupProductOption] (
    [Id]           BIGINT          IDENTITY (1, 1) NOT NULL,
    [GroupId]      BIGINT          NOT NULL,
    [ProductId]    BIGINT          NOT NULL,
    [OptionId]     BIGINT          NOT NULL,
    [DefaultPrice] DECIMAL (18, 2) NULL,
    [StartDate]    DATE            NOT NULL,
    [EndDate]      DATE            NOT NULL,
    [CountryId]    BIGINT          NULL,
    [IsActive]     BIT             CONSTRAINT [GroupProductOption_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]  DATETIME        CONSTRAINT [GroupProductOption_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate] DATETIME        NOT NULL,
    [CreatedBy]    INT             NULL,
    [ModifiedBy]   INT             NULL,
    CONSTRAINT [GroupProductOption_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [GroupProductOption_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [GroupProductOption_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [GroupProductOption_FK_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id]),
    CONSTRAINT [GroupProductOption_FK_ProductOption] FOREIGN KEY ([OptionId]) REFERENCES [dbo].[ProductOption] ([Id]),
    CONSTRAINT [GroupProductOption_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupProductOption_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores the product option assigned to group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'GroupProductOption';

