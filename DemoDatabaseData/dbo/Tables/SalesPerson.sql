CREATE TABLE [dbo].[SalesPerson] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [GroupId]          BIGINT         NOT NULL,
    [BranchId]         BIGINT         NOT NULL,
    [SalesPersonName]  NVARCHAR (100) NOT NULL,
    [IdTypeId]         BIGINT         NOT NULL,
    [IdNumber]         NVARCHAR (100) NULL,
    [EmployeeNumber]   NVARCHAR (50)  NULL,
    [CountryId]        BIGINT         NULL,
    [DeactivationDate] DATE           NULL,
    [IsActive]         BIT            CONSTRAINT [SalesPerson_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]      DATETIME       CONSTRAINT [SalesPerson_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [CreatedBy]        INT            NOT NULL,
    [ModifiedBy]       INT            NULL,
    [EmailAddress]     NVARCHAR (200) NULL,
    CONSTRAINT [SalesPerson_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [SalesPerson_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [SalesPerson_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [SalesPerson_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [SalesPerson_FK_IdType] FOREIGN KEY ([IdTypeId]) REFERENCES [dbo].[IdType] ([Id]),
    CONSTRAINT [SalesPerson_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [SalesPerson_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table use to store salesperson detail under admin Salesperson Admin', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'SalesPerson';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table Group', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'COLUMN', @level2name = N'GroupId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table Branch', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'COLUMN', @level2name = N'BranchId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table IdType', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'COLUMN', @level2name = N'IdTypeId';

