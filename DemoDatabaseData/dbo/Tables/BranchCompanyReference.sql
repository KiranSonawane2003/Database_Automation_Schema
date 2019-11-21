CREATE TABLE [dbo].[BranchCompanyReference] (
    [Id]                      BIGINT         IDENTITY (1, 1) NOT NULL,
    [BranchId]                BIGINT         NOT NULL,
    [CompanyCompanyTYpeMapId] BIGINT         NOT NULL,
    [ReferenceTypeId]         BIGINT         NOT NULL,
    [ReferenceNo]             NVARCHAR (100) NULL,
    [CountryId]               BIGINT         NULL,
    [IsActive]                BIT            CONSTRAINT [BranchReference_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]             DATETIME       CONSTRAINT [BranchReference_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]            DATETIME       NULL,
    [CreatedBy]               INT            NOT NULL,
    [ModifiedBy]              INT            NULL,
    CONSTRAINT [BranchReference_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [BranchComapnyReference_FK_CompanyCompanyTypeMapping] FOREIGN KEY ([CompanyCompanyTYpeMapId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [BranchComapnyReference_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [BranchComapnyReference_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [BranchComapnyReference_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [BranchReference_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [BranchReference_FK_ReferenceType] FOREIGN KEY ([ReferenceTypeId]) REFERENCES [dbo].[ReferenceType] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores the information from branch refernce page under Admin >> Branch Admin >> Edit Branch', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BranchCompanyReference';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table Branch', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BranchCompanyReference', @level2type = N'COLUMN', @level2name = N'BranchId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table ReferenceType', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BranchCompanyReference', @level2type = N'COLUMN', @level2name = N'ReferenceTypeId';

