CREATE TABLE [dbo].[CompanyMapping] (
    [Id]                      BIGINT         IDENTITY (1, 1) NOT NULL,
    [CompanyCompanyTypeMapId] BIGINT         NOT NULL,
    [ReceivingCompanyId]      BIGINT         NOT NULL,
    [MappedCompanyName]       NVARCHAR (100) NULL,
    [MappedCompanyCode]       NVARCHAR (100) NULL,
    [CountryId]               BIGINT         NULL,
    [IsActive]                BIT            CONSTRAINT [CompanyCompanyMapping_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]             DATETIME       CONSTRAINT [CompanyCompanyMapping_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]            DATETIME       NULL,
    [CreatedBy]               INT            NOT NULL,
    [ModifiedBy]              INT            NULL,
    CONSTRAINT [CompanyMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CompanyMapping_FK_CompanyCompanyTypeMapping] FOREIGN KEY ([CompanyCompanyTypeMapId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [CompanyMapping_FK_CompanyCompanyTypeMappingReceiving] FOREIGN KEY ([ReceivingCompanyId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [CompanyMapping_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [CompanyMapping_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [CompanyMapping_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This Table stores the information from Company Mapping page unde Admin >> Branch Admin >> Edit Branch', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'CompanyMapping';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table Company', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'CompanyMapping', @level2type = N'COLUMN', @level2name = N'ReceivingCompanyId';

